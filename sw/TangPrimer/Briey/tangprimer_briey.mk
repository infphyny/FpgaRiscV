
export 
PROG_START_ADDRESS := 2147483648
RAM_SIZE := 32768
include $(SW_DIR)pythonscript.mk

#$(PROJECT_NAME)_0.mif $(PROJECT_NAME)_1.mif  $(PROJECT_NAME)_2.mif $(PROJECT_NAME)_3.mif : $(PROJECT_NAME)_0.hex $(PROJECT_NAME)_1.hex  $(PROJECT_NAME)_2.hex $(PROJECT_NAME)_3.hex
#	python3 $(GENMIF) $(PROJECT_NAME)_0.hex 8192 1 $(PROJECT_NAME)_0.mif
#	python3 $(GENMIF) $(PROJECT_NAME)_1.hex 8192 1 $(PROJECT_NAME)_1.mif
#	python3 $(GENMIF) $(PROJECT_NAME)_2.hex 8192 1 $(PROJECT_NAME)_2.mif
#	python3 $(GENMIF) $(PROJECT_NAME)_3.hex 8192 1 $(PROJECT_NAME)_3.mif

include $(SW_DIR)hex2bin.mk

include $(SW_DIR)splithex.mk

#SIM_DIR := $(FUSESOC_CORE_DIR)bench/Colorlight5A-75E/Briey

#include $(HW_DIR)buildhw.mk




LD_SCRIPT := $(FUSESOC_CORE_DIR)sw/TangPrimer/Briey/src/riscv.ld
CRT0_OBJ := $(FUSESOC_CORE_DIR)sw/TangPrimer/Briey/src/crt0.o


SOC_INCLUDE_DIRECTORY := -I $(FUSESOC_CORE_DIR)sw/TangPrimer/Briey/include
#include $(SW_DIR)/common.mk




#FUSESOC_TARGET := ColorLightBriey-5A75E-V8
#FUSESOC_TARGET_SIM := MuraxIceFunSim
#FUSESOC_CORE  := ColorLight

#HW_BUILD_DIR = $(FUSESOC_CORE_DIR)build/Colorlight_0/ColorLightBriey-5A75E-V8-trellis/


BRAM_NAME_BASE := TangPrimerBriey.v_toplevel_axi_ram_ram_symbol

#CONF_FILE 	:= ColorLightBriey.config
#CONF_FILE_0 := ColorLightBriey0.config 
#CONF_FILE_1 := ColorLightBriey1.config
#CONF_FILE_2	:= ColorLightBriey2.config
#CONF_FILE_3 := ColorLightBriey3.config


.PHONY : clean hw clean_hw prog_sram update_ram bin genmif


genmif:
	python3 $(GENMIF) $(PROJECT_NAME)_0.hex 8192 1 $(PROJECT_NAME)_0.mif
	python3 $(GENMIF) $(PROJECT_NAME)_1.hex 8192 1 $(PROJECT_NAME)_1.mif
	python3 $(GENMIF) $(PROJECT_NAME)_2.hex 8192 1 $(PROJECT_NAME)_2.mif
	python3 $(GENMIF) $(PROJECT_NAME)_3.hex 8192 1 $(PROJECT_NAME)_3.mif


clean: 
	rm -f *.elf *.hex *.vh *.asc *.bin *.map $(PROJECT_OBJ) *.bit *.mif


#hw:
#	cd $(HW_DIR); ecpbram -g $(BRAM_NAME_BASE)0.hex -s 194 -w 8 -d 16384  $(BRAM_NAME_BASE)0.hex
#	cd $(HW_DIR); python $(SW_DIR)/hex2bin.py $(BRAM_NAME_BASE)0.hex $(BRAM_NAME_BASE)0.bin

#	cd $(HW_DIR); ecpbram -g  $(BRAM_NAME_BASE)1.hex -s 97464 -w 8 -d 16384 
#	cd $(HW_DIR); python $(SW_DIR)/hex2bin.py $(BRAM_NAME_BASE)1.hex $(BRAM_NAME_BASE)1.bin

#	cd $(HW_DIR); ecpbram -g $(BRAM_NAME_BASE)2.hex -s 655741 -w 8 -d 16384
#	cd $(HW_DIR); python $(SW_DIR)/hex2bin.py $(BRAM_NAME_BASE)2.hex $(BRAM_NAME_BASE)2.bin

#	cd $(HW_DIR); ecpbram -g $(BRAM_NAME_BASE)3.hex -s 555 -w 8 -d 16384  
#	cd $(HW_DIR); python $(SW_DIR)/hex2bin.py $(BRAM_NAME_BASE)3.hex $(BRAM_NAME_BASE)3.bin

#	$(MAKE) -C $(HW_DIR) -f ColorLightBriey.mk
#	cd $(FUSESOC_CORE_DIR); fusesoc --cores-root=$(FUSESOC_CORE_DIR) run --target=$(FUSESOC_TARGET) $(FUSESOC_CORE) 


#sim:
#	python $(SW_DIR)hex2bin.py $(PROJECT_NAME)_0.hex $(SIM_DIR)/$(BRAM_NAME_BASE)0.bin
#	python $(SW_DIR)hex2bin.py $(PROJECT_NAME)_1.hex $(SIM_DIR)/$(BRAM_NAME_BASE)1.bin
#	python $(SW_DIR)hex2bin.py $(PROJECT_NAME)_2.hex $(SIM_DIR)/$(BRAM_NAME_BASE)2.bin
#	python $(SW_DIR)hex2bin.py $(PROJECT_NAME)_3.hex $(SIM_DIR)/$(BRAM_NAME_BASE)3.bin
#	cd $(SIM_DIR); $(MAKE) 
#	cd $(SIM_DIR); ./sim

#update_ram:
#	ecpbram -f $(HW_DIR)$(BRAM_NAME_BASE)0.hex -t $(PROJECT_NAME)_0.hex -i $(HW_DIR)$(CONF_FILE) -o $(HW_DIR)$(CONF_FILE_0)
#	ecpbram -f $(HW_DIR)$(BRAM_NAME_BASE)1.hex -t $(PROJECT_NAME)_1.hex -i $(HW_DIR)$(CONF_FILE_0) -o $(HW_DIR)$(CONF_FILE_1)
#	ecpbram -f $(HW_DIR)$(BRAM_NAME_BASE)2.hex -t $(PROJECT_NAME)_2.hex -i $(HW_DIR)$(CONF_FILE_1) -o $(HW_DIR)$(CONF_FILE_2)
#	ecpbram -f $(HW_DIR)$(BRAM_NAME_BASE)3.hex -t $(PROJECT_NAME)_3.hex -i $(HW_DIR)$(CONF_FILE_2) -o $(HW_DIR)$(CONF_FILE_3)
#	ecppack $(HW_DIR)$(CONF_FILE_3) $(PROJECT_NAME).bit


prog flash:
	openFPGALoader -f --bitstream $(PROJECT_NAME).bit

prog_sram:
	openFPGALoader -m --bitstream $(PROJECT_NAME).bit



clean_hw:
	rm -f *.bit $(HW_DIR)*.svf $(HW_DIR)*.bit  $(HW_DIR)*.bin $(HW_DIR)*.json $(HW_DIR)*.hex
