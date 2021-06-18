#ifndef IRQ_H
#define IRQ_H

#include <stdint.h>
#include "Timer.h"

extern Timer* machine_timer;
extern volatile uint32_t systick;
void mtime_irq(void);

#endif
