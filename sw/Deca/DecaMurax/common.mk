RAM_SIZE := 131072
WORDCOUNT := 32768

FUSESOC_TARGET := DecaMurax
FUSESOC_TARGET_SIM := DecaMuraxSim
FUSESOC_CORE  := DecaMurax

DECAMURAX_HW_DIR = $(FUSESOC_CORE_DIR)/rtl/Deca/DecaMurax
DECAMURAX_SW_DIR = $(FUSESOC_CORE_DIR)/sw/Deca/DecaMurax

SPLITHEX = $(SW_DIR)/splithex.py

GENHEX := $(SW_DIR)/genhex.py
GENMIF := $(SW_DIR)/genmif.py
HEX2BIN := $(SW_DIR)/hex2bin.py

FUSESOC_BUILD_DIR := $(FUSESOC_CORE_DIR)/build/DecaMurax_0/DecaMurax-quartus/
                
BRAM_NAME_BASE := DecaMuraxSoc.v_toplevel_murax_system_ram_ram_symbol
QUARTUS_DB_DIR = $(FUSESOC_CORE_DIR)/build/DecaMurax_0/DecaMurax-quartus/db
QUARTUS_RAM_MIF_0 = $(wildcard $(QUARTUS_DB_DIR)/DecaMurax_0.ram0*.mif)
QUARTUS_RAM_MIF_1 = $(wildcard $(QUARTUS_DB_DIR)/DecaMurax_0.ram1*.mif)
QUARTUS_RAM_MIF_2 = $(wildcard $(QUARTUS_DB_DIR)/DecaMurax_0.ram2*.mif)
QUARTUS_RAM_MIF_3 = $(wildcard $(QUARTUS_DB_DIR)/DecaMurax_0.ram3*.mif)




TOOLCHAIN_PREFIX := riscv64-unknown-elf-

AS = $(TOOLCHAIN_PREFIX)as
CC = $(TOOLCHAIN_PREFIX)gcc
OBJCOPY = 	$(TOOLCHAIN_PREFIX)objcopy
OBJDUMP = 	$(TOOLCHAIN_PREFIX)objdump
OPT = -Os
ARCH = rv32imc

LD_SCRIPT = riscv.ld
LDFLAGS += --print-memory-usage

DECA_SRCS = ../src
DECAMURAX_INCLUDES = -I../include/ -I../../../include/
DECAMURAX_OBJ := $(DECAMURAX_SW_DIR)/src/crt0.o
OBJ =  $(PROJECT_OBJ) $(DECAMURAX_OBJ)

%.o:%.S
	$(AS) -mabi=ilp32  -march=$(ARCH) -o $@ $<

%.o:%.c  Makefile
	$(CC)  $(DECAMURAX_INCLUDES) -lgcc -mabi=ilp32 -nostartfiles $(OPT) -march=$(ARCH) -T $(DECAMURAX_SW_DIR)/src/$(LD_SCRIPT) -c  -o $@  $<

#%.mif : %$(PROJECT_NAME)_*.hex
#	python $(GENMIF) $< 32768 1 $@

$(PROJECT_NAME).hex : $(PROJECT_NAME).vh
	python $(GENHEX) $< $(RAM_SIZE) 0 $@
	python $(SPLITHEX) $(PROJECT_NAME).hex $(PROJECT_NAME)_0.hex $(PROJECT_NAME)_1.hex $(PROJECT_NAME)_2.hex $(PROJECT_NAME)_3.hex 
	python $(HEX2BIN) $(PROJECT_NAME)_0.hex $(PROJECT_NAME)_0.bin
	python $(HEX2BIN) $(PROJECT_NAME)_1.hex $(PROJECT_NAME)_1.bin
	python $(HEX2BIN) $(PROJECT_NAME)_2.hex $(PROJECT_NAME)_2.bin
	python $(HEX2BIN) $(PROJECT_NAME)_3.hex $(PROJECT_NAME)_3.bin
	python $(GENMIF) $(PROJECT_NAME)_0.hex $(WORDCOUNT) 1 $(PROJECT_NAME)_0.mif
	python $(GENMIF) $(PROJECT_NAME)_1.hex $(WORDCOUNT) 1 $(PROJECT_NAME)_1.mif
	python $(GENMIF) $(PROJECT_NAME)_2.hex $(WORDCOUNT) 1 $(PROJECT_NAME)_2.mif
	python $(GENMIF) $(PROJECT_NAME)_3.hex $(WORDCOUNT) 1 $(PROJECT_NAME)_3.mif
