#include "HDC1000.h"
#include <stdbool.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

//From stackoverflow https://stackoverflow.com/questions/784417/reversing-a-string-in-c
static void inplace_reverse(char * str)
{
  if (str)
  {
    char * end = str + strlen(str) - 1;

    // swap the values in the two given variables
    // XXX: fails when a and b refer to same memory location
#   define XOR_SWAP(a,b) do\
    {\
      a ^= b;\
      b ^= a;\
      a ^= b;\
    } while (0)

    // walk inwards from both ends of the string,
    // swapping until we get to the middle
    while (str < end)
    {
      XOR_SWAP(*str, *end);
      str++;
      end--;
    }
#   undef XOR_SWAP
  }
}




bool hdc1000_configure(SpinalI2C* i2c,const uint8_t address,const uint16_t conf)
{

 uint8_t temp[3];
 uint8_t* c = (uint8_t*)&conf;
 temp[0] = HDC1000_CONF_REG;
 temp[1] = c[1];
 temp[2] = c[0];

 while(!spinal_i2c_start(i2c,address,SPINAL_I2C_WRITE))
 {
   for(uint32_t i=0;i<I2C_MAX_TRIES && (i2c->master_status & I2C_MASTER_IS_BUSY);i++) {}
 }
 spinal_i2c_write(i2c,temp,3);
 spinal_i2c_stop(i2c);

 return true /*i2c_send(i2c,address,HDC1000_CONF_REG,c,2,true,true)*/;
}

bool hdc1000_get_config(SpinalI2C* i2c,const uint8_t address,uint16_t* conf)
{
   uint8_t* c = (uint8_t*)conf;
   uint8_t temp[2];

   while(!spinal_i2c_start(i2c,address,SPINAL_I2C_WRITE))
   {
     for(uint32_t i=0;i<I2C_MAX_TRIES && (i2c->master_status & I2C_MASTER_IS_BUSY);i++) {}
   }
   spinal_i2c_write(i2c,&HDC1000_CONF_REG,1);
   spinal_i2c_start(i2c,address,SPINAL_I2C_READ);
   spinal_i2c_read(i2c,temp,2);
   spinal_i2c_stop(i2c);

   c[0] = temp[1];
   c[1] = temp[0];

   return true/*i2c_rcv(i2c,address,HDC1000_CONF_REG,c,2,true)*/;
}

void hdc1000_get_device_info(SpinalI2C* i2c,uint8_t address,HDC1000DeviceInfo* di)
{

  uint8_t buffer[4];
  buffer[0] = 0;
  buffer[1] = 0;
  buffer[2] = 0;
  buffer[3] = 0;
  int *t = (int*)&buffer[0];


  bool i2c_result;
//Retreive HDC1000_DEVICE_ID
  while(!spinal_i2c_start(i2c,address,SPINAL_I2C_WRITE))
  {
    for(uint32_t i=0;i<I2C_MAX_TRIES && (i2c->master_status & I2C_MASTER_IS_BUSY);i++) {}
  }

  spinal_i2c_write(i2c,&HDC1000_DEVICE_ID,1);

  while(!spinal_i2c_start(i2c,address,SPINAL_I2C_READ))
  {
    for(uint32_t i=0;i<I2C_MAX_TRIES && (i2c->master_status & I2C_MASTER_IS_BUSY);i++) {}
  }
  spinal_i2c_read(i2c,buffer,2);

  spinal_i2c_stop(i2c);
  buffer[3] = buffer[0];
  buffer[0] = buffer[1];
  buffer[1] = buffer[3];
  buffer[3] = 0x00;
  itoa(*t,di->id,16);

/*
do{
  i2c_result = i2c_rcv(i2c,address,HDC1000_DEVICE_ID,buffer,2,true);
}while(i2c_result == false);
*/


//Retreive manufacturer id

/*
  do
  {
  i2c_result = i2c_rcv(i2c,address,HDC1000_MANUFACTURER_ID,buffer,2,true);
}while(i2c_result == false);
*/
while(!spinal_i2c_start(i2c,address,SPINAL_I2C_WRITE))
{
  for(uint32_t i=0;i<I2C_MAX_TRIES && (i2c->master_status & I2C_MASTER_IS_BUSY);i++) {}
}

spinal_i2c_write(i2c,&HDC1000_MANUFACTURER_ID,1);

while(!spinal_i2c_start(i2c,address,SPINAL_I2C_READ))
{
  for(uint32_t i=0;i<I2C_MAX_TRIES && (i2c->master_status & I2C_MASTER_IS_BUSY);i++) {}
}
spinal_i2c_read(i2c,buffer,2);

spinal_i2c_stop(i2c);
buffer[3] = buffer[0];
buffer[0] = buffer[1];
buffer[1] = buffer[3];
buffer[3] = 0x00;

  itoa(*t,di->manufacturer,16);

}


bool hdc1000_trigger_measure(SpinalI2C* i2c,const uint8_t address)
{
  //return i2c_send(i2c,address,HDC1000_TEMP_REG,NULL,0,false,true);
  return false;
}


