// Generator : SpinalHDL v1.5.0    git head : 83a031922866b078c411ec5529e00f1b6e79f8e7
// Component : TUSB1210
// Git hash  : 666dcbba79181659d0c736eb931d19ec1dc17a25



module TUSB1210 (
  input               io_clk,
  input               io_reset,
  input               io_cpu_we_i,
  input      [7:0]    io_cpu_adr_i,
  input      [7:0]    io_cpu_dat_i,
  output reg [7:0]    io_cpu_dat_o,
  input               io_usb_clk_i,
  input      [7:0]    io_usb_dat_i,
  output     [7:0]    io_usb_dat_o,
  input               io_usb_dir_i,
  input               io_usb_fault_n_i,
  input               io_usb_nxt_i,
  output              io_usb_reset_n_o,
  output              io_usb_stp_o,
  output              io_usb_cs_o
);
  wire                usb_dir;
  wire                usb_fault_n;
  wire                usb_nxt;
  reg        [7:0]    cpuClockDomainArea_send;
  reg        [7:0]    cpuClockDomainArea_rcv;
  reg        [7:0]    cpuClockDomainArea_status;
  wire                when_TUSB1210_l103;

  assign io_usb_reset_n_o = cpuClockDomainArea_status[3];
  assign io_usb_stp_o = cpuClockDomainArea_status[4];
  assign io_usb_cs_o = cpuClockDomainArea_status[5];
  assign io_usb_dat_o = 8'h0;
  assign when_TUSB1210_l103 = (io_cpu_we_i == 1'b1);
  always @(*) begin
    case(io_cpu_adr_i)
      8'h0 : begin
        io_cpu_dat_o = cpuClockDomainArea_rcv;
      end
      8'h01 : begin
        io_cpu_dat_o = cpuClockDomainArea_status;
      end
      default : begin
        io_cpu_dat_o = cpuClockDomainArea_rcv;
      end
    endcase
  end

  assign usb_dir = io_usb_dir_i;
  assign usb_fault_n = io_usb_fault_n_i;
  assign usb_nxt = io_usb_nxt_i;
  always @(posedge io_clk or posedge io_reset) begin
    if(io_reset) begin
      cpuClockDomainArea_send <= 8'h0;
      cpuClockDomainArea_rcv <= 8'h0;
      cpuClockDomainArea_status <= 8'h0;
    end else begin
      cpuClockDomainArea_status[0] <= usb_dir;
      cpuClockDomainArea_status[1] <= usb_fault_n;
      cpuClockDomainArea_status[2] <= usb_nxt;
      cpuClockDomainArea_rcv <= io_usb_dat_i;
      if(when_TUSB1210_l103) begin
        case(io_cpu_adr_i)
          8'h0 : begin
            cpuClockDomainArea_send <= io_cpu_dat_i;
          end
          8'h01 : begin
            cpuClockDomainArea_status[5 : 3] <= io_cpu_dat_i[5 : 3];
          end
          default : begin
          end
        endcase
      end
    end
  end


endmodule
