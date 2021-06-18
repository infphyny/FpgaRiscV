#include <stdbool.h>
#include <stdint.h>
#include <stdlib.h>
#include <string.h>

#include "deca_bsp.h"
#include "MicroWire.h"
#include "SpinalUart.h"
#include "LM71.h"




//void test_temp_sensor(SpinalUart *uart,MicroWire* mw);


void main(void)
{

 deca_init();

 char sint[33];
 char manufacturer[4];
  uint8_t temp[4];
  temp[2] = 0;
  temp[3] = 0;
  int* t = (int*)&temp[0];
 uint8_t flags;

 MicroWire* mw = (MicroWire*)(TEMP_SENSOR_BASE_ADDRESS);

 micro_wire_clear_status(mw);

 micro_wire_set_divider(mw,0xFFFF);

 SpinalUart* uart;
 spinal_uart_init(&uart,UART_0_BASE_ADDRESS);

 spinal_uart_print_line(uart,"Test temp sensor");

 lm71_convert_temp(0xEC03,sint); //
 spinal_uart_print_line(uart,sint);
 lm71_convert_temp(0xF383,sint); //
 spinal_uart_print_line(uart,sint);
 lm71_convert_temp(0xFFFF,sint); //
 spinal_uart_print_line(uart,sint);
 lm71_convert_temp(0x0003,sint); //
 spinal_uart_print_line(uart,sint);
 lm71_convert_temp(0x0007,sint); //
 spinal_uart_print_line(uart,sint);
 lm71_convert_temp(0x0C83,sint); //
 spinal_uart_print_line(uart,sint);
 lm71_convert_temp(0x3E83,sint); //
 spinal_uart_print_line(uart,sint);
 lm71_convert_temp(0x4B03,sint); //
 spinal_uart_print_line(uart,sint);

  delay(1000);

//Read manufacturer data should be 0x800F
  lm71_shutdown_mode(mw,sint);
  spinal_uart_print_line(uart,sint);
  lm71_conversion_mode(mw,manufacturer);
  spinal_uart_print_line(uart,manufacturer);


//  test_temp_sensor(uart,mw);

 //Read temp sensor
  for(;;)
   {
   delay(500);
   lm71_read_temperature(mw,sint);
   spinal_uart_print_line(uart,sint);
   }

}


/*
void test_temp_sensor(SpinalUart *uart,MicroWire* mw)
{
   char temperature[16];
   char manufacturer[16];
   uint8_t temp[4];
   temp[2] = 0;
   temp[3] = 0;
   int* t = (int*)&temp[0];
  delay();

  micro_wire_set_status(mw,MW_STATUS_CS);

  //Receive temperature
  micro_wire_unset_status(mw,MW_STATUS_SEND);
  micro_wire_recv(mw,&temp[1]);
  micro_wire_recv(mw,&temp[0]);
   itoa(*t,temperature,16);


  micro_wire_set_status(mw,MW_STATUS_SEND);
  micro_wire_send(mw,0xFF);
  micro_wire_send(mw,0xFF);

  micro_wire_unset_status(mw,MW_STATUS_SEND);


  //Read manufacturer
  micro_wire_recv(mw,&temp[1]);
  micro_wire_recv(mw,&temp[0]);
  itoa(*t,manufacturer,16);


  //Restart continuous temp sampling

  micro_wire_set_status(mw,MW_STATUS_SEND);
  micro_wire_send(mw,0x00);
  micro_wire_send(mw,0x00);


  micro_wire_unset_status(mw,MW_STATUS_SEND);
  micro_wire_unset_status(mw,MW_STATUS_CS);

  //char test = &temp[0];

  spinal_uart_print(uart,"Temperature: ");
  spinal_uart_print_line(uart,temperature);
  spinal_uart_print(uart,"Manufacturer: ");
  spinal_uart_print_line(uart,manufacturer);


}
*/
