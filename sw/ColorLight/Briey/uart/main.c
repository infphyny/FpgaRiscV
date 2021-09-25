#include <stdbool.h>
#include <stdint.h>
#include <stdlib.h>



#include "ColorLightBriey.h"

#include "SpinalUart.h"
#include "LedsCtrl.h"


SpinalUart *uart;
LedsCtrl* led;

char* ram = (char*)SDRAM;

void main(void)
{
  led = (LedsCtrl*)LED_CTRL;
  led->value = 0x00;
  spinal_uart_init(&uart,UART_0);
  
   uint32_t counter = 0;
    for(;;)
    {
       if(counter == 1000000)
       { 
         spinal_uart_print_line(uart,"Uart test");
         led->value = ~led->value;
         counter = 0;
       }
       
       counter++; 
    }
}