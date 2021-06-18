// Generator : SpinalHDL v1.4.3    git head : adf552d8f500e7419fff395b7049228e4bc5de26
// Component : MachineTimer
// Git hash  : e03a66e8f94607b5b85df824187b35e3c8c2028f



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
  input               io_mTimeInterruptClear,
  output              io_mTimeInterrupt,
  input               clk,
  input               reset
);
  reg        [63:0]   mtime;
  reg        [63:0]   mtimecmp;
  reg                 interrupt;

  assign io_mTimeInterrupt = interrupt;
  assign io_mtime_read_l = mtime[31 : 0];
  assign io_mtime_read_h = mtime[63 : 32];
  assign io_mtimecmp_read_l = mtimecmp[31 : 0];
  assign io_mtimecmp_read_h = mtimecmp[63 : 32];
  always @ (posedge clk or posedge reset) begin
    if (reset) begin
      mtime <= 64'h0;
      mtimecmp <= 64'h0;
      interrupt <= 1'b0;
    end else begin
      interrupt <= ((interrupt || ((mtime == mtimecmp) && (! interrupt))) && (! io_mTimeInterruptClear));
      if((mtime == mtimecmp))begin
        mtime <= 64'h0;
        interrupt <= 1'b1;
      end else begin
        mtime <= (mtime + 64'h0000000000000001);
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
    end
  end


endmodule
