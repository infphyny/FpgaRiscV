/*


 Software library for fusesoc simple spi peripheral based on MC68HC11E.

*/

//const uint8_t SIMPLESPI_DIV_8 = 0x02;
//const uint8_t SIMPLESPI_DIV_

#ifndef SIMPLESPI_H
#define SIMPLESPI_H

#include <stdint.h>
#include <stdbool.h>


typedef struct SimpleSpi
{
 
 
 volatile uint8_t ctrl; 
 volatile uint8_t status;
 volatile uint8_t data;
 volatile uint8_t ctrl_ext; // High 2 bits of frequency divider
 volatile uint8_t ss;  // Slave select
// uint8_t send;

}SimpleSpi;


void simple_spi_init(SimpleSpi** spi,uint32_t base_address);
bool simple_spi_send_rcv(SimpleSpi* spi,const uint8_t send,uint8_t* rcv);


#endif
