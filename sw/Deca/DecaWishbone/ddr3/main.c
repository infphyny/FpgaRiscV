#include <stdbool.h>
#include <stdint.h>
#include <stdlib.h>
#include <string.h>

#include "deca_bsp.h"
#include "Leds.h"
#include "SpinalUart.h"

//#define SIM = 1


Leds *leds;
SpinalUart* uart;
volatile uint8_t* ddr3manager;




void main(void)
{

   deca_init();

    ddr3manager = (uint8_t*)DDR3MANAGER_BASE_ADDRESS;

    char sint[33];
    uint32_t *mem = (uint32_t*)DDR3_BASE_ADDRESS;


    //delay(10);
    spinal_uart_init(&uart,UART_0_BASE_ADDRESS);

    init_leds(&leds,LEDS_BASE_ADDRESS);

    leds->state = 0x05;

    spinal_uart_print_line(uart,"DDR3 memory test ");

   //Pull ddr3_soft_reset_n high
    *ddr3manager |= 0x04;

    spinal_uart_print_line(uart,"Wait for ddr3 memory to calibrate ");

    while( ((*ddr3manager)&0x03)!= 0x03 )
    {
    }
   spinal_uart_print_line(uart,"ddr3 memory to calibrated ");
   for(;;)
   {
      #ifdef SIM
      const uint32_t MAX_LOOP = 10;
      #else
      const uint32_t MAX_LOOP = 10000000;
      #endif

       spinal_uart_print_line(uart,"DDR3 write");
       leds->state = ~leds->state;
       for(uint32_t j = 0 ; j < MAX_LOOP ; j++)
       {
       mem[j] = j;
       }
       leds->state = ~leds->state;

       spinal_uart_print_line(uart,"DDR3 read");
       for(uint32_t j = 0 ; j < MAX_LOOP ; j++ )
       {

         if(mem[j] != j)
         {


           spinal_uart_print(uart,"j = ");
           utoa(j,sint,10);
           spinal_uart_print(uart,sint);
           spinal_uart_print(uart, ":  mem[j]= ");

           utoa(mem[j],sint,10);
           spinal_uart_print_line(uart,sint);
         }

       // spinal_uart_print(uart,"DDR3 mem value ");

       }

     //  delay(1000);


   }


}
