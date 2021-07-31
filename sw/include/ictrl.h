/*
  ZipCpu hardware implementation of the interrupt controller icontrol.v 

  Description: Interrupt handler for the ZipCpu interrupt controller
  
  This interrupt controller have 12 input interrupt and one output interrupt lines 
  and can be chained to support more than 12 interrupts. 


*/




#ifndef ICTRL_H
#define ICTRL_H

#include <stdint.h>

static const uint32_t ICTRL_GLOBAL_INT_EN = 0x80000000;
static const uint32_t ICTRL_INT_EN_0 = 0x00010000;
static const uint32_t ICTRL_INT_EN = 0x00008000;
static const uint32_t ICTRL_INT_0 = 0;

typedef struct ICtrl
{
 volatile uint32_t flags;
}ICtrl;

void ictrl_int_en(ICtrl* ictrl,uint16_t ints);


#endif