#include <stdbool.h>
#include <stdint.h>
#include <stdlib.h>
#include <string.h>

#include "deca_bsp.h"
#include "Leds.h"
#include "SpinalUart.h"

Leds *leds;
SpinalUart* uart;

void main(void)
{
    char sint[33];
    uint32_t *mem = (uint32_t*)DDR3_BASE_ADDRESS;

    deca_init();
    delay(10);
    spinal_uart_init(&uart,UART_0_BASE_ADDRESS);

    init_leds(&leds,LEDS_BASE_ADDRESS);

    leds->state = 0x05;
    
    spinal_uart_print_line(uart,"DDR3 memory test ");

   
   for(;;)
   {
      uint32_t i = 0;
       spinal_uart_print_line(uart,"DDR3 write");
       for(uint32_t j = 0 ; j < 8192 ; j++)
       {
       mem[j*2] = i; 
       i++;
       }
      // delay(1); 
      // spinal_uart_print_line(uart,"DDR3 read");
       for(uint32_t j = 0 ; j < 8192 ; j++ )
       { 
        utoa(mem[j*2],sint,10);
        //delay(1);
        spinal_uart_print(uart,"DDR3 mem value ");
        spinal_uart_print_line(uart,sint);
       }
      
     //  delay(1000);
       leds->state = ~leds->state;
       
   }


}