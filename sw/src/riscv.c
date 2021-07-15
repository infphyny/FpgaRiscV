#include "riscv.h"
#include <stdint.h>

void riscv_disable_interrupt(void)
{
 //uint32_t temp = csr_read(mstatus); 
 //csr_set(mie,MIE_MTIE | MIE_MEIE);
 csr_clear(mstatus, MSTATUS_MIE);
}

void riscv_enable_interrupt(void)
{

  csr_write(mstatus,MSTATUS_MIE);
  csr_set(mie, MIE_MTIE | MIE_MEIE); //Enable machine timer and external interrupts
}

/*
void riscv_enable_external_interrupt(void)
{

}
*/