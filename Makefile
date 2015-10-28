CC = gcc
CFLAGS = -Wall
PRU_ASM = pasm

all: rangepru.bin rangepru

rangepru.bin: rangepru.p
	@echo "\n>> Generating PRU binary"
	$(PRU_ASM) -b rangepru.p

rangepru: rangepru.c
	@echo "\n>> Compiling Range Sensor Pru example"
	$(CC) $(CFLAGS) -c -o rangepru.o rangepru.c
	$(CC) -lpthread -lprussdrv -o rangepru rangepru.o

clean:
	rm -rf rangepru rangepru.o rangepru.bin

install: rangepru.bin rangepru
