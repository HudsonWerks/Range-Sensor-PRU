
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
	
![Schematic](hc-sr04.png?raw=true)

NOTE: The resistors are important. Since the sensor emits a 5V signal, and the Beaglebone Black's input pins are only 3.3V, using resistors or voltage converters is crucial for preventing damage to your board.
	

### Download the complete package to your Beaglebone Black:

	Log in as root
	git clone https://github.com/HudsonWerks/Range-Sensor-PRU.git

### To build:
 	
 	cd Range-Sensor-PRU
	make
	
### To install driver:

	make install
	
	It will copy device tree driver to /lib/firmware and add it to the cape manager
	
### To run:

	./Range-Sensor-PRU

	Note: After a first successful "make install", before running the Range-Sensor-PRU program, 
	you can load the driver with the install-driver.sh script.
	Depending on your needs, you can configure your operating system to run the 
	install-driver.sh script at boot.

### Example build output after running "make":

	>> Compiling Driver
	dtc -O dtb -o Range-Sensor-PRU-00A0.dtbo -b 0 -@ Range-Sensor-PRU.dts
	
	>> Generating PRU binary
	pasm -b Range-Sensor-PRU.p
	PRU Assembler Version 0.84
	Copyright (C) 2005-2013 by Texas Instruments Inc.
	Pass 2 : 0 Error(s), 0 Warning(s)
	Writing Code Image of 43 word(s)
	
	>> Compiling HC-SR04 example
	gcc -Wall -c -oRange-Sensor-PRU.o Range-Sensor-PRU.c
	gcc -lpthread -lprussdrv -o Range-Sensor-PRU Range-Sensor-PRU.o


### Example output after running "./Range-Sensor-PRU":

	>> Initializing PRU
	>> Executing Range-Sensor-PRU code
	  1: Distance = 181.52 cm
	  2: Distance = 181.50 cm
	  3: Distance = 181.50 cm
	  4: Distance = 181.52 cm
	  5: Distance = 181.93 cm
	  6: Distance = 181.52 cm
	  7: Distance = 180.64 cm
	  8: Distance = 181.50 cm
	  9: Distance = 181.06 cm
	 10: Distance = 181.49 cm
	 11: Distance = 181.04 cm
	 12: Distance = 181.93 cm
	 13: Distance = 181.47 cm
	 14: Distance = 181.47 cm
	 15: Distance = 181.91 cm
	 16: Distance = 181.91 cm
	 17: Distance = 181.47 cm
	 18: Distance = 182.35 cm
	 19: Distance = 181.49 cm
	 20: Distance = 181.06 cm
	>> PRU Disabled.

### Reference material:

- [HC-SR04 manual and datasheet](http://www.cytron.com.my/viewProduct.php?pcode=SN-HC-SR04&name=Ultrasonic%20Ranging%20Module)
- [TI PRU docs](http://processors.wiki.ti.com/index.php/Programmable_Realtime_Unit_Software_Development)
- [Introduction to the BeagleBone Black Device Tree](https://learn.adafruit.com/introduction-to-the-beaglebone-black-device-tree/overview)
- [Using a Beaglebone with an HC-SR04 sonar](http://teknoman117.wordpress.com/2013/04/30/using-a-beaglebone-with-an-hc-sr04-sonar/)
