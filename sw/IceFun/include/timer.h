#ifndef TIMERCTRL_H_
#define TIMERCTRL_H_

#include <stdint.h>


typedef struct Timer
{
  volatile uint32_t clear_ticks;
  volatile uint32_t limit;
  volatile uint32_t value;
} Timer;

static void timer_init(Timer *timer){
	timer->clear_ticks = 0;
	timer->value = 0;
}


#endif /* TIMERCTRL_H_ */
