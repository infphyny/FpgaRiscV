#include "deca_bsp.h"

//extern irq vtable[32];



void deca_init(void)
{
  //riscv_disable_interrupt();
  ictrl = (ICtrl*)ICTRL_BASE_ADDRESS;
  systick = 0;
  machine_timer = (Timer*)TIMER_BASE_ADDRESS;
  init_vtable(); //Fill table with dummy irq
  deca_external_irq_init();
  set_vtable_irq(CAUSE_MACHINE_TIMER,mtime_irq);
  set_vtable_irq(CAUSE_MACHINE_EXTERNAL,deca_external_irq);
  csr_write(mtvec, ((unsigned long)&handle_trap));

  init_timer(&machine_timer,TIMER_BASE_ADDRESS,75000-1);
  machine_timer->status |= TIMER_INTERRUPT_ENABLE;
  riscv_enable_interrupt();
}
