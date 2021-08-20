#ifndef LEDCTRL_H_
#define LEDCTRL_H_

#include <stdint.h>

typedef struct LedCtrl
{
 volatile uint32_t data;
 volatile uint16_t divider;
}LedCtrl;



#endif
