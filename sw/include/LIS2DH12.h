#ifndef LIS2DH12_H
#define LIS2DH12_H

#include <stdint.h>

#include "SimpleSpi.h"

 static const uint8_t LIS2DH12_READ 			    = 0x80;
// static const uint8_t LIS2DH12_INC_ADR   		= 0x60;
//
//
//
static const uint8_t LIS2DH12_STATUS_REG_AUX	= 0x07;
static const uint8_t LIS2DH12_WHO_AM_I 		= 0x0F;
// static const uint8_t LIS3DH_CTRL_REG0		= 0x1E;
static const uint8_t LIS2DH12_TEMP_CFG_REG	= 0x1F;
static const uint8_t LIS2DH12_CTRL_REG1		= 0x20;
static const uint8_t LIS2DH12_CTRL_REG2		= 0x21;
static const uint8_t LIS2DH12_CTRL_REG3		= 0x22;
static const uint8_t LIS2DH12_CTRL_REG4		= 0x23;
static const uint8_t LIS2DH12_CTRL_REG5		= 0x24;
static const uint8_t LIS2DH12_CTRL_REG6		= 0x25;
static const uint8_t LIS2DH12_REFERENCE		= 0x26;
static const uint8_t LIS2DH12_STATUS_REG 	= 0x27;
static const uint8_t LIS2DH12_OUT_X_L		= 0x28;
static const uint8_t LIS2DH12_OUT_X_H 		= 0x29;
static const uint8_t LIS2DH12_OUT_Y_L 		= 0x2A;
static const uint8_t LIS2DH12_OUT_Y_H 		= 0x2B;
static const uint8_t LIS2DH12_OUT_Z_L 		= 0x2C;
static const uint8_t LIS2DH12_OUT_Z_H 		= 0x2D;
static const uint8_t LIS2DH12_FIFO_CTRL_REG	= 0x2E;
static const uint8_t LIS2DH12_FIFO_SRC_REG	= 0x2F;


void lis2dh12_who_am_i(SimpleSpi* spi,uint8_t* who_am_i);
void lis2dh12_read_status(SimpleSpi* spi,uint8_t* value);
void lis2dh12_read_sensor_x(SimpleSpi* spi,uint16_t* value);
void lis2dh12_read_sensor_y(SimpleSpi* spi,uint16_t* value);
void lis2dh12_read_sensor_z(SimpleSpi* spi,uint16_t* value);
void lis2dh12_read_sensor(SimpleSpi* spi,const uint8_t reg,uint8_t *value);
void lis2dh12_write_sensor(SimpleSpi* spi,const uint8_t reg,const uint8_t value);


#endif
