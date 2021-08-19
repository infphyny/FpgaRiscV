
PROJECT_NAME := uart

FUSESOC_CORE_PATH := $(abspath $(lastword $(MAKEFILE_LIST))/../../../)
FUSESOC_CORE_DIR := $(dir $(FUSESOC_CORE_PATH))
FUSESOC_BUILD_PATH := $(FUSESOC_CORE_DIR)/build/IceFun_0/MuraxIceFun-icestorm
ICEFUN_HW_DIR := $(FUSESOC_CORE_DIR)/rtl/IceFun
SW_PATH := $(abspath $(lastword $(MAKEFILE_LIST))/../../)
SW_DIR :=  $(dir $(SW_PATH))


SOURCE := main.cpp



include ../common.mk
