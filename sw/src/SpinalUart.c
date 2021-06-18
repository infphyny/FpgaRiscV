#include "SpinalUart.h"

void spinal_uart_init(SpinalUart** uart,const uint32_t base_address)
{

	*uart = (SpinalUart*) base_address;

}

void spinal_uart_print_line(SpinalUart* uart,const char* s)
{
   spinal_uart_print(uart,s);
   spinal_uart_tx(uart,'\n');
}

void spinal_uart_transmit(SpinalUart* uart,uint8_t* ptr,uint16_t size)
{
	for(uint16_t i = 0 ; i < size ; i++)
	{
		spinal_uart_tx(uart,(char)ptr[i]);
	}
}

void spinal_uart_tx(SpinalUart* uart,const char c)
{


while(  ( (uint8_t)(  ((uart->status) >>16)&0x000001F )  != (uint8_t)0x10) )
{

}

  uint8_t *send = (uint8_t*)&uart->data;
  *send = c;
	/*
	while(  ( (uint8_t)(  ((uart->status) >>16)&0x000001F )  == (uint8_t)0x0F) )
	{

	}
*/
}



void spinal_uart_print(SpinalUart* uart,const char* s)
{
  uint32_t i = 0;
  while(s[i] != '\0')
  {
    spinal_uart_tx(uart,s[i]);
    i++;
  }

}
