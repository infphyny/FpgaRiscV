#include <stdbool.h>
#include <stdint.h>
#include <stdlib.h>

#include "riscv.h"
#include "DecaMurax.h"
#include "LedsCtrl.h"
#include "SpinalInterruptCtrl.h"
#include "SpinalPrescaler.h"
#include "SpinalTimer.h"
LedsCtrl *leds;
SpinalInterruptCtrl* interrupt_ctrl;
SpinalPrescaler* prescaler;
SpinalTimer* timer_a;
volatile bool update_count = false;

void irqCallback(void);
void  __attribute__((aligned(4))) trap_entry(void)__attribute((interrupt));


void main(void)
{
 csr_write(mtvec, ((unsigned long)&trap_entry));
 leds = (LedsCtrl*)LED_CTRL;
 interrupt_ctrl = (SpinalInterruptCtrl*)TIMER_INTERRUPT;
 prescaler = (SpinalPrescaler*)TIMER_PRESCALER;
 timer_a = (SpinalTimer*)TIMER_A; 
 spinal_timer_init(timer_a);
 spinal_interrupt_ctrl_init(interrupt_ctrl);
 prescaler->limit = CPU_FREQ/20000-1; //0.1 ms rate
 timer_a->limit = 1000-1;  //1 second rate
 timer_a->clear_ticks = 0x00010002;
 interrupt_ctrl->pendings = 0xF;
 interrupt_ctrl->masks = 0x1;
 
 
  leds->value = 0;
 // uint8_t* leds = (uint8_t*)LEDS_BASE_ADDRESS;
 // uint8_t* dir = (uint8_t*)(LEDS_BASE_ADDRESS+1);
  leds->dir = 0;
  uint32_t count = 0; 
  csr_write(mstatus,MSTATUS_MIE);
  csr_set(mie, MIE_MTIE | MIE_MEIE); //Enable machine timer and external interrupts
  for(;;)
  {  
     if(update_count == true)
     {
        
       update_count = false;
        count++; 
         
        if(count%256==0)
        {
          leds->dir = ~leds->dir;
        }   
       
     }
    leds->value = count;  
     
     // delay(100);
  }
   
}

void irqCallback()
{
	if(interrupt_ctrl->pendings & 1){  //Timer A interrupt
		 update_count = true;
		interrupt_ctrl->pendings = 1;
	}
}

void trap_entry()
{
  irqCallback();
}
