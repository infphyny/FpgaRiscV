module DecaSoc
(
  input wire i_clk,
  input wire i_rst,

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
 output wire PMONITOR_I2C_SDA_oe
);

parameter memfile = "blinky.hex";
parameter memsize = 8192;
parameter PLL = "NONE";
parameter sim = 0;
parameter with_csr = 1;

  wire        wb_rst;
  wire        wb_clk;

generate

if(PLL=="NONE") begin
assign      	wb_clk = i_clk;
assign wb_rst = i_rst;

end else if (PLL=="PLL") begin  // PLL== "NONE"
  //  wire wb_rst;
    wire locked_1;
    //wire locked_2;
    //wire sdram_clk;
    assign wb_rst = !locked_1 /*&& !locked_2 */;
    //wire reset = 0;
    pll clockgen(
    .inclk0(i_clk),
    .areset(i_rst),
    .c0(wb_clk),
    //.c1(sdram_clk),
    .locked(locked_1)
    );

  end



endgenerate


//
// generate
//
//
// if(PLL=="NONE") begin
// reg	     	wb_rst;
// assign wb_clk = i_clk;
// reg [19:0] rst_reg = 20'b0;
//
//  always @(posedge i_clk or negedge i_rst) begin
//
//       if(i_rst == 0) begin
//        rst_reg <= 0;
//        wb_rst <= 1;
//       end else begin
//
//    // if(lock == 1 ) begin
//
//      if(rst_reg > 8192) begin
//        wb_rst <= 0;
//      end else begin
//       rst_reg <= rst_reg + 1;
//       wb_rst <= 1;
//      end
//
//       end
//
//     // end else begin
//     // wb_rst <= 0;
//      //end
//
//     end //always
//
// end else if (PLL=="PLL") begin  // PLL== "NONE"
//   wire wb_rst;
//   wire locked_1;
//   //wire locked_2;
//   //wire sdram_clk;
//   assign wb_rst = !locked_1 /*&& !locked_2 */;
//   //wire reset = 0;
//   pll clockgen(
//   .inclk0(i_clk),
//   .areset(i_rst),
//   .c0(wb_clk),
//   //.c1(sdram_clk),
//   .locked(locked_1)
//   );
//
// end
//
// endgenerate



