EESchema Schematic File Version 4
LIBS:power
LIBS:device
LIBS:transistors
LIBS:conn
LIBS:linear
LIBS:regul
LIBS:74xx
LIBS:cmos4000
LIBS:adc-dac
LIBS:memory
LIBS:xilinx
LIBS:microcontrollers
LIBS:dsp
LIBS:microchip
LIBS:analog_switches
LIBS:motorola
LIBS:texas
LIBS:intel
LIBS:audio
LIBS:interface
LIBS:digital-audio
LIBS:philips
LIBS:display
LIBS:cypress
LIBS:siliconi
LIBS:opto
LIBS:atmel
LIBS:contrib
LIBS:valves
LIBS:CBR015-0005_GPS_CAN_MODULE_PCB-cache
EELAYER 26 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title "GPS CAN MODULE PCB"
Date "31-05-19"
Rev "00"
Comp ""
Comment1 ""
Comment2 ""
Comment3 "T Naughton"
Comment4 "CBR015-0005"
$EndDescr
Wire Wire Line
	2050 6700 2050 6750
Wire Wire Line
	1450 6500 1550 6500
Wire Wire Line
	1050 6500 1150 6500
Wire Wire Line
	1450 5700 1650 5700
Wire Wire Line
	2050 5650 2050 5700
Wire Wire Line
	1950 5700 2050 5700
Connection ~ 2050 5700
Text GLabel 1400 6050 0    60   Input ~ 0
TX_CAN
Text GLabel 1400 6250 0    60   Input ~ 0
RX_CAN
Wire Wire Line
	1400 6250 1500 6250
Wire Wire Line
	1500 6250 1500 6200
Wire Wire Line
	1500 6200 1550 6200
Wire Wire Line
	1400 6050 1500 6050
Wire Wire Line
	1500 6050 1500 6100
Wire Wire Line
	1500 6100 1550 6100
Text GLabel 2850 5900 1    60   Input ~ 0
CANH
Text GLabel 3600 6550 2    60   Input ~ 0
CANL
Wire Wire Line
	2550 6200 2850 6200
Wire Wire Line
	2850 5900 2850 6200
Connection ~ 2850 6200
Wire Wire Line
	3450 6150 3450 6250
Wire Wire Line
	3000 6550 3000 6400
Wire Wire Line
	3000 6400 2550 6400
Text Notes 1700 7100 0    60   ~ 0
CAN TRANSCEIVER
Text Notes 2050 3550 0    60   ~ 0
TEENSY 3.2 CONTROLLER
Text Notes 8850 3400 0    60   ~ 0
GPS RECEIVER
Text GLabel 1550 2200 0    60   Input ~ 0
TX_CAN
Text GLabel 1550 2350 0    60   Input ~ 0
RX_CAN
Wire Wire Line
	1550 2200 2000 2200
Wire Wire Line
	1550 2350 1600 2350
Wire Wire Line
	1600 2350 1600 2300
Wire Wire Line
	1600 2300 2000 2300
Wire Wire Line
	6150 1100 6250 1100
Wire Wire Line
	6300 1100 6300 1050
Wire Wire Line
	5200 1100 5300 1100
Wire Wire Line
	5300 1150 5300 1100
Connection ~ 5300 1100
Wire Wire Line
	5300 1450 5300 1550
Wire Wire Line
	5300 1550 5750 1550
Text Notes 5000 2000 0    60   ~ 0
BOARD POWER VOLTAGE REGULATOR
Wire Wire Line
	1700 1750 1850 1750
Wire Wire Line
	1850 1750 1850 1800
Wire Wire Line
	1850 1800 2000 1800
Wire Wire Line
	9200 1600 9200 1550
Wire Wire Line
	9200 1550 9150 1550
Wire Wire Line
	9150 1550 9150 1350
Wire Wire Line
	9150 1350 9250 1350
Wire Wire Line
	8450 2200 8400 2200
Wire Wire Line
	8400 2200 8400 2150
Wire Wire Line
	8400 2150 8300 2150
