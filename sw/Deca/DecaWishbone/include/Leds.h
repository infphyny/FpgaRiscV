#ifndef LEDS_H
#define LEDS_H

#include <stdint.h>

typedef struct Leds
{
  volatile uint8_t state;
  volatile uint8_t dir;
}Leds;


void init_leds(Leds **leds,uint32_t base_address);

#endif