bool hdc1000_read_measure(SpinalI2C* i2c,const uint8_t address,char temp[16],char rh[16])
{

 bool i2c_result;
  uint8_t buffer[4];
  buffer[2] = 0;
  buffer[3] = 0;
//Read temperature


while(!spinal_i2c_start(i2c,address,SPINAL_I2C_WRITE))
{
    for(uint32_t i=0;i<I2C_MAX_TRIES && (i2c->master_status & I2C_MASTER_IS_BUSY);i++) {}
}
spinal_i2c_write(i2c,&HDC1000_TEMP_REG,1);
while(!spinal_i2c_start(i2c,address,SPINAL_I2C_READ))
{
    for(uint32_t i=0;i<I2C_MAX_TRIES && (i2c->master_status & I2C_MASTER_IS_BUSY);i++) {}
}
spinal_i2c_read(i2c,buffer,2);
spinal_i2c_stop(i2c);

buffer[3] = buffer[0];
buffer[0] = buffer[1];
buffer[1] = buffer[3];
buffer[3] = 0x00;




/*
  do{
  i2c_result = i2c_rcv(i2c,address,HDC1000_TEMP_REG,buffer,2,true);
  }while(i2c_result == false);
*/



 //i2c_rcv_delay seem broken
 //  if(!i2c_rcv_delay(i2c,address,HDC1000_TEMP_REG,buffer,2,true))
 //  {
  //   return false;
 //  }

int32_t* t = (int32_t*)buffer;
//  uint16_t* temp_16 = (uint16_t*)&buffer[0];

 //Divide to get integer value
 //Subtract to get fraction value
//Multiply Temperature equation by 1E7
//25177 = (1E7*165)/(2^16)
*t = *t * 25177 - 400000000;

int d = *t/100000;
if(d%10 > 5)
{
  if(d>0)
  {
  d = d/10 + 1;
  }
  else
  {
    //Why need -1  A bug?
    d = d/10/* - 1*/;
  }
}else
{
  d /= 10;
}


int n = d/10;

d = d - n*10;


//d = n - c/10;


//int n = *t/10000000;
//int d = (*t - n*10000000)/100000;

//d = (d%10)>5 ? (d)/10 + 1 : d/10;
  char sd[4];
  itoa(n,temp,10);
  itoa(d,sd,10);
  strcat(temp,".");
  strcat(temp,sd);
//  strcat(temp,".");
//  strcat(temp,sd);

//Read humidity
uint32_t *ut = (uint32_t*)(buffer);

buffer[2] = 0;
buffer[3] = 0;


while(!spinal_i2c_start(i2c,address,SPINAL_I2C_WRITE))
{
  for(uint32_t i=0;i<I2C_MAX_TRIES && (i2c->master_status & I2C_MASTER_IS_BUSY);i++) {}
}
spinal_i2c_write(i2c,&HDC1000_RH_REG,1);

while(!spinal_i2c_start(i2c,address,SPINAL_I2C_READ))
{
  for(uint32_t i=0;i<I2C_MAX_TRIES && (i2c->master_status & I2C_MASTER_IS_BUSY);i++) {}
}
spinal_i2c_read(i2c,buffer,2);
spinal_i2c_stop(i2c);

buffer[3] = buffer[0];
buffer[0] = buffer[1];
buffer[1] = buffer[3];
buffer[3] = 0x00;


/*
 do{
  i2c_result = i2c_rcv(i2c,address,HDC1000_RH_REG,buffer,2,true);
  }while(i2c_result == false);
  */
/*
if(!i2c_rcv_delay(i2c,address,HDC1000_RH_REG,buffer,2,true))
{
  return false;
}
*/
//Example
// Case 1: 100% humidity
// ((2^16-1)* 1E7) /2^16 =
//
//15259 = (1E7*100)/2^16
d = (*ut * 15259)/100000;

if( (d%10)>5 )
{
    d = d/10 + 1;
}else
{
  d = d/10;
}

n = d/10;
d = d - n*10;

itoa(n,rh,10);
itoa(d,sd,10);
strcat(rh,".");
strcat(rh,sd);
//d = *t/

/*
  if(*temp_16 == 0)
  {
    temp[0] = 'E';
    temp[1] = 'r';
    temp[2] = 'r';
    temp[3] = '\0';
    return;
  }
  */
  /*
  int32_t temp_32 = ( (int32_t)(*temp_16) * 25177 - 400000000)/1000000;

  bool neg = temp_32 < 0;

 //Compute decimal
  int32_t mod;// = temp_32 % 10;
  //temp_32 /= 10;
  uint32_t i = 0;
  //itoa(mod,&temp[i],10);
  //i++;
  //temp[i] = '.';
  //i++;
  //compute integer

  mod = temp_32 % 10;
  temp_32/=10;


//  i++;


  while(temp_32 != 0)
  {
    itoa(mod,&temp[i],10);
    mod = temp_32 % 10;
    temp_32/=10;
    i++;

  }

   if(neg)
   {
     temp[i] = '-';
     i++;
   }
  temp[i] = '\0';

 inplace_reverse(temp);

*/

  //double ftemp = (double)(*temp_16) /65536.0 -40.0;
  //gcvt(ftemp,16,temp);
  //int32_t temp_32 = (temp_16 * 165)>>16 - 40;

  //itoa(temp_32,temp,10);

  //temp_16 = (uint16_t *)&buffer[0];
  //ftemp = ((double)(*temp_16) / 65536.0) * 100.0;
  //gcvt(ftemp,16,rh);

return true;


}
