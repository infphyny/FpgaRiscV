# From https://github.com/BrunoLevy/learn-fpga/blob/master/FemtoRV/TUTORIALS/software.md
# Initiaze the C runtime
# .section .init, "ax"
# .section .text.startup

.section .init
.global _start
#.type _start, @function

_start:
.cfi_startproc
.cfi_undefined ra

.option push
.option norelax

 li gp, 0x10000  #la
 .option pop
 li sp, 0x20000  #la
 add s0, sp, zero
 # addi x0,x0,0
 jal zero, main
.cfi_endproc
 .end

 # li gp,0x1000 #put global pointer at middle of ram space
 #    la gp, __global_pointer$
# .option pop

#  li sp,0x2000  # initialize stack pointer in hdl code
   #  lw sp,0x4000      # Read RAM size in hw config register and
        #   initialize SP one position past end of RAM

     # Should find a way of clearing BSS here...

#   call main
    # tail exit
