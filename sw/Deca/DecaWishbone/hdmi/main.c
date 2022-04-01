/*
EDID: ADV7513 programming guide

Programming guide p.14
 Power Up sequence:
0x98  R/W [7:0] 00001011  Fixed Must be set to 0x03 for proper operation
0x9A  R/W [7:1] 0000000*  Fixed Must be set to 0b1110000
0x9C  R/W [7:0] 01011010  FixedMust be set to 0x30 for proper operation
0x9D  R/W [1:0] ******00  FixedMust be set to 0b01 for proper operation
0xA2  R/W [7:0] 10000000  Fixed Must be set to 0xA4 for proper operation
0xA3  R/W [7:0] 10000000  Fixed Must be set to 0xA4 for proper operation
0xE0  R/W [7:0] 10000000  FixedMust be set to 0xD0 for proper operation
0xF9  R/W [7:0] 01111100  FixedMust be set to 0x00 for proper operation



*/

#include <stdbool.h>
#include <stdint.h>
#include <stdlib.h>
#include <string.h>

#include "deca_bsp.h"
#include "SpinalUart.h"
#include "SpinalI2c.h"


SpinalUart* uart;
SpinalI2C* i2c;

const uint8_t ADV7513_I2C_ADR_MAIN = 0x39;
const uint8_t ADV7513_EDID_MEM_ADR = 0x43;

const uint8_t ADV7513_CHIP_REVISION = 0x00;


void main(void)
{
  uint8_t adv_7513_init_reg[] = {0x98,0x9A,0x9C,0x9D,0xA2,0xA3,0xE0,0xF9};
  uint8_t adv_7513_init_val[] = {0x03,0xE0,0x30,0x01,0xA4,0xA4,0xD0,0x00};
  char sint[32];
  uint8_t buffer[32];
  memset(buffer,0,32);
  uint32_t* t = (uint32_t*)&buffer[0];
  deca_init();
  spinal_uart_init(&uart,UART_0_BASE_ADDRESS);

  i2c = (SpinalI2C*)HDMI_TX_BASE_ADDRESS;
  spinal_i2c_init(i2c,50000,250,250,1000,5,5);

  spinal_uart_print_line(uart,"HDMI test");



  //Read revision of the chip
  delay(500);
  /*
  while(!spinal_i2c_start(i2c,ADV7513_I2C_ADR_0,SPINAL_I2C_WRITE))
  {
    for(uint32_t i=0;i<I2C_MAX_TRIES && (i2c->master_status & I2C_MASTER_IS_BUSY);i++) {}
  }*/
  //Initialization sequence

  for(uint32_t i = 0 ; i < 8 ; i++)
  {
  spinal_i2c_poll_start(i2c,ADV7513_I2C_ADR_MAIN,SPINAL_I2C_WRITE,64);
  spinal_i2c_write(i2c,&adv_7513_init_reg[i],1);
  spinal_i2c_write(i2c,&adv_7513_init_val[i],1);
  spinal_i2c_stop(i2c);
  delay(1);
  }

/*
  spinal_i2c_start(i2c,ADV7513_I2C_ADR_MAIN,SPINAL_I2C_WRITE);
  spinal_i2c_stop(i2c);
  delay(10);
*/
//uint adr = 0x43;
  spinal_i2c_poll_start(i2c,ADV7513_I2C_ADR_MAIN,SPINAL_I2C_WRITE,64);
  spinal_i2c_write(i2c,&ADV7513_CHIP_REVISION/*&ADV7513_CHIP_REVISION*/,1);
  //delay(10);
  for(uint32_t i=0;i<I2C_MAX_TRIES && (i2c->master_status & I2C_MASTER_IS_BUSY);i++) {};
  spinal_i2c_start(i2c,ADV7513_I2C_ADR_MAIN,SPINAL_I2C_READ);
  spinal_i2c_read(i2c,&buffer[0],1);
  spinal_i2c_stop(i2c);

  utoa(*t,sint,2);
  spinal_uart_print(uart,"ADV7513 chip revision: 0b");

  spinal_uart_print_line(uart,sint);

  spinal_uart_print_line(uart,"Retreiving monitor information");
  for(;;)
  {

  }

}
