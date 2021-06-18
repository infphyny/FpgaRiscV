#include "MicroWire.h"

void micro_wire_clear_status(MicroWire* mw)
{
  mw->status = 0x00;
}

void micro_wire_set_divider(MicroWire* mw,const uint16_t divider)
{

  uint8_t *d = (uint8_t*)&divider;

  mw->divider[0] = d[0];
  mw->divider[1] = d[1];

}

void micro_wire_recv(MicroWire* mw,uint8_t *data)
{

   micro_wire_set_status(mw,MW_STATUS_START);
   volatile uint8_t wait_status = (mw->status >> 2) ;
  while( ( wait_status & 0x01) != 0x01  )
  {
      wait_status = (mw->status >> 2);
  }

  *data = mw->data;
  //Clear Start activity and data available
   micro_wire_unset_status(mw,MW_STATUS_START|MW_STATUS_DATA_AVAIL);
  // mw->status &= ~0x14;

}


void micro_wire_send(MicroWire* mw,const uint8_t send)
{
   mw->data = send;
//   mw->status |=  0x11;//Send data start activity
   micro_wire_set_status(mw,MW_STATUS_START|MW_STATUS_SEND);
   volatile uint8_t wait_status = (mw->status >> 2) ;
  while( ( wait_status & 0x01) != 0x01  )
  {
      wait_status = (mw->status >> 2);
  }

   micro_wire_unset_status(mw,MW_STATUS_START|MW_STATUS_DATA_AVAIL);


}

void micro_wire_set_status(MicroWire* mw,const uint8_t status)
{
   mw->status |= status;
}
void micro_wire_unset_status(MicroWire* mw,const uint8_t status)
{
  mw->status &= ~status;
}
