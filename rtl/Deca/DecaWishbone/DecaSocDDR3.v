/*
 TODO Cpu should be the last module to go out of reset enable mode

*/

module DecaSoc
#(
  parameter memfile = "blinky.hex",
  parameter memsize = 8192,
  parameter PLL = "NONE",
  parameter sim = 0,
  parameter with_csr = 1
  )
(
  input wire i_wb_clk,
  input wire i_wb_rst,
  input wire i_cpu_reset,
  input wire video_clock,
  input wire video_reset,

  input wire i_afi_clk,
  input wire i_afi_rst,

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

 inout i2c_0_scl,
 inout i2c_0_sda,

 output wire spi_0_mosi,
 input wire spi_0_miso,
 output wire spi_0_sclk,
 output wire spi_0_cs_n,
 inout  CAP_SENSE_I2C_SCL,
 inout CAP_SENSE_I2C_SDA,

 input wire LIGHT_I2C_SCL_i,
 output wire LIGHT_I2C_SCL_o,
 output wire LIGHT_I2C_SCL_oe,
 input wire LIGHT_I2C_SDA_i,
 output wire LIGHT_I2C_SDA_o,
 output wire LIGHT_I2C_SDA_oe,
 inout RH_TEMP_I2C_SCL,
 inout RH_TEMP_I2C_SDA,

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
inout wire HDMI_I2C_SCL,
inout wire HDMI_I2C_SDA,

output wire HDMI_I2S,

output wire HDMI_LRCLK,

output wire HDMI_MCLK,

output wire  HDMI_SCLK,

output wire HDMI_TX_CLK,
output wire [23:0] HDMI_TX_D,
output wire HDMI_TX_DE,
output wire HDMI_TX_HS,
input wire HDMI_TX_INT,
output wire HDMI_TX_VS,
 //////////// USB //////////
/*
 input wire        		USB_CLKIN,      //ULPI 60 mhz output clock
 output wire		          		USB_CS,         // active high chip select pin
 input wire		      [7:0]		USB_DATA_i,
 output wire        [7:0]   USB_DATA_o,
 input wire		          		USB_DIR,        //ULPI dir output signal
 input wire		          		USB_FAULT_n,    //Fault input from usb power switch
 input wire		          		USB_NXT,        //ULPI nxt output signal
 output	wire	          		USB_RESET_n,    //Reset pin uset to reset all digital registers
 output	wire	          		USB_STP,        //ULPI STP input signal
 */
 //////////// SDRAM //////////


 input wire ddr3_local_init_done,
 input wire ddr3_local_cal_success,
 output wire ddr3_soft_reset_n,
 // DDR3 Avalon bus
 output wire avl_burstbegin,
 output wire [7:0] avl_be,
 output wire [25:0] avl_adr,
 output wire [63:0] avl_dat,
 input wire [63:0] avl_rdt,
 input wire avl_rdt_valid,
 output wire avl_rdt_req,
 output wire avl_wr_req,
 output wire [2:0] avl_size,
 input wire avl_ready


 /*
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
  */

);
/*
parameter memfile = "blinky.hex";
parameter memsize = 8192;
parameter PLL = "NONE";
parameter sim = 0;
parameter with_csr = 1;
*/
parameter ICONTROL_IUSED = 15;
parameter ENABLE_DDR3 = 0;
parameter ENABLE_TUSB = 0;


  wire        usb_clk;

wire wb_clk = i_wb_clk;
wire wb_rst = i_wb_rst;
wire afi_clk = i_afi_clk;
wire afi_rst = i_afi_rst;


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

