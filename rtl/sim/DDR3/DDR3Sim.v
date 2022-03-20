// Generator : SpinalHDL v1.6.0    git head : 73c8d8e2b86b45646e9d0b2e729291f2b65e6be3
// Component : DDR3Sim
// Git hash  : 93ff13c803ccc7e8c0f8166031325c514c4e2d38



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
  reg        [7:0]    _zz_ram0_port0;
  reg        [7:0]    _zz_ram1_port0;
  reg        [7:0]    _zz_ram2_port0;
  reg        [7:0]    _zz_ram3_port0;
  reg        [7:0]    _zz_ram4_port0;
  reg        [7:0]    _zz_ram5_port0;
  reg        [7:0]    _zz_ram6_port0;
  reg        [7:0]    _zz_ram7_port0;
  wire       [7:0]    _zz_ram0_port;
  wire       [7:0]    _zz_ram1_port;
  wire       [7:0]    _zz_ram2_port;
  wire       [7:0]    _zz_ram3_port;
  wire       [7:0]    _zz_ram4_port;
  wire       [7:0]    _zz_ram5_port;
  wire       [7:0]    _zz_ram6_port;
  wire       [7:0]    _zz_ram7_port;
  reg                 _zz_1;
  reg                 _zz_2;
  reg                 _zz_3;
  reg                 _zz_4;
  reg                 _zz_5;
  reg                 _zz_6;
  reg                 _zz_7;
  reg                 _zz_8;
  reg                 rdata_valid;
  wire                when_ddr3_l54;
  wire                when_ddr3_l70;
  wire                when_ddr3_l71;
  wire                when_ddr3_l72;
  wire                when_ddr3_l73;
  wire                when_ddr3_l74;
  wire                when_ddr3_l75;
  wire                when_ddr3_l76;
  wire                when_ddr3_l77;
  wire                when_ddr3_l78;
  wire                when_ddr3_l82;
  reg [7:0] ram0 [0:67108863];
  reg [7:0] ram1 [0:67108863];
  reg [7:0] ram2 [0:67108863];
  reg [7:0] ram3 [0:67108863];
  reg [7:0] ram4 [0:67108863];
  reg [7:0] ram5 [0:67108863];
  reg [7:0] ram6 [0:67108863];
  reg [7:0] ram7 [0:67108863];

  assign _zz_ram0_port = avl_wdata[7 : 0];
  assign _zz_ram1_port = avl_wdata[15 : 8];
  assign _zz_ram2_port = avl_wdata[23 : 16];
  assign _zz_ram3_port = avl_wdata[31 : 24];
  assign _zz_ram4_port = avl_wdata[39 : 32];
  assign _zz_ram5_port = avl_wdata[47 : 40];
  assign _zz_ram6_port = avl_wdata[55 : 48];
  assign _zz_ram7_port = avl_wdata[63 : 56];
  always @(posedge clk) begin
    if(avl_read_req) begin
      _zz_ram0_port0 <= ram0[avl_addr];
    end
  end

  always @(posedge clk) begin
    if(_zz_8) begin
      ram0[avl_addr] <= _zz_ram0_port;
    end
  end

  always @(posedge clk) begin
    if(avl_read_req) begin
      _zz_ram1_port0 <= ram1[avl_addr];
    end
  end

  always @(posedge clk) begin
    if(_zz_7) begin
      ram1[avl_addr] <= _zz_ram1_port;
    end
  end

  always @(posedge clk) begin
    if(avl_read_req) begin
      _zz_ram2_port0 <= ram2[avl_addr];
    end
  end

  always @(posedge clk) begin
    if(_zz_6) begin
      ram2[avl_addr] <= _zz_ram2_port;
    end
  end

  always @(posedge clk) begin
    if(avl_read_req) begin
      _zz_ram3_port0 <= ram3[avl_addr];
    end
  end

  always @(posedge clk) begin
    if(_zz_5) begin
      ram3[avl_addr] <= _zz_ram3_port;
    end
  end

  always @(posedge clk) begin
    if(avl_read_req) begin
      _zz_ram4_port0 <= ram4[avl_addr];
    end
  end

  always @(posedge clk) begin
    if(_zz_4) begin
      ram4[avl_addr] <= _zz_ram4_port;
    end
  end

  always @(posedge clk) begin
    if(avl_read_req) begin
      _zz_ram5_port0 <= ram5[avl_addr];
    end
  end

  always @(posedge clk) begin
    if(_zz_3) begin
      ram5[avl_addr] <= _zz_ram5_port;
    end
  end

  always @(posedge clk) begin
    if(avl_read_req) begin
      _zz_ram6_port0 <= ram6[avl_addr];
    end
  end

  always @(posedge clk) begin
    if(_zz_2) begin
      ram6[avl_addr] <= _zz_ram6_port;
    end
  end

  always @(posedge clk) begin
    if(avl_read_req) begin
      _zz_ram7_port0 <= ram7[avl_addr];
    end
  end

  always @(posedge clk) begin
    if(_zz_1) begin
      ram7[avl_addr] <= _zz_ram7_port;
    end
  end

  always @(*) begin
    _zz_1 = 1'b0;
    if(when_ddr3_l70) begin
      if(when_ddr3_l78) begin
        _zz_1 = 1'b1;
      end
    end
  end

  always @(*) begin
    _zz_2 = 1'b0;
    if(when_ddr3_l70) begin
      if(when_ddr3_l77) begin
        _zz_2 = 1'b1;
      end
    end
  end

  always @(*) begin
    _zz_3 = 1'b0;
    if(when_ddr3_l70) begin
      if(when_ddr3_l76) begin
        _zz_3 = 1'b1;
      end
    end
  end

  always @(*) begin
    _zz_4 = 1'b0;
    if(when_ddr3_l70) begin
      if(when_ddr3_l75) begin
        _zz_4 = 1'b1;
      end
    end
  end

  always @(*) begin
    _zz_5 = 1'b0;
    if(when_ddr3_l70) begin
      if(when_ddr3_l74) begin
        _zz_5 = 1'b1;
      end
    end
  end

  always @(*) begin
    _zz_6 = 1'b0;
    if(when_ddr3_l70) begin
      if(when_ddr3_l73) begin
        _zz_6 = 1'b1;
      end
    end
  end

  always @(*) begin
    _zz_7 = 1'b0;
    if(when_ddr3_l70) begin
      if(when_ddr3_l72) begin
        _zz_7 = 1'b1;
      end
    end
  end

  always @(*) begin
    _zz_8 = 1'b0;
    if(when_ddr3_l70) begin
      if(when_ddr3_l71) begin
        _zz_8 = 1'b1;
      end
    end
  end

  assign local_init_done = 1'b1;
  assign local_cal_success = 1'b1;
  assign avl_rdata_valid = rdata_valid;
  assign when_ddr3_l54 = (rdata_valid == 1'b1);
  assign avl_ready = 1'b1;
  assign avl_rdata = {{{{{{{_zz_ram7_port0,_zz_ram6_port0},_zz_ram5_port0},_zz_ram4_port0},_zz_ram3_port0},_zz_ram2_port0},_zz_ram1_port0},_zz_ram0_port0};
  assign when_ddr3_l70 = (avl_write_req == 1'b1);
  assign when_ddr3_l71 = avl_be[0];
  assign when_ddr3_l72 = avl_be[1];
  assign when_ddr3_l73 = avl_be[2];
  assign when_ddr3_l74 = avl_be[3];
  assign when_ddr3_l75 = avl_be[4];
  assign when_ddr3_l76 = avl_be[5];
  assign when_ddr3_l77 = avl_be[6];
  assign when_ddr3_l78 = avl_be[7];
  assign when_ddr3_l82 = (avl_read_req == 1'b1);
  always @(posedge clk or posedge reset) begin
    if(reset) begin
      rdata_valid <= 1'b0;
    end else begin
      if(when_ddr3_l54) begin
        rdata_valid <= 1'b0;
      end
      if(when_ddr3_l82) begin
        rdata_valid <= 1'b1;
      end
    end
  end


endmodule
