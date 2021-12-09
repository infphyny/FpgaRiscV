// Generator : SpinalHDL v1.6.0    git head : 73c8d8e2b86b45646e9d0b2e729291f2b65e6be3
// Component : DDR3Sim
// Git hash  : c63f77f60649f6131264efdc8d97b007cb90864e



module DDR3Sim (
  output              avl_ready,
  input               avl_burst_begin,
  output              avl_rdata_valid,
  input      [25:0]   avl_addr,
  output     [63:0]   avl_rdata,
  input      [63:0]   avl_wdata,
  input      [7:0]    avl_be,
  input               avl_read_req,
  input               avl_write_req,
  input      [2:0]    avl_size,
  output              local_init_done,
  output              local_cal_success,
  input               clk,
  input               reset
);
  reg        [63:0]   _zz_ram_port0;
  reg                 _zz_1;
  reg                 rdata_valid;
  wire                when_ddr3_l46;
  wire                when_ddr3_l59;
  wire                when_ddr3_l64;
  reg [63:0] ram [0:67108863];

  always @(posedge clk) begin
    if(avl_read_req) begin
      _zz_ram_port0 <= ram[avl_addr];
    end
  end

  always @(posedge clk) begin
    if(_zz_1) begin
      ram[avl_addr] <= avl_wdata;
    end
  end

  always @(*) begin
    _zz_1 = 1'b0;
    if(when_ddr3_l59) begin
      _zz_1 = 1'b1;
    end
  end

  assign local_init_done = 1'b1;
  assign local_cal_success = 1'b1;
  assign avl_rdata_valid = rdata_valid;
  assign when_ddr3_l46 = (rdata_valid == 1'b1);
  assign avl_ready = 1'b1;
  assign avl_rdata = _zz_ram_port0;
  assign when_ddr3_l59 = (avl_write_req == 1'b1);
  assign when_ddr3_l64 = (avl_read_req == 1'b1);
  always @(posedge clk or posedge reset) begin
    if(reset) begin
      rdata_valid <= 1'b0;
    end else begin
      if(when_ddr3_l46) begin
        rdata_valid <= 1'b0;
      end
      if(when_ddr3_l64) begin
        rdata_valid <= 1'b1;
      end
    end
  end


endmodule
