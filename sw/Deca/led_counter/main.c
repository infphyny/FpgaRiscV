#include <stdbool.h>
#include <stdint.h>
#include <stdlib.h>


#include "deca_bsp.h"
#include "Leds.h"

void main(void)
{

  deca_init();

  Leds *leds;
  
  init_leds(&leds,LEDS_BASE_ADDRESS);
  
 // uint8_t* leds = (uint8_t*)LEDS_BASE_ADDRESS;
 // uint8_t* dir = (uint8_t*)(LEDS_BASE_ADDRESS+1);
  leds->dir = 0;
  uint8_t count = 0; 
  
  for(;;count++)
  {
      leds->state = count;
      delay(100);
  }
   
}
