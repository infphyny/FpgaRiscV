#include <stdbool.h>
#include <stdlib.h>
#include <stdint.h>

#include "Leds.h"
#include "deca_bsp.h"
#include "SpinalI2c.h"
//#include "i2c.h"
#include "SpinalUart.h"
#define USE_SPINAL_I2C 1
//include "CY8CMBR3102.h"


static const uint8_t CY8CMBR3102_ADDRESS = 0x37;
static const uint8_t CY8CMBR3102_FAMILY_ID = 0x8F;
static const uint8_t CY8CMBR3102_SENSOR_ID = 0x82;
static const uint8_t CY8CMBR3102_BUTTON_STAT = 0xaa;




/*
typedef struct ButtonState
{
  uint16_t state;
}ButtonState;
*/
//ButtonState buttons;


Leds* leds;
SpinalUart* uart;
SpinalI2C* i2c;

//uint64_t mtime(void);
bool get_button_state(SpinalI2C*i2c,uint8_t* state);
uint8_t get_family_id(SpinalI2C* i2c);

void main(void)
{
  bool result;
  size_t n;
  init_leds(&leds,LEDS_BASE_ADDRESS);
  leds->dir = 0;
  leds->state = 0;
  char sint[33];
  uint8_t id[4]= {0,0,0,0};
  uint16_t prev_state = 0;
  int32_t* t = (int32_t*)id;
  deca_init();
  //  delay(500);
  spinal_uart_init(&uart,UART_0_BASE_ADDRESS);
  spinal_uart_print_line(uart,"CY8CMBR3102 CapSense example");

   i2c = (SpinalI2C*)CAP_SENSE_BASE_ADDRESS;



   //i2c timeout = 50000
   //i2c timer_low = 250
   //i2c timer_high = 250
   //i2c timer_buf = 1000
   //i2c tsu_dat = 5
   //i2c sampling_clock_divider = 5
   // scl freq ~ I2C input clock /(timer_low + timer_high)
   spinal_i2c_init(i2c,50000,250,250,1000,5,5);

  //Old i2c controller. Not used anymore problem setting some registers after a reset
  //i2c_init(&i2c,CAP_SENSE_BASE_ADDRESS);
  //i2c_set_prescaler(i2c,75000000,100000);
  //
  // if(!i2c_enable(i2c))
  // {
  //   spinal_uart_print_line(uart,"i2c enable failure");
  // }
  // else
  // {
  //   spinal_uart_print_line(uart,"i2c enable success");
  // }

  //Write register we want to read
  id[0] = get_family_id(i2c);
   utoa(*t,sint,10);
   spinal_uart_print_line(uart,sint);

   /*
   if(id[0] != CY8CMBR3102_FAMILY_ID )
   {
    spinal_uart_print_line(uart,"Wrong Family ID");
     while(1){}
   }
*/
  // result = CY8CMBR3102_family_id(i2c,id);
  // while( (result == false) || (id[0]==0) )
  // {
  //   delay(10);
  //   result = CY8CMBR3102_family_id(i2c,id);
  // }
  // itoa(result,sint,10);
  // spinal_uart_print(uart,"receive result: " );
  // spinal_uart_print_line(uart,sint);
  //
  // itoa(*t,sint,10);
  // spinal_uart_print(uart,"CapSense family ID: " );
  // spinal_uart_print_line(uart,sint);


  for(;;)
  {

  //  if(CY8CMBR3102_button_stat(i2c,id))
    if(get_button_state(i2c,id))
    {
      if(prev_state!=*t)
      {
      switch(*t)
      {
        case 2:

          leds->state--;
        break;
        case 1:
        if(prev_state != *t)
          leds->state++;
        break;
        default:
        break;
      }

      prev_state = *t;
    }
  }


  }

}



bool get_button_state(SpinalI2C*i2c,uint8_t* state)
{

  while(!spinal_i2c_start(i2c,CY8CMBR3102_ADDRESS,false))
  {
    for(uint32_t i=0;i<I2C_MAX_TRIES && (i2c->master_status & I2C_MASTER_IS_BUSY);i++) {}
  }
  spinal_i2c_write(i2c,&CY8CMBR3102_BUTTON_STAT,1);
  spinal_i2c_stop(i2c);

  while(!spinal_i2c_start(i2c,CY8CMBR3102_ADDRESS,true))
  {
    for(uint32_t i=0;i<I2C_MAX_TRIES && (i2c->master_status & I2C_MASTER_IS_BUSY);i++) {}
  }
    spinal_i2c_read(i2c,state,2);
   spinal_i2c_stop(i2c);

  return true;
}


uint8_t get_family_id(SpinalI2C* i2c)
{
  uint8_t id;
  // Per CY8CMBR3102 data sheet recommendation
   //Write i2c address of CapSense device ask write
  while(!spinal_i2c_start(i2c,CY8CMBR3102_ADDRESS,false))
  {
    for(uint32_t i=0;i<I2C_MAX_TRIES && (i2c->master_status & I2C_MASTER_IS_BUSY);i++) {}
  }
  spinal_i2c_write(i2c,&CY8CMBR3102_FAMILY_ID,1);
   //Send a stop
   spinal_i2c_stop(i2c);

    while(!spinal_i2c_start(i2c,CY8CMBR3102_ADDRESS,true))
    {
     for(uint32_t i=0;i<I2C_MAX_TRIES && (i2c->master_status & I2C_MASTER_IS_BUSY);i++) {}
    }
    //Send address od CapSense ask read
    spinal_i2c_read(i2c,&id,1);
    spinal_i2c_stop(i2c);
  return id;
}
