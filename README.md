# GPS-IMU_CAN_Module
Teensy 3.2 based controller board designed to collect GPS &amp; IMU data from SkyTraq Venus838LPx and Bosch BNO055 breakout boards and transmit the data via CAN-Bus

This module was built for my CBR250RRi project. The aim was to have a standalone GPS & IMU module which could send high frequency positional data via CAN-Bus to an ECU or datalogger and therefore improve track performance analysis.

The SkyTraq Venus838LPx breakout board allows GPS data acquisition rates up to 50Hz. The BNO055 breakout board was chosen due to the fact that spatial orientation data was calculated internally. However, the spatial orientation (Euler) angles have proved unreliable so a different sensor or calculation method may need to be looked at.

For further details on the CBR250RRi project, refer to the website https://www.cbr250rri.com/.
