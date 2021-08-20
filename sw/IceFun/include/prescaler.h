#ifndef PRESCALERCTRL_H_
#define PRESCALERCTRL_H_

#include <stdint.h>


typedef struct Prescaler
{
  volatile uint32_t limit;
} Prescaler;

 void prescaler_init(Prescaler* reg);

#endif /* PRESCALERCTRL_H_ */
