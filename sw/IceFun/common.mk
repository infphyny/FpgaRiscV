


RAM_SIZE := 8192


FUSESOC_TARGET := MuraxIceFun
FUSESOC_CORE  := IceFun

BRAM_NAME_BASE := MuraxIceFunSoc.v_toplevel_murax_system_ram_ram_symbol
#BRAM_NAME_0 := $(BRAM_NAME_BASE)0.bin
#BRAM_NAME_1 := $(BRAM_NAME_BASE)1.bin
#BRAM_NAME_2 := $(BRAM_NAME_BASE)2.bin
#BIN_NAME_3 := $(BRAM_NAME_BASE)3.bin



.phony: clean hw



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