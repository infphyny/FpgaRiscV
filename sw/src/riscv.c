#include "riscv.h"


void riscv_disable_interrupt(void)
{
 csr_clear(mie,MIE_MTIE | MIE_MEIE);
 csr_clear(mstatus, MSTATUS_MIE);
}

void riscv_enable_interrupt(void)
{
  csr_set(mstatus, MSTATUS_MIE);
  csr_set(mie, MIE_MTIE | MIE_MEIE); //Enable machine timer and external interrupts
}
