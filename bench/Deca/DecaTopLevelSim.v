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
  inout i2c_0_scl,
  inout i2c_0_sda,
  /*
  input wire i2c_0_scl_i,
  output wire i2c_0_scl_o,
  output wire i2c_0_scl_oe,
  input wire i2c_0_sda_i,
  output wire i2c_0_sda_o,
  output wire i2c_0_sda_oe,
  */
  output wire spi_0_mosi,
  input wire spi_0_miso,
  output wire spi_0_sclk,
  output wire spi_0_cs_n,
  inout CAP_SENSE_I2C_SCL,
  inout CAP_SENSE_I2C_SDA,
  /*
  input wire CAP_SENSE_I2C_SCL_i,
  output wire CAP_SENSE_I2C_SCL_o,
  output wire CAP_SENSE_I2C_SCL_oe,
  input wire CAP_SENSE_I2C_SDA_i,
  output wire CAP_SENSE_I2C_SDA_o,
  output wire CAP_SENSE_I2C_SDA_oe,
  */
  input wire LIGHT_I2C_SCL_i,
  output wire LIGHT_I2C_SCL_o,
  output wire LIGHT_I2C_SCL_oe,
  input wire LIGHT_I2C_SDA_i,
  output wire LIGHT_I2C_SDA_o,
  output wire LIGHT_I2C_SDA_oe,

  inout wire RH_TEMP_I2C_SCL,
  inout wire RH_TEMP_I2C_SDA,
  /*
  input wire RH_TEMP_I2C_SDA_i,
  output wire RH_TEMP_I2C_SDA_o,
  output wire RH_TEMP_I2C_SDA_oe,
  input wire RH_TEMP_I2C_SCL_i,
  output wire RH_TEMP_I2C_SCL_o,
  output wire RH_TEMP_I2C_SCL_oe,
  */
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


  //////////// HDMI ///////////

 inout  HDMI_I2C_SCL,
 inout  HDMI_I2C_SDA,

 output wire [3:0] HDMI_I2S,

 output wire HDMI_LRCLK,

 output wire HDMI_MCLK,

 output wire HDMI_SCLK,
output wire HDMI_TX_CLK,
output wire [23:0] HDMI_TX_D,
output wire HDMI_TX_DE,
output wire HDMI_TX_HS,
input wire HDMI_TX_INT,
output wire HDMI_TX_VS,


  //////////// USB //////////
/*
 input 		          		USB_CLKIN,      //ULPI 60 mhz output clock
 output		          		USB_CS,         // active high chip select pin
 input 		      [7:0]		USB_DATA_i,
 output         [7:0]   USB_DATA_o,
 input 		          		USB_DIR,        //ULPI dir output signal
 input 		          		USB_FAULT_n,    //Fault input from usb power switch
 input 		          		USB_NXT,        //ULPI nxt output signal
 output		          		USB_RESET_n,    //Reset pin uset to reset all digital registers
 output		          		USB_STP,         //ULPI STP input signal
*/
 /////////// DDR3 ////////////////////

output wire     [14:0]      DDR3_A,
output wire     [2:0]       DDR3_BA,
output wire                 DDR3_CAS_n,
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

     wire avl_burstbegin;
     wire [7:0] avl_be;
     wire [25:0] avl_adr;
     wire [63:0] avl_dat;
     wire avl_wr_req;
     wire avl_rdt_req;
     wire [2:0] avl_size;
     wire [63:0] avl_rdt;
     wire avl_ready;
     wire avl_rdt_valid;

     wire ddr3_local_init_done;
     wire ddr3_local_cal_success;
     wire ddr3_soft_reset_n;


     DDR3Sim ddr3_sim(
       .clk(i_clk),
       .reset(i_rst),
       .avl_ready(avl_ready),
       .avl_burst_begin(avl_burstbegin),
       .avl_addr(avl_adr),
       .avl_rdata_valid(avl_rdt_valid),
       .avl_rdata(avl_rdt),
       .avl_wdata(avl_dat),
       .avl_be(avl_be),
       .avl_read_req(avl_rdt_req),
       .avl_write_req(avl_wr_req),
       .avl_size(avl_size),
       .local_init_done(ddr3_local_init_done),
       .local_cal_success(ddr3_local_cal_success)
     );


