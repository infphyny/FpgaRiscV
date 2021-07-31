#include "deca_ext_irq.h"

#include "Deca.h" 
#include "SpinalUart.h"
#include <stdlib.h>
#include "riscv.h"

extern SpinalUart* uart;
ICtrl *ictrl;
uint32_t ictrl_flags;
zipcpu_irq external_irq[12];
void empty_irq(void){
    spinal_uart_print_line(uart,"Empty irq called");
     
    }

void deca_external_irq(void)
{
   
  //Disable interrupt
  //ictrl->flags = ictrl->flags&(~0x80000000);
  
  //uint32_t csr_val;
  // csr_val = csr_read(mie);
  // csr_val &= ~(MIE_MEIE);
  // csr_set(mie, csr_val);
  
  //uint32_t flags = ictrl->flags;
 
  //Clear all received interrupt  
  
  //ictrl->flags = 0x00007FFF;
  
  

   //external_irq[ictrl->flags & 0x00000FFF]();
   //ictrl->flags = 1<<i;  
 //  char sint[33];
  // utoa(ictrl->flags,sint,16);
  // spinal_uart_print(uart,"ictrl flags:");
  // spinal_uart_print_line(uart,sint);
  for(uint8_t i = 0 ; i < 12 ; i++)
  {
      if( ( (ictrl->flags>>i) & 0x01)==0x01)
      {
        //ictrl->flags =  0x01<<i;  
        external_irq[i]();
      }
  }
  
  ictrl->flags = (0x00000FFF);//Clear external interrupt flags
  
 // spinal_uart_print_line(uart,"External interrupt");
// csr_val = csr_val | (MIE_MEIE);
// csr_set(mie,csr_val);
}


void deca_external_irq_init(void)
{
    for(uint8_t i = 0 ; i < 12 ; i++)
    {
      external_irq[i] = &empty_irq;    
    }
}