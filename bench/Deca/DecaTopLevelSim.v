//`default_nettype none

module DecaTopLevelSim(
  input wire i_clk,
  input wire i_rst,
  input wire key1,
  input wire SW0,
  input wire SW1,
  input wire [7:0] i_gpioA,
  output wire [7:0] o_gpioA,
  output wire [7:0] o_gpioA_oe,
  input wire  [7:0] i_gpioB,
  output wire [7:0] o_gpioB,
  output wire [7:0] o_gpioB_oe,
  output wire [7:0] LEDS,
  input wire uart_0_rx,
  output wire uart_0_tx,
  input wire i2c_0_scl_i,
  output wire i2c_0_scl_o,
  output wire i2c_0_scl_oe,
  input wire i2c_0_sda_i,
  output wire i2c_0_sda_o,
  output wire i2c_0_sda_oe,
  output wire spi_0_mosi,
  input wire spi_0_miso,
  output wire spi_0_sclk,
  output wire spi_0_cs_n,
  input wire CAP_SENSE_I2C_SCL_i,
  output wire CAP_SENSE_I2C_SCL_o,
  output wire CAP_SENSE_I2C_SCL_oe,
  input wire CAP_SENSE_I2C_SDA_i,
  output wire CAP_SENSE_I2C_SDA_o,
  output wire CAP_SENSE_I2C_SDA_oe,
  input wire LIGHT_I2C_SCL_i,
  output wire LIGHT_I2C_SCL_o,
  output wire LIGHT_I2C_SCL_oe,
  input wire LIGHT_I2C_SDA_i,
  output wire LIGHT_I2C_SDA_o,
  output wire LIGHT_I2C_SDA_oe,
  input wire RH_TEMP_I2C_SDA_i,
  output wire RH_TEMP_I2C_SDA_o,
  output wire RH_TEMP_I2C_SDA_oe,
  input wire RH_TEMP_I2C_SCL_i,
  output wire RH_TEMP_I2C_SCL_o,
  output wire RH_TEMP_I2C_SCL_oe,
  input wire RH_TEMP_DRDY_n,

  input wire TEMP_SI,
  output wire TEMP_SO,
  output wire TEMP_SO_oe,
  output wire TEMP_SC,
  output wire TEMP_CS_n,
  output wire G_SENSOR_SDI,
  input wire G_SENSOR_SDO,
  output wire G_SENSOR_SCLK,
  output wire G_SENSOR_CS_n,
  input wire PMONITOR_I2C_SCL_i,
  output wire PMONITOR_I2C_SCL_o,
  output wire PMONITOR_I2C_SCL_oe,
  input wire PMONITOR_I2C_SDA_i,
  output wire PMONITOR_I2C_SDA_o,
  output wire PMONITOR_I2C_SDA_oe,

  //////////// USB //////////

 input 		          		USB_CLKIN,      //ULPI 60 mhz output clock
 output		          		USB_CS,         // active high chip select pin
 input 		      [7:0]		USB_DATA_i,
 output         [7:0]   USB_DATA_o,
 input 		          		USB_DIR,        //ULPI dir output signal
 input 		          		USB_FAULT_n,    //Fault input from usb power switch
 input 		          		USB_NXT,        //ULPI nxt output signal
 output		          		USB_RESET_n,    //Reset pin uset to reset all digital registers
 output		          		USB_STP         //ULPI STP input signal

);


parameter memfile = "";
   parameter memsize = 131072;
   parameter PLL = "NONE";
   parameter sim = 1;
   parameter with_csr = 1;

 reg [1023:0] firmware_file;
   initial
     if ($value$plusargs("firmware=%s", firmware_file)) begin
	$display("Loading RAM from %0s", firmware_file);
	$readmemh(firmware_file, dut.ram.mem);
     end



