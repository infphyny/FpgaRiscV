/*

 MEMS digital output motion sensor:
ultra-low-power high-performance 3-axis "nano" accelerometer


*/



#ifndef LIS3DH_H
#define LIS3DH_H


#include <stdint.h>



static const uint8_t LIS3DH_READ 		= 0x80;
static const uint8_t LIS3DH_INC_ADR   		= 0x60;



static const uint8_t LIS3DH_STATUS_REG_AUX	= 0x07;   
static const uint8_t LIS3DH_WHO_AM_I 		= 0x0F;
static const uint8_t LIS3DH_CTRL_REG0		= 0x1E;
static const uint8_t LIS3DH_TEMP_CFG_REG	= 0x1F;
static const uint8_t LIS3DH_CTRL_REG1		= 0x20;
static const uint8_t LIS3DH_CTRL_REG2		= 0x21;
static const uint8_t LIS3DH_CTRL_REG3		= 0x22;
static const uint8_t LIS3DH_CTRL_REG4		= 0x23;
static const uint8_t LIS3DH_CTRL_REG5		= 0x24;
static const uint8_t LIS3DH_CTRL_REG6		= 0x25;
static const uint8_t LIS3DH_REFERENCE		= 0x26;
static const uint8_t LIS3DH_STATUS_REG 		= 0x27;
static const uint8_t LIS3DH_OUT_X_L		    = 0x28;
static const uint8_t LIS3DH_OUT_X_H 		= 0x29;
static const uint8_t LIS3DH_OUT_Y_L 		= 0x2A;
static const uint8_t LIS3DH_OUT_Y_H 		= 0x2B;
static const uint8_t LIS3DH_OUT_Z_L 		= 0x2C;
static const uint8_t LIS3DH_OUT_Z_H 		= 0x2D;
static const uint8_t LIS3DH_FIFO_CTRL_REG	= 0x2E;
static const uint8_t LIS3DH_FIFO_SRC_REG	= 0x2F;


#endif 
