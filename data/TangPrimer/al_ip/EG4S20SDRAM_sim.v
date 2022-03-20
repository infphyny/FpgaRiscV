// Verilog netlist created by TD v5.0.43066
// Tue Dec 21 15:38:19 2021

`timescale 1ns / 1ps
module EG4S20SDRAM  // EG4S20SDRAM.v(14)
  (
  addr,
  ba,
  cas_n,
  cke,
  clk,
  cs_n,
  dm0,
  dm1,
  dm2,
  dm3,
  ras_n,
  we_n,
  dq
  );

  input [10:0] addr;  // EG4S20SDRAM.v(19)
  input [1:0] ba;  // EG4S20SDRAM.v(20)
  input cas_n;  // EG4S20SDRAM.v(17)
  input cke;  // EG4S20SDRAM.v(27)
  input clk;  // EG4S20SDRAM.v(15)
  input cs_n;  // EG4S20SDRAM.v(22)
  input dm0;  // EG4S20SDRAM.v(23)
  input dm1;  // EG4S20SDRAM.v(24)
  input dm2;  // EG4S20SDRAM.v(25)
  input dm3;  // EG4S20SDRAM.v(26)
  input ras_n;  // EG4S20SDRAM.v(16)
  input we_n;  // EG4S20SDRAM.v(18)
  inout [31:0] dq;  // EG4S20SDRAM.v(21)


  EG_PHY_CONFIG #(
    .DONE_PERSISTN("ENABLE"),
    .INIT_PERSISTN("ENABLE"),
    .JTAG_PERSISTN("DISABLE"),
    .PROGRAMN_PERSISTN("DISABLE"))
    config_inst ();
  EG_PHY_SDRAM_2M_32 sdram (
    .addr(addr),
    .ba(ba),
    .cas_n(cas_n),
    .cke(cke),
    .clk(clk),
    .cs_n(cs_n),
    .dm0(dm0),
    .dm1(dm1),
    .dm2(dm2),
    .dm3(dm3),
    .ras_n(ras_n),
    .we_n(we_n),
    .dq(dq));  // EG4S20SDRAM.v(29)

endmodule 