Wire Wire Line
	5200 1050 5200 1100
NoConn ~ 9850 2100
NoConn ~ 9850 2200
NoConn ~ 9850 2300
NoConn ~ 9850 2400
NoConn ~ 9850 2600
NoConn ~ 9850 2700
Text GLabel 9950 2500 2    60   Input ~ 0
GPS_P1PPS
Wire Wire Line
	9850 2500 9950 2500
Text GLabel 9350 1250 1    60   Input ~ 0
GPS_RST
Text GLabel 9150 1250 1    60   Input ~ 0
GPS_RXD0
Text GLabel 9000 1250 1    60   Input ~ 0
GPS_TXD0
Wire Wire Line
	9350 1250 9350 1550
Wire Wire Line
	9350 1550 9300 1550
Wire Wire Line
	9300 1550 9300 1600
Wire Wire Line
	9150 1250 9150 1300
Wire Wire Line
	9150 1300 9100 1300
Wire Wire Line
	9100 1300 9100 1600
Text GLabel 8200 2750 0    60   Input ~ 0
VBAT
NoConn ~ 8450 2300
NoConn ~ 8450 2400
Text GLabel 1550 2050 0    60   Input ~ 0
GPS_P1PPS
Wire Wire Line
	1550 2050 1600 2050
Wire Wire Line
	1600 2050 1600 2100
Wire Wire Line
	1600 2100 2000 2100
Text GLabel 1550 2500 0    60   Input ~ 0
GPS_RST
Wire Wire Line
	2000 2400 1650 2400
Wire Wire Line
	1650 2400 1650 2500
Wire Wire Line
	1650 2500 1550 2500
Text GLabel 1550 2900 0    60   Input ~ 0
GPS_RXD0
Text GLabel 1550 2750 0    60   Input ~ 0
GPS_TXD0
Wire Wire Line
	1550 2900 2000 2900
Wire Wire Line
	1550 2750 1600 2750
Wire Wire Line
	1600 2750 1600 2800
Wire Wire Line
	1600 2800 2000 2800
Text GLabel 3450 2400 2    60   Input ~ 0
SCL
Text GLabel 3450 2250 2    60   Input ~ 0
SDA
NoConn ~ 2000 1900
NoConn ~ 2000 2000
NoConn ~ 2000 2500
NoConn ~ 2000 2600
NoConn ~ 2000 2700
NoConn ~ 1550 6400
Text GLabel 2950 6200 2    60   Input ~ 0
TERMH
Text GLabel 3450 6150 1    60   Input ~ 0
TERML
Wire Wire Line
	8800 1500 8800 1550
Wire Wire Line
	8800 1550 8900 1550
Wire Wire Line
	8900 1550 8900 1600
Wire Wire Line
	9000 1250 9000 1600
Wire Wire Line
	8200 2750 8300 2750
Wire Wire Line
	8300 2750 8300 2700
Wire Wire Line
	8300 2700 8450 2700
Text GLabel 4600 6600 0    60   Input ~ 0
VBAT
Text Notes 5050 7000 0    60   ~ 0
3V CELL BATTERY
NoConn ~ 8450 2100
NoConn ~ 2000 3100
NoConn ~ 2000 3000
Wire Wire Line
	2050 5700 2050 5900
Wire Wire Line
	2850 6200 2950 6200
Wire Wire Line
	5300 1100 5350 1100
Wire Wire Line
	5750 1550 5750 1600
$Comp
L Interface_CAN_LIN:MCP2551-I-SN U3
U 1 1 5C1BC95A
P 2050 6300
F 0 "U3" H 2150 6750 50  0000 C CNN
F 1 "MCP2551-I-SN" H 2400 6650 50  0000 C CNN
F 2 "Housings_SOIC:SOIC-8_3.9x4.9mm_Pitch1.27mm" H 2050 5800 50  0001 C CIN
F 3 "http://ww1.microchip.com/downloads/en/devicedoc/21667d.pdf" H 2050 6300 50  0001 C CNN
	1    2050 6300
	1    0    0    -1  
