#ifndef I2C_H
#define I2C_H

#include <stdint.h>
#include <stdbool.h>




static const uint8_t I2C_CTR_EN_BIT = 0x80;
static const uint8_t I2C_CTR_IEN_BIT = 0x40;

static const uint8_t I2C_CR_STA_BIT = 0x80; // Start bit
static const uint8_t I2C_CR_STO_BIT = 0x40; // stop bit
static const uint8_t I2C_CR_RD_BIT = 0x20; //Read from slave
static const uint8_t I2C_CR_WR_BIT = 0x10; //Write to slave
static const uint8_t I2C_CR_NACK_BIT = 0x08;
static const uint8_t I2C_CR_IACK_BIT = 0x01; // Interrupt acknoledge, when set clear a pending interrupt

static const uint8_t I2C_SR_RXACK_BIT = 0x80;
static const uint8_t I2C_SR_BUSY_BIT = 0x40;
static const uint8_t I2C_AL_BIT = 0x20; //Arbitration lost
static const uint8_t I2C_TIP_BIT = 0x02; //Transfer in progress
static const uint8_t I2C_IF_BIT = 0x01;// Interrupt flag


typedef struct I2C
{
  volatile  uint8_t prescaler_lo;
  volatile  uint8_t prescaler_hi;
  volatile  uint8_t ctr;
  union{
  volatile  uint8_t rxr_txr; //write is transmit register
  volatile uint8_t rxr; //Read
  volatile uint8_t txr; //Write
};

  union{
      volatile  uint8_t sr_cr; //write is command register
      volatile uint8_t sr; // Read
      volatile uint8_t cr; //Write
  };

//  uint8_t txr; //Debug out of TXR
//  uint8_t cr; //Debug out of control register
//  uint8_t sladr; //Slave address register
}I2C;




void i2c_init(I2C** i2c,uint32_t BASE_ADDRESS);
bool i2c_enable(I2C* i2c);
void i2c_set_prescaler(I2C* i2c,uint32_t freq_in,uint32_t freq_out );

/*
void i2c_begin_transmission(I2C* i2c,uint8_t* address,uint8_t n);
void i2c_end_transmission(I2C* i2c);
void i2c_read(I2C* i2c,uint8_t*data,uint16_t n);
void i2c_write(I2C* i2c,uint8_t* data,uint16_t n);
*/
bool i2c_send(I2C* i2c, uint8_t address,uint8_t reg,uint8_t* data, const uint8_t size,bool reverse,bool stop);
bool i2c_rcv(I2C* i2c, uint8_t address,uint8_t reg,uint8_t* rcv_data,const uint16_t rcv_size,bool reverse);

bool i2c_master_transmit(I2C* i2c,uint16_t adr,const uint8_t *data,uint16_t size,bool stop);
bool i2c_master_receive(I2C* i2c,uint16_t adr,uint8_t* data,uint16_t size,bool stop);

bool i2c_rcv_delay(I2C* i2c, uint8_t address,uint8_t reg,uint8_t* rcv_data,const uint8_t rcv_size,bool reverse);


#endif
