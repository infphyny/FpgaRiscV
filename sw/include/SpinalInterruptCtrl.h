#ifndef SPINALINTERRUPTCTRL_H
#define SPINALINTERRUPTCTRL_H


typedef struct SpinalInterruptCtrl
{  
  volatile uint32_t pendings;
  volatile uint32_t masks;
} SpinalInterruptCtrl;

static void spinal_interrupt_ctrl_init(SpinalInterruptCtrl* interrupt_ctrl){
	interrupt_ctrl->masks = 0;
	interrupt_ctrl->pendings = 0xFFFFFFFF;
}

#endif