#$(PROJECT_NAME).hex : $(PROJECT_NAME).vh
#	python $(GENHEX) $< $(RAM_SIZE) $@

$(PROJECT_NAME).vh : $(PROJECT_NAME).elf
	$(OBJCOPY) -O verilog $< $(PROJECT_NAME).vh

$(PROJECT_NAME).elf : $(OBJ)
	$(CC) $(DECAMURAX_INCLUDES) -lgcc -mabi=ilp32 -nostartfiles $(OPT) -march=$(ARCH) -T $(DECAMURAX_SW_DIR)/src/$(LD_SCRIPT) -o $@  $^ -Wl,-Map,$(PROJECT_NAME).map,$(LDFLAGS)

.PHONY: clean clean_hw hw objdump sim update_ram

clean_hw:
	cd $(DECAMURAX_HW_DIR); rm -f *.bin *.hex

clean:
	rm -f *.bin *.hex *.elf *.mif $(OBJ) *.map *.vh

#copy binary from the project directory
hw:
	cp $(PROJECT_NAME)_0.bin $(DECAMURAX_HW_DIR)/$(BRAM_NAME_BASE)0.bin
	cp $(PROJECT_NAME)_1.bin $(DECAMURAX_HW_DIR)/$(BRAM_NAME_BASE)1.bin
	cp $(PROJECT_NAME)_2.bin $(DECAMURAX_HW_DIR)/$(BRAM_NAME_BASE)2.bin
	cp $(PROJECT_NAME)_3.bin $(DECAMURAX_HW_DIR)/$(BRAM_NAME_BASE)3.bin
	cd $(FUSESOC_CORE_DIR); fusesoc --cores-root=$(FUSESOC_CORE_DIR) run --target=$(FUSESOC_TARGET) $(FUSESOC_CORE)


objdump:
	$(OBJDUMP) -D   $(PROJECT_NAME).elf > $(PROJECT_NAME).txt

sim:
	cp $(PROJECT_NAME)_0.bin $(DECAMURAX_HW_DIR)/$(BRAM_NAME_BASE)0.bin
	cp $(PROJECT_NAME)_1.bin $(DECAMURAX_HW_DIR)/$(BRAM_NAME_BASE)1.bin
	cp $(PROJECT_NAME)_2.bin $(DECAMURAX_HW_DIR)/$(BRAM_NAME_BASE)2.bin
	cp $(PROJECT_NAME)_3.bin $(DECAMURAX_HW_DIR)/$(BRAM_NAME_BASE)3.bin
	cd $(FUSESOC_CORE_DIR); fusesoc --cores-root=$(FUSESOC_CORE_DIR) run --target=$(FUSESOC_TARGET_SIM) $(FUSESOC_CORE)

update_ram:
	cp $(PROJECT_NAME)_0.mif $(QUARTUS_RAM_MIF_0)
	cp $(PROJECT_NAME)_1.mif $(QUARTUS_RAM_MIF_1)
	cp $(PROJECT_NAME)_2.mif $(QUARTUS_RAM_MIF_2)
	cp $(PROJECT_NAME)_3.mif $(QUARTUS_RAM_MIF_3)
	cd $(FUSESOC_CORE_DIR)/build/DecaMurax_0/DecaMurax-quartus;  quartus_cdb DecaMurax_0 -c DecaMurax_0 --update_mif
	cd $(FUSESOC_CORE_DIR)/build/DecaMurax_0/DecaMurax-quartus;  quartus_asm --read_settings_files=on --write_settings_files=off  DecaMurax_0 -c DecaMurax_0

upload:
	cd $(FUSESOC_CORE_DIR); quartus_pgm  --mode=jtag  -o "P;build/DecaMurax_0/DecaMurax-quartus/DecaMurax_0.sof"