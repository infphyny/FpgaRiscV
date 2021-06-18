#From https://github.com/BrunoLevy/learn-fpga/blob/master/FemtoRV/TUTORIALS/software.md
#Initiaze the C runtime
#.section .init, "ax"
#.section .text.startup

.text
.global _start
#.type _start, @function

_start:
.cfi_startproc
.cfi_undefined ra
#https://github.com/Obijuan/RISC-V-FPGA/blob/master/firmware/soc-demo/src-c/start.s

#addi x1, zero, 0
#addi x3, zero, 0
#addi x4, zero, 0
#addi x5, zero, 0
#addi x6, zero, 0
#addi x7, zero, 0
#addi x8, zero, 0
#addi x9, zero, 0
#addi x10, zero, 0
#addi x11, zero, 0
#addi x12, zero, 0
#addi x13, zero, 0
#addi x14, zero, 0
#addi x15, zero, 0
#addi x16, zero, 0
#addi x17, zero, 0
#addi x18, zero, 0
#addi x19, zero, 0
#addi x20, zero, 0
#addi x21, zero, 0
#addi x22, zero, 0
#addi x23, zero, 0
#addi x24, zero, 0
#addi x25, zero, 0
#addi x26, zero, 0
#addi x27, zero, 0
#addi x28, zero, 0
#addi x29, zero, 0
#addi x30, zero, 0
#addi x31, zero, 0


.option push
.option norelax

 li gp, 0x10000  #la
 .option pop
 li sp, 0x20000  #la
 add s0, sp, zero
 jal zero, main
.cfi_endproc
 .end

 # li gp,0x1000 #put global pointer at middle of ram space
 #    la gp, __global_pointer$     
#.option pop

#  li sp,0x2000  # initialize stack pointer in hdl code
   #  lw sp,0x4000      # Read RAM size in hw config register and
        #   initialize SP one position past end of RAM
	
     # Should find a way of clearing BSS here...
	
#   call main
    # tail exit