WishboneI2cCtrl i2c_0(
   .io_bus_CYC(wb_i2c_0_cyc),
   .io_bus_STB(wb_i2c_0_stb),
   .io_bus_ACK(wb_i2c_0_ack),
   .io_bus_WE(wb_i2c_0_we),
   .io_bus_ADR(wb_i2c_0_adr[9:2]),//WishboneI2cCtrl expect word of 4 bytes addressing   io_bus_ADR = wb_i2c_0_adr/4
   .io_bus_DAT_MISO(wb_i2c_0_rdt),
   .io_bus_DAT_MOSI(wb_i2c_0_dat),
   .io_interrupt(i2c_0_inta),
   .io_i2c_scl(i2c_0_scl),
   .io_i2c_sda(i2c_0_sda),
   .clk(wb_clk),
   .reset(wb_rst)
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
WishboneI2cCtrl cap_sens(
   .io_bus_CYC(wb_cap_sense_cyc),
   .io_bus_STB(wb_cap_sense_stb),
   .io_bus_ACK(wb_cap_sense_ack),
   .io_bus_WE(wb_cap_sense_we),
   .io_bus_ADR(wb_cap_sense_adr[9:2]),//WishboneI2cCtrl expect word of 4 bytes addressing   io_bus_ADR = wb_i2c_0_adr/4
   .io_bus_DAT_MISO(wb_cap_sense_rdt),
   .io_bus_DAT_MOSI(wb_cap_sense_dat),
   .io_interrupt(cap_sens_inta),
   .io_i2c_scl(CAP_SENSE_I2C_SCL),
   .io_i2c_sda(CAP_SENSE_I2C_SDA),
   .clk(wb_clk),
   .reset(wb_rst)
  );

wire light_inta;
i2c_master_top light
(
 .wb_clk_i(wb_clk),
 .wb_rst_i(wb_rst),
 .arst_i(1'b0),
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

WishboneI2cCtrl rh_temp(
   .io_bus_CYC(wb_rh_temp_cyc),
   .io_bus_STB(wb_rh_temp_stb),
   .io_bus_ACK(wb_rh_temp_ack),
   .io_bus_WE(wb_rh_temp_we),
   .io_bus_ADR(wb_rh_temp_adr[9:2]),//WishboneI2cCtrl expect word of 4 bytes addressing   io_bus_ADR = wb_i2c_0_adr/4
   .io_bus_DAT_MISO(wb_rh_temp_rdt),
   .io_bus_DAT_MOSI(wb_rh_temp_dat),
   .io_interrupt(rh_temp_inta),
   .io_i2c_scl(RH_TEMP_I2C_SCL),
   .io_i2c_sda(RH_TEMP_I2C_SDA),
   .clk(wb_clk),
   .reset(wb_rst)
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
  .arst_i(1'b0),
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
//generate
/*
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
  */
  /*
  else begin

  assign wb_tusb1210_ack = 0;
  assign wb_tusb1210_rdt = 32'b0;


  assign USB_CS = 1'bz;
  //assign USB_DIR = 1'bz;
  assign USB_DATA_o = 8'bz;
  assign  USB_RESET_n = 0;
  assign USB_STP = 1'bz;

  end

*/

//endgenerate





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
   .o_soft_reset_n(ddr3_soft_reset_n)
 );

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



  //assign HDMI_I2S_oe = 1'bz;
  assign HDMI_I2S = 4'b0000;

  //assign HDMI_LRCLK_oe = 1'b0;
  assign HDMI_LRCLK = 1'b0;

  //assign HDMI_MCLK_oe = 1'b0;
  assign HDMI_MCLK = 1'b0;

  //assign HDMI_SCLK_oe = 1'b0;
  assign HDMI_SCLK = 1'b0;

  assign HDMI_TX_CLK = ~video_clock;
//  assign HDMI_TX_D = 24'd0;
//  assign HDMI_TX_DE = 1'b0;/*1'bz*/
//  assign HDMI_TX_HS = 1'b1;
//  assign HDMI_TX_VS = 1'b1;

assign HDMI_TX_D[18:16] = { HDMI_TX_D[19],HDMI_TX_D[19],HDMI_TX_D[19]};
assign HDMI_TX_D[9:8] = {HDMI_TX_D[10],HDMI_TX_D[10]};
assign HDMI_TX_D[2:0] = { HDMI_TX_D[3],HDMI_TX_D[3],HDMI_TX_D[3]};

 wire hdmi_i2c_inta;


 WishboneI2cCtrl hdmi_i2c(
    .io_bus_CYC(wb_hdmi_i2c_cyc),
    .io_bus_STB(wb_hdmi_i2c_stb),
    .io_bus_ACK(wb_hdmi_i2c_ack),
    .io_bus_WE(wb_hdmi_i2c_we),
    .io_bus_ADR(wb_hdmi_i2c_adr[9:2]),//WishboneI2cCtrl expect word of 4 bytes addressing   io_bus_ADR = wb_i2c_0_adr/4
    .io_bus_DAT_MISO(wb_hdmi_i2c_rdt),
    .io_bus_DAT_MOSI(wb_hdmi_i2c_dat),
    .io_interrupt(hdmi_i2c_inta),
    .io_i2c_scl(HDMI_I2C_SCL),
    .io_i2c_sda(HDMI_I2C_SDA),
    .clk(wb_clk),
    .reset(wb_rst)
   );
wire frame_start;

wire [4:0] pixels_payload_r = 5'd0;
wire [5:0] pixels_payload_g = /*6'd0;*/6'b111111;
wire [4:0] pixels_payload_b = 5'd0;
wire pixels_valid = 1'b1;
wire pixels_ready;



 VideoCtrl HdmiCtrl(
  //  .soft_reset(wb_rst),
    .wb_clock(wb_clk),
    .wb_reset(wb_rst),
    .i_hdmi_tx_int(HDMI_TX_INT),
    .video_clock(video_clock),
    .video_reset(video_reset),
    .bus_CYC(wb_HdmiCtrl_cyc),
    .bus_STB(wb_HdmiCtrl_stb),
    .bus_ACK(wb_HdmiCtrl_ack),
    .bus_WE(wb_HdmiCtrl_we),
    .bus_ADR(wb_HdmiCtrl_adr[6:2]),
    .bus_DAT_MISO(wb_HdmiCtrl_rdt),
    .bus_DAT_MOSI(wb_HdmiCtrl_dat),
    .vga_hSync(HDMI_TX_HS),
    .vga_vSync(HDMI_TX_VS),
    .vga_color_r(HDMI_TX_D[23:19]),
    .vga_color_g(HDMI_TX_D[15:10]),
    .vga_color_b(HDMI_TX_D[7:3]),
    .vga_colorEn( HDMI_TX_DE),
    .frameStart(frame_start),
    .pixels_valid(pixels_valid),
    .pixels_ready(pixels_ready),
    .pixels_payload_r(pixels_payload_r),
    .pixels_payload_g(pixels_payload_g),
    .pixels_payload_b(pixels_payload_b)
   );

   wire o_ddr3_stream_valid;
   wire o_ddr3_stream_ready;
   wire [63:0] o_ddr3_stream_payload_rdt;

   wire i_ddr3_stream_valid;
   wire i_ddr3_stream_ready;
   wire i_ddr3_stream_payload_we;
   wire [25:0] i_ddr3_stream_payload_adr;
   wire [63:0] i_ddr3_stream_payload_dat;
   wire [7:0] i_ddr3_stream_payload_sel;
   wire i_ddr3_stream_payload_burstbegin;
   wire [2:0] i_ddr3_stream_payload_size;

   AvlStreamAdapter stream_adapter(
      .i_avl_clock(afi_clk),
      .i_avl_reset(afi_rst),
      .o_avl_burstbegin(avl_burstbegin),
      .o_avl_be(avl_be),
      .o_avl_adr(avl_adr),
      .o_avl_dat(avl_dat),
      .o_avl_wr_req(avl_wr_req),
      .o_avl_rdt_req(avl_rdt_req),
      .o_avl_size(avl_size),
      .i_avl_rdt(avl_rdt),
      .i_avl_ready(avl_ready),
      .i_avl_rdt_valid(avl_rdt_valid),
      .o_stream_valid(o_ddr3_stream_valid),
      .o_stream_ready(o_ddr3_stream_ready),
      .o_stream_payload_rdt(o_ddr3_stream_payload_rdt),
      .i_stream_valid(i_ddr3_stream_valid),
      .i_stream_ready(i_ddr3_stream_ready),
      .i_stream_payload_we(i_ddr3_stream_payload_we),
      .i_stream_payload_adr(i_ddr3_stream_payload_adr),
      .i_stream_payload_dat(i_ddr3_stream_payload_dat),
      .i_stream_payload_sel(i_ddr3_stream_payload_sel),
      .i_stream_payload_burstbegin(i_ddr3_stream_payload_burstbegin),
      .i_stream_payload_size(i_ddr3_stream_payload_size)
     );


   wire i_wb_stream_valid;
   wire i_wb_stream_ready;
   wire [63:0] i_wb_stream_payload_rdt;
   wire o_wb_stream_valid;
   wire o_wb_stream_ready;
   wire o_wb_stream_payload_we;
   wire [25:0] o_wb_stream_payload_adr;
   wire [63:0] o_wb_stream_payload_dat;
   wire [7:0] o_wb_stream_payload_sel;
   wire o_wb_stream_payload_burstbegin;
   wire [2:0] o_wb_stream_payload_size;

  WbStreamCdc wb_stream_cdc(
     .i_wb_clock(wb_clk),
     .i_wb_reset(wb_rst),
     .i_wb_adr(wb_wb_avl_cdc_adr),
     .i_wb_sel(wb_wb_avl_cdc_sel),
     .i_wb_dat(wb_wb_avl_cdc_dat),
     .o_wb_rdt(wb_wb_avl_cdc_rdt),
     .i_wb_we(wb_wb_avl_cdc_we),
     .i_wb_cyc(wb_wb_avl_cdc_cyc),
     .i_wb_stb(wb_wb_avl_cdc_stb),
     .o_wb_ack(wb_wb_avl_cdc_ack),
     .o_wb_err(wb_wb_avl_cdc_err),
     .o_wb_rty(wb_wb_avl_cdc_rty),
     .i_avl_clock(afi_clk),
     .i_avl_reset(afi_rst),
     .i_stream_valid(i_wb_stream_valid),
     .i_stream_ready(i_wb_stream_ready),
     .i_stream_payload_rdt(i_wb_stream_payload_rdt),
     .o_stream_valid(o_wb_stream_valid),
     .o_stream_ready(o_wb_stream_ready),
     .o_stream_payload_we(o_wb_stream_payload_we),
     .o_stream_payload_adr(o_wb_stream_payload_adr),
     .o_stream_payload_dat(o_wb_stream_payload_dat),
     .o_stream_payload_sel(o_wb_stream_payload_sel),
     .o_stream_payload_burstbegin(o_wb_stream_payload_burstbegin),
     .o_stream_payload_size(o_wb_stream_payload_size)
    );

  wire i_video_stream_valid;
  wire i_video_stream_ready = 1'b0;
  wire i_video_stream_payload_rdt;

  wire o_video_stream_valid = 1'b0;
  wire o_video_stream_ready;
  wire o_video_stream_payload_we = 1'b0;
  wire [25:0] o_video_stream_payload_adr = 26'd0;
  wire [63:0] o_video_stream_payload_dat = 64'd0;
  wire [7:0] o_video_stream_payload_sel = 8'd0;
  wire o_video_stream_payload_burstbegin = 1'b0;
  wire [2:0] o_video_stream_payload_size = 3'd0;

   MemoryStreamArbiter memory_stream_arbiter(
     .clk(afi_clk),
     .reset(afi_rst),
     //Request from Video module
     .input_request_0_valid(o_video_stream_valid),
     .input_request_0_ready(o_video_stream_ready),
     .input_request_0_payload_we(o_video_stream_payload_we),
     .input_request_0_payload_adr(o_video_stream_payload_adr),
     .input_request_0_payload_dat(o_video_stream_payload_dat),
     .input_request_0_payload_sel(o_video_stream_payload_sel),
     .input_request_0_payload_burstbegin(o_video_stream_payload_burstbegin),
     .input_request_0_payload_size(o_video_stream_payload_size),

    //Request from Wishbone bus
     .input_request_1_valid(o_wb_stream_valid),
     .input_request_1_ready(o_wb_stream_ready),
     .input_request_1_payload_we(o_wb_stream_payload_we),
     .input_request_1_payload_adr(o_wb_stream_payload_adr),
     .input_request_1_payload_dat(o_wb_stream_payload_dat),
     .input_request_1_payload_sel(o_wb_stream_payload_sel),
     .input_request_1_payload_burstbegin(o_wb_stream_payload_burstbegin),
     .input_request_1_payload_size(o_wb_stream_payload_size),

     //Request send to AvlStreamAdapter
     .output_request_valid(i_ddr3_stream_valid),
     .output_request_ready(i_ddr3_stream_ready),
     .output_request_payload_we(i_ddr3_stream_payload_we),
     .output_request_payload_adr(i_ddr3_stream_payload_adr),
     .output_request_payload_dat(i_ddr3_stream_payload_dat),
     .output_request_payload_sel(i_ddr3_stream_payload_sel),
     .output_request_payload_burstbegin(i_ddr3_stream_payload_burstbegin),
     .output_request_payload_size(i_ddr3_stream_payload_size),

     //Response receive from AvlStreamAdapter
     .input_response_valid(o_ddr3_stream_valid),
     .input_response_ready(o_ddr3_stream_ready),
     .input_response_payload_rdt(o_ddr3_stream_payload_rdt),

     //Response routed to Video module
     .output_response_0_valid(i_video_stream_valid),
     .output_response_0_ready(i_video_stream_ready),
     .output_response_0_payload_rdt(i_video_stream_payload_rdt),

     //Response routed to Wishbone bus
     .output_response_1_valid(i_wb_stream_valid),
     .output_response_1_ready(i_wb_stream_ready),
     .output_response_1_payload_rdt(i_wb_stream_payload_rdt)
     );
/*
   WbAvlBridge wb_avl_cdc(
     .i_wb_clock(wb_clk),
     .i_wb_reset(wb_rst),
     .i_wb_adr(wb_wb_avl_cdc_adr),
     .i_wb_sel(wb_wb_avl_cdc_sel),
     .i_wb_dat(wb_wb_avl_cdc_dat),
     .o_wb_rdt(wb_wb_avl_cdc_rdt),
     .i_wb_we(wb_wb_avl_cdc_we),
     .i_wb_cyc(wb_wb_avl_cdc_cyc),
     .i_wb_stb(wb_wb_avl_cdc_stb),
     .o_wb_ack(wb_wb_avl_cdc_ack),
     .o_wb_err(wb_wb_avl_cdc_err),
     .o_wb_rty(wb_wb_avl_cdc_rty),
     .i_avl_clock(afi_clk),
     .i_avl_reset(afi_rst),
     .o_avl_burstbegin(avl_burstbegin),
     .o_avl_be(avl_be),
     .o_avl_adr(avl_adr),
     .o_avl_dat(avl_dat),
     .o_avl_wr_req(avl_wr_req),
     .o_avl_rdt_req(avl_rdt_req),
     .o_avl_size(avl_size),
     .i_avl_rdt(avl_rdt),
     .i_avl_ready(avl_ready),
     .i_avl_rdt_valid(avl_rdt_valid)
     );
*/


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
     .reset(i_cpu_reset)
   );



endmodule
