/*
  Code that use SpinalHDL I2C controller: https://github.com/lawrie/MuraxArduino/blob/master/libraries/Wire/Wire.cpp
*/


/* Output of sbt run
[info] Address 0x0 :
[info]   W[7:0] bridge_txData_value
[info]   W[10:10] bridge_txData_repeat
[info]   W[11:11] bridge_txData_disableOnDataConflict
[info]   W[8:8] bridge_txData_valid
[info]   R[8:8] bridge_txData_valid
[info]   W[9:9] bridge_txData_enable
[info]   R[9:9] bridge_txData_enable
[info] Address 0x4 :
[info]   W[0:0] bridge_txAck_value
[info]   W[10:10] bridge_txAck_repeat
[info]   W[11:11] bridge_txAck_disableOnDataConflict
[info]   W[8:8] bridge_txAck_valid
[info]   R[8:8] bridge_txAck_valid
[info]   W[9:9] bridge_txAck_enable
[info]   R[9:9] bridge_txAck_enable
[info] Address 0x8 :
[info]   W[9:9] bridge_rxData_listen
[info]   R[8:8] bridge_rxData_valid
[info]   R[7:0] bridge_rxData_value
[info] Address 0xc :
[info]   W[9:9] bridge_rxAck_listen
[info]   R[8:8] bridge_rxAck_valid
[info]   R[0:0] bridge_rxAck_value
[info] Address 0x20 :
[info]   W[0:0] bridge_interruptCtrl_rxDataEnable
[info]   R[0:0] bridge_interruptCtrl_rxDataEnable
[info]   W[1:1] bridge_interruptCtrl_rxAckEnable
[info]   R[1:1] bridge_interruptCtrl_rxAckEnable
[info]   W[2:2] bridge_interruptCtrl_txDataEnable
[info]   R[2:2] bridge_interruptCtrl_txDataEnable
[info]   W[3:3] bridge_interruptCtrl_txAckEnable
[info]   R[3:3] bridge_interruptCtrl_txAckEnable
[info]   W[4:4] bridge_interruptCtrl_start_enable
[info]   R[4:4] bridge_interruptCtrl_start_enable
[info]   W[5:5] bridge_interruptCtrl_restart_enable
[info]   R[5:5] bridge_interruptCtrl_restart_enable
[info]   W[6:6] bridge_interruptCtrl_end_enable
[info]   R[6:6] bridge_interruptCtrl_end_enable
[info]   W[7:7] bridge_interruptCtrl_drop_enable
[info]   R[7:7] bridge_interruptCtrl_drop_enable
[info]   W[17:17] bridge_interruptCtrl_filterGen_enable
[info]   R[17:17] bridge_interruptCtrl_filterGen_enable
[info]   W[16:16] bridge_interruptCtrl_clockGen_enable
[info]   R[16:16] bridge_interruptCtrl_clockGen_enable
[info] Address 0x24 :
[info]   R[4:4] bridge_interruptCtrl_start_flag
[info]   R[5:5] bridge_interruptCtrl_restart_flag
[info]   R[6:6] bridge_interruptCtrl_end_flag
[info]   R[7:7] bridge_interruptCtrl_drop_flag
[info]   R[17:17] bridge_interruptCtrl_filterGen_flag
[info]   R[16:16] bridge_interruptCtrl_clockGen_flag
[info] Address 0x28 :
[info]   W[9:0] _zz_io_config_samplingClockDivider
[info] Address 0x2c :
[info]   W[19:0] _zz_io_config_timeout
[info] Address 0x30 :
[info]   W[5:0] _zz_io_config_tsuData
[info] Address 0x40 :
[info]   R[4:4] bridge_masterLogic_start
[info]   R[5:5] bridge_masterLogic_stop
[info]   R[6:6] bridge_masterLogic_drop
[info]   R[0:0] bridge_masterLogic_fsm_isBusy
[info] Address 0x50 :
[info]   W[11:0] bridge_masterLogic_timer_tLow
[info] Address 0x54 :
[info]   W[11:0] bridge_masterLogic_timer_tHigh
[info] Address 0x58 :
[info]   W[11:0] bridge_masterLogic_timer_tBuf
[info] Address 0x80 :
[info]   R[-2:0]
[info] Address 0x84 :
[info]   R[0:0]
[info] Address 0x88 :
[info]   W[9:0] bridge_addressFilter_addresses_0_value
[info]   W[14:14] bridge_addressFilter_addresses_0_is10Bit
[info]   W[15:15] bridge_addressFilter_addresses_0_enable
[info] Address 0x8c :
[info]   W[9:0] bridge_addressFilter_addresses_1_value
[info]   W[14:14] bridge_addressFilter_addresses_1_is10Bit
[info]   W[15:15] bridge_addressFilter_addresses_1_enable
[info] Address 0x90 :
[info]   W[9:0] bridge_addressFilter_addresses_2_value
[info]   W[14:14] bridge_addressFilter_addresses_2_is10Bit
[info]   W[15:15] bridge_addressFilter_addresses_2_enable
[info] Address 0x94 :
[info]   W[9:0] bridge_addressFilter_addresses_3_value
[info]   W[14:14] bridge_addressFilter_addresses_3_is10Bit
[info]   W[15:15] bridge_addressFilter_addresses_3_enable

*/