$EndComp
$Comp
L Device:R R2
U 1 1 5C1BCC2C
P 3450 6400
F 0 "R2" V 3350 6350 50  0000 L CNN
F 1 "120" V 3450 6300 50  0000 L CNN
F 2 "Resistors_SMD:R_0805_HandSoldering" V 3380 6400 50  0001 C CNN
F 3 "~" H 3450 6400 50  0001 C CNN
	1    3450 6400
	1    0    0    -1  
$EndComp
Wire Wire Line
	3000 6550 3450 6550
Connection ~ 3450 6550
Wire Wire Line
	3450 6550 3600 6550
$Comp
L Device:R R1
U 1 1 5C1BCE3B
P 1300 6500
F 0 "R1" V 1400 6500 50  0000 C CNN
F 1 "18K" V 1300 6500 50  0000 C CNN
F 2 "Resistors_SMD:R_0805_HandSoldering" V 1230 6500 50  0001 C CNN
F 3 "~" H 1300 6500 50  0001 C CNN
	1    1300 6500
	0    -1   -1   0   
$EndComp
$Comp
L power:GND #PWR0101
U 1 1 5C1BCF30
P 2050 6750
F 0 "#PWR0101" H 2050 6500 50  0001 C CNN
F 1 "GND" H 2055 6577 50  0000 C CNN
F 2 "" H 2050 6750 50  0001 C CNN
F 3 "" H 2050 6750 50  0001 C CNN
	1    2050 6750
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0102
U 1 1 5C1BCFD2
P 1050 6500
F 0 "#PWR0102" H 1050 6250 50  0001 C CNN
F 1 "GND" H 1055 6327 50  0000 C CNN
F 2 "" H 1050 6500 50  0001 C CNN
F 3 "" H 1050 6500 50  0001 C CNN
	1    1050 6500
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR0103
U 1 1 5C1BD09F
P 2050 5650
F 0 "#PWR0103" H 2050 5500 50  0001 C CNN
F 1 "+5V" H 2065 5823 50  0000 C CNN
F 2 "" H 2050 5650 50  0001 C CNN
F 3 "" H 2050 5650 50  0001 C CNN
	1    2050 5650
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0104
U 1 1 5C1BD0D9
P 1450 5700
F 0 "#PWR0104" H 1450 5450 50  0001 C CNN
F 1 "GND" H 1455 5527 50  0000 C CNN
F 2 "" H 1450 5700 50  0001 C CNN
F 3 "" H 1450 5700 50  0001 C CNN
	1    1450 5700
	1    0    0    -1  
$EndComp
$Comp
L Device:C C2
U 1 1 5C1BD115
P 1800 5700
F 0 "C2" V 1548 5700 50  0000 C CNN
F 1 "100nF" V 1639 5700 50  0000 C CNN
F 2 "Capacitors_SMD:C_0805_HandSoldering" H 1838 5550 50  0001 C CNN
F 3 "~" H 1800 5700 50  0001 C CNN
	1    1800 5700
	0    1    1    0   
