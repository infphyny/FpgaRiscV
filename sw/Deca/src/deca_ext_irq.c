#include "deca_ext_irq.h"

#include "Deca.h" 
#include "SpinalUart.h"
#include <stdlib.h>

extern SpinalUart* uart;
ICtrl *ictrl;
zipcpu_irq external_irq[12];
void empty_irq(void){
    spinal_uart_print_line(uart,"Empty irq called");
     
    }

void deca_external_irq(void)
{
  //Clear all received interrupt  
  
  //ictrl->flags = 0x00007FFF;
  
  

   //external_irq[ictrl->flags & 0x00000FFF]();
   //ictrl->flags = 1<<i;  
   char sint[33];
   //utoa(ictrl->flags,sint,16);
   //spinal_uart_print(uart,"ictrl flags:");
   //spinal_uart_print_line(uart,sint);
  for(uint8_t i = 0 ; i < 12 ; i++)
  {
      if( ( (ictrl->flags>>i) & 0x01))
      {
        ictrl->flags = 1<<i;  
        external_irq[i]();
      }
  }
  

 // spinal_uart_print_line(uart,"External interrupt");

}


void deca_external_irq_init(void)
{
    for(uint8_t i = 0 ; i < 12 ; i++)
    {
      external_irq[i] = &empty_irq;    
    }
}