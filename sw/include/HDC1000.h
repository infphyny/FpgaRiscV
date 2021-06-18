#ifndef HDC1000_H
#define HDC1000_H

#include "i2c.h"

static const uint8_t HDC1000_TEMP_REG = 0x00;
static const uint8_t HDC1000_RH_REG = 0x01;
static const uint8_t HDC1000_CONF_REG = 0x02;
static const uint8_t HDC1000_SERIAL_0 = 0xFB;
static const uint8_t HDC1000_SERIAL_1 = 0xFC;
static const uint8_t HDC1000_SERIAL_2 = 0xFD;
static const uint8_t HDC1000_MANUFACTURER_ID = 0xFE;
static const uint8_t HDC1000_DEVICE_ID = 0xFF;

static const uint16_t HDC1000_TEMP_RH_BIT = 0x1000;
static const uint16_t HDC1000_TEMP_RES_BIT = 0x0400;
static const uint16_t HDC1000_RH_RES_BIT = 0x0300;

static const uint16_t HDC1000_TEMP_RH_ACQ = 0x1000;
static const uint16_t HDC1000_TEMP_RES_11_BITS = 0x0400;
static const uint16_t HDC1000_RH_RES_11_BITS = 0x0100;
static const uint16_t HDC1000_RH_RES_8_BITS = 0x0300;


typedef struct HDC1000DeviceInfo
{
  char serial[6];
  char manufacturer[5];
  char id[5];
}HDC1000DeviceInfo;


//void hdc1000_init(I2C* i2c,const uint16_t conf);


bool hdc1000_get_config(I2C* i2c,const uint8_t address,uint16_t* conf);
bool hdc1000_configure(I2C* i2c,const uint8_t address,const uint16_t conf);

void hdc1000_get_device_info(I2C* i2c,uint8_t address ,HDC1000DeviceInfo* di);
bool hdc1000_read_measure(I2C* i2c,const uint8_t address,char temp[16],char rh[16]);
bool hdc1000_trigger_measure(I2C* i2c,const uint8_t address);

#endif