$EndComp
$Comp
L power:GND #PWR0105
U 1 1 5C1BDBA2
P 6150 6650
F 0 "#PWR0105" H 6150 6400 50  0001 C CNN
F 1 "GND" H 6155 6477 50  0000 C CNN
F 2 "" H 6150 6650 50  0001 C CNN
F 3 "" H 6150 6650 50  0001 C CNN
	1    6150 6650
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0106
U 1 1 5C1C31F4
P 8300 2150
F 0 "#PWR0106" H 8300 1900 50  0001 C CNN
F 1 "GND" H 8305 1977 50  0000 C CNN
F 2 "" H 8300 2150 50  0001 C CNN
F 3 "" H 8300 2150 50  0001 C CNN
	1    8300 2150
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0107
U 1 1 5C1C380C
P 9550 1350
F 0 "#PWR0107" H 9550 1100 50  0001 C CNN
F 1 "GND" H 9555 1177 50  0000 C CNN
F 2 "" H 9550 1350 50  0001 C CNN
F 3 "" H 9550 1350 50  0001 C CNN
	1    9550 1350
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0108
U 1 1 5C1C3864
P 9250 1350
F 0 "#PWR0108" H 9250 1100 50  0001 C CNN
F 1 "GND" H 9255 1177 50  0000 C CNN
F 2 "" H 9250 1350 50  0001 C CNN
F 3 "" H 9250 1350 50  0001 C CNN
	1    9250 1350
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0109
U 1 1 5C1C3C94
P 5750 1600
F 0 "#PWR0109" H 5750 1350 50  0001 C CNN
F 1 "GND" H 5755 1427 50  0000 C CNN
F 2 "" H 5750 1600 50  0001 C CNN
F 3 "" H 5750 1600 50  0001 C CNN
	1    5750 1600
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR0110
U 1 1 5C1C3E4A
P 6300 1050
F 0 "#PWR0110" H 6300 900 50  0001 C CNN
F 1 "+5V" H 6315 1223 50  0000 C CNN
F 2 "" H 6300 1050 50  0001 C CNN
F 3 "" H 6300 1050 50  0001 C CNN
	1    6300 1050
	1    0    0    -1  
$EndComp
$Comp
L power:+12V #PWR0111
U 1 1 5C1C3F8A
P 5200 1050
F 0 "#PWR0111" H 5200 900 50  0001 C CNN
F 1 "+12V" H 5215 1223 50  0000 C CNN
F 2 "" H 5200 1050 50  0001 C CNN
F 3 "" H 5200 1050 50  0001 C CNN
	1    5200 1050
	1    0    0    -1  
$EndComp
$Comp
L Device:C C1
U 1 1 5C1C3FCB
P 5300 1300
F 0 "C1" H 5100 1350 50  0000 L CNN
F 1 "22µF" H 5000 1250 50  0000 L CNN
F 2 "Capacitors_SMD:C_0805_HandSoldering" H 5338 1150 50  0001 C CNN
F 3 "~" H 5300 1300 50  0001 C CNN
	1    5300 1300
	1    0    0    -1  
$EndComp
$Comp
L Regulator_Switching:TSR_1-2450 U2
U 1 1 5C1C415A
P 5750 1200
F 0 "U2" H 5750 1567 50  0000 C CNN
F 1 "TSR_1-2450" H 5750 1476 50  0000 C CNN
F 2 "Converters_DCDC_ACDC:DCDC-Conv_TRACO_TSR-1" H 5750 1050 50  0001 L CIN
F 3 "http://www.tracopower.com/products/tsr1.pdf" H 5750 1200 50  0001 C CNN
	1    5750 1200
	1    0    0    -1  
$EndComp
Wire Wire Line
	5750 1400 5750 1550
Connection ~ 5750 1550
$Comp
L power:GND #PWR0112
U 1 1 5C1C9757
P 1700 1750
F 0 "#PWR0112" H 1700 1500 50  0001 C CNN
F 1 "GND" H 1705 1577 50  0000 C CNN
F 2 "" H 1700 1750 50  0001 C CNN
F 3 "" H 1700 1750 50  0001 C CNN
	1    1700 1750
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR0113
U 1 1 5C1C981D
P 3350 3300
F 0 "#PWR0113" H 3350 3150 50  0001 C CNN
F 1 "+5V" H 3365 3473 50  0000 C CNN
F 2 "" H 3350 3300 50  0001 C CNN
F 3 "" H 3350 3300 50  0001 C CNN
	1    3350 3300
	1    0    0    -1  
$EndComp
Wire Wire Line
	9550 1350 9400 1350
Wire Wire Line
	9400 1350 9400 1600
$Comp
L power:+3V3 #PWR0116
U 1 1 5C1E450F
P 3450 2900
F 0 "#PWR0116" H 3450 2750 50  0001 C CNN
F 1 "+3V3" H 3465 3073 50  0000 C CNN
F 2 "" H 3450 2900 50  0001 C CNN
F 3 "" H 3450 2900 50  0001 C CNN
	1    3450 2900
	1    0    0    -1  
