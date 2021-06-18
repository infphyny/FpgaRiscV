#include "Timer.h"

void init_timer(Timer** timer,uint32_t base_address,uint64_t cmp)
{

  uint32_t* t = (uint32_t*)&cmp;

  *timer = (Timer*)base_address;
  (*timer)->mtime_l = 0;
  (*timer)->mtime_h = 0;
  (*timer)->mtimecmp_l = t[0];
  (*timer)->mtimecmp_h = t[1];
}
