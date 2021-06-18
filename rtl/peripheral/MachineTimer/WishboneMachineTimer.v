// Generator : SpinalHDL v1.4.3    git head : adf552d8f500e7419fff395b7049228e4bc5de26
// Component : WishboneMachineTimer



module WishboneMachineTimer (
  input      [4:0]    wb_adr_i,
  input      [31:0]   wb_dat_i,
  input               wb_we_i,
  output reg [31:0]   wb_dat_o,
  input               wb_cyc_i,
  input               wb_stb_i,
  output              wb_ack_o,
  output              wb_err_o,
  output              wb_rty_o,
  output              irq,
  input               clk,
  input               reset
);
  reg                 _zz_1;
  reg                 _zz_2;
  wire       [31:0]   _zz_3;
  wire       [31:0]   _zz_4;
  reg                 _zz_5;
  reg                 _zz_6;
  wire       [31:0]   _zz_7;
  wire       [31:0]   _zz_8;
  reg                 _zz_9;
  wire       [7:0]    _zz_10;
  wire       [31:0]   mtimer_io_mtime_read_l;
  wire       [31:0]   mtimer_io_mtime_read_h;
  wire       [31:0]   mtimer_io_mtimecmp_read_l;
  wire       [31:0]   mtimer_io_mtimecmp_read_h;
  wire                mtimer_io_mTimeInterrupt;
  wire       [7:0]    mtimer_io_status_read;
  wire                _zz_11;
  wire                _zz_12;
  reg                 ack;
  wire                sel;

  assign _zz_11 = (sel == 1'b1);
  assign _zz_12 = (wb_we_i == 1'b1);
  MachineTimer mtimer (
    .io_mtime_read_l        (mtimer_io_mtime_read_l[31:0]     ), //o
    .io_mtime_read_h        (mtimer_io_mtime_read_h[31:0]     ), //o
    .io_mtime_we_l          (_zz_1                            ), //i
    .io_mtime_we_h          (_zz_2                            ), //i
    .io_mtime_write_l       (_zz_3[31:0]                      ), //i
    .io_mtime_write_h       (_zz_4[31:0]                      ), //i
    .io_mtimecmp_read_l     (mtimer_io_mtimecmp_read_l[31:0]  ), //o
    .io_mtimecmp_read_h     (mtimer_io_mtimecmp_read_h[31:0]  ), //o
    .io_mtimecmp_we_l       (_zz_5                            ), //i
    .io_mtimecmp_we_h       (_zz_6                            ), //i
    .io_mtimecmp_write_l    (_zz_7[31:0]                      ), //i
    .io_mtimecmp_write_h    (_zz_8[31:0]                      ), //i
    .io_mTimeInterrupt      (mtimer_io_mTimeInterrupt         ), //o
    .io_status_we           (_zz_9                            ), //i
    .io_status_write        (_zz_10[7:0]                      ), //i
    .io_status_read         (mtimer_io_status_read[7:0]       ), //o
    .clk                    (clk                              ), //i
    .reset                  (reset                            )  //i
  );
  always @ (*) begin
    _zz_1 = 1'b0;
    if(_zz_11)begin
      if(_zz_12)begin
        case(wb_adr_i)
          5'h0 : begin
            _zz_1 = 1'b1;
          end
          default : begin
          end
        endcase
      end
    end
  end

  always @ (*) begin
    _zz_2 = 1'b0;
    if(_zz_11)begin
      if(_zz_12)begin
        case(wb_adr_i)
          5'h04 : begin
            _zz_2 = 1'b1;
          end
          default : begin
          end
        endcase
      end
    end
  end

  always @ (*) begin
    _zz_5 = 1'b0;
    if(_zz_11)begin
      if(_zz_12)begin
        case(wb_adr_i)
          5'h08 : begin
            _zz_5 = 1'b1;
          end
          default : begin
          end
        endcase
      end
    end
  end

  always @ (*) begin
    _zz_6 = 1'b0;
    if(_zz_11)begin
      if(_zz_12)begin
        case(wb_adr_i)
          5'h0c : begin
            _zz_6 = 1'b1;
          end
          default : begin
          end
        endcase
      end
    end
  end

  always @ (*) begin
    _zz_9 = 1'b0;
    if(_zz_11)begin
      if(_zz_12)begin
        case(wb_adr_i)
          5'h10 : begin
            _zz_9 = 1'b1;
          end
          default : begin
          end
        endcase
      end
    end
  end

  assign _zz_3 = wb_dat_i;
  assign _zz_4 = wb_dat_i;
  assign _zz_7 = wb_dat_i;
  assign _zz_8 = wb_dat_i;
  assign _zz_10 = wb_dat_i[7 : 0];
  assign irq = mtimer_io_mTimeInterrupt;
  assign wb_ack_o = ack;
  assign wb_rty_o = 1'b0;
  assign wb_err_o = 1'b0;
  assign sel = ((wb_cyc_i && wb_stb_i) && (! ack));
  always @ (*) begin
    case(wb_adr_i)
      5'h0 : begin
        wb_dat_o = mtimer_io_mtime_read_l;
      end
      5'h04 : begin
        wb_dat_o = mtimer_io_mtime_read_h;
      end
      5'h08 : begin
        wb_dat_o = mtimer_io_mtimecmp_read_l;
      end
      5'h0c : begin
        wb_dat_o = mtimer_io_mtimecmp_read_h;
      end
      5'h10 : begin
        wb_dat_o = {24'h0,mtimer_io_status_read};
      end
      default : begin
        wb_dat_o = 32'h0;
      end
    endcase
  end

  always @ (posedge clk or posedge reset) begin
    if (reset) begin
      ack <= 1'b0;
    end else begin
      ack <= 1'b0;
      if((ack == 1'b1))begin
        ack <= 1'b0;
      end
      if(_zz_11)begin
        ack <= 1'b1;
      end
    end
  end


endmodule

module MachineTimer (
  output     [31:0]   io_mtime_read_l,
  output     [31:0]   io_mtime_read_h,
  input               io_mtime_we_l,
  input               io_mtime_we_h,
  input      [31:0]   io_mtime_write_l,
  input      [31:0]   io_mtime_write_h,
  output     [31:0]   io_mtimecmp_read_l,
  output     [31:0]   io_mtimecmp_read_h,
  input               io_mtimecmp_we_l,
  input               io_mtimecmp_we_h,
  input      [31:0]   io_mtimecmp_write_l,
  input      [31:0]   io_mtimecmp_write_h,
  output              io_mTimeInterrupt,
  input               io_status_we,
  input      [7:0]    io_status_write,
  output     [7:0]    io_status_read,
  input               clk,
  input               reset
);
  reg        [63:0]   mtime;
  reg        [63:0]   mtimecmp;
  reg        [7:0]    status;
  wire                interrupt;
  wire                interrupt_enable;

  assign interrupt = status[0];
  assign interrupt_enable = status[1];
  assign io_mTimeInterrupt = interrupt;
  assign io_mtime_read_l = mtime[31 : 0];
  assign io_mtime_read_h = mtime[63 : 32];
  assign io_mtimecmp_read_l = mtimecmp[31 : 0];
  assign io_mtimecmp_read_h = mtimecmp[63 : 32];
  assign io_status_read = status;
  always @ (posedge clk or posedge reset) begin
    if (reset) begin
      mtime <= 64'h0;
      mtimecmp <= 64'h0;
      status <= 8'h0;
    end else begin
      status[0] <= ((interrupt || ((mtime == mtimecmp) && (! interrupt))) && interrupt_enable);
      if((interrupt_enable == 1'b1))begin
        if((mtime == mtimecmp))begin
          mtime <= 64'h0;
        end else begin
          mtime <= (mtime + 64'h0000000000000001);
        end
      end
      if((io_mtime_we_l == 1'b1))begin
        mtime[31 : 0] <= io_mtime_write_l;
      end
      if((io_mtime_we_h == 1'b1))begin
        mtime[63 : 32] <= io_mtime_write_h;
      end
      if((io_mtimecmp_we_l == 1'b1))begin
        mtimecmp[31 : 0] <= io_mtimecmp_write_l;
      end
      if((io_mtimecmp_we_h == 1'b1))begin
        mtimecmp[63 : 32] <= io_mtimecmp_write_h;
      end
      if(io_status_we)begin
        status <= io_status_write;
      end
    end
  end


endmodule
