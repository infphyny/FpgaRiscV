#include "i2c.h"

//Should be called read_byte

static bool write_byte(I2C* i2c,const uint8_t data,const uint8_t cr);
static void read_byte(I2C* i2c,uint8_t* rcv_data,const uint8_t i,const uint8_t rcv_size, const bool reverse);
static void send_nack_stop(I2C* i2c);

void i2c_enable(I2C* i2c)
{
  i2c->ctr |= I2C_CTR_EN_BIT;
}

void i2c_set_prescaler(I2C* i2c, uint32_t freq_in,uint32_t freq_out)
{
  uint16_t prescale;
  prescale = freq_in/(freq_out*5) -1;

  uint8_t* p = (uint8_t*)&prescale;

  i2c->prescaler_lo = p[0];
  i2c->prescaler_hi = p[1];
}


bool i2c_rcv(I2C* i2c, uint8_t address,uint8_t reg, uint8_t* rcv_data,const uint8_t rcv_size,bool reverse)
{
 bool result;
 uint8_t counter = 0;
 do
 {
    if(counter > 64)
    {
      send_nack_stop(i2c);
      return false;
    }
   counter++;
   address |= 0x00;
   result = write_byte(i2c,address,I2C_CR_STA_BIT|I2C_CR_WR_BIT);
   if(result ==  true)
   {
    result = write_byte(i2c,reg,I2C_CR_WR_BIT);
    if(result == true)
    {
     address |= 0x01;
    result = write_byte(i2c,address,I2C_CR_STA_BIT|I2C_CR_WR_BIT);
    }
   }


 }while(result == false);

  for( uint8_t i = 0 ; i < rcv_size ; i++)
  {
   read_byte(i2c,rcv_data,i,rcv_size,reverse);
  }

   send_nack_stop(i2c);

return true;

}

bool i2c_send(I2C* i2c, uint8_t address,uint8_t reg,uint8_t* data, const uint8_t size,bool reverse,bool stop)
{

  if( !write_byte(i2c,address,I2C_CR_STA_BIT|I2C_CR_WR_BIT))
  {
    return false;
  }

  if(!write_byte(i2c,reg,I2C_CR_WR_BIT))
  {
    return false;
  }



 for( uint8_t i = 0 ; i < size ; i++)
 {

   if(!reverse)
   {
     if(!write_byte(i2c,data[i],I2C_CR_WR_BIT))
     {
       return false;
     }

   }
   else
   {
     if(!write_byte(i2c,data[size-1-i],I2C_CR_WR_BIT))
     {
       return false;
     }
   }

 }

 if(stop == true)
 {
 i2c->sr_cr = I2C_CR_STO_BIT;
 while( (i2c->sr_cr & I2C_TIP_BIT)  == 0x02){}
 }
 return true;

}

bool i2c_rcv_delay(I2C* i2c, uint8_t address,uint8_t reg, uint8_t* rcv_data,const uint8_t rcv_size,bool reverse)
{
bool result;

 uint8_t counter = 0;

 do {
    if(counter > 64)
    {
      send_nack_stop(i2c);
      return false;
    }
    counter++;
   /* code */result = write_byte(i2c,address,I2C_CR_STA_BIT|I2C_CR_WR_BIT);
           result = write_byte(i2c,reg,I2C_CR_WR_BIT);
 } while(result == false );

  address |= 0x01;

  while(!write_byte(i2c,address,I2C_CR_STA_BIT|I2C_CR_WR_BIT))
   {
     //return false;
   }


  // for(uint8_t i = 0 ; i < 1000000 ; i++){}

  for( uint8_t i = 0 ; i < rcv_size ; i++)
  {
   read_byte(i2c,rcv_data,i,rcv_size,reverse);
  }

   send_nack_stop(i2c);

return true;

}





 void read_byte(I2C* i2c,uint8_t* rcv_data,const uint8_t i,const uint8_t rcv_size, const bool reverse)
{

  i2c->sr_cr = I2C_CR_RD_BIT;
  while( (i2c->sr_cr & I2C_TIP_BIT)  == 0x02){}

  if(!reverse)
  {
    rcv_data[i] =i2c->rxr_txr;
  }
  else
  {
    rcv_data[rcv_size-1-i] = i2c->rxr_txr;
  }

}

static void send_nack_stop(I2C* i2c)
{
  i2c->sr_cr = I2C_CR_NACK_BIT|I2C_CR_STO_BIT;
  while( (i2c->sr_cr & I2C_TIP_BIT)  == 0x02){}

}

static bool write_byte(I2C* i2c,const uint8_t data,const uint8_t cr)
{

  i2c->rxr_txr = data;

  i2c->sr_cr = cr;
   while( (i2c->sr_cr & I2C_TIP_BIT)  == 0x02  ){}

   if( (i2c->sr_cr & I2C_SR_RXACK_BIT) == I2C_SR_RXACK_BIT )
   {
     return false;
   }

  return true;

}
