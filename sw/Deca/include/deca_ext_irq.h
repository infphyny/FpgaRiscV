#ifndef DECA_EXT_IRQ_H
#define DECA_EXT_IRQ_H

#include "ictrl.h"

typedef void(*zipcpu_irq)(void);

extern ICtrl* ictrl; 
extern  zipcpu_irq external_irq[12];
void deca_external_irq(void);
void deca_external_irq_init(void);

#endif