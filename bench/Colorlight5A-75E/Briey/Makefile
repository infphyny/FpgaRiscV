VERILATOR_ROOT := /usr/local/share/verilator

#.PHONY: sim

HW_DIR := ../../../rtl/ColorLight/Briey/

.PHONY: all

#sim:
#	verilator  -Od -Wno-WIDTH  -CFLAGS "-O3 -march=native"   --trace-fst -cc ../Murax_iceFUN.v 


#obj_dir/VColorLightBriey__ALL.a :  $(HW_DIR)ColorLightBriey.v

all:
	verilator  -Od -Wno-WIDTH -Wno-fatal   -CFLAGS "-O3 -march=native"   --trace-fst -cc  $(HW_DIR)ColorLightBriey.v
	cd obj_dir; $(MAKE) -f VColorLightBriey.mk 
	          
#ColorLightBrieySimuation: BrieySimulation.cpp obj_dir/VMuraxIceFunSocSim__ALL.a 
	g++  -I $(VERILATOR_ROOT)/include/vltstd  \
	 -I $(VERILATOR_ROOT)/include \
	-O3 -march=native  BrieySimulation.cpp \
	$(VERILATOR_ROOT)/include/verilated.cpp \
	$(VERILATOR_ROOT)/include/verilated_fst_c.cpp \
	obj_dir/VColorLightBriey__ALL.a -lz  -o sim