$EndComp
$Comp
L power:+3V3 #PWR0117
U 1 1 5C1E458D
P 8800 1500
F 0 "#PWR0117" H 8800 1350 50  0001 C CNN
F 1 "+3V3" H 8815 1673 50  0000 C CNN
F 2 "" H 8800 1500 50  0001 C CNN
F 3 "" H 8800 1500 50  0001 C CNN
	1    8800 1500
	1    0    0    -1  
$EndComp
$Comp
L User_Library:TEENSY_3.2_BASIC U1
U 1 1 5C1E4BDE
P 2550 2450
F 0 "U1" H 2550 3387 60  0000 C CNN
F 1 "TEENSY_3.2_BASIC" H 2550 3281 60  0000 C CNN
F 2 "User Libraries:TEENSY_3.2_BASIC" H 2550 2250 60  0001 C CNN
F 3 "" H 2550 2250 60  0001 C CNN
	1    2550 2450
	1    0    0    -1  
$EndComp
Wire Wire Line
	3100 3100 3200 3100
Wire Wire Line
	3200 3100 3200 3300
Wire Wire Line
	3200 3300 3350 3300
Wire Wire Line
	3100 2900 3450 2900
Wire Wire Line
	3100 2400 3450 2400
Wire Wire Line
	3100 2300 3300 2300
Wire Wire Line
	3300 2300 3300 2250
Wire Wire Line
	3300 2250 3450 2250
$Comp
L User_Library:VENUS838FLPx_BREAKOUT U4
U 1 1 5C1F997B
P 9150 2400
F 0 "U4" H 9150 1720 60  0000 C CNN
F 1 "VENUS838FLPx_BREAKOUT" H 9150 1614 60  0000 C CNN
F 2 "User Libraries:VENUS838FLPx_BREAKOUT" H 11400 1400 60  0001 C CNN
F 3 "" H 11400 1400 60  0001 C CNN
	1    9150 2400
	1    0    0    -1  
$EndComp
NoConn ~ 3100 1800
NoConn ~ 3100 1900
NoConn ~ 3100 2000
NoConn ~ 3100 2100
NoConn ~ 3100 2200
NoConn ~ 3100 2500
NoConn ~ 3100 2600
NoConn ~ 3100 2700
NoConn ~ 3100 2800
NoConn ~ 3100 3000
Text GLabel 4550 5100 0    60   Input ~ 0
TERMH
Text GLabel 4550 5250 0    60   Input ~ 0
TERML
Wire Wire Line
	4550 5100 4700 5100
Text Notes 4500 5500 0    60   ~ 0
CAN TERMINATION RESISTOR
$Comp
L Connector:Conn_01x04_Male J1
U 1 1 5C21DBED
P 2250 4500
F 0 "J1" H 2356 4778 50  0000 C CNN
F 1 "Conn_01x04_Male" H 2356 4687 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Angled_2x02_Pitch2.54mm" H 2250 4500 50  0001 C CNN
F 3 "~" H 2250 4500 50  0001 C CNN
	1    2250 4500
	1    0    0    -1  
$EndComp
$Comp
L power:+12V #PWR0119
U 1 1 5C21DC47
P 2800 4250
F 0 "#PWR0119" H 2800 4100 50  0001 C CNN
F 1 "+12V" H 2815 4423 50  0000 C CNN
F 2 "" H 2800 4250 50  0001 C CNN
F 3 "" H 2800 4250 50  0001 C CNN
	1    2800 4250
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0120
U 1 1 5C21DD08
P 3200 4300
F 0 "#PWR0120" H 3200 4050 50  0001 C CNN
F 1 "GND" H 3205 4127 50  0000 C CNN
F 2 "" H 3200 4300 50  0001 C CNN
F 3 "" H 3200 4300 50  0001 C CNN
	1    3200 4300
	1    0    0    -1  
