// Generator : SpinalHDL v1.5.0    git head : 83a031922866b078c411ec5529e00f1b6e79f8e7
// Component : WishboneTUSB1210
// Git hash  : 9acc0cb8fc4bae6526fdad70e8599d3e42f280b5


`define StateMachineEnum_binary_sequential_type [2:0]
`define StateMachineEnum_binary_sequential_e0 3'b000
`define StateMachineEnum_binary_sequential_e1 3'b001
`define StateMachineEnum_binary_sequential_e2 3'b010
`define StateMachineEnum_binary_sequential_e3 3'b011
`define StateMachineEnum_binary_sequential_e4 3'b100

`define ulpi_fsm_enumDefinition_binary_sequential_type [1:0]
`define ulpi_fsm_enumDefinition_binary_sequential_ulpi_fsm_BOOT 2'b00
`define ulpi_fsm_enumDefinition_binary_sequential_ulpi_fsm_Idle 2'b01
`define ulpi_fsm_enumDefinition_binary_sequential_ulpi_fsm_RegRead 2'b10


module WishboneTUSB1210 (
  input               clk,
  input               reset,
  input               i_wb_stb,
  input               i_wb_cyc,
  input               i_wb_we,
  output              o_wb_ack,
  input      [1:0]    i_wb_adr,
  input      [7:0]    i_wb_dat,
  output     [7:0]    o_wb_dat,
  input               i_usb_clk,
  input      [7:0]    i_ulpi_dat,
  output     [7:0]    o_ulpi_dat,
  input               i_ulpi_dir,
  input               i_usb_fault_n,
  input               i_ulpi_nxt,
  output              o_ulpi_reset_n,
  output              o_ulpi_stp,
  output              o_ulpi_cs
);
  reg                 cpuClockDomainArea_tusb1210_io_i_cpu_we;
  wire       [7:0]    cpuClockDomainArea_tusb1210_io_o_cpu_dat;
  wire       [7:0]    cpuClockDomainArea_tusb1210_io_o_ulpi_dat;
  wire                cpuClockDomainArea_tusb1210_io_o_ulpi_reset_n;
  wire                cpuClockDomainArea_tusb1210_io_o_ulpi_stp;
  wire                cpuClockDomainArea_tusb1210_io_o_ulpi_cs;
  reg                 cpuClockDomainArea_ack;
  wire                when_WishboneTUSB1210_l67;
  wire                when_WishboneTUSB1210_l101;

  TUSB1210 cpuClockDomainArea_tusb1210 (
    .io_clk               (clk                                            ), //i
    .io_reset             (reset                                          ), //i
    .io_i_cpu_we          (cpuClockDomainArea_tusb1210_io_i_cpu_we        ), //i
    .io_i_cpu_adr         (i_wb_adr                                       ), //i
    .io_i_cpu_dat         (i_wb_dat                                       ), //i
    .io_o_cpu_dat         (cpuClockDomainArea_tusb1210_io_o_cpu_dat       ), //o
    .io_i_usb_clk         (i_usb_clk                                      ), //i
    .io_i_ulpi_dat        (i_ulpi_dat                                     ), //i
    .io_o_ulpi_dat        (cpuClockDomainArea_tusb1210_io_o_ulpi_dat      ), //o
    .io_i_ulpi_dir        (i_ulpi_dir                                     ), //i
    .io_i_usb_fault_n     (i_usb_fault_n                                  ), //i
    .io_i_ulpi_nxt        (i_ulpi_nxt                                     ), //i
    .io_o_ulpi_reset_n    (cpuClockDomainArea_tusb1210_io_o_ulpi_reset_n  ), //o
    .io_o_ulpi_stp        (cpuClockDomainArea_tusb1210_io_o_ulpi_stp      ), //o
    .io_o_ulpi_cs         (cpuClockDomainArea_tusb1210_io_o_ulpi_cs       )  //o
  );
  assign o_wb_ack = cpuClockDomainArea_ack;
  assign when_WishboneTUSB1210_l67 = (cpuClockDomainArea_ack == 1'b1);
  always @(*) begin
    cpuClockDomainArea_tusb1210_io_i_cpu_we = 1'b0;
    if(when_WishboneTUSB1210_l101) begin
      cpuClockDomainArea_tusb1210_io_i_cpu_we = i_wb_we;
    end
  end

  assign o_wb_dat = cpuClockDomainArea_tusb1210_io_o_cpu_dat;
  assign o_ulpi_dat = cpuClockDomainArea_tusb1210_io_o_ulpi_dat;
  assign o_ulpi_reset_n = cpuClockDomainArea_tusb1210_io_o_ulpi_reset_n;
  assign o_ulpi_stp = cpuClockDomainArea_tusb1210_io_o_ulpi_stp;
  assign o_ulpi_cs = cpuClockDomainArea_tusb1210_io_o_ulpi_cs;
  assign when_WishboneTUSB1210_l101 = (((i_wb_stb == 1'b1) && (i_wb_cyc == 1'b1)) && (cpuClockDomainArea_ack == 1'b0));
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
  input               io_i_cpu_we,
  input      [1:0]    io_i_cpu_adr,
  input      [7:0]    io_i_cpu_dat,
  output reg [7:0]    io_o_cpu_dat,
  input               io_i_usb_clk,
  input      [7:0]    io_i_ulpi_dat,
  output     [7:0]    io_o_ulpi_dat,
  input               io_i_ulpi_dir,
  input               io_i_usb_fault_n,
  input               io_i_ulpi_nxt,
  output              io_o_ulpi_reset_n,
  output              io_o_ulpi_stp,
  output              io_o_ulpi_cs
);
  wire                usbClockDomainArea_ulpi_ctrl_io_i_usb_fault_n;
  wire                usbClockDomainArea_ulpi_ctrl_io_o_write_payload_ack;
  wire       [7:0]    usbClockDomainArea_ulpi_ctrl_io_o_read_payload;
  wire                usbClockDomainArea_ulpi_ctrl_io_o_read_payload_valid;
  wire       [7:0]    usbClockDomainArea_ulpi_ctrl_io_o_ulpi_dat;
  wire                usbClockDomainArea_ulpi_ctrl_io_o_ulpi_stp;
  wire       [7:0]    usbClockDomainArea_ulpi_ctrl_io_o_error;
  wire       [7:0]    read_payload_wire;
  wire                read_payload_valid_wire;
  wire       [7:0]    write_payload_wire;
  wire                write_payload_we_wire;
  wire                write_payload_ack_wire;
  wire       [7:0]    ulpi_error_wire;
  (* async_reg = "true" *) reg        [7:0]    cpuClockDomainArea_read_payload_cc_1;
  reg        [7:0]    cpuClockDomainArea_read_payload_cc_2;
  (* async_reg = "true" *) reg                 cpuClockDomainArea_read_payload_valid_cc_1;
  reg                 cpuClockDomainArea_read_payload_valid_cc_2;
  reg        [7:0]    cpuClockDomainArea_write_payload;
  reg                 cpuClockDomainArea_write_payload_we;
  (* async_reg = "true" *) reg                 cpuClockDomainArea_write_payload_ack_cc_1;
  reg                 cpuClockDomainArea_write_payload_ack_cc_2;
  (* async_reg = "true" *) reg        [7:0]    cpuClockDomainArea_ulpi_error_cc_1;
  reg        [7:0]    cpuClockDomainArea_ulpi_error_cc_2;
  reg        [7:0]    cpuClockDomainArea_status;
  (* async_reg = "true" *) reg                 cpuClockDomainArea_ulpi_dir_cc_1;
  reg                 cpuClockDomainArea_ulpi_dir_cc_2;
  (* async_reg = "true" *) reg                 cpuClockDomainArea_usb_fault_n_cc_1;
  reg                 cpuClockDomainArea_usb_fault_n_cc_2;
  (* async_reg = "true" *) reg                 cpuClockDomainArea_ulpi_nxt_cc_1;
  reg                 cpuClockDomainArea_ulpi_nxt_cc_2;
  wire                when_TUSB1210_l168;
  wire                when_TUSB1210_l174;

  UlpiCtrl usbClockDomainArea_ulpi_ctrl (
    .io_i_write_payload_we      (write_payload_we_wire                                 ), //i
    .io_i_write_payload         (write_payload_wire                                    ), //i
    .io_o_write_payload_ack     (usbClockDomainArea_ulpi_ctrl_io_o_write_payload_ack   ), //o
    .io_o_read_payload          (usbClockDomainArea_ulpi_ctrl_io_o_read_payload        ), //o
    .io_o_read_payload_valid    (usbClockDomainArea_ulpi_ctrl_io_o_read_payload_valid  ), //o
    .io_i_ulpi_dat              (io_i_ulpi_dat                                         ), //i
    .io_o_ulpi_dat              (usbClockDomainArea_ulpi_ctrl_io_o_ulpi_dat            ), //o
    .io_i_ulpi_dir              (io_i_ulpi_dir                                         ), //i
    .io_i_usb_fault_n           (usbClockDomainArea_ulpi_ctrl_io_i_usb_fault_n         ), //i
    .io_i_ulpi_nxt              (io_i_ulpi_nxt                                         ), //i
    .io_o_ulpi_stp              (usbClockDomainArea_ulpi_ctrl_io_o_ulpi_stp            ), //o
    .io_o_error                 (usbClockDomainArea_ulpi_ctrl_io_o_error               ), //o
    .io_i_usb_clk               (io_i_usb_clk                                          ), //i
    .io_reset                   (io_reset                                              )  //i
  );
  assign write_payload_wire = cpuClockDomainArea_write_payload;
  assign write_payload_we_wire = cpuClockDomainArea_write_payload_we;
  assign io_o_ulpi_reset_n = cpuClockDomainArea_status[3];
  assign io_o_ulpi_cs = cpuClockDomainArea_status[4];
  assign when_TUSB1210_l168 = (cpuClockDomainArea_write_payload_ack_cc_2 == 1'b1);
  assign when_TUSB1210_l174 = (io_i_cpu_we == 1'b1);
  always @(*) begin
    case(io_i_cpu_adr)
      2'b00 : begin
        io_o_cpu_dat = cpuClockDomainArea_read_payload_cc_2;
      end
      2'b01 : begin
        io_o_cpu_dat = cpuClockDomainArea_status;
      end
      2'b10 : begin
        io_o_cpu_dat = cpuClockDomainArea_ulpi_error_cc_2;
      end
      default : begin
        io_o_cpu_dat = cpuClockDomainArea_read_payload_cc_2;
      end
    endcase
  end

  assign read_payload_wire = usbClockDomainArea_ulpi_ctrl_io_o_read_payload;
  assign read_payload_valid_wire = usbClockDomainArea_ulpi_ctrl_io_o_read_payload_valid;
  assign ulpi_error_wire = usbClockDomainArea_ulpi_ctrl_io_o_error;
  assign write_payload_ack_wire = usbClockDomainArea_ulpi_ctrl_io_o_write_payload_ack;
  assign io_o_ulpi_dat = usbClockDomainArea_ulpi_ctrl_io_o_ulpi_dat;
  assign io_o_ulpi_stp = usbClockDomainArea_ulpi_ctrl_io_o_ulpi_stp;
  always @(posedge io_clk or posedge io_reset) begin
    if(io_reset) begin
      cpuClockDomainArea_read_payload_cc_1 <= 8'h0;
      cpuClockDomainArea_read_payload_cc_2 <= 8'h0;
      cpuClockDomainArea_read_payload_valid_cc_1 <= 1'b0;
      cpuClockDomainArea_read_payload_valid_cc_2 <= 1'b0;
      cpuClockDomainArea_write_payload <= 8'h0;
      cpuClockDomainArea_write_payload_we <= 1'b0;
      cpuClockDomainArea_write_payload_ack_cc_1 <= 1'b0;
      cpuClockDomainArea_write_payload_ack_cc_2 <= 1'b0;
      cpuClockDomainArea_ulpi_error_cc_1 <= 8'h0;
      cpuClockDomainArea_ulpi_error_cc_2 <= 8'h0;
      cpuClockDomainArea_status <= 8'h0;
      cpuClockDomainArea_ulpi_dir_cc_1 <= 1'b0;
      cpuClockDomainArea_ulpi_dir_cc_2 <= 1'b0;
      cpuClockDomainArea_usb_fault_n_cc_1 <= 1'b1;
      cpuClockDomainArea_usb_fault_n_cc_2 <= 1'b1;
      cpuClockDomainArea_ulpi_nxt_cc_1 <= 1'b0;
      cpuClockDomainArea_ulpi_nxt_cc_2 <= 1'b0;
    end else begin
      cpuClockDomainArea_read_payload_cc_1 <= read_payload_wire;
      cpuClockDomainArea_read_payload_cc_2 <= cpuClockDomainArea_read_payload_cc_1;
      cpuClockDomainArea_read_payload_valid_cc_1 <= read_payload_valid_wire;
      cpuClockDomainArea_read_payload_valid_cc_2 <= cpuClockDomainArea_read_payload_valid_cc_1;
      cpuClockDomainArea_write_payload <= cpuClockDomainArea_write_payload;
      cpuClockDomainArea_write_payload_we <= cpuClockDomainArea_write_payload_we;
      cpuClockDomainArea_write_payload_ack_cc_1 <= write_payload_ack_wire;
      cpuClockDomainArea_write_payload_ack_cc_2 <= cpuClockDomainArea_write_payload_ack_cc_1;
      cpuClockDomainArea_ulpi_error_cc_1 <= ulpi_error_wire;
      cpuClockDomainArea_ulpi_error_cc_2 <= cpuClockDomainArea_ulpi_error_cc_1;
      cpuClockDomainArea_ulpi_dir_cc_1 <= io_i_ulpi_dir;
      cpuClockDomainArea_ulpi_dir_cc_2 <= cpuClockDomainArea_ulpi_dir_cc_1;
      cpuClockDomainArea_usb_fault_n_cc_1 <= io_i_usb_fault_n;
      cpuClockDomainArea_usb_fault_n_cc_2 <= cpuClockDomainArea_usb_fault_n_cc_1;
      cpuClockDomainArea_ulpi_nxt_cc_1 <= io_i_ulpi_nxt;
      cpuClockDomainArea_ulpi_nxt_cc_2 <= cpuClockDomainArea_ulpi_nxt_cc_1;
      cpuClockDomainArea_status[0] <= cpuClockDomainArea_ulpi_dir_cc_2;
      cpuClockDomainArea_status[1] <= cpuClockDomainArea_usb_fault_n_cc_2;
      cpuClockDomainArea_status[2] <= cpuClockDomainArea_ulpi_nxt_cc_2;
      cpuClockDomainArea_status[4 : 3] <= cpuClockDomainArea_status[4 : 3];
      cpuClockDomainArea_status[6 : 5] <= 2'b00;
      if(when_TUSB1210_l168) begin
        cpuClockDomainArea_write_payload_we <= 1'b0;
      end
      if(when_TUSB1210_l174) begin
        case(io_i_cpu_adr)
          2'b00 : begin
            cpuClockDomainArea_write_payload <= io_i_cpu_dat;
            cpuClockDomainArea_write_payload_we <= 1'b1;
          end
          2'b01 : begin
            cpuClockDomainArea_status[4 : 3] <= io_i_cpu_dat[4 : 3];
          end
          default : begin
            cpuClockDomainArea_write_payload_we <= 1'b0;
          end
        endcase
      end
    end
  end


endmodule

module UlpiCtrl (
  input               io_i_write_payload_we,
  input      [7:0]    io_i_write_payload,
  output              io_o_write_payload_ack,
  output     [7:0]    io_o_read_payload,
  output              io_o_read_payload_valid,
  input      [7:0]    io_i_ulpi_dat,
  output reg [7:0]    io_o_ulpi_dat,
  input               io_i_ulpi_dir,
  input               io_i_usb_fault_n,
  input               io_i_ulpi_nxt,
  output              io_o_ulpi_stp,
  output     [7:0]    io_o_error,
  input               io_i_usb_clk,
  input               io_reset
);
  wire       [1:0]    CMD_CODE_SPECIAL;
  wire       [1:0]    CMD_CODE_TRANSMIT;
  wire       [1:0]    CMD_CODE_REG_WRITE;
  wire       [1:0]    CMD_CODE_REG_READ;
  reg        [7:0]    ulpi_error;
  (* async_reg = "true" *) reg        [7:0]    write_payload_cc_1;
  reg        [7:0]    write_payload_cc_2;
  (* async_reg = "true" *) reg                 write_payload_we_cc_1;
  reg                 write_payload_we_cc_2;
  reg                 write_payload_ack;
  reg        [7:0]    read_payload;
  reg                 read_payload_valid;
  wire                when_UlpiCtrl_l72;
  reg        [7:0]    o_ulpi_dat;
  wire                when_UlpiCtrl_l83;
  reg                 ulpi_stp;
  wire                ulpi_fsm_wantExit;
  reg                 ulpi_fsm_wantStart;
  wire                ulpi_fsm_wantKill;
  reg                 _zz_1;
  reg                 _zz_2;
  reg        [15:0]   _zz_when_UlpiCtrl_l113;
  reg        `StateMachineEnum_binary_sequential_type _zz_when_StateMachine_l230;
  reg        `StateMachineEnum_binary_sequential_type _zz_when_StateMachine_l230_1;
  wire                when_UlpiCtrl_l113;
  wire                when_UlpiCtrl_l119;
  wire                when_UlpiCtrl_l135;
  wire                when_UlpiCtrl_l141;
  wire                when_UlpiCtrl_l158;
  wire                when_UlpiCtrl_l166;
  wire                when_UlpiCtrl_l180;
  wire                when_StateMachine_l230;
  wire                when_StateMachine_l230_1;
  wire                when_StateMachine_l230_2;
  reg        `ulpi_fsm_enumDefinition_binary_sequential_type ulpi_fsm_stateReg;
  reg        `ulpi_fsm_enumDefinition_binary_sequential_type ulpi_fsm_stateNext;
  wire                when_UlpiCtrl_l198;
  wire                when_StateMachine_l230_3;
  `ifndef SYNTHESIS
  reg [15:0] _zz_when_StateMachine_l230_string;
  reg [15:0] _zz_when_StateMachine_l230_1_string;
  reg [127:0] ulpi_fsm_stateReg_string;
  reg [127:0] ulpi_fsm_stateNext_string;
  `endif


  `ifndef SYNTHESIS
  always @(*) begin
    case(_zz_when_StateMachine_l230)
      `StateMachineEnum_binary_sequential_e0 : _zz_when_StateMachine_l230_string = "e0";
      `StateMachineEnum_binary_sequential_e1 : _zz_when_StateMachine_l230_string = "e1";
      `StateMachineEnum_binary_sequential_e2 : _zz_when_StateMachine_l230_string = "e2";
      `StateMachineEnum_binary_sequential_e3 : _zz_when_StateMachine_l230_string = "e3";
      `StateMachineEnum_binary_sequential_e4 : _zz_when_StateMachine_l230_string = "e4";
      default : _zz_when_StateMachine_l230_string = "??";
    endcase
  end
  always @(*) begin
    case(_zz_when_StateMachine_l230_1)
      `StateMachineEnum_binary_sequential_e0 : _zz_when_StateMachine_l230_1_string = "e0";
      `StateMachineEnum_binary_sequential_e1 : _zz_when_StateMachine_l230_1_string = "e1";
      `StateMachineEnum_binary_sequential_e2 : _zz_when_StateMachine_l230_1_string = "e2";
      `StateMachineEnum_binary_sequential_e3 : _zz_when_StateMachine_l230_1_string = "e3";
      `StateMachineEnum_binary_sequential_e4 : _zz_when_StateMachine_l230_1_string = "e4";
      default : _zz_when_StateMachine_l230_1_string = "??";
    endcase
  end
  always @(*) begin
    case(ulpi_fsm_stateReg)
      `ulpi_fsm_enumDefinition_binary_sequential_ulpi_fsm_BOOT : ulpi_fsm_stateReg_string = "ulpi_fsm_BOOT   ";
      `ulpi_fsm_enumDefinition_binary_sequential_ulpi_fsm_Idle : ulpi_fsm_stateReg_string = "ulpi_fsm_Idle   ";
      `ulpi_fsm_enumDefinition_binary_sequential_ulpi_fsm_RegRead : ulpi_fsm_stateReg_string = "ulpi_fsm_RegRead";
      default : ulpi_fsm_stateReg_string = "????????????????";
    endcase
  end
  always @(*) begin
    case(ulpi_fsm_stateNext)
      `ulpi_fsm_enumDefinition_binary_sequential_ulpi_fsm_BOOT : ulpi_fsm_stateNext_string = "ulpi_fsm_BOOT   ";
      `ulpi_fsm_enumDefinition_binary_sequential_ulpi_fsm_Idle : ulpi_fsm_stateNext_string = "ulpi_fsm_Idle   ";
      `ulpi_fsm_enumDefinition_binary_sequential_ulpi_fsm_RegRead : ulpi_fsm_stateNext_string = "ulpi_fsm_RegRead";
      default : ulpi_fsm_stateNext_string = "????????????????";
    endcase
  end
  `endif

  assign CMD_CODE_SPECIAL = 2'b00;
  assign CMD_CODE_TRANSMIT = 2'b01;
  assign CMD_CODE_REG_WRITE = 2'b10;
  assign CMD_CODE_REG_READ = 2'b11;
  assign io_o_write_payload_ack = write_payload_ack;
  assign io_o_read_payload = read_payload;
  assign io_o_read_payload_valid = read_payload_valid;
  assign when_UlpiCtrl_l72 = (write_payload_ack == 1'b1);
  always @(*) begin
    io_o_ulpi_dat = o_ulpi_dat;
    case(_zz_when_StateMachine_l230)
      `StateMachineEnum_binary_sequential_e1 : begin
        io_o_ulpi_dat = write_payload_cc_2;
      end
      `StateMachineEnum_binary_sequential_e2 : begin
      end
      `StateMachineEnum_binary_sequential_e3 : begin
      end
      `StateMachineEnum_binary_sequential_e4 : begin
      end
      default : begin
      end
    endcase
  end

  assign when_UlpiCtrl_l83 = (write_payload_we_cc_2 == 1'b1);
  assign io_o_error = ulpi_error;
  assign io_o_ulpi_stp = ulpi_stp;
  assign ulpi_fsm_wantExit = 1'b0;
  always @(*) begin
    ulpi_fsm_wantStart = 1'b0;
    case(ulpi_fsm_stateReg)
      `ulpi_fsm_enumDefinition_binary_sequential_ulpi_fsm_Idle : begin
      end
      `ulpi_fsm_enumDefinition_binary_sequential_ulpi_fsm_RegRead : begin
      end
      default : begin
        ulpi_fsm_wantStart = 1'b1;
      end
    endcase
  end

  assign ulpi_fsm_wantKill = 1'b0;
  always @(*) begin
    _zz_1 = 1'b0;
    case(_zz_when_StateMachine_l230)
      `StateMachineEnum_binary_sequential_e1 : begin
        if(when_UlpiCtrl_l113) begin
          _zz_1 = 1'b1;
        end
      end
      `StateMachineEnum_binary_sequential_e2 : begin
        if(when_UlpiCtrl_l135) begin
          _zz_1 = 1'b1;
        end
      end
      `StateMachineEnum_binary_sequential_e3 : begin
        if(when_UlpiCtrl_l158) begin
          _zz_1 = 1'b1;
        end
      end
      `StateMachineEnum_binary_sequential_e4 : begin
        if(when_UlpiCtrl_l180) begin
          _zz_1 = 1'b1;
        end
      end
      default : begin
      end
    endcase
  end

  always @(*) begin
    _zz_2 = 1'b0;
    if(when_StateMachine_l230_3) begin
      _zz_2 = 1'b1;
    end
  end

  always @(*) begin
    _zz_when_StateMachine_l230_1 = _zz_when_StateMachine_l230;
    case(_zz_when_StateMachine_l230)
      `StateMachineEnum_binary_sequential_e1 : begin
        if(when_UlpiCtrl_l113) begin
          _zz_when_StateMachine_l230_1 = `StateMachineEnum_binary_sequential_e0;
        end
        if(when_UlpiCtrl_l119) begin
          _zz_when_StateMachine_l230_1 = `StateMachineEnum_binary_sequential_e2;
        end
      end
      `StateMachineEnum_binary_sequential_e2 : begin
        if(when_UlpiCtrl_l135) begin
          _zz_when_StateMachine_l230_1 = `StateMachineEnum_binary_sequential_e0;
        end
        if(when_UlpiCtrl_l141) begin
          _zz_when_StateMachine_l230_1 = `StateMachineEnum_binary_sequential_e3;
        end
      end
      `StateMachineEnum_binary_sequential_e3 : begin
        if(when_UlpiCtrl_l158) begin
          _zz_when_StateMachine_l230_1 = `StateMachineEnum_binary_sequential_e0;
        end
        if(when_UlpiCtrl_l166) begin
          _zz_when_StateMachine_l230_1 = `StateMachineEnum_binary_sequential_e4;
        end
      end
      `StateMachineEnum_binary_sequential_e4 : begin
        if(when_UlpiCtrl_l180) begin
          _zz_when_StateMachine_l230_1 = `StateMachineEnum_binary_sequential_e0;
        end
      end
      default : begin
      end
    endcase
    if(_zz_2) begin
      _zz_when_StateMachine_l230_1 = `StateMachineEnum_binary_sequential_e1;
    end
    if(1'b0) begin
      _zz_when_StateMachine_l230_1 = `StateMachineEnum_binary_sequential_e0;
    end
  end

  assign when_UlpiCtrl_l113 = (_zz_when_UlpiCtrl_l113 == 16'hffff);
  assign when_UlpiCtrl_l119 = ((io_i_ulpi_nxt == 1'b1) && (io_i_ulpi_dir == 1'b0));
  assign when_UlpiCtrl_l135 = (_zz_when_UlpiCtrl_l113 == 16'hffff);
  assign when_UlpiCtrl_l141 = (io_i_ulpi_nxt == 1'b0);
  assign when_UlpiCtrl_l158 = (_zz_when_UlpiCtrl_l113 == 16'hffff);
  assign when_UlpiCtrl_l166 = (io_i_ulpi_dir == 1'b1);
  assign when_UlpiCtrl_l180 = (io_i_ulpi_dir == 1'b0);
  assign when_StateMachine_l230 = ((! (_zz_when_StateMachine_l230 == `StateMachineEnum_binary_sequential_e1)) && (_zz_when_StateMachine_l230_1 == `StateMachineEnum_binary_sequential_e1));
  assign when_StateMachine_l230_1 = ((! (_zz_when_StateMachine_l230 == `StateMachineEnum_binary_sequential_e2)) && (_zz_when_StateMachine_l230_1 == `StateMachineEnum_binary_sequential_e2));
  assign when_StateMachine_l230_2 = ((! (_zz_when_StateMachine_l230 == `StateMachineEnum_binary_sequential_e3)) && (_zz_when_StateMachine_l230_1 == `StateMachineEnum_binary_sequential_e3));
  always @(*) begin
    ulpi_fsm_stateNext = ulpi_fsm_stateReg;
    case(ulpi_fsm_stateReg)
      `ulpi_fsm_enumDefinition_binary_sequential_ulpi_fsm_Idle : begin
        if(when_UlpiCtrl_l198) begin
          ulpi_fsm_stateNext = `ulpi_fsm_enumDefinition_binary_sequential_ulpi_fsm_RegRead;
        end
      end
      `ulpi_fsm_enumDefinition_binary_sequential_ulpi_fsm_RegRead : begin
        if(_zz_1) begin
          ulpi_fsm_stateNext = `ulpi_fsm_enumDefinition_binary_sequential_ulpi_fsm_Idle;
        end
      end
      default : begin
      end
    endcase
    if(ulpi_fsm_wantStart) begin
      ulpi_fsm_stateNext = `ulpi_fsm_enumDefinition_binary_sequential_ulpi_fsm_Idle;
    end
    if(ulpi_fsm_wantKill) begin
      ulpi_fsm_stateNext = `ulpi_fsm_enumDefinition_binary_sequential_ulpi_fsm_BOOT;
    end
  end

  assign when_UlpiCtrl_l198 = ((write_payload_cc_2[7 : 6] == CMD_CODE_REG_READ) && (io_i_ulpi_dir == 1'b0));
  assign when_StateMachine_l230_3 = ((! (ulpi_fsm_stateReg == `ulpi_fsm_enumDefinition_binary_sequential_ulpi_fsm_RegRead)) && (ulpi_fsm_stateNext == `ulpi_fsm_enumDefinition_binary_sequential_ulpi_fsm_RegRead));
  always @(posedge io_i_usb_clk or posedge io_reset) begin
    if(io_reset) begin
      ulpi_error <= 8'h0;
      write_payload_cc_1 <= 8'h0;
      write_payload_cc_2 <= 8'h0;
      write_payload_we_cc_1 <= 1'b0;
      write_payload_we_cc_2 <= 1'b0;
      write_payload_ack <= 1'b0;
      read_payload <= 8'h0;
      read_payload_valid <= 1'b0;
      o_ulpi_dat <= 8'h0;
      ulpi_stp <= 1'b0;
      _zz_when_UlpiCtrl_l113 <= 16'h0;
      _zz_when_StateMachine_l230 <= `StateMachineEnum_binary_sequential_e0;
      ulpi_fsm_stateReg <= `ulpi_fsm_enumDefinition_binary_sequential_ulpi_fsm_BOOT;
    end else begin
      write_payload_cc_1 <= io_i_write_payload;
      write_payload_we_cc_1 <= io_i_write_payload_we;
      write_payload_we_cc_2 <= write_payload_we_cc_1;
      read_payload_valid <= 1'b0;
      if(when_UlpiCtrl_l72) begin
        write_payload_ack <= 1'b0;
      end
      o_ulpi_dat <= 8'h0;
      if(when_UlpiCtrl_l83) begin
        write_payload_cc_2 <= write_payload_cc_1;
        write_payload_ack <= 1'b1;
      end
      ulpi_stp <= 1'b0;
      _zz_when_StateMachine_l230 <= _zz_when_StateMachine_l230_1;
      case(_zz_when_StateMachine_l230)
        `StateMachineEnum_binary_sequential_e1 : begin
          _zz_when_UlpiCtrl_l113 <= (_zz_when_UlpiCtrl_l113 + 16'h0001);
          if(when_UlpiCtrl_l113) begin
            ulpi_error <= 8'h01;
          end
        end
        `StateMachineEnum_binary_sequential_e2 : begin
          _zz_when_UlpiCtrl_l113 <= (_zz_when_UlpiCtrl_l113 + 16'h0001);
          if(when_UlpiCtrl_l135) begin
            ulpi_error <= 8'h02;
          end
        end
        `StateMachineEnum_binary_sequential_e3 : begin
          _zz_when_UlpiCtrl_l113 <= (_zz_when_UlpiCtrl_l113 + 16'h0001);
          if(when_UlpiCtrl_l158) begin
            ulpi_error <= 8'h03;
          end
          if(when_UlpiCtrl_l166) begin
            read_payload <= io_i_ulpi_dat;
            read_payload_valid <= 1'b1;
          end
        end
        `StateMachineEnum_binary_sequential_e4 : begin
        end
        default : begin
        end
      endcase
      if(when_StateMachine_l230) begin
        _zz_when_UlpiCtrl_l113 <= 16'h0;
      end
      if(when_StateMachine_l230_1) begin
        _zz_when_UlpiCtrl_l113 <= 16'h0;
      end
      if(when_StateMachine_l230_2) begin
        _zz_when_UlpiCtrl_l113 <= 16'h0;
      end
      ulpi_fsm_stateReg <= ulpi_fsm_stateNext;
    end
  end


endmodule
