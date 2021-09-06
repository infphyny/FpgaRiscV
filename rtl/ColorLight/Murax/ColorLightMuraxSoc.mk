PROJ      := Murax

DEVICE    := 25k
SPEED	  := 8  #6,7,8
PACKAGE   := CABGA256

LPF       := $(FUSESOC_CORE_DIR)data/ColorLight/Murax/5A75E-V8.lpf
# Top level module
TOP       := ColorLightMuraxSoc
# Files
FILES := $(HW_DIR)ColorLightMuraxSoc.v $(HW_DIR)ecppll.v

TARGET_FREQUENCY := 60

PLL_ICLK := mainClk
CLKIN := 25

CLKOUT0_NAME := soc_clk 
CLKOUT_0 := 45

CLKOUT1_NAME := sdram_clock
CLKOUT1 := 80
PHASE1 := 90 


PLL_MODULE_NAME := ecppll
PLL_FILENAME := ecppll.v


$(PROJ).bit :  $(PROJ).config ColorLightMuraxSoc.mk
	ecppack $< $@

$(PROJ).config : $(PROJ).json ColorLightMuraxSoc.mk
	nextpnr-ecp5  -r --$(DEVICE)  --json $(HW_DIR)$(PROJ).json --textcfg $(HW_DIR)$(PROJ).config --package $(PACKAGE) --speed $(SPEED) --freq $(TARGET_FREQUENCY) --lpf $(LPF) 

$(PROJ).json : $(FILES) ColorLightMuraxSoc.mk
	yosys -p "synth_ecp5 -top $(TOP) -json $(PROJ).json" $(FILES)


#.phony : ipll
