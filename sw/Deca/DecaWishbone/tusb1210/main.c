#include <stdbool.h>
#include <stdlib.h>
#include <stdlib.h>

#include "SpinalUart.h"
#include "deca_bsp.h"


static const uint8_t TUSB1210_STATUS_DIR = 0x01; // 0 => CPU | LINK can send, 1 => CPU | LINK receive
static const uint8_t TUSB1210_STATUS_FAULT_n = 0x02;
static const uint8_t TUSB1210_STATUS_NXT = 0x04;
static const uint8_t TUSB1210_STATUS_CS = 0x10;
static const uint8_t TUSB1210_STATUS_RESET_n = 0x08;



typedef struct TUSB1210
{
  
  union
  {
  volatile  uint8_t wr;
  volatile  uint8_t rd;
  };

  volatile uint8_t status;

}TUSB1210;


SpinalUart* uart;
TUSB1210* tusb1210;


void print_tusb1210_status(SpinalUart* uart,TUSB1210* tusb1210);


void main(void)
{
  char sint[33];
  uint32_t temp; 
  deca_init();
   
  spinal_uart_init(&uart,UART_0_BASE_ADDRESS);
  delay(1);
  spinal_uart_print_line(uart,"TUSB1210 demo");
  tusb1210 = (TUSB1210*)TUSB1210_BASE_ADDRESS;
  spinal_uart_print_line(uart,"Set TUSB1210 controller status flags ");
  tusb1210->status = TUSB1210_STATUS_CS|TUSB1210_STATUS_RESET_n;
  

  //spinal_uart_print_line(uart,"Set TUSB1210 stop signal");
  //tusb1210->status |= TUSB1210_STP;
/*
  while( (tusb1210->status & TUSB1210_DIR) == TUSB1210_DIR )
  {
    spinal_uart_print_line(uart,"TUSB1210 DIR signal is high");
  }
  */


  //spinal_uart_print_line(uart,"Unset TUSB1210 stop signal");
  //tusb1210->status =  tusb1210->status & ~TUSB1210_STP;
  
  spinal_uart_print_line(uart,"Read TUSB1210 controller status flags ");
  temp = tusb1210->status;
  itoa(temp,sint,16);
  spinal_uart_print_line(uart,sint);
  //spinal_uart_print_line(uart,sint);
  
  tusb1210->wr = 0b11000000;
  delay(1);

  temp = tusb1210->rd;
  utoa(temp,sint,16);
  spinal_uart_print_line(uart,sint);  

  print_tusb1210_status(uart,tusb1210);


  temp = tusb1210->rd;
  utoa(temp,sint,16);
  spinal_uart_print_line(uart,sint);  

  for(;;)
  {
    
  }

}

void print_tusb1210_status(SpinalUart* uart,TUSB1210* tusb1210)
{
  char sint[33];
  uint32_t temp; 
  temp = tusb1210->status;
  itoa(temp,sint,16);
  spinal_uart_print_line(uart,sint);
}