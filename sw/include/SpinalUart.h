/*
  Data register first 8 bits or 32 bits base address
  Status register 

*/

#ifndef SPINALUART_H
#define SPINALUART_H


#include <stdint.h>

typedef struct SpinalUart
 {
 
 volatile uint32_t data;
 volatile uint32_t status;

 }SpinalUart; 


void spinal_uart_init(SpinalUart** uart,const uint32_t base_address);
void spinal_uart_transmit(SpinalUart* uart,uint8_t* ptr,uint16_t size);
void spinal_uart_print_line(SpinalUart* uart,const char* s);
void spinal_uart_print(SpinalUart* uart,const char* s);
void spinal_uart_tx(SpinalUart *uart,const char c);


#endif
