#include "i2c.h"
//#include "mtime_irq.h"
//Should be called read_byte

static bool write_byte(I2C* i2c,const uint8_t data,const uint8_t cr);
static bool read_byte(I2C* i2c,uint8_t* rcv_data,const uint8_t i,const uint16_t rcv_size, const bool reverse);

static void send_nack(I2C* i2c);
static void send_stop(I2C* i2c);
static void send_nack_stop(I2C* i2c);
static bool verify_ack(I2C *i2c);

//Will not work mtime reloaded to 0 after 75000000
/*
static void i2c_delay(void)
{

  volatile uint64_t* curr = (uint64_t*) &(machine_timer->mtime_l);
  uint64_t end = *curr + 20000000;

  while(*curr < end){}

}
*/

void i2c_init(I2C** i2c,uint32_t BASE_ADDRESS)
{
  *i2c = (I2C*)BASE_ADDRESS;
//  (*i2c)->ctr = 0;
  //(*i2c)->ctr = 0;
//  (*i2c)->sr_cr = 0x1;
}

bool i2c_enable(I2C* i2c)
{

  i2c->ctr |= I2C_CTR_EN_BIT;
  uint8_t en = i2c->ctr;
   return en ==  I2C_CTR_EN_BIT;
}

void i2c_set_prescaler(I2C* i2c, uint32_t freq_in,uint32_t freq_out)
{
  uint16_t prescale;
  prescale = (freq_in/(freq_out*5)) - 1;
  uint8_t* p = (uint8_t*)&prescale;


  i2c->prescaler_lo = p[0];
  i2c->prescaler_hi = p[1];
}



bool i2c_master_transmit(I2C* i2c, uint16_t address,const uint8_t *data,uint16_t n,bool stop)
{

uint8_t status;

  if(address < 256) // 1 byte address
  {
     uint8_t* adr = (uint8_t*)&address;
     i2c->txr = adr[0];
     i2c->cr = (I2C_CR_STA_BIT|I2C_CR_WR_BIT);



     status = i2c->sr;
     while( (status & I2C_TIP_BIT) == I2C_TIP_BIT ){status = i2c->sr;}

  }
  else // 2 bytes address
  {
  //i2c->cr_sr = (I2C_CR_STA_BIT|I2C_CR_WR_BIT);
  }

//Receive acknoledge from slave
if( (status & I2C_SR_RXACK_BIT)  != 0 ){
  i2c->cr = I2C_CR_STO_BIT;
  return false;
}
/*
uint32_t counter = 0;
 while( ((status & I2C_SR_RXACK_BIT) ==  I2C_SR_RXACK_BIT) & (counter < 64))
 {
   status = i2c->sr;
   counter++;
 }
 if(counter == 64)
 {
   return false;
 }
*/
 //const uint8_t mask = (stop) ? 0xFF : 0x00;


 for(uint16_t i= 0 ; i < n ; i++)
 {
    i2c->txr = data[i];
    i2c->cr = (i == n-1) ? I2C_CR_WR_BIT|I2C_CR_STO_BIT : I2C_CR_WR_BIT ;


    status = i2c->sr;
    while( (status & I2C_TIP_BIT) == I2C_TIP_BIT ){status = i2c->sr;}
    if( (status & I2C_SR_RXACK_BIT)  != 0 ){
      i2c->cr = I2C_CR_STO_BIT;
      return false;

}

  //
/*
  counter = 0;
  while( ((status & I2C_SR_RXACK_BIT) ==  I2C_SR_RXACK_BIT)&& (counter<64)  )
  {
    status = i2c->sr;
    counter++;
  }
  if(counter == 64)
  {
    return false;
  }
*/
 }

  return true;
}
bool i2c_master_receive(I2C* i2c,uint16_t adr,uint8_t* data,uint16_t size,bool stop)
{

  uint8_t status;
    if(adr < 256) // 1 byte address
    {
       uint8_t *a = (uint8_t*)&adr;
       i2c->txr = (a[0]|0x01);
       i2c->cr = (I2C_CR_STA_BIT|I2C_CR_WR_BIT);

       status = i2c->sr;
       while( (status & I2C_TIP_BIT) == I2C_TIP_BIT ){status = i2c->sr;}

    }
    else // 2 bytes address
    {
    //i2c->cr_sr = (I2C_CR_STA_BIT|I2C_CR_WR_BIT);
    }

    //Receive acknoledge from slave
    if( (status & I2C_SR_RXACK_BIT)  != 0 ){
      //i2c->cr = I2C_CR_STO_BIT;
      return false;
    }



    /*
    uint32_t counter = 0;
     while( ((status & I2C_SR_RXACK_BIT) ==  I2C_SR_RXACK_BIT)&& (counter<64)  )
     {
       status = i2c->sr;
       counter++;
     }
     if(counter == 64)
     {
       return false;
     }
*/


     for(uint16_t i = 0 ; i < size ; i++)
     {

        i2c->cr = ((i+1)==size ? (I2C_CR_RD_BIT|I2C_CR_NACK_BIT|I2C_CR_STO_BIT) : I2C_CR_RD_BIT );
      //  i2c_delay();
        status = i2c->sr;
        while( (status & I2C_TIP_BIT) == I2C_TIP_BIT ){status = i2c->sr;}
        data[i] = i2c->rxr;
        /*
        counter = 0;
        while( ((status & I2C_SR_RXACK_BIT) ==  I2C_SR_RXACK_BIT) && (counter<64))
        {
            status = i2c->sr;
            counter++;
        }
        if(counter == 64)
        {
          return false;
        }
        */


     }


//  i2c->cr = ;
  //i2c_delay();
//  status = i2c->sr;
//  while( (status & I2C_TIP_BIT) == I2C_TIP_BIT ){status = i2c->sr;}


 return true;

}

