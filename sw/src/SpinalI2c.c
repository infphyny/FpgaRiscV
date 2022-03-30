#include "SpinalI2c.h"
void spinal_i2c_init(SpinalI2C* i2c,
                    uint32_t timeout,
                    uint32_t timer_low,
                    uint32_t timer_high,
                    uint32_t timer_buf,
                    uint32_t tsu_dat,
                    uint32_t sampling_clock_divider)
{
   i2c->timeout = timeout;
   i2c->sampling_clock_divider = sampling_clock_divider;
   i2c->timer_low = timer_low;
   i2c->timer_high = timer_high;
   i2c->timer_buf = timer_buf;
   i2c->tsu_dat = tsu_dat;
}

static size_t __spinal_i2c_read(SpinalI2C* i2c, uint8_t* data,bool ack)
{
  i2c->tx_data = I2C_TX_VALID;
  if(ack==true)
  {
  i2c->tx_ack = I2C_TX_VALID|I2C_TX_ENABLE;
  }
  else
  {
    i2c->tx_ack = I2C_TX_VALID;
  }
//  i2c->tx_ack = I2C_TX_VALID;
  //i2c->rx_data = I2C_RX_ENABLE;
  // uint32_t status = 2; // Timeout
   uint32_t i;
   for(i=0; (i < I2C_MAX_TRIES) && (i2c->tx_ack & I2C_TX_VALID)  ;i++) {
     /*
     if (!(i2c->tx_ack & I2C_TX_VALID)) {  // Wait for ack sent
       status = i2c->rx_ack; // 0 if addresss valid, else 1
       break;
     }*/
   }
  *data = (uint8_t)i2c->rx_data;
  if(i < I2C_MAX_TRIES)
  {
    return 1;
  }
  else
  {
    return 0;
  }

}


static size_t __spinal_i2c_write(SpinalI2C* i2c,uint8_t data)
{
  i2c->tx_data = data | I2C_TX_ENABLE | I2C_TX_VALID;
  i2c->tx_ack = I2C_TX_VALID;
   uint32_t i;
   for(i=0;i<I2C_MAX_TRIES && (i2c->tx_ack & I2C_TX_VALID);i++) {};

   if(i < I2C_MAX_TRIES)
   {
     return 1;
   }
   else
   {
    return 0;
   }
}

size_t spinal_i2c_read(SpinalI2C* i2c,uint8_t* data,size_t n)
{
  i2c->rx_data = I2C_RX_LISTEN;
  size_t read_count = 0;
  for(size_t i = 0 ; i < n-1 ; i++  )
  {

      if(__spinal_i2c_read(i2c,&data[i],true))
       {
         read_count +=1;
       }
      else
      {
        return 0;
      }

  }

  __spinal_i2c_read(i2c,&data[n-1],false);
  i2c->rx_data = 0;
  return(read_count);

}
bool spinal_i2c_start(SpinalI2C* i2c,uint8_t address,bool read)
{
  uint8_t is_read = read ? 0x01 : 0x00;
  i2c->master_status = I2C_MASTER_START;
  i2c->tx_data = is_read|(0x50<<1)| I2C_TX_VALID|I2C_TX_ENABLE;//tx valid tx_enable;
  i2c->tx_ack = I2C_TX_VALID/*|I2C_TX_ENABLE*/;

  uint32_t status = 2; // Timeout
  uint32_t i;
   for(i = 0;i<I2C_MAX_TRIES;i++) {
     if (!(i2c->tx_ack & I2C_TX_VALID)) {  // Wait for ack sent
       status = i2c->rx_ack; // 0 if addresss valid, else 1
       break;
     }
   }

   if( (i < I2C_MAX_TRIES) && (status == 0) )
   {
     return(true);
   }
   else
   {
     return false;
   }
}


void spinal_i2c_stop(SpinalI2C* i2c)
{
  //for (int i = 0; i < 50; i++) asm volatile ("");
     i2c->master_status = I2C_MASTER_STOP;
      for(uint32_t i=0;i<I2C_MAX_TRIES && (i2c->master_status & I2C_MASTER_IS_BUSY);i++) {};
}


size_t spinal_i2c_write(SpinalI2C* i2c,uint8_t* data, size_t n )
{
  size_t write_count = 0;
  for(size_t i=0;i<n;i++) {
    if(__spinal_i2c_write(i2c,data[i]))
   {
     write_count += 1;
   }
   else
   {
     return 0;
   }
 }
 return write_count;
}