#ifndef SPINAL_I2C_H
#define SPINAL_I2C_H
#include <stdbool.h>
#include <stdlib.h>
#include <stdint.h>



#define I2C_MASTER_IS_BUSY (1 << 0)
#define I2C_MASTER_START (1 << 4)
#define I2C_MASTER_STOP (1 << 5)

#define I2C_TX_ENABLE (1 << 9)
#define I2C_TX_VALID (1 << 8)

#define I2C_RX_ENABLE (1 << 9)
#define I2C_RX_VALID (1 << 8)
#define I2C_RX_LISTEN (1 << 9)

#define I2C_MAX_READ 10

#define I2C_MAX_TRIES 100000




typedef struct SpinalI2C
{
  //0x00

  volatile    uint32_t tx_data;


  //0x04
  volatile uint32_t tx_ack;
  //0x08

  volatile    uint32_t rx_data;


 //0x0C
  volatile uint32_t rx_ack;

  volatile uint32_t rx_ack_dummy[4];

 //0x20
 volatile uint32_t interrupt;

 //0x24
 volatile uint32_t interrupt_clear;

 //0x28
 volatile uint32_t sampling_clock_divider;

 //0x2c
 volatile uint32_t timeout;

 //0x30
 volatile uint32_t tsu_dat;
 volatile uint32_t tsu_dat_dummy[3];

 //0x40
 volatile uint32_t master_status;
 volatile uint32_t master_dummy[3];

 //0x50
 volatile uint32_t timer_low;

 //0x54
 volatile uint32_t timer_high;

 //0x58
 volatile uint32_t timer_buf;

 //0x5C
 volatile uint32_t dummy[9];

 //0x80
volatile uint32_t filtering_status;

//0x84
volatile uint32_t hit_context[6];

}SpinalI2C;

void spinal_i2c_init(SpinalI2C* i2c,
                    uint32_t timeout,
                    uint32_t timer_low,
                    uint32_t timer_high,
                    uint32_t timer_buf,
                    uint32_t tsu_dat,
                    uint32_t sampling_clock_divider);

size_t spinal_i2c_read(SpinalI2C* i2c,uint8_t* data,size_t n);
bool spinal_i2c_start(SpinalI2C* i2c,uint8_t address,bool read);
void spinal_i2c_stop(SpinalI2C* i2c);
size_t spinal_i2c_write(SpinalI2C* i2c,uint8_t* data, size_t n );


#endif
