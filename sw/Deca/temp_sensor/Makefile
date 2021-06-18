# Build riscv hex file: make
# Build bitstream : 								make hw
# Reload to bitstream to fpga sram: make upload
# Simulate the design: 							make sim   + ctrl-c after a few second =>
#																		the generated .vcd grow fast.
#
PROJ = temp_sensor
MEMFILE = sw/Deca/$(PROJ)/$(PROJ).hex
DECA_DIR = ..
SW_DIR = ../..

DECA_OBJ = $(DECA_DIR)/src/crt0.o $(DECA_DIR)/src/vtable.o $(DECA_DIR)/src/Leds.o $(DECA_DIR)/src/deca_bsp.o
BASE_OBJ =  $(SW_DIR)/src/mtime_irq.o $(SW_DIR)/src/SpinalUart.o $(SW_DIR)/src/Timer.o $(SW_DIR)/src/delay.o $(SW_DIR)/src/riscv.o \
						$(SW_DIR)/src/LIS2DH12.o $(SW_DIR)/src/SimpleSpi.o $(SW_DIR)/src/HDC1000.o $(SW_DIR)/src/i2c.o $(SW_DIR)/src/LM71.o \
						$(SW_DIR)/src/MicroWire.o
#OBJDIR = obj

#PROJECT_SRC = ../../src
DECA_SRC = ../src

OBJ =    $(DECA_OBJ) $(BASE_OBJ) main.o
#

TOOLCHAIN_PREFIX = riscv64-unknown-elf-

AS = $(TOOLCHAIN_PREFIX)as
CC = $(TOOLCHAIN_PREFIX)gcc
OBJCOPY = 	$(TOOLCHAIN_PREFIX)objcopy
OBJDUMP = 	$(TOOLCHAIN_PREFIX)objdump
OPT = -Os
ARCH = rv32imc

#Changing RAM_SIZE need modification of gp and sp in  crt0.S
RAM_SIZE = 131072
#RAM_SIZE = 65536
LD_SCRIPT = riscv.ld
#LD_SCRIPT = riscv_64k.ld
FUSESOC_CORE = Deca
FUSESOC_TARGET = Deca
GENHEX = $(SW_DIR)/genhex.py


LDFLAGS += --print-memory-usage


DECA_INCLUDES = -I../include/ -I../../include/
FUSESOC_CORE_DIR = $(abspath $(dir $(lastword $(MAKEFILE_LIST)))/../../../) #$(shell pwd)



#If ram size change, modify gp and sp initialization in crt0.s



%.o:%.S
	$(AS) -mabi=ilp32  -march=$(ARCH) -o $@ $<

%.o:%.c  Makefile
	$(CC)  $(DECA_INCLUDES) -lgcc -mabi=ilp32 -nostartfiles $(OPT) -march=$(ARCH) -T ../src/$(LD_SCRIPT) -c  -o $@  $<
#$(PROJ).hex : $(PROJ).bin
#	python makehex.py $< $(RAM_SIZE_32) > $@
$(PROJ).hex : $(PROJ).vh
	python $(GENHEX) $< $(RAM_SIZE) $@

#$(PROJ).bin : $(PROJ).elf
#	riscv32-unknown-elf-objcopy -O binary  $< $@
$(PROJ).vh : $(PROJ).elf
	$(OBJCOPY) -O verilog $< $(PROJ).vh


$(PROJ).elf : $(OBJ)
	$(CC) $(DECA_INCLUDES) -lgcc -mabi=ilp32 -nostartfiles $(OPT) -march=$(ARCH) -T $(DECA_SRC)/$(LD_SCRIPT) -o $@  $^ -Wl,-Map,$(PROJ).map,$(LDFLAGS)


.PHONY: clean objdump hw upload sim

clean:
	rm -f *.bin *.o $(DECA_DIR)/src/*.o $(SW_DIR)/src/*.o    $(PROJ).hex $(PROJ).elf $(PROJ).map $(PROJ).vh $(PROJ).txt


objdump:
	$(OBJDUMP) -D   $(PROJ).elf > $(PROJ).txt


hw:
	cd ../../../;fusesoc --cores-root=$(FUSESOC_CORE_DIR) run --target=$(FUSESOC_TARGET) $(FUSESOC_CORE) --memsize=$(RAM_SIZE) --memfile=$(MEMFILE)

upload:
	cd ../../../; quartus_pgm  --mode=jtag  -o "P;build/Deca_0/Deca-quartus/Deca_0.sof"

sim:
	cd ../../../; fusesoc --cores-root=$(FUSESOC_CORE_DIR) run --target=$(FUSESOC_TARGET)_testbench $(FUSESOC_CORE) --vcd  --memsize=$(RAM_SIZE) --firmware=$(MEMFILE)
#	fusesoc --cores-root=/home/stche/Documents/fpga/fusesoc/iceFunSoc \
  run --target=cyc1000_soc_verilator_tb cyc1000_soc --vcd --firmware=sw/cyc1000/Accelerometer/spi_sen.hex
