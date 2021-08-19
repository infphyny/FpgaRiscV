/*

*/




module BusMemClockDomainCrossing(
  
  input wire i_bus_clock,
  input wire i_bus_reset,
  input wire i_mem_clock,
  input wire i_mem_reset,
  
  input wire [25:0] i_bus_address,
  input wire [7:0] i_bus_be,
  input wire i_bus_read_req,
  output wire [63:0] o_bus_read_data,
  output wire o_bus_read_data_valid,
  input wire [7:0] i_bus_burst_count,
  input wire i_bus_burst_begin,
  input wire i_bus_write_req,
  input wire [63:0] i_bus_write_data,
  output wire o_bus_wait_request,
  
  output wire [25:0] o_mem_address,
  output wire [7:0] o_mem_be,
  output wire o_mem_read_req,
  input wire [63:0] i_mem_read_data,
  input wire i_mem_read_data_valid,
  output wire [7:0] o_mem_burst_count,
  output wire o_mem_burst_begin,
  output wire o_mem_write_req,
  output wire [63:0] o_mem_write_data,
  input wire i_mem_wait_request
);
 
 parameter CDC_ENABLE = 0;

 generate
  if( CDC_ENABLE == 0) begin 
  assign o_mem_address = i_bus_address ;
  assign o_mem_be = i_bus_be;
  assign o_mem_read_req = i_bus_read_req;
  assign o_bus_read_data = i_mem_read_data;
  assign o_bus_read_data_valid = i_mem_read_data_valid;
  assign o_mem_burst_count = i_bus_burst_count;
  assign o_mem_burst_begin = i_bus_burst_begin;
  assign o_mem_write_req = i_bus_write_req;
  assign o_mem_write_data = i_bus_write_data;
  assign o_bus_wait_request = i_mem_wait_request;
  end 
  else begin

  wire mem_read_fifo_empty;
  wire bus_read_fifo_empty;
  
  wire bus_write_fifo_full;
  wire bus_write_fifo = (i_bus_read_req || i_bus_write_req) && !i_mem_wait_request && !bus_write_fifo_full;
  
  wire mem_write_fifo_full;
  wire mem_write_fifo = (i_mem_read_data_valid && !i_mem_wait_request) && !mem_write_fifo_full;
 

 wire bus_read_fifo_pulse;
 
 RisingEdgePulse rep_bus_read_fifo(
     .i_signal(!bus_read_fifo_empty),
     .o_pulse(bus_read_fifo_pulse),
     .clk(i_bus_clock),
     .reset(i_bus_reset)
 );

  wire mem_read_fifo_pulse;


  RisingEdgePulse rep_mem_read_fifo(
      .i_signal(!mem_read_fifo_empty),
      .o_pulse(mem_read_fifo_pulse),
      .clk(i_mem_clock),
      .reset(i_mem_reset)
  );


  //wire mem_write_fifo;
  //wire mem_write_fifo_full;

   afifo #(.DSIZE(26))
    address(
       .i_wclk(i_bus_clock),
       .i_wrst_n(!i_bus_reset),
       .i_wr(bus_write_fifo),
       .i_wdata(i_bus_address),
       .o_wfull(bus_write_fifo_full),
       .i_rclk(i_mem_clock),
       .i_rrst_n(!i_mem_reset),
       .i_rd(mem_read_fifo_pulse), 
       .o_rdata(o_mem_address),
       .o_rempty(mem_read_fifo_empty)
   );  

  afifo #(.DSIZE(8))
   be(
       .i_wclk(i_bus_clock),
       .i_wrst_n(!i_bus_reset),
       .i_wr(bus_write_fifo),
       .i_wdata(i_bus_be),
       .o_wfull(),
       .i_rclk(i_mem_clock),
       .i_rrst_n(!i_mem_reset),
       .i_rd(mem_read_fifo_pulse),
       .o_rdata(o_mem_be),
       .o_rempty()
   );

  afifo #(.DSIZE(1))

  read_req(
     .i_wclk(i_bus_clock),
     .i_wrst_n(!i_bus_reset),
     .i_wr(bus_write_fifo),
     .i_wdata(i_bus_read_req),
     .o_wfull(),
     .i_rclk(i_mem_clock),
     .i_rrst_n(!i_mem_reset),
     .i_rd(mem_read_fifo_pulse),
     .o_rdata(o_mem_read_req),
     .o_rempty()
  );

 afifo #(.DSIZE(64))
  read_data(
      .i_wclk(i_mem_clock),
      .i_wrst_n(!i_mem_reset),
      .i_wr(mem_write_fifo),
      .i_wdata(i_mem_read_data),
      .o_wfull(mem_write_fifo_full),
      .i_rclk(i_bus_clock),
      .i_rrst_n(!i_bus_reset),
      .i_rd(bus_read_fifo_pulse),
      .o_rdata(o_bus_read_data),
      .o_rempty(bus_read_fifo_empty)
  );
  
  afifo #(.DSIZE(1))

