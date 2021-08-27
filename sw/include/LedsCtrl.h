/*
  Description: Leds controller

    Support maximum of 32 leds
    direction 0,1
  

*/



#ifndef LEDSCTRL_H
#define LEDSCTRL_H

#include <stdint.h>

typedef struct LedsCtrl
{
  volatile uint32_t value;
  volatile uint8_t dir; 
}LedsCtrl;

#endif