PROJECT_NAME := uart

FUSESOC_CORE_PATH := $(abspath $(lastword $(MAKEFILE_LIST))/../../../..)
FUSESOC_CORE_DIR := $(dir $(FUSESOC_CORE_PATH))
FUSESOC_BUILD_PATH := $(FUSESOC_CORE_DIR)/build/DecaMurax_0/DecaMurax-quartus

SW_PATH := $(abspath $(lastword $(MAKEFILE_LIST))/../../..)
SW_DIR :=  $(dir $(SW_PATH))

#SOURCE := main.cpp

PROJECT_OBJ = main.o  $(SW_DIR)/src/SpinalUart.o

include ../common.mk