bool i2c_rcv(I2C* i2c, uint8_t address,uint8_t reg, uint8_t* rcv_data,const uint16_t rcv_size,bool reverse)
{
  //char debug[33];
  bool result = false;
 // uint8_t counter = 0;
  //do
 // {
   //  if(counter > 64)
   //  {
       //send_stop(i2c);
   //    return false;
 //    }
 //   counter++;
    address |= 0x00;
    result = write_byte(i2c,address,I2C_CR_STA_BIT|I2C_CR_WR_BIT);
    /*
    itoa(result,debug,10);
    spinal_uart_print(uart,"Result: ");
    spinal_uart_print_line(uart,debug);
    */
    if(result ==  true)
    {
     result = write_byte(i2c,reg,I2C_CR_WR_BIT);

     /*itoa(result,debug,10);
     spinal_uart_print(uart,"Result: ");
     spinal_uart_print_line(uart,debug);*/
     if(result == true)
     {
      address |= 0x01;
     result = write_byte(i2c,address,I2C_CR_STA_BIT|I2C_CR_WR_BIT);

     if(result == false)
     {
         send_stop(i2c);
       return result;
     }
     /*
     itoa(result,debug,10);
     spinal_uart_print(uart,"Result: ");
     spinal_uart_print_line(uart,debug);
     */
     //result = verify_ack(i2c);
     }
     else
     {
      send_stop(i2c);
     return result;
     }
    }
    else
    {
      send_stop(i2c);
      return result;
    }

 // }while(result == false);

  for( uint16_t i = 0 ; i < rcv_size ; i++)
  {
   if(!read_byte(i2c,rcv_data,i,rcv_size,reverse))
   {
     return false;
   }


  }


 //send_stop(i2c);
//    send_nack_stop(i2c);

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

 //do {
//    if(counter > 64)
//    {
//      send_nack_stop(i2c);
//      return false;
//    }
//    counter++;
   /* code */result = write_byte(i2c,address,I2C_CR_STA_BIT|I2C_CR_WR_BIT);
           result = write_byte(i2c,reg,I2C_CR_WR_BIT);
// } while(result == false );

  address |= 0x01;
   result = write_byte(i2c,address,I2C_CR_STA_BIT|I2C_CR_WR_BIT);
   /*
  while(!write_byte(i2c,address,I2C_CR_STA_BIT|I2C_CR_WR_BIT))
   {
     //return false;
   }
*/

  // for(uint8_t i = 0 ; i < 1000000 ; i++){}

  for( uint8_t i = 0 ; i < rcv_size ; i++)
  {
    read_byte(i2c,rcv_data,i,rcv_size,reverse);
  }

   //send_nack(i2c);
   //send_stop(i2c);
   send_nack_stop(i2c);//Bug

return true;

}





 bool read_byte(I2C* i2c,uint8_t* rcv_data,const uint8_t i,const uint16_t rcv_size, const bool reverse)
{

  //char debug[33];
  i2c->sr_cr = ((i+1)==rcv_size ? (I2C_CR_RD_BIT|I2C_CR_NACK_BIT) : I2C_CR_RD_BIT );

   uint8_t ack = i2c->sr_cr;

 //Wait TIP to negate

  while(( ack  & I2C_TIP_BIT) == I2C_TIP_BIT){ack = i2c->sr_cr;}
/*
  uint8_t counter = 0;
  while( ((ack & I2C_SR_RXACK_BIT) == 0x80) && (counter <64)  )
  {
   ack =  i2c->sr_cr;
    counter++;
  }

  if(counter==64)
  {
    return false;
  }
*/
  //Verify ack = 0 otherwise fail
//  ack = i2c->sr_cr;
//  if((ack&I2C_SR_RXACK_BIT) != 0){return false;}

  if(!reverse)
  {
    rcv_data[i] = i2c->rxr_txr;
  }
  else
  {
    rcv_data[rcv_size-1-i] = i2c->rxr_txr;
  }

 return true;
}

static void send_nack_stop(I2C* i2c)
{
  i2c->sr_cr = I2C_CR_NACK_BIT|I2C_CR_STO_BIT;
  while( (i2c->sr_cr & I2C_TIP_BIT)  == 0x02){}

}

static void send_nack(I2C* i2c)
{
  i2c->sr_cr = I2C_CR_NACK_BIT;
    while( (i2c->sr_cr & I2C_TIP_BIT)  == 0x02){}
}

static void send_stop(I2C* i2c)
{
    i2c->sr_cr = I2C_CR_STO_BIT;
      while( (i2c->sr_cr & I2C_TIP_BIT)  == 0x02){}
}

static bool write_byte(I2C* i2c,const uint8_t data,const uint8_t cr)
{

  i2c->rxr_txr = data;
    i2c->sr_cr = cr;
   uint8_t ack = i2c->sr_cr;


  uint8_t counter = 0;


   while( ((ack & I2C_TIP_BIT)  == 0x02 ) ){ack = i2c->sr_cr;}

  // ack =  i2c->sr_cr;
   while( ((ack & I2C_SR_RXACK_BIT) == 0x80) && (counter <64)  )
   {
    ack =  i2c->sr_cr;
     counter++;
   }

   if(counter==64)
   {
     return false;
   }

  return true;

}

static bool verify_ack(I2C *i2c)
{
  if( (i2c->sr_cr & I2C_SR_RXACK_BIT) == I2C_SR_RXACK_BIT )
  {
    return false;
  }
  return true;
}
