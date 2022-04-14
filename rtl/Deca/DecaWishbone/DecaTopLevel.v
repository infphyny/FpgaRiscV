//`default_nettype none

module DecaTopLevel(
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

parameter memfile = "blinky.hex";
parameter memsize = 8192;
parameter PLL = "NONE";
parameter sim = 0;
parameter with_csr = 1;


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


DecaSoc #(
    .memfile(memfile),
    .memsize(memsize),
    .PLL(PLL),
    .sim(0),
    .with_csr(with_csr)
) soc(
   // .DDR3_CLK_50(DDR3_CLK_50),
    .i_clk(/*DDR3_CLK_50*/ i_clk),
    .i_rst(!i_rst_n),
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
);


endmodule
