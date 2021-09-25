PROJECT_NAME := blink

FUSESOC_CORE_PATH := $(abspath $(lastword $(MAKEFILE_LIST))/../../../../)
FUSESOC_CORE_DIR := $(dir $(FUSESOC_CORE_PATH))
FUSESOC_BUILD_PATH := $(FUSESOC_CORE_DIR)build/ColorLight_0/ColorLightBriey-5A75E-V8-trellis
HW_DIR = $(FUSESOC_CORE_DIR)rtl/ColorLight/Briey/
BRIEY_SW_DIR = $(FUSESOC_CORE_DIR)sw/ColorLight/Briey/


#SW_PATH := $(abspath $(lastword $(MAKEFILE_LIST))/../../..)
SW_DIR :=  $(FUSESOC_CORE_DIR)sw/


SOURCES := main.cpp

PROJECT_OBJ = main.o  $(SW_DIR)src/SpinalUart.o 

ARCH := rv32imc
OPT := -Os


#include ../fusesoc_defs.mk
include $(FUSESOC_CORE_DIR)sw/ColorLight/Briey/colorlight_briey.mk
include $(FUSESOC_CORE_DIR)sw/common.mk