#include "mtime_irq.h"


Timer* machine_timer;
volatile uint32_t systick;

void mtime_irq(void)
{
  machine_timer->status = machine_timer->status&0x02;//Clear interrupt
  systick++;
}
