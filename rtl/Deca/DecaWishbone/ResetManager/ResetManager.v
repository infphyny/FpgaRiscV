// Generator : SpinalHDL v1.6.4    git head : 598c18959149eb18e5eee5b0aa3eef01ecaa41a1
// Component : ResetManager
// Git hash  : 181684644c21cb687b259ffca78cbbc6782ca144

`timescale 1ns/1ps 

module ResetManager (
  input               i_clock,
  input               i_reset_n,
  output              o_global_reset
);

  wire                bufferCC_1_io_dataIn;
  wire                bufferCC_1_io_dataOut;
  reg        [14:0]   _zz_when_ClockResetManager_l67;
  reg                 _zz_o_global_reset;
  wire                when_ClockResetManager_l64;
  wire                when_ClockResetManager_l67;

  BufferCC bufferCC_1 (
    .io_dataIn     (bufferCC_1_io_dataIn   ), //i
    .io_dataOut    (bufferCC_1_io_dataOut  ), //o
    .i_clock       (i_clock                ), //i
    .i_reset_n     (i_reset_n              )  //i
  );
  assign bufferCC_1_io_dataIn = (! i_reset_n);
  assign o_global_reset = _zz_o_global_reset;
  assign when_ClockResetManager_l64 = (bufferCC_1_io_dataOut == 1'b0);
  assign when_ClockResetManager_l67 = (_zz_when_ClockResetManager_l67 == 15'h752f);
  always @(posedge i_clock or negedge i_reset_n) begin
    if(!i_reset_n) begin
      _zz_when_ClockResetManager_l67 <= 15'h0;
      _zz_o_global_reset <= 1'b0;
    end else begin
      if(when_ClockResetManager_l64) begin
        if(when_ClockResetManager_l67) begin
          _zz_o_global_reset <= 1'b0;
        end else begin
          _zz_o_global_reset <= 1'b1;
          _zz_when_ClockResetManager_l67 <= (_zz_when_ClockResetManager_l67 + 15'h0001);
        end
      end else begin
        _zz_when_ClockResetManager_l67 <= 15'h0;
        _zz_o_global_reset <= 1'b1;
      end
    end
  end


endmodule

module BufferCC (
  input               io_dataIn,
  output              io_dataOut,
  input               i_clock,
  input               i_reset_n
);

  (* async_reg = "true" *) reg                 buffers_0;
  (* async_reg = "true" *) reg                 buffers_1;

  assign io_dataOut = buffers_1;
  always @(posedge i_clock) begin
    buffers_0 <= io_dataIn;
    buffers_1 <= buffers_0;
  end


endmodule
