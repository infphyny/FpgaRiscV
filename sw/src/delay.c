#include "delay.h"



//extern volatile uint32_t systick;

void delay(uint32_t delay_ms)
{
  uint32_t curtime = systick;

  while( (curtime+delay_ms) >= systick ){}

}
