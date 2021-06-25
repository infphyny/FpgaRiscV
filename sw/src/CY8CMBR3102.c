#include "CY8CMBR3102.h"

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
