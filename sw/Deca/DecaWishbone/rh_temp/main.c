#include <stdbool.h>
#include <stdint.h>
#include <stdlib.h>

#include "deca_bsp.h"
//#include "Deca.h"

//#include "i2c.h"
#include "SpinalI2c.h"
#include "HDC1000.h"
#include "SpinalUart.h"

//I2C address of HDC1000 rh temp sensor
const uint8_t address = 0x40;


void main(void)
{

deca_init();

char temperature[16];
char humidity[16];
SpinalUart* uart;
SpinalI2C* i2c;

uint16_t hdc1000_config;
char hdc1000_config_string[16];

spinal_uart_init(&uart,UART_0_BASE_ADDRESS);
delay(10);
spinal_uart_print_line(uart,"RH Temp sensor demo");

i2c = (SpinalI2C*)(RH_TEMP_BASE_ADDRESS);
spinal_i2c_init(i2c,50000,250,250,1000,5,5);
HDC1000DeviceInfo   di;


bool result;
//Acquire temperature and humidity

hdc1000_get_config(i2c,address,&hdc1000_config);
itoa(hdc1000_config,hdc1000_config_string,16);

spinal_uart_print_line(uart,hdc1000_config_string);


 hdc1000_get_device_info(i2c,address,&di);

spinal_uart_print(uart,"Manufacturer id:0x");
spinal_uart_print_line(uart,di.manufacturer);
spinal_uart_print(uart,"Device id:0x");
spinal_uart_print_line(uart,di.id);


result = hdc1000_configure(i2c,address,0x00);
if(result == false)
{
  spinal_uart_print_line(uart,"Unable to configure HDC1000 sensors");
}


result = hdc1000_get_config(i2c,address,&hdc1000_config);
itoa(hdc1000_config,hdc1000_config_string,16);

if(result == false)
{
  spinal_uart_print_line(uart,"Unable to get config of HDC1000 sensors");
}else
{

spinal_uart_print_line(uart,hdc1000_config_string);

}

  for(;;)
  {

     delay(500);

    if(!hdc1000_read_measure(i2c,address,temperature,humidity))
    {
      spinal_uart_print_line(uart,"Unable to read measure");
    }
    spinal_uart_print(uart,"Temp: ");
    spinal_uart_print_line(uart,temperature);
    spinal_uart_print(uart,"RH: ");
    spinal_uart_print_line(uart,humidity);
  }


}
