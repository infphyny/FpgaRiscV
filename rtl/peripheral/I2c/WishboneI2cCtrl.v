// Generator : SpinalHDL v1.6.4    git head : 598c18959149eb18e5eee5b0aa3eef01ecaa41a1
// Component : WishboneI2cCtrl
// Git hash  : 6e07a0aa5a90e151ba29e6ac04a2c9a108aedb3a

`timescale 1ns/1ps

module WishboneI2cCtrl (
  input               io_bus_CYC,
  input               io_bus_STB,
  output              io_bus_ACK,
  input               io_bus_WE,
  input      [7:0]    io_bus_ADR,
  output reg [31:0]   io_bus_DAT_MISO,
  input      [31:0]   io_bus_DAT_MOSI,
  output              io_interrupt,
   inout              io_i2c_scl,
   inout              io_i2c_sda,
  input               clk,
  input               reset
);
  localparam bridge_masterLogic_fsm_enumDef_BOOT = 4'd0;
  localparam bridge_masterLogic_fsm_enumDef_IDLE = 4'd1;
  localparam bridge_masterLogic_fsm_enumDef_START1 = 4'd2;
  localparam bridge_masterLogic_fsm_enumDef_START2 = 4'd3;
  localparam bridge_masterLogic_fsm_enumDef_LOW = 4'd4;
  localparam bridge_masterLogic_fsm_enumDef_HIGH = 4'd5;
  localparam bridge_masterLogic_fsm_enumDef_RESTART = 4'd6;
  localparam bridge_masterLogic_fsm_enumDef_STOP1 = 4'd7;
  localparam bridge_masterLogic_fsm_enumDef_STOP2 = 4'd8;
  localparam bridge_masterLogic_fsm_enumDef_TBUF = 4'd9;
  localparam I2cSlaveCmdMode_NONE = 3'd0;
  localparam I2cSlaveCmdMode_START = 3'd1;
  localparam I2cSlaveCmdMode_RESTART = 3'd2;
  localparam I2cSlaveCmdMode_STOP = 3'd3;
  localparam I2cSlaveCmdMode_DROP = 3'd4;
  localparam I2cSlaveCmdMode_DRIVE = 3'd5;
  localparam I2cSlaveCmdMode_READ = 3'd6;

  reg                 i2cCtrl_io_bus_rsp_valid;
  reg                 i2cCtrl_io_bus_rsp_enable;
  reg                 i2cCtrl_io_bus_rsp_data;
  wire                i2cCtrl_io_i2c_scl_write;
  wire                i2cCtrl_io_i2c_sda_write;
  wire       [2:0]    i2cCtrl_io_bus_cmd_kind;
  wire                i2cCtrl_io_bus_cmd_data;
  wire                i2cCtrl_io_internals_inFrame;
  wire                i2cCtrl_io_internals_sdaRead;
  wire                i2cCtrl_io_internals_sclRead;
  wire       [6:0]    _zz_bridge_addressFilter_hits_0;
  wire       [6:0]    _zz_bridge_addressFilter_hits_1;
  wire       [6:0]    _zz_bridge_addressFilter_hits_2;
  wire       [6:0]    _zz_bridge_addressFilter_hits_3;
  wire       [1:0]    _zz_when_I2cCtrl_l295;
  wire       [1:0]    _zz_when_I2cCtrl_l295_1;
  wire                _zz_when_I2cCtrl_l295_2;
  wire                _zz_when_I2cCtrl_l295_3;
  wire                _zz_when_I2cCtrl_l295_4;
  wire                _zz_when_I2cCtrl_l295_5;
  wire       [0:0]    _zz_bridge_masterLogic_start;
  wire       [0:0]    _zz_bridge_masterLogic_stop;
  wire       [0:0]    _zz_bridge_masterLogic_drop;
  wire       [11:0]   _zz_bridge_masterLogic_timer_value;
  wire       [0:0]    _zz_bridge_masterLogic_timer_value_1;
  wire       [2:0]    _zz_io_bus_rsp_data;
  wire       [2:0]    _zz_bridge_rxData_value;
  wire       [0:0]    _zz_bridge_interruptCtrl_start_flag;
  wire       [0:0]    _zz_bridge_interruptCtrl_restart_flag;
  wire       [0:0]    _zz_bridge_interruptCtrl_end_flag;
  wire       [0:0]    _zz_bridge_interruptCtrl_drop_flag;
  wire       [0:0]    _zz_bridge_interruptCtrl_filterGen_flag;
  wire       [0:0]    _zz_bridge_interruptCtrl_clockGen_flag;
  wire       [0:0]    _zz_when_InOutWrapper_l48_2;
  wire       [0:0]    _zz_when_InOutWrapper_l48_1_1;
  wire       [0:0]    _zz_io_i2c_scl_1;
  wire       [0:0]    _zz_io_i2c_sda_1;
  reg                 _zz_io_i2c_sda;
  reg                 _zz_io_i2c_scl;
  wire                _zz_when_InOutWrapper_l48;
  wire                _zz_bridge_i2cBuffer_sda_read;
  wire                _zz_when_InOutWrapper_l48_1;
  wire                _zz_bridge_i2cBuffer_scl_read;
  wire                busCtrl_askWrite;
  wire                busCtrl_askRead;
  wire                busCtrl_doWrite;
  wire                busCtrl_doRead;
  reg                 _zz_io_bus_ACK;
  wire       [9:0]    busCtrl_byteAddress;
  reg                 bridge_frameReset;
  reg                 bridge_i2cBuffer_sda_write;
  wire                bridge_i2cBuffer_sda_read;
  reg                 bridge_i2cBuffer_scl_write;
  wire                bridge_i2cBuffer_scl_read;
  reg                 bridge_rxData_event;
  reg                 bridge_rxData_listen;
  reg                 bridge_rxData_valid;
  reg        [7:0]    bridge_rxData_value;
  reg                 when_I2cCtrl_l213;
  reg                 bridge_rxAck_listen;
  reg                 bridge_rxAck_valid;
  reg                 bridge_rxAck_value;
  reg                 when_I2cCtrl_l226;
  reg                 bridge_txData_valid;
  reg                 bridge_txData_repeat;
  reg                 bridge_txData_enable;
  reg        [7:0]    bridge_txData_value;
  reg                 bridge_txData_forceDisable;
  reg                 bridge_txData_disableOnDataConflict;
  reg                 bridge_txAck_valid;
  reg                 bridge_txAck_repeat;
  reg                 bridge_txAck_enable;
  reg                 bridge_txAck_value;
  reg                 bridge_txAck_forceAck;
  reg                 bridge_txAck_disableOnDataConflict;
  reg                 bridge_addressFilter_addresses_0_enable;
  reg        [9:0]    bridge_addressFilter_addresses_0_value;
  reg                 bridge_addressFilter_addresses_0_is10Bit;
  reg                 bridge_addressFilter_addresses_1_enable;
  reg        [9:0]    bridge_addressFilter_addresses_1_value;
  reg                 bridge_addressFilter_addresses_1_is10Bit;
  reg                 bridge_addressFilter_addresses_2_enable;
  reg        [9:0]    bridge_addressFilter_addresses_2_value;
  reg                 bridge_addressFilter_addresses_2_is10Bit;
  reg                 bridge_addressFilter_addresses_3_enable;
  reg        [9:0]    bridge_addressFilter_addresses_3_value;
  reg                 bridge_addressFilter_addresses_3_is10Bit;
  reg        [1:0]    bridge_addressFilter_state;
  reg        [7:0]    bridge_addressFilter_byte0;
  reg        [7:0]    bridge_addressFilter_byte1;
  wire                bridge_addressFilter_byte0Is10Bit;
  wire                bridge_addressFilter_hits_0;
  wire                bridge_addressFilter_hits_1;
  wire                bridge_addressFilter_hits_2;
  wire                bridge_addressFilter_hits_3;
  wire                when_I2cCtrl_l295;
  wire                _zz_when_I2cCtrl_l299;
  reg                 _zz_when_I2cCtrl_l299_regNext;
  wire                when_I2cCtrl_l299;
  reg                 bridge_masterLogic_start;
  reg                 when_BusSlaveFactory_l366;
  wire                when_BusSlaveFactory_l368;
  reg                 bridge_masterLogic_stop;
  reg                 when_BusSlaveFactory_l366_1;
  wire                when_BusSlaveFactory_l368_1;
  reg                 bridge_masterLogic_drop;
  reg                 when_BusSlaveFactory_l366_2;
  wire                when_BusSlaveFactory_l368_2;
  reg        [11:0]   bridge_masterLogic_timer_value;
  reg        [11:0]   bridge_masterLogic_timer_tLow;
  reg        [11:0]   bridge_masterLogic_timer_tHigh;
  reg        [11:0]   bridge_masterLogic_timer_tBuf;
  wire                bridge_masterLogic_timer_done;
  wire                bridge_masterLogic_txReady;
  wire                bridge_masterLogic_fsm_wantExit;
  reg                 bridge_masterLogic_fsm_wantStart;
  wire                bridge_masterLogic_fsm_wantKill;
  reg                 bridge_masterLogic_fsm_inFrameLate;
  wire                when_I2cCtrl_l342;
  wire                when_I2cCtrl_l342_1;
  wire                bridge_masterLogic_fsm_isBusy;
  reg        [2:0]    bridge_dataCounter;
  reg                 bridge_inAckState;
  reg                 bridge_wasntAck;
  wire                when_I2cCtrl_l481;
  wire                when_I2cCtrl_l504;
  wire                when_I2cCtrl_l524;
  wire                when_I2cCtrl_l528;
  wire                when_I2cCtrl_l532;
  wire                when_I2cCtrl_l536;
  wire                when_I2cCtrl_l546;
  wire                when_I2cCtrl_l559;
  reg                 bridge_interruptCtrl_rxDataEnable;
  reg                 bridge_interruptCtrl_rxAckEnable;
  reg                 bridge_interruptCtrl_txDataEnable;
  reg                 bridge_interruptCtrl_txAckEnable;
  reg                 bridge_interruptCtrl_interrupt;
  wire                when_I2cCtrl_l593;
  reg                 bridge_interruptCtrl_start_enable;
  reg                 bridge_interruptCtrl_start_flag;
  wire                when_I2cCtrl_l593_1;
  reg                 when_BusSlaveFactory_l335;
  wire                when_BusSlaveFactory_l337;
  wire                when_I2cCtrl_l593_2;
  reg                 bridge_interruptCtrl_restart_enable;
  reg                 bridge_interruptCtrl_restart_flag;
  wire                when_I2cCtrl_l593_3;
  reg                 when_BusSlaveFactory_l335_1;
  wire                when_BusSlaveFactory_l337_1;
  wire                when_I2cCtrl_l593_4;
  reg                 bridge_interruptCtrl_end_enable;
  reg                 bridge_interruptCtrl_end_flag;
  wire                when_I2cCtrl_l593_5;
  reg                 when_BusSlaveFactory_l335_2;
  wire                when_BusSlaveFactory_l337_2;
  wire                when_I2cCtrl_l593_6;
  reg                 bridge_interruptCtrl_drop_enable;
  reg                 bridge_interruptCtrl_drop_flag;
  wire                when_I2cCtrl_l593_7;
  reg                 when_BusSlaveFactory_l335_3;
  wire                when_BusSlaveFactory_l337_3;
  wire                _zz_when_I2cCtrl_l593;
  reg                 _zz_when_I2cCtrl_l593_regNext;
  wire                when_I2cCtrl_l593_8;
  reg                 bridge_interruptCtrl_filterGen_enable;
  reg                 bridge_interruptCtrl_filterGen_flag;
  wire                when_I2cCtrl_l593_9;
  reg                 when_BusSlaveFactory_l335_4;
  wire                when_BusSlaveFactory_l337_4;
  reg                 bridge_masterLogic_fsm_isBusy_regNext;
  wire                when_I2cCtrl_l593_10;
  reg                 bridge_interruptCtrl_clockGen_enable;
  reg                 bridge_interruptCtrl_clockGen_flag;
  wire                when_I2cCtrl_l593_11;
  reg                 when_BusSlaveFactory_l335_5;
  wire                when_BusSlaveFactory_l337_5;
  reg        [9:0]    _zz_io_config_samplingClockDivider;
  reg        [19:0]   _zz_io_config_timeout;
  reg        [5:0]    _zz_io_config_tsuData;
  reg                 bridge_i2cBuffer_scl_write_regNext;
  reg                 bridge_i2cBuffer_sda_write_regNext;
  reg        [3:0]    bridge_masterLogic_fsm_stateReg;
  reg        [3:0]    bridge_masterLogic_fsm_stateNext;
  reg                 i2cCtrl_io_internals_inFrame_regNext;
  wire                when_I2cCtrl_l345;
  wire                when_I2cCtrl_l347;
  wire                when_I2cCtrl_l360;
  wire                when_I2cCtrl_l386;
  wire                when_I2cCtrl_l390;
  wire                when_I2cCtrl_l410;
  wire                when_I2cCtrl_l421;
  wire                when_StateMachine_l238;
  wire                when_StateMachine_l238_1;
  wire                when_StateMachine_l238_2;
  wire                when_StateMachine_l238_3;
  wire                when_StateMachine_l238_4;
  wire                when_StateMachine_l238_5;
  wire                when_StateMachine_l238_6;
  wire                when_StateMachine_l238_7;
  wire                when_I2cCtrl_l333;
  wire                when_InOutWrapper_l48;
  wire                when_InOutWrapper_l48_1;
  `ifndef SYNTHESIS
  reg [55:0] bridge_masterLogic_fsm_stateReg_string;
  reg [55:0] bridge_masterLogic_fsm_stateNext_string;
  `endif


  assign _zz_bridge_addressFilter_hits_0 = (bridge_addressFilter_byte0 >>> 1);
  assign _zz_bridge_addressFilter_hits_1 = (bridge_addressFilter_byte0 >>> 1);
  assign _zz_bridge_addressFilter_hits_2 = (bridge_addressFilter_byte0 >>> 1);
  assign _zz_bridge_addressFilter_hits_3 = (bridge_addressFilter_byte0 >>> 1);
  assign _zz_bridge_masterLogic_start = 1'b1;
  assign _zz_bridge_masterLogic_stop = 1'b1;
  assign _zz_bridge_masterLogic_drop = 1'b1;
  assign _zz_bridge_masterLogic_timer_value_1 = (! bridge_masterLogic_timer_done);
  assign _zz_bridge_masterLogic_timer_value = {11'd0, _zz_bridge_masterLogic_timer_value_1};
  assign _zz_io_bus_rsp_data = (3'b111 - bridge_dataCounter);
  assign _zz_bridge_rxData_value = (3'b111 - bridge_dataCounter);
  assign _zz_bridge_interruptCtrl_start_flag = 1'b0;
  assign _zz_bridge_interruptCtrl_restart_flag = 1'b0;
  assign _zz_bridge_interruptCtrl_end_flag = 1'b0;
  assign _zz_bridge_interruptCtrl_drop_flag = 1'b0;
  assign _zz_bridge_interruptCtrl_filterGen_flag = 1'b0;
  assign _zz_bridge_interruptCtrl_clockGen_flag = 1'b0;
  assign _zz_when_InOutWrapper_l48_2 = _zz_when_InOutWrapper_l48_1;
  assign _zz_when_InOutWrapper_l48_1_1 = _zz_when_InOutWrapper_l48;
  assign _zz_io_i2c_scl_1 = 1'b0;
  assign _zz_io_i2c_sda_1 = 1'b0;
  assign _zz_when_I2cCtrl_l295 = bridge_addressFilter_byte0[2 : 1];
  assign _zz_when_I2cCtrl_l295_1 = bridge_addressFilter_addresses_2_value[9 : 8];
  assign _zz_when_I2cCtrl_l295_2 = (bridge_addressFilter_addresses_1_enable && bridge_addressFilter_addresses_1_is10Bit);
  assign _zz_when_I2cCtrl_l295_3 = (bridge_addressFilter_byte0[2 : 1] == bridge_addressFilter_addresses_1_value[9 : 8]);
  assign _zz_when_I2cCtrl_l295_4 = (bridge_addressFilter_addresses_0_enable && bridge_addressFilter_addresses_0_is10Bit);
  assign _zz_when_I2cCtrl_l295_5 = (bridge_addressFilter_byte0[2 : 1] == bridge_addressFilter_addresses_0_value[9 : 8]);
  WishboneI2cCtrl_I2cSlave i2cCtrl (
    .io_i2c_sda_write                  (i2cCtrl_io_i2c_sda_write                 ), //o
    .io_i2c_sda_read                   (bridge_i2cBuffer_sda_read                ), //i
    .io_i2c_scl_write                  (i2cCtrl_io_i2c_scl_write                 ), //o
    .io_i2c_scl_read                   (bridge_i2cBuffer_scl_read                ), //i
    .io_config_samplingClockDivider    (_zz_io_config_samplingClockDivider[9:0]  ), //i
    .io_config_timeout                 (_zz_io_config_timeout[19:0]              ), //i
    .io_config_tsuData                 (_zz_io_config_tsuData[5:0]               ), //i
    .io_bus_cmd_kind                   (i2cCtrl_io_bus_cmd_kind[2:0]             ), //o
    .io_bus_cmd_data                   (i2cCtrl_io_bus_cmd_data                  ), //o
    .io_bus_rsp_valid                  (i2cCtrl_io_bus_rsp_valid                 ), //i
    .io_bus_rsp_enable                 (i2cCtrl_io_bus_rsp_enable                ), //i
    .io_bus_rsp_data                   (i2cCtrl_io_bus_rsp_data                  ), //i
    .io_internals_inFrame              (i2cCtrl_io_internals_inFrame             ), //o
    .io_internals_sdaRead              (i2cCtrl_io_internals_sdaRead             ), //o
    .io_internals_sclRead              (i2cCtrl_io_internals_sclRead             ), //o
    .clk                               (clk                                      ), //i
    .reset                             (reset                                    )  //i
  );
  initial begin
  `ifndef SYNTHESIS
    _zz_io_config_timeout = 0;//{1{$urandom}};
    _zz_io_config_tsuData = 0;//{1{$urandom}};
  `endif
  end

  assign io_i2c_scl = _zz_io_i2c_scl ? _zz_io_i2c_scl_1[0] : 1'bz;
  assign io_i2c_sda = _zz_io_i2c_sda ? _zz_io_i2c_sda_1[0] : 1'bz;
  `ifndef SYNTHESIS
  always @(*) begin
    case(bridge_masterLogic_fsm_stateReg)
      bridge_masterLogic_fsm_enumDef_BOOT : bridge_masterLogic_fsm_stateReg_string = "BOOT   ";
      bridge_masterLogic_fsm_enumDef_IDLE : bridge_masterLogic_fsm_stateReg_string = "IDLE   ";
      bridge_masterLogic_fsm_enumDef_START1 : bridge_masterLogic_fsm_stateReg_string = "START1 ";
      bridge_masterLogic_fsm_enumDef_START2 : bridge_masterLogic_fsm_stateReg_string = "START2 ";
      bridge_masterLogic_fsm_enumDef_LOW : bridge_masterLogic_fsm_stateReg_string = "LOW    ";
      bridge_masterLogic_fsm_enumDef_HIGH : bridge_masterLogic_fsm_stateReg_string = "HIGH   ";
      bridge_masterLogic_fsm_enumDef_RESTART : bridge_masterLogic_fsm_stateReg_string = "RESTART";
      bridge_masterLogic_fsm_enumDef_STOP1 : bridge_masterLogic_fsm_stateReg_string = "STOP1  ";
      bridge_masterLogic_fsm_enumDef_STOP2 : bridge_masterLogic_fsm_stateReg_string = "STOP2  ";
      bridge_masterLogic_fsm_enumDef_TBUF : bridge_masterLogic_fsm_stateReg_string = "TBUF   ";
      default : bridge_masterLogic_fsm_stateReg_string = "???????";
    endcase
  end
  always @(*) begin
    case(bridge_masterLogic_fsm_stateNext)
      bridge_masterLogic_fsm_enumDef_BOOT : bridge_masterLogic_fsm_stateNext_string = "BOOT   ";
      bridge_masterLogic_fsm_enumDef_IDLE : bridge_masterLogic_fsm_stateNext_string = "IDLE   ";
      bridge_masterLogic_fsm_enumDef_START1 : bridge_masterLogic_fsm_stateNext_string = "START1 ";
      bridge_masterLogic_fsm_enumDef_START2 : bridge_masterLogic_fsm_stateNext_string = "START2 ";
      bridge_masterLogic_fsm_enumDef_LOW : bridge_masterLogic_fsm_stateNext_string = "LOW    ";
      bridge_masterLogic_fsm_enumDef_HIGH : bridge_masterLogic_fsm_stateNext_string = "HIGH   ";
      bridge_masterLogic_fsm_enumDef_RESTART : bridge_masterLogic_fsm_stateNext_string = "RESTART";
      bridge_masterLogic_fsm_enumDef_STOP1 : bridge_masterLogic_fsm_stateNext_string = "STOP1  ";
      bridge_masterLogic_fsm_enumDef_STOP2 : bridge_masterLogic_fsm_stateNext_string = "STOP2  ";
      bridge_masterLogic_fsm_enumDef_TBUF : bridge_masterLogic_fsm_stateNext_string = "TBUF   ";
      default : bridge_masterLogic_fsm_stateNext_string = "???????";
    endcase
  end
  `endif

  always @(*) begin
    _zz_io_i2c_sda = 1'b0;
    if(when_InOutWrapper_l48_1) begin
      _zz_io_i2c_sda = 1'b1;
    end
  end

  always @(*) begin
    _zz_io_i2c_scl = 1'b0;
    if(when_InOutWrapper_l48) begin
      _zz_io_i2c_scl = 1'b1;
    end
  end

  always @(*) begin
    io_bus_DAT_MISO = 32'h0;
    case(busCtrl_byteAddress)
      10'h008 : begin
        io_bus_DAT_MISO[8 : 8] = bridge_rxData_valid;
        io_bus_DAT_MISO[7 : 0] = bridge_rxData_value;
      end
      10'h00c : begin
        io_bus_DAT_MISO[8 : 8] = bridge_rxAck_valid;
        io_bus_DAT_MISO[0 : 0] = bridge_rxAck_value;
      end
      10'h0 : begin
        io_bus_DAT_MISO[8 : 8] = bridge_txData_valid;
        io_bus_DAT_MISO[9 : 9] = bridge_txData_enable;
      end
      10'h004 : begin
        io_bus_DAT_MISO[8 : 8] = bridge_txAck_valid;
        io_bus_DAT_MISO[9 : 9] = bridge_txAck_enable;
      end
      10'h080 : begin
        io_bus_DAT_MISO[3 : 0] = {bridge_addressFilter_hits_3,{bridge_addressFilter_hits_2,{bridge_addressFilter_hits_1,bridge_addressFilter_hits_0}}};
      end
      10'h084 : begin
        io_bus_DAT_MISO[0 : 0] = bridge_addressFilter_byte0[0];
      end
      10'h040 : begin
        io_bus_DAT_MISO[4 : 4] = bridge_masterLogic_start;
        io_bus_DAT_MISO[5 : 5] = bridge_masterLogic_stop;
        io_bus_DAT_MISO[6 : 6] = bridge_masterLogic_drop;
        io_bus_DAT_MISO[0 : 0] = bridge_masterLogic_fsm_isBusy;
      end
      10'h020 : begin
        io_bus_DAT_MISO[0 : 0] = bridge_interruptCtrl_rxDataEnable;
        io_bus_DAT_MISO[1 : 1] = bridge_interruptCtrl_rxAckEnable;
        io_bus_DAT_MISO[2 : 2] = bridge_interruptCtrl_txDataEnable;
        io_bus_DAT_MISO[3 : 3] = bridge_interruptCtrl_txAckEnable;
        io_bus_DAT_MISO[4 : 4] = bridge_interruptCtrl_start_enable;
        io_bus_DAT_MISO[5 : 5] = bridge_interruptCtrl_restart_enable;
        io_bus_DAT_MISO[6 : 6] = bridge_interruptCtrl_end_enable;
        io_bus_DAT_MISO[7 : 7] = bridge_interruptCtrl_drop_enable;
        io_bus_DAT_MISO[17 : 17] = bridge_interruptCtrl_filterGen_enable;
        io_bus_DAT_MISO[16 : 16] = bridge_interruptCtrl_clockGen_enable;
      end
      10'h024 : begin
        io_bus_DAT_MISO[4 : 4] = bridge_interruptCtrl_start_flag;
        io_bus_DAT_MISO[5 : 5] = bridge_interruptCtrl_restart_flag;
        io_bus_DAT_MISO[6 : 6] = bridge_interruptCtrl_end_flag;
        io_bus_DAT_MISO[7 : 7] = bridge_interruptCtrl_drop_flag;
        io_bus_DAT_MISO[17 : 17] = bridge_interruptCtrl_filterGen_flag;
        io_bus_DAT_MISO[16 : 16] = bridge_interruptCtrl_clockGen_flag;
      end
      default : begin
      end
    endcase
  end

  assign busCtrl_askWrite = ((io_bus_CYC && io_bus_STB) && io_bus_WE);
  assign busCtrl_askRead = ((io_bus_CYC && io_bus_STB) && (! io_bus_WE));
  assign busCtrl_doWrite = (((io_bus_CYC && io_bus_STB) && ((io_bus_CYC && io_bus_ACK) && io_bus_STB)) && io_bus_WE);
  assign busCtrl_doRead = (((io_bus_CYC && io_bus_STB) && ((io_bus_CYC && io_bus_ACK) && io_bus_STB)) && (! io_bus_WE));
  assign io_bus_ACK = (_zz_io_bus_ACK && io_bus_STB);
  assign busCtrl_byteAddress = ({2'd0,io_bus_ADR} <<< 2);
  always @(*) begin
    bridge_frameReset = 1'b0;
    case(i2cCtrl_io_bus_cmd_kind)
      I2cSlaveCmdMode_START : begin
        bridge_frameReset = 1'b1;
      end
      I2cSlaveCmdMode_RESTART : begin
        bridge_frameReset = 1'b1;
      end
      I2cSlaveCmdMode_STOP : begin
        bridge_frameReset = 1'b1;
      end
      I2cSlaveCmdMode_DROP : begin
        bridge_frameReset = 1'b1;
      end
      default : begin
      end
    endcase
  end

  always @(*) begin
    bridge_i2cBuffer_sda_write = i2cCtrl_io_i2c_sda_write;
    case(bridge_masterLogic_fsm_stateReg)
      bridge_masterLogic_fsm_enumDef_IDLE : begin
      end
      bridge_masterLogic_fsm_enumDef_START1 : begin
        bridge_i2cBuffer_sda_write = 1'b0;
      end
      bridge_masterLogic_fsm_enumDef_START2 : begin
        bridge_i2cBuffer_sda_write = 1'b0;
      end
      bridge_masterLogic_fsm_enumDef_LOW : begin
      end
      bridge_masterLogic_fsm_enumDef_HIGH : begin
      end
      bridge_masterLogic_fsm_enumDef_RESTART : begin
      end
      bridge_masterLogic_fsm_enumDef_STOP1 : begin
        bridge_i2cBuffer_sda_write = 1'b0;
      end
      bridge_masterLogic_fsm_enumDef_STOP2 : begin
        bridge_i2cBuffer_sda_write = 1'b0;
      end
      bridge_masterLogic_fsm_enumDef_TBUF : begin
      end
      default : begin
      end
    endcase
  end

  always @(*) begin
    bridge_i2cBuffer_scl_write = i2cCtrl_io_i2c_scl_write;
    case(bridge_masterLogic_fsm_stateReg)
      bridge_masterLogic_fsm_enumDef_IDLE : begin
      end
      bridge_masterLogic_fsm_enumDef_START1 : begin
      end
      bridge_masterLogic_fsm_enumDef_START2 : begin
        bridge_i2cBuffer_scl_write = 1'b0;
      end
      bridge_masterLogic_fsm_enumDef_LOW : begin
        if(bridge_masterLogic_timer_done) begin
          if(when_I2cCtrl_l386) begin
            bridge_i2cBuffer_scl_write = 1'b0;
          end else begin
            if(when_I2cCtrl_l390) begin
              bridge_i2cBuffer_scl_write = 1'b0;
            end
          end
        end else begin
          bridge_i2cBuffer_scl_write = 1'b0;
        end
      end
      bridge_masterLogic_fsm_enumDef_HIGH : begin
      end
      bridge_masterLogic_fsm_enumDef_RESTART : begin
      end
      bridge_masterLogic_fsm_enumDef_STOP1 : begin
        bridge_i2cBuffer_scl_write = 1'b0;
      end
      bridge_masterLogic_fsm_enumDef_STOP2 : begin
      end
      bridge_masterLogic_fsm_enumDef_TBUF : begin
      end
      default : begin
      end
    endcase
  end

  always @(*) begin
    when_I2cCtrl_l213 = 1'b0;
    case(busCtrl_byteAddress)
      10'h008 : begin
        if(busCtrl_doRead) begin
          when_I2cCtrl_l213 = 1'b1;
        end
      end
      default : begin
      end
    endcase
  end

  always @(*) begin
    when_I2cCtrl_l226 = 1'b0;
    case(busCtrl_byteAddress)
      10'h00c : begin
        if(busCtrl_doRead) begin
          when_I2cCtrl_l226 = 1'b1;
        end
      end
      default : begin
      end
    endcase
  end

  always @(*) begin
    bridge_txData_forceDisable = 1'b0;
    if(when_I2cCtrl_l559) begin
      bridge_txData_forceDisable = 1'b0;
    end
    case(bridge_masterLogic_fsm_stateReg)
      bridge_masterLogic_fsm_enumDef_IDLE : begin
      end
      bridge_masterLogic_fsm_enumDef_START1 : begin
      end
      bridge_masterLogic_fsm_enumDef_START2 : begin
      end
      bridge_masterLogic_fsm_enumDef_LOW : begin
        if(bridge_masterLogic_timer_done) begin
          if(when_I2cCtrl_l386) begin
            bridge_txData_forceDisable = 1'b1;
          end else begin
            if(when_I2cCtrl_l390) begin
              bridge_txData_forceDisable = 1'b1;
            end
          end
        end
      end
      bridge_masterLogic_fsm_enumDef_HIGH : begin
      end
      bridge_masterLogic_fsm_enumDef_RESTART : begin
      end
      bridge_masterLogic_fsm_enumDef_STOP1 : begin
      end
      bridge_masterLogic_fsm_enumDef_STOP2 : begin
      end
      bridge_masterLogic_fsm_enumDef_TBUF : begin
      end
      default : begin
      end
    endcase
  end

  always @(*) begin
    bridge_txAck_forceAck = 1'b0;
    if(when_I2cCtrl_l295) begin
      bridge_txAck_forceAck = 1'b1;
    end
  end

  assign bridge_addressFilter_byte0Is10Bit = (bridge_addressFilter_byte0[7 : 3] == 5'h1e);
  assign bridge_addressFilter_hits_0 = (bridge_addressFilter_addresses_0_enable && ((! bridge_addressFilter_addresses_0_is10Bit) ? ((_zz_bridge_addressFilter_hits_0 == bridge_addressFilter_addresses_0_value[6 : 0]) && (bridge_addressFilter_state != 2'b00)) : (({bridge_addressFilter_byte0[2 : 1],bridge_addressFilter_byte1} == bridge_addressFilter_addresses_0_value) && (bridge_addressFilter_state == 2'b10))));
  assign bridge_addressFilter_hits_1 = (bridge_addressFilter_addresses_1_enable && ((! bridge_addressFilter_addresses_1_is10Bit) ? ((_zz_bridge_addressFilter_hits_1 == bridge_addressFilter_addresses_1_value[6 : 0]) && (bridge_addressFilter_state != 2'b00)) : (({bridge_addressFilter_byte0[2 : 1],bridge_addressFilter_byte1} == bridge_addressFilter_addresses_1_value) && (bridge_addressFilter_state == 2'b10))));
  assign bridge_addressFilter_hits_2 = (bridge_addressFilter_addresses_2_enable && ((! bridge_addressFilter_addresses_2_is10Bit) ? ((_zz_bridge_addressFilter_hits_2 == bridge_addressFilter_addresses_2_value[6 : 0]) && (bridge_addressFilter_state != 2'b00)) : (({bridge_addressFilter_byte0[2 : 1],bridge_addressFilter_byte1} == bridge_addressFilter_addresses_2_value) && (bridge_addressFilter_state == 2'b10))));
  assign bridge_addressFilter_hits_3 = (bridge_addressFilter_addresses_3_enable && ((! bridge_addressFilter_addresses_3_is10Bit) ? ((_zz_bridge_addressFilter_hits_3 == bridge_addressFilter_addresses_3_value[6 : 0]) && (bridge_addressFilter_state != 2'b00)) : (({bridge_addressFilter_byte0[2 : 1],bridge_addressFilter_byte1} == bridge_addressFilter_addresses_3_value) && (bridge_addressFilter_state == 2'b10))));
  assign when_I2cCtrl_l295 = ((bridge_addressFilter_byte0Is10Bit && (bridge_addressFilter_state == 2'b01)) && ({((bridge_addressFilter_addresses_3_enable && bridge_addressFilter_addresses_3_is10Bit) && (bridge_addressFilter_byte0[2 : 1] == bridge_addressFilter_addresses_3_value[9 : 8])),{((bridge_addressFilter_addresses_2_enable && bridge_addressFilter_addresses_2_is10Bit) && (_zz_when_I2cCtrl_l295 == _zz_when_I2cCtrl_l295_1)),{(_zz_when_I2cCtrl_l295_2 && _zz_when_I2cCtrl_l295_3),(_zz_when_I2cCtrl_l295_4 && _zz_when_I2cCtrl_l295_5)}}} != 4'b0000));
  assign _zz_when_I2cCtrl_l299 = ({bridge_addressFilter_hits_3,{bridge_addressFilter_hits_2,{bridge_addressFilter_hits_1,bridge_addressFilter_hits_0}}} != 4'b0000);
  assign when_I2cCtrl_l299 = (_zz_when_I2cCtrl_l299 && (! _zz_when_I2cCtrl_l299_regNext));
  always @(*) begin
    when_BusSlaveFactory_l366 = 1'b0;
    case(busCtrl_byteAddress)
      10'h040 : begin
        if(busCtrl_doWrite) begin
          when_BusSlaveFactory_l366 = 1'b1;
        end
      end
      default : begin
      end
    endcase
  end

  assign when_BusSlaveFactory_l368 = io_bus_DAT_MOSI[4];
  always @(*) begin
    when_BusSlaveFactory_l366_1 = 1'b0;
    case(busCtrl_byteAddress)
      10'h040 : begin
        if(busCtrl_doWrite) begin
          when_BusSlaveFactory_l366_1 = 1'b1;
        end
      end
      default : begin
      end
    endcase
  end

  assign when_BusSlaveFactory_l368_1 = io_bus_DAT_MOSI[5];
  always @(*) begin
    when_BusSlaveFactory_l366_2 = 1'b0;
    case(busCtrl_byteAddress)
      10'h040 : begin
        if(busCtrl_doWrite) begin
          when_BusSlaveFactory_l366_2 = 1'b1;
        end
      end
      default : begin
      end
    endcase
  end

  assign when_BusSlaveFactory_l368_2 = io_bus_DAT_MOSI[6];
  assign bridge_masterLogic_timer_done = (bridge_masterLogic_timer_value == 12'h0);
  assign bridge_masterLogic_fsm_wantExit = 1'b0;
  always @(*) begin
    bridge_masterLogic_fsm_wantStart = 1'b0;
    case(bridge_masterLogic_fsm_stateReg)
      bridge_masterLogic_fsm_enumDef_IDLE : begin
      end
      bridge_masterLogic_fsm_enumDef_START1 : begin
      end
      bridge_masterLogic_fsm_enumDef_START2 : begin
      end
      bridge_masterLogic_fsm_enumDef_LOW : begin
      end
      bridge_masterLogic_fsm_enumDef_HIGH : begin
      end
      bridge_masterLogic_fsm_enumDef_RESTART : begin
      end
      bridge_masterLogic_fsm_enumDef_STOP1 : begin
      end
      bridge_masterLogic_fsm_enumDef_STOP2 : begin
      end
      bridge_masterLogic_fsm_enumDef_TBUF : begin
      end
      default : begin
        bridge_masterLogic_fsm_wantStart = 1'b1;
      end
    endcase
  end

  assign bridge_masterLogic_fsm_wantKill = 1'b0;
  assign when_I2cCtrl_l342 = (! i2cCtrl_io_internals_sclRead);
  assign when_I2cCtrl_l342_1 = (! i2cCtrl_io_internals_inFrame);
  assign bridge_masterLogic_fsm_isBusy = ((! (bridge_masterLogic_fsm_stateReg == bridge_masterLogic_fsm_enumDef_IDLE)) && (! (bridge_masterLogic_fsm_stateReg == bridge_masterLogic_fsm_enumDef_TBUF)));
  assign bridge_masterLogic_txReady = (bridge_inAckState ? bridge_txAck_valid : bridge_txData_valid);
  assign when_I2cCtrl_l481 = (! bridge_inAckState);
  always @(*) begin
    if(when_I2cCtrl_l481) begin
      i2cCtrl_io_bus_rsp_valid = ((bridge_txData_valid && (! (bridge_rxData_valid && bridge_rxData_listen))) && (i2cCtrl_io_bus_cmd_kind == I2cSlaveCmdMode_DRIVE));
      if(bridge_txData_forceDisable) begin
        i2cCtrl_io_bus_rsp_valid = 1'b1;
      end
    end else begin
      i2cCtrl_io_bus_rsp_valid = ((bridge_txAck_valid && (! (bridge_rxAck_valid && bridge_rxAck_listen))) && (i2cCtrl_io_bus_cmd_kind == I2cSlaveCmdMode_DRIVE));
      if(bridge_txAck_forceAck) begin
        i2cCtrl_io_bus_rsp_valid = 1'b1;
      end
    end
    if(when_I2cCtrl_l504) begin
      i2cCtrl_io_bus_rsp_valid = (i2cCtrl_io_bus_cmd_kind == I2cSlaveCmdMode_DRIVE);
    end
  end

  always @(*) begin
    if(when_I2cCtrl_l481) begin
      i2cCtrl_io_bus_rsp_enable = bridge_txData_enable;
      if(bridge_txData_forceDisable) begin
        i2cCtrl_io_bus_rsp_enable = 1'b0;
      end
    end else begin
      i2cCtrl_io_bus_rsp_enable = bridge_txAck_enable;
      if(bridge_txAck_forceAck) begin
        i2cCtrl_io_bus_rsp_enable = 1'b1;
      end
    end
    if(when_I2cCtrl_l504) begin
      i2cCtrl_io_bus_rsp_enable = 1'b0;
    end
  end

  always @(*) begin
    if(when_I2cCtrl_l481) begin
      i2cCtrl_io_bus_rsp_data = bridge_txData_value[_zz_io_bus_rsp_data];
    end else begin
      i2cCtrl_io_bus_rsp_data = bridge_txAck_value;
      if(bridge_txAck_forceAck) begin
        i2cCtrl_io_bus_rsp_data = 1'b0;
      end
    end
  end

  assign when_I2cCtrl_l504 = (bridge_wasntAck && (! bridge_masterLogic_fsm_isBusy));
  assign when_I2cCtrl_l524 = (! bridge_inAckState);
  assign when_I2cCtrl_l528 = (i2cCtrl_io_bus_rsp_data != i2cCtrl_io_bus_cmd_data);
  assign when_I2cCtrl_l532 = (bridge_dataCounter == 3'b111);
  assign when_I2cCtrl_l536 = (bridge_txData_valid && (! bridge_txData_repeat));
  assign when_I2cCtrl_l546 = (bridge_txAck_valid && (! bridge_txAck_repeat));
  assign when_I2cCtrl_l559 = ((i2cCtrl_io_bus_cmd_kind == I2cSlaveCmdMode_STOP) || (i2cCtrl_io_bus_cmd_kind == I2cSlaveCmdMode_DROP));
  always @(*) begin
    bridge_interruptCtrl_interrupt = ((((bridge_interruptCtrl_rxDataEnable && bridge_rxData_valid) || (bridge_interruptCtrl_rxAckEnable && bridge_rxAck_valid)) || (bridge_interruptCtrl_txDataEnable && (! bridge_txData_valid))) || (bridge_interruptCtrl_txAckEnable && (! bridge_txAck_valid)));
    if(bridge_interruptCtrl_start_flag) begin
      bridge_interruptCtrl_interrupt = 1'b1;
    end
    if(bridge_interruptCtrl_restart_flag) begin
      bridge_interruptCtrl_interrupt = 1'b1;
    end
    if(bridge_interruptCtrl_end_flag) begin
      bridge_interruptCtrl_interrupt = 1'b1;
    end
    if(bridge_interruptCtrl_drop_flag) begin
      bridge_interruptCtrl_interrupt = 1'b1;
    end
    if(bridge_interruptCtrl_filterGen_flag) begin
      bridge_interruptCtrl_interrupt = 1'b1;
    end
    if(bridge_interruptCtrl_clockGen_flag) begin
      bridge_interruptCtrl_interrupt = 1'b1;
    end
  end

  assign when_I2cCtrl_l593 = (i2cCtrl_io_bus_cmd_kind == I2cSlaveCmdMode_START);
  assign when_I2cCtrl_l593_1 = (! bridge_interruptCtrl_start_enable);
  always @(*) begin
    when_BusSlaveFactory_l335 = 1'b0;
    case(busCtrl_byteAddress)
      10'h024 : begin
        if(busCtrl_doWrite) begin
          when_BusSlaveFactory_l335 = 1'b1;
        end
      end
      default : begin
      end
    endcase
  end

  assign when_BusSlaveFactory_l337 = io_bus_DAT_MOSI[4];
  assign when_I2cCtrl_l593_2 = (i2cCtrl_io_bus_cmd_kind == I2cSlaveCmdMode_RESTART);
  assign when_I2cCtrl_l593_3 = (! bridge_interruptCtrl_restart_enable);
  always @(*) begin
    when_BusSlaveFactory_l335_1 = 1'b0;
    case(busCtrl_byteAddress)
      10'h024 : begin
        if(busCtrl_doWrite) begin
          when_BusSlaveFactory_l335_1 = 1'b1;
        end
      end
      default : begin
      end
    endcase
  end

  assign when_BusSlaveFactory_l337_1 = io_bus_DAT_MOSI[5];
  assign when_I2cCtrl_l593_4 = (i2cCtrl_io_bus_cmd_kind == I2cSlaveCmdMode_STOP);
  assign when_I2cCtrl_l593_5 = (! bridge_interruptCtrl_end_enable);
  always @(*) begin
    when_BusSlaveFactory_l335_2 = 1'b0;
    case(busCtrl_byteAddress)
      10'h024 : begin
        if(busCtrl_doWrite) begin
          when_BusSlaveFactory_l335_2 = 1'b1;
        end
      end
      default : begin
      end
    endcase
  end

  assign when_BusSlaveFactory_l337_2 = io_bus_DAT_MOSI[6];
  assign when_I2cCtrl_l593_6 = (i2cCtrl_io_bus_cmd_kind == I2cSlaveCmdMode_DROP);
  assign when_I2cCtrl_l593_7 = (! bridge_interruptCtrl_drop_enable);
  always @(*) begin
    when_BusSlaveFactory_l335_3 = 1'b0;
    case(busCtrl_byteAddress)
      10'h024 : begin
        if(busCtrl_doWrite) begin
          when_BusSlaveFactory_l335_3 = 1'b1;
        end
      end
      default : begin
      end
    endcase
  end

  assign when_BusSlaveFactory_l337_3 = io_bus_DAT_MOSI[7];
  assign _zz_when_I2cCtrl_l593 = ({bridge_addressFilter_hits_3,{bridge_addressFilter_hits_2,{bridge_addressFilter_hits_1,bridge_addressFilter_hits_0}}} != 4'b0000);
  assign when_I2cCtrl_l593_8 = (_zz_when_I2cCtrl_l593 && (! _zz_when_I2cCtrl_l593_regNext));
  assign when_I2cCtrl_l593_9 = (! bridge_interruptCtrl_filterGen_enable);
  always @(*) begin
    when_BusSlaveFactory_l335_4 = 1'b0;
    case(busCtrl_byteAddress)
      10'h024 : begin
        if(busCtrl_doWrite) begin
          when_BusSlaveFactory_l335_4 = 1'b1;
        end
      end
      default : begin
      end
    endcase
  end

  assign when_BusSlaveFactory_l337_4 = io_bus_DAT_MOSI[17];
  assign when_I2cCtrl_l593_10 = (bridge_masterLogic_fsm_isBusy && (! bridge_masterLogic_fsm_isBusy_regNext));
  assign when_I2cCtrl_l593_11 = (! bridge_interruptCtrl_clockGen_enable);
  always @(*) begin
    when_BusSlaveFactory_l335_5 = 1'b0;
    case(busCtrl_byteAddress)
      10'h024 : begin
        if(busCtrl_doWrite) begin
          when_BusSlaveFactory_l335_5 = 1'b1;
        end
      end
      default : begin
      end
    endcase
  end

  assign when_BusSlaveFactory_l337_5 = io_bus_DAT_MOSI[16];
  assign _zz_when_InOutWrapper_l48_1 = bridge_i2cBuffer_scl_write_regNext;
  assign _zz_when_InOutWrapper_l48 = bridge_i2cBuffer_sda_write_regNext;
  assign bridge_i2cBuffer_scl_read = _zz_bridge_i2cBuffer_scl_read;
  assign bridge_i2cBuffer_sda_read = _zz_bridge_i2cBuffer_sda_read;
  assign io_interrupt = bridge_interruptCtrl_interrupt;
  always @(*) begin
    bridge_masterLogic_fsm_stateNext = bridge_masterLogic_fsm_stateReg;
    case(bridge_masterLogic_fsm_stateReg)
      bridge_masterLogic_fsm_enumDef_IDLE : begin
        if(when_I2cCtrl_l345) begin
          bridge_masterLogic_fsm_stateNext = bridge_masterLogic_fsm_enumDef_TBUF;
        end else begin
          if(when_I2cCtrl_l347) begin
            bridge_masterLogic_fsm_stateNext = bridge_masterLogic_fsm_enumDef_START1;
          end
        end
      end
      bridge_masterLogic_fsm_enumDef_START1 : begin
        if(when_I2cCtrl_l360) begin
          bridge_masterLogic_fsm_stateNext = bridge_masterLogic_fsm_enumDef_START2;
        end
      end
      bridge_masterLogic_fsm_enumDef_START2 : begin
        if(bridge_masterLogic_timer_done) begin
          bridge_masterLogic_fsm_stateNext = bridge_masterLogic_fsm_enumDef_LOW;
        end
      end
      bridge_masterLogic_fsm_enumDef_LOW : begin
        if(bridge_masterLogic_timer_done) begin
          if(when_I2cCtrl_l386) begin
            bridge_masterLogic_fsm_stateNext = bridge_masterLogic_fsm_enumDef_STOP1;
          end else begin
            if(when_I2cCtrl_l390) begin
              bridge_masterLogic_fsm_stateNext = bridge_masterLogic_fsm_enumDef_RESTART;
            end else begin
              if(i2cCtrl_io_internals_sclRead) begin
                bridge_masterLogic_fsm_stateNext = bridge_masterLogic_fsm_enumDef_HIGH;
              end
            end
          end
        end
      end
      bridge_masterLogic_fsm_enumDef_HIGH : begin
        if(when_I2cCtrl_l410) begin
          bridge_masterLogic_fsm_stateNext = bridge_masterLogic_fsm_enumDef_LOW;
        end
      end
      bridge_masterLogic_fsm_enumDef_RESTART : begin
        if(bridge_masterLogic_timer_done) begin
          bridge_masterLogic_fsm_stateNext = bridge_masterLogic_fsm_enumDef_START1;
        end
      end
      bridge_masterLogic_fsm_enumDef_STOP1 : begin
        if(bridge_masterLogic_timer_done) begin
          bridge_masterLogic_fsm_stateNext = bridge_masterLogic_fsm_enumDef_STOP2;
        end
      end
      bridge_masterLogic_fsm_enumDef_STOP2 : begin
        if(bridge_masterLogic_timer_done) begin
          bridge_masterLogic_fsm_stateNext = bridge_masterLogic_fsm_enumDef_TBUF;
        end
      end
      bridge_masterLogic_fsm_enumDef_TBUF : begin
        if(bridge_masterLogic_timer_done) begin
          bridge_masterLogic_fsm_stateNext = bridge_masterLogic_fsm_enumDef_IDLE;
        end
      end
      default : begin
      end
    endcase
    if(when_I2cCtrl_l333) begin
      bridge_masterLogic_fsm_stateNext = bridge_masterLogic_fsm_enumDef_TBUF;
    end
    if(bridge_masterLogic_fsm_wantStart) begin
      bridge_masterLogic_fsm_stateNext = bridge_masterLogic_fsm_enumDef_IDLE;
    end
    if(bridge_masterLogic_fsm_wantKill) begin
      bridge_masterLogic_fsm_stateNext = bridge_masterLogic_fsm_enumDef_BOOT;
    end
  end

  assign when_I2cCtrl_l345 = ((! i2cCtrl_io_internals_inFrame) && i2cCtrl_io_internals_inFrame_regNext);
  assign when_I2cCtrl_l347 = (bridge_masterLogic_start && (! bridge_masterLogic_fsm_inFrameLate));
  assign when_I2cCtrl_l360 = (bridge_masterLogic_timer_done || (! i2cCtrl_io_internals_sclRead));
  assign when_I2cCtrl_l386 = (bridge_masterLogic_stop && (! bridge_inAckState));
  assign when_I2cCtrl_l390 = (bridge_masterLogic_start && (! bridge_inAckState));
  assign when_I2cCtrl_l410 = (bridge_masterLogic_timer_done || (! i2cCtrl_io_internals_sclRead));
  assign when_I2cCtrl_l421 = (! i2cCtrl_io_internals_sclRead);
  assign when_StateMachine_l238 = ((! (bridge_masterLogic_fsm_stateReg == bridge_masterLogic_fsm_enumDef_START1)) && (bridge_masterLogic_fsm_stateNext == bridge_masterLogic_fsm_enumDef_START1));
  assign when_StateMachine_l238_1 = ((! (bridge_masterLogic_fsm_stateReg == bridge_masterLogic_fsm_enumDef_START2)) && (bridge_masterLogic_fsm_stateNext == bridge_masterLogic_fsm_enumDef_START2));
  assign when_StateMachine_l238_2 = ((! (bridge_masterLogic_fsm_stateReg == bridge_masterLogic_fsm_enumDef_LOW)) && (bridge_masterLogic_fsm_stateNext == bridge_masterLogic_fsm_enumDef_LOW));
  assign when_StateMachine_l238_3 = ((! (bridge_masterLogic_fsm_stateReg == bridge_masterLogic_fsm_enumDef_HIGH)) && (bridge_masterLogic_fsm_stateNext == bridge_masterLogic_fsm_enumDef_HIGH));
  assign when_StateMachine_l238_4 = ((! (bridge_masterLogic_fsm_stateReg == bridge_masterLogic_fsm_enumDef_RESTART)) && (bridge_masterLogic_fsm_stateNext == bridge_masterLogic_fsm_enumDef_RESTART));
  assign when_StateMachine_l238_5 = ((! (bridge_masterLogic_fsm_stateReg == bridge_masterLogic_fsm_enumDef_STOP1)) && (bridge_masterLogic_fsm_stateNext == bridge_masterLogic_fsm_enumDef_STOP1));
  assign when_StateMachine_l238_6 = ((! (bridge_masterLogic_fsm_stateReg == bridge_masterLogic_fsm_enumDef_STOP2)) && (bridge_masterLogic_fsm_stateNext == bridge_masterLogic_fsm_enumDef_STOP2));
  assign when_StateMachine_l238_7 = ((! (bridge_masterLogic_fsm_stateReg == bridge_masterLogic_fsm_enumDef_TBUF)) && (bridge_masterLogic_fsm_stateNext == bridge_masterLogic_fsm_enumDef_TBUF));
  assign when_I2cCtrl_l333 = (bridge_masterLogic_drop || ((! (bridge_masterLogic_fsm_stateReg == bridge_masterLogic_fsm_enumDef_IDLE)) && (i2cCtrl_io_bus_cmd_kind == I2cSlaveCmdMode_DROP)));
  assign _zz_bridge_i2cBuffer_scl_read = io_i2c_scl;
  assign when_InOutWrapper_l48 = (! _zz_when_InOutWrapper_l48_2[0]);
  assign _zz_bridge_i2cBuffer_sda_read = io_i2c_sda;
  assign when_InOutWrapper_l48_1 = (! _zz_when_InOutWrapper_l48_1_1[0]);
  always @(posedge clk or posedge reset) begin
    if(reset) begin
      _zz_io_bus_ACK <= 1'b0;
      bridge_rxData_event <= 1'b0;
      bridge_rxData_listen <= 1'b0;
      bridge_rxData_valid <= 1'b0;
      bridge_rxAck_listen <= 1'b0;
      bridge_rxAck_valid <= 1'b0;
      bridge_txData_valid <= 1'b1;
      bridge_txData_repeat <= 1'b1;
      bridge_txData_enable <= 1'b0;
      bridge_txAck_valid <= 1'b1;
      bridge_txAck_repeat <= 1'b1;
      bridge_txAck_enable <= 1'b0;
      bridge_addressFilter_addresses_0_enable <= 1'b0;
      bridge_addressFilter_addresses_1_enable <= 1'b0;
      bridge_addressFilter_addresses_2_enable <= 1'b0;
      bridge_addressFilter_addresses_3_enable <= 1'b0;
      bridge_addressFilter_state <= 2'b00;
      bridge_masterLogic_start <= 1'b0;
      bridge_masterLogic_stop <= 1'b0;
      bridge_masterLogic_drop <= 1'b0;
      bridge_dataCounter <= 3'b000;
      bridge_inAckState <= 1'b0;
      bridge_wasntAck <= 1'b0;
      bridge_interruptCtrl_rxDataEnable <= 1'b0;
      bridge_interruptCtrl_rxAckEnable <= 1'b0;
      bridge_interruptCtrl_txDataEnable <= 1'b0;
      bridge_interruptCtrl_txAckEnable <= 1'b0;
      bridge_interruptCtrl_start_enable <= 1'b0;
      bridge_interruptCtrl_start_flag <= 1'b0;
      bridge_interruptCtrl_restart_enable <= 1'b0;
      bridge_interruptCtrl_restart_flag <= 1'b0;
      bridge_interruptCtrl_end_enable <= 1'b0;
      bridge_interruptCtrl_end_flag <= 1'b0;
      bridge_interruptCtrl_drop_enable <= 1'b0;
      bridge_interruptCtrl_drop_flag <= 1'b0;
      bridge_interruptCtrl_filterGen_enable <= 1'b0;
      bridge_interruptCtrl_filterGen_flag <= 1'b0;
      bridge_interruptCtrl_clockGen_enable <= 1'b0;
      bridge_interruptCtrl_clockGen_flag <= 1'b0;
      _zz_io_config_samplingClockDivider <= 10'h0;
      bridge_i2cBuffer_scl_write_regNext <= 1'b1;
      bridge_i2cBuffer_sda_write_regNext <= 1'b1;
      bridge_masterLogic_fsm_stateReg <= bridge_masterLogic_fsm_enumDef_BOOT;
    end else begin
      _zz_io_bus_ACK <= (io_bus_STB && io_bus_CYC);
      bridge_rxData_event <= 1'b0;
      if(when_I2cCtrl_l213) begin
        bridge_rxData_valid <= 1'b0;
      end
      if(when_I2cCtrl_l226) begin
        bridge_rxAck_valid <= 1'b0;
      end
      if(bridge_rxData_event) begin
        case(bridge_addressFilter_state)
          2'b00 : begin
            bridge_addressFilter_state <= 2'b01;
          end
          2'b01 : begin
            bridge_addressFilter_state <= 2'b10;
          end
          default : begin
          end
        endcase
      end
      if(bridge_frameReset) begin
        bridge_addressFilter_state <= 2'b00;
      end
      if(when_I2cCtrl_l299) begin
        bridge_txAck_valid <= 1'b0;
      end
      if(when_BusSlaveFactory_l366) begin
        if(when_BusSlaveFactory_l368) begin
          bridge_masterLogic_start <= _zz_bridge_masterLogic_start[0];
        end
      end
      if(when_BusSlaveFactory_l366_1) begin
        if(when_BusSlaveFactory_l368_1) begin
          bridge_masterLogic_stop <= _zz_bridge_masterLogic_stop[0];
        end
      end
      if(when_BusSlaveFactory_l366_2) begin
        if(when_BusSlaveFactory_l368_2) begin
          bridge_masterLogic_drop <= _zz_bridge_masterLogic_drop[0];
        end
      end
      case(i2cCtrl_io_bus_cmd_kind)
        I2cSlaveCmdMode_READ : begin
          if(when_I2cCtrl_l524) begin
            bridge_dataCounter <= (bridge_dataCounter + 3'b001);
            if(when_I2cCtrl_l528) begin
              if(bridge_txData_disableOnDataConflict) begin
                bridge_txData_enable <= 1'b0;
              end
              if(bridge_txAck_disableOnDataConflict) begin
                bridge_txAck_enable <= 1'b0;
              end
            end
            if(when_I2cCtrl_l532) begin
              if(bridge_rxData_listen) begin
                bridge_rxData_valid <= 1'b1;
              end
              bridge_rxData_event <= 1'b1;
              bridge_inAckState <= 1'b1;
              if(when_I2cCtrl_l536) begin
                bridge_txData_valid <= 1'b0;
              end
            end
          end else begin
            if(bridge_rxAck_listen) begin
              bridge_rxAck_valid <= 1'b1;
            end
            bridge_inAckState <= 1'b0;
            bridge_wasntAck <= i2cCtrl_io_bus_cmd_data;
            if(when_I2cCtrl_l546) begin
              bridge_txAck_valid <= 1'b0;
            end
          end
        end
        default : begin
        end
      endcase
      if(bridge_frameReset) begin
        bridge_inAckState <= 1'b0;
        bridge_dataCounter <= 3'b000;
        bridge_wasntAck <= 1'b0;
      end
      if(when_I2cCtrl_l559) begin
        bridge_txData_valid <= 1'b1;
        bridge_txData_enable <= 1'b0;
        bridge_txData_repeat <= 1'b1;
        bridge_txAck_valid <= 1'b1;
        bridge_txAck_enable <= 1'b0;
        bridge_txAck_repeat <= 1'b1;
        bridge_rxData_listen <= 1'b0;
        bridge_rxAck_listen <= 1'b0;
      end
      if(when_I2cCtrl_l593) begin
        bridge_interruptCtrl_start_flag <= 1'b1;
      end
      if(when_I2cCtrl_l593_1) begin
        bridge_interruptCtrl_start_flag <= 1'b0;
      end
      if(when_BusSlaveFactory_l335) begin
        if(when_BusSlaveFactory_l337) begin
          bridge_interruptCtrl_start_flag <= _zz_bridge_interruptCtrl_start_flag[0];
        end
      end
      if(when_I2cCtrl_l593_2) begin
        bridge_interruptCtrl_restart_flag <= 1'b1;
      end
      if(when_I2cCtrl_l593_3) begin
        bridge_interruptCtrl_restart_flag <= 1'b0;
      end
      if(when_BusSlaveFactory_l335_1) begin
        if(when_BusSlaveFactory_l337_1) begin
          bridge_interruptCtrl_restart_flag <= _zz_bridge_interruptCtrl_restart_flag[0];
        end
      end
      if(when_I2cCtrl_l593_4) begin
        bridge_interruptCtrl_end_flag <= 1'b1;
      end
      if(when_I2cCtrl_l593_5) begin
        bridge_interruptCtrl_end_flag <= 1'b0;
      end
      if(when_BusSlaveFactory_l335_2) begin
        if(when_BusSlaveFactory_l337_2) begin
          bridge_interruptCtrl_end_flag <= _zz_bridge_interruptCtrl_end_flag[0];
        end
      end
      if(when_I2cCtrl_l593_6) begin
        bridge_interruptCtrl_drop_flag <= 1'b1;
      end
      if(when_I2cCtrl_l593_7) begin
        bridge_interruptCtrl_drop_flag <= 1'b0;
      end
      if(when_BusSlaveFactory_l335_3) begin
        if(when_BusSlaveFactory_l337_3) begin
          bridge_interruptCtrl_drop_flag <= _zz_bridge_interruptCtrl_drop_flag[0];
        end
      end
      if(when_I2cCtrl_l593_8) begin
        bridge_interruptCtrl_filterGen_flag <= 1'b1;
      end
      if(when_I2cCtrl_l593_9) begin
        bridge_interruptCtrl_filterGen_flag <= 1'b0;
      end
      if(when_BusSlaveFactory_l335_4) begin
        if(when_BusSlaveFactory_l337_4) begin
          bridge_interruptCtrl_filterGen_flag <= _zz_bridge_interruptCtrl_filterGen_flag[0];
        end
      end
      if(when_I2cCtrl_l593_10) begin
        bridge_interruptCtrl_clockGen_flag <= 1'b1;
      end
      if(when_I2cCtrl_l593_11) begin
        bridge_interruptCtrl_clockGen_flag <= 1'b0;
      end
      if(when_BusSlaveFactory_l335_5) begin
        if(when_BusSlaveFactory_l337_5) begin
          bridge_interruptCtrl_clockGen_flag <= _zz_bridge_interruptCtrl_clockGen_flag[0];
        end
      end
      bridge_i2cBuffer_scl_write_regNext <= bridge_i2cBuffer_scl_write;
      bridge_i2cBuffer_sda_write_regNext <= bridge_i2cBuffer_sda_write;
      case(busCtrl_byteAddress)
        10'h008 : begin
          if(busCtrl_doWrite) begin
            bridge_rxData_listen <= io_bus_DAT_MOSI[9];
          end
        end
        10'h00c : begin
          if(busCtrl_doWrite) begin
            bridge_rxAck_listen <= io_bus_DAT_MOSI[9];
          end
        end
        10'h0 : begin
          if(busCtrl_doWrite) begin
            bridge_txData_repeat <= io_bus_DAT_MOSI[10];
            bridge_txData_valid <= io_bus_DAT_MOSI[8];
            bridge_txData_enable <= io_bus_DAT_MOSI[9];
          end
        end
        10'h004 : begin
          if(busCtrl_doWrite) begin
            bridge_txAck_repeat <= io_bus_DAT_MOSI[10];
            bridge_txAck_valid <= io_bus_DAT_MOSI[8];
            bridge_txAck_enable <= io_bus_DAT_MOSI[9];
          end
        end
        10'h088 : begin
          if(busCtrl_doWrite) begin
            bridge_addressFilter_addresses_0_enable <= io_bus_DAT_MOSI[15];
          end
        end
        10'h08c : begin
          if(busCtrl_doWrite) begin
            bridge_addressFilter_addresses_1_enable <= io_bus_DAT_MOSI[15];
          end
        end
        10'h090 : begin
          if(busCtrl_doWrite) begin
            bridge_addressFilter_addresses_2_enable <= io_bus_DAT_MOSI[15];
          end
        end
        10'h094 : begin
          if(busCtrl_doWrite) begin
            bridge_addressFilter_addresses_3_enable <= io_bus_DAT_MOSI[15];
          end
        end
        10'h020 : begin
          if(busCtrl_doWrite) begin
            bridge_interruptCtrl_rxDataEnable <= io_bus_DAT_MOSI[0];
            bridge_interruptCtrl_rxAckEnable <= io_bus_DAT_MOSI[1];
            bridge_interruptCtrl_txDataEnable <= io_bus_DAT_MOSI[2];
            bridge_interruptCtrl_txAckEnable <= io_bus_DAT_MOSI[3];
            bridge_interruptCtrl_start_enable <= io_bus_DAT_MOSI[4];
            bridge_interruptCtrl_restart_enable <= io_bus_DAT_MOSI[5];
            bridge_interruptCtrl_end_enable <= io_bus_DAT_MOSI[6];
            bridge_interruptCtrl_drop_enable <= io_bus_DAT_MOSI[7];
            bridge_interruptCtrl_filterGen_enable <= io_bus_DAT_MOSI[17];
            bridge_interruptCtrl_clockGen_enable <= io_bus_DAT_MOSI[16];
          end
        end
        10'h028 : begin
          if(busCtrl_doWrite) begin
            _zz_io_config_samplingClockDivider <= io_bus_DAT_MOSI[9 : 0];
          end
        end
        default : begin
        end
      endcase
      bridge_masterLogic_fsm_stateReg <= bridge_masterLogic_fsm_stateNext;
      case(bridge_masterLogic_fsm_stateReg)
        bridge_masterLogic_fsm_enumDef_IDLE : begin
          if(!when_I2cCtrl_l345) begin
            if(when_I2cCtrl_l347) begin
              bridge_txData_valid <= 1'b0;
            end
          end
        end
        bridge_masterLogic_fsm_enumDef_START1 : begin
        end
        bridge_masterLogic_fsm_enumDef_START2 : begin
          if(bridge_masterLogic_timer_done) begin
            bridge_masterLogic_start <= 1'b0;
          end
        end
        bridge_masterLogic_fsm_enumDef_LOW : begin
        end
        bridge_masterLogic_fsm_enumDef_HIGH : begin
        end
        bridge_masterLogic_fsm_enumDef_RESTART : begin
        end
        bridge_masterLogic_fsm_enumDef_STOP1 : begin
        end
        bridge_masterLogic_fsm_enumDef_STOP2 : begin
          if(bridge_masterLogic_timer_done) begin
            bridge_masterLogic_stop <= 1'b0;
          end
        end
        bridge_masterLogic_fsm_enumDef_TBUF : begin
        end
        default : begin
        end
      endcase
      if(when_I2cCtrl_l333) begin
        bridge_masterLogic_start <= 1'b0;
        bridge_masterLogic_stop <= 1'b0;
        bridge_masterLogic_drop <= 1'b0;
      end
    end
  end

  always @(posedge clk) begin
    if(bridge_rxData_event) begin
      case(bridge_addressFilter_state)
        2'b00 : begin
          bridge_addressFilter_byte0 <= bridge_rxData_value;
        end
        2'b01 : begin
          bridge_addressFilter_byte1 <= bridge_rxData_value;
        end
        default : begin
        end
      endcase
    end
    _zz_when_I2cCtrl_l299_regNext <= _zz_when_I2cCtrl_l299;
    bridge_masterLogic_timer_value <= (bridge_masterLogic_timer_value - _zz_bridge_masterLogic_timer_value);
    if(when_I2cCtrl_l342) begin
      bridge_masterLogic_fsm_inFrameLate <= 1'b1;
    end
    if(when_I2cCtrl_l342_1) begin
      bridge_masterLogic_fsm_inFrameLate <= 1'b0;
    end
    case(i2cCtrl_io_bus_cmd_kind)
      I2cSlaveCmdMode_READ : begin
        if(when_I2cCtrl_l524) begin
          bridge_rxData_value[_zz_bridge_rxData_value] <= i2cCtrl_io_bus_cmd_data;
        end else begin
          bridge_rxAck_value <= i2cCtrl_io_bus_cmd_data;
        end
      end
      default : begin
      end
    endcase
    if(when_I2cCtrl_l559) begin
      bridge_txData_disableOnDataConflict <= 1'b0;
      bridge_txAck_disableOnDataConflict <= 1'b0;
    end
    _zz_when_I2cCtrl_l593_regNext <= _zz_when_I2cCtrl_l593;
    bridge_masterLogic_fsm_isBusy_regNext <= bridge_masterLogic_fsm_isBusy;
    case(busCtrl_byteAddress)
      10'h0 : begin
        if(busCtrl_doWrite) begin
          bridge_txData_value <= io_bus_DAT_MOSI[7 : 0];
          bridge_txData_disableOnDataConflict <= io_bus_DAT_MOSI[11];
        end
      end
      10'h004 : begin
        if(busCtrl_doWrite) begin
          bridge_txAck_value <= io_bus_DAT_MOSI[0];
          bridge_txAck_disableOnDataConflict <= io_bus_DAT_MOSI[11];
        end
      end
      10'h088 : begin
        if(busCtrl_doWrite) begin
          bridge_addressFilter_addresses_0_value <= io_bus_DAT_MOSI[9 : 0];
          bridge_addressFilter_addresses_0_is10Bit <= io_bus_DAT_MOSI[14];
        end
      end
      10'h08c : begin
        if(busCtrl_doWrite) begin
          bridge_addressFilter_addresses_1_value <= io_bus_DAT_MOSI[9 : 0];
          bridge_addressFilter_addresses_1_is10Bit <= io_bus_DAT_MOSI[14];
        end
      end
      10'h090 : begin
        if(busCtrl_doWrite) begin
          bridge_addressFilter_addresses_2_value <= io_bus_DAT_MOSI[9 : 0];
          bridge_addressFilter_addresses_2_is10Bit <= io_bus_DAT_MOSI[14];
        end
      end
      10'h094 : begin
        if(busCtrl_doWrite) begin
          bridge_addressFilter_addresses_3_value <= io_bus_DAT_MOSI[9 : 0];
          bridge_addressFilter_addresses_3_is10Bit <= io_bus_DAT_MOSI[14];
        end
      end
      10'h050 : begin
        if(busCtrl_doWrite) begin
          bridge_masterLogic_timer_tLow <= io_bus_DAT_MOSI[11 : 0];
        end
      end
      10'h054 : begin
        if(busCtrl_doWrite) begin
          bridge_masterLogic_timer_tHigh <= io_bus_DAT_MOSI[11 : 0];
        end
      end
      10'h058 : begin
        if(busCtrl_doWrite) begin
          bridge_masterLogic_timer_tBuf <= io_bus_DAT_MOSI[11 : 0];
        end
      end
      10'h02c : begin
        if(busCtrl_doWrite) begin
          _zz_io_config_timeout <= io_bus_DAT_MOSI[19 : 0];
        end
      end
      10'h030 : begin
        if(busCtrl_doWrite) begin
          _zz_io_config_tsuData <= io_bus_DAT_MOSI[5 : 0];
        end
      end
      default : begin
      end
    endcase
    case(bridge_masterLogic_fsm_stateReg)
      bridge_masterLogic_fsm_enumDef_IDLE : begin
      end
      bridge_masterLogic_fsm_enumDef_START1 : begin
      end
      bridge_masterLogic_fsm_enumDef_START2 : begin
      end
      bridge_masterLogic_fsm_enumDef_LOW : begin
      end
      bridge_masterLogic_fsm_enumDef_HIGH : begin
      end
      bridge_masterLogic_fsm_enumDef_RESTART : begin
        if(when_I2cCtrl_l421) begin
          bridge_masterLogic_timer_value <= bridge_masterLogic_timer_tHigh;
        end
      end
      bridge_masterLogic_fsm_enumDef_STOP1 : begin
      end
      bridge_masterLogic_fsm_enumDef_STOP2 : begin
      end
      bridge_masterLogic_fsm_enumDef_TBUF : begin
      end
      default : begin
      end
    endcase
    if(when_StateMachine_l238) begin
      bridge_masterLogic_timer_value <= bridge_masterLogic_timer_tHigh;
    end
    if(when_StateMachine_l238_1) begin
      bridge_masterLogic_timer_value <= bridge_masterLogic_timer_tLow;
    end
    if(when_StateMachine_l238_2) begin
      bridge_masterLogic_timer_value <= bridge_masterLogic_timer_tLow;
    end
    if(when_StateMachine_l238_3) begin
      bridge_masterLogic_timer_value <= bridge_masterLogic_timer_tHigh;
    end
    if(when_StateMachine_l238_4) begin
      bridge_masterLogic_timer_value <= bridge_masterLogic_timer_tHigh;
    end
    if(when_StateMachine_l238_5) begin
      bridge_masterLogic_timer_value <= bridge_masterLogic_timer_tHigh;
    end
    if(when_StateMachine_l238_6) begin
      bridge_masterLogic_timer_value <= bridge_masterLogic_timer_tHigh;
    end
    if(when_StateMachine_l238_7) begin
      bridge_masterLogic_timer_value <= bridge_masterLogic_timer_tBuf;
    end
  end

  always @(posedge clk or posedge reset) begin
    if(reset) begin
      i2cCtrl_io_internals_inFrame_regNext <= 1'b0;
    end else begin
      i2cCtrl_io_internals_inFrame_regNext <= i2cCtrl_io_internals_inFrame;
    end
  end


endmodule

module WishboneI2cCtrl_I2cSlave (
  output              io_i2c_sda_write,
  input               io_i2c_sda_read,
  output              io_i2c_scl_write,
  input               io_i2c_scl_read,
  input      [9:0]    io_config_samplingClockDivider,
  input      [19:0]   io_config_timeout,
  input      [5:0]    io_config_tsuData,
  output reg [2:0]    io_bus_cmd_kind,
  output              io_bus_cmd_data,
  input               io_bus_rsp_valid,
  input               io_bus_rsp_enable,
  input               io_bus_rsp_data,
  output              io_internals_inFrame,
  output              io_internals_sdaRead,
  output              io_internals_sclRead,
  input               clk,
  input               reset
);
  localparam I2cSlaveCmdMode_NONE = 3'd0;
  localparam I2cSlaveCmdMode_START = 3'd1;
  localparam I2cSlaveCmdMode_RESTART = 3'd2;
  localparam I2cSlaveCmdMode_STOP = 3'd3;
  localparam I2cSlaveCmdMode_DROP = 3'd4;
  localparam I2cSlaveCmdMode_DRIVE = 3'd5;
  localparam I2cSlaveCmdMode_READ = 3'd6;

  wire                io_i2c_scl_read_buffercc_io_dataOut;
  wire                io_i2c_sda_read_buffercc_io_dataOut;
  reg        [9:0]    filter_timer_counter;
  wire                filter_timer_tick;
  wire                filter_sampler_sclSync;
  wire                filter_sampler_sdaSync;
  wire                filter_sampler_sclSamples_0;
  wire                filter_sampler_sclSamples_1;
  wire                filter_sampler_sclSamples_2;
  wire                _zz_filter_sampler_sclSamples_0;
  reg                 _zz_filter_sampler_sclSamples_1;
  reg                 _zz_filter_sampler_sclSamples_2;
  wire                filter_sampler_sdaSamples_0;
  wire                filter_sampler_sdaSamples_1;
  wire                filter_sampler_sdaSamples_2;
  wire                _zz_filter_sampler_sdaSamples_0;
  reg                 _zz_filter_sampler_sdaSamples_1;
  reg                 _zz_filter_sampler_sdaSamples_2;
  reg                 filter_sda;
  reg                 filter_scl;
  wire                when_Misc_l82;
  wire                when_Misc_l85;
  wire                sclEdge_rise;
  wire                sclEdge_fall;
  wire                sclEdge_toggle;
  reg                 filter_scl_regNext;
  wire                sdaEdge_rise;
  wire                sdaEdge_fall;
  wire                sdaEdge_toggle;
  reg                 filter_sda_regNext;
  wire                detector_start;
  wire                detector_stop;
  reg        [5:0]    tsuData_counter;
  wire                tsuData_done;
  reg                 tsuData_reset;
  wire                when_I2CSlave_l189;
  reg                 ctrl_inFrame;
  reg                 ctrl_inFrameData;
  reg                 ctrl_sdaWrite;
  reg                 ctrl_sclWrite;
  wire                ctrl_rspBufferIn_valid;
  reg                 ctrl_rspBufferIn_ready;
  wire                ctrl_rspBufferIn_payload_enable;
  wire                ctrl_rspBufferIn_payload_data;
  wire                ctrl_rspBuffer_valid;
  reg                 ctrl_rspBuffer_ready;
  wire                ctrl_rspBuffer_payload_enable;
  wire                ctrl_rspBuffer_payload_data;
  reg                 ctrl_rspBufferIn_rValid;
  reg                 ctrl_rspBufferIn_rData_enable;
  reg                 ctrl_rspBufferIn_rData_data;
  wire                when_Stream_l342;
  wire                ctrl_rspAhead_valid;
  wire                ctrl_rspAhead_payload_enable;
  wire                ctrl_rspAhead_payload_data;
  wire                when_I2CSlave_l239;
  wire                when_I2CSlave_l243;
  wire                when_I2CSlave_l249;
  reg        [19:0]   timeout_counter;
  reg                 timeout_tick;
  wire                when_I2CSlave_l268;
  wire                when_I2CSlave_l274;
  `ifndef SYNTHESIS
  reg [55:0] io_bus_cmd_kind_string;
  `endif


  WishboneI2cCtrl_BufferCC io_i2c_scl_read_buffercc (
    .io_dataIn     (io_i2c_scl_read                      ), //i
    .io_dataOut    (io_i2c_scl_read_buffercc_io_dataOut  ), //o
    .clk           (clk                                  ), //i
    .reset         (reset                                )  //i
  );
  WishboneI2cCtrl_BufferCC io_i2c_sda_read_buffercc (
    .io_dataIn     (io_i2c_sda_read                      ), //i
    .io_dataOut    (io_i2c_sda_read_buffercc_io_dataOut  ), //o
    .clk           (clk                                  ), //i
    .reset         (reset                                )  //i
  );
  `ifndef SYNTHESIS
  always @(*) begin
    case(io_bus_cmd_kind)
      I2cSlaveCmdMode_NONE : io_bus_cmd_kind_string = "NONE   ";
      I2cSlaveCmdMode_START : io_bus_cmd_kind_string = "START  ";
      I2cSlaveCmdMode_RESTART : io_bus_cmd_kind_string = "RESTART";
      I2cSlaveCmdMode_STOP : io_bus_cmd_kind_string = "STOP   ";
      I2cSlaveCmdMode_DROP : io_bus_cmd_kind_string = "DROP   ";
      I2cSlaveCmdMode_DRIVE : io_bus_cmd_kind_string = "DRIVE  ";
      I2cSlaveCmdMode_READ : io_bus_cmd_kind_string = "READ   ";
      default : io_bus_cmd_kind_string = "???????";
    endcase
  end
  `endif

  assign filter_timer_tick = (filter_timer_counter == 10'h0);
  assign filter_sampler_sclSync = io_i2c_scl_read_buffercc_io_dataOut;
  assign filter_sampler_sdaSync = io_i2c_sda_read_buffercc_io_dataOut;
  assign _zz_filter_sampler_sclSamples_0 = filter_sampler_sclSync;
  assign filter_sampler_sclSamples_0 = _zz_filter_sampler_sclSamples_0;
  assign filter_sampler_sclSamples_1 = _zz_filter_sampler_sclSamples_1;
  assign filter_sampler_sclSamples_2 = _zz_filter_sampler_sclSamples_2;
  assign _zz_filter_sampler_sdaSamples_0 = filter_sampler_sdaSync;
  assign filter_sampler_sdaSamples_0 = _zz_filter_sampler_sdaSamples_0;
  assign filter_sampler_sdaSamples_1 = _zz_filter_sampler_sdaSamples_1;
  assign filter_sampler_sdaSamples_2 = _zz_filter_sampler_sdaSamples_2;
  assign when_Misc_l82 = (((filter_sampler_sdaSamples_0 != filter_sda) && (filter_sampler_sdaSamples_1 != filter_sda)) && (filter_sampler_sdaSamples_2 != filter_sda));
  assign when_Misc_l85 = (((filter_sampler_sclSamples_0 != filter_scl) && (filter_sampler_sclSamples_1 != filter_scl)) && (filter_sampler_sclSamples_2 != filter_scl));
  assign sclEdge_rise = ((! filter_scl_regNext) && filter_scl);
  assign sclEdge_fall = (filter_scl_regNext && (! filter_scl));
  assign sclEdge_toggle = (filter_scl_regNext != filter_scl);
  assign sdaEdge_rise = ((! filter_sda_regNext) && filter_sda);
  assign sdaEdge_fall = (filter_sda_regNext && (! filter_sda));
  assign sdaEdge_toggle = (filter_sda_regNext != filter_sda);
  assign detector_start = (filter_scl && sdaEdge_fall);
  assign detector_stop = (filter_scl && sdaEdge_rise);
  assign tsuData_done = (tsuData_counter == 6'h0);
  always @(*) begin
    tsuData_reset = 1'b0;
    if(ctrl_inFrameData) begin
      tsuData_reset = (! ctrl_rspAhead_valid);
    end
  end

  assign when_I2CSlave_l189 = (! tsuData_done);
  always @(*) begin
    ctrl_sdaWrite = 1'b1;
    if(ctrl_inFrameData) begin
      if(when_I2CSlave_l249) begin
        ctrl_sdaWrite = ctrl_rspAhead_payload_data;
      end
    end
  end

  always @(*) begin
    ctrl_sclWrite = 1'b1;
    if(ctrl_inFrameData) begin
      if(when_I2CSlave_l243) begin
        ctrl_sclWrite = 1'b0;
      end
    end
  end

  always @(*) begin
    ctrl_rspBufferIn_ready = ctrl_rspBuffer_ready;
    if(when_Stream_l342) begin
      ctrl_rspBufferIn_ready = 1'b1;
    end
  end

  assign when_Stream_l342 = (! ctrl_rspBuffer_valid);
  assign ctrl_rspBuffer_valid = ctrl_rspBufferIn_rValid;
  assign ctrl_rspBuffer_payload_enable = ctrl_rspBufferIn_rData_enable;
  assign ctrl_rspBuffer_payload_data = ctrl_rspBufferIn_rData_data;
  assign ctrl_rspAhead_valid = (ctrl_rspBuffer_valid ? ctrl_rspBuffer_valid : ctrl_rspBufferIn_valid);
  assign ctrl_rspAhead_payload_enable = (ctrl_rspBuffer_valid ? ctrl_rspBuffer_payload_enable : ctrl_rspBufferIn_payload_enable);
  assign ctrl_rspAhead_payload_data = (ctrl_rspBuffer_valid ? ctrl_rspBuffer_payload_data : ctrl_rspBufferIn_payload_data);
  assign ctrl_rspBufferIn_valid = io_bus_rsp_valid;
  assign ctrl_rspBufferIn_payload_enable = io_bus_rsp_enable;
  assign ctrl_rspBufferIn_payload_data = io_bus_rsp_data;
  always @(*) begin
    ctrl_rspBuffer_ready = 1'b0;
    if(ctrl_inFrame) begin
      if(sclEdge_fall) begin
        ctrl_rspBuffer_ready = 1'b1;
      end
    end
  end

  always @(*) begin
    io_bus_cmd_kind = I2cSlaveCmdMode_NONE;
    if(ctrl_inFrame) begin
      if(sclEdge_rise) begin
        io_bus_cmd_kind = I2cSlaveCmdMode_READ;
      end
    end
    if(ctrl_inFrameData) begin
      if(when_I2CSlave_l239) begin
        io_bus_cmd_kind = I2cSlaveCmdMode_DRIVE;
      end
    end
    if(detector_start) begin
      io_bus_cmd_kind = (ctrl_inFrame ? I2cSlaveCmdMode_RESTART : I2cSlaveCmdMode_START);
    end
    if(when_I2CSlave_l274) begin
      if(ctrl_inFrame) begin
        io_bus_cmd_kind = (timeout_tick ? I2cSlaveCmdMode_DROP : I2cSlaveCmdMode_STOP);
      end
    end
  end

  assign io_bus_cmd_data = filter_sda;
  assign when_I2CSlave_l239 = ((! ctrl_rspBuffer_valid) || ctrl_rspBuffer_ready);
  assign when_I2CSlave_l243 = ((! ctrl_rspAhead_valid) || (ctrl_rspAhead_payload_enable && (! tsuData_done)));
  assign when_I2CSlave_l249 = (ctrl_rspAhead_valid && ctrl_rspAhead_payload_enable);
  always @(*) begin
    timeout_tick = (timeout_counter == 20'h0);
    if(when_I2CSlave_l268) begin
      timeout_tick = 1'b0;
    end
  end

  assign when_I2CSlave_l268 = (sclEdge_toggle || (! ctrl_inFrame));
  assign when_I2CSlave_l274 = (detector_stop || timeout_tick);
  assign io_internals_inFrame = ctrl_inFrame;
  assign io_internals_sdaRead = filter_sda;
  assign io_internals_sclRead = filter_scl;
  assign io_i2c_scl_write = ctrl_sclWrite;
  assign io_i2c_sda_write = ctrl_sdaWrite;
  always @(posedge clk or posedge reset) begin
    if(reset) begin
      filter_timer_counter <= 10'h0;
      _zz_filter_sampler_sclSamples_1 <= 1'b1;
      _zz_filter_sampler_sclSamples_2 <= 1'b1;
      _zz_filter_sampler_sdaSamples_1 <= 1'b1;
      _zz_filter_sampler_sdaSamples_2 <= 1'b1;
      filter_sda <= 1'b1;
      filter_scl <= 1'b1;
      filter_scl_regNext <= 1'b1;
      filter_sda_regNext <= 1'b1;
      tsuData_counter <= 6'h0;
      ctrl_inFrame <= 1'b0;
      ctrl_inFrameData <= 1'b0;
      ctrl_rspBufferIn_rValid <= 1'b0;
      timeout_counter <= 20'h0;
    end else begin
      filter_timer_counter <= (filter_timer_counter - 10'h001);
      if(filter_timer_tick) begin
        filter_timer_counter <= io_config_samplingClockDivider;
      end
      if(filter_timer_tick) begin
        _zz_filter_sampler_sclSamples_1 <= _zz_filter_sampler_sclSamples_0;
      end
      if(filter_timer_tick) begin
        _zz_filter_sampler_sclSamples_2 <= _zz_filter_sampler_sclSamples_1;
      end
      if(filter_timer_tick) begin
        _zz_filter_sampler_sdaSamples_1 <= _zz_filter_sampler_sdaSamples_0;
      end
      if(filter_timer_tick) begin
        _zz_filter_sampler_sdaSamples_2 <= _zz_filter_sampler_sdaSamples_1;
      end
      if(filter_timer_tick) begin
        if(when_Misc_l82) begin
          filter_sda <= filter_sampler_sdaSamples_2;
        end
        if(when_Misc_l85) begin
          filter_scl <= filter_sampler_sclSamples_2;
        end
      end
      filter_scl_regNext <= filter_scl;
      filter_sda_regNext <= filter_sda;
      if(when_I2CSlave_l189) begin
        tsuData_counter <= (tsuData_counter - 6'h01);
      end
      if(tsuData_reset) begin
        tsuData_counter <= io_config_tsuData;
      end
      if(ctrl_rspBufferIn_ready) begin
        ctrl_rspBufferIn_rValid <= ctrl_rspBufferIn_valid;
      end
      if(ctrl_inFrame) begin
        if(sclEdge_fall) begin
          ctrl_inFrameData <= 1'b1;
        end
      end
      if(detector_start) begin
        ctrl_inFrame <= 1'b1;
        ctrl_inFrameData <= 1'b0;
      end
      timeout_counter <= (timeout_counter - 20'h00001);
      if(when_I2CSlave_l268) begin
        timeout_counter <= io_config_timeout;
      end
      if(when_I2CSlave_l274) begin
        ctrl_inFrame <= 1'b0;
        ctrl_inFrameData <= 1'b0;
      end
    end
  end

  always @(posedge clk) begin
    if(ctrl_rspBufferIn_ready) begin
      ctrl_rspBufferIn_rData_enable <= ctrl_rspBufferIn_payload_enable;
      ctrl_rspBufferIn_rData_data <= ctrl_rspBufferIn_payload_data;
    end
  end


endmodule

//WishboneI2cCtrl_BufferCC replaced by WishboneI2cCtrl_BufferCC

module WishboneI2cCtrl_BufferCC (
  input               io_dataIn,
  output              io_dataOut,
  input               clk,
  input               reset
);

  (* async_reg = "true" *) reg                 buffers_0;
  (* async_reg = "true" *) reg                 buffers_1;

  assign io_dataOut = buffers_1;
  always @(posedge clk or posedge reset) begin
    if(reset) begin
      buffers_0 <= 1'b1;
      buffers_1 <= 1'b1;
    end else begin
      buffers_0 <= io_dataIn;
      buffers_1 <= buffers_0;
    end
  end


endmodule
