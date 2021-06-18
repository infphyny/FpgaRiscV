#include "SimpleSpi.h"

void simple_spi_init(SimpleSpi** spi,uint32_t spi_base_address)
{

  *spi = (SimpleSpi*) spi_base_address;

}

bool simple_spi_send_rcv(SimpleSpi* spi,const uint8_t send,uint8_t* rcv)
{
// spi->ss = 0x01;

  spi->data = send;

  //volatile uint8_t read_status = spi->status;
  while( (spi->status>>7) != 0x01 )
  	{

  	}

  	uint8_t read_status = spi->status;
  //read_status = spi->status;
  spi->status |= 0xEF; //Clear SPIF
  *rcv = spi->data;
 // spi->ss = 0x00;
   return ( (spi->status & 0x10) != 0x10);
  //spi->status |= 0xEF; //Clear SPIF

}
