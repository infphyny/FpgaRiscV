#include "LIS2DH12.h"



void lis2dh12_read_status(SimpleSpi* spi,uint8_t* value)
{
  spi->ss = 0x01;
   simple_spi_send_rcv(spi,LIS2DH12_STATUS_REG|LIS2DH12_READ,value);
   simple_spi_send_rcv(spi,LIS2DH12_STATUS_REG|LIS2DH12_READ,value);
   spi->ss = 0x00;
}


void lis2dh12_read_sensor_x(SimpleSpi* spi, uint16_t* value)
{

 uint8_t *value_8 = (uint8_t*)value;

   spi->ss = 0x01;
   simple_spi_send_rcv(spi,LIS2DH12_OUT_X_L|LIS2DH12_READ,&value_8[0]);
   simple_spi_send_rcv(spi,/*LIS2DH12_OUT_X_L|LIS2DH12_READ*/0x00,&value_8[0]);
   spi->ss = 0x00;
   spi->ss = 0x01;
   simple_spi_send_rcv(spi,LIS2DH12_OUT_X_H|LIS2DH12_READ,&value_8[1]);
   simple_spi_send_rcv(spi,/*LIS2DH12_OUT_X_H|LIS2DH12_READ*/0x00,&value_8[1]);
   spi->ss = 0x00;
}

void lis2dh12_read_sensor_y(SimpleSpi* spi, uint16_t* value)
{

 uint8_t *value_8 = (uint8_t*)value;

   spi->ss = 0x01;
   simple_spi_send_rcv(spi,LIS2DH12_OUT_Y_L|LIS2DH12_READ,&value_8[0]);
   simple_spi_send_rcv(spi,/*LIS2DH12_OUT_Y_L|LIS2DH12_READ*/0x00,&value_8[0]);
   spi->ss = 0x00;
   spi->ss = 0x01;
   simple_spi_send_rcv(spi,LIS2DH12_OUT_Y_H|LIS2DH12_READ,&value_8[1]);
   simple_spi_send_rcv(spi,/*LIS2DH12_OUT_Y_H|LIS2DH12_READ*/0x00,&value_8[1]);
   spi->ss = 0x00;
}

void lis2dh12_read_sensor_z(SimpleSpi* spi, uint16_t* value)
{

 uint8_t *value_8 = (uint8_t*)value;

   spi->ss = 0x01;
   simple_spi_send_rcv(spi,LIS2DH12_OUT_Z_L|LIS2DH12_READ,&value_8[0]);
   simple_spi_send_rcv(spi,/*LIS2DH12_OUT_Z_L|LIS2DH12_READ*/0x00,&value_8[0]);
   spi->ss = 0x00;
   spi->ss = 0x01;
   simple_spi_send_rcv(spi,LIS2DH12_OUT_Z_H|LIS2DH12_READ,&value_8[1]);
   simple_spi_send_rcv(spi,/*LIS2DH12_OUT_Z_H|LIS2DH12_READ*/0x00,&value_8[1]);
   spi->ss = 0x00;
}



void lis2dh12_read_sensor(SimpleSpi* spi,const uint8_t reg,uint8_t *value)
{

 spi->ss = 0x01;
   simple_spi_send_rcv(spi,reg|LIS2DH12_READ,value);
   simple_spi_send_rcv(spi,/*reg*/0x00,value);
 spi->ss = 0x00;

}

void lis2dh12_write_sensor(SimpleSpi* spi,const uint8_t reg,const uint8_t value)
{
  uint8_t dummy_rcv;
 spi->ss = 0x01;
   simple_spi_send_rcv(spi,reg,&dummy_rcv);
   simple_spi_send_rcv(spi,value,&dummy_rcv);
 spi->ss = 0x00;


}




void lis2dh12_who_am_i(SimpleSpi* spi,uint8_t* who_am_i)
{
  spi->ss = 0x01;
  simple_spi_send_rcv(spi,LIS2DH12_WHO_AM_I|LIS2DH12_READ,who_am_i);
  simple_spi_send_rcv(spi,/*LIS3DH_WHO_AM_I|LIS3DH_READ*/0x00,who_am_i);
  spi->ss = 0x00;
}
