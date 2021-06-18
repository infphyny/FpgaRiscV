
/*
infphyny 2021
https://github.com/SpinalHDL/SaxonSoc/blob/dev_software/software/standalone/timerAndGpioInterruptDemo/src/main.c

// mtvec.mode = direct  => need to read mcause in handle_trap

*/


#ifndef VTABLE_H
#define VTABLE_H

#include <stdint.h>

#include "mtime_irq.h"
#include "riscv.h"

typedef void(*irq)(void);
extern  irq vtable[32];

void init_vtable(void);
void set_vtable_irq(uint8_t i,irq f);

void __attribute__((aligned(4)))dummy_irq(void);
void  __attribute__((aligned(4))) handle_trap(void)__attribute((interrupt));
//void init_vtable(void);





#endif