$EndComp
Text GLabel 2900 4750 2    60   Input ~ 0
CANH
Text GLabel 2900 4600 2    60   Input ~ 0
CANL
Wire Wire Line
	2450 4600 2900 4600
$Comp
L User_Library:ADAFRUIT_BNO055 U5
U 1 1 5CF1E3C8
P 9650 4650
F 0 "U5" H 10078 4696 50  0000 L CNN
F 1 "ADAFRUIT_BNO055" H 10078 4605 50  0000 L CNN
F 2 "User Libraries:ADAFRUIT_BNO055_BREAKOUT" H 9650 4550 50  0001 C CNN
F 3 "D:/Google Drive/Vehicles/Honda CBR250RR/Electrical/CBR015-0004_GPS_CAN_MODULE_ASSY/Component Datasheets/IMU_Breakout/adafruit-bno055-absolute-orientation-sensor.pdf" H 9650 4550 50  0001 C CNN
	1    9650 4650
	1    0    0    -1  
$EndComp
Text Notes 9300 5800 0    60   ~ 0
IMU MODULE
$Comp
L power:+3V3 #PWR0114
U 1 1 5CF20931
P 9200 5300
F 0 "#PWR0114" H 9200 5150 50  0001 C CNN
F 1 "+3V3" H 9215 5473 50  0000 C CNN
F 2 "" H 9200 5300 50  0001 C CNN
F 3 "" H 9200 5300 50  0001 C CNN
	1    9200 5300
	1    0    0    -1  
$EndComp
Wire Wire Line
	9200 5300 9400 5300
Wire Wire Line
	9400 5300 9400 5100
NoConn ~ 9500 5100
$Comp
L power:GND #PWR0115
U 1 1 5CF2691C
P 9500 5300
F 0 "#PWR0115" H 9500 5050 50  0001 C CNN
F 1 "GND" H 9505 5127 50  0000 C CNN
F 2 "" H 9500 5300 50  0001 C CNN
F 3 "" H 9500 5300 50  0001 C CNN
	1    9500 5300
	1    0    0    -1  
$EndComp
Wire Wire Line
	9600 5100 9600 5200
NoConn ~ 9500 4200
NoConn ~ 9600 4200
NoConn ~ 9700 4200
NoConn ~ 9800 4200
NoConn ~ 9900 5100
Text GLabel 9700 5300 3    60   Input ~ 0
SDA
Text GLabel 9850 5300 3    60   Input ~ 0
SCL
Wire Wire Line
	9500 5300 9500 5200
Wire Wire Line
	9500 5200 9600 5200
Wire Wire Line
	9700 5300 9700 5100
Wire Wire Line
	9800 5100 9800 5200
Wire Wire Line
	9800 5200 9850 5200
Wire Wire Line
	9850 5200 9850 5300
NoConn ~ 8450 2600
NoConn ~ 8450 2500
$Comp
L SamacSys_Parts:3001 U6
U 1 1 5CF51CA4
P 4900 6600
F 0 "U6" H 5450 6865 50  0000 C CNN
F 1 "3001" H 5450 6774 50  0000 C CNN
F 2 "SamacSys_Parts:3001" H 5850 6700 50  0001 L CNN
F 3 "http://uk.rs-online.com/web/p/products/2508837311" H 5850 6600 50  0001 L CNN
F 4 "Coin Cell Battery Holders TH COIN CELL BATTERY HOLDER 12mm" H 5850 6500 50  0001 L CNN "Description"
F 5 "" H 5850 6400 50  0001 L CNN "Height"
F 6 "2508837311" H 5850 6300 50  0001 L CNN "RS Part Number"
F 7 "Keystone Electronics" H 5850 6200 50  0001 L CNN "Manufacturer_Name"
F 8 "3001" H 5850 6100 50  0001 L CNN "Manufacturer_Part_Number"
F 9 "70182368" H 5850 6000 50  0001 L CNN "Allied_Number"
	1    4900 6600
	1    0    0    -1  
$EndComp
Wire Wire Line
	4900 6600 4750 6600
