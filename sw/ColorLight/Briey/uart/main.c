#include <stdbool.h>
#include <stdint.h>
#include <stdlib.h>
#include <string.h>


#include "ColorLightBriey.h"

#include "SpinalUart.h"
#include "LedsCtrl.h"

const size_t SDRAM_SIZE = 8388608;

SpinalUart *uart;
LedsCtrl* led;

uint32_t *ram = (uint32_t*)SDRAM;

void main(void)
{
  size_t it = 0;
  led = (LedsCtrl*)LED_CTRL;
  led->value = 0x00;
  spinal_uart_init(&uart,UART_0);
  
 // ram[1] = '.';
 // ram[2] = 'C';

   uint32_t counter = 0;
    for(;;)
    {  
       if(counter == 1000000)
       { 
         ram[it] = it;    
         char sint[16];
         itoa(ram[it],sint,10);   
           
         spinal_uart_print_line(uart,sint/*"Uart test"*/);

      
         led->value = ~led->value;
          it++;
          it%=SDRAM_SIZE;
        
         counter = 0;
       }
       
       counter++; 
    }
}