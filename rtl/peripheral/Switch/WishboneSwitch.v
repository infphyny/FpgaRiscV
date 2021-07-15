// Generator : SpinalHDL v1.5.0    git head : 83a031922866b078c411ec5529e00f1b6e79f8e7
// Component : WishboneSwitch
// Git hash  : 75f814516d82ca8fa98782d364c73df390f489b5



module WishboneSwitch (
  input               i_wb_stb,
  input               i_wb_cyc,
  input               i_wb_we,
  input      [7:0]    i_wb_dat,
  output     [7:0]    o_wb_dat,
  output              o_wb_ack,
  output              o_wb_rty,
  output              o_wb_err,
  input               i_switch,
  output              o_int,
  input               clk,
  input               reset
);
  reg                 sw_io_i_status_we;
  reg        [7:0]    sw_io_i_status;
  wire       [7:0]    sw_io_o_status;
  wire                sw_io_o_int;
  reg                 ack;
  wire                cs;
  wire                when_WishboneSwitch_l40;
  wire                when_WishboneSwitch_l45;
  wire                when_WishboneSwitch_l48;

  Switch sw (
    .io_i_status_we    (sw_io_i_status_we  ), //i
    .io_i_status       (sw_io_i_status     ), //i
    .io_o_status       (sw_io_o_status     ), //o
    .io_i_switch       (i_switch           ), //i
    .io_o_int          (sw_io_o_int        ), //o
    .clk               (clk                ), //i
    .reset             (reset              )  //i
  );
  always @(*) begin
    sw_io_i_status_we = 1'b0;
    if(when_WishboneSwitch_l45) begin
      if(when_WishboneSwitch_l48) begin
        sw_io_i_status_we = i_wb_we;
      end
    end
  end

  always @(*) begin
    sw_io_i_status = i_wb_dat;
    if(when_WishboneSwitch_l45) begin
      if(when_WishboneSwitch_l48) begin
        sw_io_i_status = i_wb_dat;
      end
    end
  end

  assign o_wb_dat = sw_io_o_status;
  assign o_int = sw_io_o_int;
  assign o_wb_ack = ack;
  assign cs = (i_wb_cyc && i_wb_stb);
  assign o_wb_rty = 1'b0;
  assign o_wb_err = 1'b0;
  assign when_WishboneSwitch_l40 = (ack == 1'b1);
  assign when_WishboneSwitch_l45 = (cs == 1'b1);
  assign when_WishboneSwitch_l48 = (i_wb_we == 1'b1);
  always @(posedge clk or posedge reset) begin
    if(reset) begin
      ack <= 1'b0;
    end else begin
      if(when_WishboneSwitch_l40) begin
        ack <= 1'b0;
      end
      if(when_WishboneSwitch_l45) begin
        ack <= 1'b1;
      end
    end
  end


endmodule

module Switch (
  input               io_i_status_we,
  input      [7:0]    io_i_status,
  output     [7:0]    io_o_status,
  input               io_i_switch,
  output              io_o_int,
  input               clk,
  input               reset
);
  reg                 slow_clock;
  reg        [16:0]   counter;
  wire                when_Switch_l41;
  (* async_reg = "true" *) reg        [7:0]    status;
  wire                int_1;
  wire                clear_interrupt;
  wire       [1:0]    interrupt_select;
  wire                cc_int;
  wire                cc_switch_buf2;
  wire                when_Switch_l64;
  reg                 slow_clock_area_switch_input;
  reg                 slow_clock_area_s_switch_buf;
  reg                 slow_clock_area_s_switch_buf2;
  reg                 slow_clock_area_o_int;
  (* async_reg = "true" *) reg                 o_cc_switch_buf;
  reg                 o_cc_switch_buf2;
  (* async_reg = "true" *) reg                 o_cc_int_buf;
  reg                 o_cc_int_buf2;

  assign when_Switch_l41 = (counter == 17'h16e35);
  assign int_1 = status[3];
  assign clear_interrupt = status[4];
  assign interrupt_select = status[2 : 1];
  assign io_o_int = int_1;
  assign io_o_status = status;
  assign when_Switch_l64 = (clear_interrupt == 1'b1);
  assign cc_switch_buf2 = slow_clock_area_s_switch_buf2;
  assign cc_int = slow_clock_area_o_int;
  always @(posedge clk or posedge reset) begin
    if(reset) begin
      slow_clock <= 1'b0;
      counter <= 17'h0;
      status <= 8'h0;
      o_cc_switch_buf <= 1'b0;
      o_cc_switch_buf2 <= 1'b0;
      o_cc_int_buf <= 1'b0;
      o_cc_int_buf2 <= 1'b0;
    end else begin
      counter <= (counter + 17'h00001);
      if(when_Switch_l41) begin
        counter <= 17'h0;
        slow_clock <= (! slow_clock);
      end
      if(when_Switch_l64) begin
        status[4] <= 1'b0;
      end
      if(io_i_status_we) begin
        status[7 : 5] <= 3'b000;
        status[4] <= io_i_status[4];
        status[2 : 1] <= io_i_status[2 : 1];
      end
      o_cc_switch_buf <= cc_switch_buf2;
      o_cc_switch_buf2 <= o_cc_switch_buf;
      status[0] <= o_cc_switch_buf2;
      o_cc_int_buf <= cc_int;
      o_cc_int_buf2 <= o_cc_int_buf;
      status[3] <= (o_cc_int_buf && (! o_cc_int_buf2));
    end
  end

  always @(posedge slow_clock or posedge reset) begin
    if(reset) begin
      slow_clock_area_switch_input <= 1'b0;
      slow_clock_area_s_switch_buf <= 1'b0;
      slow_clock_area_s_switch_buf2 <= 1'b0;
      slow_clock_area_o_int <= 1'b0;
    end else begin
      slow_clock_area_switch_input <= io_i_switch;
      slow_clock_area_s_switch_buf <= slow_clock_area_switch_input;
      slow_clock_area_s_switch_buf2 <= slow_clock_area_s_switch_buf;
      case(interrupt_select)
        2'b00 : begin
          slow_clock_area_o_int <= 1'b0;
        end
        2'b01 : begin
          slow_clock_area_o_int <= ((! slow_clock_area_s_switch_buf2) && slow_clock_area_s_switch_buf);
        end
        2'b10 : begin
          slow_clock_area_o_int <= (slow_clock_area_s_switch_buf2 && (! slow_clock_area_s_switch_buf));
        end
        default : begin
          slow_clock_area_o_int <= (((! slow_clock_area_s_switch_buf2) && slow_clock_area_s_switch_buf) || (slow_clock_area_s_switch_buf2 && (! slow_clock_area_s_switch_buf)));
        end
      endcase
    end
  end


endmodule