Wire Wire Line
	4900 6700 4750 6700
Wire Wire Line
	4750 6700 4750 6600
Connection ~ 4750 6600
Wire Wire Line
	4750 6600 4600 6600
Wire Wire Line
	6000 6600 6150 6600
Wire Wire Line
	6150 6600 6150 6650
Wire Wire Line
	2450 4400 2800 4400
Wire Wire Line
	2800 4400 2800 4250
Wire Wire Line
	2950 4500 2950 4300
Wire Wire Line
	2950 4300 3200 4300
Wire Wire Line
	2450 4500 2950 4500
Wire Wire Line
	2900 4750 2650 4750
Wire Wire Line
	2650 4750 2650 4700
Wire Wire Line
	2650 4700 2450 4700
$Comp
L Device:C C3
U 1 1 5CF6EF9E
P 6250 1400
F 0 "C3" H 6050 1450 50  0000 L CNN
F 1 "10nF" H 5950 1350 50  0000 L CNN
F 2 "Capacitors_SMD:C_0805_HandSoldering" H 6288 1250 50  0001 C CNN
F 3 "~" H 6250 1400 50  0001 C CNN
	1    6250 1400
	1    0    0    -1  
$EndComp
$Comp
L Device:C C4
U 1 1 5CF6F1B1
P 6650 1400
F 0 "C4" H 6450 1450 50  0000 L CNN
F 1 "10nF" H 6350 1350 50  0000 L CNN
F 2 "Capacitors_SMD:C_0805_HandSoldering" H 6688 1250 50  0001 C CNN
F 3 "~" H 6650 1400 50  0001 C CNN
	1    6650 1400
	1    0    0    -1  
$EndComp
$Comp
L Device:C C5
U 1 1 5CF6F1FD
P 7050 1400
F 0 "C5" H 6850 1450 50  0000 L CNN
F 1 "10nF" H 6750 1350 50  0000 L CNN
F 2 "Capacitors_SMD:C_0805_HandSoldering" H 7088 1250 50  0001 C CNN
F 3 "~" H 7050 1400 50  0001 C CNN
	1    7050 1400
	1    0    0    -1  
$EndComp
Wire Wire Line
	7050 1550 6650 1550
Wire Wire Line
	6650 1550 6250 1550
Connection ~ 6650 1550
Wire Wire Line
	6250 1550 5750 1550
Connection ~ 6250 1550
Wire Wire Line
	7050 1250 6650 1250
Wire Wire Line
	6650 1250 6250 1250
Connection ~ 6650 1250
Wire Wire Line
	6250 1250 6250 1100
Connection ~ 6250 1250
Connection ~ 6250 1100
Wire Wire Line
	6250 1100 6300 1100
$Comp
L SamacSys_Parts:IKD0103101 S1
U 1 1 5C217B1B
P 4700 5100
F 0 "S1" H 5100 5365 50  0000 C CNN
F 1 "IKD0103101" H 5100 5274 50  0000 C CNN
F 2 "SamacSys_Parts:IKD0103101" H 5350 5200 50  0001 L CNN
F 3 "http://uk.rs-online.com/web/p/products/8772242" H 5350 5100 50  0001 L CNN
F 4 "Switch Dip 1 pos SMT Raised Act slide 1 Way Surface Mount DIP Switch SPST, Raised Actuator Slide Actuator" H 5350 5000 50  0001 L CNN "Description"
F 5 "" H 5350 4900 50  0001 L CNN "Height"
F 6 "8772242" H 5350 4800 50  0001 L CNN "RS Part Number"
F 7 "Apem" H 5350 4700 50  0001 L CNN "Manufacturer_Name"
F 8 "IKD0103101" H 5350 4600 50  0001 L CNN "Manufacturer_Part_Number"
	1    4700 5100
	1    0    0    -1  
$EndComp
Wire Wire Line
	4700 5200 4650 5200
Wire Wire Line
	4650 5200 4650 5250
Wire Wire Line
	4650 5250 4550 5250
$EndSCHEMATC
