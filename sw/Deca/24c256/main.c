#include <stdbool.h>
#include <stdint.h>
#include <stdlib.h>

#include "SpinalUart.h"
#include "i2c.h"
#include "deca_bsp.h"


//#define EEPROM_WRITE 1


SpinalUart* uart;
I2C* i2c;

static const uint8_t EEPROM_ADR = 0xA0;

void main(void)
{
 char sint[33];
 deca_init();

spinal_uart_init(&uart,UART_0_BASE_ADDRESS);
i2c_init(&i2c,I2C_0_BASE_ADDRESS);
i2c_set_prescaler(i2c,75000000,100000);
i2c_enable(i2c);
bool write_test = false;

 //Read byte
 uint16_t addr = 0x0000;
 uint8_t data[64];


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


 i2c_master_transmit(i2c,EEPROM_ADR,(uint8_t*)&addr,2,false);
 bool result =  i2c_master_receive(i2c,EEPROM_ADR,data,64,true);


 if(result == false)
 {
   spinal_uart_print_line(uart,"Unable to read eeprom");
 }

 for(uint32_t i = 0 ; i < 64 ; i++)
 {
   utoa(data[i],sint,10);
   spinal_uart_print_line(uart,sint);
 }



 for(;;)
 {

 }


}
