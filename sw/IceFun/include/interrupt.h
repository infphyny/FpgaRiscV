#ifndef INTERRUPTCTRL_H_
#define INTERRUPTCTRL_H_

#include <stdint.h>

typedef struct InterruptCtrl
{
  volatile uint32_t pendings;
  volatile uint32_t masks;
} InterruptCtrl;

static void interruptCtrl_init(InterruptCtrl* interrupt_ctrl){
	interrupt_ctrl->masks = 0;
	interrupt_ctrl->pendings = 0xFFFFFFFF;
}

#endif /* INTERRUPTCTRL_H_ */
