
#include <stdbool.h>
#include <stdint.h>
#include <stdlib.h>


#include "deca_bsp.h"

#include "Leds.h"
#include "SpinalUart.h"
#include "ictrl.h"

SpinalUart* uart;

typedef struct Switch
{
    volatile uint8_t status;
}Switch;


volatile bool key1_event = false;
volatile bool sw0_event = false;
volatile bool sw1_event = false;

void key1_irq(void);
void sw0_irq(void);
void sw1_irq(void);

Leds* leds;
Switch* key1;
Switch* sw0;
Switch* sw1;

void main(void)
{
 char sint[33]; 
 deca_init();

 init_leds(&leds,LEDS_BASE_ADDRESS);


//Initialize led status
 if(key1->status &0x01 == 0x01)
 {
     leds->state = 0x01;
 } 
//leds->state = 0xA5;
 external_irq[0] = &key1_irq;
 
 key1 = (Switch*)KEY1_BASE_ADDRESS;
 sw0 = (Switch*)SW0_BASE_ADDRESS;
 sw1 = (Switch*)SW1_BASE_ADDRESS;

 key1->status = 0x06;//Auto clear interrupt, interrupt on rising and falling egde of switch signal

   
 //Enable interrupt for the interrupt controller and interrupt 0 to 2
 ictrl->flags = 0x80000000 | ICTRL_INT_EN | 0x00070000;//0xFFFFFFFF;//(ICTRL_ANY_INT)/*|(ICTRL_INT_EN_0)*/;

 //ictrl->flags |= (ICTRL_INT_EN_0<<1);
 //ictrl->flags |= (ICTRL_INT_EN_0<<2); 

 spinal_uart_init(&uart,UART_0_BASE_ADDRESS);

  utoa(ictrl->flags,sint,16); 
 
 spinal_uart_print(uart,"Interrupt flags value: ");
 spinal_uart_print_line(uart,sint);


 for(;;)
 {
    if(key1_event == true)
    {
        key1_event = false;
        if( (key1->status&0x01) == 1 )
        {
          leds->state |= 0x01;  
        }
        else
        {
            leds->state &= ~0x01;
        } 
    }
 }


}



void key1_irq(void)
{
    
    key1_event = true;
    key1->status |= 0x10;//Clear interrupt
    
  //  spinal_uart_print_line(uart,"Key 1 pressed");
}


void sw0_irq(void)
{
  sw0_event = true;


}


void sw1_irq(void)
{
  sw1_event = true;
}