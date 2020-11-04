/*
 * Copyright 2019 THOMAS NAUGHTON
 * 
 * Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), 
 * to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, 
 * and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
 * 
 * The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
 * 
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, 
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, 
 * WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
 */

/*
 * CBR015-0004_GPS_CAN_MODULE_ASSY_CODE
 * Version 1.0  02-07-2019      Original code version for Microsquirt based logger config
 * Version 2.0  04-06-2020      Updated code to work with PlatformIO. CAN message IDs & data adjusted to suit F88R GPS data input
 * 
 * This code is designed for use with the CBR015-0004 GPS CAN MODULE ASSY utilising CBR015-0005 Rev00 PCB layout
 * CAN Config:  200507_LOGGER_CAN_CONFIG_v2.0.xlsx
 * Messages are sent with MSB First or Big Endian byte order
 * 
 * This code assumes that the GPS breakout board has been preconfigured to the below settings and these settings written to flash memory
 * Baud Rate: 115200
 * Message Type: NMEA
 * Update Rate: 20Hz
 * 
 * See documentation for further details & overview
 * 
 * Comment all serial debug messages from final code. Not useful unless connected to PC 
 */

#include <Arduino.h>

// GPS libraries. All part of NeoGPS library
#include <NMEAGPS.h>
#include <GPSport.h>
#include <Streamers.h>

// IMU libraries
#include <Wire.h>
#include <SPI.h>
#include <Adafruit_Sensor.h>
#include <Adafruit_BNO055.h>  // Adafruit BNO055 library
#include <utility/imumaths.h> // Adafruit BNO055 library

// CAN-Bus Libraries
#include <FlexCAN.h>

//===============================================================================================
// User Config variables
// Define variables most likely to be changed by user
#define baseMsgID 0x680   // CAN message ID
#define can_speed 500000  // CAN-Bus baud rate in bps
#define genMsgLen 8      // CAN message size in bytes
#define msg2Len 8
#define msg6Len 8    

//===============================================================================================
// Declare GPS Variables
static NMEAGPS gps; // This object parses received characters into the gps.fix() data structure
static gps_fix fix;
int32_t gpsLongitude, gpsLatitude;
uint32_t gpsSpeed;
int16_t gpsAltitude, gpsHeading;
uint8_t gpsDay, gpsMonth, gpsYear, gpsHour, gpsMinute, gpsSecond, gpsSatellites;
uint16_t gpsThouSecond, gpsHdop, previousTime;
uint8_t gpsStatus;

// Declare IMU Variables
Adafruit_BNO055 bno = Adafruit_BNO055(55);
float EulerX, EulerY, EulerZ, GyroX, GyroY, GyroZ, AccelX, AccelY, AccelZ;
int8_t imuTemp;

// Declare CAN Variables
static CAN_message_t txmsg1, txmsg2, txmsg3, txmsg4, txmsg5, txmsg6;


//===============================================================================================
void GetIMUData()
{
  // Get vector data
  imu::Vector<3> euler = bno.getVector(Adafruit_BNO055::VECTOR_EULER);         // degrees 0-359.9. Loop time 0.9-1.8ms
  imu::Vector<3> gyro = bno.getVector(Adafruit_BNO055::VECTOR_GYROSCOPE);      // rad/s. Loop time 0.9-1.8ms
  imu::Vector<3> accel = bno.getVector(Adafruit_BNO055::VECTOR_ACCELEROMETER); // m/s^2. Loop time 0.9-1.8ms
  imuTemp = bno.getTemp(); // IMU sensor temperature in degC

  // Separate out vector data
  EulerX = euler.x();
  EulerY = euler.y();
  EulerZ = euler.z();
  GyroX = gyro.x();
  GyroY = gyro.y();
  GyroZ = gyro.z();
  AccelX = accel.x();
  AccelY = accel.y();
  AccelZ = accel.z();
  // time to pass variables, 3-4us
}

