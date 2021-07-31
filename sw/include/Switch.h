

#ifndef SWITCH_H
#define SWITCH_H

#include <stdint.h>


static const uint8_t SWITCH_DISABLE_INTERRUPT = 0x00;
static const uint8_t SWITCH_RISING_EDGE_INTERRUPT = 0x02;
static const uint8_t SWITCH_FALLING_EDGE_INTERRUPT = 0x04;
static const uint8_t SWITCH_BOTH_EDGE_INTERRUPT  = 0x06;


typedef struct Switch
{
    volatile uint8_t status;
}Switch;

#endif