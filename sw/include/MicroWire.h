#ifndef MICROWIRE_H
#define MICROWIRE_H

#include <stdint.h>

static const uint8_t MW_STATUS_CS = 0x08;
static const uint8_t MW_STATUS_START = 0x10;
static const uint8_t MW_STATUS_DATA_AVAIL = 0x04;
static const uint8_t MW_STATUS_BUSY = 0x02;
static const uint8_t MW_STATUS_SEND = 0x01;

typedef struct MicroWire
{
 volatile uint8_t data;
 volatile uint8_t status;
 volatile uint8_t divider[2];
}MicroWire;

void micro_wire_set_divider(MicroWire* mw,const uint16_t divider);
void micro_wire_clear_status(MicroWire* mw);
void micro_wire_set_status(MicroWire* mw,const uint8_t status);
void micro_wire_unset_status(MicroWire* mw,const uint8_t status);
void micro_wire_recv(MicroWire* mw,uint8_t *data);
void micro_wire_send(MicroWire* mw,const uint8_t send);




#endif
