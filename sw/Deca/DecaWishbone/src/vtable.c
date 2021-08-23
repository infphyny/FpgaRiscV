#include "vtable.h"
#include <stddef.h>
#include <stdint.h>
#include "deca_ext_irq.h"
 irq vtable[32];

void dummy_irq(void){}

void set_vtable_irq(uint8_t i,irq f)
{
  vtable[i] = f;
}


void init_vtable(void)
{
  //See ... for vector table interrupt layout
  for(size_t i = 0 ; i < 32 ; i++)
  {
    vtable[i] = &dummy_irq;
  }
}

void handle_trap(){
  
  // ictrl_flags =  ictrl->flags;
  // ictrl->flags = (0x00000FFF);//Clear external interrupt flags

 // csr_clear(mstatus,MSTATUS_MIE);
 // csr_clear(mie, MIE_MTIE | MIE_MEIE);
  // riscv_disable_interrupt();
   int32_t mcause = csr_read(mcause);
   int32_t irq = mcause < 0;
   char sint[16];
  uint32_t  mcause_val = mcause&0x7FFFFFFF;
//   itoa((int)(mcause&0x7FFFFFFF),sint,16);
//    spinal_uart_print(uart,"mcause value: ");
//spinal_uart_print_line(uart,sint);



 if(irq && (mcause_val<32) )
 {
   (*vtable[mcause_val])();
 }
// csr_set(mstatus,MSTATUS_MIE);
// csr_set(mie, MIE_MTIE | MIE_MEIE);
 //riscv_enable_interrupt();
//   spinal_uart_print_line(uart,"end vtable call");
/*
  if(mcause & MCAUSE_INT)
  {

  }
*/
//     int32_t interrupt = mcause < 0;    //Interrupt if true, exception if false
//     int32_t cause     = mcause & 0xF;
//     if(interrupt){
//         switch(cause){
//         case CAUSE_MACHINE_TIMER: timerInterrupt(); break;
//         case CAUSE_MACHINE_EXTERNAL: externalInterrupt(); break;
//         default: crash(); break;
//         }
//     } else {
//         crash();
//     }
}
