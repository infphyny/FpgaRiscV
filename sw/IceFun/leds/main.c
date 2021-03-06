//https://github.com/SpinalHDL/VexRiscvSocSoftware/blob/master/projects/murax/wip/src/main.c


//#include "stddefs.h"
#include <stdbool.h>
#include <stdint.h>
#include <stdlib.h>
//#include "murax.h"

#include "IceFun.h"
#include "riscv.h"
#include "SpinalUart.h"

#include "interrupt.h"
#include "ledctrl.h"
#include "prescaler.h"
#include "timer.h"

SpinalUart *uart;
InterruptCtrl* interrupt_ctrl;
LedCtrl* led_ctrl;
Prescaler* prescaler;
Timer *timer_a;


void  __attribute__((aligned(4))) trap_entry(void)__attribute((interrupt));

volatile bool change_char = false;

void main() {

csr_write(mtvec, ((unsigned long)&trap_entry));

uart = (SpinalUart*)UART_0;
interrupt_ctrl = (InterruptCtrl*)TIMER_INTERRUPT;
led_ctrl = (LedCtrl*)LED_CTRL;
prescaler = (Prescaler*)TIMER_PRESCALER;
timer_a = (Timer*)TIMER_A;

uint8_t i = 0;
 
 
//    Uart_Config config;
   
//    config.dataLength = 1;
//    config.parity = NONE;
//    config.stop = ONE;
//    config.clockDivider = 115200 /*12000000/(5*115200)*/; //baudrate = 12000000/(rxsampling*clockdivider)
  
    interruptCtrl_init(interrupt_ctrl);
	timer_init(timer_a);

  prescaler->limit = 48000-1; //1 ms rate
  timer_a->limit = 1000-1;  //1 second rate
  timer_a->clear_ticks = 0x00010002;
  interrupt_ctrl->pendings = 0xF;
  interrupt_ctrl->masks = 0x1;
  csr_write(mstatus,MSTATUS_MIE);
  csr_set(mie, MIE_MTIE | MIE_MEIE); //Enable machine timer and external interrupts

  spinal_uart_print_line(uart,"IceFunLedCtrl demo");
 
 //  uart_applyConfig(UART,&config);
   


   led_ctrl->data = 0;
   led_ctrl->divider = 12000-1;
 
    const int nleds = 1;
	
    while(1){
    
    	
    	 if(change_char == true)
    	 {
    	   
    	   change_char = false;
    	   
    	   if(i==0)
    	   {
    	     
    	  	 spinal_uart_print_line(uart,"led array print S");
    	  // println("led array print C");
    	     led_ctrl->data=0x0F88F11F;
    	   }
    	   else
    	   {
    	     spinal_uart_print_line(uart,"led array print C");
    	     
      		 led_ctrl->data = 0x0F11111F;
    	   }
    	  i = (i+1)%2;
    	 }
    }
}



 void irqCallback()
{
	if(interrupt_ctrl->pendings & 1){  //Timer A interrupt
		 change_char = true;
		interrupt_ctrl->pendings = 1;
	}
}

void trap_entry()
{
  irqCallback();
}



