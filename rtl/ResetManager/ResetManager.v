// Generator : SpinalHDL v1.6.4    git head : 598c18959149eb18e5eee5b0aa3eef01ecaa41a1
// Component : ResetManager
// Git hash  : c85af5afde9f59b44c2b351e847a3cc5e045a621

`timescale 1ns/1ps 

module ResetManager (
  input               i_clock,
  input               i_reset,
  output              o_global_reset
);

  wire                i_reset_buffercc_io_dataOut;
  wire                clockArea_reset;
  reg        [13:0]   clockArea_counter;
  reg                 clockArea_global_reset;
  wire                when_ClockResetManager_l60;
  wire                when_ClockResetManager_l63;

  ResetManager_BufferCC i_reset_buffercc (
    .io_dataIn     (i_reset                      ), //i
    .io_dataOut    (i_reset_buffercc_io_dataOut  ), //o
    .i_clock       (i_clock                      ), //i
    .i_reset       (i_reset                      )  //i
  );
  assign clockArea_reset = i_reset_buffercc_io_dataOut;
  assign o_global_reset = clockArea_global_reset;
  assign when_ClockResetManager_l60 = (clockArea_reset == 1'b0);
  assign when_ClockResetManager_l63 = (clockArea_counter == 14'h270f);
  always @(posedge i_clock or posedge i_reset) begin
    if(i_reset) begin
      clockArea_counter <= 14'h0;
      clockArea_global_reset <= 1'b0;
    end else begin
      if(when_ClockResetManager_l60) begin
        if(when_ClockResetManager_l63) begin
          clockArea_global_reset <= 1'b0;
        end else begin
          clockArea_global_reset <= 1'b1;
          clockArea_counter <= (clockArea_counter + 14'h0001);
        end
      end else begin
        clockArea_counter <= 14'h0;
        clockArea_global_reset <= 1'b1;
      end
    end
  end


endmodule

module ResetManager_BufferCC (
  input               io_dataIn,
  output              io_dataOut,
  input               i_clock,
  input               i_reset
);

  (* async_reg = "true" *) reg                 buffers_0;
  (* async_reg = "true" *) reg                 buffers_1;

  assign io_dataOut = buffers_1;
  always @(posedge i_clock) begin
    buffers_0 <= io_dataIn;
    buffers_1 <= buffers_0;
  end


endmodule
