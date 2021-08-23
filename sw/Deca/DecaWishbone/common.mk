
MEMFILE = sw/Deca/DecaWishbone/$(PROJ)/$(PROJ).hex


DECA_OBJ = $(DECA_DIR)/src/crt0.o $(DECA_DIR)/src/vtable.o $(DECA_DIR)/src/Leds.o $(DECA_DIR)/src/deca_bsp.o \
		   $(DECA_DIR)/src/deca_ext_irq.c	
BASE_OBJ =  $(SW_DIR)/src/mtime_irq.o $(SW_DIR)/src/SpinalUart.o $(SW_DIR)/src/Timer.o $(SW_DIR)/src/delay.o $(SW_DIR)/src/riscv.o \
						$(SW_DIR)/src/LIS2DH12.o $(SW_DIR)/src/SimpleSpi.o $(SW_DIR)/src/HDC1000.o $(SW_DIR)/src/i2c.o $(SW_DIR)/src/LM71.o \
						$(SW_DIR)/src/MicroWire.o $(SW_DIR)/src/millis.o $(SW_DIR)/src/CY8CMBR3102.o $(SW_DIR)/src/ictrl.c
#OBJDIR = obj

QUARTUS_DB_DIR = $(FUSESOC_CORE_DIR)/build/Deca_0/Deca-quartus/db
QUARTUS_RAM_MIF = $(wildcard $(QUARTUS_DB_DIR)/Deca_0.ram0*.mif)

#PROJECT_SRC = ../../src
DECA_SRC = ../src

OBJ =  $(PROJ_OBJ)  $(DECA_OBJ) $(BASE_OBJ) main.o


TOOLCHAIN_PREFIX = riscv64-unknown-elf-

AS = $(TOOLCHAIN_PREFIX)as
CC = $(TOOLCHAIN_PREFIX)gcc
OBJCOPY = 	$(TOOLCHAIN_PREFIX)objcopy
OBJDUMP = 	$(TOOLCHAIN_PREFIX)objdump
OPT = -Os
ARCH = rv32imc


#Changing RAM_SIZE need modification of gp and sp in  crt0.S

#If ram size change, modify gp and sp initialization in crt0.s
RAM_SIZE = 131072
#RAM_SIZE = 65536
LD_SCRIPT = riscv.ld
#LD_SCRIPT = riscv_64k.ld
FUSESOC_CORE = Deca
FUSESOC_TARGET = Deca

GENHEX = $(SW_DIR)/genhex.py
GENMIF = $(SW_DIR)/genmif.py


LDFLAGS += --print-memory-usage

DECA_INCLUDES = -I../include/ -I../../../include/



%.o:%.S
	$(AS) -mabi=ilp32  -march=$(ARCH) -o $@ $<

%.o:%.c  Makefile
	$(CC)  $(DECA_INCLUDES) -lgcc -mabi=ilp32 -nostartfiles $(OPT) -march=$(ARCH) -T ../src/$(LD_SCRIPT) -c  -o $@  $<
#$(PROJ).hex : $(PROJ).bin
#	python makehex.py $< $(RAM_SIZE_32) > $@

$(PROJ).mif : $(PROJ).hex
	python $(GENMIF) $< $(RAM_SIZE) 4 $@


$(PROJ).hex : $(PROJ).vh
	python $(GENHEX) $< $(RAM_SIZE) $@


#$(PROJ).bin : $(PROJ).elf
#	riscv32-unknown-elf-objcopy -O binary  $< $@
$(PROJ).vh : $(PROJ).elf
	$(OBJCOPY) -O verilog $< $(PROJ).vh

$(PROJ).elf : $(OBJ)
	$(CC) $(DECA_INCLUDES) -lgcc -mabi=ilp32 -nostartfiles $(OPT) -march=$(ARCH) -T $(DECA_SRC)/$(LD_SCRIPT) -o $@  $^ -Wl,-Map,$(PROJ).map,$(LDFLAGS)

.PHONY: clean objdump hw upload sim update_ram

clean:
	rm -f *.bin *.o $(DECA_DIR)/src/*.o $(SW_DIR)/src/*.o   $(PROJ).hex $(PROJ).elf $(PROJ).map $(PROJ).vh $(PROJ).txt $(PROJ).mif


objdump:
	$(OBJDUMP) -D   $(PROJ).elf > $(PROJ).txt


hw:
	cd $(FUSESOC_CORE_DIR); fusesoc --cores-root=$(FUSESOC_CORE_DIR) run --target=$(FUSESOC_TARGET) $(FUSESOC_CORE) --memsize=$(RAM_SIZE) --memfile=$(MEMFILE)

upload:
	cd $(FUSESOC_CORE_DIR); quartus_pgm  --mode=jtag  -o "P;build/Deca_0/Deca-quartus/Deca_0.sof"

FIRMWARE = sw/Deca/$(PROJ)/$(PROJ).hex
FUSESOC_CORE_SIM_DIR = $(abspath $(dir $(lastword $(MAKEFILE_LIST)))/../../) #$(shell pwd)

sim:
	cd $(FUSESOC_CORE_DIR); fusesoc --cores-root=$(FUSESOC_CORE_SIM_DIR) run --target=$(FUSESOC_TARGET)_testbench $(FUSESOC_CORE) --vcd  --memsize=$(RAM_SIZE) --firmware=$(FIRMWARE)


update_ram:
	cp $(PROJ).mif $(QUARTUS_RAM_MIF)
	cd $(FUSESOC_CORE_DIR)/build/Deca_0/Deca-quartus;  quartus_cdb Deca_0 -c Deca_0 --update_mif
	cd $(FUSESOC_CORE_DIR)/build/Deca_0/Deca-quartus;  quartus_asm --read_settings_files=on --write_settings_files=off  Deca_0 -c Deca_0
