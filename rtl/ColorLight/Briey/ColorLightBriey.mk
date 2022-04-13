# Project setup
PROJ      = ColorLightBriey

DEVICE    := 25k
PACKAGE   := CABGA256
SPEED     := 6
# IO
LPF       := $(FUSESOC_CORE_DIR)data/ColorLight/Briey/5A75E-V8.lpf
# Top level module
TOP       := ColorLightBriey
# Files
FILES = ColorLightBriey.v ecppll.v

TARGET_FREQUENCY := 25
#PLL

PLL_ICLK := i_clk
CLKIN := 25

CLKOUT0_NAME := o_clk0
CLKOUT_0 := 50

CLKOUT1_NAME := o_clk1
CLKOUT1 := 50
PHASE1 := 0

PLL_MODULE_NAME  := EcpPLL
PLL_MODULE_NAME_2 := EcpPLL2
PLL_FILENAME := ecppll.v


# Yosys cookbook https://github.com/Ravenslofty/yosys-cookbook
# Generate for speed
#yosys -p "synth_ecp5 -abc9 -json filename.json"

#Generate for reduce area
#yosys -p "synth_ecp5 -abc9 -nowidelut -json filename.json"

#Generate for more efficient mapping
#yosys -p "scratchpad -copy abc9.script.flow3 abc9.script; synth_ecp5 -abc9 -json filename.json"


#.PHONY: $(PROJ) clean ipll ipll2 write-flash write-sram



$(PROJ).bit $(PROJ).svf : $(PROJ).config
	ecppack $(PROJ).config $(PROJ).bit
	ecppack $(PROJ).config --svf $(PROJ).svf

$(PROJ).config : $(PROJ).json
	nextpnr-ecp5  -r --$(DEVICE)  --json $< --textcfg $@ --package $(PACKAGE) --speed $(SPEED) --freq $(TARGET_FREQUENCY) --lpf $(LPF)


$(PROJ).json : $(FILES)
	yosys -p "synth_ecp5 -abc9 -top $(TOP) -json $(PROJ).json" $(FILES)



.PHONY: $(PROJ) clean ipll ipll2 write-flash write-sram

#$(PROJ):
	# synthesize using Yosys
#	yosys -p "synth_ecp5 -top $(TOP) -json $(PROJ).json" $(FILES)
	# Place and route using nextpnr




	# Convert to bitstream using ecppack



ipll:
	ecppll --reset  --module $(PLL_MODULE_NAME)  --clkin_name $(PLL_ICLK)  --clkin $(CLKIN) --clkout0_name $(CLKOUT0_NAME) --clkout0 $(CLKOUT_0) --internal_feedback  -f $(PLL_FILENAME)

# clkout0 and clkout1 defined
ipll2:
	ecppll --reset  --module $(PLL_MODULE_NAME_2)  --clkin_name $(PLL_ICLK)  --clkin $(CLKIN) --clkout0_name $(CLKOUT0_NAME) --clkout0 $(CLKOUT_0) --clkout1_name $(CLKOUT1_NAME) --clkout1 $(CLKOUT1) --phase1 $(PHASE1) --internal_feedback  -f $(PLL_FILENAME)

write-flash:
	openFPGALoader --write-flash --bitstream $(PROJ).bit

write-sram:
	openFPGALoader --write-sram --bitstream $(PROJ).bit


clean:
	rm -f *.svf *.bit *.json
