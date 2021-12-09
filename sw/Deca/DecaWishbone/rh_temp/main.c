#include <stdbool.h>
#include <stdint.h>
#include <stdlib.h>

#include "deca_bsp.h"
//#include "Deca.h"

#include "i2c.h"
#include "HDC1000.h"
#include "SpinalUart.h"

//I2C address of HDC1000 rh temp sensor
const uint8_t address = 0x80;// 7 bit address shifted one bit to left


void main(void)
{

deca_init();

char temperature[16];
char humidity[16];
SpinalUart* uart;

uint16_t hdc1000_config;
char hdc1000_config_string[16];

spinal_uart_init(&uart,UART_0_BASE_ADDRESS);

spinal_uart_print_line(uart,"RH Temp sensor demo");

I2C* i2c = (I2C*)(RH_TEMP_BASE_ADDRESS);
HDC1000DeviceInfo   di;

i2c_enable(i2c);
i2c_set_prescaler(i2c,50000000,100000);

bool result;
//Acquire temperature and humidity


//while(!hdc1000_get_config(i2c,address,&hdc1000_config)){}
hdc1000_get_config(i2c,address,&hdc1000_config);
itoa(hdc1000_config,hdc1000_config_string,16);

spinal_uart_print_line(uart,hdc1000_config_string);

//result = hdc1000_configure(i2c,address,0x0000);
/*
if(result == false)
{
  spinal_uart_print_line(uart,"Error unable to configure HDC1000");
}
*/
/*
uint8_t buffer[4];
buffer[0] = 0;
buffer[1] = 0;
buffer[2] = 0;
buffer[3] = 0;
int *t = (int*)&buffer[0];
//buffer[0]= HDC1000_DEVICE_ID;
//i2c_send(i2c,address,buffer,1);
bool i2c_result;

i2c_result = i2c_rcv(i2c,address,HDC1000_DEVICE_ID,buffer,2);

while(i2c_result == false)
{
     i2c_result = i2c_rcv(i2c,address,HDC1000_DEVICE_ID,buffer,2);
}
/*
if(i2c_result == false)
{
  spinal_uart_print_line(uart,"Error i2c cannot read HDC1000 device id");
}
*/
/*
char sdevice_id[5];
itoa(*t,sdevice_id,16);

//buffer[0] = HDC1000_MANUFACTURER_ID;
//i2c_send(i2c,address,buffer,1);
i2c_result = i2c_rcv(i2c,address,HDC1000_MANUFACTURER_ID,buffer,2);

while(i2c_result == false)
{
    i2c_result = i2c_rcv(i2c,address,HDC1000_MANUFACTURER_ID,buffer,2);
}
*/
 //delay(500);
 hdc1000_get_device_info(i2c,address,&di);
 //hdc1000_get_device_info(i2c,address,&di);
/*
if(i2c_result == false)
{
  spinal_uart_print_line(uart,"Error i2c cannot read HDC1000 manufacturer id");
}
*/
//char smanufacturer_id[5];
//itoa(*t,smanufacturer_id,16);
spinal_uart_print(uart,"Manufacturer id:");
spinal_uart_print_line(uart,di.manufacturer);
spinal_uart_print(uart,"Device id:");
spinal_uart_print_line(uart,di.id);
// 0001 0000 0000 0000

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





//uint32_t counter
  for(;;)
  {
    // if(!hdc1000_trigger_measure(i2c,address))
    // {
    //   spinal_uart_print_line(uart,"Unable to trigger measure");
    // }
 
     
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
