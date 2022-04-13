/*
EDID: ADV7513 programming guide

Programming guide p.14
 Power Up sequence:
0x98  R/W [7:0] 00001011  Fixed Must be set to 0x03 for proper operation
0x9A  R/W [7:1] 0000000*  Fixed Must be set to 0b1110000
0x9C  R/W [7:0] 01011010  FixedMust be set to 0x30 for proper operation
0x9D  R/W [1:0] ******00  FixedMust be set to 0b01 for proper operation
0xA2  R/W [7:0] 10000000  Fixed Must be set to 0xA4 for proper operation
0xA3  R/W [7:0] 10000000  Fixed Must be set to 0xA4 for proper operation
0xE0  R/W [7:0] 10000000  FixedMust be set to 0xD0 for proper operation
0xF9  R/W [7:0] 01111100  FixedMust be set to 0x00 for proper operation

Programming guide Table 25 DE and HSync/Vsync Generation Common Format Settings

Max 10 PLL frequency reconfig equation ug_m10_clkpll.pdf
fOUT = fVCO/C = (fREF × M)/C = (fIN × M)/(N × C),
M = M_h+M_l
N = N_h + N_l
C = C_h + C_l

example for fIN = 50 MHz and fOUT = 74 MHz
Computed by ALTPLL
M_h = 19,M_l = 18,N_h = 3,N_l = 2,C_h = 3,C_l = 2

*/

#include <stdbool.h>
#include <stdint.h>
#include <stdlib.h>
#include <string.h>

#include "deca_bsp.h"
#include "SpinalUart.h"
#include "SpinalI2c.h"
#include "SpinalVga.h"
#include "LedCtrl.h"

typedef struct ADV7513RegVal
{
  uint8_t reg;
  uint8_t val;
}ADV7513RegVal;


//#define SIM 1
//#define HDMI_SETTINGS_DEBUG 1

SpinalUart* uart;
SpinalI2C* i2c;
SpinalVgaSettings* hdmi_settings;

const uint8_t ADV7513_I2C_ADR_MAIN = 0x39;
const uint8_t ADV7513_EDID_MEM_ADR = 0x43;

const uint8_t ADV7513_CHIP_REVISION = 0x00;
const uint8_t ADV7513_POWER_DOWN = 0x41;

void printVgaAttribute(SpinalUart* uart,char* attribute_name,uint32_t attribute);
void printVgaTimings(SpinalUart* uart,SpinalVgaSettings* vga);