//===============================================================================================
void CAN_Send()
{
  // First scale any floats and convert to integers before sending
  gpsLongitude = ( ( gpsLongitude / 1000 ) * 60 ); // F88R expects long/lat in arcminutes rather than degrees. The division by 1000 is also required to read correctly in F88R
  gpsLatitude = ( ( gpsLatitude / 1000 ) * 60 );
  uint16_t gpsSpeedInt = ( gpsSpeed / 36 ); // convert to m/s * 100
  int16_t gpsAltitudeInt = ( gpsAltitude * 0.01 ); // convert to m for F88R
  uint16_t gpsHdopInt = gpsHdop * 0.01; // F88R only divides by 10 on reciept
  //uint16_t EulerXInt = EulerX * 100; // yaw
  //int16_t EulerYInt = EulerY * 100;  // pitch
  //int16_t EulerZInt = EulerZ * 100;  // roll
  int16_t GyroXInt = GyroX * ( 1800 / PI ); // convert from rad/s to deg/s * 10
  int16_t GyroYInt = GyroY * ( 1800 / PI ); 
  int16_t GyroZInt = GyroY * ( 1800 / PI );
  int16_t AccelXInt = ( AccelX / 9.81) * 1000; // convert from m/s2 to G * 1000
  int16_t AccelYInt = ( AccelY / 9.81) * 1000;
  int16_t AccelZInt = ( AccelZ / 9.81) * 1000;
  int16_t imuTempInt = imuTemp * 10; // F88R divides by 10
  // time to scale variables, 8-9us

  // Assemble data bytes
  // ID 0x680
  txmsg1.buf[3] = byte(gpsLatitude & 0x000000ffUL);
  txmsg1.buf[2] = byte((gpsLatitude & 0x0000ff00UL) >> 8);
  txmsg1.buf[1] = byte((gpsLatitude & 0x00ff0000UL) >> 16);
  txmsg1.buf[0] = byte((gpsLatitude & 0xff000000UL) >> 24);
  txmsg1.buf[7] = byte(gpsLongitude & 0x000000ffUL);
  txmsg1.buf[6] = byte((gpsLongitude & 0x0000ff00UL) >> 8);
  txmsg1.buf[5] = byte((gpsLongitude & 0x00ff0000UL) >> 16);
  txmsg1.buf[4] = byte((gpsLongitude & 0xff000000UL) >> 24);
  // time to build message, 1us

  // ID 0x681
  txmsg2.buf[1] = byte(gpsHeading & 0x00ffUL);
  txmsg2.buf[0] = byte((gpsHeading & 0xff00UL) >> 8);
  txmsg2.buf[3] = byte(gpsSpeedInt & 0x00ffUL);
  txmsg2.buf[2] = byte((gpsSpeedInt & 0xff00UL) >> 8);
  txmsg2.buf[5] = byte(gpsAltitudeInt & 0x00ffUL);
  txmsg2.buf[4] = byte((gpsAltitudeInt & 0xff00UL) >> 8);

  // ID 0x682
  txmsg3.buf[0] = byte(gpsDay);
  txmsg3.buf[1] = byte(gpsMonth);
  txmsg3.buf[2] = byte(gpsYear);
  txmsg3.buf[3] = byte(gpsHour);
  txmsg3.buf[4] = byte(gpsMinute);
  txmsg3.buf[5] = byte(gpsSecond);
  txmsg3.buf[7] = byte(gpsThouSecond & 0x00ffUL);
  txmsg3.buf[6] = byte((gpsThouSecond & 0xff00UL) >> 8);

  // ID 0x683
  txmsg4.buf[1] = byte(AccelYInt & 0x00ffUL);
  txmsg4.buf[0] = byte((AccelYInt & 0xff00UL) >> 8);
  txmsg4.buf[3] = byte(AccelXInt & 0x00ffUL);
  txmsg4.buf[2] = byte((AccelXInt & 0xff00UL) >> 8);
  txmsg4.buf[5] = byte(AccelZInt & 0x00ffUL);
  txmsg4.buf[4] = byte((AccelZInt & 0xff00UL) >> 8);
  txmsg4.buf[7] = byte(imuTempInt & 0x00ffUL);
  txmsg4.buf[6] = byte((imuTempInt & 0xff00UL) >> 8);
  // time to build all messages, 2-3us

  // ID 0x684
  txmsg5.buf[1] = byte(GyroXInt & 0x00ffUL);
  txmsg5.buf[0] = byte((GyroXInt & 0xff00UL) >> 8);
  txmsg5.buf[3] = byte(GyroYInt & 0x00ffUL);
  txmsg5.buf[2] = byte((GyroYInt & 0xff00UL) >> 8);
  txmsg5.buf[5] = byte(GyroZInt & 0x00ffUL);
  txmsg5.buf[4] = byte((GyroZInt & 0xff00UL) >> 8);
  txmsg5.buf[7] = byte(imuTempInt & 0x00ffUL);
  txmsg5.buf[6] = byte((imuTempInt & 0xff00UL) >> 8);

  // ID 0x685
  txmsg6.buf[1] = byte(gpsHdopInt & 0x00ffUL);
  txmsg6.buf[0] = byte((gpsHdopInt & 0xff00UL) >> 8);
  //txmsg6.buf[2] = byte(gpsQuality); // placeholder NeoGPS does not have a fix quality indicator
  txmsg6.buf[3] = byte(gpsSatellites);
  txmsg6.buf[4] = byte(gpsStatus);
  txmsg6.buf[5] = byte(gpsStatus);

  // Send data
  Can0.write(txmsg1);
  Can0.write(txmsg2);
  Can0.write(txmsg3);
  Can0.write(txmsg4);
  Can0.write(txmsg5);
  Can0.write(txmsg6);
  // time to send 1 message, 1-2us. All messages 4-5us
}

