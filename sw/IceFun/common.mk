
RAM_SIZE := 8192

FUSESOC_TARGET := MuraxIceFun
FUSESOC_CORE  := IceFun

GENHEX = $(SW_DIR)/genhex.py
GENMIF = $(SW_DIR)/genmif.py


BRAM_NAME_BASE := MuraxIceFunSoc.v_toplevel_murax_system_ram_ram_symbol
#BRAM_NAME_0 := $(BRAM_NAME_BASE)0.bin
#BRAM_NAME_1 := $(BRAM_NAME_BASE)1.bin
#BRAM_NAME_2 := $(BRAM_NAME_BASE)2.bin
#BIN_NAME_3 := $(BRAM_NAME_BASE)3.bin
TOOLCHAIN_PREFIX = riscv64-unknown-elf-

AS = $(TOOLCHAIN_PREFIX)as
CC = $(TOOLCHAIN_PREFIX)gcc
OBJCOPY = 	$(TOOLCHAIN_PREFIX)objcopy
OBJDUMP = 	$(TOOLCHAIN_PREFIX)objdump
OPT = -Os
ARCH = rv32ic


LD_SCRIPT = $(ICEFUN_SW_DIR)/src/riscv.ld
LDFLAGS += --print-memory-usage

DECA_SRCS = ../src
ICEFUN_INCLUDES = -I../include/ -I../../include/

ICEFUN_OBJ := $(ICEFUN_SW_DIR)/src/crt0.o

OBJ =  $(PROJECT_OBJ) $(ICEFUN_OBJ)


%.o:%.S
	$(AS) -mabi=ilp32  -march=$(ARCH) -o $@ $<

%.o:%.c  Makefile
	$(CC)  $(ICEFUN_INCLUDES) -lgcc -mabi=ilp32 -nostartfiles $(OPT) -march=$(ARCH) -T .$(ICEFUN_SW_DIR)/src/$(LD_SCRIPT) -c  -o $@  $<


$(PROJECT_NAME).hex : $(PROJECT_NAME).vh
	python $(GENHEX) $< $(RAM_SIZE) $@


$(PROJECT_NAME).vh : $(PROJECT_NAME).elf
	$(OBJCOPY) -O verilog $< $(PROJECT_NAME).vh

$(PROJECT_NAME).elf : $(OBJ)
	$(CC) $(ICEFUN_INCLUDES) -lgcc -mabi=ilp32 -nostartfiles $(OPT) -march=$(ARCH) -T $(ICEFUN_SW_DIR)/src/$(LD_SCRIPT) -o $@  $^ -Wl,-Map,$(PROJ).map,$(LDFLAGS)




.PHONY: clean hw

hw:
	cd $(ICEFUN_HW_DIR); icebram -g -s 194 8 $(RAM_SIZE)/4 > $(BRAM_NAME_BASE)0.hex
	cd $(ICEFUN_HW_DIR); python $(SW_DIR)/hex2bin.py $(BRAM_NAME_BASE)0.hex $(BRAM_NAME_BASE)0.bin

	cd $(ICEFUN_HW_DIR); icebram -g -s 97464 8 2048 > $(BRAM_NAME_BASE)1.hex
	cd $(ICEFUN_HW_DIR); python $(SW_DIR)/hex2bin.py $(BRAM_NAME_BASE)1.hex $(BRAM_NAME_BASE)1.bin

	cd $(ICEFUN_HW_DIR); icebram -g -s 655741 8 2048 > $(BRAM_NAME_BASE)2.hex
	cd $(ICEFUN_HW_DIR); python $(SW_DIR)/hex2bin.py $(BRAM_NAME_BASE)2.hex $(BRAM_NAME_BASE)2.bin

	cd $(ICEFUN_HW_DIR); icebram -g -s 555 8 2048 > $(BRAM_NAME_BASE)3.hex
	cd $(ICEFUN_HW_DIR); python $(SW_DIR)/hex2bin.py $(BRAM_NAME_BASE)3.hex $(BRAM_NAME_BASE)3.bin

	cd $(FUSESOC_CORE_DIR); fusesoc --cores-root=$(FUSESOC_CORE_DIR) run --target=$(FUSESOC_TARGET) $(FUSESOC_CORE) 

clean:
	cd $(ICEFUN_HW_DIR); rm *.bin *.hex

#cd $(FUSESOC_CORE_DIR); fusesoc --cores-root=$(FUSESOC_CORE_DIR) run --target=$(FUSESOC_TARGET) $(FUSESOC_CORE) 
#--memsize=$(RAM_SIZE) --memfile=$(MEMFILE)