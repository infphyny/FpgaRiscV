# Build riscv hex file: make
# Build bitstream : 								make hw
# Build software                    make
# update ram                        make update_ram
# Reload to bitstream to fpga sram: make upload
# Simulate the design: 							make sim   + ctrl-c after a few second =>
#																		the generated .vcd grow fast.
#
PROJ = capsens
#Set path relative to current path
DECA_DIR = ..
SW_DIR = ../..

#PROJ_OBJ := i2c_debug.o
#
FUSESOC_CORE_PATH := $(abspath $(lastword $(MAKEFILE_LIST))/../../../)
FUSESOC_CORE_DIR := $(dir $(FUSESOC_CORE_PATH))
#FUSESOC_CORE_DIR := $(abspath $(dir $(firstword $(MAKEFILE_LIST)))/../../../) #$(shell pwd)

include ../common.mk
