/*
  infphyny 2021

  TODO add a LM71 structure that keep track or current operation mode, shutdown,
  or continuous sampling of temperature. So when user try to read manufacturer or
  temperature in the wrong mode (manufacturer code is send in shutdown mode),
  an error code is returned
*/



#ifndef LM71_H
#define LM71_H

#include <stdint.h>
#include <stdlib.h>
#include "MicroWire.h"

void lm71_convert_temp(int16_t val,char temp[16]);

void lm71_read_manufacturer(MicroWire* mw,char manufacturer[4]);
void lm71_read_temperature(MicroWire* mw,char temperature[16]);

void lm71_shutdown_mode(MicroWire* mw,char temperature[16]);
void lm71_conversion_mode(MicroWire* mw,char manufacturer[4]);


#endif