read_data_valid(
    .i_wclk(i_mem_clock),
    .i_wrst_n(!i_mem_reset),
    .i_wr(mem_write_fifo),
    .i_wdata(i_mem_read_data_valid),
    .o_wfull(),
    .i_rclk(i_bus_clock),
    .i_rrst_n(!i_bus_reset),
    .i_rd(bus_read_fifo_pulse),
    .o_rdata(o_bus_read_data_valid),
    .o_rempty()
);

afifo #(.DSIZE(8))

  burst_count(
      .i_wclk(i_bus_clock),
      .i_wrst_n(!i_bus_reset),
      .i_wr(bus_write_fifo),
      .i_wdata(i_bus_burst_count),
      .o_wfull(),
      .i_rclk(i_mem_clock),
      .i_rrst_n(!i_mem_reset),
      .i_rd(mem_read_fifo_pulse),
      .o_rdata(o_mem_burst_count),
      .o_rempty()
  );

 afifo #(.DSIZE(1))

  burst_begin(
      .i_wclk(i_bus_clock),
      .i_wrst_n(!i_bus_reset),
      .i_wr(bus_write_fifo),
      .i_wdata(i_bus_burst_begin),
      .o_wfull(),
      .i_rclk(i_mem_clock),
      .i_rrst_n(!i_mem_reset),
      .i_rd(mem_read_fifo_pulse),
      .o_rdata(o_mem_burst_begin),
      .o_rempty()
  );

 afifo #(.DSIZE(1))

  write_req(
      .i_wclk(i_bus_clock),
      .i_wrst_n(!i_bus_reset),
      .i_wr(bus_write_fifo),
      .i_wdata(i_bus_write_req),
      .o_wfull(),
      .i_rclk(i_mem_clock),
      .i_rrst_n(!i_mem_clock),
      .i_rd(mem_read_fifo_pulse),
      .o_rdata(o_mem_write_req),
      .o_rempty()
    ); 

 afifo #(.DSIZE(64))
  
  write_data(
      .i_wclk(i_bus_clock),
      .i_wrst_n(!i_bus_reset),
      .i_wr(bus_write_fifo),
      .i_wdata(i_bus_write_data),
      .o_wfull(),
      .i_rclk(i_mem_clock),
      .i_rrst_n(!i_mem_clock),
      .i_rd(mem_read_fifo_pulse),
      .o_rdata(o_mem_write_data),
      .o_rempty()
  );


 afifo #(.DSIZE(1))
  
  wait_request(
      .i_wclk(i_mem_clock),
      .i_wrst_n(!i_mem_reset),
      .i_wr(mem_write_fifo),
      .i_wdata(i_mem_wait_request),
      .o_wfull(),
      .i_rclk(i_bus_clock),
      .i_rrst_n(!i_bus_reset),
      .i_rd(bus_read_fifo_pulse),
      .o_rdata(o_bus_wait_request),
      .o_rempty()
  );


  end 
   
 endgenerate



endmodule