/*
//===============================================================================================
void WriteSerial()
{
   
  // GPS
  Serial.print("Longitude: ");
  Serial.println(float(gpsLongitude/10000000.0), 7);
  Serial.print("Latitude: ");
  Serial.println(float(gpsLatitude/10000000.0), 7);
  Serial.print("Altitude: ");
  Serial.println(float(gpsAltitude/100.0), 2);
  Serial.print("Speed: ");
  Serial.println(gpsSpeed);
  Serial.print("Heading: ");
  Serial.println(float(gpsHeading/100.0), 2);

  
  // IMU
  //Serial.print("EulerX: ");
  //Serial.println(EulerX);
  //Serial.print("EulerY: ");
  //Serial.println(EulerY);
  //Serial.print("EulerZ: ");
  //Serial.println(EulerZ);
  //Serial.print("GyroX: ");
  //Serial.println(GyroX);
  //Serial.print("GyroY: ");
  //Serial.println(GyroY);
  //Serial.print("GyroZ: ");
  //Serial.println(GyroZ);
  //Serial.print("AccelX: ");
  //Serial.println(AccelX);
  //Serial.print("AccelY: ");
  //Serial.println(AccelY);
  //Serial.print("AccelZ: ");
  //Serial.println(AccelZ);
  
}
*/
/*
//===============================================================================================
static void Debug()
{
  // GPS
  while (!DEBUG_PORT);

  DEBUG_PORT.print( F("NMEA.INO: started\n") );
  DEBUG_PORT.print( F("  fix object size = ") );
  DEBUG_PORT.println( sizeof(gps.fix()) );
  DEBUG_PORT.print( F("  gps object size = ") );
  DEBUG_PORT.println( sizeof(gps) );
  DEBUG_PORT.println( F("Looking for GPS device on " GPS_PORT_NAME) );

  //#ifndef NMEAGPS_RECOGNIZE_ALL
  //  #error You must define NMEAGPS_RECOGNIZE_ALL in NMEAGPS_cfg.h!
  //#endif

  #ifdef NMEAGPS_INTERRUPT_PROCESSING
    #error You must *NOT* define NMEAGPS_INTERRUPT_PROCESSING in NMEAGPS_cfg.h!
  #endif

  #if !defined( NMEAGPS_PARSE_GGA ) & !defined( NMEAGPS_PARSE_GLL ) & \
      !defined( NMEAGPS_PARSE_GSA ) & !defined( NMEAGPS_PARSE_GSV ) & \
      !defined( NMEAGPS_PARSE_RMC ) & !defined( NMEAGPS_PARSE_VTG ) & \
      !defined( NMEAGPS_PARSE_ZDA ) & !defined( NMEAGPS_PARSE_GST )

    DEBUG_PORT.println( F("\nWARNING: No NMEA sentences are enabled: no fix data will be displayed.") );

  #else
    if (gps.merging == NMEAGPS::NO_MERGING) {
      DEBUG_PORT.print  ( F("\nWARNING: displaying data from ") );
      DEBUG_PORT.print  ( gps.string_for( LAST_SENTENCE_IN_INTERVAL ) );
      DEBUG_PORT.print  ( F(" sentences ONLY, and only if ") );
      DEBUG_PORT.print  ( gps.string_for( LAST_SENTENCE_IN_INTERVAL ) );
      DEBUG_PORT.println( F(" is enabled.\n"
                            "  Other sentences may be parsed, but their data will not be displayed.") );
    }
  #endif

  DEBUG_PORT.print  ( F("\nGPS quiet time is assumed to begin after a ") );
  DEBUG_PORT.print  ( gps.string_for( LAST_SENTENCE_IN_INTERVAL ) );
  DEBUG_PORT.println( F(" sentence is received.\n"
                        "  You should confirm this with NMEAorder.ino\n") );

  trace_header( DEBUG_PORT );
  DEBUG_PORT.flush();

  // IMU
  if (!bno.begin())
  {
    // There was a problem detecting the BNO055 ... check your connections
    Serial.print("Ooops, no BNO055 detected ... Check your wiring or I2C ADDR!");
    while (1);
  }
}
//*/

