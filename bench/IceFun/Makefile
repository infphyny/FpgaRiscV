VERILATOR_ROOT := /usr/local/share/verilator

.PHONY: sim


#sim:
#	verilator  -Od -Wno-WIDTH  -CFLAGS "-O3 -march=native"   --trace-fst -cc ../Murax_iceFUN.v 



MuraxSimuation: MuraxSimulation.cpp obj_dir/VMuraxIceFunSocSim__ALL.a 
   
	g++  -I $(VERILATOR_ROOT)/include/vltstd  \
	 -I $(VERILATOR_ROOT)/include \
	-O3 -march=native  MuraxSimulation.cpp  \
	$(VERILATOR_ROOT)/include/verilated.cpp \
	$(VERILATOR_ROOT)/include/verilated_fst_c.cpp \
	obj_dir/VMuraxIceFunSocSim__ALL.a -lz  -o MuraxSimulation

