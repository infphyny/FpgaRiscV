/*

 BUG set prescale value for i2c is sometime incorrect  : opencore version of i2c controller
*/


#include <stdbool.h>
#include <stdint.h>
#include <stdlib.h>
#include <string.h>

#include "SpinalI2c.h"
#include "SpinalUart.h"
//#include "i2c.h"
#include "deca_bsp.h"

#define READ 1
//#define EEPROM_WRITE 1
//void i2c_set_prescaler_test(I2C* i2c, uint32_t freq_in,uint32_t freq_out);

SpinalUart* uart;
SpinalI2C* i2c;

static const uint8_t EEPROM_ADR = 0x50;

void main(void)
{
  bool result;
 char sint[33];
 deca_init();
 char msg[] = "I2C Communication test";
 uint8_t buffer[64];
spinal_uart_init(&uart,UART_0_BASE_ADDRESS);

i2c = (SpinalI2C*)I2C_0_BASE_ADDRESS;

//i2c->sampling_clock_divider = 500;

//i2c_initx(i2c);


//i2c timeout = 50000
//i2c timer_low = 250
//i2c timer_high = 250
//i2c timer_buf = 1000
//i2c tsu_dat = 5
//i2c sampling_clock_divider = 5
// scl freq ~ I2C input clock /(timer_low + timer_high)
spinal_i2c_init(i2c,50000,250,250,1000,5,5);
//Send start stop, not strictly needed but seem to resolve rare random transmission error after a reset.
spinal_i2c_start(i2c,EEPROM_ADR,false);
spinal_i2c_stop(i2c);

delay(10);
// Send eeprom address

uint8_t read_address[] = {0x00,0x00};


//i2c_init(&i2c,I2C_0_BASE_ADDRESS);
//i2c_set_prescaler_test(i2c,50000000,100000);
//i2c_enable(i2c);




#ifdef EEPROM_WRITE
  uint8_t write_data[66];

write_data[0] = 0;
write_data[1] = 0;

for(uint8_t i = 0 ; i < 64 ; i++)
{
  write_data[i+2] = i;
}
 spinal_uart_print_line(uart,"i2c eeprom example");


 i2c_master_transmit(i2c,EEPROM_ADR,write_data,66,true);

 delay(50);//Let some time to eeprom write data

#endif


/*
 for(uint32_t i = 0 ; i < 64 ; i++)
 {
   utoa(data[i],sint,10);
   spinal_uart_print_line(uart,sint);
 }
*/

 for(;;)
 {
   #ifdef READ
   result = spinal_i2c_start(i2c,EEPROM_ADR,false);
   if(result == false)
   {
     spinal_uart_print_line(uart,"i2c_begin_transmissionx error");
   }
   spinal_i2c_write(i2c,read_address,2);
   spinal_i2c_start(i2c,EEPROM_ADR,true);
   spinal_i2c_read(i2c,buffer,strlen(msg));
   spinal_i2c_stop(i2c);

   spinal_uart_print_line(uart,buffer);
    delay(1000);
   #endif
 }


}



// for(uint32_t i = 0 ; i < strlen(msg) ; i++)
// {
//   uint32_t temp;
//   temp = i2c->prescaler_lo;
//   utoa(temp,sint,10);
//   spinal_uart_print_line(uart,sint);
//   temp = i2c->prescaler_hi;
//   utoa(temp,sint,10);
//   spinal_uart_print_line(uart,sint);
//
//   addr = (uint16_t)(i);
//   uint8_t saddr[2] = { (uint8_t)i>>8 , (uint8_t)i  };
//   i2c_master_transmit(i2c,EEPROM_ADR,saddr,2);
//
//   bool result =  i2c_master_receive(i2c,EEPROM_ADR,data,1,true);
//
//   uint8_t zero = 0;
//   i2c_master_transmit(i2c,EEPROM_ADR,&zero,1);
//
//  char c[2];
//  c[0] = data[0];
//  c[1] = '\0';
//  spinal_uart_print_line(uart,c);
//
//  if(result == false)
//  {
//    spinal_uart_print_line(uart,"Unable to read eeprom");
//  }
//
// }
// delay(200);

//
//
// void i2c_set_prescaler_test(I2C* i2c, uint32_t freq_in,uint32_t freq_out)
// {
//   uint32_t prescale;
//   prescale = (freq_in/(freq_out*5)) - 1;
//   //uint8_t* p = (uint8_t*)&prescale;
//   char sint[31];
//   spinal_uart_print_line(uart,sint);
//   utoa(prescale,sint,10);
//   if(prescale != 99)
//   {
//      spinal_uart_print_line(uart,"Prescale Error");
//     for(;;){}
//   }
//
//   i2c->prescaler_lo = (uint8_t)prescale>>8;
//   i2c->prescaler_hi = (uint8_t)prescale;
//
// }