//===============================================================================================
//  This is the main GPS parsing loop.
void GPSloop()
{
  while (gps.available(gpsPort))
  {
    Serial.println("GPS data found");
    fix = gps.read();                 // execution time 3-4us
    gpsLongitude = fix.longitudeL();  // integer degrees scaled by 10,000,000
    gpsLatitude = fix.latitudeL();    // integer degrees scaled by 10,000,000
    gpsAltitude = fix.altitude_cm();  // integer cm
    //gpsSpeed = fix.speed_kph();       // floating point kph
    gpsSpeed = fix.speed_metersph();  // uint32 m/h
    gpsHeading = fix.heading_cd();    // integer hundredths of a degree
    gpsSatellites = fix.satellites;   // number of satellites
    gpsStatus = fix.status;
    gpsDay = fix.dateTime.day;
    gpsMonth = fix.dateTime.month;
    gpsYear = fix.dateTime.year;
    gpsHour = fix.dateTime.hours;
    gpsMinute = fix.dateTime.minutes;
    gpsSecond = fix.dateTime.seconds;
    gpsThouSecond = fix.dateTime_ms();
    gpsHdop = fix.hdop; // Horizontal Dilution of Precision x 1000
    // time to pass variables, 3-4us

    // Call any other function after GPS data recieved
    GetIMUData(); // as IMU data can be polled at any time, get the data at the same rate as GPS data is recieved. Loop time average c.4ms?? 2.75ms min
    CAN_Send();   // Loop time 13-14us
    //WriteSerial(); // Use this function to write debug data to serial if possible
  }
  
} // GPSloop


//===============================================================================================
void setup()
{
  // Setup GPS
  //DEBUG_PORT.begin(115200); // opens standard serial port for PC comms. Disable in final code
  //Serial.begin(115200);

  gpsPort.begin(115200);

  // Setup IMU
  bno.begin();

  // Setup CAN
  Can0.begin(can_speed);

  // Define CAN IDs here
  txmsg1.id = baseMsgID;
  txmsg2.id = (baseMsgID + 1);
  txmsg3.id = (baseMsgID + 2);
  txmsg4.id = (baseMsgID + 3);
  txmsg5.id = (baseMsgID + 4);
  txmsg6.id = (baseMsgID + 5);
  
  txmsg1.len = genMsgLen;
  txmsg2.len = msg2Len;
  txmsg3.len = genMsgLen;
  txmsg4.len = genMsgLen;
  txmsg5.len = genMsgLen;
  txmsg6.len = msg6Len;

  //Debug(); // all debug messages moved to a separate function for cleanliness

  delay(500); // delay before entering loop to give GPS a chance to get a fix
}

//===============================================================================================
void loop()
{

  // check if GPS messages are available on each loop. Simply using a timer does not work
  GPSloop(); // Loop time 4ms average, 6ms max when GPS available. 1-2us if not available
}
