$(BRAM_NAME_BASE)0.bin $(BRAM_NAME_BASE)1.bin $(BRAM_NAME_BASE)2.bin $(BRAM_NAME_BASE)3.bin : $(PROJECT_NAME)_0.hex $(PROJECT_NAME)_1.hex $(PROJECT_NAME)_2.hex $(PROJECT_NAME)_3.hex
	python $(HEX2BIN) $(PROJECT_NAME)_0.hex $(BRAM_NAME_BASE)0.bin
	python $(HEX2BIN) $(PROJECT_NAME)_1.hex $(BRAM_NAME_BASE)1.bin
	python $(HEX2BIN) $(PROJECT_NAME)_2.hex $(BRAM_NAME_BASE)2.bin
	python $(HEX2BIN) $(PROJECT_NAME)_3.hex $(BRAM_NAME_BASE)3.bin
#$(PROJECT_NAME)_1.bin : $(PROJECT_NAME)_1.hex
#	python $(HEX2BIN) $< $@

#$(PROJECT_NAME)_2.bin : $(PROJECT_NAME)_2.hex
#	python $(HEX2BIN) $< $@

#$(PROJECT_NAME)_3.bin : $(PROJECT_NAME)_3.hex
#	python $(HEX2BIN) $< $@