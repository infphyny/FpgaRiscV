/*

*/




module BusMemClockDomainCrossing(
  
  input wire i_bus_clock,
  input wire i_bus_reset,
  input wire i_mem_clock,
  input wire i_mem_reset,
  
  input wire [31:0] i_bus_address,
  input wire [7:0] i_bus_be,
  input wire i_bus_read_req,
  output wire [63:0] o_bus_read_data,
  output wire o_bus_read_data_valid,
  input wire [7:0] i_bus_burst_count,
  input wire i_bus_burst_begin,
  input wire i_bus_write_req,
  input wire [63:0] i_bus_write_data,
  output wire o_bus_wait_request,
  
  output wire [31:0] o_mem_address,
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
 parameter FIFO_DEPTH = 4;

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

   reg prev_bus_read_req = i_bus_read_req;
   reg prev_bus_write_req = i_bus_write_req;
   reg prev_mem_read_data_valid = i_mem_read_data_valid;

   wire mem_read_fifo_empty;
  wire bus_read_fifo_empty;
  
  wire bus_write_fifo_full;

  wire bus_write_fifo = ( (i_bus_read_req != prev_bus_read_req)  || (i_bus_write_req != prev_bus_write_req) ) && !i_mem_wait_request && !bus_write_fifo_full;
  //reg bus_write_fifo = 0;
  


  wire mem_write_fifo_full;
  wire mem_write_fifo = ( (i_mem_read_data_valid!=prev_mem_read_data_valid) && !i_mem_wait_request) && !mem_write_fifo_full;
  //reg mem_write_fifo = 0;

 wire bus_read_fifo_pulse = !bus_read_fifo_empty;


    always@( posedge i_bus_clock) begin
       
      
      prev_bus_read_req <= i_bus_read_req;
      prev_bus_write_req <= i_bus_write_req;
      
    //  bus_write_fifo <= ( (i_bus_read_req != prev_bus_read_req)  || (i_bus_write_req != prev_bus_write_req) ) && !i_mem_wait_request && !bus_write_fifo_full;
      


    end

    always@( posedge i_mem_clock) begin
     prev_mem_read_data_valid <= i_mem_read_data_valid;
     
    // mem_write_fifo <= ( (i_mem_read_data_valid!=prev_mem_read_data_valid) && !i_mem_wait_request) && !mem_write_fifo_full;

    end     
    
   

  
 
 /*
 RisingEdgePulse rep_bus_read_fifo(
     .i_signal(!bus_read_fifo_empty),
     .o_pulse(bus_read_fifo_pulse),
     .clk(i_bus_clock),
     .reset(i_bus_reset)
 );
 */

  wire mem_read_fifo_pulse = !mem_read_fifo_empty;


/*
  RisingEdgePulse rep_mem_read_fifo(
      .i_signal(!mem_read_fifo_empty),
      .o_pulse(mem_read_fifo_pulse),
      .clk(i_mem_clock),
      .reset(i_mem_reset)
  );
  */


  //wire mem_write_fifo;
  //wire mem_write_fifo_full;

   afifo #(.DSIZE(32),
    .ASIZE(FIFO_DEPTH))
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

  afifo #(.DSIZE(8),
         .ASIZE(FIFO_DEPTH) 
       )
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

  afifo #(.DSIZE(1),
   .ASIZE(FIFO_DEPTH))

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

 afifo #(.DSIZE(64),
 .ASIZE(FIFO_DEPTH))
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
  
  afifo #(.DSIZE(1),
  .ASIZE(FIFO_DEPTH))

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

afifo #(.DSIZE(8),
    .ASIZE(FIFO_DEPTH))

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

 afifo #(.DSIZE(1),
     .ASIZE(FIFO_DEPTH))

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

 afifo #(.DSIZE(1),
 .ASIZE(FIFO_DEPTH))

  write_req(
      .i_wclk(i_bus_clock),
      .i_wrst_n(!i_bus_reset),
      .i_wr(bus_write_fifo),
      .i_wdata(i_bus_write_req),
      .o_wfull(),
      .i_rclk(i_mem_clock),
      .i_rrst_n(!i_mem_reset),
      .i_rd(mem_read_fifo_pulse),
      .o_rdata(o_mem_write_req),
      .o_rempty()
    ); 

 afifo #(.DSIZE(64),
 .ASIZE(FIFO_DEPTH))
  
  write_data(
      .i_wclk(i_bus_clock),
      .i_wrst_n(!i_bus_reset),
      .i_wr(bus_write_fifo),
      .i_wdata(i_bus_write_data),
      .o_wfull(),
      .i_rclk(i_mem_clock),
      .i_rrst_n(!i_mem_reset),
      .i_rd(mem_read_fifo_pulse),
      .o_rdata(o_mem_write_data),
      .o_rempty()
  );


 afifo #(.DSIZE(1),
 .ASIZE(FIFO_DEPTH))
  
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