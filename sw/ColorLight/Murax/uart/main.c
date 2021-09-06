#include <stdbool.h>
#include <stdint.h>
#include <stdlib.h>


#include "ColorlightMurax.h"

#include "SpinalUart.h"

SpinalUart* uart;

void main(void)
{
  
   spinal_uart_init(&uart,UART_0);

    for(;;)
    {
       spinal_uart_print_line(uart,"ColorLight uart example");
    }
}

