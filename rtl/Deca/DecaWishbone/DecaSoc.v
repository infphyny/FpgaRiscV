module DecaSoc
(
 // input wire DDR3_CLK_50,
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

// HDMI
input wire HDMI_I2C_SCL_i,
output wire HDMI_I2C_SCL_o,
output wire HDMI_I2C_SCL_oe,
input wire HDMI_I2C_SDA_i,
output wire HDMI_I2C_SDA_o,
output wire HDMI_I2C_SDA_oe,
input wire [3:0] HDMI_I2S_i,
output wire [3:0] HDMI_I2S_o,
output wire HDMI_I2S_oe,
input wire HDMI_LRCLK_i,
output wire HDMI_LRCLK_o,
output wire HDMI_LRCLK_oe,
input wire HDMI_MCLK_i,
output wire HDMI_MCLK_o,
output wire HDMI_MCLK_oe,
input wire HDMI_SCLK_i,
output wire HDMI_SCLK_o,
output wire HDMI_SCLK_oe,
output wire HDMI_TX_CLK,
output wire [23:0] HDMI_TX_D,
output wire HDMI_TX_DE,
output wire HDMI_TX_HS,
input wire HDMI_TX_INT,
output wire HDMI_TX_VS,

 //////////// USB //////////

 input wire        		USB_CLKIN,      //ULPI 60 mhz output clock
 output wire		          		USB_CS,         // active high chip select pin
 input wire		      [7:0]		USB_DATA_i,
 output wire        [7:0]   USB_DATA_o,
 input wire		          		USB_DIR,        //ULPI dir output signal
 input wire		          		USB_FAULT_n,    //Fault input from usb power switch
 input wire		          		USB_NXT,        //ULPI nxt output signal
 output	wire	          		USB_RESET_n,    //Reset pin uset to reset all digital registers
 output	wire	          		USB_STP,        //ULPI STP input signal
 //////////// SDRAM //////////
	output		    [14:0]		DDR3_A,
	output		     [2:0]		DDR3_BA,
	output		          		DDR3_CAS_n,
	inout 		          		DDR3_CK_n,
	inout 		          		DDR3_CK_p,
	output		          		DDR3_CKE,
	input 		          		DDR3_CLK_50,
	output		          		DDR3_CS_n,
	output		     [1:0]		DDR3_DM,
	inout 		    [15:0]		DDR3_DQ,
	inout 		     [1:0]		DDR3_DQS_n,
	inout 		     [1:0]		DDR3_DQS_p,
	output		          		DDR3_ODT,
	output		          		DDR3_RAS_n,
	output		          		DDR3_RESET_n,
	output		          		DDR3_WE_n

);

parameter memfile = "blinky.hex";
parameter memsize = 8192;
parameter PLL = "NONE";
parameter sim = 0;
parameter ENABLE_DDR3 = 0;
parameter ENABLE_TUSB = 0;
parameter with_csr = 1;
parameter ICONTROL_IUSED = 15;

  wire        wb_rst;
  wire        wb_clk;
  wire        usb_clk;

 wire ddr3_local_init_done;
   wire ddr3_local_cal_success;
wire ddr3_reset_n;

generate

if(PLL=="NONE") begin
assign      	wb_clk = i_clk;
assign        usb_clk = USB_CLKIN;
assign wb_rst = i_rst;

end else if (PLL=="PLL") begin  // PLL== "NONE"
  //  wire wb_rst;
    wire locked_1;
    wire pll_usb_locked;
    //wire locked_2;
    //wire sdram_clk;
    assign wb_rst = !locked_1 && !pll_usb_locked;
    //wire reset = 0;
    pll clockgen(
    .inclk0(i_clk),
    .areset(i_rst),
    .c0(wb_clk),
    //.c1(sdram_clk),
    .locked(locked_1)
    );

   //Create an 60 Mhz USB pll with -120 degree phase shift from  60 MHz USB_CLKIN
    usbpll usbclock(
      .inclk0(USB_CLKIN),
      .areset(i_rst),
      .c0(usb_clk),
      .locked(pll_usb_locked)
    );




  end



endgenerate





