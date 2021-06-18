#include "LM71.h"
#include <string.h>

/*
 TODO: Improve code to compute only i2. So calculate positive tempeture with i2
*/
void lm71_convert_temp(int16_t val,char temp[16])
{
  char is[6];
  char id[5];
  int16_t i = val>>7;
  int16_t i2 = val>>2;
  int d = (val&0x007C)>>2;

  if(i >=0 )
  {
   d = 3125*d;
   itoa(i,is,10);
   strcpy(temp,is);
  }
  else
  {
   i2 = (~i2+1)&0x1FFF;
   //i = (~i+1);
   d = (i2&0x001F)*3125;
   i2 = i2>>5;
   strcpy(temp,"-");
   itoa(i2,is,10);
   strcat(temp,is);
  }

  itoa(d,id,10);

  strcat(temp,".");


 if(d< 10000)
 {
   strcat(temp,"0");
 }

  strcat(temp,id);

}


void lm71_read_manufacturer(MicroWire* mw,char manufacturer[4])
{
//  uint8_t manufacturer[4];
  int *t = (int*)&manufacturer[0];
  micro_wire_set_status(mw,MW_STATUS_CS);
  //Read manufacturer
  micro_wire_recv(mw,&manufacturer[1]);
  micro_wire_recv(mw,&manufacturer[0]);

  micro_wire_clear_status(mw);

  itoa(*t,manufacturer,16);
}


void lm71_read_temperature(MicroWire* mw,char temperature[16])
{

  uint8_t temp[2];
  int16_t* t = (int16_t*)&temp[0];
//  temp[2] = 0;
//  temp[3] = 0;
  //int* t = (int*)&temp[0];

  micro_wire_set_status(mw,MW_STATUS_CS);

  micro_wire_recv(mw,&temp[1]);

  micro_wire_recv(mw,&temp[0]);
  //Disable chip select
  micro_wire_clear_status(mw);

 lm71_convert_temp(*t,temperature);

}

void lm71_conversion_mode(MicroWire* mw,char manufacturer[4])
{
 // Need a dummy read? Data sheet of LM71 say that first 16 clock cycle
// LM71 send data, then the next 16 clock cycle it receive data.

 uint8_t temp[4];
 temp[2] = 0;
 temp[3] = 0;
 int* t = (int*)&temp[0];

  micro_wire_set_status(mw,MW_STATUS_CS);
//  micro_wire_unset_status(mw,MW_STATUS_SEND);
  micro_wire_recv(mw,&temp[1]);
  micro_wire_recv(mw,&temp[0]);
  micro_wire_send(mw,0x00);
  micro_wire_send(mw,0x00);
  micro_wire_clear_status(mw);
//  micro_wire_unset_status(mw,MW_STATUS_CS);

  itoa(*t,manufacturer,16);

}

void lm71_shutdown_mode(MicroWire* mw,char temperature[16])
{
  uint8_t temp[4];
  temp[2] = 0;
  temp[3] = 0;
  int* t = (int*)&temp[0];
  // Need a dummy read? Data sheet of LM71 say that first 16 clock cycle
  // LM71 send data, then the next 16 clock cycle it receive data.
  micro_wire_set_status(mw,MW_STATUS_CS);
//  micro_wire_unset_status(mw,MW_STATUS_SEND);
  micro_wire_recv(mw,&temp[1]);
  micro_wire_recv(mw,&temp[0]);

//  micro_wire_set_status(mw,MW_STATUS_SEND);

  micro_wire_send(mw,0xFF);
  micro_wire_send(mw,0xFF);

  micro_wire_clear_status(mw);
  //micro_wire_unset_status(mw,MW_STATUS_CS);
  lm71_convert_temp(*t,temperature);
}
