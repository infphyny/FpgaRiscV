#include <stdbool.h>
#include <stdlib.h>
#include <stdint.h>

#include "Leds.h"
#include "deca_bsp.h"
#include "i2c.h"
#include "SpinalUart.h"
#include "CY8CMBR3102.h"

/*
typedef struct ButtonState
{
  uint16_t state;
}ButtonState;
*/
//ButtonState buttons;


Leds* leds;
SpinalUart* uart;
I2C* i2c;

uint64_t mtime(void);


void main(void)
{

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
  i2c_init(&i2c,CAP_SENSE_BASE_ADDRESS);
  i2c_set_prescaler(i2c,75000000,100000);

  if(!i2c_enable(i2c))
  {
    spinal_uart_print_line(uart,"i2c enable failure");
  }
  else
  {
    spinal_uart_print_line(uart,"i2c enable success");
  }



  bool result;


  delay(500);


  result = CY8CMBR3102_family_id(i2c,id);
  while( (result == false) || (id[0]==0) )
  {
    delay(10);
    result = CY8CMBR3102_family_id(i2c,id);
  }
  itoa(result,sint,10);
  spinal_uart_print(uart,"receive result: " );
  spinal_uart_print_line(uart,sint);

  itoa(*t,sint,10);
  spinal_uart_print(uart,"CapSense family ID: " );
  spinal_uart_print_line(uart,sint);


  for(;;)
  {

    if(CY8CMBR3102_button_stat(i2c,id))
    {
      if(prev_state!=*t)
      {
      switch(*t)
      {
        case 1:

          leds->state--;
        break;
        case 2:
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
