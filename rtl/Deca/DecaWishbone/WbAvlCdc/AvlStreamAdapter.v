// Generator : SpinalHDL v1.6.4    git head : 598c18959149eb18e5eee5b0aa3eef01ecaa41a1
// Component : AvlStreamAdapter
// Git hash  : 0d73750da08867d712ad142e7a44c2b5ab44ff1b

`timescale 1ns/1ps 

module AvlStreamAdapter (
  input               i_avl_clock,
  input               i_avl_reset,
  output              o_avl_burstbegin,
  output     [7:0]    o_avl_be,
  output     [25:0]   o_avl_adr,
  output     [63:0]   o_avl_dat,
  output reg          o_avl_wr_req,
  output reg          o_avl_rdt_req,
  output     [2:0]    o_avl_size,
  input      [63:0]   i_avl_rdt,
  input               i_avl_ready,
  input               i_avl_rdt_valid,
  output reg          o_stream_valid,
  input               o_stream_ready,
  output     [63:0]   o_stream_payload_rdt,
  input               i_stream_valid,
  output reg          i_stream_ready,
  input               i_stream_payload_we,
  input      [25:0]   i_stream_payload_adr,
  input      [63:0]   i_stream_payload_dat,
  input      [7:0]    i_stream_payload_sel,
  input               i_stream_payload_burstbegin,
  input      [2:0]    i_stream_payload_size
);

  wire                when_AvlStreamAdapter_l67;

  always @(*) begin
    i_stream_ready = 1'b0;
    if(i_avl_rdt_valid) begin
      i_stream_ready = 1'b1;
    end
    if(when_AvlStreamAdapter_l67) begin
      if(i_stream_payload_we) begin
        i_stream_ready = 1'b1;
      end
    end
  end

  assign o_avl_burstbegin = i_stream_payload_burstbegin;
  assign o_avl_be = i_stream_payload_sel;
  assign o_avl_adr = i_stream_payload_adr;
  assign o_avl_dat = i_stream_payload_dat;
  always @(*) begin
    o_avl_wr_req = 1'b0;
    if(when_AvlStreamAdapter_l67) begin
      o_avl_wr_req = i_stream_payload_we;
    end
  end

  always @(*) begin
    o_avl_rdt_req = 1'b0;
    if(when_AvlStreamAdapter_l67) begin
      o_avl_rdt_req = (! i_stream_payload_we);
    end
  end

  assign o_avl_size = i_stream_payload_size;
  always @(*) begin
    o_stream_valid = 1'b0;
    if(i_avl_rdt_valid) begin
      o_stream_valid = 1'b1;
    end
  end

  assign o_stream_payload_rdt = i_avl_rdt;
  assign when_AvlStreamAdapter_l67 = (i_stream_valid && i_avl_ready);

endmodule
