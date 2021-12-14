PROJECT_CORE_PATH := $(abspath $(lastword $(MAKEFILE_LIST))/../../)
PROJECT_CORE_DIR := $(dir $(PROJECT_CORE_PATH))



FILES := $(PROJECT_CORE_DIR)rtl/ResetBridge/FlipFlop.vhdl $(PROJECT_CORE_DIR)rtl/ResetBridge/ResetBridge.vhdl ResetBridgeTestBench.vhdl


tb.vcd : $(FILES)
	ghdl -a --std=08 $(FILES)
	ghdl -e --std=08 ResetBridgeTestBench
	ghdl -r --std=08  ResetBridgeTestBench --max-stack-alloc=10000 --vcd=rb_tb.vcd