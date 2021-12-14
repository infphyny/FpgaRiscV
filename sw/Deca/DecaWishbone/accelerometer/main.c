#include <stdbool.h>
#include <stdint.h>
#include <stdlib.h>
#include <string.h>

#include "deca_bsp.h"
//#include "Deca.h"
#include "Leds.h"
#include "SimpleSpi.h"
#include "SpinalUart.h"
#include "LIS2DH12.h"
Leds *leds;
void set_leds(const int16_t x,uint8_t *leds);

void main(void)
{

  deca_init();

  uint8_t leds_val;
  char sint[33];
  uint8_t gsensor_status = 0x00;
  uint8_t reg_value;
  int16_t x,y,z;

  init_leds(&leds,LEDS_BASE_ADDRESS);
  leds->dir = 0;


  leds->state = 0xA5;

  SpinalUart* uart;
  spinal_uart_init(&uart,UART_0_BASE_ADDRESS);

  SimpleSpi* gsensor_spi;
  
//  leds->state = 0xAF;
  //delay(500);
//  leds->state = 0xEE;
 //Enable acceleration sensor high resolution mode
 simple_spi_init(&gsensor_spi,GSENSOR_BASE_ADDRESS);
 //TODO Add documentation for SPI controller settings
   gsensor_spi->ctrl = 0x7F;
   gsensor_spi->ctrl_ext = 0x00;
  do
  {
   
  // delay(100);
   //lis2dh12_read_sensor(gsensor_spi,LIS2DH12_CTRL_REG4,&reg_value);
  reg_value = (0x08);
  lis2dh12_write_sensor(gsensor_spi,LIS2DH12_CTRL_REG4,reg_value);

  //Set CTRL_REG1 (20h)
  //
  lis2dh12_write_sensor(gsensor_spi,LIS2DH12_CTRL_REG1,0x27);

  lis2dh12_who_am_i(gsensor_spi,&leds_val);
   if(leds_val != 0b00110011)
   {
     lis2dh12_who_am_i(gsensor_spi,&leds_val);
   }
  int lv = leds_val;
  itoa(lv,sint,10);
  spinal_uart_print_line(uart,sint);
  delay(100);
  } while (leds_val != 0b00110011);
  
  
  leds->state = leds_val;
  for(;;)
  {
    //delay(10);
  
    lis2dh12_read_status(gsensor_spi,&gsensor_status);
    spinal_uart_print(uart,"Status: ");
    itoa(gsensor_status,sint,10);
    //spinal_uart_transmit(uart,(uint8_t*)sint,strlen(sint));
    //spinal_uart_tx(uart,'\0');
    spinal_uart_print_line(uart,sint);

    if( (gsensor_status & 0x01) == 0x01)
    {

      lis2dh12_read_sensor_x(gsensor_spi,&x);

    }
    if( (gsensor_status &0x02) == 0x02)
    {

      lis2dh12_read_sensor_y(gsensor_spi,&y);

    }
    if((gsensor_status &0x04) == 0x04 )
    {

      lis2dh12_read_sensor_z(gsensor_spi,&z);

    }


   if(gsensor_status != 0)
   {

     itoa(x,sint,10);
     spinal_uart_print(uart,"x: ");
     spinal_uart_print_line(uart,sint);
     itoa(y,sint,10);
     spinal_uart_print(uart,"y: ");
     spinal_uart_print_line(uart,sint);
     itoa(z,sint,10);
     spinal_uart_print(uart,"z: ");
     spinal_uart_print_line(uart,sint);

    set_leds(x,&(leds_val));
    leds->state = leds_val;

   }
    //lis2dh12_who_am_i(gsensor_spi,leds);
    //spinal_uart_print_line(uart,"Hello World");
  }


}

void set_leds(const int16_t x,uint8_t *leds)
{
  if( x<-14000)
 {
   *leds = 0x80;
 }
 else if( (x>= -14000) && (x < -10000) )
 {
  *leds = 0x40;
 }else if( (x>= -10000) && x < -6000  )
 {
   *leds = 0x20;
 }
 else if( ( x>= -6000) && x < -2000)
 {
   *leds = 0x10;
 }
 else if(  (x>=-2000) &&  x<2000 )
 {
   *leds = 0x18;
 }else if(x>= 2000 && (x < 6000))
 {
  *leds = 0x08;
 }else if(x>=6000 && (x<10000))
 {
  *leds = 0x04;
 }
 else if( (x>=10000) && (x<14000) )
 {
  *leds = 0x02;
 }
 else if(x >=14000 )
 {
   *leds = 0x01;
 }


}
