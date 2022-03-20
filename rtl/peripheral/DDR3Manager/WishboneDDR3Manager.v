// Generator : SpinalHDL v1.6.0    git head : 73c8d8e2b86b45646e9d0b2e729291f2b65e6be3
// Component : WishboneDDR3Manager
// Git hash  : 16cca3e7ca68666d7965f4b737ddd3d2d443a608



module WishboneDDR3Manager (
  input               i_wb_stb,
  input               i_wb_cyc,
  input               i_wb_we,
  input      [7:0]    i_wb_dat,
  output     [7:0]    o_wb_dat,
  output              o_wb_ack,
  output              o_wb_rty,
  output              o_wb_err,
  input               i_init_success,
  input               i_cal_success,
  output              o_soft_reset_n,
  input               clk,
  input               reset
);
  reg                 manager_io_i_status_we;
  reg        [7:0]    manager_io_i_status;
  wire       [7:0]    manager_io_o_status;
  wire                manager_io_o_soft_reset_n;
  wire                cs;
  reg                 ack;
  wire                when_DDR3Manager_l91;
  wire                when_DDR3Manager_l96;
  wire                when_DDR3Manager_l99;

  DDR3Manager manager (
    .io_i_status_we       (manager_io_i_status_we     ), //i
    .io_i_status          (manager_io_i_status        ), //i
    .io_o_status          (manager_io_o_status        ), //o
    .io_i_init_success    (i_init_success             ), //i
    .io_i_cal_success     (i_cal_success              ), //i
    .io_o_soft_reset_n    (manager_io_o_soft_reset_n  ), //o
    .clk                  (clk                        ), //i
    .reset                (reset                      )  //i
  );
  assign cs = (i_wb_cyc && i_wb_stb);
  assign o_wb_ack = ack;
  always @(*) begin
    manager_io_i_status_we = 1'b0;
    if(when_DDR3Manager_l96) begin
      if(when_DDR3Manager_l99) begin
        manager_io_i_status_we = i_wb_we;
      end
    end
  end

  always @(*) begin
    manager_io_i_status = i_wb_dat;
    if(when_DDR3Manager_l96) begin
      if(when_DDR3Manager_l99) begin
        manager_io_i_status = i_wb_dat;
      end
    end
  end

  assign o_soft_reset_n = manager_io_o_soft_reset_n;
  assign o_wb_dat = manager_io_o_status;
  assign o_wb_rty = 1'b0;
  assign o_wb_err = 1'b0;
  assign when_DDR3Manager_l91 = (ack == 1'b1);
  assign when_DDR3Manager_l96 = (cs == 1'b1);
  assign when_DDR3Manager_l99 = (i_wb_we == 1'b1);
  always @(posedge clk or posedge reset) begin
    if(reset) begin
      ack <= 1'b0;
    end else begin
      if(when_DDR3Manager_l91) begin
        ack <= 1'b0;
      end
      if(when_DDR3Manager_l96) begin
        ack <= 1'b1;
      end
    end
  end


endmodule

module DDR3Manager (
  input               io_i_status_we,
  input      [7:0]    io_i_status,
  output     [7:0]    io_o_status,
  input               io_i_init_success,
  input               io_i_cal_success,
  output              io_o_soft_reset_n,
  input               clk,
  input               reset
);
  reg        [7:0]    status;

  assign io_o_status = status;
  assign io_o_soft_reset_n = status[2];
  always @(posedge clk or posedge reset) begin
    if(reset) begin
      status <= 8'h0;
    end else begin
      status[0] <= io_i_init_success;
      status[1] <= io_i_cal_success;
      if(io_i_status_we) begin
        status[7 : 3] <= 5'h0;
        status[2] <= io_i_status[2];
      end
    end
  end


endmodule
