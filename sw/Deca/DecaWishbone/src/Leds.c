#include "Leds.h"


void init_leds(Leds **leds,uint32_t base_address)
{
 *leds = (Leds*)base_address;
}
