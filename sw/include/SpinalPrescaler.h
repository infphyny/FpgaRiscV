#ifndef SPINALPRESCALER_H
#define SPINALPRESCALER_H

#include <stdint.h>

typedef struct SpinalPrescaler
{
  volatile uint32_t limit;
}SpinalPrescaler;


#endif