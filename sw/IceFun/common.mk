RAM_SIZE := 8192

FUSESOC_TARGET := MuraxIceFun
FUSESOC_CORE  := IceFun

SPLITHEX = $(SW_DIR)/splithex.py

GENHEX := $(SW_DIR)/genhex.py
GENMIF := $(SW_DIR)/genmif.py
HEX2BIN := $(SW_DIR)/hex2bin.py

FUSESOC_BUILD_DIR := $(FUSESOC_CORE_DIR)/build/IceFun_0/MuraxIceFun-icestorm/
ASC_FILE := $(FUSESOC_BUILD_DIR)/IceFun_0_next.asc
ASC_FILE_0 := $(PROJECT_NAME)_0.asc
ASC_FILE_1 := $(PROJECT_NAME)_1.asc
ASC_FILE_2 := $(PROJECT_NAME)_2.asc
ASC_FILE_3 := $(PROJECT_NAME)_3.asc
#$(FUSESOC_BUILD_DIR)/IceFun_0_next_
MEMFILE_DIR := $(FUSESOC_BUILD_DIR)/IceFun/
MEMFILE_0 := $(MEMFILE_DIR)/MuraxIceFunSoc.v_toplevel_murax_system_ram_ram_symbol0.hex
MEMFILE_1 := $(MEMFILE_DIR)/MuraxIceFunSoc.v_toplevel_murax_system_ram_ram_symbol1.hex
MEMFILE_2 := $(MEMFILE_DIR)/MuraxIceFunSoc.v_toplevel_murax_system_ram_ram_symbol2.hex
MEMFILE_3 := $(MEMFILE_DIR)/MuraxIceFunSoc.v_toplevel_murax_system_ram_ram_symbol3.hex


BRAM_NAME_BASE := MuraxIceFunSoc.v_toplevel_murax_system_ram_ram_symbol
#BRAM_NAME_0 := $(BRAM_NAME_BASE)0.bin
#BRAM_NAME_1 := $(BRAM_NAME_BASE)1.bin
#BRAM_NAME_2 := $(BRAM_NAME_BASE)2.bin
#BIN_NAME_3 := $(BRAM_NAME_BASE)3.bin
TOOLCHAIN_PREFIX := riscv64-unknown-elf-

AS = $(TOOLCHAIN_PREFIX)as
CC = $(TOOLCHAIN_PREFIX)gcc
OBJCOPY = 	$(TOOLCHAIN_PREFIX)objcopy
OBJDUMP = 	$(TOOLCHAIN_PREFIX)objdump
OPT = -Os
ARCH = rv32ic





LD_SCRIPT = riscv.ld
LDFLAGS += --print-memory-usage

DECA_SRCS = ../src
ICEFUN_INCLUDES = -I../include/ -I../../include/

ICEFUN_OBJ := $(ICEFUN_SW_DIR)/src/crt0.o

OBJ =  $(PROJECT_OBJ) $(ICEFUN_OBJ)


%.o:%.S
	$(AS) -mabi=ilp32  -march=$(ARCH) -o $@ $<

%.o:%.c  Makefile
	$(CC)  $(ICEFUN_INCLUDES) -lgcc -mabi=ilp32 -nostartfiles $(OPT) -march=$(ARCH) -T $(ICEFUN_SW_DIR)/src/$(LD_SCRIPT) -c  -o $@  $<

#$(PROJECT_NAME_0).hex : $(PROJECT_NAME).hex
#	python $(SPLITHEX) $< $@ 

$(PROJECT_NAME).hex : $(PROJECT_NAME).vh
	python $(GENHEX) $< $(RAM_SIZE) $@
	python $(SPLITHEX) $(PROJECT_NAME).hex $(PROJECT_NAME)_0.hex $(PROJECT_NAME)_1.hex $(PROJECT_NAME)_2.hex $(PROJECT_NAME)_3.hex 
	python $(HEX2BIN) $(PROJECT_NAME)_0.hex $(PROJECT_NAME)_0.bin
	python $(HEX2BIN) $(PROJECT_NAME)_1.hex $(PROJECT_NAME)_1.bin
	python $(HEX2BIN) $(PROJECT_NAME)_2.hex $(PROJECT_NAME)_2.bin
	python $(HEX2BIN) $(PROJECT_NAME)_3.hex $(PROJECT_NAME)_3.bin

$(PROJECT_NAME).vh : $(PROJECT_NAME).elf
	$(OBJCOPY) -O verilog $< $(PROJECT_NAME).vh

$(PROJECT_NAME).elf : $(OBJ)
	$(CC) $(ICEFUN_INCLUDES) -lgcc -mabi=ilp32 -nostartfiles $(OPT) -march=$(ARCH) -T $(ICEFUN_SW_DIR)/src/$(LD_SCRIPT) -o $@  $^ -Wl,-Map,$(PROJECT_NAME).map,$(LDFLAGS)




.PHONY: clean clean_hw hw

clean_hw:
	cd $(ICEFUN_HW_DIR); rm *.bin *.hex

clean:
	rm -f *.elf *.hex *.vh *.asc *.bin *.map

hw:
	cd $(ICEFUN_HW_DIR); icebram -g -s 194 8 2048 > $(BRAM_NAME_BASE)0.hex
	cd $(ICEFUN_HW_DIR); python $(SW_DIR)/hex2bin.py $(BRAM_NAME_BASE)0.hex $(BRAM_NAME_BASE)0.bin

	cd $(ICEFUN_HW_DIR); icebram -g -s 97464 8 2048 > $(BRAM_NAME_BASE)1.hex
	cd $(ICEFUN_HW_DIR); python $(SW_DIR)/hex2bin.py $(BRAM_NAME_BASE)1.hex $(BRAM_NAME_BASE)1.bin

	cd $(ICEFUN_HW_DIR); icebram -g -s 655741 8 2048 > $(BRAM_NAME_BASE)2.hex
	cd $(ICEFUN_HW_DIR); python $(SW_DIR)/hex2bin.py $(BRAM_NAME_BASE)2.hex $(BRAM_NAME_BASE)2.bin

	cd $(ICEFUN_HW_DIR); icebram -g -s 555 8 2048 > $(BRAM_NAME_BASE)3.hex
	cd $(ICEFUN_HW_DIR); python $(SW_DIR)/hex2bin.py $(BRAM_NAME_BASE)3.hex $(BRAM_NAME_BASE)3.bin

	cd $(FUSESOC_CORE_DIR); fusesoc --cores-root=$(FUSESOC_CORE_DIR) run --target=$(FUSESOC_TARGET) $(FUSESOC_CORE) 


update_ram:
	icebram -v $(MEMFILE_0) $(PROJECT_NAME)_0.hex < $(ASC_FILE) > $(ASC_FILE_0)
	icebram -v $(MEMFILE_1) $(PROJECT_NAME)_1.hex < $(ASC_FILE_0) > $(ASC_FILE_1)
	icebram -v $(MEMFILE_2) $(PROJECT_NAME)_2.hex < $(ASC_FILE_1) > $(ASC_FILE_2)
	icebram -v $(MEMFILE_3) $(PROJECT_NAME)_3.hex < $(ASC_FILE_2) > $(ASC_FILE_3)
	icepack $(ASC_FILE_3) $(PROJECT_NAME).bin

burn:
	iceFUNprog $(PROJECT_NAME).bin	