wire 	timer_irq;
`include "wb_intercon.vh"

 gpio _gpioA( .wb_clk(wb_clk),
               .wb_rst(wb_rst),
   			   .wb_adr_i(wb_m2s_gpioA_adr[0]),
  			   .wb_dat_i(wb_m2s_gpioA_dat),
  			   .wb_we_i(wb_m2s_gpioA_we),
  			   .wb_cyc_i(wb_m2s_gpioA_cyc),
  			   .wb_stb_i(wb_m2s_gpioA_stb),
  			   .wb_cti_i(wb_m2s_gpioA_cti),
  			   .wb_bte_i(wb_m2s_gpioA_bte),
  			   .wb_dat_o(wb_s2m_gpioA_dat),
  			   .wb_ack_o(wb_s2m_gpioA_ack),
  			   .wb_err_o(wb_s2m_gpioA_err),
  			   .wb_rty_o(wb_s2m_gpioA_rty),
  			   .gpio_i(i_gpioA),
  			   .gpio_o(o_gpioA),
  			   .gpio_dir_o(o_gpioA_oe)

  );

  gpio _gpioB(
               .wb_clk(wb_clk),
               .wb_rst(wb_rst),
               .wb_adr_i(wb_m2s_gpioB_adr[0]),
  			   .wb_dat_i(wb_m2s_gpioB_dat),
  			   .wb_we_i(wb_m2s_gpioB_we),
  			   .wb_cyc_i(wb_m2s_gpioB_cyc),
  			   .wb_stb_i(wb_m2s_gpioB_stb),
  			   .wb_cti_i(wb_m2s_gpioB_cti),
  			   .wb_bte_i(wb_m2s_gpioB_bte),
  			   .wb_dat_o(wb_s2m_gpioB_dat),
  			   .wb_ack_o(wb_s2m_gpioB_ack),
  			   .wb_err_o(wb_s2m_gpioB_err),
  			   .wb_rty_o(wb_s2m_gpioB_rty),
  			   .gpio_i(i_gpioB),
  			   .gpio_o(o_gpioB),
  			   .gpio_dir_o(o_gpioB_oe)
 );


WishboneLedsCtrl wb_leds_ctrl(
                    .wb_adr_i(wb_m2s_leds_adr[0]),
 				    .wb_dat_i(wb_m2s_leds_dat),
  					.wb_we_i(wb_m2s_leds_we),
  					.wb_cyc_i(wb_m2s_leds_cyc),
  					.wb_stb_i(wb_m2s_leds_stb),
  					.wb_dat_o(wb_s2m_leds_dat),
  					.wb_ack_o(wb_s2m_leds_ack),
  				    .wb_err_o(wb_s2m_leds_err),
  					.wb_rty_o(wb_s2m_leds_rty),
  					.leds_o(LEDS),
 					.clk(wb_clk),
  					.reset(wb_rst));


wire uart_0_int_o;
WishboneUartCtrl uart_0(
	.io_bus_CYC(wb_m2s_uart_0_cyc),
  .io_bus_STB(wb_m2s_uart_0_stb),
  .io_bus_ACK(wb_s2m_uart_0_ack),
  .io_bus_WE(wb_m2s_uart_0_we),
  .io_bus_ADR(wb_m2s_uart_0_adr[5:2]),
  .io_bus_DAT_MISO(wb_s2m_uart_0_dat),
  .io_bus_DAT_MOSI(wb_m2s_uart_0_dat),
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
  .wb_adr_i(wb_m2s_i2c_0_adr[2:0]),
  .wb_dat_i(wb_m2s_i2c_0_dat),
  .wb_dat_o(wb_s2m_i2c_0_dat),
  .wb_we_i(wb_m2s_i2c_0_we),
  .wb_stb_i(wb_m2s_i2c_0_stb),
  .wb_cyc_i(wb_m2s_i2c_0_cyc),
  .wb_ack_o(wb_s2m_i2c_0_ack),
  .wb_inta_o(i2c_0_inta),
  .scl_pad_i(i2c_0_scl_i),
  .scl_pad_o(i2c_0_scl_o),
  .scl_padoen_o(i2c_0_scl_oe),
  .sda_pad_i(i2c_0_sda_i),
  .sda_pad_o(i2c_0_sda_o),
  .sda_padoen_o(i2c_0_sda_oe)
);



//wire arst_i = 0;
wire cap_sens_inta;
i2c_master_top cap_sens
(
 .wb_clk_i(wb_clk),
 .wb_rst_i(wb_rst),
 .arst_i(i_rst),
 .wb_adr_i(wb_m2s_cap_sense_adr[2:0]),
 .wb_dat_i(wb_m2s_cap_sense_dat),
 .wb_dat_o(wb_s2m_cap_sense_dat),
 .wb_we_i(wb_m2s_cap_sense_we),
  .wb_stb_i(wb_m2s_cap_sense_stb),
  .wb_cyc_i(wb_m2s_cap_sense_cyc),
  .wb_ack_o(wb_s2m_cap_sense_ack),
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
 .wb_adr_i(wb_m2s_light_adr[2:0]),
 .wb_dat_i(wb_m2s_light_dat),
 .wb_dat_o(wb_s2m_light_dat),
 .wb_we_i(wb_m2s_light_we),
  .wb_stb_i(wb_m2s_light_stb),
  .wb_cyc_i(wb_m2s_light_cyc),
  .wb_ack_o(wb_s2m_light_ack),
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
 .wb_adr_i(wb_m2s_rh_temp_adr[2:0]),
 .wb_dat_i(wb_m2s_rh_temp_dat),
 .wb_dat_o(wb_s2m_rh_temp_dat),
 .wb_we_i(wb_m2s_rh_temp_we),
  .wb_stb_i(wb_m2s_rh_temp_stb),
  .wb_cyc_i(wb_m2s_rh_temp_cyc),
  .wb_ack_o(wb_s2m_rh_temp_ack),
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
   .wb_adr(wb_m2s_board_temp_sensor_adr[1:0]),
   .wb_data_i(wb_m2s_board_temp_sensor_dat),
   .wb_data_o(wb_s2m_board_temp_sensor_dat),
   .wb_we(wb_m2s_board_temp_sensor_we),
   .wb_stb(wb_m2s_board_temp_sensor_stb),
   .wb_cyc(wb_m2s_board_temp_sensor_cyc),
   .wb_ack(wb_s2m_board_temp_sensor_ack),
   .wb_err(wb_s2m_board_temp_sensor_err),
   .wb_rty(wb_s2m_board_temp_sensor_rty),
   .si(TEMP_SI),
   .so(TEMP_SO),
   .soe(TEMP_SO_oe),
   .sc(TEMP_SC),
   .cs_n(TEMP_CS_n)
 );


assign wb_s2m_gsensor_err = 0;
assign wb_s2m_gsensor_rty = 0;

simple_spi gsensor(
  .clk_i(wb_clk),
  .rst_i(wb_rst),
  .cyc_i(wb_m2s_gsensor_cyc),
  .stb_i(wb_m2s_gsensor_stb),
  .adr_i(wb_m2s_gsensor_adr[2:0]),
  .we_i(wb_m2s_gsensor_we),
  .dat_i(wb_m2s_gsensor_dat),
  .dat_o(wb_s2m_gsensor_dat),
  .ack_o(wb_s2m_gsensor_ack),
  .sck_o(G_SENSOR_SCLK),
  .ss_o(G_SENSOR_CS_n),
  .mosi_o( G_SENSOR_SDI),
  .miso_i(G_SENSOR_SDO)

  );

wire pmonitor_i2c_inta;

i2c_master_top pmonitor(
  .wb_clk_i(wb_clk),
  .wb_rst_i(wb_rst),
  .arst_i(i_rst),
  .wb_adr_i(wb_m2s_pmonitor_adr[2:0]),
  .wb_dat_i(wb_m2s_pmonitor_dat),
  .wb_dat_o(wb_s2m_pmonitor_dat),
  .wb_we_i(wb_m2s_pmonitor_we),
  .wb_stb_i(wb_m2s_pmonitor_stb),
  .wb_cyc_i(wb_m2s_pmonitor_cyc),
  .wb_ack_o(wb_s2m_pmonitor_ack),
  .wb_inta_o(pmonitor_i2c_inta),
  .scl_pad_i(PMONITOR_I2C_SCL_i),
  .scl_pad_o(PMONITOR_I2C_SCL_o),
  .scl_padoen_o(PMONITOR_I2C_SCL_oe),
  .sda_pad_i(PMONITOR_I2C_SDA_i),
  .sda_pad_o(PMONITOR_I2C_SDA_o),
  .sda_padoen_o(PMONITOR_I2C_SDA_oe)
  );



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
   .wb_adr_i(wb_m2s_timer_adr[4:0]),
   .wb_dat_i(wb_m2s_timer_dat),
   .wb_we_i(wb_m2s_timer_we),
   .wb_dat_o(wb_s2m_timer_dat),
   .wb_cyc_i(wb_m2s_timer_cyc),
   .wb_stb_i(wb_m2s_timer_stb),
   .wb_ack_o(wb_s2m_timer_ack),
   .wb_err_o(wb_s2m_timer_err),
   .wb_rty_o(wb_s2m_timer_rty),
   .irq(timer_irq)
   );


   servant_ram  #(.memfile (memfile),
       .depth (memsize))
     ram( .i_wb_clk(wb_clk),
                     .i_wb_adr(wb_m2s_mem_adr[$clog2(memsize)-1:2]),
                     .i_wb_dat(wb_m2s_mem_dat),
                     .i_wb_sel(wb_m2s_mem_sel),
                     .i_wb_we(wb_m2s_mem_we),
                     .i_wb_cyc(wb_m2s_mem_cyc),
                     .o_wb_rdt(wb_s2m_mem_dat),
                     .o_wb_ack(wb_s2m_mem_ack)
    );
    wire externalInterrupt = 0;
   wire softwareInterrupt = 0;
   assign wb_m2s_cpu_ibus_adr[1:0] = 0;
 //  assign wb_m2s_cpu_dbus_adr[1:0] = 0;
   VexRiscv
   cpu(
     .timerInterrupt(timer_irq),
     .externalInterrupt(externalInterrupt),
     .softwareInterrupt(softwareInterrupt),
     .iBusWishbone_CYC(wb_m2s_cpu_ibus_cyc),
     .iBusWishbone_STB(wb_m2s_cpu_ibus_stb),
     .iBusWishbone_ACK(wb_s2m_cpu_ibus_ack),
     .iBusWishbone_WE(wb_m2s_cpu_ibus_we),
     .iBusWishbone_ADR(wb_m2s_cpu_ibus_adr),
     .iBusWishbone_DAT_MISO(wb_s2m_cpu_ibus_dat),
     .iBusWishbone_DAT_MOSI(wb_m2s_cpu_ibus_dat),
     .iBusWishbone_SEL(wb_m2s_cpu_ibus_sel),
     .iBusWishbone_ERR(wb_s2m_cpu_ibus_err),
     .iBusWishbone_CTI(wb_m2s_cpu_ibus_cti),
     .iBusWishbone_BTE(wb_m2s_cpu_ibus_bte),
     .dBusWishbone_CYC(wb_m2s_cpu_dbus_cyc),
     .dBusWishbone_STB(wb_m2s_cpu_dbus_stb),
     .dBusWishbone_ACK(wb_s2m_cpu_dbus_ack),
     .dBusWishbone_WE(wb_m2s_cpu_dbus_we),
     .dBusWishbone_ADR(wb_m2s_cpu_dbus_adr),
     .dBusWishbone_DAT_MISO(wb_s2m_cpu_dbus_dat),
     .dBusWishbone_DAT_MOSI(wb_m2s_cpu_dbus_dat),
     .dBusWishbone_SEL(wb_m2s_cpu_dbus_sel),
     .dBusWishbone_ERR(wb_s2m_cpu_dbus_err),
     .dBusWishbone_CTI(wb_m2s_cpu_dbus_cti),
     .dBusWishbone_BTE(wb_m2s_cpu_dbus_bte),
     .clk(wb_clk),
     .reset(wb_rst)
   );



endmodule
