CC = gcc
CFLAGS = -Wall
PRU_ASM = pasm


range-sensor-pru.bin: range-sensor-pru.p
	@echo "\n>> Generating PRU binary"
	$(PRU_ASM) -b range-sensor-pru.p

range-sensor-pru: range-sensor-pru.c
	@echo "\n>> Compiling Range Sensor Pru example"
	$(CC) $(CFLAGS) -c -o range-sensor-pru.o range-sensor-pru.c
	$(CC) -lpthread -lprussdrv -o range-sensor-pru range-sensor-pru.o

clean:
	rm -rf range-sensor-pru range-sensor-pru.o range-sensor-pru.bin
