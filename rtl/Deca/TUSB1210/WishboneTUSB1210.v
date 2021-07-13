// Generator : SpinalHDL v1.5.0    git head : 83a031922866b078c411ec5529e00f1b6e79f8e7
// Component : WishboneTUSB1210
// Git hash  : 666dcbba79181659d0c736eb931d19ec1dc17a25


`define StateMachineEnum_binary_sequential_type [2:0]
`define StateMachineEnum_binary_sequential_e0 3'b000
`define StateMachineEnum_binary_sequential_e1 3'b001
`define StateMachineEnum_binary_sequential_e2 3'b010
`define StateMachineEnum_binary_sequential_e3 3'b011
`define StateMachineEnum_binary_sequential_e4 3'b100

`define usbClockDomainArea_ulpi_fsm_enumDefinition_binary_sequential_type [2:0]
`define usbClockDomainArea_ulpi_fsm_enumDefinition_binary_sequential_usbClockDomainArea_ulpi_fsm_BOOT 3'b000
`define usbClockDomainArea_ulpi_fsm_enumDefinition_binary_sequential_usbClockDomainArea_ulpi_fsm_Idle 3'b001
`define usbClockDomainArea_ulpi_fsm_enumDefinition_binary_sequential_usbClockDomainArea_ulpi_fsm_RegRead 3'b010
`define usbClockDomainArea_ulpi_fsm_enumDefinition_binary_sequential_usbClockDomainArea_ulpi_fsm_RegWrite 3'b011
`define usbClockDomainArea_ulpi_fsm_enumDefinition_binary_sequential_usbClockDomainArea_ulpi_fsm_UsbRx 3'b100
`define usbClockDomainArea_ulpi_fsm_enumDefinition_binary_sequential_usbClockDomainArea_ulpi_fsm_UsbTx 3'b101


module WishboneTUSB1210 (
  input               clk,
  input               reset,
  input               wb_stb_i,
  input               wb_cyc_i,
  input               wb_we_i,
  output              wb_ack_o,
  input      [0:0]    wb_adr_i,
  input      [7:0]    wb_dat_i,
  output     [7:0]    wb_dat_o,
  input               usb_clk_i,
  input      [7:0]    usb_dat_i,
  output     [7:0]    usb_dat_o,
  input               usb_dir_i,
  input               usb_fault_n_i,
  input               usb_nxt_i,
  output              usb_reset_n_o,
  output              usb_stp_o,
  output              usb_cs_o
);
  reg                 cpuClockDomainArea_tusb1210_io_cpu_we_i;
  wire       [7:0]    cpuClockDomainArea_tusb1210_io_cpu_dat_o;
  wire       [7:0]    cpuClockDomainArea_tusb1210_io_usb_dat_o;
  wire                cpuClockDomainArea_tusb1210_io_usb_reset_n_o;
  wire                cpuClockDomainArea_tusb1210_io_usb_stp_o;
  wire                cpuClockDomainArea_tusb1210_io_usb_cs_o;
  reg                 cpuClockDomainArea_ack;
  wire                when_WishboneTUSB1210_l67;
  wire                when_WishboneTUSB1210_l101;

  TUSB1210 cpuClockDomainArea_tusb1210 (
    .io_clk              (clk                                           ), //i
    .io_reset            (reset                                         ), //i
    .io_cpu_we_i         (cpuClockDomainArea_tusb1210_io_cpu_we_i       ), //i
    .io_cpu_adr_i        (wb_adr_i                                      ), //i
    .io_cpu_dat_i        (wb_dat_i                                      ), //i
    .io_cpu_dat_o        (cpuClockDomainArea_tusb1210_io_cpu_dat_o      ), //o
    .io_usb_clk_i        (usb_clk_i                                     ), //i
    .io_usb_dat_i        (usb_dat_i                                     ), //i
    .io_usb_dat_o        (cpuClockDomainArea_tusb1210_io_usb_dat_o      ), //o
    .io_usb_dir_i        (usb_dir_i                                     ), //i
    .io_usb_fault_n_i    (usb_fault_n_i                                 ), //i
    .io_usb_nxt_i        (usb_nxt_i                                     ), //i
    .io_usb_reset_n_o    (cpuClockDomainArea_tusb1210_io_usb_reset_n_o  ), //o
    .io_usb_stp_o        (cpuClockDomainArea_tusb1210_io_usb_stp_o      ), //o
    .io_usb_cs_o         (cpuClockDomainArea_tusb1210_io_usb_cs_o       )  //o
  );
  assign wb_ack_o = cpuClockDomainArea_ack;
  assign when_WishboneTUSB1210_l67 = (cpuClockDomainArea_ack == 1'b1);
  always @(*) begin
    cpuClockDomainArea_tusb1210_io_cpu_we_i = 1'b0;
    if(when_WishboneTUSB1210_l101) begin
      cpuClockDomainArea_tusb1210_io_cpu_we_i = wb_we_i;
    end
  end

  assign wb_dat_o = cpuClockDomainArea_tusb1210_io_cpu_dat_o;
  assign usb_dat_o = cpuClockDomainArea_tusb1210_io_usb_dat_o;
  assign usb_reset_n_o = cpuClockDomainArea_tusb1210_io_usb_reset_n_o;
  assign usb_stp_o = cpuClockDomainArea_tusb1210_io_usb_reset_n_o;
  assign usb_cs_o = cpuClockDomainArea_tusb1210_io_usb_cs_o;
  assign when_WishboneTUSB1210_l101 = (((wb_stb_i == 1'b1) && (wb_cyc_i == 1'b1)) && (cpuClockDomainArea_ack == 1'b0));
  always @(posedge clk or posedge reset) begin
    if(reset) begin
      cpuClockDomainArea_ack <= 1'b0;
    end else begin
      if(when_WishboneTUSB1210_l67) begin
        cpuClockDomainArea_ack <= 1'b0;
      end
      if(when_WishboneTUSB1210_l101) begin
        cpuClockDomainArea_ack <= 1'b1;
      end
    end
  end


endmodule

module TUSB1210 (
  input               io_clk,
  input               io_reset,
  input               io_cpu_we_i,
  input      [0:0]    io_cpu_adr_i,
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
  wire       [7:0]    rcv_wire;
  reg        [7:0]    cpuClockDomainArea_send;
  reg        [7:0]    cpuClockDomainArea_rcv;
  reg        [7:0]    cpuClockDomainArea_status;
  wire                when_TUSB1210_l109;
  (* async_reg = "true" *) reg        [7:0]    usbClockDomainArea_rcv_cc;
  wire                usbClockDomainArea_ulpi_fsm_wantExit;
  reg                 usbClockDomainArea_ulpi_fsm_wantStart;
  wire                usbClockDomainArea_ulpi_fsm_wantKill;
  reg                 _zz_1;
  reg                 _zz_2;
  reg        `StateMachineEnum_binary_sequential_type _zz_3;
  reg        `StateMachineEnum_binary_sequential_type _zz_4;
  wire                when_TUSB1210_l153;
  reg        `usbClockDomainArea_ulpi_fsm_enumDefinition_binary_sequential_type usbClockDomainArea_ulpi_fsm_stateReg;
  reg        `usbClockDomainArea_ulpi_fsm_enumDefinition_binary_sequential_type usbClockDomainArea_ulpi_fsm_stateNext;
  wire                when_StateMachine_l230;
  `ifndef SYNTHESIS
  reg [15:0] _zz_3_string;
  reg [15:0] _zz_4_string;
  reg [287:0] usbClockDomainArea_ulpi_fsm_stateReg_string;
  reg [287:0] usbClockDomainArea_ulpi_fsm_stateNext_string;
  `endif


  `ifndef SYNTHESIS
  always @(*) begin
    case(_zz_3)
      `StateMachineEnum_binary_sequential_e0 : _zz_3_string = "e0";
      `StateMachineEnum_binary_sequential_e1 : _zz_3_string = "e1";
      `StateMachineEnum_binary_sequential_e2 : _zz_3_string = "e2";
      `StateMachineEnum_binary_sequential_e3 : _zz_3_string = "e3";
      `StateMachineEnum_binary_sequential_e4 : _zz_3_string = "e4";
      default : _zz_3_string = "??";
    endcase
  end
  always @(*) begin
    case(_zz_4)
      `StateMachineEnum_binary_sequential_e0 : _zz_4_string = "e0";
      `StateMachineEnum_binary_sequential_e1 : _zz_4_string = "e1";
      `StateMachineEnum_binary_sequential_e2 : _zz_4_string = "e2";
      `StateMachineEnum_binary_sequential_e3 : _zz_4_string = "e3";
      `StateMachineEnum_binary_sequential_e4 : _zz_4_string = "e4";
      default : _zz_4_string = "??";
    endcase
  end
  always @(*) begin
    case(usbClockDomainArea_ulpi_fsm_stateReg)
      `usbClockDomainArea_ulpi_fsm_enumDefinition_binary_sequential_usbClockDomainArea_ulpi_fsm_BOOT : usbClockDomainArea_ulpi_fsm_stateReg_string = "usbClockDomainArea_ulpi_fsm_BOOT    ";
      `usbClockDomainArea_ulpi_fsm_enumDefinition_binary_sequential_usbClockDomainArea_ulpi_fsm_Idle : usbClockDomainArea_ulpi_fsm_stateReg_string = "usbClockDomainArea_ulpi_fsm_Idle    ";
      `usbClockDomainArea_ulpi_fsm_enumDefinition_binary_sequential_usbClockDomainArea_ulpi_fsm_RegRead : usbClockDomainArea_ulpi_fsm_stateReg_string = "usbClockDomainArea_ulpi_fsm_RegRead ";
      `usbClockDomainArea_ulpi_fsm_enumDefinition_binary_sequential_usbClockDomainArea_ulpi_fsm_RegWrite : usbClockDomainArea_ulpi_fsm_stateReg_string = "usbClockDomainArea_ulpi_fsm_RegWrite";
      `usbClockDomainArea_ulpi_fsm_enumDefinition_binary_sequential_usbClockDomainArea_ulpi_fsm_UsbRx : usbClockDomainArea_ulpi_fsm_stateReg_string = "usbClockDomainArea_ulpi_fsm_UsbRx   ";
      `usbClockDomainArea_ulpi_fsm_enumDefinition_binary_sequential_usbClockDomainArea_ulpi_fsm_UsbTx : usbClockDomainArea_ulpi_fsm_stateReg_string = "usbClockDomainArea_ulpi_fsm_UsbTx   ";
      default : usbClockDomainArea_ulpi_fsm_stateReg_string = "????????????????????????????????????";
    endcase
  end
  always @(*) begin
    case(usbClockDomainArea_ulpi_fsm_stateNext)
      `usbClockDomainArea_ulpi_fsm_enumDefinition_binary_sequential_usbClockDomainArea_ulpi_fsm_BOOT : usbClockDomainArea_ulpi_fsm_stateNext_string = "usbClockDomainArea_ulpi_fsm_BOOT    ";
      `usbClockDomainArea_ulpi_fsm_enumDefinition_binary_sequential_usbClockDomainArea_ulpi_fsm_Idle : usbClockDomainArea_ulpi_fsm_stateNext_string = "usbClockDomainArea_ulpi_fsm_Idle    ";
      `usbClockDomainArea_ulpi_fsm_enumDefinition_binary_sequential_usbClockDomainArea_ulpi_fsm_RegRead : usbClockDomainArea_ulpi_fsm_stateNext_string = "usbClockDomainArea_ulpi_fsm_RegRead ";
      `usbClockDomainArea_ulpi_fsm_enumDefinition_binary_sequential_usbClockDomainArea_ulpi_fsm_RegWrite : usbClockDomainArea_ulpi_fsm_stateNext_string = "usbClockDomainArea_ulpi_fsm_RegWrite";
      `usbClockDomainArea_ulpi_fsm_enumDefinition_binary_sequential_usbClockDomainArea_ulpi_fsm_UsbRx : usbClockDomainArea_ulpi_fsm_stateNext_string = "usbClockDomainArea_ulpi_fsm_UsbRx   ";
      `usbClockDomainArea_ulpi_fsm_enumDefinition_binary_sequential_usbClockDomainArea_ulpi_fsm_UsbTx : usbClockDomainArea_ulpi_fsm_stateNext_string = "usbClockDomainArea_ulpi_fsm_UsbTx   ";
      default : usbClockDomainArea_ulpi_fsm_stateNext_string = "????????????????????????????????????";
    endcase
  end
  `endif

  assign io_usb_reset_n_o = cpuClockDomainArea_status[3];
  assign io_usb_stp_o = cpuClockDomainArea_status[4];
  assign io_usb_cs_o = cpuClockDomainArea_status[5];
  assign io_usb_dat_o = 8'h0;
  assign when_TUSB1210_l109 = (io_cpu_we_i == 1'b1);
  always @(*) begin
    case(io_cpu_adr_i)
      1'b0 : begin
        io_cpu_dat_o = cpuClockDomainArea_rcv;
      end
      default : begin
        io_cpu_dat_o = cpuClockDomainArea_status;
      end
    endcase
  end

  assign rcv_wire = usbClockDomainArea_rcv_cc;
  assign usb_dir = io_usb_dir_i;
  assign usb_fault_n = io_usb_fault_n_i;
  assign usb_nxt = io_usb_nxt_i;
  assign usbClockDomainArea_ulpi_fsm_wantExit = 1'b0;
  always @(*) begin
    usbClockDomainArea_ulpi_fsm_wantStart = 1'b0;
    case(usbClockDomainArea_ulpi_fsm_stateReg)
      `usbClockDomainArea_ulpi_fsm_enumDefinition_binary_sequential_usbClockDomainArea_ulpi_fsm_Idle : begin
      end
      `usbClockDomainArea_ulpi_fsm_enumDefinition_binary_sequential_usbClockDomainArea_ulpi_fsm_RegRead : begin
      end
      `usbClockDomainArea_ulpi_fsm_enumDefinition_binary_sequential_usbClockDomainArea_ulpi_fsm_RegWrite : begin
      end
      `usbClockDomainArea_ulpi_fsm_enumDefinition_binary_sequential_usbClockDomainArea_ulpi_fsm_UsbRx : begin
      end
      `usbClockDomainArea_ulpi_fsm_enumDefinition_binary_sequential_usbClockDomainArea_ulpi_fsm_UsbTx : begin
      end
      default : begin
        usbClockDomainArea_ulpi_fsm_wantStart = 1'b1;
      end
    endcase
  end

  assign usbClockDomainArea_ulpi_fsm_wantKill = 1'b0;
  always @(*) begin
    _zz_1 = 1'b0;
    case(_zz_3)
      `StateMachineEnum_binary_sequential_e1 : begin
      end
      `StateMachineEnum_binary_sequential_e2 : begin
      end
      `StateMachineEnum_binary_sequential_e3 : begin
      end
      `StateMachineEnum_binary_sequential_e4 : begin
        _zz_1 = 1'b1;
      end
      default : begin
      end
    endcase
  end

  always @(*) begin
    _zz_2 = 1'b0;
    if(when_StateMachine_l230) begin
      _zz_2 = 1'b1;
    end
  end

  always @(*) begin
    _zz_4 = _zz_3;
    case(_zz_3)
      `StateMachineEnum_binary_sequential_e1 : begin
        if(when_TUSB1210_l153) begin
          _zz_4 = `StateMachineEnum_binary_sequential_e2;
        end
      end
      `StateMachineEnum_binary_sequential_e2 : begin
        _zz_4 = `StateMachineEnum_binary_sequential_e3;
      end
      `StateMachineEnum_binary_sequential_e3 : begin
        _zz_4 = `StateMachineEnum_binary_sequential_e4;
      end
      `StateMachineEnum_binary_sequential_e4 : begin
        _zz_4 = `StateMachineEnum_binary_sequential_e0;
      end
      default : begin
      end
    endcase
    if(_zz_2) begin
      _zz_4 = `StateMachineEnum_binary_sequential_e1;
    end
    if(1'b0) begin
      _zz_4 = `StateMachineEnum_binary_sequential_e0;
    end
  end

  assign when_TUSB1210_l153 = (io_usb_nxt_i == 1'b1);
  always @(*) begin
    usbClockDomainArea_ulpi_fsm_stateNext = usbClockDomainArea_ulpi_fsm_stateReg;
    case(usbClockDomainArea_ulpi_fsm_stateReg)
      `usbClockDomainArea_ulpi_fsm_enumDefinition_binary_sequential_usbClockDomainArea_ulpi_fsm_Idle : begin
        usbClockDomainArea_ulpi_fsm_stateNext = `usbClockDomainArea_ulpi_fsm_enumDefinition_binary_sequential_usbClockDomainArea_ulpi_fsm_RegRead;
      end
      `usbClockDomainArea_ulpi_fsm_enumDefinition_binary_sequential_usbClockDomainArea_ulpi_fsm_RegRead : begin
        if(_zz_1) begin
          usbClockDomainArea_ulpi_fsm_stateNext = `usbClockDomainArea_ulpi_fsm_enumDefinition_binary_sequential_usbClockDomainArea_ulpi_fsm_Idle;
        end
      end
      `usbClockDomainArea_ulpi_fsm_enumDefinition_binary_sequential_usbClockDomainArea_ulpi_fsm_RegWrite : begin
      end
      `usbClockDomainArea_ulpi_fsm_enumDefinition_binary_sequential_usbClockDomainArea_ulpi_fsm_UsbRx : begin
      end
      `usbClockDomainArea_ulpi_fsm_enumDefinition_binary_sequential_usbClockDomainArea_ulpi_fsm_UsbTx : begin
      end
      default : begin
      end
    endcase
    if(usbClockDomainArea_ulpi_fsm_wantStart) begin
      usbClockDomainArea_ulpi_fsm_stateNext = `usbClockDomainArea_ulpi_fsm_enumDefinition_binary_sequential_usbClockDomainArea_ulpi_fsm_Idle;
    end
    if(usbClockDomainArea_ulpi_fsm_wantKill) begin
      usbClockDomainArea_ulpi_fsm_stateNext = `usbClockDomainArea_ulpi_fsm_enumDefinition_binary_sequential_usbClockDomainArea_ulpi_fsm_BOOT;
    end
  end

  assign when_StateMachine_l230 = ((! (usbClockDomainArea_ulpi_fsm_stateReg == `usbClockDomainArea_ulpi_fsm_enumDefinition_binary_sequential_usbClockDomainArea_ulpi_fsm_RegRead)) && (usbClockDomainArea_ulpi_fsm_stateNext == `usbClockDomainArea_ulpi_fsm_enumDefinition_binary_sequential_usbClockDomainArea_ulpi_fsm_RegRead));
  always @(posedge io_clk or posedge io_reset) begin
    if(io_reset) begin
      cpuClockDomainArea_send <= 8'h0;
      cpuClockDomainArea_rcv <= 8'h0;
      cpuClockDomainArea_status <= 8'h0;
    end else begin
      cpuClockDomainArea_rcv <= rcv_wire;
      cpuClockDomainArea_status[0] <= usb_dir;
      cpuClockDomainArea_status[1] <= usb_fault_n;
      cpuClockDomainArea_status[2] <= usb_nxt;
      cpuClockDomainArea_status[5 : 3] <= cpuClockDomainArea_status[5 : 3];
      cpuClockDomainArea_status[7 : 6] <= 2'b00;
      if(when_TUSB1210_l109) begin
        case(io_cpu_adr_i)
          1'b0 : begin
            cpuClockDomainArea_send <= io_cpu_dat_i;
          end
          default : begin
            cpuClockDomainArea_status[5 : 3] <= io_cpu_dat_i[5 : 3];
          end
        endcase
      end
    end
  end

  always @(posedge io_usb_clk_i or posedge io_reset) begin
    if(io_reset) begin
      usbClockDomainArea_rcv_cc <= 8'h0;
      _zz_3 <= `StateMachineEnum_binary_sequential_e0;
      usbClockDomainArea_ulpi_fsm_stateReg <= `usbClockDomainArea_ulpi_fsm_enumDefinition_binary_sequential_usbClockDomainArea_ulpi_fsm_BOOT;
    end else begin
      usbClockDomainArea_rcv_cc <= usbClockDomainArea_rcv_cc;
      _zz_3 <= _zz_4;
      case(_zz_3)
        `StateMachineEnum_binary_sequential_e1 : begin
        end
        `StateMachineEnum_binary_sequential_e2 : begin
        end
        `StateMachineEnum_binary_sequential_e3 : begin
          usbClockDomainArea_rcv_cc <= io_usb_dat_i;
        end
        `StateMachineEnum_binary_sequential_e4 : begin
        end
        default : begin
        end
      endcase
      usbClockDomainArea_ulpi_fsm_stateReg <= usbClockDomainArea_ulpi_fsm_stateNext;
    end
  end


endmodule
