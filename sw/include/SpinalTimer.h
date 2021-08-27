#ifndef SPINALTIMER_H
#define SPINALTIMER_H

#include <stdint.h>


typedef struct SpinalTimer
{
  volatile uint32_t clear_ticks;
  volatile uint32_t limit;
  volatile uint32_t value;
} SpinalTimer;


static void spinal_timer_init(SpinalTimer *timer){
	timer->clear_ticks = 0;
	timer->value = 0;
}


#endif