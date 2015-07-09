
Beaglebone Black PRU code to use with HC-SR04 proximity sensor
===

Forked from luigif's fine repo. Code modified by Charles A. Hamilton

There are many examples around with Beaglebone PRU code to use an HC-SR04 sonar sensor, but most are outdated, 
do not work or require older beagles or older kernels. This repository includes everything needed to obtain a 
working example and can be used as a template for more complex PRU code.

Prerequisites:

	* Beaglebone Black with debian 3.8.13 bone47 or higher
	* HC-SR04 sensor
	* Dev tools (gcc, pasm, dtc, etc.) that are already included in BBB latest images. If you're missing them, 
	please upgrade your firmware at http://beagleboard.org/latest-images/.
	* Resistors: 1x 1k; 1x 2k
	* 5V power supply

Hardware configuration:

	* TRIGGER		P8_12 gpio1[12] GPIO44	out	pulldown		Mode: 7 
	* ECHO			P8_11 gpio1[13] GPIO45	in	pulldown		Mode: 7 *** with R 1KOhm
	* GND			P9_1 or P9_2	GND
	* VCC			P9_5 or P9_6	VDD_5V
	
### Schematic:
	
![ch6_pru_range_sensor](https://cloud.githubusercontent.com/assets/4622940/8599064/4d14cb26-262c-11e5-9c46-1961dc67bdcc.png)

NOTE: The resistors are important. Since the sensor emits a 5V signal, and the Beaglebone Black's input pins are only 3.3V, using resistors or voltage converters is crucial for preventing damage to your board.
	

### Download the complete package to your Beaglebone Black:

	Log in as root
	git clone https://github.com/HudsonWerks/Range-Sensor-PRU.git

### To build:
 	
 	cd Range-Sensor-PRU
	make
	
### Reference material:

- [HC-SR04 manual and datasheet](http://www.cytron.com.my/viewProduct.php?pcode=SN-HC-SR04&name=Ultrasonic%20Ranging%20Module)
- [TI PRU docs](http://processors.wiki.ti.com/index.php/Programmable_Realtime_Unit_Software_Development)
- [Introduction to the BeagleBone Black Device Tree](https://learn.adafruit.com/introduction-to-the-beaglebone-black-device-tree/overview)
- [Using a Beaglebone with an HC-SR04 sonar](http://teknoman117.wordpress.com/2013/04/30/using-a-beaglebone-with-an-hc-sr04-sonar/)
