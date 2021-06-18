#ifndef TIMER_H
#define TIMER_H

#include <stdint.h>

static const uint8_t TIMER_INTERRUPT_ENABLE = 0x02;

typedef struct Timer
{
volatile   uint32_t mtime_l;
volatile  uint32_t mtime_h;
volatile  uint32_t mtimecmp_l;
volatile  uint32_t mtimecmp_h;
volatile  uint32_t status;
}Timer;


void init_timer(Timer** timer,uint32_t address,uint64_t cmp);

#endif
