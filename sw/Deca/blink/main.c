/*

  Description :

*/

#include <stdbool.h>
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>


#include "deca_bsp.h"

#include "Leds.h"
#include "SpinalUart.h"


Leds *leds;
SpinalUart* uart;


// struct __FILE
// {
//   int handle;
//   /* Whatever you require here. If the only file you are using is */
//   /* standard output using printf() for debugging, no file handling */
//   /* is required. */
// };
// /* FILE is typedef’d in stdio.h. */
// FILE __stdout;

//void init_machine_timer(void);
//void __attribute__((aligned(4)))mtime_irq(void);


//#define TIMER_TICK_DELAY (BSP_MACHINE_TIMER_HZ)
//void init(void);


//const uint32_t MTIME = 0xBFF8;




// int putc(int ch,FILE* f)
// {
//   /* Your implementation of fputc(). */
//   spinal_uart_print(uart,(const char*)&ch);
//   return ch;
// }
//


void main(void)
{

  //Initialize vtable , machine timer and enable interrupt
  deca_init();

  init_leds(&leds,LEDS_BASE_ADDRESS);
  leds->dir = 0;

  spinal_uart_init(&uart,UART_0_BASE_ADDRESS);

  spinal_uart_print_line(uart,"Machine Timer Test");

 //vtable[7] = mtime_irq;

//spinal_uart_print_line(uart,"end init timer");

  for(;;)
  {
    spinal_uart_print_line(uart,"Led off");
    leds->state = 0x00;
    delay(1000);
    spinal_uart_print_line(uart,"Led on");
    leds->state = 0xFF;
    delay(1000);
  //  printf("Hello world\n");
  }

}
