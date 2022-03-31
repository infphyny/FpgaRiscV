#include "CY8CMBR3102.h"

#ifdef USE_I2C

static bool  CY8CMBR3102_i2c_rcv(I2C* i2c, uint8_t address,uint8_t reg,uint8_t* rcv_data,const uint8_t rcv_size,bool reverse)
{
   uint8_t try = 0;
   bool result = false;
//   do
//   {
  //     try++;
      result = i2c_rcv(i2c,address,reg,rcv_data,rcv_size,reverse);
//   }while( (result == false) &&( try<=32 ));

}


bool CY8CMBR3102_button_stat(I2C* i2c,uint8_t* button_stat)
{
   bool result = false;
   uint8_t reg = CY8CMBR3102_BUTTON_STAT;
   result = i2c_master_transmit(i2c,CY8CMBR3102_ADDRESS,&reg,1,false);
   if(!result){return result;}

   return i2c_master_receive(i2c,CY8CMBR3102_ADDRESS,button_stat,2,true);
}


bool CY8CMBR3102_family_id(I2C* i2c,uint8_t*family_id)
{
   //bool result = false;
   if(!i2c_master_transmit(i2c,CY8CMBR3102_ADDRESS,&CY8CMBR3102_FAMILY_ID,1,false))
   {
     return false;
   }

   return i2c_master_receive(i2c,CY8CMBR3102_ADDRESS,family_id,1,true);
   //return i2c_rcv(i2c,CY8CMBR3102_ADDRESS,CY8CMBR3102_FAMILY_ID,family_id,1,false);
}

void CY8CMBR3102_sensor_id(I2C* i2c,uint8_t* sensor_id)
{
  i2c_rcv(i2c,CY8CMBR3102_ADDRESS,CY8CMBR3102_SENSOR_ID,sensor_id,1,false);
}
#endif


#ifdef _USE_SPINAL_I2C
#include "SpinalI2c.h"
bool CY8CMBR3102_button_stat(SpinalI2C* i2c,uint8_t* button_stat)
{
  return false;
}


bool CY8CMBR3102_family_id(SpinalI2C* i2c,uint8_t* family_id)
{

  do
  {
    for(uint32_t i=0;i<I2C_MAX_TRIES && (i2c->master_status & I2C_MASTER_IS_BUSY);i++) {}
  }while(!spinal_i2c_start(i2c,CY8CMBR3102_ADDRESS,false));
  size_t n;
  //Write register we want to read
   n= spinal_i2c_write(i2c,&CY8CMBR3102_FAMILY_ID,1);
  //Send a stop
   spinal_i2c_stop(i2c);

   do
   {
    for(uint32_t i=0;i<I2C_MAX_TRIES && (i2c->master_status & I2C_MASTER_IS_BUSY);i++) {}
   }while(!spinal_i2c_start(i2c,CY8CMBR3102_ADDRESS,true));
   spinal_i2c_read(i2c,family_id,1);
   spinal_i2c_stop(i2c);

   return true;

}


#endif
