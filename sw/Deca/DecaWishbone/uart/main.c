#include <stdbool.h>
#include <stdint.h>
#include <stdlib.h>

#include "../include/Deca.h"
#include "SpinalUart.h"

#include "../include/deca_bsp.h"

void main(void)
{
  deca_init();
  SpinalUart* uart; 
  spinal_uart_init(&uart,UART_0_BASE_ADDRESS);

  for (;;)
  {
  	spinal_uart_print_line(uart,"Hello World!");
  }

}
