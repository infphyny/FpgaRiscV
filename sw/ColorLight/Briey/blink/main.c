#include <stdbool.h>
#include <stdint.h>
#include <stdlib.h>

#include "riscv.h"
#include "ColorLightBriey.h"
#include "SpinalInterruptCtrl.h"
#include "SpinalUart.h"
#include "LedsCtrl.h"
#include "SpinalPrescaler.h"
#include "SpinalTimer.h"

SpinalUart* uart;
LedsCtrl* led_ctrl;
SpinalInterruptCtrl* interrupt_ctrl;
SpinalPrescaler* prescaler;
SpinalTimer *timer_a;

volatile bool blink = false;


void  __attribute__((aligned(4))) trap_entry(void)__attribute((interrupt));



void main(void)
{

   csr_write(mtvec, ((unsigned long)&trap_entry));
   interrupt_ctrl = (SpinalInterruptCtrl*)TIMER_INTERRUPT;

    prescaler = (SpinalPrescaler*)TIMER_PRESCALER;
    timer_a = (SpinalTimer*)TIMER_A;

   led_ctrl = (LedsCtrl*)LED_CTRL;
   led_ctrl->value = 0x00;
   spinal_uart_init(&uart,UART_0);
   
   
   spinal_interrupt_ctrl_init(interrupt_ctrl);
   spinal_timer_init(timer_a);
   
  prescaler->limit = 25000-1; //1 ms rate
  timer_a->limit = 1000-1;  //1 second rate
  timer_a->clear_ticks = 0x00010002;
  interrupt_ctrl->pendings = 0xF;
  interrupt_ctrl->masks = 0x1;
  csr_write(mstatus,MSTATUS_MIE);
  csr_set(mie, MIE_MTIE | MIE_MEIE); //Enable machine timer and external interrupts



   spinal_uart_print_line(uart,"Blink demo");

    for(;;)
    {

      if(blink == true)
      {
          spinal_uart_print_line(uart,"Blink!");
          blink = false;
          led_ctrl->value = ~led_ctrl->value;
      }

    }

}


void irqCallback()
{
	if(interrupt_ctrl->pendings & 1){  //Timer A interrupt
		 blink = true;
		interrupt_ctrl->pendings = 1;
	}
}

void trap_entry()
{
  irqCallback();
}

