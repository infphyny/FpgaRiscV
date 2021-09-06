export 
include $(SW_DIR)pythonscript.mk
include $(SW_DIR)ColorLight/Murax/splithex.mk
#include $(HW_DIR)buildhw.mk

RAM_SIZE := 65536

LD_SCRIPT := $(FUSESOC_CORE_DIR)sw/ColorLight/Murax/src/riscv.ld
CRT0_OBJ := $(FUSESOC_CORE_DIR)sw/ColorLight/Murax/src/crt0.o


SOC_INCLUDE_DIRECTORY := -I $(FUSESOC_CORE_DIR)sw/ColorLight/Murax/include
#include $(SW_DIR)/common.mk




FUSESOC_TARGET := ColorLight-5A75E-V8
#FUSESOC_TARGET_SIM := MuraxIceFunSim
FUSESOC_CORE  := ColorLightMurax

BRAM_NAME_BASE := ColorLightMuraxSoc.v_toplevel_murax_system_ram_ram_symbol

CONF_FILE 	:= Murax.config
CONF_FILE_0 := Murax0.config 
CONF_FILE_1 := Murax1.config
CONF_FILE_2	:= Murax2.config
CONF_FILE_3 := Murax3.config


.PHONY : clean hw clean_hw prog_sram update_ram 


clean: 
	rm -f *.elf *.hex *.vh *.asc *.bin *.map $(PROJECT_OBJ) *.bit


hw:
	cd $(HW_DIR); ecpbram -g $(BRAM_NAME_BASE)0.hex -s 194 -w 8 -d 16384  $(BRAM_NAME_BASE)0.hex
	cd $(HW_DIR); python $(SW_DIR)/hex2bin.py $(BRAM_NAME_BASE)0.hex $(BRAM_NAME_BASE)0.bin

	cd $(HW_DIR); ecpbram -g  $(BRAM_NAME_BASE)1.hex -s 97464 -w 8 -d 16384 
	cd $(HW_DIR); python $(SW_DIR)/hex2bin.py $(BRAM_NAME_BASE)1.hex $(BRAM_NAME_BASE)1.bin

	cd $(HW_DIR); ecpbram -g $(BRAM_NAME_BASE)2.hex -s 655741 -w 8 -d 16384
	cd $(HW_DIR); python $(SW_DIR)/hex2bin.py $(BRAM_NAME_BASE)2.hex $(BRAM_NAME_BASE)2.bin

	cd $(HW_DIR); ecpbram -g $(BRAM_NAME_BASE)3.hex -s 555 -w 8 -d 16384  
	cd $(HW_DIR); python $(SW_DIR)/hex2bin.py $(BRAM_NAME_BASE)3.hex $(BRAM_NAME_BASE)3.bin

	$(MAKE) -C $(HW_DIR) -f ColorLightMuraxSoc.mk
#cd $(FUSESOC_CORE_DIR); fusesoc --cores-root=$(FUSESOC_CORE_DIR) run --target=$(FUSESOC_TARGET) $(FUSESOC_CORE) 


update_ram:
	ecpbram -f $(HW_DIR)$(BRAM_NAME_BASE)0.hex -t $(PROJECT_NAME)_0.hex -i $(HW_DIR)$(CONF_FILE) -o $(HW_DIR)$(CONF_FILE_0)
	ecpbram -f $(HW_DIR)$(BRAM_NAME_BASE)1.hex -t $(PROJECT_NAME)_1.hex -i $(HW_DIR)$(CONF_FILE_0) -o $(HW_DIR)$(CONF_FILE_1)
	ecpbram -f $(HW_DIR)$(BRAM_NAME_BASE)2.hex -t $(PROJECT_NAME)_2.hex -i $(HW_DIR)$(CONF_FILE_1) -o $(HW_DIR)$(CONF_FILE_2)
	ecpbram -f $(HW_DIR)$(BRAM_NAME_BASE)3.hex -t $(PROJECT_NAME)_3.hex -i $(HW_DIR)$(CONF_FILE_2) -o $(HW_DIR)$(CONF_FILE_3)
	ecppack $(HW_DIR)$(CONF_FILE_3) $(PROJECT_NAME).bit

prog_sram:
	openFPGALoader -m --bitstream $(PROJECT_NAME).bit

clean_hw:
	rm -f $(HW_DIR)*.bin $(HW_DIR)*.json $(HW_DIR)*.hex