wire 	timer_irq;
`include "wb_intercon.vh"

 gpio _gpioA( .wb_clk(wb_clk),
               .wb_rst(wb_rst),
   			   .wb_adr_i(wb_gpioA_adr[0]),
  			   .wb_dat_i(wb_gpioA_dat),
  			   .wb_we_i(wb_gpioA_we),
  			   .wb_cyc_i(wb_gpioA_cyc),
  			   .wb_stb_i(wb_gpioA_stb),
  			   .wb_cti_i(wb_gpioA_cti),
  			   .wb_bte_i(wb_gpioA_bte),
  			   .wb_dat_o(wb_gpioA_rdt),
  			   .wb_ack_o(wb_gpioA_ack),
  			   .wb_err_o(wb_gpioA_err),
  			   .wb_rty_o(wb_gpioA_rty),
  			   .gpio_i(i_gpioA),
  			   .gpio_o(o_gpioA),
  			   .gpio_dir_o(o_gpioA_oe)

  );

  gpio _gpioB(
               .wb_clk(wb_clk),
               .wb_rst(wb_rst),
               .wb_adr_i(wb_gpioB_adr[0]),
  			   .wb_dat_i(wb_gpioB_dat),
  			   .wb_we_i(wb_gpioB_we),
  			   .wb_cyc_i(wb_gpioB_cyc),
  			   .wb_stb_i(wb_gpioB_stb),
  			   .wb_cti_i(wb_gpioB_cti),
  			   .wb_bte_i(wb_gpioB_bte),
  			   .wb_dat_o(wb_gpioB_rdt),
  			   .wb_ack_o(wb_gpioB_ack),
  			   .wb_err_o(wb_gpioB_err),
  			   .wb_rty_o(wb_gpioB_rty),
  			   .gpio_i(i_gpioB),
  			   .gpio_o(o_gpioB),
  			   .gpio_dir_o(o_gpioB_oe)
 );



wire key1_interrupt;

WishboneSwitch button1
(
  .clk(wb_clk),
  .reset(wb_rst),
  .i_wb_stb(wb_key1_stb),
  .i_wb_cyc(wb_key1_cyc),
  .i_wb_we(wb_key1_we),
  .i_wb_dat(wb_key1_dat),
  .o_wb_dat(wb_key1_rdt),
  .o_wb_ack(wb_key1_ack),
  .o_wb_rty(wb_key1_rty),
  .o_wb_err(wb_key1_err),
  .i_switch(key1),
  .o_int(key1_interrupt)
);


wire sw0_interrupt;

WishboneSwitch sw0(
  .clk(wb_clk),
  .reset(wb_rst),
  .i_wb_stb(wb_sw0_stb),
  .i_wb_cyc(wb_sw0_cyc),
  .i_wb_we(wb_sw0_we),
  .i_wb_dat(wb_sw0_dat),
  .o_wb_dat(wb_sw0_rdt),
  .o_wb_ack(wb_sw0_ack),
  .o_wb_rty(wb_sw0_rty),
  .o_wb_err(wb_sw0_err),
  .i_switch(SW0),
  .o_int(sw0_interrupt)
);



wire sw1_interrupt;

WishboneSwitch sw1(
  .clk(wb_clk),
  .reset(wb_rst),
  .i_wb_stb(wb_sw1_stb),
  .i_wb_cyc(wb_sw1_cyc),
  .i_wb_we(wb_sw0_we),
  .i_wb_dat(wb_sw1_dat),
  .o_wb_dat(wb_sw1_rdt),
  .o_wb_ack(wb_sw1_ack),
  .o_wb_rty(wb_sw1_rty),
  .o_wb_err(wb_sw1_err),
  .i_switch(SW1),
  .o_int(sw1_interrupt)
);


WishboneLedsCtrl wb_leds_ctrl(
                    .wb_adr_i(wb_leds_adr[0]),
 				    .wb_dat_i(wb_leds_dat),
  					.wb_we_i(wb_leds_we),
  					.wb_cyc_i(wb_leds_cyc),
  					.wb_stb_i(wb_leds_stb),
  					.wb_dat_o(wb_leds_rdt),
  					.wb_ack_o(wb_leds_ack),
  				    .wb_err_o(wb_leds_err),
  					.wb_rty_o(wb_leds_rty),
  					.leds_o(LEDS),
 					.clk(wb_clk),
  					.reset(wb_rst));

wire uart_0_int_o;
WishboneUartCtrl uart_0(
	.io_bus_CYC(wb_uart_0_cyc),
  .io_bus_STB(wb_uart_0_stb),
  .io_bus_ACK(wb_uart_0_ack),
  .io_bus_WE(wb_uart_0_we),
  .io_bus_ADR(wb_uart_0_adr[5:2]),
  .io_bus_DAT_MISO(wb_uart_0_rdt),
  .io_bus_DAT_MOSI(wb_uart_0_dat),
  .io_uart_txd(uart_0_tx),
  .io_uart_rxd(uart_0_rx),
  .io_interrupt(uart_0_int_o),
  .clk(wb_clk),
  .reset(wb_rst));



wire i2c_0_inta;
i2c_master_top i2c_0
(
  .wb_clk_i(wb_clk),
  .wb_rst_i(wb_rst),
  .arst_i(i_rst),
  .wb_adr_i(wb_i2c_0_adr[2:0]),
  .wb_dat_i(wb_i2c_0_dat),
  .wb_dat_o(wb_i2c_0_rdt),
  .wb_we_i(wb_i2c_0_we),
  .wb_stb_i(wb_i2c_0_stb),
  .wb_cyc_i(wb_i2c_0_cyc),
  .wb_ack_o(wb_i2c_0_ack),
  .wb_inta_o(i2c_0_inta),
  .scl_pad_i(i2c_0_scl_i),
  .scl_pad_o(i2c_0_scl_o),
  .scl_padoen_o(i2c_0_scl_oe),
  .sda_pad_i(i2c_0_sda_i),
  .sda_pad_o(i2c_0_sda_o),
  .sda_padoen_o(i2c_0_sda_oe)
);


simple_spi spi_0(
  .clk_i(wb_clk),
  .rst_i(wb_rst),
  .cyc_i(wb_spi_0_cyc),
  .stb_i(wb_spi_0_stb),
  .adr_i(wb_spi_0_adr[2:0]),
  .we_i(wb_spi_0_we),
  .dat_i(wb_spi_0_dat),
  .dat_o(wb_spi_0_rdt),
  .ack_o(wb_spi_0_ack),
  .sck_o(spi_0_sclk),
  .ss_o(spi_0_cs_n),
  .mosi_o(spi_0_mosi),
  .miso_i(spi_0_miso),
  .inta_o()
  );


//wire arst_i = 0;
wire cap_sens_inta;
i2c_master_top cap_sens
(
 .wb_clk_i(wb_clk),
 .wb_rst_i(wb_rst),
 .arst_i(i_rst),
 .wb_adr_i(wb_cap_sense_adr[2:0]),
 .wb_dat_i(wb_cap_sense_dat),
 .wb_dat_o(wb_cap_sense_rdt),
 .wb_we_i(wb_cap_sense_we),
  .wb_stb_i(wb_cap_sense_stb),
  .wb_cyc_i(wb_cap_sense_cyc),
  .wb_ack_o(wb_cap_sense_ack),
  .wb_inta_o(cap_sens_inta),
  .scl_pad_i(CAP_SENSE_I2C_SCL_i),
  .scl_pad_o(CAP_SENSE_I2C_SCL_o),
  .scl_padoen_o(CAP_SENSE_I2C_SCL_oe),
  .sda_pad_i(CAP_SENSE_I2C_SDA_i),
  .sda_pad_o(CAP_SENSE_I2C_SDA_o),
  .sda_padoen_o(CAP_SENSE_I2C_SDA_oe)
);
wire light_inta;
i2c_master_top light
(
 .wb_clk_i(wb_clk),
 .wb_rst_i(wb_rst),
 .arst_i(i_rst),
 .wb_adr_i(wb_light_adr[2:0]),
 .wb_dat_i(wb_light_dat),
 .wb_dat_o(wb_light_rdt),
 .wb_we_i(wb_light_we),
  .wb_stb_i(wb_light_stb),
  .wb_cyc_i(wb_light_cyc),
  .wb_ack_o(wb_light_ack),
  .wb_inta_o(light_inta),
  .scl_pad_i(LIGHT_I2C_SCL_i),
  .scl_pad_o(LIGHT_I2C_SCL_o),
  .scl_padoen_o(LIGHT_I2C_SCL_oe),
  .sda_pad_i(LIGHT_I2C_SDA_i),
  .sda_pad_o(LIGHT_I2C_SDA_o),
  .sda_padoen_o(LIGHT_I2C_SDA_oe)
);


wire rh_temp_inta;
i2c_master_top rh_temp
(
 .wb_clk_i(wb_clk),
 .wb_rst_i(wb_rst),
 .arst_i(i_rst),
 .wb_adr_i(wb_rh_temp_adr[2:0]),
 .wb_dat_i(wb_rh_temp_dat),
 .wb_dat_o(wb_rh_temp_rdt),
 .wb_we_i(wb_rh_temp_we),
  .wb_stb_i(wb_rh_temp_stb),
  .wb_cyc_i(wb_rh_temp_cyc),
  .wb_ack_o(wb_rh_temp_ack),
  .wb_inta_o(rh_temp_inta),
  .scl_pad_i(RH_TEMP_I2C_SCL_i),
  .scl_pad_o(RH_TEMP_I2C_SCL_o),
  .scl_padoen_o(RH_TEMP_I2C_SCL_oe),
  .sda_pad_i(RH_TEMP_I2C_SDA_i),
  .sda_pad_o(RH_TEMP_I2C_SDA_o),
  .sda_padoen_o(RH_TEMP_I2C_SDA_oe)
);

 MicroWireWishbone board_temp_sensor
 (
   .clk(wb_clk),
   .reset(wb_rst),
   .wb_adr(wb_board_temp_sensor_adr[1:0]),
   .wb_data_i(wb_board_temp_sensor_dat),
   .wb_data_o(wb_board_temp_sensor_rdt),
   .wb_we(wb_board_temp_sensor_we),
   .wb_stb(wb_board_temp_sensor_stb),
   .wb_cyc(wb_board_temp_sensor_cyc),
   .wb_ack(wb_board_temp_sensor_ack),
   .wb_err(wb_board_temp_sensor_err),
   .wb_rty(wb_board_temp_sensor_rty),
   .si(TEMP_SI),
   .so(TEMP_SO),
   .soe(TEMP_SO_oe),
   .sc(TEMP_SC),
   .cs_n(TEMP_CS_n)
 );


assign wb_gsensor_err = 0;
assign wb_gsensor_rty = 0;

simple_spi gsensor(
  .clk_i(wb_clk),
  .rst_i(wb_rst),
  .cyc_i(wb_gsensor_cyc),
  .stb_i(wb_gsensor_stb),
  .adr_i(wb_gsensor_adr[2:0]),
  .we_i(wb_gsensor_we),
  .dat_i(wb_gsensor_dat),
  .dat_o(wb_gsensor_rdt),
  .ack_o(wb_gsensor_ack),
  .sck_o(G_SENSOR_SCLK),
  .ss_o(G_SENSOR_CS_n),
  .mosi_o( G_SENSOR_SDI),
  .miso_i(G_SENSOR_SDO),
  .inta_o()
  );


wire pmonitor_i2c_inta;

i2c_master_top pmonitor(
  .wb_clk_i(wb_clk),
  .wb_rst_i(wb_rst),
  .arst_i(i_rst),
  .wb_adr_i(wb_pmonitor_adr[2:0]),
  .wb_dat_i(wb_pmonitor_dat),
  .wb_dat_o(wb_pmonitor_rdt),
  .wb_we_i(wb_pmonitor_we),
  .wb_stb_i(wb_pmonitor_stb),
  .wb_cyc_i(wb_pmonitor_cyc),
  .wb_ack_o(wb_pmonitor_ack),
  .wb_inta_o(pmonitor_i2c_inta),
  .scl_pad_i(PMONITOR_I2C_SCL_i),
  .scl_pad_o(PMONITOR_I2C_SCL_o),
  .scl_padoen_o(PMONITOR_I2C_SCL_oe),
  .sda_pad_i(PMONITOR_I2C_SDA_i),
  .sda_pad_o(PMONITOR_I2C_SDA_o),
  .sda_padoen_o(PMONITOR_I2C_SDA_oe)
  );



//USB

generate

  if (ENABLE_TUSB == 1) begin

  WishboneTUSB1210 tusb1210(
    .clk(wb_clk),
    .reset(wb_rst),
    .i_wb_adr(wb_tusb1210_adr[1:0]),
    .i_wb_dat(wb_tusb1210_dat),
    .o_wb_dat(wb_tusb1210_rdt),
    .i_wb_stb(wb_tusb1210_stb),
    .i_wb_cyc(wb_tusb1210_cyc),
    .i_wb_we(wb_tusb1210_we),
    .o_wb_ack(wb_tusb1210_ack),
    .i_usb_clk(usb_clk),
    .i_ulpi_dat(USB_DATA_i),
    .o_ulpi_dat(USB_DATA_o),
    .i_ulpi_dir(USB_DIR),
    .i_usb_fault_n(USB_FAULT_n),
    .i_ulpi_nxt(USB_NXT),
    .o_ulpi_reset_n(USB_RESET_n),
    .o_ulpi_stp(USB_STP),
    .o_ulpi_cs(USB_CS)
  );
  end
  else begin

  assign wb_tusb1210_ack = 0;
  assign wb_tusb1210_rdt = 32'b0;


  assign USB_CS = 1'bz;
  //assign USB_DIR = 1'bz;
  assign USB_DATA_o = 8'bz;
  assign  USB_RESET_n = 0;
  assign USB_STP = 1'bz;

  end



endgenerate

/*
 assign USB_CS = 1'bz;

 generate
 genvar i;

 for(i = 0 ; i < 8 ; i = i+1) begin : generate_usb_data_signal

   assign USB_DATA[i] = 1'bz;
 end

 endgenerate


assign USB_RESET_n = 1'bz;
assign USB_STP = 1'bz;
*/


  // generate
  //     if (with_csr) begin
  //
  //
	//  mtimer
	//    #(.WIDTH (32),
  //      .DIVIDER(15))
	//  timer
	//    (.i_clk    (wb_clk),
	//     .o_irq    (timer_irq),
	//     .i_wb_cyc (wb_m2s_timer_cyc),
	//     .i_wb_we  (wb_m2s_timer_we) ,
	//     .i_wb_dat (wb_m2s_timer_dat),
	//     .o_wb_dat (wb_s2m_timer_dat),
  //     .o_wb_ack(wb_s2m_timer_ack)
  //     );
  //     end else begin
	// // assign wb_timer_rdt = 32'd0;
	//  assign timer_irq = 1'b0;
  //     end
  //  endgenerate

//wire timer_irq;
  WishboneMachineTimer timer(
   .clk(wb_clk),
   .reset(wb_rst),
   .wb_adr_i(wb_timer_adr[4:0]),
   .wb_dat_i(wb_timer_dat),
   .wb_we_i(wb_timer_we),
   .wb_dat_o(wb_timer_rdt),
   .wb_cyc_i(wb_timer_cyc),
   .wb_stb_i(wb_timer_stb),
   .wb_ack_o(wb_timer_ack),
   .wb_err_o(wb_timer_err),
   .wb_rty_o(wb_timer_rty),
   .irq(timer_irq)
   );


   ////////////   HDMI ////////////////////////

  //assign HDMI_I2C_SCL_oe = 1;
  //assign HDMI_I2C_SCL_o = 0;

  // assign HDMI_I2C_SDA_oe = 1;
  // assign HDMI_I2C_SDA_o = 0;

  assign HDMI_I2S_oe = 4'bzzzz;
  assign HDMI_I2S_o = 4'bzzzz;

  assign HDMI_LRCLK_oe = 1'bz;
  assign HDMI_LRCLK_o = 1'bz;

  assign HDMI_MCLK_oe = 1'bz;
  assign HDMI_MCLK_o = 1'bz;

  assign HDMI_SCLK_oe = 1'bz;
  assign HDMI_SCLK_o = 1'bz;

  assign HDMI_TX_CLK = 1'bz;
  assign HDMI_TX_D = 24'bzzzzzzzzzzzzzzzzzzzzzzzz;
  assign HDMI_TX_DE = 1'bz;
  assign HDMI_TX_HS = 1'bz;
  assign HDMI_TX_VS = 1'bz;

 wire hdmi_i2c_inta;



  i2c_master_top hdmi_i2c
  (
    .wb_clk_i(wb_clk),
  .wb_rst_i(wb_rst),
  .arst_i(i_rst),
  .wb_adr_i(wb_hdmi_i2c_adr[2:0]),
  .wb_dat_i(wb_hdmi_i2c_dat),
  .wb_dat_o(wb_hdmi_i2c_rdt),
  .wb_we_i(wb_hdmi_i2c_we),
  .wb_stb_i(wb_hdmi_i2c_stb),
  .wb_cyc_i(wb_hdmi_i2c_cyc),
  .wb_ack_o(wb_hdmi_i2c_ack),
  .wb_inta_o(hdmi_i2c_inta),
  .scl_pad_i(HDMI_I2C_SCL_i),
  .scl_pad_o(HDMI_I2C_SCL_o),
  .scl_padoen_o(HDMI_I2C_SCL_oe),
  .sda_pad_i(HDMI_I2C_SDA_i),
  .sda_pad_o(HDMI_I2C_SDA_o),
  .sda_padoen_o(HDMI_I2C_SDA_oe)
  );



  WishboneDDR3Manager ddr3manager(
   .clk(wb_clk),
   .reset(wb_rst),
   .i_wb_stb(wb_ddr3manager_stb),
   .i_wb_cyc(wb_ddr3manager_cyc),
   .i_wb_we(wb_ddr3manager_we),
   .i_wb_dat(wb_ddr3manager_dat),
   .o_wb_dat(wb_ddr3manager_rdt),
   .o_wb_ack(wb_ddr3manager_ack),
   .o_wb_rty(wb_ddr3manager_rty),
   .o_wb_err(wb_ddr3manager_err),
   .i_init_success(ddr3_local_init_done),
   .i_cal_success(ddr3_local_cal_success),
   .o_soft_reset_n(ddr3_reset_n)
 );


// Wire between wb_avalon bridge and ddr3 memory ctrl
   wire [31:0] o_av_adr;
   wire [7:0] o_av_be;
   wire o_av_read_req;
   wire o_av_write_req;
   wire [63:0] i_av_readdata;
   wire [7:0] o_av_burstcount;
   wire [63:0] o_av_writedata;
   wire avl_ready;
   wire i_av_waitrequest;
   assign i_av_waitrequest = !avl_ready;
   wire i_av_readdatavalid;
   wire avl_burstbegin;
   assign avl_burstbegin =  o_av_read_req & o_av_write_req;




   wire ddr3_reset;
   assign ddr3_reset = !wb_rst;


   generate

    if(sim ==0) begin


      if (ENABLE_DDR3 == 1) begin
      //50 MHZ
      ddr3 ddr3_mem(
        .pll_ref_clk(DDR3_CLK_50),
        .global_reset_n(ddr3_reset),
        .soft_reset_n(ddr3_reset),
        .mem_a(DDR3_A),
        .mem_ba(DDR3_BA),
        .mem_ck(DDR3_CK_p),
        .mem_ck_n(DDR3_CK_n),
        .mem_cke(DDR3_CKE),
        .mem_cs_n(DDR3_CS_n),
        .mem_dm(DDR3_DM),
        .mem_ras_n(DDR3_RAS_n),
        .mem_cas_n(DDR3_CAS_n),
        .mem_we_n(DDR3_WE_n),
        .mem_reset_n(DDR3_RESET_n),
        .mem_dq(DDR3_DQ),
        .mem_dqs(DDR3_DQS_p),
        .mem_dqs_n(DDR3_DQS_n),
        .mem_odt(DDR3_ODT),
        .avl_ready(avl_ready),
        .avl_burstbegin(avl_burstbegin),
        .avl_addr(o_av_adr[28:3]),
        .avl_rdata_valid(i_av_readdatavalid),
        .avl_rdata(i_av_readdata),
        .avl_wdata(o_av_writedata),
        .avl_be(o_av_be),
        .avl_read_req(o_av_read_req),
        .avl_write_req(o_av_write_req),
        .avl_size(o_av_burstcount[2:0]),
        //.pll_mem_clk(DDR3_)

      );

      end else begin

        //wire dummy_
        ddr3 ddr3_mem(
        .pll_ref_clk(DDR3_CLK_50),
        .global_reset_n(ddr3_reset),
        .soft_reset_n(ddr3_reset),
        .mem_a(DDR3_A),
        .mem_ba(DDR3_BA),
        .mem_ck(DDR3_CK_p),
        .mem_ck_n(DDR3_CK_n),
        .mem_cke(DDR3_CKE),
        .mem_cs_n(DDR3_CS_n),
        .mem_dm(DDR3_DM),
        .mem_ras_n(DDR3_RAS_n),
        .mem_cas_n(DDR3_CAS_n),
        .mem_we_n(DDR3_WE_n),
        .mem_reset_n(DDR3_RESET_n),
        .mem_dq(DDR3_DQ),
        .mem_dqs(DDR3_DQS_p),
        .mem_dqs_n(DDR3_DQS_n),
        .mem_odt(DDR3_ODT),
        .avl_ready(avl_ready),
        .avl_burstbegin(avl_burstbegin),
        .avl_addr(o_av_adr[28:3]),
        .avl_rdata_valid(/*i_av_readdatavalid*/),
        .avl_rdata(/*i_av_readdata*/),
        .avl_wdata(o_av_writedata),
        .avl_be(o_av_be),
        .avl_read_req(o_av_read_req),
        .avl_write_req(o_av_write_req),
        .avl_size(o_av_burstcount[2:0]),
        //.pll_mem_clk(DDR3_)

      );

       /*
       assign DDR3_A = 15'bz;
       assign DDR3_BA = 3'bzzz;
       assign DDR3_CK_p = 1'b0;
       assign DDR3_CK_n = 1'b0;
       assign DDR3_RAS_n = 1'bz;
       assign DDR3_CKE = 1'bz;
       assign DDR3_CS_n = 1'bz;
       assign DDR3_DM = 2'bz;
       assign DDR3_CAS_n = 1'bz;
       assign DDR3_WE_n = 1'bz;
       assign DDR3_RESET_n = 1'b0;
       assign DDR3_DQ = 16'bz;
       assign DDR3_DQS_p = 2'b0;
       assign DDR3_DQS_n = 2'b0;
       assign DDR3_ODT = 1'bz;
      */
       assign i_av_readdatavalid = 0;
       assign i_av_readdata = 64'b0;


     end

    end

   endgenerate
   //stub
    wire [7:0] wb_av_bridge_sel = {4'b0000,wb_wb_av_bridge_sel};
   wire [63:0] wb_av_bridge_dat_i = {32'h0000,wb_wb_av_bridge_dat};
   wire [63:0] wb_av_bridge_dat_o;// = {32'h0000,wb_s2m_wb_av_bridge_dat};
   assign wb_wb_av_bridge_rdt = wb_av_bridge_dat_o[31:0];

   wire [2:0] wb_av_bridge_cti = wb_wb_av_bridge_cti;//3'b000;
   wire [1:0] wb_av_bridge_bte = wb_wb_av_bridge_bte;//2'b00;
   wire av_bridge_disable = 1;

   // 75 MHZ
   wb_to_avalon_bridge #(
     .DW(64),
     .AW(32)
   ) wb_av_bridge(
    //Wishbone slave input
    .wb_clk_i(wb_clk),
    .wb_rst_i(wb_rst),
    .wb_adr_i(wb_wb_av_bridge_adr),
    .wb_dat_i(wb_av_bridge_dat_i),
    .wb_sel_i(wb_av_bridge_sel),
    .wb_we_i(wb_wb_av_bridge_we),
    .wb_cyc_i(wb_wb_av_bridge_cyc),
    .wb_stb_i(wb_wb_av_bridge_stb),
    .wb_cti_i(wb_av_bridge_cti),
    .wb_bte_i(wb_av_bridge_bte),
    .wb_dat_o(wb_av_bridge_dat_o),
    .wb_ack_o(wb_wb_av_bridge_ack),
    .wb_err_o(wb_wb_av_bridge_err),
    .wb_rty_o(wb_wb_av_bridge_rty),
   //Avalon master output
    .m_av_address_o(o_av_adr),
    .m_av_byteenable_o(o_av_be),
    .m_av_read_o(o_av_read_req),
    .m_av_readdata_i(i_av_readdata),
    .m_av_burstcount_o(o_av_burstcount),
    .m_av_write_o(o_av_write_req),
    .m_av_writedata_o(o_av_writedata),
    .m_av_waitrequest_i(i_av_waitrequest),
    .m_av_readdatavalid_i(i_av_readdatavalid)
   );




   wire externalInterrupt;
   wire [ICONTROL_IUSED-1:0] i_brd_ints;

   assign i_brd_ints[0] = key1_interrupt;
   assign i_brd_ints[1] = sw0_interrupt;
   assign i_brd_ints[2] = sw1_interrupt;

   icontrol #(
     .IUSED(ICONTROL_IUSED)
   )
    ictrl(
     .i_clk(wb_clk),
     .i_reset(wb_rst),
     .i_wb_cyc(wb_ictrl_cyc),
     .i_wb_stb(wb_ictrl_stb),
     .i_wb_we(wb_ictrl_we),
     .i_wb_data(wb_ictrl_dat),
     .i_wb_sel(wb_ictrl_sel),
    // .o_wb_stall(wb_ictrl_stall),
     .o_wb_ack(wb_ictrl_ack),
     .o_wb_data(wb_ictrl_rdt),
     .i_brd_ints(i_brd_ints),
     .o_interrupt(externalInterrupt)
   );

   servant_ram  #(.memfile (memfile),
       .depth (memsize))
     ram( .i_wb_clk(wb_clk),
          .i_wb_rst(wb_rst),
          .i_wb_adr(wb_mem_adr[$clog2(memsize)-1:2]),
          .i_wb_dat(wb_mem_dat),
          .i_wb_sel(wb_mem_sel),
          .i_wb_we(wb_mem_we),
          .i_wb_cyc(wb_mem_cyc),
          .o_wb_rdt(wb_mem_rdt),
          .o_wb_ack(wb_mem_ack)
    );


   wire softwareInterrupt = 0;
   assign wb_cpu_ibus_adr[1:0] = 0;
 //  assign wb_m2s_cpu_dbus_adr[1:0] = 0;
   VexRiscv
  cpu(
     .timerInterrupt(timer_irq),
     .externalInterrupt(externalInterrupt),
     .softwareInterrupt(softwareInterrupt),
     .iBusWishbone_CYC(wb_cpu_ibus_cyc),
     .iBusWishbone_STB(wb_cpu_ibus_stb),
     .iBusWishbone_ACK(wb_cpu_ibus_ack),
     .iBusWishbone_WE(wb_cpu_ibus_we),
     .iBusWishbone_ADR(wb_cpu_ibus_adr),
     .iBusWishbone_DAT_MISO(wb_cpu_ibus_rdt),
     .iBusWishbone_DAT_MOSI(wb_cpu_ibus_dat),
     .iBusWishbone_SEL(wb_cpu_ibus_sel),
     .iBusWishbone_ERR(wb_cpu_ibus_err),
     .iBusWishbone_CTI(wb_cpu_ibus_cti),
     .iBusWishbone_BTE(wb_cpu_ibus_bte),
     .dBusWishbone_CYC(wb_cpu_dbus_cyc),
     .dBusWishbone_STB(wb_cpu_dbus_stb),
     .dBusWishbone_ACK(wb_cpu_dbus_ack),
     .dBusWishbone_WE(wb_cpu_dbus_we),
     .dBusWishbone_ADR(wb_cpu_dbus_adr),
     .dBusWishbone_DAT_MISO(wb_cpu_dbus_rdt),
     .dBusWishbone_DAT_MOSI(wb_cpu_dbus_dat),
     .dBusWishbone_SEL(wb_cpu_dbus_sel),
     .dBusWishbone_ERR(wb_cpu_dbus_err),
     .dBusWishbone_CTI(wb_cpu_dbus_cti),
     .dBusWishbone_BTE(wb_cpu_dbus_bte),
     .clk(wb_clk),
     .reset(wb_rst)
   );



endmodule
