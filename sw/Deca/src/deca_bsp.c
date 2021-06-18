#include "deca_bsp.h"
//extern irq vtable[32];


void deca_init(void)
{
  //riscv_disable_interrupt();
  systick = 0;
  machine_timer = (Timer*)TIMER_BASE_ADDRESS;
  init_vtable(); //Fill table with dummy irq
  set_vtable_irq(CAUSE_MACHINE_TIMER,mtime_irq);
  csr_write(mtvec, ((unsigned long)&handle_trap));
  //spinal_uart_print_line(uart,"init timer");

  init_timer(&machine_timer,TIMER_BASE_ADDRESS,75000-1);
  machine_timer->status |= TIMER_INTERRUPT_ENABLE;
  riscv_enable_interrupt();
}