DecaSoc #(
    .memfile(memfile),
    .memsize(memsize),
    .PLL(PLL),
    .sim(sim),
    .with_csr(with_csr)
) dut(
    .i_clk(i_clk),
    .i_rst(i_rst),
    .key1(key1),
    .SW0(SW0),
    .SW1(SW1),
    .i_gpioA(i_gpioA),
    .o_gpioA(o_gpioA),
    .o_gpioA_oe(o_gpioA_oe),
    .i_gpioB(i_gpioB),
    .o_gpioB(o_gpioB),
    .o_gpioB_oe(o_gpioB_oe),
    .LEDS(LEDS),
    .uart_0_rx(uart_0_rx),
    .uart_0_tx(uart_0_tx),
    .i2c_0_scl_i(i2c_0_scl),
    .i2c_0_scl_o(i2c_0_scl_o),
    .i2c_0_scl_oe(i2c_0_scl_oe),
    .i2c_0_sda_i(i2c_0_sda),
    .i2c_0_sda_o(i2c_0_sda_o),
    .i2c_0_sda_oe(i2c_0_sda_oe),
    .spi_0_miso(spi_0_miso),
    .spi_0_mosi(spi_0_mosi),
    .spi_0_sclk(spi_0_sclk),
    .spi_0_cs_n(spi_0_cs_n),
    .CAP_SENSE_I2C_SCL_i(CAP_SENSE_I2C_SCL_i),
    .CAP_SENSE_I2C_SCL_o(CAP_SENSE_I2C_SCL_o),
    .CAP_SENSE_I2C_SCL_oe(CAP_SENSE_I2C_SCL_oe),
    .CAP_SENSE_I2C_SDA_i(CAP_SENSE_I2C_SDA_i),
    .CAP_SENSE_I2C_SDA_o(CAP_SENSE_I2C_SDA_o),
    .CAP_SENSE_I2C_SDA_oe(CAP_SENSE_I2C_SDA_oe),
    .LIGHT_I2C_SCL_i(LIGHT_I2C_SCL_i),
    .LIGHT_I2C_SCL_o(LIGHT_I2C_SCL_o),
    .LIGHT_I2C_SCL_oe(LIGHT_I2C_SCL_oe),
    .LIGHT_I2C_SDA_i(LIGHT_I2C_SDA_i),
    .LIGHT_I2C_SDA_o(LIGHT_I2C_SDA_o),
    .LIGHT_I2C_SDA_oe(LIGHT_I2C_SDA_oe),
    .RH_TEMP_I2C_SCL_i(RH_TEMP_I2C_SCL_i),
    .RH_TEMP_I2C_SCL_o(RH_TEMP_I2C_SCL_o),
    .RH_TEMP_I2C_SCL_oe(RH_TEMP_I2C_SCL_oe),
    .RH_TEMP_I2C_SDA_i(RH_TEMP_I2C_SDA_i),
    .RH_TEMP_I2C_SDA_o(RH_TEMP_I2C_SDA_o),
    .RH_TEMP_I2C_SDA_oe(RH_TEMP_I2C_SDA_oe),
    .RH_TEMP_DRDY_n(RH_TEMP_DRDY_n),
    .TEMP_SI(TEMP_SI),
    .TEMP_SO(TEMP_SO),
    .TEMP_SO_oe(TEMP_SO_oe),
    .TEMP_SC(TEMP_SC),
    .TEMP_CS_n(TEMP_CS_n),
    .G_SENSOR_SDI(G_SENSOR_SDI),
    .G_SENSOR_SDO(G_SENSOR_SDO),
    .G_SENSOR_SCLK(G_SENSOR_SCLK),
    .G_SENSOR_CS_n(G_SENSOR_CS_n),
    .PMONITOR_I2C_SCL_i(PMONITOR_I2C_SCL_i),
    .PMONITOR_I2C_SCL_o(PMONITOR_I2C_SCL_o),
    .PMONITOR_I2C_SCL_oe(PMONITOR_I2C_SCL_oe),
    .PMONITOR_I2C_SDA_i(PMONITOR_I2C_SDA_i),
    .PMONITOR_I2C_SDA_o(PMONITOR_I2C_SDA_o),
    .PMONITOR_I2C_SDA_oe(PMONITOR_I2C_SDA_oe),
    .USB_CLKIN(USB_CLKIN),
    .USB_CS(USB_CS),
    .USB_DATA_i(USB_DATA_i),
    .USB_DATA_o(USB_DATA_o),
    .USB_DIR(USB_DIR),
    .USB_FAULT_n(USB_FAULT_n),
    .USB_NXT(USB_NXT),
    .USB_RESET_n(USB_RESET_n),
    .USB_STP(USB_STP)
);


endmodule