void main(void)
{

  ADV7513RegVal adv_7513_settings[] ={
    {.reg = 0x98, .val = 0x03}, //Must be set to 0x03 for proper operation
    {.reg = 0x01, .val = 0x00}, //Set 'N' value at 6144
    {.reg = 0x02, .val = 0x18}, //Set 'N' value at 6144
    {.reg = 0x03, .val = 0x00}, //Set 'N' value at 6144
    {.reg = 0x14, .val = 0x70}, // Set Ch count in the channel status to 8.
    {.reg = 0x15, .val = 0x20}, //Input 444 (RGB or YCrCb) with Separate Syncs, 48kHz fs
    {.reg = 0x16, .val = 0x30}, //Output format 444, 24-bit input
    {.reg = 0x18, .val = 0x40}, //Disable CSC
    {.reg = 0x40, .val = 0x80}, //General control packet enable
    {.reg = 0x41, .val = 0x10}, //Power down control
    {.reg = 0x44, .val = 0x00}, //Audio packet enable bit 5
    {.reg = 0x49, .val = 0xA8}, //Set dither mode - 12-to-10 bit
    {.reg = 0x55, .val = 0x10},//Set RGB in AVI infoframe
    {.reg = 0x56, .val = 0x08}, //Set active format aspect
    {.reg = 0x96, .val = 0xF6}, // Set interrupt
    {.reg = 0x73, .val = 0x07}, //Info frame Ch count to 8
    {.reg = 0x76, .val = 0x1F}, //Set speaker allocation for 8 channels
    {.reg = 0x98, .val = 0x03}, //Must be set to 0x03 for proper operation
    {.reg = 0x99, .val = 0x02}, // Must be set to Default Value
    {.reg = 0x9A, .val = 0xE0}, //Must be set to 0b1110000
    {.reg = 0x9C, .val = 0x30}, //PLL filter R1 value
    {.reg = 0x9D, .val = 0x61}, //Set clock divide  // 0x0x61
    {.reg = 0xA2, .val = 0xA4}, //Must be set to 0xA4 for proper operation
    {.reg = 0xA3, .val = 0xA4}, //Must be set to 0xA4 for proper operation
    {.reg = 0xA5, .val = 0x04},  //Must be set to Default Value
    {.reg = 0xAB, .val = 0x40}, // Must be set to Default Value
    {.reg = 0xAF, .val = 0x16}, //Select HDMI mode
    {.reg = 0xBA, .val = 0x60}, //No clock delay
    {.reg = 0xD1, .val = 0xFF}, // Must be set to Default Value
    {.reg = 0xDE, .val = 0x10}, //Must be set to Default for proper operation
    {.reg = 0xE4, .val = 0x60}, //Must be set to Default Value
    {.reg = 0xFA, .val = 0x7D}, // Nbr of times to look for good phase
    {.reg = 0x00, .val = 0x00} // End of programming
  };
//  uint8_t adv_7513_init_reg[] = {0x41,0x98,0x9A,0x9C,0x9D,0xA2,0xA3,0xE0,0xF9,0x16,0x18,0xAF};
//  uint8_t adv_7513_init_val[] = {0x40,0x03,0xE0,0x30,0x01,0xA4,0xA4,0xD0,0x00,0x30,0x46,0x16};
  char sint[32];
  uint8_t buffer[32];
  memset(buffer,0,32);
  uint32_t* t = (uint32_t*)&buffer[0];
  deca_init();
  #ifndef SIM
  delay(10);
  #endif
  spinal_uart_init(&uart,UART_0_BASE_ADDRESS);

  i2c = (SpinalI2C*)HDMI_TX_BASE_ADDRESS;
  spinal_i2c_init(i2c,50000,250,250,1000,5,5);

  spinal_uart_print_line(uart,"HDMI test");

  hdmi_settings = (SpinalVgaSettings*)HDMI_CTRL_BASE_ADDRESS;
  // 720p timings

  #ifdef HDMI_SETTINGS_DEBUG
  // hdmi_settings->hv_polarity = 0;
   hdmi_settings->hSyncStart = 0;
   for(uint32_t i = 0 ; i < 256; i++)
   {

     hdmi_settings->hSyncStart += 1;
   }
  #endif

  spinal_compute_vga_timings(
    40,5,220,110,20,5,1280,720,
    SPINAL_VGA_H_POL_LOW,SPINAL_VGA_V_POL_LOW,
    hdmi_settings
  );
  hdmi_settings->hv_polarity &= ~0x04;//Pull Hdmi controller soft reset low

  //Read revision of the chip
  #ifndef SIM
  printVgaTimings(uart,hdmi_settings);
  delay(500); //Wait at least 200 ms before ADV7513 initialize.

  spinal_i2c_poll_start(i2c,ADV7513_I2C_ADR_MAIN,SPINAL_I2C_WRITE,64);
  spinal_i2c_write(i2c,&ADV7513_CHIP_REVISION/*&ADV7513_CHIP_REVISION*/,1);

  //The following delay is needed, otherwise the restart signal is lost and the
  //i2c read command is interpreted as a write. Debugged with pulseview i2c decoder.
  for(uint32_t i=0;i<I2C_MAX_TRIES && (i2c->master_status & I2C_MASTER_IS_BUSY);i++) {};
  spinal_i2c_start(i2c,ADV7513_I2C_ADR_MAIN,SPINAL_I2C_READ);
  spinal_i2c_read(i2c,&buffer[0],1);
  spinal_i2c_stop(i2c);

  utoa(*t,sint,2);
  spinal_uart_print(uart,"ADV7513 chip revision: 0b");
  spinal_uart_print_line(uart,sint);

  //Before  execute initialization sequence, wait for HDMI_TX_INT = 1
/*
  uint32_t hdmi_tx_int_status = hdmi_settings->hv_polarity;
  while( !((uint8_t)hdmi_tx_int_status & 0x08) )
  {
    utoa(hdmi_tx_int_status,sint,10);
    spinal_uart_print(uart,"hdmi_tx_int: ");
    spinal_uart_print_line(uart,sint);
    delay(100);
  }*/
  //Initialization sequence

  do {
    /* code */
  uint32_t i = 0;
  while(adv_7513_settings[i].reg != 0x00)
  {
    spinal_i2c_poll_start(i2c,ADV7513_I2C_ADR_MAIN,SPINAL_I2C_WRITE,64);
    spinal_i2c_write(i2c,&adv_7513_settings[i].reg,1);
    spinal_i2c_write(i2c,&adv_7513_settings[i].val,1);
    spinal_i2c_stop(i2c);
    delay(1);
    i++;
  }
   } while(!((uint8_t)  hdmi_settings->hv_polarity & 0x08) );


  // Waveshare 800x480 timings
  /*
  spinal_compute_vga_timings(
    30,10,23,23,
    13,12,800,480,hdmi_settings
  );
  */




  //Read power down mode
  //spinal_i2c_poll_start(i2c,ADV7513_I2C_ADR_MAIN,SPINAL_I2C_WRITE,64);
  //spinal_i2c_write(i2c,&ADV7513_CHIP_REVISION/*&ADV7513_CHIP_REVISION*/,1);



  spinal_uart_print_line(uart,sint);

  spinal_uart_print_line(uart,"Retreiving monitor information");
  #endif


  for(;;)
  {

  }

}


