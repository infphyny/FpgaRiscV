# Build riscv hex file: make
# Build bitstream : 								make hw
# Reload to bitstream to fpga sram: make upload
# Simulate the design: 							make sim   + ctrl-c after a few second =>
#																		the generated .vcd grow fast.
#
PROJ = uart
#Set path relative to current path
DECA_DIR = ..
SW_DIR = ../..
#
FUSESOC_CORE_PATH := $(abspath $(lastword $(MAKEFILE_LIST))/../../../)
FUSESOC_CORE_DIR := $(dir $(FUSESOC_CORE_PATH))

include ../common.mk
