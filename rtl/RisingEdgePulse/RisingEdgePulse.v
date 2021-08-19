// Generator : SpinalHDL v1.6.0    git head : 73c8d8e2b86b45646e9d0b2e729291f2b65e6be3
// Component : RisingEdgePulse
// Git hash  : 103e88b66fece04edfdc6177def05623920a54e3



module RisingEdgePulse (
  input               i_signal,
  output              o_pulse,
  input               clk,
  input               reset
);
  reg                 previous_signal;
  reg                 rep;
  wire                when_RisingEdgePulse_l39;

  assign o_pulse = rep;
  assign when_RisingEdgePulse_l39 = ((previous_signal == 1'b0) && (i_signal == 1'b1));
  always @(posedge clk) begin
    previous_signal <= i_signal;
  end

  always @(posedge clk or posedge reset) begin
    if(reset) begin
      rep <= 1'b0;
    end else begin
      rep <= 1'b0;
      if(when_RisingEdgePulse_l39) begin
        rep <= 1'b1;
      end
    end
  end


endmodule
