
/*

 Description: Library that initialize and monitor the status of the the two capacitive button sensors

 Example:


*/


#ifndef CY8CMBR3102_H
#define CY8CMBR3102_H

#include <stdbool.h>
#include <stdint.h>


static const uint8_t CY8CMBR3102_FAMILY_ID = 0x8F;
static const uint8_t CY8CMBR3102_SENSOR_ID = 0x82;
static const uint8_t CY8CMBR3102_BUTTON_STAT = 0xaa;


#ifdef USE_I2C
#include "i2c.h"
static const uint8_t CY8CMBR3102_ADDRESS = 0x6E;
bool CY8CMBR3102_button_stat(I2C* i2c,uint8_t* button_stat);
bool CY8CMBR3102_family_id(I2C* i2c,uint8_t* family_id);
void CY8CMBR3102_sensor_id(I2C* i2c,uint8_t* sensor_id);
#endif

#ifdef USE_SPINAL_I2C
#include "SpinalI2c.h"
#define _USE_SPINAL_I2C 1

static const uint8_t CY8CMBR3102_ADDRESS = 0x37;
bool CY8CMBR3102_button_stat(SpinalI2C* i2c,uint8_t* button_stat);
bool CY8CMBR3102_family_id(SpinalI2C* i2c,uint8_t* family_id);


#endif


#endif