DecaSoc #(
    .memfile(memfile),
    .memsize(memsize),
    .PLL(PLL),
    .sim(sim),
    .with_csr(with_csr)
) dut(
  .i_wb_clk(i_clk),
  .i_wb_rst(i_rst),
  .i_cpu_reset(i_rst),
  .video_clock(i_clk),
  .video_reset(i_rst),
  .i_afi_clk(i_clk),
  .i_afi_rst(i_rst),
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
    .i2c_0_scl(i2c_0_scl),
    .i2c_0_sda(i2c_0_sda),
    /*
    .i2c_0_scl_i(i2c_0_scl_i),
    .i2c_0_scl_o(i2c_0_scl_o),
    .i2c_0_scl_oe(i2c_0_scl_oe),
    .i2c_0_sda_i(i2c_0_sda_i),
    .i2c_0_sda_o(i2c_0_sda_o),
    .i2c_0_sda_oe(i2c_0_sda_oe),
    */
    .spi_0_miso(spi_0_miso),
    .spi_0_mosi(spi_0_mosi),
    .spi_0_sclk(spi_0_sclk),
    .spi_0_cs_n(spi_0_cs_n),
    .CAP_SENSE_I2C_SCL(CAP_SENSE_I2C_SCL),
    .CAP_SENSE_I2C_SDA(CAP_SENSE_I2C_SDA),

    .LIGHT_I2C_SCL_i(LIGHT_I2C_SCL_i),
    .LIGHT_I2C_SCL_o(LIGHT_I2C_SCL_o),
    .LIGHT_I2C_SCL_oe(LIGHT_I2C_SCL_oe),
    .LIGHT_I2C_SDA_i(LIGHT_I2C_SDA_i),
    .LIGHT_I2C_SDA_o(LIGHT_I2C_SDA_o),
    .LIGHT_I2C_SDA_oe(LIGHT_I2C_SDA_oe),
    .RH_TEMP_I2C_SCL(RH_TEMP_I2C_SCL),
    .RH_TEMP_I2C_SDA(RH_TEMP_I2C_SDA),
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

    //////// HDMI ///////////////
     //HDMI
    .HDMI_I2C_SCL(HDMI_I2C_SCL),
    .HDMI_I2C_SDA(HDMI_I2C_SDA),
    .HDMI_I2S(HDMI_I2S),
    .HDMI_LRCLK(HDMI_LRCLK),
    .HDMI_MCLK(HDMI_MCLK),
    .HDMI_SCLK(HDMI_SCLK),
    .HDMI_TX_CLK(HDMI_TX_CLK),
    .HDMI_TX_D(HDMI_TX_D),
    .HDMI_TX_DE(HDMI_TX_DE),
    .HDMI_TX_HS(HDMI_TX_HS),
    .HDMI_TX_INT(HDMI_TX_INT),
    .HDMI_TX_VS(HDMI_TX_VS),

    /*
    .USB_CLKIN(USB_CLKIN),
    .USB_CS(USB_CS),
    .USB_DATA_i(USB_DATA_i),
    .USB_DATA_o(USB_DATA_o),
    .USB_DIR(USB_DIR),
    .USB_FAULT_n(USB_FAULT_n),
    .USB_NXT(USB_NXT),
    .USB_RESET_n(USB_RESET_n),
    .USB_STP(USB_STP),
    */

    .ddr3_local_init_done(ddr3_local_init_done),
    .ddr3_local_cal_success(ddr3_local_cal_success),
    .ddr3_soft_reset_n(ddr3_soft_reset_n),
    .avl_burstbegin(avl_burstbegin),
    .avl_be(avl_be),
    .avl_adr(avl_adr),
    .avl_dat(avl_dat),
    .avl_rdt(avl_rdt),
    .avl_rdt_valid(avl_rdt_valid),
    .avl_rdt_req(avl_rdt_req),
    .avl_wr_req(avl_wr_req),
    .avl_size(avl_size),
    .avl_ready(avl_ready)
    /*
    .DDR3_A(DDR3_A),
    .DDR3_BA(DDR3_BA),
    .DDR3_CAS_n(DDR3_CAS_n),
    .DDR3_CK_n(DDR3_CK_n),
    .DDR3_CK_p(DDR3_CK_p),
    .DDR3_CKE(DDR3_CKE),
    .DDR3_CLK_50(DDR3_CLK_50),
    .DDR3_CS_n(DDR3_CS_n),
    .DDR3_DM(DDR3_DM),
    .DDR3_DQ(DDR3_DQ),
    .DDR3_DQS_n(DDR3_DQS_n),
    .DDR3_DQS_p(DDR3_DQS_p),
    .DDR3_ODT(DDR3_ODT),
    .DDR3_RAS_n(DDR3_RAS_n),
    .DDR3_RESET_n(DDR3_RESET_n),
    .DDR3_WE_n(DDR3_WE_n)
    */
);


endmodule
