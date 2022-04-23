//`default_nettype none

module DecaTopLevel
#(
  parameter memfile = "blinky.hex",
  parameter memsize = 8192,
  parameter PLL = "NONE",
  parameter sim = 0,
  parameter with_csr = 1
  )

(
input wire i_clk,
input wire i_rst_n,
input wire key1,
input wire SW0,
input wire SW1,
inout wire [7:0] gpioA,
inout wire [7:0] gpioB,
output wire [7:0] LEDS,
input wire uart_0_rx,
output wire uart_0_tx,
inout i2c_0_scl,
inout i2c_0_sda,
output wire spi_0_mosi,
input wire spi_0_miso,
output wire spi_0_sclk,
output wire spi_0_cs_n,

inout wire CAP_SENSE_I2C_SCL,
inout wire CAP_SENSE_I2C_SDA,
// CAP_SENCE_DEBUG
/*
inout wire CAP_SENSE_I2C_SCL_DEBUG,
inout wire CAP_SENSE_I2C_SDA_DEBUG,
*/
inout wire LIGHT_I2C_SCL,
inout wire LIGHT_I2C_SDA,
inout wire RH_TEMP_I2C_SCL,
inout wire RH_TEMP_I2C_SDA,
input wire RH_TEMP_DRDY_n,
output wire TEMP_SC,
inout wire TEMP_SIO,
output wire TEMP_CS_n,
output wire G_SENSOR_SDI,
input wire G_SENSOR_SDO,
output wire G_SENSOR_CS_n,
output wire G_SENSOR_SCLK,
inout wire PMONITOR_I2C_SCL,
inout wire PMONITOR_I2C_SDA,
//////////// Ethernet //////////
input 		          		NET_COL,
input 		          		NET_CRS,
output		          		NET_MDC,
inout 		          		NET_MDIO,
output		          		NET_PCF_EN,
output		          		NET_RESET_n,
input 		          		NET_RX_CLK,
input 		          		NET_RX_DV,
input 		          		NET_RX_ER,
input 		     [3:0]		NET_RXD,
input 		          		NET_TX_CLK,
output		          		NET_TX_EN,
output		     [3:0]		NET_TXD,
//////////// USB //////////
/*
input 		          		USB_CLKIN,
output		          		USB_CS,
inout 		     [7:0]		USB_DATA,
input 		          		USB_DIR,
input 		          		USB_FAULT_n,
input 		          		USB_NXT,
output		          		USB_RESET_n,
output		          		USB_STP,
*/

//HDMI TX

  inout 		          		HDMI_I2C_SCL,
	inout 		          		HDMI_I2C_SDA,

  // inout                   HDMI_I2C_SCL_DEBUG,
  // inout                   HDMI_I2C_SDA_DEBUG,

	inout 		     [3:0]		HDMI_I2S,
	inout 		          		HDMI_LRCLK,
	inout 		          		HDMI_MCLK,
	inout 		          		HDMI_SCLK,
	output		          		HDMI_TX_CLK,
	output		    [23:0]		HDMI_TX_D,
	output		          		HDMI_TX_DE,
	output		          		HDMI_TX_HS,
	input 		          		HDMI_TX_INT,
  //output                  HDMI_TX_INT_DEBUG,
	output		          		HDMI_TX_VS,

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

/*
parameter memfile = "blinky.hex";
parameter memsize = 8192;
parameter PLL = "NONE";
parameter sim = 0;
parameter with_csr = 1;
*/

wire [7:0] o_gpioA;
wire [7:0] o_gpioA_oe;
wire [7:0] o_gpioB;
wire [7:0] o_gpioB_oe;


/*
wire i2c_0_scl_oe;
wire i2c_0_scl_o;
wire i2c_0_sda_oe;
wire i2c_0_sda_o;

assign i2c_0_scl = i2c_0_scl_oe ? 1'bz : i2c_0_scl_o;
assign i2c_0_sda = i2c_0_sda_oe ? 1'bz : i2c_0_sda_o;
*/

generate
genvar i;
   for(i = 0 ; i < 8 ; i=i+1) begin :  generate_gpio_signal
   assign gpioA[i] = o_gpioA_oe[i] ? o_gpioA[i]  : 1'bz;
   assign gpioB[i] = o_gpioB_oe[i] ? o_gpioB[i] : 1'bz;
   end
endgenerate

/*
wire CAP_SENSE_I2C_SCL_oe;
wire CAP_SENSE_I2C_SCL_o;
wire CAP_SENSE_I2C_SDA_oe;
wire CAP_SENSE_I2C_SDA_o;


assign CAP_SENSE_I2C_SCL = CAP_SENSE_I2C_SCL_oe ?  1'bz : CAP_SENSE_I2C_SCL_o;
assign CAP_SENSE_I2C_SDA = CAP_SENSE_I2C_SDA_oe ?  1'bz : CAP_SENSE_I2C_SDA_o;
*/
/*
assign CAP_SENSE_I2C_SCL_DEBUG = CAP_SENSE_I2C_SCL;
assign CAP_SENSE_I2C_SDA_DEBUG = CAP_SENSE_I2C_SDA;
*/

wire LIGHT_I2C_SCL_oe;
wire LIGHT_I2C_SCL_o;
wire LIGHT_I2C_SDA_oe;
wire LIGHT_I2C_SDA_o;

assign LIGHT_I2C_SCL = LIGHT_I2C_SCL_oe ?  1'bz : LIGHT_I2C_SCL_o;
assign LIGHT_I2C_SDA = LIGHT_I2C_SDA_oe ?  1'bz : LIGHT_I2C_SDA_o;

/*
wire RH_TEMP_I2C_SDA_oe;
wire RH_TEMP_I2C_SDA_o;
wire RH_TEMP_I2C_SCL_oe;
wire RH_TEMP_I2C_SCL_o;
*/
//assign RH_TEMP_I2C_SCL = RH_TEMP_I2C_SCL_oe ? RH_TEMP_I2C_SCL_o : 1'bz;
//assign RH_TEMP_I2C_SDA = RH_TEMP_I2C_SDA_oe ? RH_TEMP_I2C_SDA_o : 1'bz;

/*
assign RH_TEMP_I2C_SCL = RH_TEMP_I2C_SCL_oe ?  1'bz : RH_TEMP_I2C_SCL_o;
assign RH_TEMP_I2C_SDA = RH_TEMP_I2C_SDA_oe ?  1'bz : RH_TEMP_I2C_SDA_o;
*/

wire TEMP_SO;
wire TEMP_SO_oe;

assign TEMP_SIO = TEMP_SO_oe ? TEMP_SO : 1'bz;
//assign test_temp_sc = TEMP_SC;
//assign test_temp_si = TEMP_SIO;
//assign test_temp_so = TEMP_SO;
//assign test_temp_soe = TEMP_SO_oe;
//assign test_temp_cs_n = TEMP_CS_n;

wire PMONITOR_I2C_SCL_oe;
wire PMONITOR_I2C_SCL_o;
assign PMONITOR_I2C_SCL = PMONITOR_I2C_SCL_oe ? 1'bz : PMONITOR_I2C_SCL_o;

wire PMONITOR_I2C_SDA_oe;
wire PMONITOR_I2C_SDA_o;
assign PMONITOR_I2C_SDA = PMONITOR_I2C_SDA_oe ? 1'bz : PMONITOR_I2C_SDA_o;


//

assign NET_MDC = 1'bz ;
assign	NET_MDIO = 1'bz;
assign NET_PCF_EN = 1'bz;
assign NET_RESET_n = 0;
assign NET_TX_EN = 1'bz;
assign NET_TXD = 4'bzzzz;

//HDMI

// assign HDMI_I2C_SCL_DEBUG = HDMI_I2C_SCL;
// assign HDMI_I2C_SDA_DEBUG = HDMI_I2C_SDA;
// assign HDMI_TX_INT_DEBUG = HDMI_TX_INT;
//wire [3:0] HDMI_I2S_o;
//wire HDMI_I2S_oe;

//assign HDMI_I2S = HDMI_I2S_oe ? 4'bz : HDMI_I2S_o;


//wire HDMI_LRCLK_o;
//wire HDMI_LRCLK_oe;
//assign HDMI_LRCLK = HDMI_LRCLK_oe ? 1'bz : HDMI_LRCLK_o;

//wire HDMI_MCLK_o;
//wire HDMI_MCLK_oe;

//assign HDMI_MCLK = HDMI_MCLK_oe ? 1'bz : HDMI_MCLK_o;


//wire HDMI_SCLK_o;
//wire HDMI_SCLK_oe;

//assign HDMI_SCLK = HDMI_SCLK_oe ? 1'bz : HDMI_SCLK_o;

/*
wire [7:0] USB_DATA_o;

generate

genvar usb_data_index;
    for(usb_data_index = 0 ; usb_data_index < 8 ; usb_data_index=usb_data_index+1) begin :  generate_usb_data_signal

    //PHY drive the bus when USB_DIR = 1, LINK drive the bus when USB_DIR = 0
    assign USB_DATA[usb_data_index] = USB_DIR ? 1'bz : USB_DATA_o;

    end

endgenerate
*/

wire global_reset;//TODO rename main_reset
//TODO Should leave reset state only when reset button is released
ResetManager reset_manager(
  .i_clock(i_clk),
  .i_reset(!i_rst_n),
  .o_global_reset(global_reset)
  );


wire cpu_reset;
wire        wb_rst;
wire        wb_clk;
wire video_clock;
wire video_reset;
wire syspll_locked;

pll syspll(
  .inclk0(i_clk),
  .areset(global_reset),
  .c0(wb_clk),
  .c1(video_clock),
  .locked(syspll_locked)
  );
wire ddr3_pll_locked;

//CPU is the last component to leave reset state
ResetManager cpu_reset_manager(
  .i_clock(wb_clk),
  .i_reset(syspll_locked),
  .o_global_reset(cpu_reset)
  );

  assign wb_rst = !syspll_locked ; /*& !ddr3_pll_locked*/
  assign video_reset = !syspll_locked ; /*& !ddr3_pll_locked*/





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
 wire afi_clk;
 wire afi_rst;
 wire afi_rst_n;
wire afi_half_clk;
ddr3 ddr3_mem(
.pll_ref_clk(DDR3_CLK_50 ),
.global_reset_n(!global_reset),
.soft_reset_n(/*ddr3_soft_reset_n*/!global_reset),
.afi_clk(afi_clk),
.afi_half_clk(afi_half_clk),
.afi_reset_n(afi_rst_n),
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
.avl_addr(avl_adr),
.avl_rdata_valid(avl_rdt_valid),
.avl_rdata(avl_rdt),
.avl_wdata(avl_dat),
.avl_be(avl_be),
.avl_read_req(avl_rdt_req),
.avl_write_req(avl_wr_req),
.avl_size(avl_size),
//.pll_mem_clk(DDR3_)
.pll_locked(ddr3_pll_locked),
.local_init_done(ddr3_local_init_done),
.local_cal_success(ddr3_local_cal_success)
);


DecaSoc #(
    .memfile(memfile),
    .memsize(memsize),
    .PLL(PLL),
    .sim(0),
    .with_csr(with_csr)
) soc(

    .i_wb_clk(wb_clk),
    .i_wb_rst(wb_rst),
    .i_cpu_reset(cpu_reset),
    .video_clock(video_clock),
    .video_reset(video_reset),
    .i_afi_clk(afi_clk),
    .i_afi_rst(!afi_rst_n),
    .key1(key1),
    .SW0(SW0),
    .SW1(SW1),
    .i_gpioA(gpioA),
    .o_gpioA(o_gpioA),
    .o_gpioA_oe(o_gpioA_oe),
    .i_gpioB(gpioB),
    .o_gpioB(o_gpioB),
    . o_gpioB_oe(o_gpioB_oe),
    .LEDS(LEDS),
    .uart_0_rx(uart_0_rx),
    .uart_0_tx(uart_0_tx),
    .i2c_0_scl(i2c_0_scl),
    .i2c_0_sda(i2c_0_sda),

    .spi_0_mosi(spi_0_mosi),
    .spi_0_miso(spi_0_miso),
    .spi_0_sclk(spi_0_sclk),
    .spi_0_cs_n(spi_0_cs_n),
    .CAP_SENSE_I2C_SCL(CAP_SENSE_I2C_SCL),
    .CAP_SENSE_I2C_SDA(CAP_SENSE_I2C_SDA),

    .LIGHT_I2C_SCL_i(LIGHT_I2C_SCL),
    .LIGHT_I2C_SCL_o(LIGHT_I2C_SCL_o),
    .LIGHT_I2C_SCL_oe(LIGHT_I2C_SCL_oe),
    .LIGHT_I2C_SDA_i(LIGHT_I2C_SDA),
    .LIGHT_I2C_SDA_o(LIGHT_I2C_SDA_o),
    .LIGHT_I2C_SDA_oe(LIGHT_I2C_SDA_oe),
    .RH_TEMP_I2C_SCL(RH_TEMP_I2C_SCL),
    .RH_TEMP_I2C_SDA(RH_TEMP_I2C_SDA),

    .RH_TEMP_DRDY_n(RH_TEMP_DRDY_n),
    .TEMP_SI(TEMP_SIO),
    .TEMP_SO(TEMP_SO),
    .TEMP_SO_oe(TEMP_SO_oe),
    .TEMP_SC(TEMP_SC),
    .TEMP_CS_n(TEMP_CS_n),
    .G_SENSOR_SDI(G_SENSOR_SDI),
    .G_SENSOR_SDO(G_SENSOR_SDO),
    .G_SENSOR_SCLK(G_SENSOR_SCLK),
    .G_SENSOR_CS_n(G_SENSOR_CS_n),
    .PMONITOR_I2C_SCL_i(PMONITOR_I2C_SCL),
    .PMONITOR_I2C_SCL_o(PMONITOR_I2C_SCL_o),
    .PMONITOR_I2C_SCL_oe(PMONITOR_I2C_SCL_oe),
    .PMONITOR_I2C_SDA_i(PMONITOR_I2C_SDA),
    .PMONITOR_I2C_SDA_o(PMONITOR_I2C_SDA_o),
    .PMONITOR_I2C_SDA_oe(PMONITOR_I2C_SDA_oe),

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
    .USB_DATA_i(USB_DATA),
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

);


endmodule
