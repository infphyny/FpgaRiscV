#include "ictrl.h"

void ictrl_int_en(ICtrl* ictrl,uint16_t ints)
{

  ictrl->flags = 0x80000000 | ICTRL_INT_EN | ints << 16;

}