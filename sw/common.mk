
ifeq ($(PROG_START_ADDRESS),)
 PROG_START_ADDRESS := 0
endif



TOOLCHAIN_PREFIX := riscv64-unknown-elf-

AS = $(TOOLCHAIN_PREFIX)as
CC = $(TOOLCHAIN_PREFIX)gcc
OBJCOPY = 	$(TOOLCHAIN_PREFIX)objcopy
OBJDUMP = 	$(TOOLCHAIN_PREFIX)objdump

LIBRARY_INCLUDE_DIRECTORY := -I$(FUSESOC_CORE_DIR)sw/include

LDFLAGS += --print-memory-usage

OBJ := $(PROJECT_OBJ) $(CRT0_OBJ)
INCLUDE_DIRECTORIES :=  $(PROJECT_INCLUDE_DIRECTORY)  $(SOC_INCLUDE_DIRECTORY)  $(LIBRARY_INCLUDE_DIRECTORY)

%.o:%.S
	$(AS) -mabi=ilp32  -march=$(ARCH) -o $@ $<

%.o:%.c  Makefile
	$(CC)  $(INCLUDE_DIRECTORIES) -lgcc -mabi=ilp32 -nostartfiles $(OPT) -march=$(ARCH) -T $(LD_SCRIPT) -c  -o $@  $<

$(PROJECT_NAME).hex : $(PROJECT_NAME).vh
	python $(GENHEX) $< $(RAM_SIZE) $(PROG_START_ADDRESS)  $@

$(PROJECT_NAME).vh : $(PROJECT_NAME).elf
	$(OBJCOPY) -O verilog $< $(PROJECT_NAME).vh


$(PROJECT_NAME).elf : $(OBJ)
	$(CC) $(INCLUDES_DIRECTORIES) -lgcc -mabi=ilp32 -nostartfiles $(OPT) -march=$(ARCH) -T $(LD_SCRIPT) -o $@  $^ -Wl,-Map,$(PROJECT_NAME).map,$(LDFLAGS)