void printVgaTimings(SpinalUart* uart,SpinalVgaSettings* vga)
{
  //Read vga timings
//  uint32_t temp = vga->hSyncStart;
  //
  // utoa(temp,sint,10);
  // spinal_uart_print(uart,"hSyncStart: ");
  // spinal_uart_print_line(uart,sint);
  //
  // temp = vga->hSyncEnd;
  // utoa(temp,sint,10);
  // spinal_uart_print(uart,"hSyncEnd: ");
  // spinal_uart_print_line(uart,sint);
  //
  // temp = vga->hSyncEnd;
  // utoa(temp,sint,10);
  // spinal_uart_print(uart,"hSyncEnd: ");
  // spinal_uart_print_line(uart,sint);
  //
  // temp = vga->hColorStart;
  // utoa(temp,sint,10);
  // spinal_uart_print(uart,"hSyncEnd: ");
  // spinal_uart_print_line(uart,sint);

  printVgaAttribute(uart,"hSyncStart",vga->hSyncStart);
  printVgaAttribute(uart,"hSyncEnd",vga->hSyncEnd);
  printVgaAttribute(uart,"hColorStart",vga->hColorStart);
  printVgaAttribute(uart,"hColorEnd",vga->hColorEnd);
  printVgaAttribute(uart,"vSyncStart",vga->vSyncStart);
  printVgaAttribute(uart,"vSyncEnd",vga->vSyncEnd);
  printVgaAttribute(uart,"vColorStart",vga->vColorStart);
  printVgaAttribute(uart,"vColorEnd",vga->vColorEnd);


}


void printVgaAttribute(SpinalUart* uart,char* attribute_name,uint32_t attribute)
{
  char sint[33];
  utoa(attribute,sint,10);
  spinal_uart_print(uart,attribute_name);
  spinal_uart_print(uart,": ");
  spinal_uart_print_line(uart,sint);

}
