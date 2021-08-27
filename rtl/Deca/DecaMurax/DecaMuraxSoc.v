// Generator : SpinalHDL v1.6.0    git head : 73c8d8e2b86b45646e9d0b2e729291f2b65e6be3
// Component : DecaMuraxSoc
// Git hash  : 5fc4125763a1b66758c387c0abea32e602b2e4e5


`define BranchCtrlEnum_binary_sequential_type [1:0]
`define BranchCtrlEnum_binary_sequential_INC 2'b00
`define BranchCtrlEnum_binary_sequential_B 2'b01
`define BranchCtrlEnum_binary_sequential_JAL 2'b10
`define BranchCtrlEnum_binary_sequential_JALR 2'b11

`define ShiftCtrlEnum_binary_sequential_type [1:0]
`define ShiftCtrlEnum_binary_sequential_DISABLE_1 2'b00
`define ShiftCtrlEnum_binary_sequential_SLL_1 2'b01
`define ShiftCtrlEnum_binary_sequential_SRL_1 2'b10
`define ShiftCtrlEnum_binary_sequential_SRA_1 2'b11

`define AluBitwiseCtrlEnum_binary_sequential_type [1:0]
`define AluBitwiseCtrlEnum_binary_sequential_XOR_1 2'b00
`define AluBitwiseCtrlEnum_binary_sequential_OR_1 2'b01
`define AluBitwiseCtrlEnum_binary_sequential_AND_1 2'b10

`define AluCtrlEnum_binary_sequential_type [1:0]
`define AluCtrlEnum_binary_sequential_ADD_SUB 2'b00
`define AluCtrlEnum_binary_sequential_SLT_SLTU 2'b01
`define AluCtrlEnum_binary_sequential_BITWISE 2'b10

`define EnvCtrlEnum_binary_sequential_type [0:0]
`define EnvCtrlEnum_binary_sequential_NONE 1'b0
`define EnvCtrlEnum_binary_sequential_XRET 1'b1

`define Src2CtrlEnum_binary_sequential_type [1:0]
`define Src2CtrlEnum_binary_sequential_RS 2'b00
`define Src2CtrlEnum_binary_sequential_IMI 2'b01
`define Src2CtrlEnum_binary_sequential_IMS 2'b10
`define Src2CtrlEnum_binary_sequential_PC 2'b11

`define Src1CtrlEnum_binary_sequential_type [1:0]
`define Src1CtrlEnum_binary_sequential_RS 2'b00
`define Src1CtrlEnum_binary_sequential_IMU 2'b01
`define Src1CtrlEnum_binary_sequential_PC_INCREMENT 2'b10
`define Src1CtrlEnum_binary_sequential_URS1 2'b11

`define JtagState_binary_sequential_type [3:0]
`define JtagState_binary_sequential_RESET 4'b0000
`define JtagState_binary_sequential_IDLE 4'b0001
`define JtagState_binary_sequential_IR_SELECT 4'b0010
`define JtagState_binary_sequential_IR_CAPTURE 4'b0011
`define JtagState_binary_sequential_IR_SHIFT 4'b0100
`define JtagState_binary_sequential_IR_EXIT1 4'b0101
`define JtagState_binary_sequential_IR_PAUSE 4'b0110
`define JtagState_binary_sequential_IR_EXIT2 4'b0111
`define JtagState_binary_sequential_IR_UPDATE 4'b1000
`define JtagState_binary_sequential_DR_SELECT 4'b1001
`define JtagState_binary_sequential_DR_CAPTURE 4'b1010
`define JtagState_binary_sequential_DR_SHIFT 4'b1011
`define JtagState_binary_sequential_DR_EXIT1 4'b1100
`define JtagState_binary_sequential_DR_PAUSE 4'b1101
`define JtagState_binary_sequential_DR_EXIT2 4'b1110
`define JtagState_binary_sequential_DR_UPDATE 4'b1111

`define UartStopType_binary_sequential_type [0:0]
`define UartStopType_binary_sequential_ONE 1'b0
`define UartStopType_binary_sequential_TWO 1'b1

`define UartParityType_binary_sequential_type [1:0]
`define UartParityType_binary_sequential_NONE 2'b00
`define UartParityType_binary_sequential_EVEN 2'b01
`define UartParityType_binary_sequential_ODD 2'b10

`define UartCtrlTxState_binary_sequential_type [2:0]
`define UartCtrlTxState_binary_sequential_IDLE 3'b000
`define UartCtrlTxState_binary_sequential_START 3'b001
`define UartCtrlTxState_binary_sequential_DATA 3'b010
`define UartCtrlTxState_binary_sequential_PARITY 3'b011
`define UartCtrlTxState_binary_sequential_STOP 3'b100

`define UartCtrlRxState_binary_sequential_type [2:0]
`define UartCtrlRxState_binary_sequential_IDLE 3'b000
`define UartCtrlRxState_binary_sequential_START 3'b001
`define UartCtrlRxState_binary_sequential_DATA 3'b010
`define UartCtrlRxState_binary_sequential_PARITY 3'b011
`define UartCtrlRxState_binary_sequential_STOP 3'b100

`define I2cSlaveCmdMode_binary_sequential_type [2:0]
`define I2cSlaveCmdMode_binary_sequential_NONE 3'b000
`define I2cSlaveCmdMode_binary_sequential_START 3'b001
`define I2cSlaveCmdMode_binary_sequential_RESTART 3'b010
`define I2cSlaveCmdMode_binary_sequential_STOP 3'b011
`define I2cSlaveCmdMode_binary_sequential_DROP 3'b100
`define I2cSlaveCmdMode_binary_sequential_DRIVE 3'b101
`define I2cSlaveCmdMode_binary_sequential_READ 3'b110

`define SpiMasterCtrlCmdMode_binary_sequential_type [0:0]
`define SpiMasterCtrlCmdMode_binary_sequential_DATA 1'b0
`define SpiMasterCtrlCmdMode_binary_sequential_SS 1'b1


module DecaMuraxSoc (
  input               mainClk,
  input               mainReset,
  input               jtag_tck,
  input               jtag_tdi,
  output              jtag_tdo,
  input               jtag_tms,
  output              uart_0_txd,
  input               uart_0_rxd,
  output     [0:0]    spi_0_ss,
  output              spi_0_sclk,
  output              spi_0_mosi,
  input               spi_0_miso,
  output     [7:0]    leds,
   inout              i2c_0_scl,
   inout              i2c_0_sda,
   inout     [15:0]   gpioA
);
  wire                pll_areset;
  wire                murax_io_jtag_tdo;
  wire       [15:0]   murax_io_gpioA_write;
  wire       [15:0]   murax_io_gpioA_writeEnable;
  wire                murax_io_uart_0_txd;
  wire                murax_io_i2c_0_scl_write;
  wire                murax_io_i2c_0_sda_write;
  wire                murax_io_spi_0_sclk;
  wire                murax_io_spi_0_mosi;
  wire       [0:0]    murax_io_spi_0_ss;
  wire       [7:0]    murax_io_leds;
  wire                pll_c0;
  wire                pll_locked;
  wire                bufferCC_7_io_dataOut;
  wire       [0:0]    _zz_when_InOutWrapper_l48_2;
  wire       [0:0]    _zz_when_InOutWrapper_l48_1_1;
  wire       [0:0]    _zz_i2c_0_scl_1;
  wire       [0:0]    _zz_i2c_0_sda_1;
  reg                 _zz_gpioA;
  reg                 _zz_gpioA_1;
  reg                 _zz_gpioA_2;
  reg                 _zz_gpioA_3;
  reg                 _zz_gpioA_4;
  reg                 _zz_gpioA_5;
  reg                 _zz_gpioA_6;
  reg                 _zz_gpioA_7;
  reg                 _zz_gpioA_8;
  reg                 _zz_gpioA_9;
  reg                 _zz_gpioA_10;
  reg                 _zz_gpioA_11;
  reg                 _zz_gpioA_12;
  reg                 _zz_gpioA_13;
  reg                 _zz_gpioA_14;
  reg                 _zz_gpioA_15;
  reg                 _zz_i2c_0_sda;
  reg                 _zz_i2c_0_scl;
  wire                _zz_when_InOutWrapper_l48;
  wire                _zz_io_i2c_0_sda_read;
  wire                _zz_when_InOutWrapper_l48_1;
  wire                _zz_io_i2c_0_scl_read;
  wire       [15:0]   _zz_io_gpioA_read;
  wire       [15:0]   _zz_gpioA_16;
  wire       [15:0]   _zz_when_InOutWrapper_l65;
  wire                core_clk;
  wire                core_resetn;
  wire                when_InOutWrapper_l48;
  wire                when_InOutWrapper_l48_1;
  wire                when_InOutWrapper_l65;
  wire                when_InOutWrapper_l65_1;
  wire                when_InOutWrapper_l65_2;
  wire                when_InOutWrapper_l65_3;
  wire                when_InOutWrapper_l65_4;
  wire                when_InOutWrapper_l65_5;
  wire                when_InOutWrapper_l65_6;
  wire                when_InOutWrapper_l65_7;
  wire                when_InOutWrapper_l65_8;
  wire                when_InOutWrapper_l65_9;
  wire                when_InOutWrapper_l65_10;
  wire                when_InOutWrapper_l65_11;
  wire                when_InOutWrapper_l65_12;
  wire                when_InOutWrapper_l65_13;
  wire                when_InOutWrapper_l65_14;
  wire                when_InOutWrapper_l65_15;

  assign _zz_when_InOutWrapper_l48_2 = _zz_when_InOutWrapper_l48_1;
  assign _zz_when_InOutWrapper_l48_1_1 = _zz_when_InOutWrapper_l48;
  assign _zz_i2c_0_scl_1 = 1'b0;
  assign _zz_i2c_0_sda_1 = 1'b0;
  MainDecaMuraxSoc murax (
    .io_asyncReset           (core_resetn                 ), //i
    .io_mainClk              (core_clk                    ), //i
    .io_jtag_tms             (jtag_tms                    ), //i
    .io_jtag_tdi             (jtag_tdi                    ), //i
    .io_jtag_tdo             (murax_io_jtag_tdo           ), //o
    .io_jtag_tck             (jtag_tck                    ), //i
    .io_gpioA_read           (_zz_io_gpioA_read           ), //i
    .io_gpioA_write          (murax_io_gpioA_write        ), //o
    .io_gpioA_writeEnable    (murax_io_gpioA_writeEnable  ), //o
    .io_uart_0_txd           (murax_io_uart_0_txd         ), //o
    .io_uart_0_rxd           (uart_0_rxd                  ), //i
    .io_i2c_0_sda_write      (murax_io_i2c_0_sda_write    ), //o
    .io_i2c_0_sda_read       (_zz_io_i2c_0_sda_read       ), //i
    .io_i2c_0_scl_write      (murax_io_i2c_0_scl_write    ), //o
    .io_i2c_0_scl_read       (_zz_io_i2c_0_scl_read       ), //i
    .io_spi_0_ss             (murax_io_spi_0_ss           ), //o
    .io_spi_0_sclk           (murax_io_spi_0_sclk         ), //o
    .io_spi_0_mosi           (murax_io_spi_0_mosi         ), //o
    .io_spi_0_miso           (spi_0_miso                  ), //i
    .io_leds                 (murax_io_leds               )  //o
  );
  Max10PLL pll (
    .areset    (pll_areset  ), //i
    .inclk0    (mainClk     ), //i
    .c0        (pll_c0      ), //o
    .locked    (pll_locked  )  //o
  );
  BufferCC_6 bufferCC_7 (
    .io_dataIn     (1'b1                   ), //i
    .io_dataOut    (bufferCC_7_io_dataOut  ), //o
    .core_clk      (core_clk               ), //i
    .locked        (pll_locked             )  //i
  );
  assign i2c_0_scl = _zz_i2c_0_scl ? _zz_i2c_0_scl_1[0] : 1'bz;
  assign i2c_0_sda = _zz_i2c_0_sda ? _zz_i2c_0_sda_1[0] : 1'bz;
  assign gpioA[0] = _zz_gpioA_15 ? _zz_gpioA_16[0] : 1'bz;
  assign gpioA[1] = _zz_gpioA_14 ? _zz_gpioA_16[1] : 1'bz;
  assign gpioA[2] = _zz_gpioA_13 ? _zz_gpioA_16[2] : 1'bz;
  assign gpioA[3] = _zz_gpioA_12 ? _zz_gpioA_16[3] : 1'bz;
  assign gpioA[4] = _zz_gpioA_11 ? _zz_gpioA_16[4] : 1'bz;
  assign gpioA[5] = _zz_gpioA_10 ? _zz_gpioA_16[5] : 1'bz;
  assign gpioA[6] = _zz_gpioA_9 ? _zz_gpioA_16[6] : 1'bz;
  assign gpioA[7] = _zz_gpioA_8 ? _zz_gpioA_16[7] : 1'bz;
  assign gpioA[8] = _zz_gpioA_7 ? _zz_gpioA_16[8] : 1'bz;
  assign gpioA[9] = _zz_gpioA_6 ? _zz_gpioA_16[9] : 1'bz;
  assign gpioA[10] = _zz_gpioA_5 ? _zz_gpioA_16[10] : 1'bz;
  assign gpioA[11] = _zz_gpioA_4 ? _zz_gpioA_16[11] : 1'bz;
  assign gpioA[12] = _zz_gpioA_3 ? _zz_gpioA_16[12] : 1'bz;
  assign gpioA[13] = _zz_gpioA_2 ? _zz_gpioA_16[13] : 1'bz;
  assign gpioA[14] = _zz_gpioA_1 ? _zz_gpioA_16[14] : 1'bz;
  assign gpioA[15] = _zz_gpioA ? _zz_gpioA_16[15] : 1'bz;
  always @(*) begin
    _zz_gpioA = 1'b0;
    if(when_InOutWrapper_l65_15) begin
      _zz_gpioA = 1'b1;
    end
  end

  always @(*) begin
    _zz_gpioA_1 = 1'b0;
    if(when_InOutWrapper_l65_14) begin
      _zz_gpioA_1 = 1'b1;
    end
  end

  always @(*) begin
    _zz_gpioA_2 = 1'b0;
    if(when_InOutWrapper_l65_13) begin
      _zz_gpioA_2 = 1'b1;
    end
  end

  always @(*) begin
    _zz_gpioA_3 = 1'b0;
    if(when_InOutWrapper_l65_12) begin
      _zz_gpioA_3 = 1'b1;
    end
  end

  always @(*) begin
    _zz_gpioA_4 = 1'b0;
    if(when_InOutWrapper_l65_11) begin
      _zz_gpioA_4 = 1'b1;
    end
  end

  always @(*) begin
    _zz_gpioA_5 = 1'b0;
    if(when_InOutWrapper_l65_10) begin
      _zz_gpioA_5 = 1'b1;
    end
  end

  always @(*) begin
    _zz_gpioA_6 = 1'b0;
    if(when_InOutWrapper_l65_9) begin
      _zz_gpioA_6 = 1'b1;
    end
  end

  always @(*) begin
    _zz_gpioA_7 = 1'b0;
    if(when_InOutWrapper_l65_8) begin
      _zz_gpioA_7 = 1'b1;
    end
  end

  always @(*) begin
    _zz_gpioA_8 = 1'b0;
    if(when_InOutWrapper_l65_7) begin
      _zz_gpioA_8 = 1'b1;
    end
  end

  always @(*) begin
    _zz_gpioA_9 = 1'b0;
    if(when_InOutWrapper_l65_6) begin
      _zz_gpioA_9 = 1'b1;
    end
  end

  always @(*) begin
    _zz_gpioA_10 = 1'b0;
    if(when_InOutWrapper_l65_5) begin
      _zz_gpioA_10 = 1'b1;
    end
  end

  always @(*) begin
    _zz_gpioA_11 = 1'b0;
    if(when_InOutWrapper_l65_4) begin
      _zz_gpioA_11 = 1'b1;
    end
  end

  always @(*) begin
    _zz_gpioA_12 = 1'b0;
    if(when_InOutWrapper_l65_3) begin
      _zz_gpioA_12 = 1'b1;
    end
  end

  always @(*) begin
    _zz_gpioA_13 = 1'b0;
    if(when_InOutWrapper_l65_2) begin
      _zz_gpioA_13 = 1'b1;
    end
  end

  always @(*) begin
    _zz_gpioA_14 = 1'b0;
    if(when_InOutWrapper_l65_1) begin
      _zz_gpioA_14 = 1'b1;
    end
  end

  always @(*) begin
    _zz_gpioA_15 = 1'b0;
    if(when_InOutWrapper_l65) begin
      _zz_gpioA_15 = 1'b1;
    end
  end

  always @(*) begin
    _zz_i2c_0_sda = 1'b0;
    if(when_InOutWrapper_l48_1) begin
      _zz_i2c_0_sda = 1'b1;
    end
  end

  always @(*) begin
    _zz_i2c_0_scl = 1'b0;
    if(when_InOutWrapper_l48) begin
      _zz_i2c_0_scl = 1'b1;
    end
  end

  assign pll_areset = (! mainReset);
  assign core_clk = pll_c0;
  assign core_resetn = bufferCC_7_io_dataOut;
  assign jtag_tdo = murax_io_jtag_tdo;
  assign _zz_gpioA_16 = murax_io_gpioA_write;
  assign _zz_when_InOutWrapper_l65 = murax_io_gpioA_writeEnable;
  assign uart_0_txd = murax_io_uart_0_txd;
  assign leds = murax_io_leds;
  assign _zz_when_InOutWrapper_l48 = murax_io_i2c_0_sda_write;
  assign _zz_when_InOutWrapper_l48_1 = murax_io_i2c_0_scl_write;
  assign spi_0_ss = murax_io_spi_0_ss;
  assign spi_0_sclk = murax_io_spi_0_sclk;
  assign spi_0_mosi = murax_io_spi_0_mosi;
  assign _zz_io_i2c_0_scl_read = i2c_0_scl;
  assign when_InOutWrapper_l48 = (! _zz_when_InOutWrapper_l48_2[0]);
  assign _zz_io_i2c_0_sda_read = i2c_0_sda;
  assign when_InOutWrapper_l48_1 = (! _zz_when_InOutWrapper_l48_1_1[0]);
  assign _zz_io_gpioA_read = gpioA;
  assign when_InOutWrapper_l65 = _zz_when_InOutWrapper_l65[0];
  assign when_InOutWrapper_l65_1 = _zz_when_InOutWrapper_l65[1];
  assign when_InOutWrapper_l65_2 = _zz_when_InOutWrapper_l65[2];
  assign when_InOutWrapper_l65_3 = _zz_when_InOutWrapper_l65[3];
  assign when_InOutWrapper_l65_4 = _zz_when_InOutWrapper_l65[4];
  assign when_InOutWrapper_l65_5 = _zz_when_InOutWrapper_l65[5];
  assign when_InOutWrapper_l65_6 = _zz_when_InOutWrapper_l65[6];
  assign when_InOutWrapper_l65_7 = _zz_when_InOutWrapper_l65[7];
  assign when_InOutWrapper_l65_8 = _zz_when_InOutWrapper_l65[8];
  assign when_InOutWrapper_l65_9 = _zz_when_InOutWrapper_l65[9];
  assign when_InOutWrapper_l65_10 = _zz_when_InOutWrapper_l65[10];
  assign when_InOutWrapper_l65_11 = _zz_when_InOutWrapper_l65[11];
  assign when_InOutWrapper_l65_12 = _zz_when_InOutWrapper_l65[12];
  assign when_InOutWrapper_l65_13 = _zz_when_InOutWrapper_l65[13];
  assign when_InOutWrapper_l65_14 = _zz_when_InOutWrapper_l65[14];
  assign when_InOutWrapper_l65_15 = _zz_when_InOutWrapper_l65[15];

endmodule

module BufferCC_6 (
  input               io_dataIn,
  output              io_dataOut,
  input               core_clk,
  input               locked
);
  (* async_reg = "true" *) reg                 buffers_0;
  (* async_reg = "true" *) reg                 buffers_1;

  assign io_dataOut = buffers_1;
  always @(posedge core_clk or posedge locked) begin
    if(locked) begin
      buffers_0 <= 1'b0;
      buffers_1 <= 1'b0;
    end else begin
      buffers_0 <= io_dataIn;
      buffers_1 <= buffers_0;
    end
  end


endmodule

module MainDecaMuraxSoc (
  input               io_asyncReset,
  input               io_mainClk,
  input               io_jtag_tms,
  input               io_jtag_tdi,
  output              io_jtag_tdo,
  input               io_jtag_tck,
  input      [15:0]   io_gpioA_read,
  output     [15:0]   io_gpioA_write,
  output     [15:0]   io_gpioA_writeEnable,
  output              io_uart_0_txd,
  input               io_uart_0_rxd,
  output              io_i2c_0_sda_write,
  input               io_i2c_0_sda_read,
  output              io_i2c_0_scl_write,
  input               io_i2c_0_scl_read,
  output     [0:0]    io_spi_0_ss,
  output              io_spi_0_sclk,
  output              io_spi_0_mosi,
  input               io_spi_0_miso,
  output     [7:0]    io_leds
);
  wire       [7:0]    system_cpu_debug_bus_cmd_payload_address;
  wire                system_cpu_dBus_cmd_ready;
  reg                 system_ram_io_bus_cmd_valid;
  reg                 system_apbBridge_io_pipelinedMemoryBus_cmd_valid;
  wire       [3:0]    system_gpioACtrl_io_apb_PADDR;
  wire       [4:0]    system_uartCtrl_io_apb_PADDR;
  wire       [7:0]    system_timer_io_apb_PADDR;
  wire       [7:0]    system_i2cCtrl_io_apb_PADDR;
  wire       [7:0]    system_spiCtrl_io_apb_PADDR;
  wire       [7:0]    system_ledsctrl_io_apb_PADDR;
  wire                io_asyncReset_buffercc_io_dataOut;
  wire                system_mainBusArbiter_io_iBus_cmd_ready;
  wire                system_mainBusArbiter_io_iBus_rsp_valid;
  wire                system_mainBusArbiter_io_iBus_rsp_payload_error;
  wire       [31:0]   system_mainBusArbiter_io_iBus_rsp_payload_inst;
  wire                system_mainBusArbiter_io_dBus_cmd_ready;
  wire                system_mainBusArbiter_io_dBus_rsp_ready;
  wire                system_mainBusArbiter_io_dBus_rsp_error;
  wire       [31:0]   system_mainBusArbiter_io_dBus_rsp_data;
  wire                system_mainBusArbiter_io_masterBus_cmd_valid;
  wire                system_mainBusArbiter_io_masterBus_cmd_payload_write;
  wire       [31:0]   system_mainBusArbiter_io_masterBus_cmd_payload_address;
  wire       [31:0]   system_mainBusArbiter_io_masterBus_cmd_payload_data;
  wire       [3:0]    system_mainBusArbiter_io_masterBus_cmd_payload_mask;
  wire                system_cpu_iBus_cmd_valid;
  wire       [31:0]   system_cpu_iBus_cmd_payload_pc;
  wire                system_cpu_debug_bus_cmd_ready;
  wire       [31:0]   system_cpu_debug_bus_rsp_data;
  wire                system_cpu_debug_resetOut;
  wire                system_cpu_dBus_cmd_valid;
  wire                system_cpu_dBus_cmd_payload_wr;
  wire       [31:0]   system_cpu_dBus_cmd_payload_address;
  wire       [31:0]   system_cpu_dBus_cmd_payload_data;
  wire       [1:0]    system_cpu_dBus_cmd_payload_size;
  wire                jtagBridge_1_io_jtag_tdo;
  wire                jtagBridge_1_io_remote_cmd_valid;
  wire                jtagBridge_1_io_remote_cmd_payload_last;
  wire       [0:0]    jtagBridge_1_io_remote_cmd_payload_fragment;
  wire                jtagBridge_1_io_remote_rsp_ready;
  wire                systemDebugger_1_io_remote_cmd_ready;
  wire                systemDebugger_1_io_remote_rsp_valid;
  wire                systemDebugger_1_io_remote_rsp_payload_error;
  wire       [31:0]   systemDebugger_1_io_remote_rsp_payload_data;
  wire                systemDebugger_1_io_mem_cmd_valid;
  wire       [31:0]   systemDebugger_1_io_mem_cmd_payload_address;
  wire       [31:0]   systemDebugger_1_io_mem_cmd_payload_data;
  wire                systemDebugger_1_io_mem_cmd_payload_wr;
  wire       [1:0]    systemDebugger_1_io_mem_cmd_payload_size;
  wire                system_ram_io_bus_cmd_ready;
  wire                system_ram_io_bus_rsp_valid;
  wire       [31:0]   system_ram_io_bus_rsp_payload_data;
  wire                system_apbBridge_io_pipelinedMemoryBus_cmd_ready;
  wire                system_apbBridge_io_pipelinedMemoryBus_rsp_valid;
  wire       [31:0]   system_apbBridge_io_pipelinedMemoryBus_rsp_payload_data;
  wire       [19:0]   system_apbBridge_io_apb_PADDR;
  wire       [0:0]    system_apbBridge_io_apb_PSEL;
  wire                system_apbBridge_io_apb_PENABLE;
  wire                system_apbBridge_io_apb_PWRITE;
  wire       [31:0]   system_apbBridge_io_apb_PWDATA;
  wire                system_gpioACtrl_io_apb_PREADY;
  wire       [31:0]   system_gpioACtrl_io_apb_PRDATA;
  wire                system_gpioACtrl_io_apb_PSLVERROR;
  wire       [15:0]   system_gpioACtrl_io_gpio_write;
  wire       [15:0]   system_gpioACtrl_io_gpio_writeEnable;
  wire       [15:0]   system_gpioACtrl_io_value;
  wire                system_uartCtrl_io_apb_PREADY;
  wire       [31:0]   system_uartCtrl_io_apb_PRDATA;
  wire                system_uartCtrl_io_uart_txd;
  wire                system_uartCtrl_io_interrupt;
  wire                system_timer_io_apb_PREADY;
  wire       [31:0]   system_timer_io_apb_PRDATA;
  wire                system_timer_io_apb_PSLVERROR;
  wire                system_timer_io_interrupt;
  wire                system_i2cCtrl_io_apb_PREADY;
  wire       [31:0]   system_i2cCtrl_io_apb_PRDATA;
  wire                system_i2cCtrl_io_i2c_scl_write;
  wire                system_i2cCtrl_io_i2c_sda_write;
  wire                system_i2cCtrl_io_interrupt;
  wire                system_spiCtrl_io_apb_PREADY;
  wire       [31:0]   system_spiCtrl_io_apb_PRDATA;
  wire                system_spiCtrl_io_spi_sclk;
  wire                system_spiCtrl_io_spi_mosi;
  wire       [0:0]    system_spiCtrl_io_spi_ss;
  wire                system_spiCtrl_io_interrupt;
  wire                system_ledsctrl_io_apb_PREADY;
  wire       [31:0]   system_ledsctrl_io_apb_PRDATA;
  wire                system_ledsctrl_io_apb_PSLVERROR;
  wire       [7:0]    system_ledsctrl_io_leds;
  wire                io_apb_decoder_io_input_PREADY;
  wire       [31:0]   io_apb_decoder_io_input_PRDATA;
  wire                io_apb_decoder_io_input_PSLVERROR;
  wire       [19:0]   io_apb_decoder_io_output_PADDR;
  wire       [5:0]    io_apb_decoder_io_output_PSEL;
  wire                io_apb_decoder_io_output_PENABLE;
  wire                io_apb_decoder_io_output_PWRITE;
  wire       [31:0]   io_apb_decoder_io_output_PWDATA;
  wire                apb3Router_1_io_input_PREADY;
  wire       [31:0]   apb3Router_1_io_input_PRDATA;
  wire                apb3Router_1_io_input_PSLVERROR;
  wire       [19:0]   apb3Router_1_io_outputs_0_PADDR;
  wire       [0:0]    apb3Router_1_io_outputs_0_PSEL;
  wire                apb3Router_1_io_outputs_0_PENABLE;
  wire                apb3Router_1_io_outputs_0_PWRITE;
  wire       [31:0]   apb3Router_1_io_outputs_0_PWDATA;
  wire       [19:0]   apb3Router_1_io_outputs_1_PADDR;
  wire       [0:0]    apb3Router_1_io_outputs_1_PSEL;
  wire                apb3Router_1_io_outputs_1_PENABLE;
  wire                apb3Router_1_io_outputs_1_PWRITE;
  wire       [31:0]   apb3Router_1_io_outputs_1_PWDATA;
  wire       [19:0]   apb3Router_1_io_outputs_2_PADDR;
  wire       [0:0]    apb3Router_1_io_outputs_2_PSEL;
  wire                apb3Router_1_io_outputs_2_PENABLE;
  wire                apb3Router_1_io_outputs_2_PWRITE;
  wire       [31:0]   apb3Router_1_io_outputs_2_PWDATA;
  wire       [19:0]   apb3Router_1_io_outputs_3_PADDR;
  wire       [0:0]    apb3Router_1_io_outputs_3_PSEL;
  wire                apb3Router_1_io_outputs_3_PENABLE;
  wire                apb3Router_1_io_outputs_3_PWRITE;
  wire       [31:0]   apb3Router_1_io_outputs_3_PWDATA;
  wire       [19:0]   apb3Router_1_io_outputs_4_PADDR;
  wire       [0:0]    apb3Router_1_io_outputs_4_PSEL;
  wire                apb3Router_1_io_outputs_4_PENABLE;
  wire                apb3Router_1_io_outputs_4_PWRITE;
  wire       [31:0]   apb3Router_1_io_outputs_4_PWDATA;
  wire       [19:0]   apb3Router_1_io_outputs_5_PADDR;
  wire       [0:0]    apb3Router_1_io_outputs_5_PSEL;
  wire                apb3Router_1_io_outputs_5_PENABLE;
  wire                apb3Router_1_io_outputs_5_PWRITE;
  wire       [31:0]   apb3Router_1_io_outputs_5_PWDATA;
  reg        [31:0]   _zz_system_mainBusDecoder_logic_masterPipelined_rsp_payload_data;
  reg                 resetCtrl_mainClkResetUnbuffered;
  reg        [5:0]    resetCtrl_systemClkResetCounter = 6'h0;
  wire       [5:0]    _zz_when_DecaMurax_l181;
  wire                when_DecaMurax_l181;
  wire                when_DecaMurax_l185;
  reg                 resetCtrl_mainClkReset;
  reg                 resetCtrl_systemReset;
  reg                 system_timerInterrupt;
  reg                 system_externalInterrupt;
  wire                system_cpu_dBus_cmd_halfPipe_valid;
  wire                system_cpu_dBus_cmd_halfPipe_ready;
  wire                system_cpu_dBus_cmd_halfPipe_payload_wr;
  wire       [31:0]   system_cpu_dBus_cmd_halfPipe_payload_address;
  wire       [31:0]   system_cpu_dBus_cmd_halfPipe_payload_data;
  wire       [1:0]    system_cpu_dBus_cmd_halfPipe_payload_size;
  reg                 system_cpu_dBus_cmd_rValid;
  wire                system_cpu_dBus_cmd_halfPipe_fire;
  reg                 system_cpu_dBus_cmd_rData_wr;
  reg        [31:0]   system_cpu_dBus_cmd_rData_address;
  reg        [31:0]   system_cpu_dBus_cmd_rData_data;
  reg        [1:0]    system_cpu_dBus_cmd_rData_size;
  reg                 system_cpu_debug_resetOut_regNext;
  wire                system_cpu_debug_bus_cmd_fire;
  reg                 system_cpu_debug_bus_cmd_fire_regNext;
  wire                system_mainBusDecoder_logic_masterPipelined_cmd_valid;
  reg                 system_mainBusDecoder_logic_masterPipelined_cmd_ready;
  wire                system_mainBusDecoder_logic_masterPipelined_cmd_payload_write;
  wire       [31:0]   system_mainBusDecoder_logic_masterPipelined_cmd_payload_address;
  wire       [31:0]   system_mainBusDecoder_logic_masterPipelined_cmd_payload_data;
  wire       [3:0]    system_mainBusDecoder_logic_masterPipelined_cmd_payload_mask;
  wire                system_mainBusDecoder_logic_masterPipelined_rsp_valid;
  wire       [31:0]   system_mainBusDecoder_logic_masterPipelined_rsp_payload_data;
  wire                system_mainBusDecoder_logic_hits_0;
  wire                _zz_io_bus_cmd_payload_write;
  wire                system_mainBusDecoder_logic_hits_1;
  wire                _zz_io_pipelinedMemoryBus_cmd_payload_write;
  wire                system_mainBusDecoder_logic_noHit;
  reg                 system_mainBusDecoder_logic_rspPending;
  wire                system_mainBusDecoder_logic_masterPipelined_cmd_fire;
  wire                when_MuraxUtiles_l127;
  reg                 system_mainBusDecoder_logic_rspNoHit;
  wire                system_mainBusDecoder_logic_masterPipelined_cmd_fire_1;
  reg        [0:0]    system_mainBusDecoder_logic_rspSourceId;
  wire                when_MuraxUtiles_l133;

  BufferCC_5 io_asyncReset_buffercc (
    .io_dataIn     (io_asyncReset                      ), //i
    .io_dataOut    (io_asyncReset_buffercc_io_dataOut  ), //o
    .io_mainClk    (io_mainClk                         )  //i
  );
  MuraxMasterArbiter system_mainBusArbiter (
    .io_iBus_cmd_valid                   (system_cpu_iBus_cmd_valid                                     ), //i
    .io_iBus_cmd_ready                   (system_mainBusArbiter_io_iBus_cmd_ready                       ), //o
    .io_iBus_cmd_payload_pc              (system_cpu_iBus_cmd_payload_pc                                ), //i
    .io_iBus_rsp_valid                   (system_mainBusArbiter_io_iBus_rsp_valid                       ), //o
    .io_iBus_rsp_payload_error           (system_mainBusArbiter_io_iBus_rsp_payload_error               ), //o
    .io_iBus_rsp_payload_inst            (system_mainBusArbiter_io_iBus_rsp_payload_inst                ), //o
    .io_dBus_cmd_valid                   (system_cpu_dBus_cmd_halfPipe_valid                            ), //i
    .io_dBus_cmd_ready                   (system_mainBusArbiter_io_dBus_cmd_ready                       ), //o
    .io_dBus_cmd_payload_wr              (system_cpu_dBus_cmd_halfPipe_payload_wr                       ), //i
    .io_dBus_cmd_payload_address         (system_cpu_dBus_cmd_halfPipe_payload_address                  ), //i
    .io_dBus_cmd_payload_data            (system_cpu_dBus_cmd_halfPipe_payload_data                     ), //i
    .io_dBus_cmd_payload_size            (system_cpu_dBus_cmd_halfPipe_payload_size                     ), //i
    .io_dBus_rsp_ready                   (system_mainBusArbiter_io_dBus_rsp_ready                       ), //o
    .io_dBus_rsp_error                   (system_mainBusArbiter_io_dBus_rsp_error                       ), //o
    .io_dBus_rsp_data                    (system_mainBusArbiter_io_dBus_rsp_data                        ), //o
    .io_masterBus_cmd_valid              (system_mainBusArbiter_io_masterBus_cmd_valid                  ), //o
    .io_masterBus_cmd_ready              (system_mainBusDecoder_logic_masterPipelined_cmd_ready         ), //i
    .io_masterBus_cmd_payload_write      (system_mainBusArbiter_io_masterBus_cmd_payload_write          ), //o
    .io_masterBus_cmd_payload_address    (system_mainBusArbiter_io_masterBus_cmd_payload_address        ), //o
    .io_masterBus_cmd_payload_data       (system_mainBusArbiter_io_masterBus_cmd_payload_data           ), //o
    .io_masterBus_cmd_payload_mask       (system_mainBusArbiter_io_masterBus_cmd_payload_mask           ), //o
    .io_masterBus_rsp_valid              (system_mainBusDecoder_logic_masterPipelined_rsp_valid         ), //i
    .io_masterBus_rsp_payload_data       (system_mainBusDecoder_logic_masterPipelined_rsp_payload_data  ), //i
    .io_mainClk                          (io_mainClk                                                    ), //i
    .resetCtrl_systemReset               (resetCtrl_systemReset                                         )  //i
  );
  VexRiscv system_cpu (
    .iBus_cmd_valid                   (system_cpu_iBus_cmd_valid                        ), //o
    .iBus_cmd_ready                   (system_mainBusArbiter_io_iBus_cmd_ready          ), //i
    .iBus_cmd_payload_pc              (system_cpu_iBus_cmd_payload_pc                   ), //o
    .iBus_rsp_valid                   (system_mainBusArbiter_io_iBus_rsp_valid          ), //i
    .iBus_rsp_payload_error           (system_mainBusArbiter_io_iBus_rsp_payload_error  ), //i
    .iBus_rsp_payload_inst            (system_mainBusArbiter_io_iBus_rsp_payload_inst   ), //i
    .timerInterrupt                   (system_timerInterrupt                            ), //i
    .externalInterrupt                (system_externalInterrupt                         ), //i
    .softwareInterrupt                (1'b0                                             ), //i
    .debug_bus_cmd_valid              (systemDebugger_1_io_mem_cmd_valid                ), //i
    .debug_bus_cmd_ready              (system_cpu_debug_bus_cmd_ready                   ), //o
    .debug_bus_cmd_payload_wr         (systemDebugger_1_io_mem_cmd_payload_wr           ), //i
    .debug_bus_cmd_payload_address    (system_cpu_debug_bus_cmd_payload_address         ), //i
    .debug_bus_cmd_payload_data       (systemDebugger_1_io_mem_cmd_payload_data         ), //i
    .debug_bus_rsp_data               (system_cpu_debug_bus_rsp_data                    ), //o
    .debug_resetOut                   (system_cpu_debug_resetOut                        ), //o
    .dBus_cmd_valid                   (system_cpu_dBus_cmd_valid                        ), //o
    .dBus_cmd_ready                   (system_cpu_dBus_cmd_ready                        ), //i
    .dBus_cmd_payload_wr              (system_cpu_dBus_cmd_payload_wr                   ), //o
    .dBus_cmd_payload_address         (system_cpu_dBus_cmd_payload_address              ), //o
    .dBus_cmd_payload_data            (system_cpu_dBus_cmd_payload_data                 ), //o
    .dBus_cmd_payload_size            (system_cpu_dBus_cmd_payload_size                 ), //o
    .dBus_rsp_ready                   (system_mainBusArbiter_io_dBus_rsp_ready          ), //i
    .dBus_rsp_error                   (system_mainBusArbiter_io_dBus_rsp_error          ), //i
    .dBus_rsp_data                    (system_mainBusArbiter_io_dBus_rsp_data           ), //i
    .io_mainClk                       (io_mainClk                                       ), //i
    .resetCtrl_systemReset            (resetCtrl_systemReset                            ), //i
    .resetCtrl_mainClkReset           (resetCtrl_mainClkReset                           )  //i
  );
  JtagBridge jtagBridge_1 (
    .io_jtag_tms                       (io_jtag_tms                                   ), //i
    .io_jtag_tdi                       (io_jtag_tdi                                   ), //i
    .io_jtag_tdo                       (jtagBridge_1_io_jtag_tdo                      ), //o
    .io_jtag_tck                       (io_jtag_tck                                   ), //i
    .io_remote_cmd_valid               (jtagBridge_1_io_remote_cmd_valid              ), //o
    .io_remote_cmd_ready               (systemDebugger_1_io_remote_cmd_ready          ), //i
    .io_remote_cmd_payload_last        (jtagBridge_1_io_remote_cmd_payload_last       ), //o
    .io_remote_cmd_payload_fragment    (jtagBridge_1_io_remote_cmd_payload_fragment   ), //o
    .io_remote_rsp_valid               (systemDebugger_1_io_remote_rsp_valid          ), //i
    .io_remote_rsp_ready               (jtagBridge_1_io_remote_rsp_ready              ), //o
    .io_remote_rsp_payload_error       (systemDebugger_1_io_remote_rsp_payload_error  ), //i
    .io_remote_rsp_payload_data        (systemDebugger_1_io_remote_rsp_payload_data   ), //i
    .io_mainClk                        (io_mainClk                                    ), //i
    .resetCtrl_mainClkReset            (resetCtrl_mainClkReset                        )  //i
  );
  SystemDebugger systemDebugger_1 (
    .io_remote_cmd_valid               (jtagBridge_1_io_remote_cmd_valid              ), //i
    .io_remote_cmd_ready               (systemDebugger_1_io_remote_cmd_ready          ), //o
    .io_remote_cmd_payload_last        (jtagBridge_1_io_remote_cmd_payload_last       ), //i
    .io_remote_cmd_payload_fragment    (jtagBridge_1_io_remote_cmd_payload_fragment   ), //i
    .io_remote_rsp_valid               (systemDebugger_1_io_remote_rsp_valid          ), //o
    .io_remote_rsp_ready               (jtagBridge_1_io_remote_rsp_ready              ), //i
    .io_remote_rsp_payload_error       (systemDebugger_1_io_remote_rsp_payload_error  ), //o
    .io_remote_rsp_payload_data        (systemDebugger_1_io_remote_rsp_payload_data   ), //o
    .io_mem_cmd_valid                  (systemDebugger_1_io_mem_cmd_valid             ), //o
    .io_mem_cmd_ready                  (system_cpu_debug_bus_cmd_ready                ), //i
    .io_mem_cmd_payload_address        (systemDebugger_1_io_mem_cmd_payload_address   ), //o
    .io_mem_cmd_payload_data           (systemDebugger_1_io_mem_cmd_payload_data      ), //o
    .io_mem_cmd_payload_wr             (systemDebugger_1_io_mem_cmd_payload_wr        ), //o
    .io_mem_cmd_payload_size           (systemDebugger_1_io_mem_cmd_payload_size      ), //o
    .io_mem_rsp_valid                  (system_cpu_debug_bus_cmd_fire_regNext         ), //i
    .io_mem_rsp_payload                (system_cpu_debug_bus_rsp_data                 ), //i
    .io_mainClk                        (io_mainClk                                    ), //i
    .resetCtrl_mainClkReset            (resetCtrl_mainClkReset                        )  //i
  );
  PipelinedMemoryBusRam system_ram (
    .io_bus_cmd_valid              (system_ram_io_bus_cmd_valid                                      ), //i
    .io_bus_cmd_ready              (system_ram_io_bus_cmd_ready                                      ), //o
    .io_bus_cmd_payload_write      (_zz_io_bus_cmd_payload_write                                     ), //i
    .io_bus_cmd_payload_address    (system_mainBusDecoder_logic_masterPipelined_cmd_payload_address  ), //i
    .io_bus_cmd_payload_data       (system_mainBusDecoder_logic_masterPipelined_cmd_payload_data     ), //i
    .io_bus_cmd_payload_mask       (system_mainBusDecoder_logic_masterPipelined_cmd_payload_mask     ), //i
    .io_bus_rsp_valid              (system_ram_io_bus_rsp_valid                                      ), //o
    .io_bus_rsp_payload_data       (system_ram_io_bus_rsp_payload_data                               ), //o
    .io_mainClk                    (io_mainClk                                                       ), //i
    .resetCtrl_systemReset         (resetCtrl_systemReset                                            )  //i
  );
  PipelinedMemoryBusToApbBridge system_apbBridge (
    .io_pipelinedMemoryBus_cmd_valid              (system_apbBridge_io_pipelinedMemoryBus_cmd_valid                 ), //i
    .io_pipelinedMemoryBus_cmd_ready              (system_apbBridge_io_pipelinedMemoryBus_cmd_ready                 ), //o
    .io_pipelinedMemoryBus_cmd_payload_write      (_zz_io_pipelinedMemoryBus_cmd_payload_write                      ), //i
    .io_pipelinedMemoryBus_cmd_payload_address    (system_mainBusDecoder_logic_masterPipelined_cmd_payload_address  ), //i
    .io_pipelinedMemoryBus_cmd_payload_data       (system_mainBusDecoder_logic_masterPipelined_cmd_payload_data     ), //i
    .io_pipelinedMemoryBus_cmd_payload_mask       (system_mainBusDecoder_logic_masterPipelined_cmd_payload_mask     ), //i
    .io_pipelinedMemoryBus_rsp_valid              (system_apbBridge_io_pipelinedMemoryBus_rsp_valid                 ), //o
    .io_pipelinedMemoryBus_rsp_payload_data       (system_apbBridge_io_pipelinedMemoryBus_rsp_payload_data          ), //o
    .io_apb_PADDR                                 (system_apbBridge_io_apb_PADDR                                    ), //o
    .io_apb_PSEL                                  (system_apbBridge_io_apb_PSEL                                     ), //o
    .io_apb_PENABLE                               (system_apbBridge_io_apb_PENABLE                                  ), //o
    .io_apb_PREADY                                (io_apb_decoder_io_input_PREADY                                   ), //i
    .io_apb_PWRITE                                (system_apbBridge_io_apb_PWRITE                                   ), //o
    .io_apb_PWDATA                                (system_apbBridge_io_apb_PWDATA                                   ), //o
    .io_apb_PRDATA                                (io_apb_decoder_io_input_PRDATA                                   ), //i
    .io_apb_PSLVERROR                             (io_apb_decoder_io_input_PSLVERROR                                ), //i
    .io_mainClk                                   (io_mainClk                                                       ), //i
    .resetCtrl_systemReset                        (resetCtrl_systemReset                                            )  //i
  );
  Apb3Gpio system_gpioACtrl (
    .io_apb_PADDR             (system_gpioACtrl_io_apb_PADDR         ), //i
    .io_apb_PSEL              (apb3Router_1_io_outputs_0_PSEL        ), //i
    .io_apb_PENABLE           (apb3Router_1_io_outputs_0_PENABLE     ), //i
    .io_apb_PREADY            (system_gpioACtrl_io_apb_PREADY        ), //o
    .io_apb_PWRITE            (apb3Router_1_io_outputs_0_PWRITE      ), //i
    .io_apb_PWDATA            (apb3Router_1_io_outputs_0_PWDATA      ), //i
    .io_apb_PRDATA            (system_gpioACtrl_io_apb_PRDATA        ), //o
    .io_apb_PSLVERROR         (system_gpioACtrl_io_apb_PSLVERROR     ), //o
    .io_gpio_read             (io_gpioA_read                         ), //i
    .io_gpio_write            (system_gpioACtrl_io_gpio_write        ), //o
    .io_gpio_writeEnable      (system_gpioACtrl_io_gpio_writeEnable  ), //o
    .io_value                 (system_gpioACtrl_io_value             ), //o
    .io_mainClk               (io_mainClk                            ), //i
    .resetCtrl_systemReset    (resetCtrl_systemReset                 )  //i
  );
  Apb3UartCtrl system_uartCtrl (
    .io_apb_PADDR             (system_uartCtrl_io_apb_PADDR       ), //i
    .io_apb_PSEL              (apb3Router_1_io_outputs_1_PSEL     ), //i
    .io_apb_PENABLE           (apb3Router_1_io_outputs_1_PENABLE  ), //i
    .io_apb_PREADY            (system_uartCtrl_io_apb_PREADY      ), //o
    .io_apb_PWRITE            (apb3Router_1_io_outputs_1_PWRITE   ), //i
    .io_apb_PWDATA            (apb3Router_1_io_outputs_1_PWDATA   ), //i
    .io_apb_PRDATA            (system_uartCtrl_io_apb_PRDATA      ), //o
    .io_uart_txd              (system_uartCtrl_io_uart_txd        ), //o
    .io_uart_rxd              (io_uart_0_rxd                      ), //i
    .io_interrupt             (system_uartCtrl_io_interrupt       ), //o
    .io_mainClk               (io_mainClk                         ), //i
    .resetCtrl_systemReset    (resetCtrl_systemReset              )  //i
  );
  MuraxApb3Timer system_timer (
    .io_apb_PADDR             (system_timer_io_apb_PADDR          ), //i
    .io_apb_PSEL              (apb3Router_1_io_outputs_2_PSEL     ), //i
    .io_apb_PENABLE           (apb3Router_1_io_outputs_2_PENABLE  ), //i
    .io_apb_PREADY            (system_timer_io_apb_PREADY         ), //o
    .io_apb_PWRITE            (apb3Router_1_io_outputs_2_PWRITE   ), //i
    .io_apb_PWDATA            (apb3Router_1_io_outputs_2_PWDATA   ), //i
    .io_apb_PRDATA            (system_timer_io_apb_PRDATA         ), //o
    .io_apb_PSLVERROR         (system_timer_io_apb_PSLVERROR      ), //o
    .io_interrupt             (system_timer_io_interrupt          ), //o
    .io_mainClk               (io_mainClk                         ), //i
    .resetCtrl_systemReset    (resetCtrl_systemReset              )  //i
  );
  Apb3I2cCtrl system_i2cCtrl (
    .io_apb_PADDR             (system_i2cCtrl_io_apb_PADDR        ), //i
    .io_apb_PSEL              (apb3Router_1_io_outputs_3_PSEL     ), //i
    .io_apb_PENABLE           (apb3Router_1_io_outputs_3_PENABLE  ), //i
    .io_apb_PREADY            (system_i2cCtrl_io_apb_PREADY       ), //o
    .io_apb_PWRITE            (apb3Router_1_io_outputs_3_PWRITE   ), //i
    .io_apb_PWDATA            (apb3Router_1_io_outputs_3_PWDATA   ), //i
    .io_apb_PRDATA            (system_i2cCtrl_io_apb_PRDATA       ), //o
    .io_i2c_sda_write         (system_i2cCtrl_io_i2c_sda_write    ), //o
    .io_i2c_sda_read          (io_i2c_0_sda_read                  ), //i
    .io_i2c_scl_write         (system_i2cCtrl_io_i2c_scl_write    ), //o
    .io_i2c_scl_read          (io_i2c_0_scl_read                  ), //i
    .io_interrupt             (system_i2cCtrl_io_interrupt        ), //o
    .io_mainClk               (io_mainClk                         ), //i
    .resetCtrl_systemReset    (resetCtrl_systemReset              )  //i
  );
  Apb3SpiMasterCtrl system_spiCtrl (
    .io_apb_PADDR             (system_spiCtrl_io_apb_PADDR        ), //i
    .io_apb_PSEL              (apb3Router_1_io_outputs_4_PSEL     ), //i
    .io_apb_PENABLE           (apb3Router_1_io_outputs_4_PENABLE  ), //i
    .io_apb_PREADY            (system_spiCtrl_io_apb_PREADY       ), //o
    .io_apb_PWRITE            (apb3Router_1_io_outputs_4_PWRITE   ), //i
    .io_apb_PWDATA            (apb3Router_1_io_outputs_4_PWDATA   ), //i
    .io_apb_PRDATA            (system_spiCtrl_io_apb_PRDATA       ), //o
    .io_spi_ss                (system_spiCtrl_io_spi_ss           ), //o
    .io_spi_sclk              (system_spiCtrl_io_spi_sclk         ), //o
    .io_spi_mosi              (system_spiCtrl_io_spi_mosi         ), //o
    .io_spi_miso              (io_spi_0_miso                      ), //i
    .io_interrupt             (system_spiCtrl_io_interrupt        ), //o
    .io_mainClk               (io_mainClk                         ), //i
    .resetCtrl_systemReset    (resetCtrl_systemReset              )  //i
  );
  Apb3LedsCtrl system_ledsctrl (
    .io_apb_PADDR             (system_ledsctrl_io_apb_PADDR       ), //i
    .io_apb_PSEL              (apb3Router_1_io_outputs_5_PSEL     ), //i
    .io_apb_PENABLE           (apb3Router_1_io_outputs_5_PENABLE  ), //i
    .io_apb_PREADY            (system_ledsctrl_io_apb_PREADY      ), //o
    .io_apb_PWRITE            (apb3Router_1_io_outputs_5_PWRITE   ), //i
    .io_apb_PWDATA            (apb3Router_1_io_outputs_5_PWDATA   ), //i
    .io_apb_PRDATA            (system_ledsctrl_io_apb_PRDATA      ), //o
    .io_apb_PSLVERROR         (system_ledsctrl_io_apb_PSLVERROR   ), //o
    .io_leds                  (system_ledsctrl_io_leds            ), //o
    .io_mainClk               (io_mainClk                         ), //i
    .resetCtrl_systemReset    (resetCtrl_systemReset              )  //i
  );
  Apb3Decoder io_apb_decoder (
    .io_input_PADDR         (system_apbBridge_io_apb_PADDR      ), //i
    .io_input_PSEL          (system_apbBridge_io_apb_PSEL       ), //i
    .io_input_PENABLE       (system_apbBridge_io_apb_PENABLE    ), //i
    .io_input_PREADY        (io_apb_decoder_io_input_PREADY     ), //o
    .io_input_PWRITE        (system_apbBridge_io_apb_PWRITE     ), //i
    .io_input_PWDATA        (system_apbBridge_io_apb_PWDATA     ), //i
    .io_input_PRDATA        (io_apb_decoder_io_input_PRDATA     ), //o
    .io_input_PSLVERROR     (io_apb_decoder_io_input_PSLVERROR  ), //o
    .io_output_PADDR        (io_apb_decoder_io_output_PADDR     ), //o
    .io_output_PSEL         (io_apb_decoder_io_output_PSEL      ), //o
    .io_output_PENABLE      (io_apb_decoder_io_output_PENABLE   ), //o
    .io_output_PREADY       (apb3Router_1_io_input_PREADY       ), //i
    .io_output_PWRITE       (io_apb_decoder_io_output_PWRITE    ), //o
    .io_output_PWDATA       (io_apb_decoder_io_output_PWDATA    ), //o
    .io_output_PRDATA       (apb3Router_1_io_input_PRDATA       ), //i
    .io_output_PSLVERROR    (apb3Router_1_io_input_PSLVERROR    )  //i
  );
  Apb3Router apb3Router_1 (
    .io_input_PADDR            (io_apb_decoder_io_output_PADDR     ), //i
    .io_input_PSEL             (io_apb_decoder_io_output_PSEL      ), //i
    .io_input_PENABLE          (io_apb_decoder_io_output_PENABLE   ), //i
    .io_input_PREADY           (apb3Router_1_io_input_PREADY       ), //o
    .io_input_PWRITE           (io_apb_decoder_io_output_PWRITE    ), //i
    .io_input_PWDATA           (io_apb_decoder_io_output_PWDATA    ), //i
    .io_input_PRDATA           (apb3Router_1_io_input_PRDATA       ), //o
    .io_input_PSLVERROR        (apb3Router_1_io_input_PSLVERROR    ), //o
    .io_outputs_0_PADDR        (apb3Router_1_io_outputs_0_PADDR    ), //o
    .io_outputs_0_PSEL         (apb3Router_1_io_outputs_0_PSEL     ), //o
    .io_outputs_0_PENABLE      (apb3Router_1_io_outputs_0_PENABLE  ), //o
    .io_outputs_0_PREADY       (system_gpioACtrl_io_apb_PREADY     ), //i
    .io_outputs_0_PWRITE       (apb3Router_1_io_outputs_0_PWRITE   ), //o
    .io_outputs_0_PWDATA       (apb3Router_1_io_outputs_0_PWDATA   ), //o
    .io_outputs_0_PRDATA       (system_gpioACtrl_io_apb_PRDATA     ), //i
    .io_outputs_0_PSLVERROR    (system_gpioACtrl_io_apb_PSLVERROR  ), //i
    .io_outputs_1_PADDR        (apb3Router_1_io_outputs_1_PADDR    ), //o
    .io_outputs_1_PSEL         (apb3Router_1_io_outputs_1_PSEL     ), //o
    .io_outputs_1_PENABLE      (apb3Router_1_io_outputs_1_PENABLE  ), //o
    .io_outputs_1_PREADY       (system_uartCtrl_io_apb_PREADY      ), //i
    .io_outputs_1_PWRITE       (apb3Router_1_io_outputs_1_PWRITE   ), //o
    .io_outputs_1_PWDATA       (apb3Router_1_io_outputs_1_PWDATA   ), //o
    .io_outputs_1_PRDATA       (system_uartCtrl_io_apb_PRDATA      ), //i
    .io_outputs_1_PSLVERROR    (1'b0                               ), //i
    .io_outputs_2_PADDR        (apb3Router_1_io_outputs_2_PADDR    ), //o
    .io_outputs_2_PSEL         (apb3Router_1_io_outputs_2_PSEL     ), //o
    .io_outputs_2_PENABLE      (apb3Router_1_io_outputs_2_PENABLE  ), //o
    .io_outputs_2_PREADY       (system_timer_io_apb_PREADY         ), //i
    .io_outputs_2_PWRITE       (apb3Router_1_io_outputs_2_PWRITE   ), //o
    .io_outputs_2_PWDATA       (apb3Router_1_io_outputs_2_PWDATA   ), //o
    .io_outputs_2_PRDATA       (system_timer_io_apb_PRDATA         ), //i
    .io_outputs_2_PSLVERROR    (system_timer_io_apb_PSLVERROR      ), //i
    .io_outputs_3_PADDR        (apb3Router_1_io_outputs_3_PADDR    ), //o
    .io_outputs_3_PSEL         (apb3Router_1_io_outputs_3_PSEL     ), //o
    .io_outputs_3_PENABLE      (apb3Router_1_io_outputs_3_PENABLE  ), //o
    .io_outputs_3_PREADY       (system_i2cCtrl_io_apb_PREADY       ), //i
    .io_outputs_3_PWRITE       (apb3Router_1_io_outputs_3_PWRITE   ), //o
    .io_outputs_3_PWDATA       (apb3Router_1_io_outputs_3_PWDATA   ), //o
    .io_outputs_3_PRDATA       (system_i2cCtrl_io_apb_PRDATA       ), //i
    .io_outputs_3_PSLVERROR    (1'b0                               ), //i
    .io_outputs_4_PADDR        (apb3Router_1_io_outputs_4_PADDR    ), //o
    .io_outputs_4_PSEL         (apb3Router_1_io_outputs_4_PSEL     ), //o
    .io_outputs_4_PENABLE      (apb3Router_1_io_outputs_4_PENABLE  ), //o
    .io_outputs_4_PREADY       (system_spiCtrl_io_apb_PREADY       ), //i
    .io_outputs_4_PWRITE       (apb3Router_1_io_outputs_4_PWRITE   ), //o
    .io_outputs_4_PWDATA       (apb3Router_1_io_outputs_4_PWDATA   ), //o
    .io_outputs_4_PRDATA       (system_spiCtrl_io_apb_PRDATA       ), //i
    .io_outputs_4_PSLVERROR    (1'b0                               ), //i
    .io_outputs_5_PADDR        (apb3Router_1_io_outputs_5_PADDR    ), //o
    .io_outputs_5_PSEL         (apb3Router_1_io_outputs_5_PSEL     ), //o
    .io_outputs_5_PENABLE      (apb3Router_1_io_outputs_5_PENABLE  ), //o
    .io_outputs_5_PREADY       (system_ledsctrl_io_apb_PREADY      ), //i
    .io_outputs_5_PWRITE       (apb3Router_1_io_outputs_5_PWRITE   ), //o
    .io_outputs_5_PWDATA       (apb3Router_1_io_outputs_5_PWDATA   ), //o
    .io_outputs_5_PRDATA       (system_ledsctrl_io_apb_PRDATA      ), //i
    .io_outputs_5_PSLVERROR    (system_ledsctrl_io_apb_PSLVERROR   ), //i
    .io_mainClk                (io_mainClk                         ), //i
    .resetCtrl_systemReset     (resetCtrl_systemReset              )  //i
  );
  always @(*) begin
    case(system_mainBusDecoder_logic_rspSourceId)
      1'b0 : begin
        _zz_system_mainBusDecoder_logic_masterPipelined_rsp_payload_data = system_ram_io_bus_rsp_payload_data;
      end
      default : begin
        _zz_system_mainBusDecoder_logic_masterPipelined_rsp_payload_data = system_apbBridge_io_pipelinedMemoryBus_rsp_payload_data;
      end
    endcase
  end

  always @(*) begin
    resetCtrl_mainClkResetUnbuffered = 1'b0;
    if(when_DecaMurax_l181) begin
      resetCtrl_mainClkResetUnbuffered = 1'b1;
    end
  end

  assign _zz_when_DecaMurax_l181[5 : 0] = 6'h3f;
  assign when_DecaMurax_l181 = (resetCtrl_systemClkResetCounter != _zz_when_DecaMurax_l181);
  assign when_DecaMurax_l185 = io_asyncReset_buffercc_io_dataOut;
  always @(*) begin
    system_timerInterrupt = 1'b0;
    if(system_timer_io_interrupt) begin
      system_timerInterrupt = 1'b1;
    end
  end

  always @(*) begin
    system_externalInterrupt = 1'b0;
    if(system_uartCtrl_io_interrupt) begin
      system_externalInterrupt = 1'b1;
    end
  end

  assign system_cpu_dBus_cmd_halfPipe_fire = (system_cpu_dBus_cmd_halfPipe_valid && system_cpu_dBus_cmd_halfPipe_ready);
  assign system_cpu_dBus_cmd_ready = (! system_cpu_dBus_cmd_rValid);
  assign system_cpu_dBus_cmd_halfPipe_valid = system_cpu_dBus_cmd_rValid;
  assign system_cpu_dBus_cmd_halfPipe_payload_wr = system_cpu_dBus_cmd_rData_wr;
  assign system_cpu_dBus_cmd_halfPipe_payload_address = system_cpu_dBus_cmd_rData_address;
  assign system_cpu_dBus_cmd_halfPipe_payload_data = system_cpu_dBus_cmd_rData_data;
  assign system_cpu_dBus_cmd_halfPipe_payload_size = system_cpu_dBus_cmd_rData_size;
  assign system_cpu_dBus_cmd_halfPipe_ready = system_mainBusArbiter_io_dBus_cmd_ready;
  assign system_cpu_debug_bus_cmd_payload_address = systemDebugger_1_io_mem_cmd_payload_address[7:0];
  assign system_cpu_debug_bus_cmd_fire = (systemDebugger_1_io_mem_cmd_valid && system_cpu_debug_bus_cmd_ready);
  assign io_jtag_tdo = jtagBridge_1_io_jtag_tdo;
  assign io_gpioA_write = system_gpioACtrl_io_gpio_write;
  assign io_gpioA_writeEnable = system_gpioACtrl_io_gpio_writeEnable;
  assign io_uart_0_txd = system_uartCtrl_io_uart_txd;
  assign io_i2c_0_sda_write = system_i2cCtrl_io_i2c_sda_write;
  assign io_i2c_0_scl_write = system_i2cCtrl_io_i2c_scl_write;
  assign io_spi_0_ss = system_spiCtrl_io_spi_ss;
  assign io_spi_0_sclk = system_spiCtrl_io_spi_sclk;
  assign io_spi_0_mosi = system_spiCtrl_io_spi_mosi;
  assign io_leds = (~ system_ledsctrl_io_leds);
  assign system_gpioACtrl_io_apb_PADDR = apb3Router_1_io_outputs_0_PADDR[3:0];
  assign system_uartCtrl_io_apb_PADDR = apb3Router_1_io_outputs_1_PADDR[4:0];
  assign system_timer_io_apb_PADDR = apb3Router_1_io_outputs_2_PADDR[7:0];
  assign system_i2cCtrl_io_apb_PADDR = apb3Router_1_io_outputs_3_PADDR[7:0];
  assign system_spiCtrl_io_apb_PADDR = apb3Router_1_io_outputs_4_PADDR[7:0];
  assign system_ledsctrl_io_apb_PADDR = apb3Router_1_io_outputs_5_PADDR[7:0];
  assign system_mainBusDecoder_logic_masterPipelined_cmd_valid = system_mainBusArbiter_io_masterBus_cmd_valid;
  assign system_mainBusDecoder_logic_masterPipelined_cmd_payload_write = system_mainBusArbiter_io_masterBus_cmd_payload_write;
  assign system_mainBusDecoder_logic_masterPipelined_cmd_payload_address = system_mainBusArbiter_io_masterBus_cmd_payload_address;
  assign system_mainBusDecoder_logic_masterPipelined_cmd_payload_data = system_mainBusArbiter_io_masterBus_cmd_payload_data;
  assign system_mainBusDecoder_logic_masterPipelined_cmd_payload_mask = system_mainBusArbiter_io_masterBus_cmd_payload_mask;
  assign system_mainBusDecoder_logic_hits_0 = ((system_mainBusDecoder_logic_masterPipelined_cmd_payload_address & (~ 32'h0001ffff)) == 32'h0);
  always @(*) begin
    system_ram_io_bus_cmd_valid = (system_mainBusDecoder_logic_masterPipelined_cmd_valid && system_mainBusDecoder_logic_hits_0);
    if(when_MuraxUtiles_l133) begin
      system_ram_io_bus_cmd_valid = 1'b0;
    end
  end

  assign _zz_io_bus_cmd_payload_write = system_mainBusDecoder_logic_masterPipelined_cmd_payload_write;
  assign system_mainBusDecoder_logic_hits_1 = ((system_mainBusDecoder_logic_masterPipelined_cmd_payload_address & (~ 32'h000fffff)) == 32'hf0000000);
  always @(*) begin
    system_apbBridge_io_pipelinedMemoryBus_cmd_valid = (system_mainBusDecoder_logic_masterPipelined_cmd_valid && system_mainBusDecoder_logic_hits_1);
    if(when_MuraxUtiles_l133) begin
      system_apbBridge_io_pipelinedMemoryBus_cmd_valid = 1'b0;
    end
  end

  assign _zz_io_pipelinedMemoryBus_cmd_payload_write = system_mainBusDecoder_logic_masterPipelined_cmd_payload_write;
  assign system_mainBusDecoder_logic_noHit = (! ({system_mainBusDecoder_logic_hits_1,system_mainBusDecoder_logic_hits_0} != 2'b00));
  always @(*) begin
    system_mainBusDecoder_logic_masterPipelined_cmd_ready = (({(system_mainBusDecoder_logic_hits_1 && system_apbBridge_io_pipelinedMemoryBus_cmd_ready),(system_mainBusDecoder_logic_hits_0 && system_ram_io_bus_cmd_ready)} != 2'b00) || system_mainBusDecoder_logic_noHit);
    if(when_MuraxUtiles_l133) begin
      system_mainBusDecoder_logic_masterPipelined_cmd_ready = 1'b0;
    end
  end

  assign system_mainBusDecoder_logic_masterPipelined_cmd_fire = (system_mainBusDecoder_logic_masterPipelined_cmd_valid && system_mainBusDecoder_logic_masterPipelined_cmd_ready);
  assign when_MuraxUtiles_l127 = (system_mainBusDecoder_logic_masterPipelined_cmd_fire && (! system_mainBusDecoder_logic_masterPipelined_cmd_payload_write));
  assign system_mainBusDecoder_logic_masterPipelined_cmd_fire_1 = (system_mainBusDecoder_logic_masterPipelined_cmd_valid && system_mainBusDecoder_logic_masterPipelined_cmd_ready);
  assign system_mainBusDecoder_logic_masterPipelined_rsp_valid = (({system_apbBridge_io_pipelinedMemoryBus_rsp_valid,system_ram_io_bus_rsp_valid} != 2'b00) || (system_mainBusDecoder_logic_rspPending && system_mainBusDecoder_logic_rspNoHit));
  assign system_mainBusDecoder_logic_masterPipelined_rsp_payload_data = _zz_system_mainBusDecoder_logic_masterPipelined_rsp_payload_data;
  assign when_MuraxUtiles_l133 = (system_mainBusDecoder_logic_rspPending && (! system_mainBusDecoder_logic_masterPipelined_rsp_valid));
  always @(posedge io_mainClk) begin
    if(when_DecaMurax_l181) begin
      resetCtrl_systemClkResetCounter <= (resetCtrl_systemClkResetCounter + 6'h01);
    end
    if(when_DecaMurax_l185) begin
      resetCtrl_systemClkResetCounter <= 6'h0;
    end
  end

  always @(posedge io_mainClk) begin
    resetCtrl_mainClkReset <= resetCtrl_mainClkResetUnbuffered;
    resetCtrl_systemReset <= resetCtrl_mainClkResetUnbuffered;
    if(system_cpu_debug_resetOut_regNext) begin
      resetCtrl_systemReset <= 1'b1;
    end
  end

  always @(posedge io_mainClk or posedge resetCtrl_systemReset) begin
    if(resetCtrl_systemReset) begin
      system_cpu_dBus_cmd_rValid <= 1'b0;
      system_mainBusDecoder_logic_rspPending <= 1'b0;
      system_mainBusDecoder_logic_rspNoHit <= 1'b0;
    end else begin
      if(system_cpu_dBus_cmd_valid) begin
        system_cpu_dBus_cmd_rValid <= 1'b1;
      end
      if(system_cpu_dBus_cmd_halfPipe_fire) begin
        system_cpu_dBus_cmd_rValid <= 1'b0;
      end
      if(system_mainBusDecoder_logic_masterPipelined_rsp_valid) begin
        system_mainBusDecoder_logic_rspPending <= 1'b0;
      end
      if(when_MuraxUtiles_l127) begin
        system_mainBusDecoder_logic_rspPending <= 1'b1;
      end
      system_mainBusDecoder_logic_rspNoHit <= 1'b0;
      if(system_mainBusDecoder_logic_noHit) begin
        system_mainBusDecoder_logic_rspNoHit <= 1'b1;
      end
    end
  end

  always @(posedge io_mainClk) begin
    if(system_cpu_dBus_cmd_ready) begin
      system_cpu_dBus_cmd_rData_wr <= system_cpu_dBus_cmd_payload_wr;
      system_cpu_dBus_cmd_rData_address <= system_cpu_dBus_cmd_payload_address;
      system_cpu_dBus_cmd_rData_data <= system_cpu_dBus_cmd_payload_data;
      system_cpu_dBus_cmd_rData_size <= system_cpu_dBus_cmd_payload_size;
    end
    if(system_mainBusDecoder_logic_masterPipelined_cmd_fire_1) begin
      system_mainBusDecoder_logic_rspSourceId <= system_mainBusDecoder_logic_hits_1;
    end
  end

  always @(posedge io_mainClk) begin
    system_cpu_debug_resetOut_regNext <= system_cpu_debug_resetOut;
  end

  always @(posedge io_mainClk or posedge resetCtrl_mainClkReset) begin
    if(resetCtrl_mainClkReset) begin
      system_cpu_debug_bus_cmd_fire_regNext <= 1'b0;
    end else begin
      system_cpu_debug_bus_cmd_fire_regNext <= system_cpu_debug_bus_cmd_fire;
    end
  end


endmodule

module Apb3Router (
  input      [19:0]   io_input_PADDR,
  input      [5:0]    io_input_PSEL,
  input               io_input_PENABLE,
  output              io_input_PREADY,
  input               io_input_PWRITE,
  input      [31:0]   io_input_PWDATA,
  output     [31:0]   io_input_PRDATA,
  output              io_input_PSLVERROR,
  output     [19:0]   io_outputs_0_PADDR,
  output     [0:0]    io_outputs_0_PSEL,
  output              io_outputs_0_PENABLE,
  input               io_outputs_0_PREADY,
  output              io_outputs_0_PWRITE,
  output     [31:0]   io_outputs_0_PWDATA,
  input      [31:0]   io_outputs_0_PRDATA,
  input               io_outputs_0_PSLVERROR,
  output     [19:0]   io_outputs_1_PADDR,
  output     [0:0]    io_outputs_1_PSEL,
  output              io_outputs_1_PENABLE,
  input               io_outputs_1_PREADY,
  output              io_outputs_1_PWRITE,
  output     [31:0]   io_outputs_1_PWDATA,
  input      [31:0]   io_outputs_1_PRDATA,
  input               io_outputs_1_PSLVERROR,
  output     [19:0]   io_outputs_2_PADDR,
  output     [0:0]    io_outputs_2_PSEL,
  output              io_outputs_2_PENABLE,
  input               io_outputs_2_PREADY,
  output              io_outputs_2_PWRITE,
  output     [31:0]   io_outputs_2_PWDATA,
  input      [31:0]   io_outputs_2_PRDATA,
  input               io_outputs_2_PSLVERROR,
  output     [19:0]   io_outputs_3_PADDR,
  output     [0:0]    io_outputs_3_PSEL,
  output              io_outputs_3_PENABLE,
  input               io_outputs_3_PREADY,
  output              io_outputs_3_PWRITE,
  output     [31:0]   io_outputs_3_PWDATA,
  input      [31:0]   io_outputs_3_PRDATA,
  input               io_outputs_3_PSLVERROR,
  output     [19:0]   io_outputs_4_PADDR,
  output     [0:0]    io_outputs_4_PSEL,
  output              io_outputs_4_PENABLE,
  input               io_outputs_4_PREADY,
  output              io_outputs_4_PWRITE,
  output     [31:0]   io_outputs_4_PWDATA,
  input      [31:0]   io_outputs_4_PRDATA,
  input               io_outputs_4_PSLVERROR,
  output     [19:0]   io_outputs_5_PADDR,
  output     [0:0]    io_outputs_5_PSEL,
  output              io_outputs_5_PENABLE,
  input               io_outputs_5_PREADY,
  output              io_outputs_5_PWRITE,
  output     [31:0]   io_outputs_5_PWDATA,
  input      [31:0]   io_outputs_5_PRDATA,
  input               io_outputs_5_PSLVERROR,
  input               io_mainClk,
  input               resetCtrl_systemReset
);
  reg                 _zz_io_input_PREADY;
  reg        [31:0]   _zz_io_input_PRDATA;
  reg                 _zz_io_input_PSLVERROR;
  wire                _zz_selIndex;
  wire                _zz_selIndex_1;
  wire                _zz_selIndex_2;
  wire                _zz_selIndex_3;
  wire                _zz_selIndex_4;
  reg        [2:0]    selIndex;

  always @(*) begin
    case(selIndex)
      3'b000 : begin
        _zz_io_input_PREADY = io_outputs_0_PREADY;
        _zz_io_input_PRDATA = io_outputs_0_PRDATA;
        _zz_io_input_PSLVERROR = io_outputs_0_PSLVERROR;
      end
      3'b001 : begin
        _zz_io_input_PREADY = io_outputs_1_PREADY;
        _zz_io_input_PRDATA = io_outputs_1_PRDATA;
        _zz_io_input_PSLVERROR = io_outputs_1_PSLVERROR;
      end
      3'b010 : begin
        _zz_io_input_PREADY = io_outputs_2_PREADY;
        _zz_io_input_PRDATA = io_outputs_2_PRDATA;
        _zz_io_input_PSLVERROR = io_outputs_2_PSLVERROR;
      end
      3'b011 : begin
        _zz_io_input_PREADY = io_outputs_3_PREADY;
        _zz_io_input_PRDATA = io_outputs_3_PRDATA;
        _zz_io_input_PSLVERROR = io_outputs_3_PSLVERROR;
      end
      3'b100 : begin
        _zz_io_input_PREADY = io_outputs_4_PREADY;
        _zz_io_input_PRDATA = io_outputs_4_PRDATA;
        _zz_io_input_PSLVERROR = io_outputs_4_PSLVERROR;
      end
      default : begin
        _zz_io_input_PREADY = io_outputs_5_PREADY;
        _zz_io_input_PRDATA = io_outputs_5_PRDATA;
        _zz_io_input_PSLVERROR = io_outputs_5_PSLVERROR;
      end
    endcase
  end

  assign io_outputs_0_PADDR = io_input_PADDR;
  assign io_outputs_0_PENABLE = io_input_PENABLE;
  assign io_outputs_0_PSEL[0] = io_input_PSEL[0];
  assign io_outputs_0_PWRITE = io_input_PWRITE;
  assign io_outputs_0_PWDATA = io_input_PWDATA;
  assign io_outputs_1_PADDR = io_input_PADDR;
  assign io_outputs_1_PENABLE = io_input_PENABLE;
  assign io_outputs_1_PSEL[0] = io_input_PSEL[1];
  assign io_outputs_1_PWRITE = io_input_PWRITE;
  assign io_outputs_1_PWDATA = io_input_PWDATA;
  assign io_outputs_2_PADDR = io_input_PADDR;
  assign io_outputs_2_PENABLE = io_input_PENABLE;
  assign io_outputs_2_PSEL[0] = io_input_PSEL[2];
  assign io_outputs_2_PWRITE = io_input_PWRITE;
  assign io_outputs_2_PWDATA = io_input_PWDATA;
  assign io_outputs_3_PADDR = io_input_PADDR;
  assign io_outputs_3_PENABLE = io_input_PENABLE;
  assign io_outputs_3_PSEL[0] = io_input_PSEL[3];
  assign io_outputs_3_PWRITE = io_input_PWRITE;
  assign io_outputs_3_PWDATA = io_input_PWDATA;
  assign io_outputs_4_PADDR = io_input_PADDR;
  assign io_outputs_4_PENABLE = io_input_PENABLE;
  assign io_outputs_4_PSEL[0] = io_input_PSEL[4];
  assign io_outputs_4_PWRITE = io_input_PWRITE;
  assign io_outputs_4_PWDATA = io_input_PWDATA;
  assign io_outputs_5_PADDR = io_input_PADDR;
  assign io_outputs_5_PENABLE = io_input_PENABLE;
  assign io_outputs_5_PSEL[0] = io_input_PSEL[5];
  assign io_outputs_5_PWRITE = io_input_PWRITE;
  assign io_outputs_5_PWDATA = io_input_PWDATA;
  assign _zz_selIndex = io_input_PSEL[3];
  assign _zz_selIndex_1 = io_input_PSEL[5];
  assign _zz_selIndex_2 = ((io_input_PSEL[1] || _zz_selIndex) || _zz_selIndex_1);
  assign _zz_selIndex_3 = (io_input_PSEL[2] || _zz_selIndex);
  assign _zz_selIndex_4 = (io_input_PSEL[4] || _zz_selIndex_1);
  assign io_input_PREADY = _zz_io_input_PREADY;
  assign io_input_PRDATA = _zz_io_input_PRDATA;
  assign io_input_PSLVERROR = _zz_io_input_PSLVERROR;
  always @(posedge io_mainClk) begin
    selIndex <= {_zz_selIndex_4,{_zz_selIndex_3,_zz_selIndex_2}};
  end


endmodule

module Apb3Decoder (
  input      [19:0]   io_input_PADDR,
  input      [0:0]    io_input_PSEL,
  input               io_input_PENABLE,
  output reg          io_input_PREADY,
  input               io_input_PWRITE,
  input      [31:0]   io_input_PWDATA,
  output     [31:0]   io_input_PRDATA,
  output reg          io_input_PSLVERROR,
  output     [19:0]   io_output_PADDR,
  output reg [5:0]    io_output_PSEL,
  output              io_output_PENABLE,
  input               io_output_PREADY,
  output              io_output_PWRITE,
  output     [31:0]   io_output_PWDATA,
  input      [31:0]   io_output_PRDATA,
  input               io_output_PSLVERROR
);
  wire                when_Apb3Decoder_l84;

  assign io_output_PADDR = io_input_PADDR;
  assign io_output_PENABLE = io_input_PENABLE;
  assign io_output_PWRITE = io_input_PWRITE;
  assign io_output_PWDATA = io_input_PWDATA;
  always @(*) begin
    io_output_PSEL[0] = (((io_input_PADDR & (~ 20'h00fff)) == 20'h0) && io_input_PSEL[0]);
    io_output_PSEL[1] = (((io_input_PADDR & (~ 20'h00fff)) == 20'h10000) && io_input_PSEL[0]);
    io_output_PSEL[2] = (((io_input_PADDR & (~ 20'h00fff)) == 20'h20000) && io_input_PSEL[0]);
    io_output_PSEL[3] = (((io_input_PADDR & (~ 20'h00fff)) == 20'h30000) && io_input_PSEL[0]);
    io_output_PSEL[4] = (((io_input_PADDR & (~ 20'h003ff)) == 20'h31000) && io_input_PSEL[0]);
    io_output_PSEL[5] = (((io_input_PADDR & (~ 20'h00fff)) == 20'h40000) && io_input_PSEL[0]);
  end

  always @(*) begin
    io_input_PREADY = io_output_PREADY;
    if(when_Apb3Decoder_l84) begin
      io_input_PREADY = 1'b1;
    end
  end

  assign io_input_PRDATA = io_output_PRDATA;
  always @(*) begin
    io_input_PSLVERROR = io_output_PSLVERROR;
    if(when_Apb3Decoder_l84) begin
      io_input_PSLVERROR = 1'b1;
    end
  end

  assign when_Apb3Decoder_l84 = (io_input_PSEL[0] && (io_output_PSEL == 6'h0));

endmodule

module Apb3LedsCtrl (
  input      [7:0]    io_apb_PADDR,
  input      [0:0]    io_apb_PSEL,
  input               io_apb_PENABLE,
  output              io_apb_PREADY,
  input               io_apb_PWRITE,
  input      [31:0]   io_apb_PWDATA,
  output reg [31:0]   io_apb_PRDATA,
  output              io_apb_PSLVERROR,
  output     [7:0]    io_leds,
  input               io_mainClk,
  input               resetCtrl_systemReset
);
  wire       [7:0]    ledsctrl_1_io_o_leds;
  wire                busctrl_askWrite;
  wire                busctrl_askRead;
  wire                busctrl_doWrite;
  wire                busctrl_doRead;
  reg        [7:0]    _zz_io_apb_PRDATA;
  reg        [0:0]    _zz_io_apb_PRDATA_1;

  LedsCtrl ledsctrl_1 (
    .io_value     (_zz_io_apb_PRDATA     ), //i
    .io_ldir      (_zz_io_apb_PRDATA_1   ), //i
    .io_o_leds    (ledsctrl_1_io_o_leds  )  //o
  );
  assign io_apb_PREADY = 1'b1;
  always @(*) begin
    io_apb_PRDATA = 32'h0;
    case(io_apb_PADDR)
      8'h0 : begin
        io_apb_PRDATA[7 : 0] = _zz_io_apb_PRDATA;
      end
      8'h04 : begin
        io_apb_PRDATA[0 : 0] = _zz_io_apb_PRDATA_1;
      end
      default : begin
      end
    endcase
  end

  assign io_apb_PSLVERROR = 1'b0;
  assign busctrl_askWrite = ((io_apb_PSEL[0] && io_apb_PENABLE) && io_apb_PWRITE);
  assign busctrl_askRead = ((io_apb_PSEL[0] && io_apb_PENABLE) && (! io_apb_PWRITE));
  assign busctrl_doWrite = (((io_apb_PSEL[0] && io_apb_PENABLE) && io_apb_PREADY) && io_apb_PWRITE);
  assign busctrl_doRead = (((io_apb_PSEL[0] && io_apb_PENABLE) && io_apb_PREADY) && (! io_apb_PWRITE));
  assign io_leds = ledsctrl_1_io_o_leds;
  always @(posedge io_mainClk or posedge resetCtrl_systemReset) begin
    if(resetCtrl_systemReset) begin
      _zz_io_apb_PRDATA <= 8'h0;
    end else begin
      case(io_apb_PADDR)
        8'h0 : begin
          if(busctrl_doWrite) begin
            _zz_io_apb_PRDATA <= io_apb_PWDATA[7 : 0];
          end
        end
        default : begin
        end
      endcase
    end
  end

  always @(posedge io_mainClk) begin
    case(io_apb_PADDR)
      8'h04 : begin
        if(busctrl_doWrite) begin
          _zz_io_apb_PRDATA_1 <= io_apb_PWDATA[0 : 0];
        end
      end
      default : begin
      end
    endcase
  end


endmodule

module Apb3SpiMasterCtrl (
  input      [7:0]    io_apb_PADDR,
  input      [0:0]    io_apb_PSEL,
  input               io_apb_PENABLE,
  output              io_apb_PREADY,
  input               io_apb_PWRITE,
  input      [31:0]   io_apb_PWDATA,
  output reg [31:0]   io_apb_PRDATA,
  output     [0:0]    io_spi_ss,
  output              io_spi_sclk,
  output              io_spi_mosi,
  input               io_spi_miso,
  output              io_interrupt,
  input               io_mainClk,
  input               resetCtrl_systemReset
);
  reg                 spiCtrl_io_rsp_queueWithOccupancy_io_pop_ready;
  wire                spiCtrl_io_cmd_ready;
  wire                spiCtrl_io_rsp_valid;
  wire       [7:0]    spiCtrl_io_rsp_payload;
  wire                spiCtrl_io_spi_sclk;
  wire                spiCtrl_io_spi_mosi;
  wire       [0:0]    spiCtrl_io_spi_ss;
  wire                bridge_cmdLogic_streamUnbuffered_queueWithAvailability_io_push_ready;
  wire                bridge_cmdLogic_streamUnbuffered_queueWithAvailability_io_pop_valid;
  wire       `SpiMasterCtrlCmdMode_binary_sequential_type bridge_cmdLogic_streamUnbuffered_queueWithAvailability_io_pop_payload_mode;
  wire       [8:0]    bridge_cmdLogic_streamUnbuffered_queueWithAvailability_io_pop_payload_args;
  wire       [5:0]    bridge_cmdLogic_streamUnbuffered_queueWithAvailability_io_occupancy;
  wire       [5:0]    bridge_cmdLogic_streamUnbuffered_queueWithAvailability_io_availability;
  wire                spiCtrl_io_rsp_queueWithOccupancy_io_push_ready;
  wire                spiCtrl_io_rsp_queueWithOccupancy_io_pop_valid;
  wire       [7:0]    spiCtrl_io_rsp_queueWithOccupancy_io_pop_payload;
  wire       [5:0]    spiCtrl_io_rsp_queueWithOccupancy_io_occupancy;
  wire       [5:0]    spiCtrl_io_rsp_queueWithOccupancy_io_availability;
  wire       [0:0]    _zz_bridge_cmdLogic_streamUnbuffered_payload_args;
  wire                busCtrl_askWrite;
  wire                busCtrl_askRead;
  wire                busCtrl_doWrite;
  wire                busCtrl_doRead;
  wire                bridge_cmdLogic_streamUnbuffered_valid;
  wire                bridge_cmdLogic_streamUnbuffered_ready;
  wire       `SpiMasterCtrlCmdMode_binary_sequential_type bridge_cmdLogic_streamUnbuffered_payload_mode;
  reg        [8:0]    bridge_cmdLogic_streamUnbuffered_payload_args;
  reg                 _zz_bridge_cmdLogic_streamUnbuffered_valid;
  wire       [7:0]    bridge_cmdLogic_dataCmd_data;
  wire                bridge_cmdLogic_dataCmd_read;
  reg                 bridge_interruptCtrl_cmdIntEnable;
  reg                 bridge_interruptCtrl_rspIntEnable;
  wire                bridge_interruptCtrl_cmdInt;
  wire                bridge_interruptCtrl_rspInt;
  wire                bridge_interruptCtrl_interrupt;
  reg                 _zz_io_config_kind_cpol;
  reg                 _zz_io_config_kind_cpha;
  reg        [15:0]   _zz_io_config_sclkToogle;
  reg        [0:0]    _zz_io_config_ss_activeHigh;
  reg        [15:0]   _zz_io_config_ss_setup;
  reg        [15:0]   _zz_io_config_ss_hold;
  reg        [15:0]   _zz_io_config_ss_disable;
  wire       `SpiMasterCtrlCmdMode_binary_sequential_type _zz_bridge_cmdLogic_streamUnbuffered_payload_mode;
  wire       [1:0]    _zz_io_config_kind_cpol_1;
  `ifndef SYNTHESIS
  reg [31:0] bridge_cmdLogic_streamUnbuffered_payload_mode_string;
  reg [31:0] _zz_bridge_cmdLogic_streamUnbuffered_payload_mode_string;
  `endif


  assign _zz_bridge_cmdLogic_streamUnbuffered_payload_args = io_apb_PWDATA[24];
  SpiMasterCtrl spiCtrl (
    .io_config_kind_cpol        (_zz_io_config_kind_cpol                                                     ), //i
    .io_config_kind_cpha        (_zz_io_config_kind_cpha                                                     ), //i
    .io_config_sclkToogle       (_zz_io_config_sclkToogle                                                    ), //i
    .io_config_ss_activeHigh    (_zz_io_config_ss_activeHigh                                                 ), //i
    .io_config_ss_setup         (_zz_io_config_ss_setup                                                      ), //i
    .io_config_ss_hold          (_zz_io_config_ss_hold                                                       ), //i
    .io_config_ss_disable       (_zz_io_config_ss_disable                                                    ), //i
    .io_cmd_valid               (bridge_cmdLogic_streamUnbuffered_queueWithAvailability_io_pop_valid         ), //i
    .io_cmd_ready               (spiCtrl_io_cmd_ready                                                        ), //o
    .io_cmd_payload_mode        (bridge_cmdLogic_streamUnbuffered_queueWithAvailability_io_pop_payload_mode  ), //i
    .io_cmd_payload_args        (bridge_cmdLogic_streamUnbuffered_queueWithAvailability_io_pop_payload_args  ), //i
    .io_rsp_valid               (spiCtrl_io_rsp_valid                                                        ), //o
    .io_rsp_payload             (spiCtrl_io_rsp_payload                                                      ), //o
    .io_spi_ss                  (spiCtrl_io_spi_ss                                                           ), //o
    .io_spi_sclk                (spiCtrl_io_spi_sclk                                                         ), //o
    .io_spi_mosi                (spiCtrl_io_spi_mosi                                                         ), //o
    .io_spi_miso                (io_spi_miso                                                                 ), //i
    .io_mainClk                 (io_mainClk                                                                  ), //i
    .resetCtrl_systemReset      (resetCtrl_systemReset                                                       )  //i
  );
  StreamFifo_2 bridge_cmdLogic_streamUnbuffered_queueWithAvailability (
    .io_push_valid            (bridge_cmdLogic_streamUnbuffered_valid                                      ), //i
    .io_push_ready            (bridge_cmdLogic_streamUnbuffered_queueWithAvailability_io_push_ready        ), //o
    .io_push_payload_mode     (bridge_cmdLogic_streamUnbuffered_payload_mode                               ), //i
    .io_push_payload_args     (bridge_cmdLogic_streamUnbuffered_payload_args                               ), //i
    .io_pop_valid             (bridge_cmdLogic_streamUnbuffered_queueWithAvailability_io_pop_valid         ), //o
    .io_pop_ready             (spiCtrl_io_cmd_ready                                                        ), //i
    .io_pop_payload_mode      (bridge_cmdLogic_streamUnbuffered_queueWithAvailability_io_pop_payload_mode  ), //o
    .io_pop_payload_args      (bridge_cmdLogic_streamUnbuffered_queueWithAvailability_io_pop_payload_args  ), //o
    .io_flush                 (1'b0                                                                        ), //i
    .io_occupancy             (bridge_cmdLogic_streamUnbuffered_queueWithAvailability_io_occupancy         ), //o
    .io_availability          (bridge_cmdLogic_streamUnbuffered_queueWithAvailability_io_availability      ), //o
    .io_mainClk               (io_mainClk                                                                  ), //i
    .resetCtrl_systemReset    (resetCtrl_systemReset                                                       )  //i
  );
  StreamFifo_3 spiCtrl_io_rsp_queueWithOccupancy (
    .io_push_valid            (spiCtrl_io_rsp_valid                               ), //i
    .io_push_ready            (spiCtrl_io_rsp_queueWithOccupancy_io_push_ready    ), //o
    .io_push_payload          (spiCtrl_io_rsp_payload                             ), //i
    .io_pop_valid             (spiCtrl_io_rsp_queueWithOccupancy_io_pop_valid     ), //o
    .io_pop_ready             (spiCtrl_io_rsp_queueWithOccupancy_io_pop_ready     ), //i
    .io_pop_payload           (spiCtrl_io_rsp_queueWithOccupancy_io_pop_payload   ), //o
    .io_flush                 (1'b0                                               ), //i
    .io_occupancy             (spiCtrl_io_rsp_queueWithOccupancy_io_occupancy     ), //o
    .io_availability          (spiCtrl_io_rsp_queueWithOccupancy_io_availability  ), //o
    .io_mainClk               (io_mainClk                                         ), //i
    .resetCtrl_systemReset    (resetCtrl_systemReset                              )  //i
  );
  `ifndef SYNTHESIS
  always @(*) begin
    case(bridge_cmdLogic_streamUnbuffered_payload_mode)
      `SpiMasterCtrlCmdMode_binary_sequential_DATA : bridge_cmdLogic_streamUnbuffered_payload_mode_string = "DATA";
      `SpiMasterCtrlCmdMode_binary_sequential_SS : bridge_cmdLogic_streamUnbuffered_payload_mode_string = "SS  ";
      default : bridge_cmdLogic_streamUnbuffered_payload_mode_string = "????";
    endcase
  end
  always @(*) begin
    case(_zz_bridge_cmdLogic_streamUnbuffered_payload_mode)
      `SpiMasterCtrlCmdMode_binary_sequential_DATA : _zz_bridge_cmdLogic_streamUnbuffered_payload_mode_string = "DATA";
      `SpiMasterCtrlCmdMode_binary_sequential_SS : _zz_bridge_cmdLogic_streamUnbuffered_payload_mode_string = "SS  ";
      default : _zz_bridge_cmdLogic_streamUnbuffered_payload_mode_string = "????";
    endcase
  end
  `endif

  assign io_spi_ss = spiCtrl_io_spi_ss;
  assign io_spi_sclk = spiCtrl_io_spi_sclk;
  assign io_spi_mosi = spiCtrl_io_spi_mosi;
  assign io_apb_PREADY = 1'b1;
  always @(*) begin
    io_apb_PRDATA = 32'h0;
    case(io_apb_PADDR)
      8'h0 : begin
        io_apb_PRDATA[31 : 31] = (spiCtrl_io_rsp_queueWithOccupancy_io_pop_valid ^ 1'b0);
        io_apb_PRDATA[7 : 0] = spiCtrl_io_rsp_queueWithOccupancy_io_pop_payload;
        io_apb_PRDATA[21 : 16] = spiCtrl_io_rsp_queueWithOccupancy_io_occupancy;
      end
      8'h04 : begin
        io_apb_PRDATA[21 : 16] = bridge_cmdLogic_streamUnbuffered_queueWithAvailability_io_availability;
        io_apb_PRDATA[0 : 0] = bridge_interruptCtrl_cmdIntEnable;
        io_apb_PRDATA[1 : 1] = bridge_interruptCtrl_rspIntEnable;
        io_apb_PRDATA[8 : 8] = bridge_interruptCtrl_cmdInt;
        io_apb_PRDATA[9 : 9] = bridge_interruptCtrl_rspInt;
      end
      default : begin
      end
    endcase
  end

  assign busCtrl_askWrite = ((io_apb_PSEL[0] && io_apb_PENABLE) && io_apb_PWRITE);
  assign busCtrl_askRead = ((io_apb_PSEL[0] && io_apb_PENABLE) && (! io_apb_PWRITE));
  assign busCtrl_doWrite = (((io_apb_PSEL[0] && io_apb_PENABLE) && io_apb_PREADY) && io_apb_PWRITE);
  assign busCtrl_doRead = (((io_apb_PSEL[0] && io_apb_PENABLE) && io_apb_PREADY) && (! io_apb_PWRITE));
  always @(*) begin
    _zz_bridge_cmdLogic_streamUnbuffered_valid = 1'b0;
    case(io_apb_PADDR)
      8'h0 : begin
        if(busCtrl_doWrite) begin
          _zz_bridge_cmdLogic_streamUnbuffered_valid = 1'b1;
        end
      end
      default : begin
      end
    endcase
  end

  assign bridge_cmdLogic_streamUnbuffered_valid = _zz_bridge_cmdLogic_streamUnbuffered_valid;
  always @(*) begin
    case(bridge_cmdLogic_streamUnbuffered_payload_mode)
      `SpiMasterCtrlCmdMode_binary_sequential_DATA : begin
        bridge_cmdLogic_streamUnbuffered_payload_args = {bridge_cmdLogic_dataCmd_read,bridge_cmdLogic_dataCmd_data};
      end
      default : begin
        bridge_cmdLogic_streamUnbuffered_payload_args = {8'd0, _zz_bridge_cmdLogic_streamUnbuffered_payload_args};
      end
    endcase
  end

  assign bridge_cmdLogic_streamUnbuffered_ready = bridge_cmdLogic_streamUnbuffered_queueWithAvailability_io_push_ready;
  always @(*) begin
    spiCtrl_io_rsp_queueWithOccupancy_io_pop_ready = 1'b0;
    case(io_apb_PADDR)
      8'h0 : begin
        if(busCtrl_doRead) begin
          spiCtrl_io_rsp_queueWithOccupancy_io_pop_ready = 1'b1;
        end
      end
      default : begin
      end
    endcase
  end

  assign bridge_interruptCtrl_cmdInt = (bridge_interruptCtrl_cmdIntEnable && (! bridge_cmdLogic_streamUnbuffered_queueWithAvailability_io_pop_valid));
  assign bridge_interruptCtrl_rspInt = (bridge_interruptCtrl_rspIntEnable && spiCtrl_io_rsp_queueWithOccupancy_io_pop_valid);
  assign bridge_interruptCtrl_interrupt = (bridge_interruptCtrl_rspInt || bridge_interruptCtrl_cmdInt);
  assign io_interrupt = bridge_interruptCtrl_interrupt;
  assign bridge_cmdLogic_dataCmd_data = io_apb_PWDATA[7 : 0];
  assign bridge_cmdLogic_dataCmd_read = io_apb_PWDATA[24];
  assign _zz_bridge_cmdLogic_streamUnbuffered_payload_mode = io_apb_PWDATA[28 : 28];
  assign bridge_cmdLogic_streamUnbuffered_payload_mode = _zz_bridge_cmdLogic_streamUnbuffered_payload_mode;
  assign _zz_io_config_kind_cpol_1 = io_apb_PWDATA[1 : 0];
  always @(posedge io_mainClk or posedge resetCtrl_systemReset) begin
    if(resetCtrl_systemReset) begin
      bridge_interruptCtrl_cmdIntEnable <= 1'b0;
      bridge_interruptCtrl_rspIntEnable <= 1'b0;
      _zz_io_config_ss_activeHigh <= 1'b0;
    end else begin
      case(io_apb_PADDR)
        8'h04 : begin
          if(busCtrl_doWrite) begin
            bridge_interruptCtrl_cmdIntEnable <= io_apb_PWDATA[0];
            bridge_interruptCtrl_rspIntEnable <= io_apb_PWDATA[1];
          end
        end
        8'h08 : begin
          if(busCtrl_doWrite) begin
            _zz_io_config_ss_activeHigh <= io_apb_PWDATA[4 : 4];
          end
        end
        default : begin
        end
      endcase
    end
  end

  always @(posedge io_mainClk) begin
    case(io_apb_PADDR)
      8'h08 : begin
        if(busCtrl_doWrite) begin
          _zz_io_config_kind_cpol <= _zz_io_config_kind_cpol_1[0];
          _zz_io_config_kind_cpha <= _zz_io_config_kind_cpol_1[1];
        end
      end
      8'h0c : begin
        if(busCtrl_doWrite) begin
          _zz_io_config_sclkToogle <= io_apb_PWDATA[15 : 0];
        end
      end
      8'h10 : begin
        if(busCtrl_doWrite) begin
          _zz_io_config_ss_setup <= io_apb_PWDATA[15 : 0];
        end
      end
      8'h14 : begin
        if(busCtrl_doWrite) begin
          _zz_io_config_ss_hold <= io_apb_PWDATA[15 : 0];
        end
      end
      8'h18 : begin
        if(busCtrl_doWrite) begin
          _zz_io_config_ss_disable <= io_apb_PWDATA[15 : 0];
        end
      end
      default : begin
      end
    endcase
  end


endmodule

module Apb3I2cCtrl (
  input      [7:0]    io_apb_PADDR,
  input      [0:0]    io_apb_PSEL,
  input               io_apb_PENABLE,
  output              io_apb_PREADY,
  input               io_apb_PWRITE,
  input      [31:0]   io_apb_PWDATA,
  output reg [31:0]   io_apb_PRDATA,
  output              io_i2c_sda_write,
  input               io_i2c_sda_read,
  output              io_i2c_scl_write,
  input               io_i2c_scl_read,
  output              io_interrupt,
  input               io_mainClk,
  input               resetCtrl_systemReset
);
  reg                 i2cCtrl_io_bus_rsp_valid;
  reg                 i2cCtrl_io_bus_rsp_enable;
  reg                 i2cCtrl_io_bus_rsp_data;
  wire                i2cCtrl_io_i2c_scl_write;
  wire                i2cCtrl_io_i2c_sda_write;
  wire       `I2cSlaveCmdMode_binary_sequential_type i2cCtrl_io_bus_cmd_kind;
  wire                i2cCtrl_io_bus_cmd_data;
  wire                i2cCtrl_io_internals_inFrame;
  wire                i2cCtrl_io_internals_sdaRead;
  wire                i2cCtrl_io_internals_sclRead;
  wire       [2:0]    _zz_io_bus_rsp_data;
  wire       [2:0]    _zz_bridge_rxData_value;
  wire       [0:0]    _zz_bridge_interruptCtrl_start_flag;
  wire       [0:0]    _zz_bridge_interruptCtrl_restart_flag;
  wire       [0:0]    _zz_bridge_interruptCtrl_end_flag;
  wire       [0:0]    _zz_bridge_interruptCtrl_drop_flag;
  wire                busCtrl_askWrite;
  wire                busCtrl_askRead;
  wire                busCtrl_doWrite;
  wire                busCtrl_doRead;
  reg                 bridge_frameReset;
  wire                bridge_i2cBuffer_sda_write;
  wire                bridge_i2cBuffer_sda_read;
  wire                bridge_i2cBuffer_scl_write;
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
  wire                bridge_txAck_forceAck;
  reg                 bridge_txAck_disableOnDataConflict;
  reg        [2:0]    bridge_dataCounter;
  reg                 bridge_inAckState;
  reg                 bridge_wasntAck;
  wire                when_I2cCtrl_l481;
  wire                bridge_isMasterMode;
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
  reg        [9:0]    _zz_io_config_samplingClockDivider;
  reg        [19:0]   _zz_io_config_timeout = 20'b00000000000000000000;
  reg        [5:0]    _zz_io_config_tsuData = 6'b000000;
  reg                 bridge_i2cBuffer_scl_write_regNext;
  reg                 bridge_i2cBuffer_sda_write_regNext;

  assign _zz_io_bus_rsp_data = (3'b111 - bridge_dataCounter);
  assign _zz_bridge_rxData_value = (3'b111 - bridge_dataCounter);
  assign _zz_bridge_interruptCtrl_start_flag = 1'b0;
  assign _zz_bridge_interruptCtrl_restart_flag = 1'b0;
  assign _zz_bridge_interruptCtrl_end_flag = 1'b0;
  assign _zz_bridge_interruptCtrl_drop_flag = 1'b0;
  I2cSlave i2cCtrl (
    .io_i2c_sda_write                  (i2cCtrl_io_i2c_sda_write            ), //o
    .io_i2c_sda_read                   (bridge_i2cBuffer_sda_read           ), //i
    .io_i2c_scl_write                  (i2cCtrl_io_i2c_scl_write            ), //o
    .io_i2c_scl_read                   (bridge_i2cBuffer_scl_read           ), //i
    .io_config_samplingClockDivider    (_zz_io_config_samplingClockDivider  ), //i
    .io_config_timeout                 (_zz_io_config_timeout               ), //i
    .io_config_tsuData                 (_zz_io_config_tsuData               ), //i
    .io_bus_cmd_kind                   (i2cCtrl_io_bus_cmd_kind             ), //o
    .io_bus_cmd_data                   (i2cCtrl_io_bus_cmd_data             ), //o
    .io_bus_rsp_valid                  (i2cCtrl_io_bus_rsp_valid            ), //i
    .io_bus_rsp_enable                 (i2cCtrl_io_bus_rsp_enable           ), //i
    .io_bus_rsp_data                   (i2cCtrl_io_bus_rsp_data             ), //i
    .io_internals_inFrame              (i2cCtrl_io_internals_inFrame        ), //o
    .io_internals_sdaRead              (i2cCtrl_io_internals_sdaRead        ), //o
    .io_internals_sclRead              (i2cCtrl_io_internals_sclRead        ), //o
    .io_mainClk                        (io_mainClk                          ), //i
    .resetCtrl_systemReset             (resetCtrl_systemReset               )  //i
  );
  assign io_apb_PREADY = 1'b1;
  always @(*) begin
    io_apb_PRDATA = 32'h0;
    case(io_apb_PADDR)
      8'h08 : begin
        io_apb_PRDATA[8 : 8] = bridge_rxData_valid;
        io_apb_PRDATA[7 : 0] = bridge_rxData_value;
      end
      8'h0c : begin
        io_apb_PRDATA[8 : 8] = bridge_rxAck_valid;
        io_apb_PRDATA[0 : 0] = bridge_rxAck_value;
      end
      8'h0 : begin
        io_apb_PRDATA[8 : 8] = bridge_txData_valid;
        io_apb_PRDATA[9 : 9] = bridge_txData_enable;
      end
      8'h04 : begin
        io_apb_PRDATA[8 : 8] = bridge_txAck_valid;
        io_apb_PRDATA[9 : 9] = bridge_txAck_enable;
      end
      8'h20 : begin
        io_apb_PRDATA[0 : 0] = bridge_interruptCtrl_rxDataEnable;
        io_apb_PRDATA[1 : 1] = bridge_interruptCtrl_rxAckEnable;
        io_apb_PRDATA[2 : 2] = bridge_interruptCtrl_txDataEnable;
        io_apb_PRDATA[3 : 3] = bridge_interruptCtrl_txAckEnable;
        io_apb_PRDATA[4 : 4] = bridge_interruptCtrl_start_enable;
        io_apb_PRDATA[5 : 5] = bridge_interruptCtrl_restart_enable;
        io_apb_PRDATA[6 : 6] = bridge_interruptCtrl_end_enable;
        io_apb_PRDATA[7 : 7] = bridge_interruptCtrl_drop_enable;
      end
      8'h24 : begin
        io_apb_PRDATA[4 : 4] = bridge_interruptCtrl_start_flag;
        io_apb_PRDATA[5 : 5] = bridge_interruptCtrl_restart_flag;
        io_apb_PRDATA[6 : 6] = bridge_interruptCtrl_end_flag;
        io_apb_PRDATA[7 : 7] = bridge_interruptCtrl_drop_flag;
      end
      default : begin
      end
    endcase
  end

  assign busCtrl_askWrite = ((io_apb_PSEL[0] && io_apb_PENABLE) && io_apb_PWRITE);
  assign busCtrl_askRead = ((io_apb_PSEL[0] && io_apb_PENABLE) && (! io_apb_PWRITE));
  assign busCtrl_doWrite = (((io_apb_PSEL[0] && io_apb_PENABLE) && io_apb_PREADY) && io_apb_PWRITE);
  assign busCtrl_doRead = (((io_apb_PSEL[0] && io_apb_PENABLE) && io_apb_PREADY) && (! io_apb_PWRITE));
  always @(*) begin
    bridge_frameReset = 1'b0;
    case(i2cCtrl_io_bus_cmd_kind)
      `I2cSlaveCmdMode_binary_sequential_START : begin
        bridge_frameReset = 1'b1;
      end
      `I2cSlaveCmdMode_binary_sequential_RESTART : begin
        bridge_frameReset = 1'b1;
      end
      `I2cSlaveCmdMode_binary_sequential_STOP : begin
        bridge_frameReset = 1'b1;
      end
      `I2cSlaveCmdMode_binary_sequential_DROP : begin
        bridge_frameReset = 1'b1;
      end
      default : begin
      end
    endcase
  end

  assign bridge_i2cBuffer_sda_write = i2cCtrl_io_i2c_sda_write;
  assign bridge_i2cBuffer_scl_write = i2cCtrl_io_i2c_scl_write;
  always @(*) begin
    when_I2cCtrl_l213 = 1'b0;
    case(io_apb_PADDR)
      8'h08 : begin
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
    case(io_apb_PADDR)
      8'h0c : begin
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
  end

  assign bridge_txAck_forceAck = 1'b0;
  assign when_I2cCtrl_l481 = (! bridge_inAckState);
  always @(*) begin
    if(when_I2cCtrl_l481) begin
      i2cCtrl_io_bus_rsp_valid = ((bridge_txData_valid && (! (bridge_rxData_valid && bridge_rxData_listen))) && (i2cCtrl_io_bus_cmd_kind == `I2cSlaveCmdMode_binary_sequential_DRIVE));
      if(bridge_txData_forceDisable) begin
        i2cCtrl_io_bus_rsp_valid = 1'b1;
      end
    end else begin
      i2cCtrl_io_bus_rsp_valid = ((bridge_txAck_valid && (! (bridge_rxAck_valid && bridge_rxAck_listen))) && (i2cCtrl_io_bus_cmd_kind == `I2cSlaveCmdMode_binary_sequential_DRIVE));
      if(bridge_txAck_forceAck) begin
        i2cCtrl_io_bus_rsp_valid = 1'b1;
      end
    end
    if(when_I2cCtrl_l504) begin
      i2cCtrl_io_bus_rsp_valid = (i2cCtrl_io_bus_cmd_kind == `I2cSlaveCmdMode_binary_sequential_DRIVE);
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

  assign bridge_isMasterMode = 1'b0;
  assign when_I2cCtrl_l504 = (bridge_wasntAck && (! bridge_isMasterMode));
  assign when_I2cCtrl_l524 = (! bridge_inAckState);
  assign when_I2cCtrl_l528 = (i2cCtrl_io_bus_rsp_data != i2cCtrl_io_bus_cmd_data);
  assign when_I2cCtrl_l532 = (bridge_dataCounter == 3'b111);
  assign when_I2cCtrl_l536 = (bridge_txData_valid && (! bridge_txData_repeat));
  assign when_I2cCtrl_l546 = (bridge_txAck_valid && (! bridge_txAck_repeat));
  assign when_I2cCtrl_l559 = ((i2cCtrl_io_bus_cmd_kind == `I2cSlaveCmdMode_binary_sequential_STOP) || (i2cCtrl_io_bus_cmd_kind == `I2cSlaveCmdMode_binary_sequential_DROP));
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
  end

  assign when_I2cCtrl_l593 = (i2cCtrl_io_bus_cmd_kind == `I2cSlaveCmdMode_binary_sequential_START);
  assign when_I2cCtrl_l593_1 = (! bridge_interruptCtrl_start_enable);
  always @(*) begin
    when_BusSlaveFactory_l335 = 1'b0;
    case(io_apb_PADDR)
      8'h24 : begin
        if(busCtrl_doWrite) begin
          when_BusSlaveFactory_l335 = 1'b1;
        end
      end
      default : begin
      end
    endcase
  end

  assign when_BusSlaveFactory_l337 = io_apb_PWDATA[4];
  assign when_I2cCtrl_l593_2 = (i2cCtrl_io_bus_cmd_kind == `I2cSlaveCmdMode_binary_sequential_RESTART);
  assign when_I2cCtrl_l593_3 = (! bridge_interruptCtrl_restart_enable);
  always @(*) begin
    when_BusSlaveFactory_l335_1 = 1'b0;
    case(io_apb_PADDR)
      8'h24 : begin
        if(busCtrl_doWrite) begin
          when_BusSlaveFactory_l335_1 = 1'b1;
        end
      end
      default : begin
      end
    endcase
  end

  assign when_BusSlaveFactory_l337_1 = io_apb_PWDATA[5];
  assign when_I2cCtrl_l593_4 = (i2cCtrl_io_bus_cmd_kind == `I2cSlaveCmdMode_binary_sequential_STOP);
  assign when_I2cCtrl_l593_5 = (! bridge_interruptCtrl_end_enable);
  always @(*) begin
    when_BusSlaveFactory_l335_2 = 1'b0;
    case(io_apb_PADDR)
      8'h24 : begin
        if(busCtrl_doWrite) begin
          when_BusSlaveFactory_l335_2 = 1'b1;
        end
      end
      default : begin
      end
    endcase
  end

  assign when_BusSlaveFactory_l337_2 = io_apb_PWDATA[6];
  assign when_I2cCtrl_l593_6 = (i2cCtrl_io_bus_cmd_kind == `I2cSlaveCmdMode_binary_sequential_DROP);
  assign when_I2cCtrl_l593_7 = (! bridge_interruptCtrl_drop_enable);
  always @(*) begin
    when_BusSlaveFactory_l335_3 = 1'b0;
    case(io_apb_PADDR)
      8'h24 : begin
        if(busCtrl_doWrite) begin
          when_BusSlaveFactory_l335_3 = 1'b1;
        end
      end
      default : begin
      end
    endcase
  end

  assign when_BusSlaveFactory_l337_3 = io_apb_PWDATA[7];
  assign io_i2c_scl_write = bridge_i2cBuffer_scl_write_regNext;
  assign io_i2c_sda_write = bridge_i2cBuffer_sda_write_regNext;
  assign bridge_i2cBuffer_scl_read = io_i2c_scl_read;
  assign bridge_i2cBuffer_sda_read = io_i2c_sda_read;
  assign io_interrupt = bridge_interruptCtrl_interrupt;
  always @(posedge io_mainClk or posedge resetCtrl_systemReset) begin
    if(resetCtrl_systemReset) begin
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
      _zz_io_config_samplingClockDivider <= 10'h0;
      bridge_i2cBuffer_scl_write_regNext <= 1'b1;
      bridge_i2cBuffer_sda_write_regNext <= 1'b1;
    end else begin
      bridge_rxData_event <= 1'b0;
      if(when_I2cCtrl_l213) begin
        bridge_rxData_valid <= 1'b0;
      end
      if(when_I2cCtrl_l226) begin
        bridge_rxAck_valid <= 1'b0;
      end
      case(i2cCtrl_io_bus_cmd_kind)
        `I2cSlaveCmdMode_binary_sequential_READ : begin
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
      bridge_i2cBuffer_scl_write_regNext <= bridge_i2cBuffer_scl_write;
      bridge_i2cBuffer_sda_write_regNext <= bridge_i2cBuffer_sda_write;
      case(io_apb_PADDR)
        8'h08 : begin
          if(busCtrl_doWrite) begin
            bridge_rxData_listen <= io_apb_PWDATA[9];
          end
        end
        8'h0c : begin
          if(busCtrl_doWrite) begin
            bridge_rxAck_listen <= io_apb_PWDATA[9];
          end
        end
        8'h0 : begin
          if(busCtrl_doWrite) begin
            bridge_txData_repeat <= io_apb_PWDATA[10];
            bridge_txData_valid <= io_apb_PWDATA[8];
            bridge_txData_enable <= io_apb_PWDATA[9];
          end
        end
        8'h04 : begin
          if(busCtrl_doWrite) begin
            bridge_txAck_repeat <= io_apb_PWDATA[10];
            bridge_txAck_valid <= io_apb_PWDATA[8];
            bridge_txAck_enable <= io_apb_PWDATA[9];
          end
        end
        8'h20 : begin
          if(busCtrl_doWrite) begin
            bridge_interruptCtrl_rxDataEnable <= io_apb_PWDATA[0];
            bridge_interruptCtrl_rxAckEnable <= io_apb_PWDATA[1];
            bridge_interruptCtrl_txDataEnable <= io_apb_PWDATA[2];
            bridge_interruptCtrl_txAckEnable <= io_apb_PWDATA[3];
            bridge_interruptCtrl_start_enable <= io_apb_PWDATA[4];
            bridge_interruptCtrl_restart_enable <= io_apb_PWDATA[5];
            bridge_interruptCtrl_end_enable <= io_apb_PWDATA[6];
            bridge_interruptCtrl_drop_enable <= io_apb_PWDATA[7];
          end
        end
        8'h28 : begin
          if(busCtrl_doWrite) begin
            _zz_io_config_samplingClockDivider <= io_apb_PWDATA[9 : 0];
          end
        end
        default : begin
        end
      endcase
    end
  end

  always @(posedge io_mainClk) begin
    case(i2cCtrl_io_bus_cmd_kind)
      `I2cSlaveCmdMode_binary_sequential_READ : begin
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
    case(io_apb_PADDR)
      8'h0 : begin
        if(busCtrl_doWrite) begin
          bridge_txData_value <= io_apb_PWDATA[7 : 0];
          bridge_txData_disableOnDataConflict <= io_apb_PWDATA[11];
        end
      end
      8'h04 : begin
        if(busCtrl_doWrite) begin
          bridge_txAck_value <= io_apb_PWDATA[0];
          bridge_txAck_disableOnDataConflict <= io_apb_PWDATA[11];
        end
      end
      8'h2c : begin
        if(busCtrl_doWrite) begin
          _zz_io_config_timeout <= io_apb_PWDATA[19 : 0];
        end
      end
      8'h30 : begin
        if(busCtrl_doWrite) begin
          _zz_io_config_tsuData <= io_apb_PWDATA[5 : 0];
        end
      end
      default : begin
      end
    endcase
  end


endmodule

module MuraxApb3Timer (
  input      [7:0]    io_apb_PADDR,
  input      [0:0]    io_apb_PSEL,
  input               io_apb_PENABLE,
  output              io_apb_PREADY,
  input               io_apb_PWRITE,
  input      [31:0]   io_apb_PWDATA,
  output reg [31:0]   io_apb_PRDATA,
  output              io_apb_PSLVERROR,
  output              io_interrupt,
  input               io_mainClk,
  input               resetCtrl_systemReset
);
  wire                timerA_io_tick;
  wire                timerA_io_clear;
  wire                timerB_io_tick;
  wire                timerB_io_clear;
  reg        [1:0]    interruptCtrl_1_io_inputs;
  reg        [1:0]    interruptCtrl_1_io_clears;
  wire                prescaler_1_io_overflow;
  wire                timerA_io_full;
  wire       [15:0]   timerA_io_value;
  wire                timerB_io_full;
  wire       [15:0]   timerB_io_value;
  wire       [1:0]    interruptCtrl_1_io_pendings;
  wire                busCtrl_askWrite;
  wire                busCtrl_askRead;
  wire                busCtrl_doWrite;
  wire                busCtrl_doRead;
  reg        [15:0]   _zz_io_limit;
  reg                 _zz_io_clear;
  reg        [1:0]    timerABridge_ticksEnable;
  reg        [0:0]    timerABridge_clearsEnable;
  reg                 timerABridge_busClearing;
  reg        [15:0]   timerA_io_limit_driver;
  reg                 when_Timer_l40;
  reg                 when_Timer_l44;
  reg        [1:0]    timerBBridge_ticksEnable;
  reg        [0:0]    timerBBridge_clearsEnable;
  reg                 timerBBridge_busClearing;
  reg        [15:0]   timerB_io_limit_driver;
  reg                 when_Timer_l40_1;
  reg                 when_Timer_l44_1;
  reg        [1:0]    interruptCtrl_1_io_masks_driver;

  Prescaler prescaler_1 (
    .io_clear                 (_zz_io_clear             ), //i
    .io_limit                 (_zz_io_limit             ), //i
    .io_overflow              (prescaler_1_io_overflow  ), //o
    .io_mainClk               (io_mainClk               ), //i
    .resetCtrl_systemReset    (resetCtrl_systemReset    )  //i
  );
  Timer timerA (
    .io_tick                  (timerA_io_tick          ), //i
    .io_clear                 (timerA_io_clear         ), //i
    .io_limit                 (timerA_io_limit_driver  ), //i
    .io_full                  (timerA_io_full          ), //o
    .io_value                 (timerA_io_value         ), //o
    .io_mainClk               (io_mainClk              ), //i
    .resetCtrl_systemReset    (resetCtrl_systemReset   )  //i
  );
  Timer timerB (
    .io_tick                  (timerB_io_tick          ), //i
    .io_clear                 (timerB_io_clear         ), //i
    .io_limit                 (timerB_io_limit_driver  ), //i
    .io_full                  (timerB_io_full          ), //o
    .io_value                 (timerB_io_value         ), //o
    .io_mainClk               (io_mainClk              ), //i
    .resetCtrl_systemReset    (resetCtrl_systemReset   )  //i
  );
  InterruptCtrl interruptCtrl_1 (
    .io_inputs                (interruptCtrl_1_io_inputs        ), //i
    .io_clears                (interruptCtrl_1_io_clears        ), //i
    .io_masks                 (interruptCtrl_1_io_masks_driver  ), //i
    .io_pendings              (interruptCtrl_1_io_pendings      ), //o
    .io_mainClk               (io_mainClk                       ), //i
    .resetCtrl_systemReset    (resetCtrl_systemReset            )  //i
  );
  assign io_apb_PREADY = 1'b1;
  always @(*) begin
    io_apb_PRDATA = 32'h0;
    case(io_apb_PADDR)
      8'h0 : begin
        io_apb_PRDATA[15 : 0] = _zz_io_limit;
      end
      8'h40 : begin
        io_apb_PRDATA[1 : 0] = timerABridge_ticksEnable;
        io_apb_PRDATA[16 : 16] = timerABridge_clearsEnable;
      end
      8'h44 : begin
        io_apb_PRDATA[15 : 0] = timerA_io_limit_driver;
      end
      8'h48 : begin
        io_apb_PRDATA[15 : 0] = timerA_io_value;
      end
      8'h50 : begin
        io_apb_PRDATA[1 : 0] = timerBBridge_ticksEnable;
        io_apb_PRDATA[16 : 16] = timerBBridge_clearsEnable;
      end
      8'h54 : begin
        io_apb_PRDATA[15 : 0] = timerB_io_limit_driver;
      end
      8'h58 : begin
        io_apb_PRDATA[15 : 0] = timerB_io_value;
      end
      8'h10 : begin
        io_apb_PRDATA[1 : 0] = interruptCtrl_1_io_pendings;
      end
      8'h14 : begin
        io_apb_PRDATA[1 : 0] = interruptCtrl_1_io_masks_driver;
      end
      default : begin
      end
    endcase
  end

  assign io_apb_PSLVERROR = 1'b0;
  assign busCtrl_askWrite = ((io_apb_PSEL[0] && io_apb_PENABLE) && io_apb_PWRITE);
  assign busCtrl_askRead = ((io_apb_PSEL[0] && io_apb_PENABLE) && (! io_apb_PWRITE));
  assign busCtrl_doWrite = (((io_apb_PSEL[0] && io_apb_PENABLE) && io_apb_PREADY) && io_apb_PWRITE);
  assign busCtrl_doRead = (((io_apb_PSEL[0] && io_apb_PENABLE) && io_apb_PREADY) && (! io_apb_PWRITE));
  always @(*) begin
    _zz_io_clear = 1'b0;
    case(io_apb_PADDR)
      8'h0 : begin
        if(busCtrl_doWrite) begin
          _zz_io_clear = 1'b1;
        end
      end
      default : begin
      end
    endcase
  end

  always @(*) begin
    timerABridge_busClearing = 1'b0;
    if(when_Timer_l40) begin
      timerABridge_busClearing = 1'b1;
    end
    if(when_Timer_l44) begin
      timerABridge_busClearing = 1'b1;
    end
  end

  always @(*) begin
    when_Timer_l40 = 1'b0;
    case(io_apb_PADDR)
      8'h44 : begin
        if(busCtrl_doWrite) begin
          when_Timer_l40 = 1'b1;
        end
      end
      default : begin
      end
    endcase
  end

  always @(*) begin
    when_Timer_l44 = 1'b0;
    case(io_apb_PADDR)
      8'h48 : begin
        if(busCtrl_doWrite) begin
          when_Timer_l44 = 1'b1;
        end
      end
      default : begin
      end
    endcase
  end

  assign timerA_io_clear = (((timerABridge_clearsEnable & timerA_io_full) != 1'b0) || timerABridge_busClearing);
  assign timerA_io_tick = ((timerABridge_ticksEnable & {prescaler_1_io_overflow,1'b1}) != 2'b00);
  always @(*) begin
    timerBBridge_busClearing = 1'b0;
    if(when_Timer_l40_1) begin
      timerBBridge_busClearing = 1'b1;
    end
    if(when_Timer_l44_1) begin
      timerBBridge_busClearing = 1'b1;
    end
  end

  always @(*) begin
    when_Timer_l40_1 = 1'b0;
    case(io_apb_PADDR)
      8'h54 : begin
        if(busCtrl_doWrite) begin
          when_Timer_l40_1 = 1'b1;
        end
      end
      default : begin
      end
    endcase
  end

  always @(*) begin
    when_Timer_l44_1 = 1'b0;
    case(io_apb_PADDR)
      8'h58 : begin
        if(busCtrl_doWrite) begin
          when_Timer_l44_1 = 1'b1;
        end
      end
      default : begin
      end
    endcase
  end

  assign timerB_io_clear = (((timerBBridge_clearsEnable & timerB_io_full) != 1'b0) || timerBBridge_busClearing);
  assign timerB_io_tick = ((timerBBridge_ticksEnable & {prescaler_1_io_overflow,1'b1}) != 2'b00);
  always @(*) begin
    interruptCtrl_1_io_clears = 2'b00;
    case(io_apb_PADDR)
      8'h10 : begin
        if(busCtrl_doWrite) begin
          interruptCtrl_1_io_clears = io_apb_PWDATA[1 : 0];
        end
      end
      default : begin
      end
    endcase
  end

  always @(*) begin
    interruptCtrl_1_io_inputs[0] = timerA_io_full;
    interruptCtrl_1_io_inputs[1] = timerB_io_full;
  end

  assign io_interrupt = (interruptCtrl_1_io_pendings != 2'b00);
  always @(posedge io_mainClk or posedge resetCtrl_systemReset) begin
    if(resetCtrl_systemReset) begin
      timerABridge_ticksEnable <= 2'b00;
      timerABridge_clearsEnable <= 1'b0;
      timerBBridge_ticksEnable <= 2'b00;
      timerBBridge_clearsEnable <= 1'b0;
      interruptCtrl_1_io_masks_driver <= 2'b00;
    end else begin
      case(io_apb_PADDR)
        8'h40 : begin
          if(busCtrl_doWrite) begin
            timerABridge_ticksEnable <= io_apb_PWDATA[1 : 0];
            timerABridge_clearsEnable <= io_apb_PWDATA[16 : 16];
          end
        end
        8'h50 : begin
          if(busCtrl_doWrite) begin
            timerBBridge_ticksEnable <= io_apb_PWDATA[1 : 0];
            timerBBridge_clearsEnable <= io_apb_PWDATA[16 : 16];
          end
        end
        8'h14 : begin
          if(busCtrl_doWrite) begin
            interruptCtrl_1_io_masks_driver <= io_apb_PWDATA[1 : 0];
          end
        end
        default : begin
        end
      endcase
    end
  end

  always @(posedge io_mainClk) begin
    case(io_apb_PADDR)
      8'h0 : begin
        if(busCtrl_doWrite) begin
          _zz_io_limit <= io_apb_PWDATA[15 : 0];
        end
      end
      8'h44 : begin
        if(busCtrl_doWrite) begin
          timerA_io_limit_driver <= io_apb_PWDATA[15 : 0];
        end
      end
      8'h54 : begin
        if(busCtrl_doWrite) begin
          timerB_io_limit_driver <= io_apb_PWDATA[15 : 0];
        end
      end
      default : begin
      end
    endcase
  end


endmodule

module Apb3UartCtrl (
  input      [4:0]    io_apb_PADDR,
  input      [0:0]    io_apb_PSEL,
  input               io_apb_PENABLE,
  output              io_apb_PREADY,
  input               io_apb_PWRITE,
  input      [31:0]   io_apb_PWDATA,
  output reg [31:0]   io_apb_PRDATA,
  output              io_uart_txd,
  input               io_uart_rxd,
  output              io_interrupt,
  input               io_mainClk,
  input               resetCtrl_systemReset
);
  reg                 uartCtrl_1_io_read_queueWithOccupancy_io_pop_ready;
  wire                uartCtrl_1_io_write_ready;
  wire                uartCtrl_1_io_read_valid;
  wire       [7:0]    uartCtrl_1_io_read_payload;
  wire                uartCtrl_1_io_uart_txd;
  wire                uartCtrl_1_io_readError;
  wire                uartCtrl_1_io_readBreak;
  wire                bridge_write_streamUnbuffered_queueWithOccupancy_io_push_ready;
  wire                bridge_write_streamUnbuffered_queueWithOccupancy_io_pop_valid;
  wire       [7:0]    bridge_write_streamUnbuffered_queueWithOccupancy_io_pop_payload;
  wire       [4:0]    bridge_write_streamUnbuffered_queueWithOccupancy_io_occupancy;
  wire       [4:0]    bridge_write_streamUnbuffered_queueWithOccupancy_io_availability;
  wire                uartCtrl_1_io_read_queueWithOccupancy_io_push_ready;
  wire                uartCtrl_1_io_read_queueWithOccupancy_io_pop_valid;
  wire       [7:0]    uartCtrl_1_io_read_queueWithOccupancy_io_pop_payload;
  wire       [4:0]    uartCtrl_1_io_read_queueWithOccupancy_io_occupancy;
  wire       [4:0]    uartCtrl_1_io_read_queueWithOccupancy_io_availability;
  wire       [0:0]    _zz_bridge_misc_readError;
  wire       [0:0]    _zz_bridge_misc_readOverflowError;
  wire       [0:0]    _zz_bridge_misc_breakDetected;
  wire       [0:0]    _zz_bridge_misc_doBreak;
  wire       [0:0]    _zz_bridge_misc_doBreak_1;
  wire       [4:0]    _zz_io_apb_PRDATA;
  wire                busCtrl_askWrite;
  wire                busCtrl_askRead;
  wire                busCtrl_doWrite;
  wire                busCtrl_doRead;
  wire       [2:0]    bridge_uartConfigReg_frame_dataLength;
  wire       `UartStopType_binary_sequential_type bridge_uartConfigReg_frame_stop;
  wire       `UartParityType_binary_sequential_type bridge_uartConfigReg_frame_parity;
  reg        [19:0]   bridge_uartConfigReg_clockDivider;
  reg                 _zz_bridge_write_streamUnbuffered_valid;
  wire                bridge_write_streamUnbuffered_valid;
  wire                bridge_write_streamUnbuffered_ready;
  wire       [7:0]    bridge_write_streamUnbuffered_payload;
  reg                 bridge_read_streamBreaked_valid;
  reg                 bridge_read_streamBreaked_ready;
  wire       [7:0]    bridge_read_streamBreaked_payload;
  reg                 bridge_interruptCtrl_writeIntEnable;
  reg                 bridge_interruptCtrl_readIntEnable;
  wire                bridge_interruptCtrl_readInt;
  wire                bridge_interruptCtrl_writeInt;
  wire                bridge_interruptCtrl_interrupt;
  reg                 bridge_misc_readError;
  reg                 when_BusSlaveFactory_l335;
  wire                when_BusSlaveFactory_l337;
  reg                 bridge_misc_readOverflowError;
  reg                 when_BusSlaveFactory_l335_1;
  wire                when_BusSlaveFactory_l337_1;
  wire                uartCtrl_1_io_read_isStall;
  reg                 bridge_misc_breakDetected;
  reg                 uartCtrl_1_io_readBreak_regNext;
  wire                when_UartCtrl_l154;
  reg                 when_BusSlaveFactory_l335_2;
  wire                when_BusSlaveFactory_l337_2;
  reg                 bridge_misc_doBreak;
  reg                 when_BusSlaveFactory_l366;
  wire                when_BusSlaveFactory_l368;
  reg                 when_BusSlaveFactory_l335_3;
  wire                when_BusSlaveFactory_l337_3;
  `ifndef SYNTHESIS
  reg [23:0] bridge_uartConfigReg_frame_stop_string;
  reg [31:0] bridge_uartConfigReg_frame_parity_string;
  `endif

  function [19:0] zz_bridge_uartConfigReg_clockDivider(input dummy);
    begin
      zz_bridge_uartConfigReg_clockDivider = 20'h0;
      zz_bridge_uartConfigReg_clockDivider = 20'h00055;
    end
  endfunction
  wire [19:0] _zz_1;

  assign _zz_bridge_misc_readError = 1'b0;
  assign _zz_bridge_misc_readOverflowError = 1'b0;
  assign _zz_bridge_misc_breakDetected = 1'b0;
  assign _zz_bridge_misc_doBreak = 1'b1;
  assign _zz_bridge_misc_doBreak_1 = 1'b0;
  assign _zz_io_apb_PRDATA = (5'h10 - bridge_write_streamUnbuffered_queueWithOccupancy_io_occupancy);
  UartCtrl uartCtrl_1 (
    .io_config_frame_dataLength    (bridge_uartConfigReg_frame_dataLength                            ), //i
    .io_config_frame_stop          (bridge_uartConfigReg_frame_stop                                  ), //i
    .io_config_frame_parity        (bridge_uartConfigReg_frame_parity                                ), //i
    .io_config_clockDivider        (bridge_uartConfigReg_clockDivider                                ), //i
    .io_write_valid                (bridge_write_streamUnbuffered_queueWithOccupancy_io_pop_valid    ), //i
    .io_write_ready                (uartCtrl_1_io_write_ready                                        ), //o
    .io_write_payload              (bridge_write_streamUnbuffered_queueWithOccupancy_io_pop_payload  ), //i
    .io_read_valid                 (uartCtrl_1_io_read_valid                                         ), //o
    .io_read_ready                 (uartCtrl_1_io_read_queueWithOccupancy_io_push_ready              ), //i
    .io_read_payload               (uartCtrl_1_io_read_payload                                       ), //o
    .io_uart_txd                   (uartCtrl_1_io_uart_txd                                           ), //o
    .io_uart_rxd                   (io_uart_rxd                                                      ), //i
    .io_readError                  (uartCtrl_1_io_readError                                          ), //o
    .io_writeBreak                 (bridge_misc_doBreak                                              ), //i
    .io_readBreak                  (uartCtrl_1_io_readBreak                                          ), //o
    .io_mainClk                    (io_mainClk                                                       ), //i
    .resetCtrl_systemReset         (resetCtrl_systemReset                                            )  //i
  );
  StreamFifo bridge_write_streamUnbuffered_queueWithOccupancy (
    .io_push_valid            (bridge_write_streamUnbuffered_valid                               ), //i
    .io_push_ready            (bridge_write_streamUnbuffered_queueWithOccupancy_io_push_ready    ), //o
    .io_push_payload          (bridge_write_streamUnbuffered_payload                             ), //i
    .io_pop_valid             (bridge_write_streamUnbuffered_queueWithOccupancy_io_pop_valid     ), //o
    .io_pop_ready             (uartCtrl_1_io_write_ready                                         ), //i
    .io_pop_payload           (bridge_write_streamUnbuffered_queueWithOccupancy_io_pop_payload   ), //o
    .io_flush                 (1'b0                                                              ), //i
    .io_occupancy             (bridge_write_streamUnbuffered_queueWithOccupancy_io_occupancy     ), //o
    .io_availability          (bridge_write_streamUnbuffered_queueWithOccupancy_io_availability  ), //o
    .io_mainClk               (io_mainClk                                                        ), //i
    .resetCtrl_systemReset    (resetCtrl_systemReset                                             )  //i
  );
  StreamFifo uartCtrl_1_io_read_queueWithOccupancy (
    .io_push_valid            (uartCtrl_1_io_read_valid                               ), //i
    .io_push_ready            (uartCtrl_1_io_read_queueWithOccupancy_io_push_ready    ), //o
    .io_push_payload          (uartCtrl_1_io_read_payload                             ), //i
    .io_pop_valid             (uartCtrl_1_io_read_queueWithOccupancy_io_pop_valid     ), //o
    .io_pop_ready             (uartCtrl_1_io_read_queueWithOccupancy_io_pop_ready     ), //i
    .io_pop_payload           (uartCtrl_1_io_read_queueWithOccupancy_io_pop_payload   ), //o
    .io_flush                 (1'b0                                                   ), //i
    .io_occupancy             (uartCtrl_1_io_read_queueWithOccupancy_io_occupancy     ), //o
    .io_availability          (uartCtrl_1_io_read_queueWithOccupancy_io_availability  ), //o
    .io_mainClk               (io_mainClk                                             ), //i
    .resetCtrl_systemReset    (resetCtrl_systemReset                                  )  //i
  );
  `ifndef SYNTHESIS
  always @(*) begin
    case(bridge_uartConfigReg_frame_stop)
      `UartStopType_binary_sequential_ONE : bridge_uartConfigReg_frame_stop_string = "ONE";
      `UartStopType_binary_sequential_TWO : bridge_uartConfigReg_frame_stop_string = "TWO";
      default : bridge_uartConfigReg_frame_stop_string = "???";
    endcase
  end
  always @(*) begin
    case(bridge_uartConfigReg_frame_parity)
      `UartParityType_binary_sequential_NONE : bridge_uartConfigReg_frame_parity_string = "NONE";
      `UartParityType_binary_sequential_EVEN : bridge_uartConfigReg_frame_parity_string = "EVEN";
      `UartParityType_binary_sequential_ODD : bridge_uartConfigReg_frame_parity_string = "ODD ";
      default : bridge_uartConfigReg_frame_parity_string = "????";
    endcase
  end
  `endif

  assign io_uart_txd = uartCtrl_1_io_uart_txd;
  assign io_apb_PREADY = 1'b1;
  always @(*) begin
    io_apb_PRDATA = 32'h0;
    case(io_apb_PADDR)
      5'h0 : begin
        io_apb_PRDATA[16 : 16] = (bridge_read_streamBreaked_valid ^ 1'b0);
        io_apb_PRDATA[7 : 0] = bridge_read_streamBreaked_payload;
      end
      5'h04 : begin
        io_apb_PRDATA[20 : 16] = _zz_io_apb_PRDATA;
        io_apb_PRDATA[15 : 15] = bridge_write_streamUnbuffered_queueWithOccupancy_io_pop_valid;
        io_apb_PRDATA[28 : 24] = uartCtrl_1_io_read_queueWithOccupancy_io_occupancy;
        io_apb_PRDATA[0 : 0] = bridge_interruptCtrl_writeIntEnable;
        io_apb_PRDATA[1 : 1] = bridge_interruptCtrl_readIntEnable;
        io_apb_PRDATA[8 : 8] = bridge_interruptCtrl_writeInt;
        io_apb_PRDATA[9 : 9] = bridge_interruptCtrl_readInt;
      end
      5'h10 : begin
        io_apb_PRDATA[0 : 0] = bridge_misc_readError;
        io_apb_PRDATA[1 : 1] = bridge_misc_readOverflowError;
        io_apb_PRDATA[8 : 8] = uartCtrl_1_io_readBreak;
        io_apb_PRDATA[9 : 9] = bridge_misc_breakDetected;
      end
      default : begin
      end
    endcase
  end

  assign busCtrl_askWrite = ((io_apb_PSEL[0] && io_apb_PENABLE) && io_apb_PWRITE);
  assign busCtrl_askRead = ((io_apb_PSEL[0] && io_apb_PENABLE) && (! io_apb_PWRITE));
  assign busCtrl_doWrite = (((io_apb_PSEL[0] && io_apb_PENABLE) && io_apb_PREADY) && io_apb_PWRITE);
  assign busCtrl_doRead = (((io_apb_PSEL[0] && io_apb_PENABLE) && io_apb_PREADY) && (! io_apb_PWRITE));
  assign _zz_1 = zz_bridge_uartConfigReg_clockDivider(1'b0);
  always @(*) bridge_uartConfigReg_clockDivider = _zz_1;
  assign bridge_uartConfigReg_frame_dataLength = 3'b111;
  assign bridge_uartConfigReg_frame_parity = `UartParityType_binary_sequential_NONE;
  assign bridge_uartConfigReg_frame_stop = `UartStopType_binary_sequential_ONE;
  always @(*) begin
    _zz_bridge_write_streamUnbuffered_valid = 1'b0;
    case(io_apb_PADDR)
      5'h0 : begin
        if(busCtrl_doWrite) begin
          _zz_bridge_write_streamUnbuffered_valid = 1'b1;
        end
      end
      default : begin
      end
    endcase
  end

  assign bridge_write_streamUnbuffered_valid = _zz_bridge_write_streamUnbuffered_valid;
  assign bridge_write_streamUnbuffered_payload = io_apb_PWDATA[7 : 0];
  assign bridge_write_streamUnbuffered_ready = bridge_write_streamUnbuffered_queueWithOccupancy_io_push_ready;
  always @(*) begin
    bridge_read_streamBreaked_valid = uartCtrl_1_io_read_queueWithOccupancy_io_pop_valid;
    if(uartCtrl_1_io_readBreak) begin
      bridge_read_streamBreaked_valid = 1'b0;
    end
  end

  always @(*) begin
    uartCtrl_1_io_read_queueWithOccupancy_io_pop_ready = bridge_read_streamBreaked_ready;
    if(uartCtrl_1_io_readBreak) begin
      uartCtrl_1_io_read_queueWithOccupancy_io_pop_ready = 1'b1;
    end
  end

  assign bridge_read_streamBreaked_payload = uartCtrl_1_io_read_queueWithOccupancy_io_pop_payload;
  always @(*) begin
    bridge_read_streamBreaked_ready = 1'b0;
    case(io_apb_PADDR)
      5'h0 : begin
        if(busCtrl_doRead) begin
          bridge_read_streamBreaked_ready = 1'b1;
        end
      end
      default : begin
      end
    endcase
  end

  assign bridge_interruptCtrl_readInt = (bridge_interruptCtrl_readIntEnable && bridge_read_streamBreaked_valid);
  assign bridge_interruptCtrl_writeInt = (bridge_interruptCtrl_writeIntEnable && (! bridge_write_streamUnbuffered_queueWithOccupancy_io_pop_valid));
  assign bridge_interruptCtrl_interrupt = (bridge_interruptCtrl_readInt || bridge_interruptCtrl_writeInt);
  always @(*) begin
    when_BusSlaveFactory_l335 = 1'b0;
    case(io_apb_PADDR)
      5'h10 : begin
        if(busCtrl_doWrite) begin
          when_BusSlaveFactory_l335 = 1'b1;
        end
      end
      default : begin
      end
    endcase
  end

  assign when_BusSlaveFactory_l337 = io_apb_PWDATA[0];
  always @(*) begin
    when_BusSlaveFactory_l335_1 = 1'b0;
    case(io_apb_PADDR)
      5'h10 : begin
        if(busCtrl_doWrite) begin
          when_BusSlaveFactory_l335_1 = 1'b1;
        end
      end
      default : begin
      end
    endcase
  end

  assign when_BusSlaveFactory_l337_1 = io_apb_PWDATA[1];
  assign uartCtrl_1_io_read_isStall = (uartCtrl_1_io_read_valid && (! uartCtrl_1_io_read_queueWithOccupancy_io_push_ready));
  assign when_UartCtrl_l154 = (uartCtrl_1_io_readBreak && (! uartCtrl_1_io_readBreak_regNext));
  always @(*) begin
    when_BusSlaveFactory_l335_2 = 1'b0;
    case(io_apb_PADDR)
      5'h10 : begin
        if(busCtrl_doWrite) begin
          when_BusSlaveFactory_l335_2 = 1'b1;
        end
      end
      default : begin
      end
    endcase
  end

  assign when_BusSlaveFactory_l337_2 = io_apb_PWDATA[9];
  always @(*) begin
    when_BusSlaveFactory_l366 = 1'b0;
    case(io_apb_PADDR)
      5'h10 : begin
        if(busCtrl_doWrite) begin
          when_BusSlaveFactory_l366 = 1'b1;
        end
      end
      default : begin
      end
    endcase
  end

  assign when_BusSlaveFactory_l368 = io_apb_PWDATA[10];
  always @(*) begin
    when_BusSlaveFactory_l335_3 = 1'b0;
    case(io_apb_PADDR)
      5'h10 : begin
        if(busCtrl_doWrite) begin
          when_BusSlaveFactory_l335_3 = 1'b1;
        end
      end
      default : begin
      end
    endcase
  end

  assign when_BusSlaveFactory_l337_3 = io_apb_PWDATA[11];
  assign io_interrupt = bridge_interruptCtrl_interrupt;
  always @(posedge io_mainClk or posedge resetCtrl_systemReset) begin
    if(resetCtrl_systemReset) begin
      bridge_interruptCtrl_writeIntEnable <= 1'b0;
      bridge_interruptCtrl_readIntEnable <= 1'b0;
      bridge_misc_readError <= 1'b0;
      bridge_misc_readOverflowError <= 1'b0;
      bridge_misc_breakDetected <= 1'b0;
      bridge_misc_doBreak <= 1'b0;
    end else begin
      if(when_BusSlaveFactory_l335) begin
        if(when_BusSlaveFactory_l337) begin
          bridge_misc_readError <= _zz_bridge_misc_readError[0];
        end
      end
      if(uartCtrl_1_io_readError) begin
        bridge_misc_readError <= 1'b1;
      end
      if(when_BusSlaveFactory_l335_1) begin
        if(when_BusSlaveFactory_l337_1) begin
          bridge_misc_readOverflowError <= _zz_bridge_misc_readOverflowError[0];
        end
      end
      if(uartCtrl_1_io_read_isStall) begin
        bridge_misc_readOverflowError <= 1'b1;
      end
      if(when_UartCtrl_l154) begin
        bridge_misc_breakDetected <= 1'b1;
      end
      if(when_BusSlaveFactory_l335_2) begin
        if(when_BusSlaveFactory_l337_2) begin
          bridge_misc_breakDetected <= _zz_bridge_misc_breakDetected[0];
        end
      end
      if(when_BusSlaveFactory_l366) begin
        if(when_BusSlaveFactory_l368) begin
          bridge_misc_doBreak <= _zz_bridge_misc_doBreak[0];
        end
      end
      if(when_BusSlaveFactory_l335_3) begin
        if(when_BusSlaveFactory_l337_3) begin
          bridge_misc_doBreak <= _zz_bridge_misc_doBreak_1[0];
        end
      end
      case(io_apb_PADDR)
        5'h04 : begin
          if(busCtrl_doWrite) begin
            bridge_interruptCtrl_writeIntEnable <= io_apb_PWDATA[0];
            bridge_interruptCtrl_readIntEnable <= io_apb_PWDATA[1];
          end
        end
        default : begin
        end
      endcase
    end
  end

  always @(posedge io_mainClk) begin
    uartCtrl_1_io_readBreak_regNext <= uartCtrl_1_io_readBreak;
  end


endmodule

module Apb3Gpio (
  input      [3:0]    io_apb_PADDR,
  input      [0:0]    io_apb_PSEL,
  input               io_apb_PENABLE,
  output              io_apb_PREADY,
  input               io_apb_PWRITE,
  input      [31:0]   io_apb_PWDATA,
  output reg [31:0]   io_apb_PRDATA,
  output              io_apb_PSLVERROR,
  input      [15:0]   io_gpio_read,
  output     [15:0]   io_gpio_write,
  output     [15:0]   io_gpio_writeEnable,
  output     [15:0]   io_value,
  input               io_mainClk,
  input               resetCtrl_systemReset
);
  wire       [15:0]   io_gpio_read_buffercc_io_dataOut;
  wire                ctrl_askWrite;
  wire                ctrl_askRead;
  wire                ctrl_doWrite;
  wire                ctrl_doRead;
  reg        [15:0]   io_gpio_write_driver;
  reg        [15:0]   io_gpio_writeEnable_driver;

  BufferCC_4 io_gpio_read_buffercc (
    .io_dataIn                (io_gpio_read                      ), //i
    .io_dataOut               (io_gpio_read_buffercc_io_dataOut  ), //o
    .io_mainClk               (io_mainClk                        ), //i
    .resetCtrl_systemReset    (resetCtrl_systemReset             )  //i
  );
  assign io_value = io_gpio_read_buffercc_io_dataOut;
  assign io_apb_PREADY = 1'b1;
  always @(*) begin
    io_apb_PRDATA = 32'h0;
    case(io_apb_PADDR)
      4'b0000 : begin
        io_apb_PRDATA[15 : 0] = io_value;
      end
      4'b0100 : begin
        io_apb_PRDATA[15 : 0] = io_gpio_write_driver;
      end
      4'b1000 : begin
        io_apb_PRDATA[15 : 0] = io_gpio_writeEnable_driver;
      end
      default : begin
      end
    endcase
  end

  assign io_apb_PSLVERROR = 1'b0;
  assign ctrl_askWrite = ((io_apb_PSEL[0] && io_apb_PENABLE) && io_apb_PWRITE);
  assign ctrl_askRead = ((io_apb_PSEL[0] && io_apb_PENABLE) && (! io_apb_PWRITE));
  assign ctrl_doWrite = (((io_apb_PSEL[0] && io_apb_PENABLE) && io_apb_PREADY) && io_apb_PWRITE);
  assign ctrl_doRead = (((io_apb_PSEL[0] && io_apb_PENABLE) && io_apb_PREADY) && (! io_apb_PWRITE));
  assign io_gpio_write = io_gpio_write_driver;
  assign io_gpio_writeEnable = io_gpio_writeEnable_driver;
  always @(posedge io_mainClk or posedge resetCtrl_systemReset) begin
    if(resetCtrl_systemReset) begin
      io_gpio_writeEnable_driver <= 16'h0;
    end else begin
      case(io_apb_PADDR)
        4'b1000 : begin
          if(ctrl_doWrite) begin
            io_gpio_writeEnable_driver <= io_apb_PWDATA[15 : 0];
          end
        end
        default : begin
        end
      endcase
    end
  end

  always @(posedge io_mainClk) begin
    case(io_apb_PADDR)
      4'b0100 : begin
        if(ctrl_doWrite) begin
          io_gpio_write_driver <= io_apb_PWDATA[15 : 0];
        end
      end
      default : begin
      end
    endcase
  end


endmodule

module PipelinedMemoryBusToApbBridge (
  input               io_pipelinedMemoryBus_cmd_valid,
  output              io_pipelinedMemoryBus_cmd_ready,
  input               io_pipelinedMemoryBus_cmd_payload_write,
  input      [31:0]   io_pipelinedMemoryBus_cmd_payload_address,
  input      [31:0]   io_pipelinedMemoryBus_cmd_payload_data,
  input      [3:0]    io_pipelinedMemoryBus_cmd_payload_mask,
  output              io_pipelinedMemoryBus_rsp_valid,
  output     [31:0]   io_pipelinedMemoryBus_rsp_payload_data,
  output     [19:0]   io_apb_PADDR,
  output     [0:0]    io_apb_PSEL,
  output              io_apb_PENABLE,
  input               io_apb_PREADY,
  output              io_apb_PWRITE,
  output     [31:0]   io_apb_PWDATA,
  input      [31:0]   io_apb_PRDATA,
  input               io_apb_PSLVERROR,
  input               io_mainClk,
  input               resetCtrl_systemReset
);
  wire                pipelinedMemoryBusStage_cmd_valid;
  reg                 pipelinedMemoryBusStage_cmd_ready;
  wire                pipelinedMemoryBusStage_cmd_payload_write;
  wire       [31:0]   pipelinedMemoryBusStage_cmd_payload_address;
  wire       [31:0]   pipelinedMemoryBusStage_cmd_payload_data;
  wire       [3:0]    pipelinedMemoryBusStage_cmd_payload_mask;
  reg                 pipelinedMemoryBusStage_rsp_valid;
  wire       [31:0]   pipelinedMemoryBusStage_rsp_payload_data;
  wire                io_pipelinedMemoryBus_cmd_halfPipe_valid;
  wire                io_pipelinedMemoryBus_cmd_halfPipe_ready;
  wire                io_pipelinedMemoryBus_cmd_halfPipe_payload_write;
  wire       [31:0]   io_pipelinedMemoryBus_cmd_halfPipe_payload_address;
  wire       [31:0]   io_pipelinedMemoryBus_cmd_halfPipe_payload_data;
  wire       [3:0]    io_pipelinedMemoryBus_cmd_halfPipe_payload_mask;
  reg                 io_pipelinedMemoryBus_cmd_rValid;
  wire                io_pipelinedMemoryBus_cmd_halfPipe_fire;
  reg                 io_pipelinedMemoryBus_cmd_rData_write;
  reg        [31:0]   io_pipelinedMemoryBus_cmd_rData_address;
  reg        [31:0]   io_pipelinedMemoryBus_cmd_rData_data;
  reg        [3:0]    io_pipelinedMemoryBus_cmd_rData_mask;
  reg                 pipelinedMemoryBusStage_rsp_regNext_valid;
  reg        [31:0]   pipelinedMemoryBusStage_rsp_regNext_payload_data;
  reg                 state;
  wire                when_PipelinedMemoryBus_l369;

  assign io_pipelinedMemoryBus_cmd_halfPipe_fire = (io_pipelinedMemoryBus_cmd_halfPipe_valid && io_pipelinedMemoryBus_cmd_halfPipe_ready);
  assign io_pipelinedMemoryBus_cmd_ready = (! io_pipelinedMemoryBus_cmd_rValid);
  assign io_pipelinedMemoryBus_cmd_halfPipe_valid = io_pipelinedMemoryBus_cmd_rValid;
  assign io_pipelinedMemoryBus_cmd_halfPipe_payload_write = io_pipelinedMemoryBus_cmd_rData_write;
  assign io_pipelinedMemoryBus_cmd_halfPipe_payload_address = io_pipelinedMemoryBus_cmd_rData_address;
  assign io_pipelinedMemoryBus_cmd_halfPipe_payload_data = io_pipelinedMemoryBus_cmd_rData_data;
  assign io_pipelinedMemoryBus_cmd_halfPipe_payload_mask = io_pipelinedMemoryBus_cmd_rData_mask;
  assign pipelinedMemoryBusStage_cmd_valid = io_pipelinedMemoryBus_cmd_halfPipe_valid;
  assign io_pipelinedMemoryBus_cmd_halfPipe_ready = pipelinedMemoryBusStage_cmd_ready;
  assign pipelinedMemoryBusStage_cmd_payload_write = io_pipelinedMemoryBus_cmd_halfPipe_payload_write;
  assign pipelinedMemoryBusStage_cmd_payload_address = io_pipelinedMemoryBus_cmd_halfPipe_payload_address;
  assign pipelinedMemoryBusStage_cmd_payload_data = io_pipelinedMemoryBus_cmd_halfPipe_payload_data;
  assign pipelinedMemoryBusStage_cmd_payload_mask = io_pipelinedMemoryBus_cmd_halfPipe_payload_mask;
  assign io_pipelinedMemoryBus_rsp_valid = pipelinedMemoryBusStage_rsp_regNext_valid;
  assign io_pipelinedMemoryBus_rsp_payload_data = pipelinedMemoryBusStage_rsp_regNext_payload_data;
  always @(*) begin
    pipelinedMemoryBusStage_cmd_ready = 1'b0;
    if(!when_PipelinedMemoryBus_l369) begin
      if(io_apb_PREADY) begin
        pipelinedMemoryBusStage_cmd_ready = 1'b1;
      end
    end
  end

  assign io_apb_PSEL[0] = pipelinedMemoryBusStage_cmd_valid;
  assign io_apb_PENABLE = state;
  assign io_apb_PWRITE = pipelinedMemoryBusStage_cmd_payload_write;
  assign io_apb_PADDR = pipelinedMemoryBusStage_cmd_payload_address[19:0];
  assign io_apb_PWDATA = pipelinedMemoryBusStage_cmd_payload_data;
  always @(*) begin
    pipelinedMemoryBusStage_rsp_valid = 1'b0;
    if(!when_PipelinedMemoryBus_l369) begin
      if(io_apb_PREADY) begin
        pipelinedMemoryBusStage_rsp_valid = (! pipelinedMemoryBusStage_cmd_payload_write);
      end
    end
  end

  assign pipelinedMemoryBusStage_rsp_payload_data = io_apb_PRDATA;
  assign when_PipelinedMemoryBus_l369 = (! state);
  always @(posedge io_mainClk or posedge resetCtrl_systemReset) begin
    if(resetCtrl_systemReset) begin
      io_pipelinedMemoryBus_cmd_rValid <= 1'b0;
      pipelinedMemoryBusStage_rsp_regNext_valid <= 1'b0;
      state <= 1'b0;
    end else begin
      if(io_pipelinedMemoryBus_cmd_valid) begin
        io_pipelinedMemoryBus_cmd_rValid <= 1'b1;
      end
      if(io_pipelinedMemoryBus_cmd_halfPipe_fire) begin
        io_pipelinedMemoryBus_cmd_rValid <= 1'b0;
      end
      pipelinedMemoryBusStage_rsp_regNext_valid <= pipelinedMemoryBusStage_rsp_valid;
      if(when_PipelinedMemoryBus_l369) begin
        state <= pipelinedMemoryBusStage_cmd_valid;
      end else begin
        if(io_apb_PREADY) begin
          state <= 1'b0;
        end
      end
    end
  end

  always @(posedge io_mainClk) begin
    if(io_pipelinedMemoryBus_cmd_ready) begin
      io_pipelinedMemoryBus_cmd_rData_write <= io_pipelinedMemoryBus_cmd_payload_write;
      io_pipelinedMemoryBus_cmd_rData_address <= io_pipelinedMemoryBus_cmd_payload_address;
      io_pipelinedMemoryBus_cmd_rData_data <= io_pipelinedMemoryBus_cmd_payload_data;
      io_pipelinedMemoryBus_cmd_rData_mask <= io_pipelinedMemoryBus_cmd_payload_mask;
    end
    pipelinedMemoryBusStage_rsp_regNext_payload_data <= pipelinedMemoryBusStage_rsp_payload_data;
  end


endmodule

module PipelinedMemoryBusRam (
  input               io_bus_cmd_valid,
  output              io_bus_cmd_ready,
  input               io_bus_cmd_payload_write,
  input      [31:0]   io_bus_cmd_payload_address,
  input      [31:0]   io_bus_cmd_payload_data,
  input      [3:0]    io_bus_cmd_payload_mask,
  output              io_bus_rsp_valid,
  output     [31:0]   io_bus_rsp_payload_data,
  input               io_mainClk,
  input               resetCtrl_systemReset
);
  reg        [31:0]   _zz_ram_port0;
  wire       [14:0]   _zz_ram_port;
  wire       [14:0]   _zz_io_bus_rsp_payload_data_2;
  wire                io_bus_cmd_fire;
  reg                 _zz_io_bus_rsp_valid;
  wire       [29:0]   _zz_io_bus_rsp_payload_data;
  wire       [31:0]   _zz_io_bus_rsp_payload_data_1;
  reg [7:0] ram_symbol0 [0:32767];
  reg [7:0] ram_symbol1 [0:32767];
  reg [7:0] ram_symbol2 [0:32767];
  reg [7:0] ram_symbol3 [0:32767];
  reg [7:0] _zz_ramsymbol_read;
  reg [7:0] _zz_ramsymbol_read_1;
  reg [7:0] _zz_ramsymbol_read_2;
  reg [7:0] _zz_ramsymbol_read_3;

  assign _zz_io_bus_rsp_payload_data_2 = _zz_io_bus_rsp_payload_data[14:0];
  initial begin
    $readmemb("DecaMuraxSoc.v_toplevel_murax_system_ram_ram_symbol0.bin",ram_symbol0);
    $readmemb("DecaMuraxSoc.v_toplevel_murax_system_ram_ram_symbol1.bin",ram_symbol1);
    $readmemb("DecaMuraxSoc.v_toplevel_murax_system_ram_ram_symbol2.bin",ram_symbol2);
    $readmemb("DecaMuraxSoc.v_toplevel_murax_system_ram_ram_symbol3.bin",ram_symbol3);
  end
  always @(*) begin
    _zz_ram_port0 = {_zz_ramsymbol_read_3, _zz_ramsymbol_read_2, _zz_ramsymbol_read_1, _zz_ramsymbol_read};
  end
  always @(posedge io_mainClk) begin
    if(io_bus_cmd_valid) begin
      _zz_ramsymbol_read <= ram_symbol0[_zz_io_bus_rsp_payload_data_2];
      _zz_ramsymbol_read_1 <= ram_symbol1[_zz_io_bus_rsp_payload_data_2];
      _zz_ramsymbol_read_2 <= ram_symbol2[_zz_io_bus_rsp_payload_data_2];
      _zz_ramsymbol_read_3 <= ram_symbol3[_zz_io_bus_rsp_payload_data_2];
    end
  end

  always @(posedge io_mainClk) begin
    if(io_bus_cmd_payload_mask[0] && io_bus_cmd_valid && io_bus_cmd_payload_write ) begin
      ram_symbol0[_zz_io_bus_rsp_payload_data_2] <= _zz_io_bus_rsp_payload_data_1[7 : 0];
    end
    if(io_bus_cmd_payload_mask[1] && io_bus_cmd_valid && io_bus_cmd_payload_write ) begin
      ram_symbol1[_zz_io_bus_rsp_payload_data_2] <= _zz_io_bus_rsp_payload_data_1[15 : 8];
    end
    if(io_bus_cmd_payload_mask[2] && io_bus_cmd_valid && io_bus_cmd_payload_write ) begin
      ram_symbol2[_zz_io_bus_rsp_payload_data_2] <= _zz_io_bus_rsp_payload_data_1[23 : 16];
    end
    if(io_bus_cmd_payload_mask[3] && io_bus_cmd_valid && io_bus_cmd_payload_write ) begin
      ram_symbol3[_zz_io_bus_rsp_payload_data_2] <= _zz_io_bus_rsp_payload_data_1[31 : 24];
    end
  end

  assign io_bus_cmd_fire = (io_bus_cmd_valid && io_bus_cmd_ready);
  assign io_bus_rsp_valid = _zz_io_bus_rsp_valid;
  assign _zz_io_bus_rsp_payload_data = (io_bus_cmd_payload_address >>> 2);
  assign _zz_io_bus_rsp_payload_data_1 = io_bus_cmd_payload_data;
  assign io_bus_rsp_payload_data = _zz_ram_port0;
  assign io_bus_cmd_ready = 1'b1;
  always @(posedge io_mainClk or posedge resetCtrl_systemReset) begin
    if(resetCtrl_systemReset) begin
      _zz_io_bus_rsp_valid <= 1'b0;
    end else begin
      _zz_io_bus_rsp_valid <= (io_bus_cmd_fire && (! io_bus_cmd_payload_write));
    end
  end


endmodule

module SystemDebugger (
  input               io_remote_cmd_valid,
  output              io_remote_cmd_ready,
  input               io_remote_cmd_payload_last,
  input      [0:0]    io_remote_cmd_payload_fragment,
  output              io_remote_rsp_valid,
  input               io_remote_rsp_ready,
  output              io_remote_rsp_payload_error,
  output     [31:0]   io_remote_rsp_payload_data,
  output              io_mem_cmd_valid,
  input               io_mem_cmd_ready,
  output     [31:0]   io_mem_cmd_payload_address,
  output     [31:0]   io_mem_cmd_payload_data,
  output              io_mem_cmd_payload_wr,
  output     [1:0]    io_mem_cmd_payload_size,
  input               io_mem_rsp_valid,
  input      [31:0]   io_mem_rsp_payload,
  input               io_mainClk,
  input               resetCtrl_mainClkReset
);
  reg        [66:0]   dispatcher_dataShifter;
  reg                 dispatcher_dataLoaded;
  reg        [7:0]    dispatcher_headerShifter;
  wire       [7:0]    dispatcher_header;
  reg                 dispatcher_headerLoaded;
  reg        [2:0]    dispatcher_counter;
  wire                when_Fragment_l346;
  wire                when_Fragment_l349;
  wire       [66:0]   _zz_io_mem_cmd_payload_address;
  wire                io_mem_cmd_isStall;
  wire                when_Fragment_l372;

  assign dispatcher_header = dispatcher_headerShifter[7 : 0];
  assign when_Fragment_l346 = (dispatcher_headerLoaded == 1'b0);
  assign when_Fragment_l349 = (dispatcher_counter == 3'b111);
  assign io_remote_cmd_ready = (! dispatcher_dataLoaded);
  assign _zz_io_mem_cmd_payload_address = dispatcher_dataShifter[66 : 0];
  assign io_mem_cmd_payload_address = _zz_io_mem_cmd_payload_address[31 : 0];
  assign io_mem_cmd_payload_data = _zz_io_mem_cmd_payload_address[63 : 32];
  assign io_mem_cmd_payload_wr = _zz_io_mem_cmd_payload_address[64];
  assign io_mem_cmd_payload_size = _zz_io_mem_cmd_payload_address[66 : 65];
  assign io_mem_cmd_valid = (dispatcher_dataLoaded && (dispatcher_header == 8'h0));
  assign io_mem_cmd_isStall = (io_mem_cmd_valid && (! io_mem_cmd_ready));
  assign when_Fragment_l372 = ((dispatcher_headerLoaded && dispatcher_dataLoaded) && (! io_mem_cmd_isStall));
  assign io_remote_rsp_valid = io_mem_rsp_valid;
  assign io_remote_rsp_payload_error = 1'b0;
  assign io_remote_rsp_payload_data = io_mem_rsp_payload;
  always @(posedge io_mainClk or posedge resetCtrl_mainClkReset) begin
    if(resetCtrl_mainClkReset) begin
      dispatcher_dataLoaded <= 1'b0;
      dispatcher_headerLoaded <= 1'b0;
      dispatcher_counter <= 3'b000;
    end else begin
      if(io_remote_cmd_valid) begin
        if(when_Fragment_l346) begin
          dispatcher_counter <= (dispatcher_counter + 3'b001);
          if(when_Fragment_l349) begin
            dispatcher_headerLoaded <= 1'b1;
          end
        end
        if(io_remote_cmd_payload_last) begin
          dispatcher_headerLoaded <= 1'b1;
          dispatcher_dataLoaded <= 1'b1;
          dispatcher_counter <= 3'b000;
        end
      end
      if(when_Fragment_l372) begin
        dispatcher_headerLoaded <= 1'b0;
        dispatcher_dataLoaded <= 1'b0;
      end
    end
  end

  always @(posedge io_mainClk) begin
    if(io_remote_cmd_valid) begin
      if(when_Fragment_l346) begin
        dispatcher_headerShifter <= ({io_remote_cmd_payload_fragment,dispatcher_headerShifter} >>> 1);
      end else begin
        dispatcher_dataShifter <= ({io_remote_cmd_payload_fragment,dispatcher_dataShifter} >>> 1);
      end
    end
  end


endmodule

module JtagBridge (
  input               io_jtag_tms,
  input               io_jtag_tdi,
  output              io_jtag_tdo,
  input               io_jtag_tck,
  output              io_remote_cmd_valid,
  input               io_remote_cmd_ready,
  output              io_remote_cmd_payload_last,
  output     [0:0]    io_remote_cmd_payload_fragment,
  input               io_remote_rsp_valid,
  output              io_remote_rsp_ready,
  input               io_remote_rsp_payload_error,
  input      [31:0]   io_remote_rsp_payload_data,
  input               io_mainClk,
  input               resetCtrl_mainClkReset
);
  wire                flowCCByToggle_1_io_input_payload_last;
  wire                flowCCByToggle_1_io_output_valid;
  wire                flowCCByToggle_1_io_output_payload_last;
  wire       [0:0]    flowCCByToggle_1_io_output_payload_fragment;
  wire       [1:0]    _zz_jtag_tap_instructionShift;
  wire                system_cmd_valid;
  wire                system_cmd_payload_last;
  wire       [0:0]    system_cmd_payload_fragment;
  (* async_reg = "true" *) reg                 system_rsp_valid;
  (* async_reg = "true" *) reg                 system_rsp_payload_error;
  (* async_reg = "true" *) reg        [31:0]   system_rsp_payload_data;
  wire                io_remote_rsp_fire;
  wire       `JtagState_binary_sequential_type jtag_tap_fsm_stateNext;
  reg        `JtagState_binary_sequential_type jtag_tap_fsm_state = `JtagState_binary_sequential_RESET;
  reg        `JtagState_binary_sequential_type _zz_jtag_tap_fsm_stateNext;
  reg        [3:0]    jtag_tap_instruction;
  reg        [3:0]    jtag_tap_instructionShift;
  reg                 jtag_tap_bypass;
  reg                 jtag_tap_tdoUnbufferd;
  reg                 jtag_tap_tdoDr;
  wire                jtag_tap_tdoIr;
  reg                 jtag_tap_tdoUnbufferd_regNext;
  wire                _zz_1;
  reg        [31:0]   _zz_jtag_tap_tdoDr;
  wire                when_JtagTap_l115;
  wire                _zz_io_input_valid;
  wire                _zz_io_input_valid_1;
  wire       [0:0]    _zz_io_input_payload_fragment;
  reg                 _zz_io_input_valid_2;
  reg                 _zz_io_input_payload_fragment_1;
  wire                _zz_2;
  reg        [33:0]   _zz_jtag_tap_tdoDr_1;
  `ifndef SYNTHESIS
  reg [79:0] jtag_tap_fsm_stateNext_string;
  reg [79:0] jtag_tap_fsm_state_string;
  reg [79:0] _zz_jtag_tap_fsm_stateNext_string;
  `endif


  assign _zz_jtag_tap_instructionShift = 2'b01;
  FlowCCByToggle flowCCByToggle_1 (
    .io_input_valid                (_zz_io_input_valid_2                         ), //i
    .io_input_payload_last         (flowCCByToggle_1_io_input_payload_last       ), //i
    .io_input_payload_fragment     (_zz_io_input_payload_fragment                ), //i
    .io_output_valid               (flowCCByToggle_1_io_output_valid             ), //o
    .io_output_payload_last        (flowCCByToggle_1_io_output_payload_last      ), //o
    .io_output_payload_fragment    (flowCCByToggle_1_io_output_payload_fragment  ), //o
    .io_jtag_tck                   (io_jtag_tck                                  ), //i
    .io_mainClk                    (io_mainClk                                   ), //i
    .resetCtrl_mainClkReset        (resetCtrl_mainClkReset                       )  //i
  );
  `ifndef SYNTHESIS
  always @(*) begin
    case(jtag_tap_fsm_stateNext)
      `JtagState_binary_sequential_RESET : jtag_tap_fsm_stateNext_string = "RESET     ";
      `JtagState_binary_sequential_IDLE : jtag_tap_fsm_stateNext_string = "IDLE      ";
      `JtagState_binary_sequential_IR_SELECT : jtag_tap_fsm_stateNext_string = "IR_SELECT ";
      `JtagState_binary_sequential_IR_CAPTURE : jtag_tap_fsm_stateNext_string = "IR_CAPTURE";
      `JtagState_binary_sequential_IR_SHIFT : jtag_tap_fsm_stateNext_string = "IR_SHIFT  ";
      `JtagState_binary_sequential_IR_EXIT1 : jtag_tap_fsm_stateNext_string = "IR_EXIT1  ";
      `JtagState_binary_sequential_IR_PAUSE : jtag_tap_fsm_stateNext_string = "IR_PAUSE  ";
      `JtagState_binary_sequential_IR_EXIT2 : jtag_tap_fsm_stateNext_string = "IR_EXIT2  ";
      `JtagState_binary_sequential_IR_UPDATE : jtag_tap_fsm_stateNext_string = "IR_UPDATE ";
      `JtagState_binary_sequential_DR_SELECT : jtag_tap_fsm_stateNext_string = "DR_SELECT ";
      `JtagState_binary_sequential_DR_CAPTURE : jtag_tap_fsm_stateNext_string = "DR_CAPTURE";
      `JtagState_binary_sequential_DR_SHIFT : jtag_tap_fsm_stateNext_string = "DR_SHIFT  ";
      `JtagState_binary_sequential_DR_EXIT1 : jtag_tap_fsm_stateNext_string = "DR_EXIT1  ";
      `JtagState_binary_sequential_DR_PAUSE : jtag_tap_fsm_stateNext_string = "DR_PAUSE  ";
      `JtagState_binary_sequential_DR_EXIT2 : jtag_tap_fsm_stateNext_string = "DR_EXIT2  ";
      `JtagState_binary_sequential_DR_UPDATE : jtag_tap_fsm_stateNext_string = "DR_UPDATE ";
      default : jtag_tap_fsm_stateNext_string = "??????????";
    endcase
  end
  always @(*) begin
    case(jtag_tap_fsm_state)
      `JtagState_binary_sequential_RESET : jtag_tap_fsm_state_string = "RESET     ";
      `JtagState_binary_sequential_IDLE : jtag_tap_fsm_state_string = "IDLE      ";
      `JtagState_binary_sequential_IR_SELECT : jtag_tap_fsm_state_string = "IR_SELECT ";
      `JtagState_binary_sequential_IR_CAPTURE : jtag_tap_fsm_state_string = "IR_CAPTURE";
      `JtagState_binary_sequential_IR_SHIFT : jtag_tap_fsm_state_string = "IR_SHIFT  ";
      `JtagState_binary_sequential_IR_EXIT1 : jtag_tap_fsm_state_string = "IR_EXIT1  ";
      `JtagState_binary_sequential_IR_PAUSE : jtag_tap_fsm_state_string = "IR_PAUSE  ";
      `JtagState_binary_sequential_IR_EXIT2 : jtag_tap_fsm_state_string = "IR_EXIT2  ";
      `JtagState_binary_sequential_IR_UPDATE : jtag_tap_fsm_state_string = "IR_UPDATE ";
      `JtagState_binary_sequential_DR_SELECT : jtag_tap_fsm_state_string = "DR_SELECT ";
      `JtagState_binary_sequential_DR_CAPTURE : jtag_tap_fsm_state_string = "DR_CAPTURE";
      `JtagState_binary_sequential_DR_SHIFT : jtag_tap_fsm_state_string = "DR_SHIFT  ";
      `JtagState_binary_sequential_DR_EXIT1 : jtag_tap_fsm_state_string = "DR_EXIT1  ";
      `JtagState_binary_sequential_DR_PAUSE : jtag_tap_fsm_state_string = "DR_PAUSE  ";
      `JtagState_binary_sequential_DR_EXIT2 : jtag_tap_fsm_state_string = "DR_EXIT2  ";
      `JtagState_binary_sequential_DR_UPDATE : jtag_tap_fsm_state_string = "DR_UPDATE ";
      default : jtag_tap_fsm_state_string = "??????????";
    endcase
  end
  always @(*) begin
    case(_zz_jtag_tap_fsm_stateNext)
      `JtagState_binary_sequential_RESET : _zz_jtag_tap_fsm_stateNext_string = "RESET     ";
      `JtagState_binary_sequential_IDLE : _zz_jtag_tap_fsm_stateNext_string = "IDLE      ";
      `JtagState_binary_sequential_IR_SELECT : _zz_jtag_tap_fsm_stateNext_string = "IR_SELECT ";
      `JtagState_binary_sequential_IR_CAPTURE : _zz_jtag_tap_fsm_stateNext_string = "IR_CAPTURE";
      `JtagState_binary_sequential_IR_SHIFT : _zz_jtag_tap_fsm_stateNext_string = "IR_SHIFT  ";
      `JtagState_binary_sequential_IR_EXIT1 : _zz_jtag_tap_fsm_stateNext_string = "IR_EXIT1  ";
      `JtagState_binary_sequential_IR_PAUSE : _zz_jtag_tap_fsm_stateNext_string = "IR_PAUSE  ";
      `JtagState_binary_sequential_IR_EXIT2 : _zz_jtag_tap_fsm_stateNext_string = "IR_EXIT2  ";
      `JtagState_binary_sequential_IR_UPDATE : _zz_jtag_tap_fsm_stateNext_string = "IR_UPDATE ";
      `JtagState_binary_sequential_DR_SELECT : _zz_jtag_tap_fsm_stateNext_string = "DR_SELECT ";
      `JtagState_binary_sequential_DR_CAPTURE : _zz_jtag_tap_fsm_stateNext_string = "DR_CAPTURE";
      `JtagState_binary_sequential_DR_SHIFT : _zz_jtag_tap_fsm_stateNext_string = "DR_SHIFT  ";
      `JtagState_binary_sequential_DR_EXIT1 : _zz_jtag_tap_fsm_stateNext_string = "DR_EXIT1  ";
      `JtagState_binary_sequential_DR_PAUSE : _zz_jtag_tap_fsm_stateNext_string = "DR_PAUSE  ";
      `JtagState_binary_sequential_DR_EXIT2 : _zz_jtag_tap_fsm_stateNext_string = "DR_EXIT2  ";
      `JtagState_binary_sequential_DR_UPDATE : _zz_jtag_tap_fsm_stateNext_string = "DR_UPDATE ";
      default : _zz_jtag_tap_fsm_stateNext_string = "??????????";
    endcase
  end
  `endif

  assign io_remote_cmd_valid = system_cmd_valid;
  assign io_remote_cmd_payload_last = system_cmd_payload_last;
  assign io_remote_cmd_payload_fragment = system_cmd_payload_fragment;
  assign io_remote_rsp_fire = (io_remote_rsp_valid && io_remote_rsp_ready);
  assign io_remote_rsp_ready = 1'b1;
  always @(*) begin
    case(jtag_tap_fsm_state)
      `JtagState_binary_sequential_IDLE : begin
        _zz_jtag_tap_fsm_stateNext = (io_jtag_tms ? `JtagState_binary_sequential_DR_SELECT : `JtagState_binary_sequential_IDLE);
      end
      `JtagState_binary_sequential_IR_SELECT : begin
        _zz_jtag_tap_fsm_stateNext = (io_jtag_tms ? `JtagState_binary_sequential_RESET : `JtagState_binary_sequential_IR_CAPTURE);
      end
      `JtagState_binary_sequential_IR_CAPTURE : begin
        _zz_jtag_tap_fsm_stateNext = (io_jtag_tms ? `JtagState_binary_sequential_IR_EXIT1 : `JtagState_binary_sequential_IR_SHIFT);
      end
      `JtagState_binary_sequential_IR_SHIFT : begin
        _zz_jtag_tap_fsm_stateNext = (io_jtag_tms ? `JtagState_binary_sequential_IR_EXIT1 : `JtagState_binary_sequential_IR_SHIFT);
      end
      `JtagState_binary_sequential_IR_EXIT1 : begin
        _zz_jtag_tap_fsm_stateNext = (io_jtag_tms ? `JtagState_binary_sequential_IR_UPDATE : `JtagState_binary_sequential_IR_PAUSE);
      end
      `JtagState_binary_sequential_IR_PAUSE : begin
        _zz_jtag_tap_fsm_stateNext = (io_jtag_tms ? `JtagState_binary_sequential_IR_EXIT2 : `JtagState_binary_sequential_IR_PAUSE);
      end
      `JtagState_binary_sequential_IR_EXIT2 : begin
        _zz_jtag_tap_fsm_stateNext = (io_jtag_tms ? `JtagState_binary_sequential_IR_UPDATE : `JtagState_binary_sequential_IR_SHIFT);
      end
      `JtagState_binary_sequential_IR_UPDATE : begin
        _zz_jtag_tap_fsm_stateNext = (io_jtag_tms ? `JtagState_binary_sequential_DR_SELECT : `JtagState_binary_sequential_IDLE);
      end
      `JtagState_binary_sequential_DR_SELECT : begin
        _zz_jtag_tap_fsm_stateNext = (io_jtag_tms ? `JtagState_binary_sequential_IR_SELECT : `JtagState_binary_sequential_DR_CAPTURE);
      end
      `JtagState_binary_sequential_DR_CAPTURE : begin
        _zz_jtag_tap_fsm_stateNext = (io_jtag_tms ? `JtagState_binary_sequential_DR_EXIT1 : `JtagState_binary_sequential_DR_SHIFT);
      end
      `JtagState_binary_sequential_DR_SHIFT : begin
        _zz_jtag_tap_fsm_stateNext = (io_jtag_tms ? `JtagState_binary_sequential_DR_EXIT1 : `JtagState_binary_sequential_DR_SHIFT);
      end
      `JtagState_binary_sequential_DR_EXIT1 : begin
        _zz_jtag_tap_fsm_stateNext = (io_jtag_tms ? `JtagState_binary_sequential_DR_UPDATE : `JtagState_binary_sequential_DR_PAUSE);
      end
      `JtagState_binary_sequential_DR_PAUSE : begin
        _zz_jtag_tap_fsm_stateNext = (io_jtag_tms ? `JtagState_binary_sequential_DR_EXIT2 : `JtagState_binary_sequential_DR_PAUSE);
      end
      `JtagState_binary_sequential_DR_EXIT2 : begin
        _zz_jtag_tap_fsm_stateNext = (io_jtag_tms ? `JtagState_binary_sequential_DR_UPDATE : `JtagState_binary_sequential_DR_SHIFT);
      end
      `JtagState_binary_sequential_DR_UPDATE : begin
        _zz_jtag_tap_fsm_stateNext = (io_jtag_tms ? `JtagState_binary_sequential_DR_SELECT : `JtagState_binary_sequential_IDLE);
      end
      default : begin
        _zz_jtag_tap_fsm_stateNext = (io_jtag_tms ? `JtagState_binary_sequential_RESET : `JtagState_binary_sequential_IDLE);
      end
    endcase
  end

  assign jtag_tap_fsm_stateNext = _zz_jtag_tap_fsm_stateNext;
  always @(*) begin
    jtag_tap_tdoUnbufferd = jtag_tap_bypass;
    case(jtag_tap_fsm_state)
      `JtagState_binary_sequential_IR_SHIFT : begin
        jtag_tap_tdoUnbufferd = jtag_tap_tdoIr;
      end
      `JtagState_binary_sequential_DR_SHIFT : begin
        jtag_tap_tdoUnbufferd = jtag_tap_tdoDr;
      end
      default : begin
      end
    endcase
  end

  always @(*) begin
    jtag_tap_tdoDr = 1'b0;
    if(_zz_1) begin
      jtag_tap_tdoDr = _zz_jtag_tap_tdoDr[0];
    end
    if(_zz_io_input_valid) begin
      jtag_tap_tdoDr = 1'b0;
    end
    if(_zz_2) begin
      jtag_tap_tdoDr = _zz_jtag_tap_tdoDr_1[0];
    end
  end

  assign jtag_tap_tdoIr = jtag_tap_instructionShift[0];
  assign io_jtag_tdo = jtag_tap_tdoUnbufferd_regNext;
  assign _zz_1 = (jtag_tap_instruction == 4'b0001);
  assign when_JtagTap_l115 = (jtag_tap_fsm_state == `JtagState_binary_sequential_RESET);
  assign _zz_io_input_payload_fragment[0] = _zz_io_input_payload_fragment_1;
  assign flowCCByToggle_1_io_input_payload_last = (! (_zz_io_input_valid && _zz_io_input_valid_1));
  assign system_cmd_valid = flowCCByToggle_1_io_output_valid;
  assign system_cmd_payload_last = flowCCByToggle_1_io_output_payload_last;
  assign system_cmd_payload_fragment = flowCCByToggle_1_io_output_payload_fragment;
  assign _zz_io_input_valid = (jtag_tap_instruction == 4'b0010);
  assign _zz_io_input_valid_1 = (jtag_tap_fsm_state == `JtagState_binary_sequential_DR_SHIFT);
  assign _zz_2 = (jtag_tap_instruction == 4'b0011);
  always @(posedge io_mainClk) begin
    if(io_remote_cmd_valid) begin
      system_rsp_valid <= 1'b0;
    end
    if(io_remote_rsp_fire) begin
      system_rsp_valid <= 1'b1;
      system_rsp_payload_error <= io_remote_rsp_payload_error;
      system_rsp_payload_data <= io_remote_rsp_payload_data;
    end
  end

  always @(posedge io_jtag_tck) begin
    jtag_tap_fsm_state <= jtag_tap_fsm_stateNext;
    jtag_tap_bypass <= io_jtag_tdi;
    case(jtag_tap_fsm_state)
      `JtagState_binary_sequential_IR_CAPTURE : begin
        jtag_tap_instructionShift <= {2'd0, _zz_jtag_tap_instructionShift};
      end
      `JtagState_binary_sequential_IR_SHIFT : begin
        jtag_tap_instructionShift <= ({io_jtag_tdi,jtag_tap_instructionShift} >>> 1);
      end
      `JtagState_binary_sequential_IR_UPDATE : begin
        jtag_tap_instruction <= jtag_tap_instructionShift;
      end
      `JtagState_binary_sequential_DR_SHIFT : begin
        jtag_tap_instructionShift <= ({io_jtag_tdi,jtag_tap_instructionShift} >>> 1);
      end
      default : begin
      end
    endcase
    if(_zz_1) begin
      if((jtag_tap_fsm_state == `JtagState_binary_sequential_DR_SHIFT)) begin
        _zz_jtag_tap_tdoDr <= ({io_jtag_tdi,_zz_jtag_tap_tdoDr} >>> 1);
      end
    end
    if((jtag_tap_fsm_state == `JtagState_binary_sequential_DR_CAPTURE)) begin
      _zz_jtag_tap_tdoDr <= 32'h10001fff;
    end
    if(when_JtagTap_l115) begin
      jtag_tap_instruction <= 4'b0001;
    end
    _zz_io_input_valid_2 <= (_zz_io_input_valid && _zz_io_input_valid_1);
    _zz_io_input_payload_fragment_1 <= io_jtag_tdi;
    if(_zz_2) begin
      if((jtag_tap_fsm_state == `JtagState_binary_sequential_DR_CAPTURE)) begin
        _zz_jtag_tap_tdoDr_1 <= {{system_rsp_payload_data,system_rsp_payload_error},system_rsp_valid};
      end
      if((jtag_tap_fsm_state == `JtagState_binary_sequential_DR_SHIFT)) begin
        _zz_jtag_tap_tdoDr_1 <= ({io_jtag_tdi,_zz_jtag_tap_tdoDr_1} >>> 1);
      end
    end
  end

  always @(negedge io_jtag_tck) begin
    jtag_tap_tdoUnbufferd_regNext <= jtag_tap_tdoUnbufferd;
  end


endmodule

module VexRiscv (
  output              iBus_cmd_valid,
  input               iBus_cmd_ready,
  output     [31:0]   iBus_cmd_payload_pc,
  input               iBus_rsp_valid,
  input               iBus_rsp_payload_error,
  input      [31:0]   iBus_rsp_payload_inst,
  input               timerInterrupt,
  input               externalInterrupt,
  input               softwareInterrupt,
  input               debug_bus_cmd_valid,
  output reg          debug_bus_cmd_ready,
  input               debug_bus_cmd_payload_wr,
  input      [7:0]    debug_bus_cmd_payload_address,
  input      [31:0]   debug_bus_cmd_payload_data,
  output reg [31:0]   debug_bus_rsp_data,
  output              debug_resetOut,
  output              dBus_cmd_valid,
  input               dBus_cmd_ready,
  output              dBus_cmd_payload_wr,
  output     [31:0]   dBus_cmd_payload_address,
  output     [31:0]   dBus_cmd_payload_data,
  output     [1:0]    dBus_cmd_payload_size,
  input               dBus_rsp_ready,
  input               dBus_rsp_error,
  input      [31:0]   dBus_rsp_data,
  input               io_mainClk,
  input               resetCtrl_systemReset,
  input               resetCtrl_mainClkReset
);
  wire                IBusSimplePlugin_rspJoin_rspBuffer_c_io_pop_ready;
  reg        [31:0]   _zz_RegFilePlugin_regFile_port0;
  reg        [31:0]   _zz_RegFilePlugin_regFile_port1;
  wire                IBusSimplePlugin_rspJoin_rspBuffer_c_io_push_ready;
  wire                IBusSimplePlugin_rspJoin_rspBuffer_c_io_pop_valid;
  wire                IBusSimplePlugin_rspJoin_rspBuffer_c_io_pop_payload_error;
  wire       [31:0]   IBusSimplePlugin_rspJoin_rspBuffer_c_io_pop_payload_inst;
  wire       [0:0]    IBusSimplePlugin_rspJoin_rspBuffer_c_io_occupancy;
  wire       [51:0]   _zz_memory_MUL_LOW;
  wire       [51:0]   _zz_memory_MUL_LOW_1;
  wire       [51:0]   _zz_memory_MUL_LOW_2;
  wire       [51:0]   _zz_memory_MUL_LOW_3;
  wire       [32:0]   _zz_memory_MUL_LOW_4;
  wire       [51:0]   _zz_memory_MUL_LOW_5;
  wire       [49:0]   _zz_memory_MUL_LOW_6;
  wire       [51:0]   _zz_memory_MUL_LOW_7;
  wire       [49:0]   _zz_memory_MUL_LOW_8;
  wire       [31:0]   _zz_execute_SHIFT_RIGHT;
  wire       [32:0]   _zz_execute_SHIFT_RIGHT_1;
  wire       [32:0]   _zz_execute_SHIFT_RIGHT_2;
  wire       [31:0]   _zz_decode_FORMAL_PC_NEXT;
  wire       [2:0]    _zz_decode_FORMAL_PC_NEXT_1;
  wire       [1:0]    _zz_IBusSimplePlugin_jump_pcLoad_payload_1;
  wire       [1:0]    _zz_IBusSimplePlugin_jump_pcLoad_payload_2;
  wire       [31:0]   _zz_IBusSimplePlugin_fetchPc_pc;
  wire       [2:0]    _zz_IBusSimplePlugin_fetchPc_pc_1;
  wire       [31:0]   _zz_IBusSimplePlugin_decodePc_pcPlus;
  wire       [2:0]    _zz_IBusSimplePlugin_decodePc_pcPlus_1;
  wire       [31:0]   _zz_IBusSimplePlugin_decompressor_decompressed_27;
  wire                _zz_IBusSimplePlugin_decompressor_decompressed_28;
  wire                _zz_IBusSimplePlugin_decompressor_decompressed_29;
  wire       [6:0]    _zz_IBusSimplePlugin_decompressor_decompressed_30;
  wire       [4:0]    _zz_IBusSimplePlugin_decompressor_decompressed_31;
  wire                _zz_IBusSimplePlugin_decompressor_decompressed_32;
  wire       [4:0]    _zz_IBusSimplePlugin_decompressor_decompressed_33;
  wire       [11:0]   _zz_IBusSimplePlugin_decompressor_decompressed_34;
  wire       [11:0]   _zz_IBusSimplePlugin_decompressor_decompressed_35;
  wire       [2:0]    _zz_IBusSimplePlugin_pending_next;
  wire       [2:0]    _zz_IBusSimplePlugin_pending_next_1;
  wire       [0:0]    _zz_IBusSimplePlugin_pending_next_2;
  wire       [2:0]    _zz_IBusSimplePlugin_pending_next_3;
  wire       [0:0]    _zz_IBusSimplePlugin_pending_next_4;
  wire       [2:0]    _zz_IBusSimplePlugin_rspJoin_rspBuffer_discardCounter;
  wire       [0:0]    _zz_IBusSimplePlugin_rspJoin_rspBuffer_discardCounter_1;
  wire       [29:0]   _zz_CsrPlugin_jumpInterface_payload;
  wire       [29:0]   _zz_CsrPlugin_jumpInterface_payload_1;
  wire       [31:0]   _zz__zz_decode_BRANCH_CTRL_2;
  wire                _zz__zz_decode_BRANCH_CTRL_2_1;
  wire                _zz__zz_decode_BRANCH_CTRL_2_2;
  wire       [1:0]    _zz__zz_decode_BRANCH_CTRL_2_3;
  wire       [31:0]   _zz__zz_decode_BRANCH_CTRL_2_4;
  wire       [31:0]   _zz__zz_decode_BRANCH_CTRL_2_5;
  wire       [31:0]   _zz__zz_decode_BRANCH_CTRL_2_6;
  wire       [31:0]   _zz__zz_decode_BRANCH_CTRL_2_7;
  wire       [1:0]    _zz__zz_decode_BRANCH_CTRL_2_8;
  wire                _zz__zz_decode_BRANCH_CTRL_2_9;
  wire                _zz__zz_decode_BRANCH_CTRL_2_10;
  wire       [0:0]    _zz__zz_decode_BRANCH_CTRL_2_11;
  wire       [31:0]   _zz__zz_decode_BRANCH_CTRL_2_12;
  wire       [0:0]    _zz__zz_decode_BRANCH_CTRL_2_13;
  wire       [31:0]   _zz__zz_decode_BRANCH_CTRL_2_14;
  wire       [0:0]    _zz__zz_decode_BRANCH_CTRL_2_15;
  wire       [23:0]   _zz__zz_decode_BRANCH_CTRL_2_16;
  wire       [0:0]    _zz__zz_decode_BRANCH_CTRL_2_17;
  wire       [0:0]    _zz__zz_decode_BRANCH_CTRL_2_18;
  wire                _zz__zz_decode_BRANCH_CTRL_2_19;
  wire       [31:0]   _zz__zz_decode_BRANCH_CTRL_2_20;
  wire       [31:0]   _zz__zz_decode_BRANCH_CTRL_2_21;
  wire       [0:0]    _zz__zz_decode_BRANCH_CTRL_2_22;
  wire                _zz__zz_decode_BRANCH_CTRL_2_23;
  wire       [20:0]   _zz__zz_decode_BRANCH_CTRL_2_24;
  wire       [0:0]    _zz__zz_decode_BRANCH_CTRL_2_25;
  wire       [0:0]    _zz__zz_decode_BRANCH_CTRL_2_26;
  wire                _zz__zz_decode_BRANCH_CTRL_2_27;
  wire       [31:0]   _zz__zz_decode_BRANCH_CTRL_2_28;
  wire       [0:0]    _zz__zz_decode_BRANCH_CTRL_2_29;
  wire       [31:0]   _zz__zz_decode_BRANCH_CTRL_2_30;
  wire       [31:0]   _zz__zz_decode_BRANCH_CTRL_2_31;
  wire       [17:0]   _zz__zz_decode_BRANCH_CTRL_2_32;
  wire       [0:0]    _zz__zz_decode_BRANCH_CTRL_2_33;
  wire       [0:0]    _zz__zz_decode_BRANCH_CTRL_2_34;
  wire       [0:0]    _zz__zz_decode_BRANCH_CTRL_2_35;
  wire       [0:0]    _zz__zz_decode_BRANCH_CTRL_2_36;
  wire                _zz__zz_decode_BRANCH_CTRL_2_37;
  wire       [0:0]    _zz__zz_decode_BRANCH_CTRL_2_38;
  wire                _zz__zz_decode_BRANCH_CTRL_2_39;
  wire                _zz__zz_decode_BRANCH_CTRL_2_40;
  wire       [13:0]   _zz__zz_decode_BRANCH_CTRL_2_41;
  wire                _zz__zz_decode_BRANCH_CTRL_2_42;
  wire       [1:0]    _zz__zz_decode_BRANCH_CTRL_2_43;
  wire       [31:0]   _zz__zz_decode_BRANCH_CTRL_2_44;
  wire       [31:0]   _zz__zz_decode_BRANCH_CTRL_2_45;
  wire       [31:0]   _zz__zz_decode_BRANCH_CTRL_2_46;
  wire       [31:0]   _zz__zz_decode_BRANCH_CTRL_2_47;
  wire       [1:0]    _zz__zz_decode_BRANCH_CTRL_2_48;
  wire                _zz__zz_decode_BRANCH_CTRL_2_49;
  wire                _zz__zz_decode_BRANCH_CTRL_2_50;
  wire                _zz__zz_decode_BRANCH_CTRL_2_51;
  wire       [0:0]    _zz__zz_decode_BRANCH_CTRL_2_52;
  wire                _zz__zz_decode_BRANCH_CTRL_2_53;
  wire       [9:0]    _zz__zz_decode_BRANCH_CTRL_2_54;
  wire       [4:0]    _zz__zz_decode_BRANCH_CTRL_2_55;
  wire       [31:0]   _zz__zz_decode_BRANCH_CTRL_2_56;
  wire       [31:0]   _zz__zz_decode_BRANCH_CTRL_2_57;
  wire       [0:0]    _zz__zz_decode_BRANCH_CTRL_2_58;
  wire       [31:0]   _zz__zz_decode_BRANCH_CTRL_2_59;
  wire       [31:0]   _zz__zz_decode_BRANCH_CTRL_2_60;
  wire       [1:0]    _zz__zz_decode_BRANCH_CTRL_2_61;
  wire                _zz__zz_decode_BRANCH_CTRL_2_62;
  wire       [31:0]   _zz__zz_decode_BRANCH_CTRL_2_63;
  wire                _zz__zz_decode_BRANCH_CTRL_2_64;
  wire       [31:0]   _zz__zz_decode_BRANCH_CTRL_2_65;
  wire       [4:0]    _zz__zz_decode_BRANCH_CTRL_2_66;
  wire                _zz__zz_decode_BRANCH_CTRL_2_67;
  wire       [0:0]    _zz__zz_decode_BRANCH_CTRL_2_68;
  wire       [31:0]   _zz__zz_decode_BRANCH_CTRL_2_69;
  wire       [31:0]   _zz__zz_decode_BRANCH_CTRL_2_70;
  wire       [2:0]    _zz__zz_decode_BRANCH_CTRL_2_71;
  wire                _zz__zz_decode_BRANCH_CTRL_2_72;
  wire       [31:0]   _zz__zz_decode_BRANCH_CTRL_2_73;
  wire       [0:0]    _zz__zz_decode_BRANCH_CTRL_2_74;
  wire       [31:0]   _zz__zz_decode_BRANCH_CTRL_2_75;
  wire       [31:0]   _zz__zz_decode_BRANCH_CTRL_2_76;
  wire       [0:0]    _zz__zz_decode_BRANCH_CTRL_2_77;
  wire       [31:0]   _zz__zz_decode_BRANCH_CTRL_2_78;
  wire       [31:0]   _zz__zz_decode_BRANCH_CTRL_2_79;
  wire       [0:0]    _zz__zz_decode_BRANCH_CTRL_2_80;
  wire       [0:0]    _zz__zz_decode_BRANCH_CTRL_2_81;
  wire       [4:0]    _zz__zz_decode_BRANCH_CTRL_2_82;
  wire                _zz__zz_decode_BRANCH_CTRL_2_83;
  wire       [31:0]   _zz__zz_decode_BRANCH_CTRL_2_84;
  wire       [0:0]    _zz__zz_decode_BRANCH_CTRL_2_85;
  wire       [31:0]   _zz__zz_decode_BRANCH_CTRL_2_86;
  wire       [31:0]   _zz__zz_decode_BRANCH_CTRL_2_87;
  wire       [2:0]    _zz__zz_decode_BRANCH_CTRL_2_88;
  wire                _zz__zz_decode_BRANCH_CTRL_2_89;
  wire       [31:0]   _zz__zz_decode_BRANCH_CTRL_2_90;
  wire       [0:0]    _zz__zz_decode_BRANCH_CTRL_2_91;
  wire       [31:0]   _zz__zz_decode_BRANCH_CTRL_2_92;
  wire       [31:0]   _zz__zz_decode_BRANCH_CTRL_2_93;
  wire       [0:0]    _zz__zz_decode_BRANCH_CTRL_2_94;
  wire       [31:0]   _zz__zz_decode_BRANCH_CTRL_2_95;
  wire       [31:0]   _zz__zz_decode_BRANCH_CTRL_2_96;
  wire       [6:0]    _zz__zz_decode_BRANCH_CTRL_2_97;
  wire       [1:0]    _zz__zz_decode_BRANCH_CTRL_2_98;
  wire                _zz__zz_decode_BRANCH_CTRL_2_99;
  wire       [31:0]   _zz__zz_decode_BRANCH_CTRL_2_100;
  wire       [1:0]    _zz__zz_decode_BRANCH_CTRL_2_101;
  wire                _zz__zz_decode_BRANCH_CTRL_2_102;
  wire       [0:0]    _zz__zz_decode_BRANCH_CTRL_2_103;
  wire       [0:0]    _zz__zz_decode_BRANCH_CTRL_2_104;
  wire       [31:0]   _zz__zz_decode_BRANCH_CTRL_2_105;
  wire       [31:0]   _zz__zz_decode_BRANCH_CTRL_2_106;
  wire       [0:0]    _zz__zz_decode_BRANCH_CTRL_2_107;
  wire       [3:0]    _zz__zz_decode_BRANCH_CTRL_2_108;
  wire                _zz__zz_decode_BRANCH_CTRL_2_109;
  wire       [31:0]   _zz__zz_decode_BRANCH_CTRL_2_110;
  wire       [0:0]    _zz__zz_decode_BRANCH_CTRL_2_111;
  wire       [31:0]   _zz__zz_decode_BRANCH_CTRL_2_112;
  wire       [31:0]   _zz__zz_decode_BRANCH_CTRL_2_113;
  wire       [1:0]    _zz__zz_decode_BRANCH_CTRL_2_114;
  wire                _zz__zz_decode_BRANCH_CTRL_2_115;
  wire       [3:0]    _zz__zz_decode_BRANCH_CTRL_2_116;
  wire       [3:0]    _zz__zz_decode_BRANCH_CTRL_2_117;
  wire                _zz__zz_decode_BRANCH_CTRL_2_118;
  wire                _zz__zz_decode_BRANCH_CTRL_2_119;
  wire       [31:0]   _zz__zz_decode_BRANCH_CTRL_2_120;
  wire       [0:0]    _zz__zz_decode_BRANCH_CTRL_2_121;
  wire       [2:0]    _zz__zz_decode_BRANCH_CTRL_2_122;
  wire                _zz__zz_decode_BRANCH_CTRL_2_123;
  wire       [0:0]    _zz__zz_decode_BRANCH_CTRL_2_124;
  wire       [0:0]    _zz__zz_decode_BRANCH_CTRL_2_125;
  wire       [2:0]    _zz__zz_decode_BRANCH_CTRL_2_126;
  wire       [1:0]    _zz__zz_decode_BRANCH_CTRL_2_127;
  wire                _zz__zz_decode_BRANCH_CTRL_2_128;
  wire       [0:0]    _zz__zz_decode_BRANCH_CTRL_2_129;
  wire       [0:0]    _zz__zz_decode_BRANCH_CTRL_2_130;
  wire                _zz__zz_decode_BRANCH_CTRL_2_131;
  wire       [0:0]    _zz__zz_decode_BRANCH_CTRL_2_132;
  wire       [0:0]    _zz__zz_decode_BRANCH_CTRL_2_133;
  wire                _zz_RegFilePlugin_regFile_port;
  wire                _zz_decode_RegFilePlugin_rs1Data;
  wire                _zz_RegFilePlugin_regFile_port_1;
  wire                _zz_decode_RegFilePlugin_rs2Data;
  wire       [0:0]    _zz__zz_execute_REGFILE_WRITE_DATA;
  wire       [2:0]    _zz__zz_decode_SRC1_1;
  wire       [4:0]    _zz__zz_decode_SRC1_1_1;
  wire       [11:0]   _zz__zz_decode_SRC2_4;
  wire       [31:0]   _zz_execute_SrcPlugin_addSub;
  wire       [31:0]   _zz_execute_SrcPlugin_addSub_1;
  wire       [31:0]   _zz_execute_SrcPlugin_addSub_2;
  wire       [31:0]   _zz_execute_SrcPlugin_addSub_3;
  wire       [31:0]   _zz_execute_SrcPlugin_addSub_4;
  wire       [31:0]   _zz_execute_SrcPlugin_addSub_5;
  wire       [31:0]   _zz_execute_SrcPlugin_addSub_6;
  wire       [65:0]   _zz_writeBack_MulPlugin_result;
  wire       [65:0]   _zz_writeBack_MulPlugin_result_1;
  wire       [31:0]   _zz__zz_decode_RS2_2;
  wire       [31:0]   _zz__zz_decode_RS2_2_1;
  wire       [5:0]    _zz_memory_DivPlugin_div_counter_valueNext;
  wire       [0:0]    _zz_memory_DivPlugin_div_counter_valueNext_1;
  wire       [32:0]   _zz_memory_DivPlugin_div_stage_0_remainderMinusDenominator;
  wire       [31:0]   _zz_memory_DivPlugin_div_stage_0_outRemainder;
  wire       [31:0]   _zz_memory_DivPlugin_div_stage_0_outRemainder_1;
  wire       [32:0]   _zz_memory_DivPlugin_div_stage_0_outNumerator;
  wire       [32:0]   _zz_memory_DivPlugin_div_result_1;
  wire       [32:0]   _zz_memory_DivPlugin_div_result_2;
  wire       [32:0]   _zz_memory_DivPlugin_div_result_3;
  wire       [32:0]   _zz_memory_DivPlugin_div_result_4;
  wire       [0:0]    _zz_memory_DivPlugin_div_result_5;
  wire       [32:0]   _zz_memory_DivPlugin_rs1_2;
  wire       [0:0]    _zz_memory_DivPlugin_rs1_3;
  wire       [31:0]   _zz_memory_DivPlugin_rs2_1;
  wire       [0:0]    _zz_memory_DivPlugin_rs2_2;
  wire       [19:0]   _zz__zz_execute_BranchPlugin_branch_src2;
  wire       [11:0]   _zz__zz_execute_BranchPlugin_branch_src2_4;
  wire       [51:0]   memory_MUL_LOW;
  wire       [31:0]   memory_MEMORY_READ_DATA;
  wire       [31:0]   execute_BRANCH_CALC;
  wire                execute_BRANCH_DO;
  wire       [31:0]   execute_SHIFT_RIGHT;
  wire       [33:0]   memory_MUL_HH;
  wire       [33:0]   execute_MUL_HH;
  wire       [33:0]   execute_MUL_HL;
  wire       [33:0]   execute_MUL_LH;
  wire       [31:0]   execute_MUL_LL;
  wire       [31:0]   writeBack_REGFILE_WRITE_DATA;
  wire       [31:0]   memory_REGFILE_WRITE_DATA;
  wire       [31:0]   execute_REGFILE_WRITE_DATA;
  wire       [1:0]    memory_MEMORY_ADDRESS_LOW;
  wire       [1:0]    execute_MEMORY_ADDRESS_LOW;
  wire                decode_DO_EBREAK;
  wire       [31:0]   decode_SRC2;
  wire       [31:0]   decode_SRC1;
  wire                decode_SRC2_FORCE_ZERO;
  wire       `BranchCtrlEnum_binary_sequential_type decode_BRANCH_CTRL;
  wire       `BranchCtrlEnum_binary_sequential_type _zz_decode_BRANCH_CTRL;
  wire       `BranchCtrlEnum_binary_sequential_type _zz_decode_to_execute_BRANCH_CTRL;
  wire       `BranchCtrlEnum_binary_sequential_type _zz_decode_to_execute_BRANCH_CTRL_1;
  wire       `ShiftCtrlEnum_binary_sequential_type _zz_execute_to_memory_SHIFT_CTRL;
  wire       `ShiftCtrlEnum_binary_sequential_type _zz_execute_to_memory_SHIFT_CTRL_1;
  wire       `ShiftCtrlEnum_binary_sequential_type decode_SHIFT_CTRL;
  wire       `ShiftCtrlEnum_binary_sequential_type _zz_decode_SHIFT_CTRL;
  wire       `ShiftCtrlEnum_binary_sequential_type _zz_decode_to_execute_SHIFT_CTRL;
  wire       `ShiftCtrlEnum_binary_sequential_type _zz_decode_to_execute_SHIFT_CTRL_1;
  wire                decode_IS_RS2_SIGNED;
  wire                decode_IS_RS1_SIGNED;
  wire                decode_IS_DIV;
  wire                memory_IS_MUL;
  wire                execute_IS_MUL;
  wire                decode_IS_MUL;
  wire       `AluBitwiseCtrlEnum_binary_sequential_type decode_ALU_BITWISE_CTRL;
  wire       `AluBitwiseCtrlEnum_binary_sequential_type _zz_decode_ALU_BITWISE_CTRL;
  wire       `AluBitwiseCtrlEnum_binary_sequential_type _zz_decode_to_execute_ALU_BITWISE_CTRL;
  wire       `AluBitwiseCtrlEnum_binary_sequential_type _zz_decode_to_execute_ALU_BITWISE_CTRL_1;
  wire                decode_SRC_LESS_UNSIGNED;
  wire       `AluCtrlEnum_binary_sequential_type decode_ALU_CTRL;
  wire       `AluCtrlEnum_binary_sequential_type _zz_decode_ALU_CTRL;
  wire       `AluCtrlEnum_binary_sequential_type _zz_decode_to_execute_ALU_CTRL;
  wire       `AluCtrlEnum_binary_sequential_type _zz_decode_to_execute_ALU_CTRL_1;
  wire       `EnvCtrlEnum_binary_sequential_type _zz_memory_to_writeBack_ENV_CTRL;
  wire       `EnvCtrlEnum_binary_sequential_type _zz_memory_to_writeBack_ENV_CTRL_1;
  wire       `EnvCtrlEnum_binary_sequential_type _zz_execute_to_memory_ENV_CTRL;
  wire       `EnvCtrlEnum_binary_sequential_type _zz_execute_to_memory_ENV_CTRL_1;
  wire       `EnvCtrlEnum_binary_sequential_type decode_ENV_CTRL;
  wire       `EnvCtrlEnum_binary_sequential_type _zz_decode_ENV_CTRL;
  wire       `EnvCtrlEnum_binary_sequential_type _zz_decode_to_execute_ENV_CTRL;
  wire       `EnvCtrlEnum_binary_sequential_type _zz_decode_to_execute_ENV_CTRL_1;
  wire                decode_IS_CSR;
  wire                decode_MEMORY_STORE;
  wire                execute_BYPASSABLE_MEMORY_STAGE;
  wire                decode_BYPASSABLE_MEMORY_STAGE;
  wire                decode_BYPASSABLE_EXECUTE_STAGE;
  wire                decode_MEMORY_ENABLE;
  wire                decode_CSR_READ_OPCODE;
  wire                decode_CSR_WRITE_OPCODE;
  wire       [31:0]   writeBack_FORMAL_PC_NEXT;
  wire       [31:0]   memory_FORMAL_PC_NEXT;
  wire       [31:0]   execute_FORMAL_PC_NEXT;
  wire       [31:0]   decode_FORMAL_PC_NEXT;
  wire       [31:0]   memory_PC;
  wire                execute_DO_EBREAK;
  wire                decode_IS_EBREAK;
  wire       [31:0]   memory_BRANCH_CALC;
  wire                memory_BRANCH_DO;
  wire       [31:0]   execute_PC;
  wire       `BranchCtrlEnum_binary_sequential_type execute_BRANCH_CTRL;
  wire       `BranchCtrlEnum_binary_sequential_type _zz_execute_BRANCH_CTRL;
  wire                decode_RS2_USE;
  wire                decode_RS1_USE;
  wire                execute_REGFILE_WRITE_VALID;
  wire                execute_BYPASSABLE_EXECUTE_STAGE;
  wire                memory_REGFILE_WRITE_VALID;
  wire                memory_BYPASSABLE_MEMORY_STAGE;
  wire                writeBack_REGFILE_WRITE_VALID;
  reg        [31:0]   decode_RS2;
  reg        [31:0]   decode_RS1;
  wire       [31:0]   memory_SHIFT_RIGHT;
  wire       `ShiftCtrlEnum_binary_sequential_type memory_SHIFT_CTRL;
  wire       `ShiftCtrlEnum_binary_sequential_type _zz_memory_SHIFT_CTRL;
  wire       `ShiftCtrlEnum_binary_sequential_type execute_SHIFT_CTRL;
  wire       `ShiftCtrlEnum_binary_sequential_type _zz_execute_SHIFT_CTRL;
  wire                execute_IS_RS1_SIGNED;
  wire                execute_IS_DIV;
  wire                execute_IS_RS2_SIGNED;
  reg        [31:0]   _zz_decode_RS2;
  wire       [31:0]   memory_INSTRUCTION;
  wire                memory_IS_DIV;
  wire                writeBack_IS_MUL;
  wire       [33:0]   writeBack_MUL_HH;
  wire       [51:0]   writeBack_MUL_LOW;
  wire       [33:0]   memory_MUL_HL;
  wire       [33:0]   memory_MUL_LH;
  wire       [31:0]   memory_MUL_LL;
  (* keep , syn_keep *) wire       [31:0]   execute_RS1 /* synthesis syn_keep = 1 */ ;
  wire                execute_SRC_LESS_UNSIGNED;
  wire                execute_SRC2_FORCE_ZERO;
  wire                execute_SRC_USE_SUB_LESS;
  wire       [31:0]   _zz_decode_SRC2;
  wire       [31:0]   _zz_decode_SRC2_1;
  wire       `Src2CtrlEnum_binary_sequential_type decode_SRC2_CTRL;
  wire       `Src2CtrlEnum_binary_sequential_type _zz_decode_SRC2_CTRL;
  wire       [31:0]   _zz_decode_SRC1;
  wire       `Src1CtrlEnum_binary_sequential_type decode_SRC1_CTRL;
  wire       `Src1CtrlEnum_binary_sequential_type _zz_decode_SRC1_CTRL;
  wire                decode_SRC_USE_SUB_LESS;
  wire                decode_SRC_ADD_ZERO;
  wire       [31:0]   execute_SRC_ADD_SUB;
  wire                execute_SRC_LESS;
  wire       `AluCtrlEnum_binary_sequential_type execute_ALU_CTRL;
  wire       `AluCtrlEnum_binary_sequential_type _zz_execute_ALU_CTRL;
  wire       [31:0]   execute_SRC2;
  wire       `AluBitwiseCtrlEnum_binary_sequential_type execute_ALU_BITWISE_CTRL;
  wire       `AluBitwiseCtrlEnum_binary_sequential_type _zz_execute_ALU_BITWISE_CTRL;
  wire       [31:0]   _zz_lastStageRegFileWrite_payload_address;
  wire                _zz_lastStageRegFileWrite_valid;
  reg                 _zz_1;
  wire       [31:0]   decode_INSTRUCTION_ANTICIPATED;
  reg                 decode_REGFILE_WRITE_VALID;
  wire       `BranchCtrlEnum_binary_sequential_type _zz_decode_BRANCH_CTRL_1;
  wire       `ShiftCtrlEnum_binary_sequential_type _zz_decode_SHIFT_CTRL_1;
  wire       `AluBitwiseCtrlEnum_binary_sequential_type _zz_decode_ALU_BITWISE_CTRL_1;
  wire       `AluCtrlEnum_binary_sequential_type _zz_decode_ALU_CTRL_1;
  wire       `EnvCtrlEnum_binary_sequential_type _zz_decode_ENV_CTRL_1;
  wire       `Src2CtrlEnum_binary_sequential_type _zz_decode_SRC2_CTRL_1;
  wire       `Src1CtrlEnum_binary_sequential_type _zz_decode_SRC1_CTRL_1;
  reg        [31:0]   _zz_decode_RS2_1;
  wire       [31:0]   execute_SRC1;
  wire                execute_CSR_READ_OPCODE;
  wire                execute_CSR_WRITE_OPCODE;
  wire                execute_IS_CSR;
  wire       `EnvCtrlEnum_binary_sequential_type memory_ENV_CTRL;
  wire       `EnvCtrlEnum_binary_sequential_type _zz_memory_ENV_CTRL;
  wire       `EnvCtrlEnum_binary_sequential_type execute_ENV_CTRL;
  wire       `EnvCtrlEnum_binary_sequential_type _zz_execute_ENV_CTRL;
  wire       `EnvCtrlEnum_binary_sequential_type writeBack_ENV_CTRL;
  wire       `EnvCtrlEnum_binary_sequential_type _zz_writeBack_ENV_CTRL;
  wire                writeBack_MEMORY_STORE;
  reg        [31:0]   _zz_decode_RS2_2;
  wire                writeBack_MEMORY_ENABLE;
  wire       [1:0]    writeBack_MEMORY_ADDRESS_LOW;
  wire       [31:0]   writeBack_MEMORY_READ_DATA;
  wire                memory_MEMORY_STORE;
  wire                memory_MEMORY_ENABLE;
  wire       [31:0]   execute_SRC_ADD;
  (* keep , syn_keep *) wire       [31:0]   execute_RS2 /* synthesis syn_keep = 1 */ ;
  wire       [31:0]   execute_INSTRUCTION;
  wire                execute_MEMORY_STORE;
  wire                execute_MEMORY_ENABLE;
  wire                execute_ALIGNEMENT_FAULT;
  reg        [31:0]   _zz_memory_to_writeBack_FORMAL_PC_NEXT;
  wire       [31:0]   decode_PC;
  wire       [31:0]   decode_INSTRUCTION;
  wire                decode_IS_RVC;
  wire       [31:0]   writeBack_PC;
  wire       [31:0]   writeBack_INSTRUCTION;
  reg                 decode_arbitration_haltItself;
  reg                 decode_arbitration_haltByOther;
  reg                 decode_arbitration_removeIt;
  wire                decode_arbitration_flushIt;
  wire                decode_arbitration_flushNext;
  reg                 decode_arbitration_isValid;
  wire                decode_arbitration_isStuck;
  wire                decode_arbitration_isStuckByOthers;
  wire                decode_arbitration_isFlushed;
  wire                decode_arbitration_isMoving;
  wire                decode_arbitration_isFiring;
  reg                 execute_arbitration_haltItself;
  reg                 execute_arbitration_haltByOther;
  reg                 execute_arbitration_removeIt;
  reg                 execute_arbitration_flushIt;
  reg                 execute_arbitration_flushNext;
  reg                 execute_arbitration_isValid;
  wire                execute_arbitration_isStuck;
  wire                execute_arbitration_isStuckByOthers;
  wire                execute_arbitration_isFlushed;
  wire                execute_arbitration_isMoving;
  wire                execute_arbitration_isFiring;
  reg                 memory_arbitration_haltItself;
  wire                memory_arbitration_haltByOther;
  reg                 memory_arbitration_removeIt;
  wire                memory_arbitration_flushIt;
  reg                 memory_arbitration_flushNext;
  reg                 memory_arbitration_isValid;
  wire                memory_arbitration_isStuck;
  wire                memory_arbitration_isStuckByOthers;
  wire                memory_arbitration_isFlushed;
  wire                memory_arbitration_isMoving;
  wire                memory_arbitration_isFiring;
  wire                writeBack_arbitration_haltItself;
  wire                writeBack_arbitration_haltByOther;
  reg                 writeBack_arbitration_removeIt;
  wire                writeBack_arbitration_flushIt;
  reg                 writeBack_arbitration_flushNext;
  reg                 writeBack_arbitration_isValid;
  wire                writeBack_arbitration_isStuck;
  wire                writeBack_arbitration_isStuckByOthers;
  wire                writeBack_arbitration_isFlushed;
  wire                writeBack_arbitration_isMoving;
  wire                writeBack_arbitration_isFiring;
  wire       [31:0]   lastStageInstruction /* verilator public */ ;
  wire       [31:0]   lastStagePc /* verilator public */ ;
  wire                lastStageIsValid /* verilator public */ ;
  wire                lastStageIsFiring /* verilator public */ ;
  reg                 IBusSimplePlugin_fetcherHalt;
  reg                 IBusSimplePlugin_incomingInstruction;
  wire                IBusSimplePlugin_pcValids_0;
  wire                IBusSimplePlugin_pcValids_1;
  wire                IBusSimplePlugin_pcValids_2;
  wire                IBusSimplePlugin_pcValids_3;
  wire       [31:0]   CsrPlugin_csrMapping_readDataSignal;
  wire       [31:0]   CsrPlugin_csrMapping_readDataInit;
  wire       [31:0]   CsrPlugin_csrMapping_writeDataSignal;
  wire                CsrPlugin_csrMapping_allowCsrSignal;
  wire                CsrPlugin_csrMapping_hazardFree;
  wire                CsrPlugin_inWfi /* verilator public */ ;
  reg                 CsrPlugin_thirdPartyWake;
  reg                 CsrPlugin_jumpInterface_valid;
  reg        [31:0]   CsrPlugin_jumpInterface_payload;
  wire                CsrPlugin_exceptionPendings_0;
  wire                CsrPlugin_exceptionPendings_1;
  wire                CsrPlugin_exceptionPendings_2;
  wire                CsrPlugin_exceptionPendings_3;
  wire                contextSwitching;
  reg        [1:0]    CsrPlugin_privilege;
  reg                 CsrPlugin_forceMachineWire;
  reg                 CsrPlugin_allowInterrupts;
  reg                 CsrPlugin_allowException;
  reg                 CsrPlugin_allowEbreakException;
  wire                BranchPlugin_jumpInterface_valid;
  wire       [31:0]   BranchPlugin_jumpInterface_payload;
  reg                 IBusSimplePlugin_injectionPort_valid;
  reg                 IBusSimplePlugin_injectionPort_ready;
  wire       [31:0]   IBusSimplePlugin_injectionPort_payload;
  wire                IBusSimplePlugin_externalFlush;
  wire                IBusSimplePlugin_jump_pcLoad_valid;
  wire       [31:0]   IBusSimplePlugin_jump_pcLoad_payload;
  wire       [1:0]    _zz_IBusSimplePlugin_jump_pcLoad_payload;
  wire                IBusSimplePlugin_fetchPc_output_valid;
  wire                IBusSimplePlugin_fetchPc_output_ready;
  wire       [31:0]   IBusSimplePlugin_fetchPc_output_payload;
  reg        [31:0]   IBusSimplePlugin_fetchPc_pcReg /* verilator public */ ;
  reg                 IBusSimplePlugin_fetchPc_correction;
  reg                 IBusSimplePlugin_fetchPc_correctionReg;
  wire                IBusSimplePlugin_fetchPc_output_fire;
  wire                IBusSimplePlugin_fetchPc_corrected;
  reg                 IBusSimplePlugin_fetchPc_pcRegPropagate;
  reg                 IBusSimplePlugin_fetchPc_booted;
  reg                 IBusSimplePlugin_fetchPc_inc;
  wire                when_Fetcher_l131;
  wire                IBusSimplePlugin_fetchPc_output_fire_1;
  wire                when_Fetcher_l131_1;
  reg        [31:0]   IBusSimplePlugin_fetchPc_pc;
  reg                 IBusSimplePlugin_fetchPc_flushed;
  wire                when_Fetcher_l158;
  reg                 IBusSimplePlugin_decodePc_flushed;
  reg        [31:0]   IBusSimplePlugin_decodePc_pcReg /* verilator public */ ;
  wire       [31:0]   IBusSimplePlugin_decodePc_pcPlus;
  reg                 IBusSimplePlugin_decodePc_injectedDecode;
  wire                when_Fetcher_l180;
  wire                when_Fetcher_l192;
  wire                IBusSimplePlugin_iBusRsp_redoFetch;
  wire                IBusSimplePlugin_iBusRsp_stages_0_input_valid;
  wire                IBusSimplePlugin_iBusRsp_stages_0_input_ready;
  wire       [31:0]   IBusSimplePlugin_iBusRsp_stages_0_input_payload;
  wire                IBusSimplePlugin_iBusRsp_stages_0_output_valid;
  wire                IBusSimplePlugin_iBusRsp_stages_0_output_ready;
  wire       [31:0]   IBusSimplePlugin_iBusRsp_stages_0_output_payload;
  wire                IBusSimplePlugin_iBusRsp_stages_0_halt;
  wire                IBusSimplePlugin_iBusRsp_stages_1_input_valid;
  wire                IBusSimplePlugin_iBusRsp_stages_1_input_ready;
  wire       [31:0]   IBusSimplePlugin_iBusRsp_stages_1_input_payload;
  wire                IBusSimplePlugin_iBusRsp_stages_1_output_valid;
  wire                IBusSimplePlugin_iBusRsp_stages_1_output_ready;
  wire       [31:0]   IBusSimplePlugin_iBusRsp_stages_1_output_payload;
  reg                 IBusSimplePlugin_iBusRsp_stages_1_halt;
  wire                IBusSimplePlugin_iBusRsp_stages_2_input_valid;
  wire                IBusSimplePlugin_iBusRsp_stages_2_input_ready;
  wire       [31:0]   IBusSimplePlugin_iBusRsp_stages_2_input_payload;
  wire                IBusSimplePlugin_iBusRsp_stages_2_output_valid;
  wire                IBusSimplePlugin_iBusRsp_stages_2_output_ready;
  wire       [31:0]   IBusSimplePlugin_iBusRsp_stages_2_output_payload;
  wire                IBusSimplePlugin_iBusRsp_stages_2_halt;
  wire                _zz_IBusSimplePlugin_iBusRsp_stages_0_input_ready;
  wire                _zz_IBusSimplePlugin_iBusRsp_stages_1_input_ready;
  wire                _zz_IBusSimplePlugin_iBusRsp_stages_2_input_ready;
  wire                IBusSimplePlugin_iBusRsp_flush;
  wire                _zz_IBusSimplePlugin_iBusRsp_stages_0_output_ready;
  wire                _zz_IBusSimplePlugin_iBusRsp_stages_0_output_ready_1;
  reg                 _zz_IBusSimplePlugin_iBusRsp_stages_0_output_ready_2;
  wire                IBusSimplePlugin_iBusRsp_stages_1_output_m2sPipe_valid;
  wire                IBusSimplePlugin_iBusRsp_stages_1_output_m2sPipe_ready;
  wire       [31:0]   IBusSimplePlugin_iBusRsp_stages_1_output_m2sPipe_payload;
  reg                 _zz_IBusSimplePlugin_iBusRsp_stages_1_output_m2sPipe_valid;
  reg        [31:0]   _zz_IBusSimplePlugin_iBusRsp_stages_1_output_m2sPipe_payload;
  reg                 IBusSimplePlugin_iBusRsp_readyForError;
  wire                IBusSimplePlugin_iBusRsp_output_valid;
  wire                IBusSimplePlugin_iBusRsp_output_ready;
  wire       [31:0]   IBusSimplePlugin_iBusRsp_output_payload_pc;
  wire                IBusSimplePlugin_iBusRsp_output_payload_rsp_error;
  wire       [31:0]   IBusSimplePlugin_iBusRsp_output_payload_rsp_inst;
  wire                IBusSimplePlugin_iBusRsp_output_payload_isRvc;
  wire                when_Fetcher_l240;
  wire                IBusSimplePlugin_decompressor_input_valid;
  wire                IBusSimplePlugin_decompressor_input_ready;
  wire       [31:0]   IBusSimplePlugin_decompressor_input_payload_pc;
  wire                IBusSimplePlugin_decompressor_input_payload_rsp_error;
  wire       [31:0]   IBusSimplePlugin_decompressor_input_payload_rsp_inst;
  wire                IBusSimplePlugin_decompressor_input_payload_isRvc;
  wire                IBusSimplePlugin_decompressor_output_valid;
  wire                IBusSimplePlugin_decompressor_output_ready;
  wire       [31:0]   IBusSimplePlugin_decompressor_output_payload_pc;
  wire                IBusSimplePlugin_decompressor_output_payload_rsp_error;
  wire       [31:0]   IBusSimplePlugin_decompressor_output_payload_rsp_inst;
  wire                IBusSimplePlugin_decompressor_output_payload_isRvc;
  wire                IBusSimplePlugin_decompressor_flushNext;
  wire                IBusSimplePlugin_decompressor_consumeCurrent;
  reg                 IBusSimplePlugin_decompressor_bufferValid;
  reg        [15:0]   IBusSimplePlugin_decompressor_bufferData;
  wire                IBusSimplePlugin_decompressor_isInputLowRvc;
  wire                IBusSimplePlugin_decompressor_isInputHighRvc;
  reg                 IBusSimplePlugin_decompressor_throw2BytesReg;
  wire                IBusSimplePlugin_decompressor_throw2Bytes;
  wire                IBusSimplePlugin_decompressor_unaligned;
  reg                 IBusSimplePlugin_decompressor_bufferValidLatch;
  reg                 IBusSimplePlugin_decompressor_throw2BytesLatch;
  wire                IBusSimplePlugin_decompressor_bufferValidPatched;
  wire                IBusSimplePlugin_decompressor_throw2BytesPatched;
  wire       [31:0]   IBusSimplePlugin_decompressor_raw;
  wire                IBusSimplePlugin_decompressor_isRvc;
  wire       [15:0]   _zz_IBusSimplePlugin_decompressor_decompressed;
  reg        [31:0]   IBusSimplePlugin_decompressor_decompressed;
  wire       [4:0]    _zz_IBusSimplePlugin_decompressor_decompressed_1;
  wire       [4:0]    _zz_IBusSimplePlugin_decompressor_decompressed_2;
  wire       [11:0]   _zz_IBusSimplePlugin_decompressor_decompressed_3;
  wire                _zz_IBusSimplePlugin_decompressor_decompressed_4;
  reg        [11:0]   _zz_IBusSimplePlugin_decompressor_decompressed_5;
  wire                _zz_IBusSimplePlugin_decompressor_decompressed_6;
  reg        [9:0]    _zz_IBusSimplePlugin_decompressor_decompressed_7;
  wire       [20:0]   _zz_IBusSimplePlugin_decompressor_decompressed_8;
  wire                _zz_IBusSimplePlugin_decompressor_decompressed_9;
  reg        [14:0]   _zz_IBusSimplePlugin_decompressor_decompressed_10;
  wire                _zz_IBusSimplePlugin_decompressor_decompressed_11;
  reg        [2:0]    _zz_IBusSimplePlugin_decompressor_decompressed_12;
  wire                _zz_IBusSimplePlugin_decompressor_decompressed_13;
  reg        [9:0]    _zz_IBusSimplePlugin_decompressor_decompressed_14;
  wire       [20:0]   _zz_IBusSimplePlugin_decompressor_decompressed_15;
  wire                _zz_IBusSimplePlugin_decompressor_decompressed_16;
  reg        [4:0]    _zz_IBusSimplePlugin_decompressor_decompressed_17;
  wire       [12:0]   _zz_IBusSimplePlugin_decompressor_decompressed_18;
  wire       [4:0]    _zz_IBusSimplePlugin_decompressor_decompressed_19;
  wire       [4:0]    _zz_IBusSimplePlugin_decompressor_decompressed_20;
  wire       [4:0]    _zz_IBusSimplePlugin_decompressor_decompressed_21;
  wire       [4:0]    switch_Misc_l44;
  wire                _zz_IBusSimplePlugin_decompressor_decompressed_22;
  wire       [1:0]    switch_Misc_l200;
  wire       [1:0]    switch_Misc_l200_1;
  reg        [2:0]    _zz_IBusSimplePlugin_decompressor_decompressed_23;
  reg        [2:0]    _zz_IBusSimplePlugin_decompressor_decompressed_24;
  wire                _zz_IBusSimplePlugin_decompressor_decompressed_25;
  reg        [6:0]    _zz_IBusSimplePlugin_decompressor_decompressed_26;
  wire                IBusSimplePlugin_decompressor_output_fire;
  wire                IBusSimplePlugin_decompressor_bufferFill;
  wire                when_Fetcher_l283;
  wire                when_Fetcher_l286;
  wire                when_Fetcher_l291;
  wire                IBusSimplePlugin_injector_decodeInput_valid;
  wire                IBusSimplePlugin_injector_decodeInput_ready;
  wire       [31:0]   IBusSimplePlugin_injector_decodeInput_payload_pc;
  wire                IBusSimplePlugin_injector_decodeInput_payload_rsp_error;
  wire       [31:0]   IBusSimplePlugin_injector_decodeInput_payload_rsp_inst;
  wire                IBusSimplePlugin_injector_decodeInput_payload_isRvc;
  reg                 _zz_IBusSimplePlugin_injector_decodeInput_valid;
  reg        [31:0]   _zz_IBusSimplePlugin_injector_decodeInput_payload_pc;
  reg                 _zz_IBusSimplePlugin_injector_decodeInput_payload_rsp_error;
  reg        [31:0]   _zz_IBusSimplePlugin_injector_decodeInput_payload_rsp_inst;
  reg                 _zz_IBusSimplePlugin_injector_decodeInput_payload_isRvc;
  reg                 IBusSimplePlugin_injector_nextPcCalc_valids_0;
  wire                when_Fetcher_l329;
  reg                 IBusSimplePlugin_injector_nextPcCalc_valids_1;
  wire                when_Fetcher_l329_1;
  reg                 IBusSimplePlugin_injector_nextPcCalc_valids_2;
  wire                when_Fetcher_l329_2;
  reg                 IBusSimplePlugin_injector_nextPcCalc_valids_3;
  wire                when_Fetcher_l329_3;
  reg        [31:0]   IBusSimplePlugin_injector_formal_rawInDecode;
  wire                IBusSimplePlugin_cmd_valid;
  wire                IBusSimplePlugin_cmd_ready;
  wire       [31:0]   IBusSimplePlugin_cmd_payload_pc;
  wire                IBusSimplePlugin_pending_inc;
  wire                IBusSimplePlugin_pending_dec;
  reg        [2:0]    IBusSimplePlugin_pending_value;
  wire       [2:0]    IBusSimplePlugin_pending_next;
  wire                IBusSimplePlugin_cmdFork_canEmit;
  wire                when_IBusSimplePlugin_l304;
  wire                IBusSimplePlugin_cmd_fire;
  wire                IBusSimplePlugin_rspJoin_rspBuffer_output_valid;
  wire                IBusSimplePlugin_rspJoin_rspBuffer_output_ready;
  wire                IBusSimplePlugin_rspJoin_rspBuffer_output_payload_error;
  wire       [31:0]   IBusSimplePlugin_rspJoin_rspBuffer_output_payload_inst;
  reg        [2:0]    IBusSimplePlugin_rspJoin_rspBuffer_discardCounter;
  wire                IBusSimplePlugin_rspJoin_rspBuffer_flush;
  wire                IBusSimplePlugin_rspJoin_rspBuffer_c_io_pop_fire;
  wire       [31:0]   IBusSimplePlugin_rspJoin_fetchRsp_pc;
  reg                 IBusSimplePlugin_rspJoin_fetchRsp_rsp_error;
  wire       [31:0]   IBusSimplePlugin_rspJoin_fetchRsp_rsp_inst;
  wire                IBusSimplePlugin_rspJoin_fetchRsp_isRvc;
  wire                when_IBusSimplePlugin_l375;
  wire                IBusSimplePlugin_rspJoin_join_valid;
  wire                IBusSimplePlugin_rspJoin_join_ready;
  wire       [31:0]   IBusSimplePlugin_rspJoin_join_payload_pc;
  wire                IBusSimplePlugin_rspJoin_join_payload_rsp_error;
  wire       [31:0]   IBusSimplePlugin_rspJoin_join_payload_rsp_inst;
  wire                IBusSimplePlugin_rspJoin_join_payload_isRvc;
  wire                IBusSimplePlugin_rspJoin_exceptionDetected;
  wire                IBusSimplePlugin_rspJoin_join_fire;
  wire                IBusSimplePlugin_rspJoin_join_fire_1;
  wire                _zz_IBusSimplePlugin_iBusRsp_output_valid;
  wire                _zz_dBus_cmd_valid;
  reg                 execute_DBusSimplePlugin_skipCmd;
  reg        [31:0]   _zz_dBus_cmd_payload_data;
  wire                when_DBusSimplePlugin_l426;
  reg        [3:0]    _zz_execute_DBusSimplePlugin_formalMask;
  wire       [3:0]    execute_DBusSimplePlugin_formalMask;
  wire                when_DBusSimplePlugin_l479;
  reg        [31:0]   writeBack_DBusSimplePlugin_rspShifted;
  wire       [1:0]    switch_Misc_l200_2;
  wire                _zz_writeBack_DBusSimplePlugin_rspFormated;
  reg        [31:0]   _zz_writeBack_DBusSimplePlugin_rspFormated_1;
  wire                _zz_writeBack_DBusSimplePlugin_rspFormated_2;
  reg        [31:0]   _zz_writeBack_DBusSimplePlugin_rspFormated_3;
  reg        [31:0]   writeBack_DBusSimplePlugin_rspFormated;
  wire                when_DBusSimplePlugin_l558;
  wire       [1:0]    CsrPlugin_misa_base;
  wire       [25:0]   CsrPlugin_misa_extensions;
  reg        [1:0]    CsrPlugin_mtvec_mode;
  reg        [29:0]   CsrPlugin_mtvec_base;
  reg        [31:0]   CsrPlugin_mepc;
  reg                 CsrPlugin_mstatus_MIE;
  reg                 CsrPlugin_mstatus_MPIE;
  reg        [1:0]    CsrPlugin_mstatus_MPP;
  reg                 CsrPlugin_mip_MEIP;
  reg                 CsrPlugin_mip_MTIP;
  reg                 CsrPlugin_mip_MSIP;
  reg                 CsrPlugin_mie_MEIE;
  reg                 CsrPlugin_mie_MTIE;
  reg                 CsrPlugin_mie_MSIE;
  reg                 CsrPlugin_mcause_interrupt;
  reg        [3:0]    CsrPlugin_mcause_exceptionCode;
  reg        [31:0]   CsrPlugin_mtval;
  reg        [63:0]   CsrPlugin_mcycle = 64'b0000000000000000000000000000000000000000000000000000000000000000;
  reg        [63:0]   CsrPlugin_minstret = 64'b0000000000000000000000000000000000000000000000000000000000000000;
  wire                _zz_when_CsrPlugin_l952;
  wire                _zz_when_CsrPlugin_l952_1;
  wire                _zz_when_CsrPlugin_l952_2;
  reg                 CsrPlugin_interrupt_valid;
  reg        [3:0]    CsrPlugin_interrupt_code /* verilator public */ ;
  reg        [1:0]    CsrPlugin_interrupt_targetPrivilege;
  wire                when_CsrPlugin_l946;
  wire                when_CsrPlugin_l952;
  wire                when_CsrPlugin_l952_1;
  wire                when_CsrPlugin_l952_2;
  wire                CsrPlugin_exception;
  wire                CsrPlugin_lastStageWasWfi;
  reg                 CsrPlugin_pipelineLiberator_pcValids_0;
  reg                 CsrPlugin_pipelineLiberator_pcValids_1;
  reg                 CsrPlugin_pipelineLiberator_pcValids_2;
  wire                CsrPlugin_pipelineLiberator_active;
  wire                when_CsrPlugin_l980;
  wire                when_CsrPlugin_l980_1;
  wire                when_CsrPlugin_l980_2;
  wire                when_CsrPlugin_l985;
  reg                 CsrPlugin_pipelineLiberator_done;
  wire                CsrPlugin_interruptJump /* verilator public */ ;
  reg                 CsrPlugin_hadException /* verilator public */ ;
  wire       [1:0]    CsrPlugin_targetPrivilege;
  wire       [3:0]    CsrPlugin_trapCause;
  reg        [1:0]    CsrPlugin_xtvec_mode;
  reg        [29:0]   CsrPlugin_xtvec_base;
  wire                when_CsrPlugin_l1019;
  wire                when_CsrPlugin_l1064;
  wire       [1:0]    switch_CsrPlugin_l1068;
  reg                 execute_CsrPlugin_wfiWake;
  wire                when_CsrPlugin_l1116;
  wire                execute_CsrPlugin_blockedBySideEffects;
  reg                 execute_CsrPlugin_illegalAccess;
  reg                 execute_CsrPlugin_illegalInstruction;
  wire                when_CsrPlugin_l1136;
  wire                when_CsrPlugin_l1137;
  reg                 execute_CsrPlugin_writeInstruction;
  reg                 execute_CsrPlugin_readInstruction;
  wire                execute_CsrPlugin_writeEnable;
  wire                execute_CsrPlugin_readEnable;
  wire       [31:0]   execute_CsrPlugin_readToWriteData;
  wire                switch_Misc_l200_3;
  reg        [31:0]   _zz_CsrPlugin_csrMapping_writeDataSignal;
  wire                when_CsrPlugin_l1176;
  wire                when_CsrPlugin_l1180;
  wire       [11:0]   execute_CsrPlugin_csrAddress;
  wire       [29:0]   _zz_decode_BRANCH_CTRL_2;
  wire                _zz_decode_BRANCH_CTRL_3;
  wire                _zz_decode_BRANCH_CTRL_4;
  wire                _zz_decode_BRANCH_CTRL_5;
  wire                _zz_decode_BRANCH_CTRL_6;
  wire                _zz_decode_BRANCH_CTRL_7;
  wire       `Src1CtrlEnum_binary_sequential_type _zz_decode_SRC1_CTRL_2;
  wire       `Src2CtrlEnum_binary_sequential_type _zz_decode_SRC2_CTRL_2;
  wire       `EnvCtrlEnum_binary_sequential_type _zz_decode_ENV_CTRL_2;
  wire       `AluCtrlEnum_binary_sequential_type _zz_decode_ALU_CTRL_2;
  wire       `AluBitwiseCtrlEnum_binary_sequential_type _zz_decode_ALU_BITWISE_CTRL_2;
  wire       `ShiftCtrlEnum_binary_sequential_type _zz_decode_SHIFT_CTRL_2;
  wire       `BranchCtrlEnum_binary_sequential_type _zz_decode_BRANCH_CTRL_8;
  wire                when_RegFilePlugin_l63;
  wire       [4:0]    decode_RegFilePlugin_regFileReadAddress1;
  wire       [4:0]    decode_RegFilePlugin_regFileReadAddress2;
  wire       [31:0]   decode_RegFilePlugin_rs1Data;
  wire       [31:0]   decode_RegFilePlugin_rs2Data;
  reg                 lastStageRegFileWrite_valid /* verilator public */ ;
  reg        [4:0]    lastStageRegFileWrite_payload_address /* verilator public */ ;
  reg        [31:0]   lastStageRegFileWrite_payload_data /* verilator public */ ;
  reg                 _zz_2;
  reg        [31:0]   execute_IntAluPlugin_bitwise;
  reg        [31:0]   _zz_execute_REGFILE_WRITE_DATA;
  reg        [31:0]   _zz_decode_SRC1_1;
  wire                _zz_decode_SRC2_2;
  reg        [19:0]   _zz_decode_SRC2_3;
  wire                _zz_decode_SRC2_4;
  reg        [19:0]   _zz_decode_SRC2_5;
  reg        [31:0]   _zz_decode_SRC2_6;
  reg        [31:0]   execute_SrcPlugin_addSub;
  wire                execute_SrcPlugin_less;
  reg                 execute_MulPlugin_aSigned;
  reg                 execute_MulPlugin_bSigned;
  wire       [31:0]   execute_MulPlugin_a;
  wire       [31:0]   execute_MulPlugin_b;
  wire       [1:0]    switch_MulPlugin_l87;
  wire       [15:0]   execute_MulPlugin_aULow;
  wire       [15:0]   execute_MulPlugin_bULow;
  wire       [16:0]   execute_MulPlugin_aSLow;
  wire       [16:0]   execute_MulPlugin_bSLow;
  wire       [16:0]   execute_MulPlugin_aHigh;
  wire       [16:0]   execute_MulPlugin_bHigh;
  wire       [65:0]   writeBack_MulPlugin_result;
  wire                when_MulPlugin_l147;
  wire       [1:0]    switch_MulPlugin_l148;
  reg        [32:0]   memory_DivPlugin_rs1;
  reg        [31:0]   memory_DivPlugin_rs2;
  reg        [64:0]   memory_DivPlugin_accumulator;
  wire                memory_DivPlugin_frontendOk;
  reg                 memory_DivPlugin_div_needRevert;
  reg                 memory_DivPlugin_div_counter_willIncrement;
  reg                 memory_DivPlugin_div_counter_willClear;
  reg        [5:0]    memory_DivPlugin_div_counter_valueNext;
  reg        [5:0]    memory_DivPlugin_div_counter_value;
  wire                memory_DivPlugin_div_counter_willOverflowIfInc;
  wire                memory_DivPlugin_div_counter_willOverflow;
  reg                 memory_DivPlugin_div_done;
  wire                when_MulDivIterativePlugin_l126;
  wire                when_MulDivIterativePlugin_l126_1;
  reg        [31:0]   memory_DivPlugin_div_result;
  wire                when_MulDivIterativePlugin_l128;
  wire                when_MulDivIterativePlugin_l129;
  wire                when_MulDivIterativePlugin_l132;
  wire       [31:0]   _zz_memory_DivPlugin_div_stage_0_remainderShifted;
  wire       [32:0]   memory_DivPlugin_div_stage_0_remainderShifted;
  wire       [32:0]   memory_DivPlugin_div_stage_0_remainderMinusDenominator;
  wire       [31:0]   memory_DivPlugin_div_stage_0_outRemainder;
  wire       [31:0]   memory_DivPlugin_div_stage_0_outNumerator;
  wire                when_MulDivIterativePlugin_l151;
  wire       [31:0]   _zz_memory_DivPlugin_div_result;
  wire                when_MulDivIterativePlugin_l162;
  wire                _zz_memory_DivPlugin_rs2;
  wire                _zz_memory_DivPlugin_rs1;
  reg        [32:0]   _zz_memory_DivPlugin_rs1_1;
  wire       [4:0]    execute_FullBarrelShifterPlugin_amplitude;
  reg        [31:0]   _zz_execute_FullBarrelShifterPlugin_reversed;
  wire       [31:0]   execute_FullBarrelShifterPlugin_reversed;
  reg        [31:0]   _zz_decode_RS2_3;
  reg                 HazardSimplePlugin_src0Hazard;
  reg                 HazardSimplePlugin_src1Hazard;
  wire                HazardSimplePlugin_writeBackWrites_valid;
  wire       [4:0]    HazardSimplePlugin_writeBackWrites_payload_address;
  wire       [31:0]   HazardSimplePlugin_writeBackWrites_payload_data;
  reg                 HazardSimplePlugin_writeBackBuffer_valid;
  reg        [4:0]    HazardSimplePlugin_writeBackBuffer_payload_address;
  reg        [31:0]   HazardSimplePlugin_writeBackBuffer_payload_data;
  wire                HazardSimplePlugin_addr0Match;
  wire                HazardSimplePlugin_addr1Match;
  wire                when_HazardSimplePlugin_l47;
  wire                when_HazardSimplePlugin_l48;
  wire                when_HazardSimplePlugin_l51;
  wire                when_HazardSimplePlugin_l45;
  wire                when_HazardSimplePlugin_l57;
  wire                when_HazardSimplePlugin_l58;
  wire                when_HazardSimplePlugin_l48_1;
  wire                when_HazardSimplePlugin_l51_1;
  wire                when_HazardSimplePlugin_l45_1;
  wire                when_HazardSimplePlugin_l57_1;
  wire                when_HazardSimplePlugin_l58_1;
  wire                when_HazardSimplePlugin_l48_2;
  wire                when_HazardSimplePlugin_l51_2;
  wire                when_HazardSimplePlugin_l45_2;
  wire                when_HazardSimplePlugin_l57_2;
  wire                when_HazardSimplePlugin_l58_2;
  wire                when_HazardSimplePlugin_l105;
  wire                when_HazardSimplePlugin_l108;
  wire                when_HazardSimplePlugin_l113;
  wire                execute_BranchPlugin_eq;
  wire       [2:0]    switch_Misc_l200_4;
  reg                 _zz_execute_BRANCH_DO;
  reg                 _zz_execute_BRANCH_DO_1;
  wire       [31:0]   execute_BranchPlugin_branch_src1;
  wire                _zz_execute_BranchPlugin_branch_src2;
  reg        [10:0]   _zz_execute_BranchPlugin_branch_src2_1;
  wire                _zz_execute_BranchPlugin_branch_src2_2;
  reg        [19:0]   _zz_execute_BranchPlugin_branch_src2_3;
  wire                _zz_execute_BranchPlugin_branch_src2_4;
  reg        [18:0]   _zz_execute_BranchPlugin_branch_src2_5;
  reg        [31:0]   _zz_execute_BranchPlugin_branch_src2_6;
  wire       [31:0]   execute_BranchPlugin_branch_src2;
  wire       [31:0]   execute_BranchPlugin_branchAdder;
  reg                 DebugPlugin_firstCycle;
  reg                 DebugPlugin_secondCycle;
  reg                 DebugPlugin_resetIt;
  reg                 DebugPlugin_haltIt;
  reg                 DebugPlugin_stepIt;
  reg                 DebugPlugin_isPipBusy;
  reg                 DebugPlugin_godmode;
  wire                when_DebugPlugin_l225;
  reg                 DebugPlugin_haltedByBreak;
  reg                 DebugPlugin_debugUsed /* verilator public */ ;
  reg                 DebugPlugin_disableEbreak;
  wire                DebugPlugin_allowEBreak;
  reg        [31:0]   DebugPlugin_busReadDataReg;
  reg                 _zz_when_DebugPlugin_l244;
  wire                when_DebugPlugin_l244;
  wire       [5:0]    switch_DebugPlugin_l256;
  wire                when_DebugPlugin_l260;
  wire                when_DebugPlugin_l260_1;
  wire                when_DebugPlugin_l261;
  wire                when_DebugPlugin_l261_1;
  wire                when_DebugPlugin_l262;
  wire                when_DebugPlugin_l263;
  wire                when_DebugPlugin_l264;
  wire                when_DebugPlugin_l264_1;
  wire                when_DebugPlugin_l284;
  wire                when_DebugPlugin_l287;
  wire                when_DebugPlugin_l300;
  reg                 _zz_3;
  reg                 DebugPlugin_resetIt_regNext;
  wire                when_DebugPlugin_l316;
  wire                when_Pipeline_l124;
  reg        [31:0]   decode_to_execute_PC;
  wire                when_Pipeline_l124_1;
  reg        [31:0]   execute_to_memory_PC;
  wire                when_Pipeline_l124_2;
  reg        [31:0]   memory_to_writeBack_PC;
  wire                when_Pipeline_l124_3;
  reg        [31:0]   decode_to_execute_INSTRUCTION;
  wire                when_Pipeline_l124_4;
  reg        [31:0]   execute_to_memory_INSTRUCTION;
  wire                when_Pipeline_l124_5;
  reg        [31:0]   memory_to_writeBack_INSTRUCTION;
  wire                when_Pipeline_l124_6;
  reg        [31:0]   decode_to_execute_FORMAL_PC_NEXT;
  wire                when_Pipeline_l124_7;
  reg        [31:0]   execute_to_memory_FORMAL_PC_NEXT;
  wire                when_Pipeline_l124_8;
  reg        [31:0]   memory_to_writeBack_FORMAL_PC_NEXT;
  wire                when_Pipeline_l124_9;
  reg                 decode_to_execute_CSR_WRITE_OPCODE;
  wire                when_Pipeline_l124_10;
  reg                 decode_to_execute_CSR_READ_OPCODE;
  wire                when_Pipeline_l124_11;
  reg                 decode_to_execute_SRC_USE_SUB_LESS;
  wire                when_Pipeline_l124_12;
  reg                 decode_to_execute_MEMORY_ENABLE;
  wire                when_Pipeline_l124_13;
  reg                 execute_to_memory_MEMORY_ENABLE;
  wire                when_Pipeline_l124_14;
  reg                 memory_to_writeBack_MEMORY_ENABLE;
  wire                when_Pipeline_l124_15;
  reg                 decode_to_execute_REGFILE_WRITE_VALID;
  wire                when_Pipeline_l124_16;
  reg                 execute_to_memory_REGFILE_WRITE_VALID;
  wire                when_Pipeline_l124_17;
  reg                 memory_to_writeBack_REGFILE_WRITE_VALID;
  wire                when_Pipeline_l124_18;
  reg                 decode_to_execute_BYPASSABLE_EXECUTE_STAGE;
  wire                when_Pipeline_l124_19;
  reg                 decode_to_execute_BYPASSABLE_MEMORY_STAGE;
  wire                when_Pipeline_l124_20;
  reg                 execute_to_memory_BYPASSABLE_MEMORY_STAGE;
  wire                when_Pipeline_l124_21;
  reg                 decode_to_execute_MEMORY_STORE;
  wire                when_Pipeline_l124_22;
  reg                 execute_to_memory_MEMORY_STORE;
  wire                when_Pipeline_l124_23;
  reg                 memory_to_writeBack_MEMORY_STORE;
  wire                when_Pipeline_l124_24;
  reg                 decode_to_execute_IS_CSR;
  wire                when_Pipeline_l124_25;
  reg        `EnvCtrlEnum_binary_sequential_type decode_to_execute_ENV_CTRL;
  wire                when_Pipeline_l124_26;
  reg        `EnvCtrlEnum_binary_sequential_type execute_to_memory_ENV_CTRL;
  wire                when_Pipeline_l124_27;
  reg        `EnvCtrlEnum_binary_sequential_type memory_to_writeBack_ENV_CTRL;
  wire                when_Pipeline_l124_28;
  reg        `AluCtrlEnum_binary_sequential_type decode_to_execute_ALU_CTRL;
  wire                when_Pipeline_l124_29;
  reg                 decode_to_execute_SRC_LESS_UNSIGNED;
  wire                when_Pipeline_l124_30;
  reg        `AluBitwiseCtrlEnum_binary_sequential_type decode_to_execute_ALU_BITWISE_CTRL;
  wire                when_Pipeline_l124_31;
  reg                 decode_to_execute_IS_MUL;
  wire                when_Pipeline_l124_32;
  reg                 execute_to_memory_IS_MUL;
  wire                when_Pipeline_l124_33;
  reg                 memory_to_writeBack_IS_MUL;
  wire                when_Pipeline_l124_34;
  reg                 decode_to_execute_IS_DIV;
  wire                when_Pipeline_l124_35;
  reg                 execute_to_memory_IS_DIV;
  wire                when_Pipeline_l124_36;
  reg                 decode_to_execute_IS_RS1_SIGNED;
  wire                when_Pipeline_l124_37;
  reg                 decode_to_execute_IS_RS2_SIGNED;
  wire                when_Pipeline_l124_38;
  reg        `ShiftCtrlEnum_binary_sequential_type decode_to_execute_SHIFT_CTRL;
  wire                when_Pipeline_l124_39;
  reg        `ShiftCtrlEnum_binary_sequential_type execute_to_memory_SHIFT_CTRL;
  wire                when_Pipeline_l124_40;
  reg        `BranchCtrlEnum_binary_sequential_type decode_to_execute_BRANCH_CTRL;
  wire                when_Pipeline_l124_41;
  reg        [31:0]   decode_to_execute_RS1;
  wire                when_Pipeline_l124_42;
  reg        [31:0]   decode_to_execute_RS2;
  wire                when_Pipeline_l124_43;
  reg                 decode_to_execute_SRC2_FORCE_ZERO;
  wire                when_Pipeline_l124_44;
  reg        [31:0]   decode_to_execute_SRC1;
  wire                when_Pipeline_l124_45;
  reg        [31:0]   decode_to_execute_SRC2;
  wire                when_Pipeline_l124_46;
  reg                 decode_to_execute_DO_EBREAK;
  wire                when_Pipeline_l124_47;
  reg        [1:0]    execute_to_memory_MEMORY_ADDRESS_LOW;
  wire                when_Pipeline_l124_48;
  reg        [1:0]    memory_to_writeBack_MEMORY_ADDRESS_LOW;
  wire                when_Pipeline_l124_49;
  reg        [31:0]   execute_to_memory_REGFILE_WRITE_DATA;
  wire                when_Pipeline_l124_50;
  reg        [31:0]   memory_to_writeBack_REGFILE_WRITE_DATA;
  wire                when_Pipeline_l124_51;
  reg        [31:0]   execute_to_memory_MUL_LL;
  wire                when_Pipeline_l124_52;
  reg        [33:0]   execute_to_memory_MUL_LH;
  wire                when_Pipeline_l124_53;
  reg        [33:0]   execute_to_memory_MUL_HL;
  wire                when_Pipeline_l124_54;
  reg        [33:0]   execute_to_memory_MUL_HH;
  wire                when_Pipeline_l124_55;
  reg        [33:0]   memory_to_writeBack_MUL_HH;
  wire                when_Pipeline_l124_56;
  reg        [31:0]   execute_to_memory_SHIFT_RIGHT;
  wire                when_Pipeline_l124_57;
  reg                 execute_to_memory_BRANCH_DO;
  wire                when_Pipeline_l124_58;
  reg        [31:0]   execute_to_memory_BRANCH_CALC;
  wire                when_Pipeline_l124_59;
  reg        [31:0]   memory_to_writeBack_MEMORY_READ_DATA;
  wire                when_Pipeline_l124_60;
  reg        [51:0]   memory_to_writeBack_MUL_LOW;
  wire                when_Pipeline_l151;
  wire                when_Pipeline_l154;
  wire                when_Pipeline_l151_1;
  wire                when_Pipeline_l154_1;
  wire                when_Pipeline_l151_2;
  wire                when_Pipeline_l154_2;
  reg        [2:0]    switch_Fetcher_l362;
  wire                when_Fetcher_l360;
  wire                when_Fetcher_l378;
  wire                when_Fetcher_l398;
  wire                when_CsrPlugin_l1264;
  reg                 execute_CsrPlugin_csr_768;
  wire                when_CsrPlugin_l1264_1;
  reg                 execute_CsrPlugin_csr_836;
  wire                when_CsrPlugin_l1264_2;
  reg                 execute_CsrPlugin_csr_772;
  wire                when_CsrPlugin_l1264_3;
  reg                 execute_CsrPlugin_csr_773;
  wire                when_CsrPlugin_l1264_4;
  reg                 execute_CsrPlugin_csr_834;
  reg        [31:0]   _zz_CsrPlugin_csrMapping_readDataInit;
  reg        [31:0]   _zz_CsrPlugin_csrMapping_readDataInit_1;
  reg        [31:0]   _zz_CsrPlugin_csrMapping_readDataInit_2;
  reg        [31:0]   _zz_CsrPlugin_csrMapping_readDataInit_3;
  wire                when_CsrPlugin_l1297;
  wire                when_CsrPlugin_l1302;
  `ifndef SYNTHESIS
  reg [31:0] decode_BRANCH_CTRL_string;
  reg [31:0] _zz_decode_BRANCH_CTRL_string;
  reg [31:0] _zz_decode_to_execute_BRANCH_CTRL_string;
  reg [31:0] _zz_decode_to_execute_BRANCH_CTRL_1_string;
  reg [71:0] _zz_execute_to_memory_SHIFT_CTRL_string;
  reg [71:0] _zz_execute_to_memory_SHIFT_CTRL_1_string;
  reg [71:0] decode_SHIFT_CTRL_string;
  reg [71:0] _zz_decode_SHIFT_CTRL_string;
  reg [71:0] _zz_decode_to_execute_SHIFT_CTRL_string;
  reg [71:0] _zz_decode_to_execute_SHIFT_CTRL_1_string;
  reg [39:0] decode_ALU_BITWISE_CTRL_string;
  reg [39:0] _zz_decode_ALU_BITWISE_CTRL_string;
  reg [39:0] _zz_decode_to_execute_ALU_BITWISE_CTRL_string;
  reg [39:0] _zz_decode_to_execute_ALU_BITWISE_CTRL_1_string;
  reg [63:0] decode_ALU_CTRL_string;
  reg [63:0] _zz_decode_ALU_CTRL_string;
  reg [63:0] _zz_decode_to_execute_ALU_CTRL_string;
  reg [63:0] _zz_decode_to_execute_ALU_CTRL_1_string;
  reg [31:0] _zz_memory_to_writeBack_ENV_CTRL_string;
  reg [31:0] _zz_memory_to_writeBack_ENV_CTRL_1_string;
  reg [31:0] _zz_execute_to_memory_ENV_CTRL_string;
  reg [31:0] _zz_execute_to_memory_ENV_CTRL_1_string;
  reg [31:0] decode_ENV_CTRL_string;
  reg [31:0] _zz_decode_ENV_CTRL_string;
  reg [31:0] _zz_decode_to_execute_ENV_CTRL_string;
  reg [31:0] _zz_decode_to_execute_ENV_CTRL_1_string;
  reg [31:0] execute_BRANCH_CTRL_string;
  reg [31:0] _zz_execute_BRANCH_CTRL_string;
  reg [71:0] memory_SHIFT_CTRL_string;
  reg [71:0] _zz_memory_SHIFT_CTRL_string;
  reg [71:0] execute_SHIFT_CTRL_string;
  reg [71:0] _zz_execute_SHIFT_CTRL_string;
  reg [23:0] decode_SRC2_CTRL_string;
  reg [23:0] _zz_decode_SRC2_CTRL_string;
  reg [95:0] decode_SRC1_CTRL_string;
  reg [95:0] _zz_decode_SRC1_CTRL_string;
  reg [63:0] execute_ALU_CTRL_string;
  reg [63:0] _zz_execute_ALU_CTRL_string;
  reg [39:0] execute_ALU_BITWISE_CTRL_string;
  reg [39:0] _zz_execute_ALU_BITWISE_CTRL_string;
  reg [31:0] _zz_decode_BRANCH_CTRL_1_string;
  reg [71:0] _zz_decode_SHIFT_CTRL_1_string;
  reg [39:0] _zz_decode_ALU_BITWISE_CTRL_1_string;
  reg [63:0] _zz_decode_ALU_CTRL_1_string;
  reg [31:0] _zz_decode_ENV_CTRL_1_string;
  reg [23:0] _zz_decode_SRC2_CTRL_1_string;
  reg [95:0] _zz_decode_SRC1_CTRL_1_string;
  reg [31:0] memory_ENV_CTRL_string;
  reg [31:0] _zz_memory_ENV_CTRL_string;
  reg [31:0] execute_ENV_CTRL_string;
  reg [31:0] _zz_execute_ENV_CTRL_string;
  reg [31:0] writeBack_ENV_CTRL_string;
  reg [31:0] _zz_writeBack_ENV_CTRL_string;
  reg [95:0] _zz_decode_SRC1_CTRL_2_string;
  reg [23:0] _zz_decode_SRC2_CTRL_2_string;
  reg [31:0] _zz_decode_ENV_CTRL_2_string;
  reg [63:0] _zz_decode_ALU_CTRL_2_string;
  reg [39:0] _zz_decode_ALU_BITWISE_CTRL_2_string;
  reg [71:0] _zz_decode_SHIFT_CTRL_2_string;
  reg [31:0] _zz_decode_BRANCH_CTRL_8_string;
  reg [31:0] decode_to_execute_ENV_CTRL_string;
  reg [31:0] execute_to_memory_ENV_CTRL_string;
  reg [31:0] memory_to_writeBack_ENV_CTRL_string;
  reg [63:0] decode_to_execute_ALU_CTRL_string;
  reg [39:0] decode_to_execute_ALU_BITWISE_CTRL_string;
  reg [71:0] decode_to_execute_SHIFT_CTRL_string;
  reg [71:0] execute_to_memory_SHIFT_CTRL_string;
  reg [31:0] decode_to_execute_BRANCH_CTRL_string;
  `endif

  reg [31:0] RegFilePlugin_regFile [0:31] /* verilator public */ ;

  assign _zz_memory_MUL_LOW = ($signed(_zz_memory_MUL_LOW_1) + $signed(_zz_memory_MUL_LOW_5));
  assign _zz_memory_MUL_LOW_1 = ($signed(_zz_memory_MUL_LOW_2) + $signed(_zz_memory_MUL_LOW_3));
  assign _zz_memory_MUL_LOW_2 = 52'h0;
  assign _zz_memory_MUL_LOW_4 = {1'b0,memory_MUL_LL};
  assign _zz_memory_MUL_LOW_3 = {{19{_zz_memory_MUL_LOW_4[32]}}, _zz_memory_MUL_LOW_4};
  assign _zz_memory_MUL_LOW_6 = ({16'd0,memory_MUL_LH} <<< 16);
  assign _zz_memory_MUL_LOW_5 = {{2{_zz_memory_MUL_LOW_6[49]}}, _zz_memory_MUL_LOW_6};
  assign _zz_memory_MUL_LOW_8 = ({16'd0,memory_MUL_HL} <<< 16);
  assign _zz_memory_MUL_LOW_7 = {{2{_zz_memory_MUL_LOW_8[49]}}, _zz_memory_MUL_LOW_8};
  assign _zz_execute_SHIFT_RIGHT_1 = ($signed(_zz_execute_SHIFT_RIGHT_2) >>> execute_FullBarrelShifterPlugin_amplitude);
  assign _zz_execute_SHIFT_RIGHT = _zz_execute_SHIFT_RIGHT_1[31 : 0];
  assign _zz_execute_SHIFT_RIGHT_2 = {((execute_SHIFT_CTRL == `ShiftCtrlEnum_binary_sequential_SRA_1) && execute_FullBarrelShifterPlugin_reversed[31]),execute_FullBarrelShifterPlugin_reversed};
  assign _zz_decode_FORMAL_PC_NEXT_1 = (decode_IS_RVC ? 3'b010 : 3'b100);
  assign _zz_decode_FORMAL_PC_NEXT = {29'd0, _zz_decode_FORMAL_PC_NEXT_1};
  assign _zz_IBusSimplePlugin_jump_pcLoad_payload_1 = (_zz_IBusSimplePlugin_jump_pcLoad_payload & (~ _zz_IBusSimplePlugin_jump_pcLoad_payload_2));
  assign _zz_IBusSimplePlugin_jump_pcLoad_payload_2 = (_zz_IBusSimplePlugin_jump_pcLoad_payload - 2'b01);
  assign _zz_IBusSimplePlugin_fetchPc_pc_1 = {IBusSimplePlugin_fetchPc_inc,2'b00};
  assign _zz_IBusSimplePlugin_fetchPc_pc = {29'd0, _zz_IBusSimplePlugin_fetchPc_pc_1};
  assign _zz_IBusSimplePlugin_decodePc_pcPlus_1 = (decode_IS_RVC ? 3'b010 : 3'b100);
  assign _zz_IBusSimplePlugin_decodePc_pcPlus = {29'd0, _zz_IBusSimplePlugin_decodePc_pcPlus_1};
  assign _zz_IBusSimplePlugin_decompressor_decompressed_27 = {{_zz_IBusSimplePlugin_decompressor_decompressed_10,_zz_IBusSimplePlugin_decompressor_decompressed[6 : 2]},12'h0};
  assign _zz_IBusSimplePlugin_decompressor_decompressed_34 = {{{4'b0000,_zz_IBusSimplePlugin_decompressor_decompressed[8 : 7]},_zz_IBusSimplePlugin_decompressor_decompressed[12 : 9]},2'b00};
  assign _zz_IBusSimplePlugin_decompressor_decompressed_35 = {{{4'b0000,_zz_IBusSimplePlugin_decompressor_decompressed[8 : 7]},_zz_IBusSimplePlugin_decompressor_decompressed[12 : 9]},2'b00};
  assign _zz_IBusSimplePlugin_pending_next = (IBusSimplePlugin_pending_value + _zz_IBusSimplePlugin_pending_next_1);
  assign _zz_IBusSimplePlugin_pending_next_2 = IBusSimplePlugin_pending_inc;
  assign _zz_IBusSimplePlugin_pending_next_1 = {2'd0, _zz_IBusSimplePlugin_pending_next_2};
  assign _zz_IBusSimplePlugin_pending_next_4 = IBusSimplePlugin_pending_dec;
  assign _zz_IBusSimplePlugin_pending_next_3 = {2'd0, _zz_IBusSimplePlugin_pending_next_4};
  assign _zz_IBusSimplePlugin_rspJoin_rspBuffer_discardCounter_1 = (IBusSimplePlugin_rspJoin_rspBuffer_c_io_pop_valid && (IBusSimplePlugin_rspJoin_rspBuffer_discardCounter != 3'b000));
  assign _zz_IBusSimplePlugin_rspJoin_rspBuffer_discardCounter = {2'd0, _zz_IBusSimplePlugin_rspJoin_rspBuffer_discardCounter_1};
  assign _zz_CsrPlugin_jumpInterface_payload = (CsrPlugin_xtvec_base + _zz_CsrPlugin_jumpInterface_payload_1);
  assign _zz_CsrPlugin_jumpInterface_payload_1 = {26'd0, CsrPlugin_trapCause};
  assign _zz__zz_execute_REGFILE_WRITE_DATA = execute_SRC_LESS;
  assign _zz__zz_decode_SRC1_1 = (decode_IS_RVC ? 3'b010 : 3'b100);
  assign _zz__zz_decode_SRC1_1_1 = decode_INSTRUCTION[19 : 15];
  assign _zz__zz_decode_SRC2_4 = {decode_INSTRUCTION[31 : 25],decode_INSTRUCTION[11 : 7]};
  assign _zz_execute_SrcPlugin_addSub = ($signed(_zz_execute_SrcPlugin_addSub_1) + $signed(_zz_execute_SrcPlugin_addSub_4));
  assign _zz_execute_SrcPlugin_addSub_1 = ($signed(_zz_execute_SrcPlugin_addSub_2) + $signed(_zz_execute_SrcPlugin_addSub_3));
  assign _zz_execute_SrcPlugin_addSub_2 = execute_SRC1;
  assign _zz_execute_SrcPlugin_addSub_3 = (execute_SRC_USE_SUB_LESS ? (~ execute_SRC2) : execute_SRC2);
  assign _zz_execute_SrcPlugin_addSub_4 = (execute_SRC_USE_SUB_LESS ? _zz_execute_SrcPlugin_addSub_5 : _zz_execute_SrcPlugin_addSub_6);
  assign _zz_execute_SrcPlugin_addSub_5 = 32'h00000001;
  assign _zz_execute_SrcPlugin_addSub_6 = 32'h0;
  assign _zz_writeBack_MulPlugin_result = {{14{writeBack_MUL_LOW[51]}}, writeBack_MUL_LOW};
  assign _zz_writeBack_MulPlugin_result_1 = ({32'd0,writeBack_MUL_HH} <<< 32);
  assign _zz__zz_decode_RS2_2 = writeBack_MUL_LOW[31 : 0];
  assign _zz__zz_decode_RS2_2_1 = writeBack_MulPlugin_result[63 : 32];
  assign _zz_memory_DivPlugin_div_counter_valueNext_1 = memory_DivPlugin_div_counter_willIncrement;
  assign _zz_memory_DivPlugin_div_counter_valueNext = {5'd0, _zz_memory_DivPlugin_div_counter_valueNext_1};
  assign _zz_memory_DivPlugin_div_stage_0_remainderMinusDenominator = {1'd0, memory_DivPlugin_rs2};
  assign _zz_memory_DivPlugin_div_stage_0_outRemainder = memory_DivPlugin_div_stage_0_remainderMinusDenominator[31:0];
  assign _zz_memory_DivPlugin_div_stage_0_outRemainder_1 = memory_DivPlugin_div_stage_0_remainderShifted[31:0];
  assign _zz_memory_DivPlugin_div_stage_0_outNumerator = {_zz_memory_DivPlugin_div_stage_0_remainderShifted,(! memory_DivPlugin_div_stage_0_remainderMinusDenominator[32])};
  assign _zz_memory_DivPlugin_div_result_1 = _zz_memory_DivPlugin_div_result_2;
  assign _zz_memory_DivPlugin_div_result_2 = _zz_memory_DivPlugin_div_result_3;
  assign _zz_memory_DivPlugin_div_result_3 = ({memory_DivPlugin_div_needRevert,(memory_DivPlugin_div_needRevert ? (~ _zz_memory_DivPlugin_div_result) : _zz_memory_DivPlugin_div_result)} + _zz_memory_DivPlugin_div_result_4);
  assign _zz_memory_DivPlugin_div_result_5 = memory_DivPlugin_div_needRevert;
  assign _zz_memory_DivPlugin_div_result_4 = {32'd0, _zz_memory_DivPlugin_div_result_5};
  assign _zz_memory_DivPlugin_rs1_3 = _zz_memory_DivPlugin_rs1;
  assign _zz_memory_DivPlugin_rs1_2 = {32'd0, _zz_memory_DivPlugin_rs1_3};
  assign _zz_memory_DivPlugin_rs2_2 = _zz_memory_DivPlugin_rs2;
  assign _zz_memory_DivPlugin_rs2_1 = {31'd0, _zz_memory_DivPlugin_rs2_2};
  assign _zz__zz_execute_BranchPlugin_branch_src2 = {{{execute_INSTRUCTION[31],execute_INSTRUCTION[19 : 12]},execute_INSTRUCTION[20]},execute_INSTRUCTION[30 : 21]};
  assign _zz__zz_execute_BranchPlugin_branch_src2_4 = {{{execute_INSTRUCTION[31],execute_INSTRUCTION[7]},execute_INSTRUCTION[30 : 25]},execute_INSTRUCTION[11 : 8]};
  assign _zz_decode_RegFilePlugin_rs1Data = 1'b1;
  assign _zz_decode_RegFilePlugin_rs2Data = 1'b1;
  assign _zz_IBusSimplePlugin_decompressor_decompressed_28 = (_zz_IBusSimplePlugin_decompressor_decompressed[11 : 10] == 2'b01);
  assign _zz_IBusSimplePlugin_decompressor_decompressed_29 = ((_zz_IBusSimplePlugin_decompressor_decompressed[11 : 10] == 2'b11) && (_zz_IBusSimplePlugin_decompressor_decompressed[6 : 5] == 2'b00));
  assign _zz_IBusSimplePlugin_decompressor_decompressed_30 = 7'h0;
  assign _zz_IBusSimplePlugin_decompressor_decompressed_31 = _zz_IBusSimplePlugin_decompressor_decompressed[6 : 2];
  assign _zz_IBusSimplePlugin_decompressor_decompressed_32 = _zz_IBusSimplePlugin_decompressor_decompressed[12];
  assign _zz_IBusSimplePlugin_decompressor_decompressed_33 = _zz_IBusSimplePlugin_decompressor_decompressed[11 : 7];
  assign _zz__zz_decode_BRANCH_CTRL_2 = 32'h10003050;
  assign _zz__zz_decode_BRANCH_CTRL_2_1 = ((decode_INSTRUCTION & 32'h0000001c) == 32'h00000004);
  assign _zz__zz_decode_BRANCH_CTRL_2_2 = ((decode_INSTRUCTION & 32'h00000058) == 32'h00000040);
  assign _zz__zz_decode_BRANCH_CTRL_2_3 = {(_zz__zz_decode_BRANCH_CTRL_2_4 == _zz__zz_decode_BRANCH_CTRL_2_5),(_zz__zz_decode_BRANCH_CTRL_2_6 == _zz__zz_decode_BRANCH_CTRL_2_7)};
  assign _zz__zz_decode_BRANCH_CTRL_2_8 = 2'b00;
  assign _zz__zz_decode_BRANCH_CTRL_2_9 = ({_zz__zz_decode_BRANCH_CTRL_2_10,{_zz__zz_decode_BRANCH_CTRL_2_11,_zz__zz_decode_BRANCH_CTRL_2_13}} != 3'b000);
  assign _zz__zz_decode_BRANCH_CTRL_2_15 = (_zz_decode_BRANCH_CTRL_7 != 1'b0);
  assign _zz__zz_decode_BRANCH_CTRL_2_16 = {(_zz__zz_decode_BRANCH_CTRL_2_17 != _zz__zz_decode_BRANCH_CTRL_2_18),{_zz__zz_decode_BRANCH_CTRL_2_19,{_zz__zz_decode_BRANCH_CTRL_2_22,_zz__zz_decode_BRANCH_CTRL_2_24}}};
  assign _zz__zz_decode_BRANCH_CTRL_2_4 = (decode_INSTRUCTION & 32'h00007034);
  assign _zz__zz_decode_BRANCH_CTRL_2_5 = 32'h00005010;
  assign _zz__zz_decode_BRANCH_CTRL_2_6 = (decode_INSTRUCTION & 32'h02007064);
  assign _zz__zz_decode_BRANCH_CTRL_2_7 = 32'h00005020;
  assign _zz__zz_decode_BRANCH_CTRL_2_10 = ((decode_INSTRUCTION & 32'h40003054) == 32'h40001010);
  assign _zz__zz_decode_BRANCH_CTRL_2_11 = ((decode_INSTRUCTION & _zz__zz_decode_BRANCH_CTRL_2_12) == 32'h00001010);
  assign _zz__zz_decode_BRANCH_CTRL_2_13 = ((decode_INSTRUCTION & _zz__zz_decode_BRANCH_CTRL_2_14) == 32'h00001010);
  assign _zz__zz_decode_BRANCH_CTRL_2_17 = _zz_decode_BRANCH_CTRL_7;
  assign _zz__zz_decode_BRANCH_CTRL_2_18 = 1'b0;
  assign _zz__zz_decode_BRANCH_CTRL_2_19 = ((_zz__zz_decode_BRANCH_CTRL_2_20 == _zz__zz_decode_BRANCH_CTRL_2_21) != 1'b0);
  assign _zz__zz_decode_BRANCH_CTRL_2_22 = (_zz__zz_decode_BRANCH_CTRL_2_23 != 1'b0);
  assign _zz__zz_decode_BRANCH_CTRL_2_24 = {(_zz__zz_decode_BRANCH_CTRL_2_25 != _zz__zz_decode_BRANCH_CTRL_2_26),{_zz__zz_decode_BRANCH_CTRL_2_27,{_zz__zz_decode_BRANCH_CTRL_2_29,_zz__zz_decode_BRANCH_CTRL_2_32}}};
  assign _zz__zz_decode_BRANCH_CTRL_2_12 = 32'h00007034;
  assign _zz__zz_decode_BRANCH_CTRL_2_14 = 32'h02007054;
  assign _zz__zz_decode_BRANCH_CTRL_2_20 = (decode_INSTRUCTION & 32'h02004064);
  assign _zz__zz_decode_BRANCH_CTRL_2_21 = 32'h02004020;
  assign _zz__zz_decode_BRANCH_CTRL_2_23 = ((decode_INSTRUCTION & 32'h02004074) == 32'h02000030);
  assign _zz__zz_decode_BRANCH_CTRL_2_25 = ((decode_INSTRUCTION & 32'h00000064) == 32'h00000024);
  assign _zz__zz_decode_BRANCH_CTRL_2_26 = 1'b0;
  assign _zz__zz_decode_BRANCH_CTRL_2_27 = (((decode_INSTRUCTION & _zz__zz_decode_BRANCH_CTRL_2_28) == 32'h00001000) != 1'b0);
  assign _zz__zz_decode_BRANCH_CTRL_2_29 = ((_zz__zz_decode_BRANCH_CTRL_2_30 == _zz__zz_decode_BRANCH_CTRL_2_31) != 1'b0);
  assign _zz__zz_decode_BRANCH_CTRL_2_32 = {({_zz__zz_decode_BRANCH_CTRL_2_33,_zz__zz_decode_BRANCH_CTRL_2_34} != 2'b00),{(_zz__zz_decode_BRANCH_CTRL_2_35 != _zz__zz_decode_BRANCH_CTRL_2_36),{_zz__zz_decode_BRANCH_CTRL_2_37,{_zz__zz_decode_BRANCH_CTRL_2_38,_zz__zz_decode_BRANCH_CTRL_2_41}}}};
  assign _zz__zz_decode_BRANCH_CTRL_2_28 = 32'h00001000;
  assign _zz__zz_decode_BRANCH_CTRL_2_30 = (decode_INSTRUCTION & 32'h00003000);
  assign _zz__zz_decode_BRANCH_CTRL_2_31 = 32'h00002000;
  assign _zz__zz_decode_BRANCH_CTRL_2_33 = ((decode_INSTRUCTION & 32'h00002010) == 32'h00002000);
  assign _zz__zz_decode_BRANCH_CTRL_2_34 = ((decode_INSTRUCTION & 32'h00005000) == 32'h00001000);
  assign _zz__zz_decode_BRANCH_CTRL_2_35 = ((decode_INSTRUCTION & 32'h00004004) == 32'h00004000);
  assign _zz__zz_decode_BRANCH_CTRL_2_36 = 1'b0;
  assign _zz__zz_decode_BRANCH_CTRL_2_37 = (_zz_decode_BRANCH_CTRL_4 != 1'b0);
  assign _zz__zz_decode_BRANCH_CTRL_2_38 = ({_zz__zz_decode_BRANCH_CTRL_2_39,_zz__zz_decode_BRANCH_CTRL_2_40} != 2'b00);
  assign _zz__zz_decode_BRANCH_CTRL_2_41 = {(_zz__zz_decode_BRANCH_CTRL_2_42 != 1'b0),{(_zz__zz_decode_BRANCH_CTRL_2_43 != _zz__zz_decode_BRANCH_CTRL_2_48),{_zz__zz_decode_BRANCH_CTRL_2_49,{_zz__zz_decode_BRANCH_CTRL_2_52,_zz__zz_decode_BRANCH_CTRL_2_54}}}};
  assign _zz__zz_decode_BRANCH_CTRL_2_39 = ((decode_INSTRUCTION & 32'h00000050) == 32'h00000040);
  assign _zz__zz_decode_BRANCH_CTRL_2_40 = ((decode_INSTRUCTION & 32'h00103040) == 32'h00000040);
  assign _zz__zz_decode_BRANCH_CTRL_2_42 = ((decode_INSTRUCTION & 32'h00103050) == 32'h00000050);
  assign _zz__zz_decode_BRANCH_CTRL_2_43 = {(_zz__zz_decode_BRANCH_CTRL_2_44 == _zz__zz_decode_BRANCH_CTRL_2_45),(_zz__zz_decode_BRANCH_CTRL_2_46 == _zz__zz_decode_BRANCH_CTRL_2_47)};
  assign _zz__zz_decode_BRANCH_CTRL_2_48 = 2'b00;
  assign _zz__zz_decode_BRANCH_CTRL_2_49 = ({_zz__zz_decode_BRANCH_CTRL_2_50,_zz__zz_decode_BRANCH_CTRL_2_51} != 2'b00);
  assign _zz__zz_decode_BRANCH_CTRL_2_52 = (_zz__zz_decode_BRANCH_CTRL_2_53 != 1'b0);
  assign _zz__zz_decode_BRANCH_CTRL_2_54 = {(_zz__zz_decode_BRANCH_CTRL_2_55 != _zz__zz_decode_BRANCH_CTRL_2_66),{_zz__zz_decode_BRANCH_CTRL_2_67,{_zz__zz_decode_BRANCH_CTRL_2_80,_zz__zz_decode_BRANCH_CTRL_2_97}}};
  assign _zz__zz_decode_BRANCH_CTRL_2_44 = (decode_INSTRUCTION & 32'h00001050);
  assign _zz__zz_decode_BRANCH_CTRL_2_45 = 32'h00001050;
  assign _zz__zz_decode_BRANCH_CTRL_2_46 = (decode_INSTRUCTION & 32'h00002050);
  assign _zz__zz_decode_BRANCH_CTRL_2_47 = 32'h00002050;
  assign _zz__zz_decode_BRANCH_CTRL_2_50 = ((decode_INSTRUCTION & 32'h00000034) == 32'h00000020);
  assign _zz__zz_decode_BRANCH_CTRL_2_51 = ((decode_INSTRUCTION & 32'h00000064) == 32'h00000020);
  assign _zz__zz_decode_BRANCH_CTRL_2_53 = ((decode_INSTRUCTION & 32'h00000020) == 32'h00000020);
  assign _zz__zz_decode_BRANCH_CTRL_2_55 = {(_zz__zz_decode_BRANCH_CTRL_2_56 == _zz__zz_decode_BRANCH_CTRL_2_57),{_zz_decode_BRANCH_CTRL_5,{_zz__zz_decode_BRANCH_CTRL_2_58,_zz__zz_decode_BRANCH_CTRL_2_61}}};
  assign _zz__zz_decode_BRANCH_CTRL_2_66 = 5'h0;
  assign _zz__zz_decode_BRANCH_CTRL_2_67 = ({_zz_decode_BRANCH_CTRL_5,{_zz__zz_decode_BRANCH_CTRL_2_68,_zz__zz_decode_BRANCH_CTRL_2_71}} != 5'h0);
  assign _zz__zz_decode_BRANCH_CTRL_2_80 = ({_zz__zz_decode_BRANCH_CTRL_2_81,_zz__zz_decode_BRANCH_CTRL_2_82} != 6'h0);
  assign _zz__zz_decode_BRANCH_CTRL_2_97 = {(_zz__zz_decode_BRANCH_CTRL_2_98 != _zz__zz_decode_BRANCH_CTRL_2_101),{_zz__zz_decode_BRANCH_CTRL_2_102,{_zz__zz_decode_BRANCH_CTRL_2_107,_zz__zz_decode_BRANCH_CTRL_2_117}}};
  assign _zz__zz_decode_BRANCH_CTRL_2_56 = (decode_INSTRUCTION & 32'h00000040);
  assign _zz__zz_decode_BRANCH_CTRL_2_57 = 32'h00000040;
  assign _zz__zz_decode_BRANCH_CTRL_2_58 = (_zz__zz_decode_BRANCH_CTRL_2_59 == _zz__zz_decode_BRANCH_CTRL_2_60);
  assign _zz__zz_decode_BRANCH_CTRL_2_61 = {_zz__zz_decode_BRANCH_CTRL_2_62,_zz__zz_decode_BRANCH_CTRL_2_64};
  assign _zz__zz_decode_BRANCH_CTRL_2_68 = (_zz__zz_decode_BRANCH_CTRL_2_69 == _zz__zz_decode_BRANCH_CTRL_2_70);
  assign _zz__zz_decode_BRANCH_CTRL_2_71 = {_zz__zz_decode_BRANCH_CTRL_2_72,{_zz__zz_decode_BRANCH_CTRL_2_74,_zz__zz_decode_BRANCH_CTRL_2_77}};
  assign _zz__zz_decode_BRANCH_CTRL_2_81 = _zz_decode_BRANCH_CTRL_6;
  assign _zz__zz_decode_BRANCH_CTRL_2_82 = {_zz__zz_decode_BRANCH_CTRL_2_83,{_zz__zz_decode_BRANCH_CTRL_2_85,_zz__zz_decode_BRANCH_CTRL_2_88}};
  assign _zz__zz_decode_BRANCH_CTRL_2_98 = {_zz_decode_BRANCH_CTRL_5,_zz__zz_decode_BRANCH_CTRL_2_99};
  assign _zz__zz_decode_BRANCH_CTRL_2_101 = 2'b00;
  assign _zz__zz_decode_BRANCH_CTRL_2_102 = ({_zz__zz_decode_BRANCH_CTRL_2_103,_zz__zz_decode_BRANCH_CTRL_2_104} != 2'b00);
  assign _zz__zz_decode_BRANCH_CTRL_2_107 = (_zz__zz_decode_BRANCH_CTRL_2_108 != _zz__zz_decode_BRANCH_CTRL_2_116);
  assign _zz__zz_decode_BRANCH_CTRL_2_117 = {_zz__zz_decode_BRANCH_CTRL_2_118,{_zz__zz_decode_BRANCH_CTRL_2_121,_zz__zz_decode_BRANCH_CTRL_2_127}};
  assign _zz__zz_decode_BRANCH_CTRL_2_59 = (decode_INSTRUCTION & 32'h00004020);
  assign _zz__zz_decode_BRANCH_CTRL_2_60 = 32'h00004020;
  assign _zz__zz_decode_BRANCH_CTRL_2_62 = ((decode_INSTRUCTION & _zz__zz_decode_BRANCH_CTRL_2_63) == 32'h00000010);
  assign _zz__zz_decode_BRANCH_CTRL_2_64 = ((decode_INSTRUCTION & _zz__zz_decode_BRANCH_CTRL_2_65) == 32'h00000020);
  assign _zz__zz_decode_BRANCH_CTRL_2_69 = (decode_INSTRUCTION & 32'h00002030);
  assign _zz__zz_decode_BRANCH_CTRL_2_70 = 32'h00002010;
  assign _zz__zz_decode_BRANCH_CTRL_2_72 = ((decode_INSTRUCTION & _zz__zz_decode_BRANCH_CTRL_2_73) == 32'h00000010);
  assign _zz__zz_decode_BRANCH_CTRL_2_74 = (_zz__zz_decode_BRANCH_CTRL_2_75 == _zz__zz_decode_BRANCH_CTRL_2_76);
  assign _zz__zz_decode_BRANCH_CTRL_2_77 = (_zz__zz_decode_BRANCH_CTRL_2_78 == _zz__zz_decode_BRANCH_CTRL_2_79);
  assign _zz__zz_decode_BRANCH_CTRL_2_83 = ((decode_INSTRUCTION & _zz__zz_decode_BRANCH_CTRL_2_84) == 32'h00001010);
  assign _zz__zz_decode_BRANCH_CTRL_2_85 = (_zz__zz_decode_BRANCH_CTRL_2_86 == _zz__zz_decode_BRANCH_CTRL_2_87);
  assign _zz__zz_decode_BRANCH_CTRL_2_88 = {_zz__zz_decode_BRANCH_CTRL_2_89,{_zz__zz_decode_BRANCH_CTRL_2_91,_zz__zz_decode_BRANCH_CTRL_2_94}};
  assign _zz__zz_decode_BRANCH_CTRL_2_99 = ((decode_INSTRUCTION & _zz__zz_decode_BRANCH_CTRL_2_100) == 32'h00000020);
  assign _zz__zz_decode_BRANCH_CTRL_2_103 = _zz_decode_BRANCH_CTRL_5;
  assign _zz__zz_decode_BRANCH_CTRL_2_104 = (_zz__zz_decode_BRANCH_CTRL_2_105 == _zz__zz_decode_BRANCH_CTRL_2_106);
  assign _zz__zz_decode_BRANCH_CTRL_2_108 = {_zz__zz_decode_BRANCH_CTRL_2_109,{_zz__zz_decode_BRANCH_CTRL_2_111,_zz__zz_decode_BRANCH_CTRL_2_114}};
  assign _zz__zz_decode_BRANCH_CTRL_2_116 = 4'b0000;
  assign _zz__zz_decode_BRANCH_CTRL_2_118 = (_zz__zz_decode_BRANCH_CTRL_2_119 != 1'b0);
  assign _zz__zz_decode_BRANCH_CTRL_2_121 = (_zz__zz_decode_BRANCH_CTRL_2_122 != _zz__zz_decode_BRANCH_CTRL_2_126);
  assign _zz__zz_decode_BRANCH_CTRL_2_127 = {_zz__zz_decode_BRANCH_CTRL_2_128,_zz__zz_decode_BRANCH_CTRL_2_131};
  assign _zz__zz_decode_BRANCH_CTRL_2_63 = 32'h00000030;
  assign _zz__zz_decode_BRANCH_CTRL_2_65 = 32'h02000020;
  assign _zz__zz_decode_BRANCH_CTRL_2_73 = 32'h00001030;
  assign _zz__zz_decode_BRANCH_CTRL_2_75 = (decode_INSTRUCTION & 32'h02002060);
  assign _zz__zz_decode_BRANCH_CTRL_2_76 = 32'h00002020;
  assign _zz__zz_decode_BRANCH_CTRL_2_78 = (decode_INSTRUCTION & 32'h02003020);
  assign _zz__zz_decode_BRANCH_CTRL_2_79 = 32'h00000020;
  assign _zz__zz_decode_BRANCH_CTRL_2_84 = 32'h00001010;
  assign _zz__zz_decode_BRANCH_CTRL_2_86 = (decode_INSTRUCTION & 32'h00002010);
  assign _zz__zz_decode_BRANCH_CTRL_2_87 = 32'h00002010;
  assign _zz__zz_decode_BRANCH_CTRL_2_89 = ((decode_INSTRUCTION & _zz__zz_decode_BRANCH_CTRL_2_90) == 32'h00000010);
  assign _zz__zz_decode_BRANCH_CTRL_2_91 = (_zz__zz_decode_BRANCH_CTRL_2_92 == _zz__zz_decode_BRANCH_CTRL_2_93);
  assign _zz__zz_decode_BRANCH_CTRL_2_94 = (_zz__zz_decode_BRANCH_CTRL_2_95 == _zz__zz_decode_BRANCH_CTRL_2_96);
  assign _zz__zz_decode_BRANCH_CTRL_2_100 = 32'h00000070;
  assign _zz__zz_decode_BRANCH_CTRL_2_105 = (decode_INSTRUCTION & 32'h00000020);
  assign _zz__zz_decode_BRANCH_CTRL_2_106 = 32'h0;
  assign _zz__zz_decode_BRANCH_CTRL_2_109 = ((decode_INSTRUCTION & _zz__zz_decode_BRANCH_CTRL_2_110) == 32'h0);
  assign _zz__zz_decode_BRANCH_CTRL_2_111 = (_zz__zz_decode_BRANCH_CTRL_2_112 == _zz__zz_decode_BRANCH_CTRL_2_113);
  assign _zz__zz_decode_BRANCH_CTRL_2_114 = {_zz_decode_BRANCH_CTRL_4,_zz__zz_decode_BRANCH_CTRL_2_115};
  assign _zz__zz_decode_BRANCH_CTRL_2_119 = ((decode_INSTRUCTION & _zz__zz_decode_BRANCH_CTRL_2_120) == 32'h0);
  assign _zz__zz_decode_BRANCH_CTRL_2_122 = {_zz__zz_decode_BRANCH_CTRL_2_123,{_zz__zz_decode_BRANCH_CTRL_2_124,_zz__zz_decode_BRANCH_CTRL_2_125}};
  assign _zz__zz_decode_BRANCH_CTRL_2_126 = 3'b000;
  assign _zz__zz_decode_BRANCH_CTRL_2_128 = ({_zz__zz_decode_BRANCH_CTRL_2_129,_zz__zz_decode_BRANCH_CTRL_2_130} != 2'b00);
  assign _zz__zz_decode_BRANCH_CTRL_2_131 = ({_zz__zz_decode_BRANCH_CTRL_2_132,_zz__zz_decode_BRANCH_CTRL_2_133} != 2'b00);
  assign _zz__zz_decode_BRANCH_CTRL_2_90 = 32'h00000050;
  assign _zz__zz_decode_BRANCH_CTRL_2_92 = (decode_INSTRUCTION & 32'h0000000c);
  assign _zz__zz_decode_BRANCH_CTRL_2_93 = 32'h00000004;
  assign _zz__zz_decode_BRANCH_CTRL_2_95 = (decode_INSTRUCTION & 32'h00000028);
  assign _zz__zz_decode_BRANCH_CTRL_2_96 = 32'h0;
  assign _zz__zz_decode_BRANCH_CTRL_2_110 = 32'h00000044;
  assign _zz__zz_decode_BRANCH_CTRL_2_112 = (decode_INSTRUCTION & 32'h00000018);
  assign _zz__zz_decode_BRANCH_CTRL_2_113 = 32'h0;
  assign _zz__zz_decode_BRANCH_CTRL_2_115 = ((decode_INSTRUCTION & 32'h00005004) == 32'h00001000);
  assign _zz__zz_decode_BRANCH_CTRL_2_120 = 32'h00000058;
  assign _zz__zz_decode_BRANCH_CTRL_2_123 = ((decode_INSTRUCTION & 32'h00000044) == 32'h00000040);
  assign _zz__zz_decode_BRANCH_CTRL_2_124 = ((decode_INSTRUCTION & 32'h00002014) == 32'h00002010);
  assign _zz__zz_decode_BRANCH_CTRL_2_125 = ((decode_INSTRUCTION & 32'h40000034) == 32'h40000030);
  assign _zz__zz_decode_BRANCH_CTRL_2_129 = ((decode_INSTRUCTION & 32'h00000014) == 32'h00000004);
  assign _zz__zz_decode_BRANCH_CTRL_2_130 = _zz_decode_BRANCH_CTRL_3;
  assign _zz__zz_decode_BRANCH_CTRL_2_132 = ((decode_INSTRUCTION & 32'h00000044) == 32'h00000004);
  assign _zz__zz_decode_BRANCH_CTRL_2_133 = _zz_decode_BRANCH_CTRL_3;
  always @(posedge io_mainClk) begin
    if(_zz_decode_RegFilePlugin_rs1Data) begin
      _zz_RegFilePlugin_regFile_port0 <= RegFilePlugin_regFile[decode_RegFilePlugin_regFileReadAddress1];
    end
  end

  always @(posedge io_mainClk) begin
    if(_zz_decode_RegFilePlugin_rs2Data) begin
      _zz_RegFilePlugin_regFile_port1 <= RegFilePlugin_regFile[decode_RegFilePlugin_regFileReadAddress2];
    end
  end

  always @(posedge io_mainClk) begin
    if(_zz_1) begin
      RegFilePlugin_regFile[lastStageRegFileWrite_payload_address] <= lastStageRegFileWrite_payload_data;
    end
  end

  StreamFifoLowLatency IBusSimplePlugin_rspJoin_rspBuffer_c (
    .io_push_valid            (iBus_rsp_valid                                             ), //i
    .io_push_ready            (IBusSimplePlugin_rspJoin_rspBuffer_c_io_push_ready         ), //o
    .io_push_payload_error    (iBus_rsp_payload_error                                     ), //i
    .io_push_payload_inst     (iBus_rsp_payload_inst                                      ), //i
    .io_pop_valid             (IBusSimplePlugin_rspJoin_rspBuffer_c_io_pop_valid          ), //o
    .io_pop_ready             (IBusSimplePlugin_rspJoin_rspBuffer_c_io_pop_ready          ), //i
    .io_pop_payload_error     (IBusSimplePlugin_rspJoin_rspBuffer_c_io_pop_payload_error  ), //o
    .io_pop_payload_inst      (IBusSimplePlugin_rspJoin_rspBuffer_c_io_pop_payload_inst   ), //o
    .io_flush                 (1'b0                                                       ), //i
    .io_occupancy             (IBusSimplePlugin_rspJoin_rspBuffer_c_io_occupancy          ), //o
    .io_mainClk               (io_mainClk                                                 ), //i
    .resetCtrl_systemReset    (resetCtrl_systemReset                                      )  //i
  );
  `ifndef SYNTHESIS
  always @(*) begin
    case(decode_BRANCH_CTRL)
      `BranchCtrlEnum_binary_sequential_INC : decode_BRANCH_CTRL_string = "INC ";
      `BranchCtrlEnum_binary_sequential_B : decode_BRANCH_CTRL_string = "B   ";
      `BranchCtrlEnum_binary_sequential_JAL : decode_BRANCH_CTRL_string = "JAL ";
      `BranchCtrlEnum_binary_sequential_JALR : decode_BRANCH_CTRL_string = "JALR";
      default : decode_BRANCH_CTRL_string = "????";
    endcase
  end
  always @(*) begin
    case(_zz_decode_BRANCH_CTRL)
      `BranchCtrlEnum_binary_sequential_INC : _zz_decode_BRANCH_CTRL_string = "INC ";
      `BranchCtrlEnum_binary_sequential_B : _zz_decode_BRANCH_CTRL_string = "B   ";
      `BranchCtrlEnum_binary_sequential_JAL : _zz_decode_BRANCH_CTRL_string = "JAL ";
      `BranchCtrlEnum_binary_sequential_JALR : _zz_decode_BRANCH_CTRL_string = "JALR";
      default : _zz_decode_BRANCH_CTRL_string = "????";
    endcase
  end
  always @(*) begin
    case(_zz_decode_to_execute_BRANCH_CTRL)
      `BranchCtrlEnum_binary_sequential_INC : _zz_decode_to_execute_BRANCH_CTRL_string = "INC ";
      `BranchCtrlEnum_binary_sequential_B : _zz_decode_to_execute_BRANCH_CTRL_string = "B   ";
      `BranchCtrlEnum_binary_sequential_JAL : _zz_decode_to_execute_BRANCH_CTRL_string = "JAL ";
      `BranchCtrlEnum_binary_sequential_JALR : _zz_decode_to_execute_BRANCH_CTRL_string = "JALR";
      default : _zz_decode_to_execute_BRANCH_CTRL_string = "????";
    endcase
  end
  always @(*) begin
    case(_zz_decode_to_execute_BRANCH_CTRL_1)
      `BranchCtrlEnum_binary_sequential_INC : _zz_decode_to_execute_BRANCH_CTRL_1_string = "INC ";
      `BranchCtrlEnum_binary_sequential_B : _zz_decode_to_execute_BRANCH_CTRL_1_string = "B   ";
      `BranchCtrlEnum_binary_sequential_JAL : _zz_decode_to_execute_BRANCH_CTRL_1_string = "JAL ";
      `BranchCtrlEnum_binary_sequential_JALR : _zz_decode_to_execute_BRANCH_CTRL_1_string = "JALR";
      default : _zz_decode_to_execute_BRANCH_CTRL_1_string = "????";
    endcase
  end
  always @(*) begin
    case(_zz_execute_to_memory_SHIFT_CTRL)
      `ShiftCtrlEnum_binary_sequential_DISABLE_1 : _zz_execute_to_memory_SHIFT_CTRL_string = "DISABLE_1";
      `ShiftCtrlEnum_binary_sequential_SLL_1 : _zz_execute_to_memory_SHIFT_CTRL_string = "SLL_1    ";
      `ShiftCtrlEnum_binary_sequential_SRL_1 : _zz_execute_to_memory_SHIFT_CTRL_string = "SRL_1    ";
      `ShiftCtrlEnum_binary_sequential_SRA_1 : _zz_execute_to_memory_SHIFT_CTRL_string = "SRA_1    ";
      default : _zz_execute_to_memory_SHIFT_CTRL_string = "?????????";
    endcase
  end
  always @(*) begin
    case(_zz_execute_to_memory_SHIFT_CTRL_1)
      `ShiftCtrlEnum_binary_sequential_DISABLE_1 : _zz_execute_to_memory_SHIFT_CTRL_1_string = "DISABLE_1";
      `ShiftCtrlEnum_binary_sequential_SLL_1 : _zz_execute_to_memory_SHIFT_CTRL_1_string = "SLL_1    ";
      `ShiftCtrlEnum_binary_sequential_SRL_1 : _zz_execute_to_memory_SHIFT_CTRL_1_string = "SRL_1    ";
      `ShiftCtrlEnum_binary_sequential_SRA_1 : _zz_execute_to_memory_SHIFT_CTRL_1_string = "SRA_1    ";
      default : _zz_execute_to_memory_SHIFT_CTRL_1_string = "?????????";
    endcase
  end
  always @(*) begin
    case(decode_SHIFT_CTRL)
      `ShiftCtrlEnum_binary_sequential_DISABLE_1 : decode_SHIFT_CTRL_string = "DISABLE_1";
      `ShiftCtrlEnum_binary_sequential_SLL_1 : decode_SHIFT_CTRL_string = "SLL_1    ";
      `ShiftCtrlEnum_binary_sequential_SRL_1 : decode_SHIFT_CTRL_string = "SRL_1    ";
      `ShiftCtrlEnum_binary_sequential_SRA_1 : decode_SHIFT_CTRL_string = "SRA_1    ";
      default : decode_SHIFT_CTRL_string = "?????????";
    endcase
  end
  always @(*) begin
    case(_zz_decode_SHIFT_CTRL)
      `ShiftCtrlEnum_binary_sequential_DISABLE_1 : _zz_decode_SHIFT_CTRL_string = "DISABLE_1";
      `ShiftCtrlEnum_binary_sequential_SLL_1 : _zz_decode_SHIFT_CTRL_string = "SLL_1    ";
      `ShiftCtrlEnum_binary_sequential_SRL_1 : _zz_decode_SHIFT_CTRL_string = "SRL_1    ";
      `ShiftCtrlEnum_binary_sequential_SRA_1 : _zz_decode_SHIFT_CTRL_string = "SRA_1    ";
      default : _zz_decode_SHIFT_CTRL_string = "?????????";
    endcase
  end
  always @(*) begin
    case(_zz_decode_to_execute_SHIFT_CTRL)
      `ShiftCtrlEnum_binary_sequential_DISABLE_1 : _zz_decode_to_execute_SHIFT_CTRL_string = "DISABLE_1";
      `ShiftCtrlEnum_binary_sequential_SLL_1 : _zz_decode_to_execute_SHIFT_CTRL_string = "SLL_1    ";
      `ShiftCtrlEnum_binary_sequential_SRL_1 : _zz_decode_to_execute_SHIFT_CTRL_string = "SRL_1    ";
      `ShiftCtrlEnum_binary_sequential_SRA_1 : _zz_decode_to_execute_SHIFT_CTRL_string = "SRA_1    ";
      default : _zz_decode_to_execute_SHIFT_CTRL_string = "?????????";
    endcase
  end
  always @(*) begin
    case(_zz_decode_to_execute_SHIFT_CTRL_1)
      `ShiftCtrlEnum_binary_sequential_DISABLE_1 : _zz_decode_to_execute_SHIFT_CTRL_1_string = "DISABLE_1";
      `ShiftCtrlEnum_binary_sequential_SLL_1 : _zz_decode_to_execute_SHIFT_CTRL_1_string = "SLL_1    ";
      `ShiftCtrlEnum_binary_sequential_SRL_1 : _zz_decode_to_execute_SHIFT_CTRL_1_string = "SRL_1    ";
      `ShiftCtrlEnum_binary_sequential_SRA_1 : _zz_decode_to_execute_SHIFT_CTRL_1_string = "SRA_1    ";
      default : _zz_decode_to_execute_SHIFT_CTRL_1_string = "?????????";
    endcase
  end
  always @(*) begin
    case(decode_ALU_BITWISE_CTRL)
      `AluBitwiseCtrlEnum_binary_sequential_XOR_1 : decode_ALU_BITWISE_CTRL_string = "XOR_1";
      `AluBitwiseCtrlEnum_binary_sequential_OR_1 : decode_ALU_BITWISE_CTRL_string = "OR_1 ";
      `AluBitwiseCtrlEnum_binary_sequential_AND_1 : decode_ALU_BITWISE_CTRL_string = "AND_1";
      default : decode_ALU_BITWISE_CTRL_string = "?????";
    endcase
  end
  always @(*) begin
    case(_zz_decode_ALU_BITWISE_CTRL)
      `AluBitwiseCtrlEnum_binary_sequential_XOR_1 : _zz_decode_ALU_BITWISE_CTRL_string = "XOR_1";
      `AluBitwiseCtrlEnum_binary_sequential_OR_1 : _zz_decode_ALU_BITWISE_CTRL_string = "OR_1 ";
      `AluBitwiseCtrlEnum_binary_sequential_AND_1 : _zz_decode_ALU_BITWISE_CTRL_string = "AND_1";
      default : _zz_decode_ALU_BITWISE_CTRL_string = "?????";
    endcase
  end
  always @(*) begin
    case(_zz_decode_to_execute_ALU_BITWISE_CTRL)
      `AluBitwiseCtrlEnum_binary_sequential_XOR_1 : _zz_decode_to_execute_ALU_BITWISE_CTRL_string = "XOR_1";
      `AluBitwiseCtrlEnum_binary_sequential_OR_1 : _zz_decode_to_execute_ALU_BITWISE_CTRL_string = "OR_1 ";
      `AluBitwiseCtrlEnum_binary_sequential_AND_1 : _zz_decode_to_execute_ALU_BITWISE_CTRL_string = "AND_1";
      default : _zz_decode_to_execute_ALU_BITWISE_CTRL_string = "?????";
    endcase
  end
  always @(*) begin
    case(_zz_decode_to_execute_ALU_BITWISE_CTRL_1)
      `AluBitwiseCtrlEnum_binary_sequential_XOR_1 : _zz_decode_to_execute_ALU_BITWISE_CTRL_1_string = "XOR_1";
      `AluBitwiseCtrlEnum_binary_sequential_OR_1 : _zz_decode_to_execute_ALU_BITWISE_CTRL_1_string = "OR_1 ";
      `AluBitwiseCtrlEnum_binary_sequential_AND_1 : _zz_decode_to_execute_ALU_BITWISE_CTRL_1_string = "AND_1";
      default : _zz_decode_to_execute_ALU_BITWISE_CTRL_1_string = "?????";
    endcase
  end
  always @(*) begin
    case(decode_ALU_CTRL)
      `AluCtrlEnum_binary_sequential_ADD_SUB : decode_ALU_CTRL_string = "ADD_SUB ";
      `AluCtrlEnum_binary_sequential_SLT_SLTU : decode_ALU_CTRL_string = "SLT_SLTU";
      `AluCtrlEnum_binary_sequential_BITWISE : decode_ALU_CTRL_string = "BITWISE ";
      default : decode_ALU_CTRL_string = "????????";
    endcase
  end
  always @(*) begin
    case(_zz_decode_ALU_CTRL)
      `AluCtrlEnum_binary_sequential_ADD_SUB : _zz_decode_ALU_CTRL_string = "ADD_SUB ";
      `AluCtrlEnum_binary_sequential_SLT_SLTU : _zz_decode_ALU_CTRL_string = "SLT_SLTU";
      `AluCtrlEnum_binary_sequential_BITWISE : _zz_decode_ALU_CTRL_string = "BITWISE ";
      default : _zz_decode_ALU_CTRL_string = "????????";
    endcase
  end
  always @(*) begin
    case(_zz_decode_to_execute_ALU_CTRL)
      `AluCtrlEnum_binary_sequential_ADD_SUB : _zz_decode_to_execute_ALU_CTRL_string = "ADD_SUB ";
      `AluCtrlEnum_binary_sequential_SLT_SLTU : _zz_decode_to_execute_ALU_CTRL_string = "SLT_SLTU";
      `AluCtrlEnum_binary_sequential_BITWISE : _zz_decode_to_execute_ALU_CTRL_string = "BITWISE ";
      default : _zz_decode_to_execute_ALU_CTRL_string = "????????";
    endcase
  end
  always @(*) begin
    case(_zz_decode_to_execute_ALU_CTRL_1)
      `AluCtrlEnum_binary_sequential_ADD_SUB : _zz_decode_to_execute_ALU_CTRL_1_string = "ADD_SUB ";
      `AluCtrlEnum_binary_sequential_SLT_SLTU : _zz_decode_to_execute_ALU_CTRL_1_string = "SLT_SLTU";
      `AluCtrlEnum_binary_sequential_BITWISE : _zz_decode_to_execute_ALU_CTRL_1_string = "BITWISE ";
      default : _zz_decode_to_execute_ALU_CTRL_1_string = "????????";
    endcase
  end
  always @(*) begin
    case(_zz_memory_to_writeBack_ENV_CTRL)
      `EnvCtrlEnum_binary_sequential_NONE : _zz_memory_to_writeBack_ENV_CTRL_string = "NONE";
      `EnvCtrlEnum_binary_sequential_XRET : _zz_memory_to_writeBack_ENV_CTRL_string = "XRET";
      default : _zz_memory_to_writeBack_ENV_CTRL_string = "????";
    endcase
  end
  always @(*) begin
    case(_zz_memory_to_writeBack_ENV_CTRL_1)
      `EnvCtrlEnum_binary_sequential_NONE : _zz_memory_to_writeBack_ENV_CTRL_1_string = "NONE";
      `EnvCtrlEnum_binary_sequential_XRET : _zz_memory_to_writeBack_ENV_CTRL_1_string = "XRET";
      default : _zz_memory_to_writeBack_ENV_CTRL_1_string = "????";
    endcase
  end
  always @(*) begin
    case(_zz_execute_to_memory_ENV_CTRL)
      `EnvCtrlEnum_binary_sequential_NONE : _zz_execute_to_memory_ENV_CTRL_string = "NONE";
      `EnvCtrlEnum_binary_sequential_XRET : _zz_execute_to_memory_ENV_CTRL_string = "XRET";
      default : _zz_execute_to_memory_ENV_CTRL_string = "????";
    endcase
  end
  always @(*) begin
    case(_zz_execute_to_memory_ENV_CTRL_1)
      `EnvCtrlEnum_binary_sequential_NONE : _zz_execute_to_memory_ENV_CTRL_1_string = "NONE";
      `EnvCtrlEnum_binary_sequential_XRET : _zz_execute_to_memory_ENV_CTRL_1_string = "XRET";
      default : _zz_execute_to_memory_ENV_CTRL_1_string = "????";
    endcase
  end
  always @(*) begin
    case(decode_ENV_CTRL)
      `EnvCtrlEnum_binary_sequential_NONE : decode_ENV_CTRL_string = "NONE";
      `EnvCtrlEnum_binary_sequential_XRET : decode_ENV_CTRL_string = "XRET";
      default : decode_ENV_CTRL_string = "????";
    endcase
  end
  always @(*) begin
    case(_zz_decode_ENV_CTRL)
      `EnvCtrlEnum_binary_sequential_NONE : _zz_decode_ENV_CTRL_string = "NONE";
      `EnvCtrlEnum_binary_sequential_XRET : _zz_decode_ENV_CTRL_string = "XRET";
      default : _zz_decode_ENV_CTRL_string = "????";
    endcase
  end
  always @(*) begin
    case(_zz_decode_to_execute_ENV_CTRL)
      `EnvCtrlEnum_binary_sequential_NONE : _zz_decode_to_execute_ENV_CTRL_string = "NONE";
      `EnvCtrlEnum_binary_sequential_XRET : _zz_decode_to_execute_ENV_CTRL_string = "XRET";
      default : _zz_decode_to_execute_ENV_CTRL_string = "????";
    endcase
  end
  always @(*) begin
    case(_zz_decode_to_execute_ENV_CTRL_1)
      `EnvCtrlEnum_binary_sequential_NONE : _zz_decode_to_execute_ENV_CTRL_1_string = "NONE";
      `EnvCtrlEnum_binary_sequential_XRET : _zz_decode_to_execute_ENV_CTRL_1_string = "XRET";
      default : _zz_decode_to_execute_ENV_CTRL_1_string = "????";
    endcase
  end
  always @(*) begin
    case(execute_BRANCH_CTRL)
      `BranchCtrlEnum_binary_sequential_INC : execute_BRANCH_CTRL_string = "INC ";
      `BranchCtrlEnum_binary_sequential_B : execute_BRANCH_CTRL_string = "B   ";
      `BranchCtrlEnum_binary_sequential_JAL : execute_BRANCH_CTRL_string = "JAL ";
      `BranchCtrlEnum_binary_sequential_JALR : execute_BRANCH_CTRL_string = "JALR";
      default : execute_BRANCH_CTRL_string = "????";
    endcase
  end
  always @(*) begin
    case(_zz_execute_BRANCH_CTRL)
      `BranchCtrlEnum_binary_sequential_INC : _zz_execute_BRANCH_CTRL_string = "INC ";
      `BranchCtrlEnum_binary_sequential_B : _zz_execute_BRANCH_CTRL_string = "B   ";
      `BranchCtrlEnum_binary_sequential_JAL : _zz_execute_BRANCH_CTRL_string = "JAL ";
      `BranchCtrlEnum_binary_sequential_JALR : _zz_execute_BRANCH_CTRL_string = "JALR";
      default : _zz_execute_BRANCH_CTRL_string = "????";
    endcase
  end
  always @(*) begin
    case(memory_SHIFT_CTRL)
      `ShiftCtrlEnum_binary_sequential_DISABLE_1 : memory_SHIFT_CTRL_string = "DISABLE_1";
      `ShiftCtrlEnum_binary_sequential_SLL_1 : memory_SHIFT_CTRL_string = "SLL_1    ";
      `ShiftCtrlEnum_binary_sequential_SRL_1 : memory_SHIFT_CTRL_string = "SRL_1    ";
      `ShiftCtrlEnum_binary_sequential_SRA_1 : memory_SHIFT_CTRL_string = "SRA_1    ";
      default : memory_SHIFT_CTRL_string = "?????????";
    endcase
  end
  always @(*) begin
    case(_zz_memory_SHIFT_CTRL)
      `ShiftCtrlEnum_binary_sequential_DISABLE_1 : _zz_memory_SHIFT_CTRL_string = "DISABLE_1";
      `ShiftCtrlEnum_binary_sequential_SLL_1 : _zz_memory_SHIFT_CTRL_string = "SLL_1    ";
      `ShiftCtrlEnum_binary_sequential_SRL_1 : _zz_memory_SHIFT_CTRL_string = "SRL_1    ";
      `ShiftCtrlEnum_binary_sequential_SRA_1 : _zz_memory_SHIFT_CTRL_string = "SRA_1    ";
      default : _zz_memory_SHIFT_CTRL_string = "?????????";
    endcase
  end
  always @(*) begin
    case(execute_SHIFT_CTRL)
      `ShiftCtrlEnum_binary_sequential_DISABLE_1 : execute_SHIFT_CTRL_string = "DISABLE_1";
      `ShiftCtrlEnum_binary_sequential_SLL_1 : execute_SHIFT_CTRL_string = "SLL_1    ";
      `ShiftCtrlEnum_binary_sequential_SRL_1 : execute_SHIFT_CTRL_string = "SRL_1    ";
      `ShiftCtrlEnum_binary_sequential_SRA_1 : execute_SHIFT_CTRL_string = "SRA_1    ";
      default : execute_SHIFT_CTRL_string = "?????????";
    endcase
  end
  always @(*) begin
    case(_zz_execute_SHIFT_CTRL)
      `ShiftCtrlEnum_binary_sequential_DISABLE_1 : _zz_execute_SHIFT_CTRL_string = "DISABLE_1";
      `ShiftCtrlEnum_binary_sequential_SLL_1 : _zz_execute_SHIFT_CTRL_string = "SLL_1    ";
      `ShiftCtrlEnum_binary_sequential_SRL_1 : _zz_execute_SHIFT_CTRL_string = "SRL_1    ";
      `ShiftCtrlEnum_binary_sequential_SRA_1 : _zz_execute_SHIFT_CTRL_string = "SRA_1    ";
      default : _zz_execute_SHIFT_CTRL_string = "?????????";
    endcase
  end
  always @(*) begin
    case(decode_SRC2_CTRL)
      `Src2CtrlEnum_binary_sequential_RS : decode_SRC2_CTRL_string = "RS ";
      `Src2CtrlEnum_binary_sequential_IMI : decode_SRC2_CTRL_string = "IMI";
      `Src2CtrlEnum_binary_sequential_IMS : decode_SRC2_CTRL_string = "IMS";
      `Src2CtrlEnum_binary_sequential_PC : decode_SRC2_CTRL_string = "PC ";
      default : decode_SRC2_CTRL_string = "???";
    endcase
  end
  always @(*) begin
    case(_zz_decode_SRC2_CTRL)
      `Src2CtrlEnum_binary_sequential_RS : _zz_decode_SRC2_CTRL_string = "RS ";
      `Src2CtrlEnum_binary_sequential_IMI : _zz_decode_SRC2_CTRL_string = "IMI";
      `Src2CtrlEnum_binary_sequential_IMS : _zz_decode_SRC2_CTRL_string = "IMS";
      `Src2CtrlEnum_binary_sequential_PC : _zz_decode_SRC2_CTRL_string = "PC ";
      default : _zz_decode_SRC2_CTRL_string = "???";
    endcase
  end
  always @(*) begin
    case(decode_SRC1_CTRL)
      `Src1CtrlEnum_binary_sequential_RS : decode_SRC1_CTRL_string = "RS          ";
      `Src1CtrlEnum_binary_sequential_IMU : decode_SRC1_CTRL_string = "IMU         ";
      `Src1CtrlEnum_binary_sequential_PC_INCREMENT : decode_SRC1_CTRL_string = "PC_INCREMENT";
      `Src1CtrlEnum_binary_sequential_URS1 : decode_SRC1_CTRL_string = "URS1        ";
      default : decode_SRC1_CTRL_string = "????????????";
    endcase
  end
  always @(*) begin
    case(_zz_decode_SRC1_CTRL)
      `Src1CtrlEnum_binary_sequential_RS : _zz_decode_SRC1_CTRL_string = "RS          ";
      `Src1CtrlEnum_binary_sequential_IMU : _zz_decode_SRC1_CTRL_string = "IMU         ";
      `Src1CtrlEnum_binary_sequential_PC_INCREMENT : _zz_decode_SRC1_CTRL_string = "PC_INCREMENT";
      `Src1CtrlEnum_binary_sequential_URS1 : _zz_decode_SRC1_CTRL_string = "URS1        ";
      default : _zz_decode_SRC1_CTRL_string = "????????????";
    endcase
  end
  always @(*) begin
    case(execute_ALU_CTRL)
      `AluCtrlEnum_binary_sequential_ADD_SUB : execute_ALU_CTRL_string = "ADD_SUB ";
      `AluCtrlEnum_binary_sequential_SLT_SLTU : execute_ALU_CTRL_string = "SLT_SLTU";
      `AluCtrlEnum_binary_sequential_BITWISE : execute_ALU_CTRL_string = "BITWISE ";
      default : execute_ALU_CTRL_string = "????????";
    endcase
  end
  always @(*) begin
    case(_zz_execute_ALU_CTRL)
      `AluCtrlEnum_binary_sequential_ADD_SUB : _zz_execute_ALU_CTRL_string = "ADD_SUB ";
      `AluCtrlEnum_binary_sequential_SLT_SLTU : _zz_execute_ALU_CTRL_string = "SLT_SLTU";
      `AluCtrlEnum_binary_sequential_BITWISE : _zz_execute_ALU_CTRL_string = "BITWISE ";
      default : _zz_execute_ALU_CTRL_string = "????????";
    endcase
  end
  always @(*) begin
    case(execute_ALU_BITWISE_CTRL)
      `AluBitwiseCtrlEnum_binary_sequential_XOR_1 : execute_ALU_BITWISE_CTRL_string = "XOR_1";
      `AluBitwiseCtrlEnum_binary_sequential_OR_1 : execute_ALU_BITWISE_CTRL_string = "OR_1 ";
      `AluBitwiseCtrlEnum_binary_sequential_AND_1 : execute_ALU_BITWISE_CTRL_string = "AND_1";
      default : execute_ALU_BITWISE_CTRL_string = "?????";
    endcase
  end
  always @(*) begin
    case(_zz_execute_ALU_BITWISE_CTRL)
      `AluBitwiseCtrlEnum_binary_sequential_XOR_1 : _zz_execute_ALU_BITWISE_CTRL_string = "XOR_1";
      `AluBitwiseCtrlEnum_binary_sequential_OR_1 : _zz_execute_ALU_BITWISE_CTRL_string = "OR_1 ";
      `AluBitwiseCtrlEnum_binary_sequential_AND_1 : _zz_execute_ALU_BITWISE_CTRL_string = "AND_1";
      default : _zz_execute_ALU_BITWISE_CTRL_string = "?????";
    endcase
  end
  always @(*) begin
    case(_zz_decode_BRANCH_CTRL_1)
      `BranchCtrlEnum_binary_sequential_INC : _zz_decode_BRANCH_CTRL_1_string = "INC ";
      `BranchCtrlEnum_binary_sequential_B : _zz_decode_BRANCH_CTRL_1_string = "B   ";
      `BranchCtrlEnum_binary_sequential_JAL : _zz_decode_BRANCH_CTRL_1_string = "JAL ";
      `BranchCtrlEnum_binary_sequential_JALR : _zz_decode_BRANCH_CTRL_1_string = "JALR";
      default : _zz_decode_BRANCH_CTRL_1_string = "????";
    endcase
  end
  always @(*) begin
    case(_zz_decode_SHIFT_CTRL_1)
      `ShiftCtrlEnum_binary_sequential_DISABLE_1 : _zz_decode_SHIFT_CTRL_1_string = "DISABLE_1";
      `ShiftCtrlEnum_binary_sequential_SLL_1 : _zz_decode_SHIFT_CTRL_1_string = "SLL_1    ";
      `ShiftCtrlEnum_binary_sequential_SRL_1 : _zz_decode_SHIFT_CTRL_1_string = "SRL_1    ";
      `ShiftCtrlEnum_binary_sequential_SRA_1 : _zz_decode_SHIFT_CTRL_1_string = "SRA_1    ";
      default : _zz_decode_SHIFT_CTRL_1_string = "?????????";
    endcase
  end
  always @(*) begin
    case(_zz_decode_ALU_BITWISE_CTRL_1)
      `AluBitwiseCtrlEnum_binary_sequential_XOR_1 : _zz_decode_ALU_BITWISE_CTRL_1_string = "XOR_1";
      `AluBitwiseCtrlEnum_binary_sequential_OR_1 : _zz_decode_ALU_BITWISE_CTRL_1_string = "OR_1 ";
      `AluBitwiseCtrlEnum_binary_sequential_AND_1 : _zz_decode_ALU_BITWISE_CTRL_1_string = "AND_1";
      default : _zz_decode_ALU_BITWISE_CTRL_1_string = "?????";
    endcase
  end
  always @(*) begin
    case(_zz_decode_ALU_CTRL_1)
      `AluCtrlEnum_binary_sequential_ADD_SUB : _zz_decode_ALU_CTRL_1_string = "ADD_SUB ";
      `AluCtrlEnum_binary_sequential_SLT_SLTU : _zz_decode_ALU_CTRL_1_string = "SLT_SLTU";
      `AluCtrlEnum_binary_sequential_BITWISE : _zz_decode_ALU_CTRL_1_string = "BITWISE ";
      default : _zz_decode_ALU_CTRL_1_string = "????????";
    endcase
  end
  always @(*) begin
    case(_zz_decode_ENV_CTRL_1)
      `EnvCtrlEnum_binary_sequential_NONE : _zz_decode_ENV_CTRL_1_string = "NONE";
      `EnvCtrlEnum_binary_sequential_XRET : _zz_decode_ENV_CTRL_1_string = "XRET";
      default : _zz_decode_ENV_CTRL_1_string = "????";
    endcase
  end
  always @(*) begin
    case(_zz_decode_SRC2_CTRL_1)
      `Src2CtrlEnum_binary_sequential_RS : _zz_decode_SRC2_CTRL_1_string = "RS ";
      `Src2CtrlEnum_binary_sequential_IMI : _zz_decode_SRC2_CTRL_1_string = "IMI";
      `Src2CtrlEnum_binary_sequential_IMS : _zz_decode_SRC2_CTRL_1_string = "IMS";
      `Src2CtrlEnum_binary_sequential_PC : _zz_decode_SRC2_CTRL_1_string = "PC ";
      default : _zz_decode_SRC2_CTRL_1_string = "???";
    endcase
  end
  always @(*) begin
    case(_zz_decode_SRC1_CTRL_1)
      `Src1CtrlEnum_binary_sequential_RS : _zz_decode_SRC1_CTRL_1_string = "RS          ";
      `Src1CtrlEnum_binary_sequential_IMU : _zz_decode_SRC1_CTRL_1_string = "IMU         ";
      `Src1CtrlEnum_binary_sequential_PC_INCREMENT : _zz_decode_SRC1_CTRL_1_string = "PC_INCREMENT";
      `Src1CtrlEnum_binary_sequential_URS1 : _zz_decode_SRC1_CTRL_1_string = "URS1        ";
      default : _zz_decode_SRC1_CTRL_1_string = "????????????";
    endcase
  end
  always @(*) begin
    case(memory_ENV_CTRL)
      `EnvCtrlEnum_binary_sequential_NONE : memory_ENV_CTRL_string = "NONE";
      `EnvCtrlEnum_binary_sequential_XRET : memory_ENV_CTRL_string = "XRET";
      default : memory_ENV_CTRL_string = "????";
    endcase
  end
  always @(*) begin
    case(_zz_memory_ENV_CTRL)
      `EnvCtrlEnum_binary_sequential_NONE : _zz_memory_ENV_CTRL_string = "NONE";
      `EnvCtrlEnum_binary_sequential_XRET : _zz_memory_ENV_CTRL_string = "XRET";
      default : _zz_memory_ENV_CTRL_string = "????";
    endcase
  end
  always @(*) begin
    case(execute_ENV_CTRL)
      `EnvCtrlEnum_binary_sequential_NONE : execute_ENV_CTRL_string = "NONE";
      `EnvCtrlEnum_binary_sequential_XRET : execute_ENV_CTRL_string = "XRET";
      default : execute_ENV_CTRL_string = "????";
    endcase
  end
  always @(*) begin
    case(_zz_execute_ENV_CTRL)
      `EnvCtrlEnum_binary_sequential_NONE : _zz_execute_ENV_CTRL_string = "NONE";
      `EnvCtrlEnum_binary_sequential_XRET : _zz_execute_ENV_CTRL_string = "XRET";
      default : _zz_execute_ENV_CTRL_string = "????";
    endcase
  end
  always @(*) begin
    case(writeBack_ENV_CTRL)
      `EnvCtrlEnum_binary_sequential_NONE : writeBack_ENV_CTRL_string = "NONE";
      `EnvCtrlEnum_binary_sequential_XRET : writeBack_ENV_CTRL_string = "XRET";
      default : writeBack_ENV_CTRL_string = "????";
    endcase
  end
  always @(*) begin
    case(_zz_writeBack_ENV_CTRL)
      `EnvCtrlEnum_binary_sequential_NONE : _zz_writeBack_ENV_CTRL_string = "NONE";
      `EnvCtrlEnum_binary_sequential_XRET : _zz_writeBack_ENV_CTRL_string = "XRET";
      default : _zz_writeBack_ENV_CTRL_string = "????";
    endcase
  end
  always @(*) begin
    case(_zz_decode_SRC1_CTRL_2)
      `Src1CtrlEnum_binary_sequential_RS : _zz_decode_SRC1_CTRL_2_string = "RS          ";
      `Src1CtrlEnum_binary_sequential_IMU : _zz_decode_SRC1_CTRL_2_string = "IMU         ";
      `Src1CtrlEnum_binary_sequential_PC_INCREMENT : _zz_decode_SRC1_CTRL_2_string = "PC_INCREMENT";
      `Src1CtrlEnum_binary_sequential_URS1 : _zz_decode_SRC1_CTRL_2_string = "URS1        ";
      default : _zz_decode_SRC1_CTRL_2_string = "????????????";
    endcase
  end
  always @(*) begin
    case(_zz_decode_SRC2_CTRL_2)
      `Src2CtrlEnum_binary_sequential_RS : _zz_decode_SRC2_CTRL_2_string = "RS ";
      `Src2CtrlEnum_binary_sequential_IMI : _zz_decode_SRC2_CTRL_2_string = "IMI";
      `Src2CtrlEnum_binary_sequential_IMS : _zz_decode_SRC2_CTRL_2_string = "IMS";
      `Src2CtrlEnum_binary_sequential_PC : _zz_decode_SRC2_CTRL_2_string = "PC ";
      default : _zz_decode_SRC2_CTRL_2_string = "???";
    endcase
  end
  always @(*) begin
    case(_zz_decode_ENV_CTRL_2)
      `EnvCtrlEnum_binary_sequential_NONE : _zz_decode_ENV_CTRL_2_string = "NONE";
      `EnvCtrlEnum_binary_sequential_XRET : _zz_decode_ENV_CTRL_2_string = "XRET";
      default : _zz_decode_ENV_CTRL_2_string = "????";
    endcase
  end
  always @(*) begin
    case(_zz_decode_ALU_CTRL_2)
      `AluCtrlEnum_binary_sequential_ADD_SUB : _zz_decode_ALU_CTRL_2_string = "ADD_SUB ";
      `AluCtrlEnum_binary_sequential_SLT_SLTU : _zz_decode_ALU_CTRL_2_string = "SLT_SLTU";
      `AluCtrlEnum_binary_sequential_BITWISE : _zz_decode_ALU_CTRL_2_string = "BITWISE ";
      default : _zz_decode_ALU_CTRL_2_string = "????????";
    endcase
  end
  always @(*) begin
    case(_zz_decode_ALU_BITWISE_CTRL_2)
      `AluBitwiseCtrlEnum_binary_sequential_XOR_1 : _zz_decode_ALU_BITWISE_CTRL_2_string = "XOR_1";
      `AluBitwiseCtrlEnum_binary_sequential_OR_1 : _zz_decode_ALU_BITWISE_CTRL_2_string = "OR_1 ";
      `AluBitwiseCtrlEnum_binary_sequential_AND_1 : _zz_decode_ALU_BITWISE_CTRL_2_string = "AND_1";
      default : _zz_decode_ALU_BITWISE_CTRL_2_string = "?????";
    endcase
  end
  always @(*) begin
    case(_zz_decode_SHIFT_CTRL_2)
      `ShiftCtrlEnum_binary_sequential_DISABLE_1 : _zz_decode_SHIFT_CTRL_2_string = "DISABLE_1";
      `ShiftCtrlEnum_binary_sequential_SLL_1 : _zz_decode_SHIFT_CTRL_2_string = "SLL_1    ";
      `ShiftCtrlEnum_binary_sequential_SRL_1 : _zz_decode_SHIFT_CTRL_2_string = "SRL_1    ";
      `ShiftCtrlEnum_binary_sequential_SRA_1 : _zz_decode_SHIFT_CTRL_2_string = "SRA_1    ";
      default : _zz_decode_SHIFT_CTRL_2_string = "?????????";
    endcase
  end
  always @(*) begin
    case(_zz_decode_BRANCH_CTRL_8)
      `BranchCtrlEnum_binary_sequential_INC : _zz_decode_BRANCH_CTRL_8_string = "INC ";
      `BranchCtrlEnum_binary_sequential_B : _zz_decode_BRANCH_CTRL_8_string = "B   ";
      `BranchCtrlEnum_binary_sequential_JAL : _zz_decode_BRANCH_CTRL_8_string = "JAL ";
      `BranchCtrlEnum_binary_sequential_JALR : _zz_decode_BRANCH_CTRL_8_string = "JALR";
      default : _zz_decode_BRANCH_CTRL_8_string = "????";
    endcase
  end
  always @(*) begin
    case(decode_to_execute_ENV_CTRL)
      `EnvCtrlEnum_binary_sequential_NONE : decode_to_execute_ENV_CTRL_string = "NONE";
      `EnvCtrlEnum_binary_sequential_XRET : decode_to_execute_ENV_CTRL_string = "XRET";
      default : decode_to_execute_ENV_CTRL_string = "????";
    endcase
  end
  always @(*) begin
    case(execute_to_memory_ENV_CTRL)
      `EnvCtrlEnum_binary_sequential_NONE : execute_to_memory_ENV_CTRL_string = "NONE";
      `EnvCtrlEnum_binary_sequential_XRET : execute_to_memory_ENV_CTRL_string = "XRET";
      default : execute_to_memory_ENV_CTRL_string = "????";
    endcase
  end
  always @(*) begin
    case(memory_to_writeBack_ENV_CTRL)
      `EnvCtrlEnum_binary_sequential_NONE : memory_to_writeBack_ENV_CTRL_string = "NONE";
      `EnvCtrlEnum_binary_sequential_XRET : memory_to_writeBack_ENV_CTRL_string = "XRET";
      default : memory_to_writeBack_ENV_CTRL_string = "????";
    endcase
  end
  always @(*) begin
    case(decode_to_execute_ALU_CTRL)
      `AluCtrlEnum_binary_sequential_ADD_SUB : decode_to_execute_ALU_CTRL_string = "ADD_SUB ";
      `AluCtrlEnum_binary_sequential_SLT_SLTU : decode_to_execute_ALU_CTRL_string = "SLT_SLTU";
      `AluCtrlEnum_binary_sequential_BITWISE : decode_to_execute_ALU_CTRL_string = "BITWISE ";
      default : decode_to_execute_ALU_CTRL_string = "????????";
    endcase
  end
  always @(*) begin
    case(decode_to_execute_ALU_BITWISE_CTRL)
      `AluBitwiseCtrlEnum_binary_sequential_XOR_1 : decode_to_execute_ALU_BITWISE_CTRL_string = "XOR_1";
      `AluBitwiseCtrlEnum_binary_sequential_OR_1 : decode_to_execute_ALU_BITWISE_CTRL_string = "OR_1 ";
      `AluBitwiseCtrlEnum_binary_sequential_AND_1 : decode_to_execute_ALU_BITWISE_CTRL_string = "AND_1";
      default : decode_to_execute_ALU_BITWISE_CTRL_string = "?????";
    endcase
  end
  always @(*) begin
    case(decode_to_execute_SHIFT_CTRL)
      `ShiftCtrlEnum_binary_sequential_DISABLE_1 : decode_to_execute_SHIFT_CTRL_string = "DISABLE_1";
      `ShiftCtrlEnum_binary_sequential_SLL_1 : decode_to_execute_SHIFT_CTRL_string = "SLL_1    ";
      `ShiftCtrlEnum_binary_sequential_SRL_1 : decode_to_execute_SHIFT_CTRL_string = "SRL_1    ";
      `ShiftCtrlEnum_binary_sequential_SRA_1 : decode_to_execute_SHIFT_CTRL_string = "SRA_1    ";
      default : decode_to_execute_SHIFT_CTRL_string = "?????????";
    endcase
  end
  always @(*) begin
    case(execute_to_memory_SHIFT_CTRL)
      `ShiftCtrlEnum_binary_sequential_DISABLE_1 : execute_to_memory_SHIFT_CTRL_string = "DISABLE_1";
      `ShiftCtrlEnum_binary_sequential_SLL_1 : execute_to_memory_SHIFT_CTRL_string = "SLL_1    ";
      `ShiftCtrlEnum_binary_sequential_SRL_1 : execute_to_memory_SHIFT_CTRL_string = "SRL_1    ";
      `ShiftCtrlEnum_binary_sequential_SRA_1 : execute_to_memory_SHIFT_CTRL_string = "SRA_1    ";
      default : execute_to_memory_SHIFT_CTRL_string = "?????????";
    endcase
  end
  always @(*) begin
    case(decode_to_execute_BRANCH_CTRL)
      `BranchCtrlEnum_binary_sequential_INC : decode_to_execute_BRANCH_CTRL_string = "INC ";
      `BranchCtrlEnum_binary_sequential_B : decode_to_execute_BRANCH_CTRL_string = "B   ";
      `BranchCtrlEnum_binary_sequential_JAL : decode_to_execute_BRANCH_CTRL_string = "JAL ";
      `BranchCtrlEnum_binary_sequential_JALR : decode_to_execute_BRANCH_CTRL_string = "JALR";
      default : decode_to_execute_BRANCH_CTRL_string = "????";
    endcase
  end
  `endif

  assign memory_MUL_LOW = ($signed(_zz_memory_MUL_LOW) + $signed(_zz_memory_MUL_LOW_7));
  assign memory_MEMORY_READ_DATA = dBus_rsp_data;
  assign execute_BRANCH_CALC = {execute_BranchPlugin_branchAdder[31 : 1],1'b0};
  assign execute_BRANCH_DO = _zz_execute_BRANCH_DO_1;
  assign execute_SHIFT_RIGHT = _zz_execute_SHIFT_RIGHT;
  assign memory_MUL_HH = execute_to_memory_MUL_HH;
  assign execute_MUL_HH = ($signed(execute_MulPlugin_aHigh) * $signed(execute_MulPlugin_bHigh));
  assign execute_MUL_HL = ($signed(execute_MulPlugin_aHigh) * $signed(execute_MulPlugin_bSLow));
  assign execute_MUL_LH = ($signed(execute_MulPlugin_aSLow) * $signed(execute_MulPlugin_bHigh));
  assign execute_MUL_LL = (execute_MulPlugin_aULow * execute_MulPlugin_bULow);
  assign writeBack_REGFILE_WRITE_DATA = memory_to_writeBack_REGFILE_WRITE_DATA;
  assign memory_REGFILE_WRITE_DATA = execute_to_memory_REGFILE_WRITE_DATA;
  assign execute_REGFILE_WRITE_DATA = _zz_execute_REGFILE_WRITE_DATA;
  assign memory_MEMORY_ADDRESS_LOW = execute_to_memory_MEMORY_ADDRESS_LOW;
  assign execute_MEMORY_ADDRESS_LOW = dBus_cmd_payload_address[1 : 0];
  assign decode_DO_EBREAK = (((! DebugPlugin_haltIt) && (decode_IS_EBREAK || 1'b0)) && DebugPlugin_allowEBreak);
  assign decode_SRC2 = _zz_decode_SRC2_6;
  assign decode_SRC1 = _zz_decode_SRC1_1;
  assign decode_SRC2_FORCE_ZERO = (decode_SRC_ADD_ZERO && (! decode_SRC_USE_SUB_LESS));
  assign decode_BRANCH_CTRL = _zz_decode_BRANCH_CTRL;
  assign _zz_decode_to_execute_BRANCH_CTRL = _zz_decode_to_execute_BRANCH_CTRL_1;
  assign _zz_execute_to_memory_SHIFT_CTRL = _zz_execute_to_memory_SHIFT_CTRL_1;
  assign decode_SHIFT_CTRL = _zz_decode_SHIFT_CTRL;
  assign _zz_decode_to_execute_SHIFT_CTRL = _zz_decode_to_execute_SHIFT_CTRL_1;
  assign decode_IS_RS2_SIGNED = _zz_decode_BRANCH_CTRL_2[24];
  assign decode_IS_RS1_SIGNED = _zz_decode_BRANCH_CTRL_2[23];
  assign decode_IS_DIV = _zz_decode_BRANCH_CTRL_2[22];
  assign memory_IS_MUL = execute_to_memory_IS_MUL;
  assign execute_IS_MUL = decode_to_execute_IS_MUL;
  assign decode_IS_MUL = _zz_decode_BRANCH_CTRL_2[21];
  assign decode_ALU_BITWISE_CTRL = _zz_decode_ALU_BITWISE_CTRL;
  assign _zz_decode_to_execute_ALU_BITWISE_CTRL = _zz_decode_to_execute_ALU_BITWISE_CTRL_1;
  assign decode_SRC_LESS_UNSIGNED = _zz_decode_BRANCH_CTRL_2[17];
  assign decode_ALU_CTRL = _zz_decode_ALU_CTRL;
  assign _zz_decode_to_execute_ALU_CTRL = _zz_decode_to_execute_ALU_CTRL_1;
  assign _zz_memory_to_writeBack_ENV_CTRL = _zz_memory_to_writeBack_ENV_CTRL_1;
  assign _zz_execute_to_memory_ENV_CTRL = _zz_execute_to_memory_ENV_CTRL_1;
  assign decode_ENV_CTRL = _zz_decode_ENV_CTRL;
  assign _zz_decode_to_execute_ENV_CTRL = _zz_decode_to_execute_ENV_CTRL_1;
  assign decode_IS_CSR = _zz_decode_BRANCH_CTRL_2[12];
  assign decode_MEMORY_STORE = _zz_decode_BRANCH_CTRL_2[10];
  assign execute_BYPASSABLE_MEMORY_STAGE = decode_to_execute_BYPASSABLE_MEMORY_STAGE;
  assign decode_BYPASSABLE_MEMORY_STAGE = _zz_decode_BRANCH_CTRL_2[9];
  assign decode_BYPASSABLE_EXECUTE_STAGE = _zz_decode_BRANCH_CTRL_2[8];
  assign decode_MEMORY_ENABLE = _zz_decode_BRANCH_CTRL_2[3];
  assign decode_CSR_READ_OPCODE = (decode_INSTRUCTION[13 : 7] != 7'h20);
  assign decode_CSR_WRITE_OPCODE = (! (((decode_INSTRUCTION[14 : 13] == 2'b01) && (decode_INSTRUCTION[19 : 15] == 5'h0)) || ((decode_INSTRUCTION[14 : 13] == 2'b11) && (decode_INSTRUCTION[19 : 15] == 5'h0))));
  assign writeBack_FORMAL_PC_NEXT = memory_to_writeBack_FORMAL_PC_NEXT;
  assign memory_FORMAL_PC_NEXT = execute_to_memory_FORMAL_PC_NEXT;
  assign execute_FORMAL_PC_NEXT = decode_to_execute_FORMAL_PC_NEXT;
  assign decode_FORMAL_PC_NEXT = (decode_PC + _zz_decode_FORMAL_PC_NEXT);
  assign memory_PC = execute_to_memory_PC;
  assign execute_DO_EBREAK = decode_to_execute_DO_EBREAK;
  assign decode_IS_EBREAK = _zz_decode_BRANCH_CTRL_2[29];
  assign memory_BRANCH_CALC = execute_to_memory_BRANCH_CALC;
  assign memory_BRANCH_DO = execute_to_memory_BRANCH_DO;
  assign execute_PC = decode_to_execute_PC;
  assign execute_BRANCH_CTRL = _zz_execute_BRANCH_CTRL;
  assign decode_RS2_USE = _zz_decode_BRANCH_CTRL_2[11];
  assign decode_RS1_USE = _zz_decode_BRANCH_CTRL_2[4];
  assign execute_REGFILE_WRITE_VALID = decode_to_execute_REGFILE_WRITE_VALID;
  assign execute_BYPASSABLE_EXECUTE_STAGE = decode_to_execute_BYPASSABLE_EXECUTE_STAGE;
  assign memory_REGFILE_WRITE_VALID = execute_to_memory_REGFILE_WRITE_VALID;
  assign memory_BYPASSABLE_MEMORY_STAGE = execute_to_memory_BYPASSABLE_MEMORY_STAGE;
  assign writeBack_REGFILE_WRITE_VALID = memory_to_writeBack_REGFILE_WRITE_VALID;
  always @(*) begin
    decode_RS2 = decode_RegFilePlugin_rs2Data;
    if(HazardSimplePlugin_writeBackBuffer_valid) begin
      if(HazardSimplePlugin_addr1Match) begin
        decode_RS2 = HazardSimplePlugin_writeBackBuffer_payload_data;
      end
    end
    if(when_HazardSimplePlugin_l45) begin
      if(when_HazardSimplePlugin_l47) begin
        if(when_HazardSimplePlugin_l51) begin
          decode_RS2 = _zz_decode_RS2_2;
        end
      end
    end
    if(when_HazardSimplePlugin_l45_1) begin
      if(memory_BYPASSABLE_MEMORY_STAGE) begin
        if(when_HazardSimplePlugin_l51_1) begin
          decode_RS2 = _zz_decode_RS2;
        end
      end
    end
    if(when_HazardSimplePlugin_l45_2) begin
      if(execute_BYPASSABLE_EXECUTE_STAGE) begin
        if(when_HazardSimplePlugin_l51_2) begin
          decode_RS2 = _zz_decode_RS2_1;
        end
      end
    end
  end

  always @(*) begin
    decode_RS1 = decode_RegFilePlugin_rs1Data;
    if(HazardSimplePlugin_writeBackBuffer_valid) begin
      if(HazardSimplePlugin_addr0Match) begin
        decode_RS1 = HazardSimplePlugin_writeBackBuffer_payload_data;
      end
    end
    if(when_HazardSimplePlugin_l45) begin
      if(when_HazardSimplePlugin_l47) begin
        if(when_HazardSimplePlugin_l48) begin
          decode_RS1 = _zz_decode_RS2_2;
        end
      end
    end
    if(when_HazardSimplePlugin_l45_1) begin
      if(memory_BYPASSABLE_MEMORY_STAGE) begin
        if(when_HazardSimplePlugin_l48_1) begin
          decode_RS1 = _zz_decode_RS2;
        end
      end
    end
    if(when_HazardSimplePlugin_l45_2) begin
      if(execute_BYPASSABLE_EXECUTE_STAGE) begin
        if(when_HazardSimplePlugin_l48_2) begin
          decode_RS1 = _zz_decode_RS2_1;
        end
      end
    end
  end

  assign memory_SHIFT_RIGHT = execute_to_memory_SHIFT_RIGHT;
  assign memory_SHIFT_CTRL = _zz_memory_SHIFT_CTRL;
  assign execute_SHIFT_CTRL = _zz_execute_SHIFT_CTRL;
  assign execute_IS_RS1_SIGNED = decode_to_execute_IS_RS1_SIGNED;
  assign execute_IS_DIV = decode_to_execute_IS_DIV;
  assign execute_IS_RS2_SIGNED = decode_to_execute_IS_RS2_SIGNED;
  always @(*) begin
    _zz_decode_RS2 = memory_REGFILE_WRITE_DATA;
    if(when_MulDivIterativePlugin_l128) begin
      _zz_decode_RS2 = memory_DivPlugin_div_result;
    end
    if(memory_arbitration_isValid) begin
      case(memory_SHIFT_CTRL)
        `ShiftCtrlEnum_binary_sequential_SLL_1 : begin
          _zz_decode_RS2 = _zz_decode_RS2_3;
        end
        `ShiftCtrlEnum_binary_sequential_SRL_1, `ShiftCtrlEnum_binary_sequential_SRA_1 : begin
          _zz_decode_RS2 = memory_SHIFT_RIGHT;
        end
        default : begin
        end
      endcase
    end
  end

  assign memory_INSTRUCTION = execute_to_memory_INSTRUCTION;
  assign memory_IS_DIV = execute_to_memory_IS_DIV;
  assign writeBack_IS_MUL = memory_to_writeBack_IS_MUL;
  assign writeBack_MUL_HH = memory_to_writeBack_MUL_HH;
  assign writeBack_MUL_LOW = memory_to_writeBack_MUL_LOW;
  assign memory_MUL_HL = execute_to_memory_MUL_HL;
  assign memory_MUL_LH = execute_to_memory_MUL_LH;
  assign memory_MUL_LL = execute_to_memory_MUL_LL;
  assign execute_RS1 = decode_to_execute_RS1;
  assign execute_SRC_LESS_UNSIGNED = decode_to_execute_SRC_LESS_UNSIGNED;
  assign execute_SRC2_FORCE_ZERO = decode_to_execute_SRC2_FORCE_ZERO;
  assign execute_SRC_USE_SUB_LESS = decode_to_execute_SRC_USE_SUB_LESS;
  assign _zz_decode_SRC2 = decode_PC;
  assign _zz_decode_SRC2_1 = decode_RS2;
  assign decode_SRC2_CTRL = _zz_decode_SRC2_CTRL;
  assign _zz_decode_SRC1 = decode_RS1;
  assign decode_SRC1_CTRL = _zz_decode_SRC1_CTRL;
  assign decode_SRC_USE_SUB_LESS = _zz_decode_BRANCH_CTRL_2[2];
  assign decode_SRC_ADD_ZERO = _zz_decode_BRANCH_CTRL_2[20];
  assign execute_SRC_ADD_SUB = execute_SrcPlugin_addSub;
  assign execute_SRC_LESS = execute_SrcPlugin_less;
  assign execute_ALU_CTRL = _zz_execute_ALU_CTRL;
  assign execute_SRC2 = decode_to_execute_SRC2;
  assign execute_ALU_BITWISE_CTRL = _zz_execute_ALU_BITWISE_CTRL;
  assign _zz_lastStageRegFileWrite_payload_address = writeBack_INSTRUCTION;
  assign _zz_lastStageRegFileWrite_valid = writeBack_REGFILE_WRITE_VALID;
  always @(*) begin
    _zz_1 = 1'b0;
    if(lastStageRegFileWrite_valid) begin
      _zz_1 = 1'b1;
    end
  end

  assign decode_INSTRUCTION_ANTICIPATED = (decode_arbitration_isStuck ? decode_INSTRUCTION : IBusSimplePlugin_decompressor_output_payload_rsp_inst);
  always @(*) begin
    decode_REGFILE_WRITE_VALID = _zz_decode_BRANCH_CTRL_2[7];
    if(when_RegFilePlugin_l63) begin
      decode_REGFILE_WRITE_VALID = 1'b0;
    end
  end

  always @(*) begin
    _zz_decode_RS2_1 = execute_REGFILE_WRITE_DATA;
    if(when_CsrPlugin_l1176) begin
      _zz_decode_RS2_1 = CsrPlugin_csrMapping_readDataSignal;
    end
  end

  assign execute_SRC1 = decode_to_execute_SRC1;
  assign execute_CSR_READ_OPCODE = decode_to_execute_CSR_READ_OPCODE;
  assign execute_CSR_WRITE_OPCODE = decode_to_execute_CSR_WRITE_OPCODE;
  assign execute_IS_CSR = decode_to_execute_IS_CSR;
  assign memory_ENV_CTRL = _zz_memory_ENV_CTRL;
  assign execute_ENV_CTRL = _zz_execute_ENV_CTRL;
  assign writeBack_ENV_CTRL = _zz_writeBack_ENV_CTRL;
  assign writeBack_MEMORY_STORE = memory_to_writeBack_MEMORY_STORE;
  always @(*) begin
    _zz_decode_RS2_2 = writeBack_REGFILE_WRITE_DATA;
    if(when_DBusSimplePlugin_l558) begin
      _zz_decode_RS2_2 = writeBack_DBusSimplePlugin_rspFormated;
    end
    if(when_MulPlugin_l147) begin
      case(switch_MulPlugin_l148)
        2'b00 : begin
          _zz_decode_RS2_2 = _zz__zz_decode_RS2_2;
        end
        default : begin
          _zz_decode_RS2_2 = _zz__zz_decode_RS2_2_1;
        end
      endcase
    end
  end

  assign writeBack_MEMORY_ENABLE = memory_to_writeBack_MEMORY_ENABLE;
  assign writeBack_MEMORY_ADDRESS_LOW = memory_to_writeBack_MEMORY_ADDRESS_LOW;
  assign writeBack_MEMORY_READ_DATA = memory_to_writeBack_MEMORY_READ_DATA;
  assign memory_MEMORY_STORE = execute_to_memory_MEMORY_STORE;
  assign memory_MEMORY_ENABLE = execute_to_memory_MEMORY_ENABLE;
  assign execute_SRC_ADD = execute_SrcPlugin_addSub;
  assign execute_RS2 = decode_to_execute_RS2;
  assign execute_INSTRUCTION = decode_to_execute_INSTRUCTION;
  assign execute_MEMORY_STORE = decode_to_execute_MEMORY_STORE;
  assign execute_MEMORY_ENABLE = decode_to_execute_MEMORY_ENABLE;
  assign execute_ALIGNEMENT_FAULT = 1'b0;
  always @(*) begin
    _zz_memory_to_writeBack_FORMAL_PC_NEXT = memory_FORMAL_PC_NEXT;
    if(BranchPlugin_jumpInterface_valid) begin
      _zz_memory_to_writeBack_FORMAL_PC_NEXT = BranchPlugin_jumpInterface_payload;
    end
  end

  assign decode_PC = IBusSimplePlugin_decodePc_pcReg;
  assign decode_INSTRUCTION = IBusSimplePlugin_injector_decodeInput_payload_rsp_inst;
  assign decode_IS_RVC = IBusSimplePlugin_injector_decodeInput_payload_isRvc;
  assign writeBack_PC = memory_to_writeBack_PC;
  assign writeBack_INSTRUCTION = memory_to_writeBack_INSTRUCTION;
  always @(*) begin
    decode_arbitration_haltItself = 1'b0;
    case(switch_Fetcher_l362)
      3'b010 : begin
        decode_arbitration_haltItself = 1'b1;
      end
      default : begin
      end
    endcase
  end

  always @(*) begin
    decode_arbitration_haltByOther = 1'b0;
    if(CsrPlugin_pipelineLiberator_active) begin
      decode_arbitration_haltByOther = 1'b1;
    end
    if(when_CsrPlugin_l1116) begin
      decode_arbitration_haltByOther = 1'b1;
    end
    if(when_HazardSimplePlugin_l113) begin
      decode_arbitration_haltByOther = 1'b1;
    end
  end

  always @(*) begin
    decode_arbitration_removeIt = 1'b0;
    if(decode_arbitration_isFlushed) begin
      decode_arbitration_removeIt = 1'b1;
    end
  end

  assign decode_arbitration_flushIt = 1'b0;
  assign decode_arbitration_flushNext = 1'b0;
  always @(*) begin
    execute_arbitration_haltItself = 1'b0;
    if(when_DBusSimplePlugin_l426) begin
      execute_arbitration_haltItself = 1'b1;
    end
    if(when_CsrPlugin_l1180) begin
      if(execute_CsrPlugin_blockedBySideEffects) begin
        execute_arbitration_haltItself = 1'b1;
      end
    end
  end

  always @(*) begin
    execute_arbitration_haltByOther = 1'b0;
    if(when_DebugPlugin_l284) begin
      execute_arbitration_haltByOther = 1'b1;
    end
  end

  always @(*) begin
    execute_arbitration_removeIt = 1'b0;
    if(execute_arbitration_isFlushed) begin
      execute_arbitration_removeIt = 1'b1;
    end
  end

  always @(*) begin
    execute_arbitration_flushIt = 1'b0;
    if(when_DebugPlugin_l284) begin
      if(when_DebugPlugin_l287) begin
        execute_arbitration_flushIt = 1'b1;
      end
    end
  end

  always @(*) begin
    execute_arbitration_flushNext = 1'b0;
    if(when_DebugPlugin_l284) begin
      if(when_DebugPlugin_l287) begin
        execute_arbitration_flushNext = 1'b1;
      end
    end
    if(_zz_3) begin
      execute_arbitration_flushNext = 1'b1;
    end
  end

  always @(*) begin
    memory_arbitration_haltItself = 1'b0;
    if(when_DBusSimplePlugin_l479) begin
      memory_arbitration_haltItself = 1'b1;
    end
    if(when_MulDivIterativePlugin_l128) begin
      if(when_MulDivIterativePlugin_l129) begin
        memory_arbitration_haltItself = 1'b1;
      end
    end
  end

  assign memory_arbitration_haltByOther = 1'b0;
  always @(*) begin
    memory_arbitration_removeIt = 1'b0;
    if(memory_arbitration_isFlushed) begin
      memory_arbitration_removeIt = 1'b1;
    end
  end

  assign memory_arbitration_flushIt = 1'b0;
  always @(*) begin
    memory_arbitration_flushNext = 1'b0;
    if(BranchPlugin_jumpInterface_valid) begin
      memory_arbitration_flushNext = 1'b1;
    end
  end

  assign writeBack_arbitration_haltItself = 1'b0;
  assign writeBack_arbitration_haltByOther = 1'b0;
  always @(*) begin
    writeBack_arbitration_removeIt = 1'b0;
    if(writeBack_arbitration_isFlushed) begin
      writeBack_arbitration_removeIt = 1'b1;
    end
  end

  assign writeBack_arbitration_flushIt = 1'b0;
  always @(*) begin
    writeBack_arbitration_flushNext = 1'b0;
    if(when_CsrPlugin_l1019) begin
      writeBack_arbitration_flushNext = 1'b1;
    end
    if(when_CsrPlugin_l1064) begin
      writeBack_arbitration_flushNext = 1'b1;
    end
  end

  assign lastStageInstruction = writeBack_INSTRUCTION;
  assign lastStagePc = writeBack_PC;
  assign lastStageIsValid = writeBack_arbitration_isValid;
  assign lastStageIsFiring = writeBack_arbitration_isFiring;
  always @(*) begin
    IBusSimplePlugin_fetcherHalt = 1'b0;
    if(when_CsrPlugin_l1019) begin
      IBusSimplePlugin_fetcherHalt = 1'b1;
    end
    if(when_CsrPlugin_l1064) begin
      IBusSimplePlugin_fetcherHalt = 1'b1;
    end
    if(when_DebugPlugin_l284) begin
      if(when_DebugPlugin_l287) begin
        IBusSimplePlugin_fetcherHalt = 1'b1;
      end
    end
    if(DebugPlugin_haltIt) begin
      IBusSimplePlugin_fetcherHalt = 1'b1;
    end
    if(when_DebugPlugin_l300) begin
      IBusSimplePlugin_fetcherHalt = 1'b1;
    end
  end

  always @(*) begin
    IBusSimplePlugin_incomingInstruction = 1'b0;
    if(when_Fetcher_l240) begin
      IBusSimplePlugin_incomingInstruction = 1'b1;
    end
    if(IBusSimplePlugin_injector_decodeInput_valid) begin
      IBusSimplePlugin_incomingInstruction = 1'b1;
    end
  end

  assign CsrPlugin_csrMapping_allowCsrSignal = 1'b0;
  assign CsrPlugin_csrMapping_readDataSignal = CsrPlugin_csrMapping_readDataInit;
  assign CsrPlugin_inWfi = 1'b0;
  always @(*) begin
    CsrPlugin_thirdPartyWake = 1'b0;
    if(DebugPlugin_haltIt) begin
      CsrPlugin_thirdPartyWake = 1'b1;
    end
  end

  always @(*) begin
    CsrPlugin_jumpInterface_valid = 1'b0;
    if(when_CsrPlugin_l1019) begin
      CsrPlugin_jumpInterface_valid = 1'b1;
    end
    if(when_CsrPlugin_l1064) begin
      CsrPlugin_jumpInterface_valid = 1'b1;
    end
  end

  always @(*) begin
    CsrPlugin_jumpInterface_payload = 32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
    if(when_CsrPlugin_l1019) begin
      CsrPlugin_jumpInterface_payload = (((CsrPlugin_xtvec_mode == 2'b00) || CsrPlugin_hadException) ? {CsrPlugin_xtvec_base,2'b00} : {_zz_CsrPlugin_jumpInterface_payload,2'b00});
    end
    if(when_CsrPlugin_l1064) begin
      case(switch_CsrPlugin_l1068)
        2'b11 : begin
          CsrPlugin_jumpInterface_payload = CsrPlugin_mepc;
        end
        default : begin
        end
      endcase
    end
  end

  always @(*) begin
    CsrPlugin_forceMachineWire = 1'b0;
    if(DebugPlugin_godmode) begin
      CsrPlugin_forceMachineWire = 1'b1;
    end
  end

  always @(*) begin
    CsrPlugin_allowInterrupts = 1'b1;
    if(when_DebugPlugin_l316) begin
      CsrPlugin_allowInterrupts = 1'b0;
    end
  end

  always @(*) begin
    CsrPlugin_allowException = 1'b1;
    if(DebugPlugin_godmode) begin
      CsrPlugin_allowException = 1'b0;
    end
  end

  always @(*) begin
    CsrPlugin_allowEbreakException = 1'b1;
    if(DebugPlugin_allowEBreak) begin
      CsrPlugin_allowEbreakException = 1'b0;
    end
  end

  assign IBusSimplePlugin_externalFlush = ({writeBack_arbitration_flushNext,{memory_arbitration_flushNext,{execute_arbitration_flushNext,decode_arbitration_flushNext}}} != 4'b0000);
  assign IBusSimplePlugin_jump_pcLoad_valid = ({BranchPlugin_jumpInterface_valid,CsrPlugin_jumpInterface_valid} != 2'b00);
  assign _zz_IBusSimplePlugin_jump_pcLoad_payload = {BranchPlugin_jumpInterface_valid,CsrPlugin_jumpInterface_valid};
  assign IBusSimplePlugin_jump_pcLoad_payload = (_zz_IBusSimplePlugin_jump_pcLoad_payload_1[0] ? CsrPlugin_jumpInterface_payload : BranchPlugin_jumpInterface_payload);
  always @(*) begin
    IBusSimplePlugin_fetchPc_correction = 1'b0;
    if(IBusSimplePlugin_jump_pcLoad_valid) begin
      IBusSimplePlugin_fetchPc_correction = 1'b1;
    end
  end

  assign IBusSimplePlugin_fetchPc_output_fire = (IBusSimplePlugin_fetchPc_output_valid && IBusSimplePlugin_fetchPc_output_ready);
  assign IBusSimplePlugin_fetchPc_corrected = (IBusSimplePlugin_fetchPc_correction || IBusSimplePlugin_fetchPc_correctionReg);
  always @(*) begin
    IBusSimplePlugin_fetchPc_pcRegPropagate = 1'b0;
    if(IBusSimplePlugin_iBusRsp_stages_1_input_ready) begin
      IBusSimplePlugin_fetchPc_pcRegPropagate = 1'b1;
    end
  end

  assign when_Fetcher_l131 = (IBusSimplePlugin_fetchPc_correction || IBusSimplePlugin_fetchPc_pcRegPropagate);
  assign IBusSimplePlugin_fetchPc_output_fire_1 = (IBusSimplePlugin_fetchPc_output_valid && IBusSimplePlugin_fetchPc_output_ready);
  assign when_Fetcher_l131_1 = ((! IBusSimplePlugin_fetchPc_output_valid) && IBusSimplePlugin_fetchPc_output_ready);
  always @(*) begin
    IBusSimplePlugin_fetchPc_pc = (IBusSimplePlugin_fetchPc_pcReg + _zz_IBusSimplePlugin_fetchPc_pc);
    if(IBusSimplePlugin_fetchPc_inc) begin
      IBusSimplePlugin_fetchPc_pc[1] = 1'b0;
    end
    if(IBusSimplePlugin_jump_pcLoad_valid) begin
      IBusSimplePlugin_fetchPc_pc = IBusSimplePlugin_jump_pcLoad_payload;
    end
    IBusSimplePlugin_fetchPc_pc[0] = 1'b0;
  end

  always @(*) begin
    IBusSimplePlugin_fetchPc_flushed = 1'b0;
    if(IBusSimplePlugin_jump_pcLoad_valid) begin
      IBusSimplePlugin_fetchPc_flushed = 1'b1;
    end
  end

  assign when_Fetcher_l158 = (IBusSimplePlugin_fetchPc_booted && ((IBusSimplePlugin_fetchPc_output_ready || IBusSimplePlugin_fetchPc_correction) || IBusSimplePlugin_fetchPc_pcRegPropagate));
  assign IBusSimplePlugin_fetchPc_output_valid = ((! IBusSimplePlugin_fetcherHalt) && IBusSimplePlugin_fetchPc_booted);
  assign IBusSimplePlugin_fetchPc_output_payload = IBusSimplePlugin_fetchPc_pc;
  always @(*) begin
    IBusSimplePlugin_decodePc_flushed = 1'b0;
    if(when_Fetcher_l192) begin
      IBusSimplePlugin_decodePc_flushed = 1'b1;
    end
  end

  assign IBusSimplePlugin_decodePc_pcPlus = (IBusSimplePlugin_decodePc_pcReg + _zz_IBusSimplePlugin_decodePc_pcPlus);
  always @(*) begin
    IBusSimplePlugin_decodePc_injectedDecode = 1'b0;
    if(when_Fetcher_l360) begin
      IBusSimplePlugin_decodePc_injectedDecode = 1'b1;
    end
  end

  assign when_Fetcher_l180 = (decode_arbitration_isFiring && (! IBusSimplePlugin_decodePc_injectedDecode));
  assign when_Fetcher_l192 = (IBusSimplePlugin_jump_pcLoad_valid && ((! decode_arbitration_isStuck) || decode_arbitration_removeIt));
  assign IBusSimplePlugin_iBusRsp_redoFetch = 1'b0;
  assign IBusSimplePlugin_iBusRsp_stages_0_input_valid = IBusSimplePlugin_fetchPc_output_valid;
  assign IBusSimplePlugin_fetchPc_output_ready = IBusSimplePlugin_iBusRsp_stages_0_input_ready;
  assign IBusSimplePlugin_iBusRsp_stages_0_input_payload = IBusSimplePlugin_fetchPc_output_payload;
  assign IBusSimplePlugin_iBusRsp_stages_0_halt = 1'b0;
  assign _zz_IBusSimplePlugin_iBusRsp_stages_0_input_ready = (! IBusSimplePlugin_iBusRsp_stages_0_halt);
  assign IBusSimplePlugin_iBusRsp_stages_0_input_ready = (IBusSimplePlugin_iBusRsp_stages_0_output_ready && _zz_IBusSimplePlugin_iBusRsp_stages_0_input_ready);
  assign IBusSimplePlugin_iBusRsp_stages_0_output_valid = (IBusSimplePlugin_iBusRsp_stages_0_input_valid && _zz_IBusSimplePlugin_iBusRsp_stages_0_input_ready);
  assign IBusSimplePlugin_iBusRsp_stages_0_output_payload = IBusSimplePlugin_iBusRsp_stages_0_input_payload;
  always @(*) begin
    IBusSimplePlugin_iBusRsp_stages_1_halt = 1'b0;
    if(when_IBusSimplePlugin_l304) begin
      IBusSimplePlugin_iBusRsp_stages_1_halt = 1'b1;
    end
  end

  assign _zz_IBusSimplePlugin_iBusRsp_stages_1_input_ready = (! IBusSimplePlugin_iBusRsp_stages_1_halt);
  assign IBusSimplePlugin_iBusRsp_stages_1_input_ready = (IBusSimplePlugin_iBusRsp_stages_1_output_ready && _zz_IBusSimplePlugin_iBusRsp_stages_1_input_ready);
  assign IBusSimplePlugin_iBusRsp_stages_1_output_valid = (IBusSimplePlugin_iBusRsp_stages_1_input_valid && _zz_IBusSimplePlugin_iBusRsp_stages_1_input_ready);
  assign IBusSimplePlugin_iBusRsp_stages_1_output_payload = IBusSimplePlugin_iBusRsp_stages_1_input_payload;
  assign IBusSimplePlugin_iBusRsp_stages_2_halt = 1'b0;
  assign _zz_IBusSimplePlugin_iBusRsp_stages_2_input_ready = (! IBusSimplePlugin_iBusRsp_stages_2_halt);
  assign IBusSimplePlugin_iBusRsp_stages_2_input_ready = (IBusSimplePlugin_iBusRsp_stages_2_output_ready && _zz_IBusSimplePlugin_iBusRsp_stages_2_input_ready);
  assign IBusSimplePlugin_iBusRsp_stages_2_output_valid = (IBusSimplePlugin_iBusRsp_stages_2_input_valid && _zz_IBusSimplePlugin_iBusRsp_stages_2_input_ready);
  assign IBusSimplePlugin_iBusRsp_stages_2_output_payload = IBusSimplePlugin_iBusRsp_stages_2_input_payload;
  assign IBusSimplePlugin_iBusRsp_flush = (IBusSimplePlugin_externalFlush || IBusSimplePlugin_iBusRsp_redoFetch);
  assign IBusSimplePlugin_iBusRsp_stages_0_output_ready = _zz_IBusSimplePlugin_iBusRsp_stages_0_output_ready;
  assign _zz_IBusSimplePlugin_iBusRsp_stages_0_output_ready = ((1'b0 && (! _zz_IBusSimplePlugin_iBusRsp_stages_0_output_ready_1)) || IBusSimplePlugin_iBusRsp_stages_1_input_ready);
  assign _zz_IBusSimplePlugin_iBusRsp_stages_0_output_ready_1 = _zz_IBusSimplePlugin_iBusRsp_stages_0_output_ready_2;
  assign IBusSimplePlugin_iBusRsp_stages_1_input_valid = _zz_IBusSimplePlugin_iBusRsp_stages_0_output_ready_1;
  assign IBusSimplePlugin_iBusRsp_stages_1_input_payload = IBusSimplePlugin_fetchPc_pcReg;
  assign IBusSimplePlugin_iBusRsp_stages_1_output_ready = ((1'b0 && (! IBusSimplePlugin_iBusRsp_stages_1_output_m2sPipe_valid)) || IBusSimplePlugin_iBusRsp_stages_1_output_m2sPipe_ready);
  assign IBusSimplePlugin_iBusRsp_stages_1_output_m2sPipe_valid = _zz_IBusSimplePlugin_iBusRsp_stages_1_output_m2sPipe_valid;
  assign IBusSimplePlugin_iBusRsp_stages_1_output_m2sPipe_payload = _zz_IBusSimplePlugin_iBusRsp_stages_1_output_m2sPipe_payload;
  assign IBusSimplePlugin_iBusRsp_stages_2_input_valid = IBusSimplePlugin_iBusRsp_stages_1_output_m2sPipe_valid;
  assign IBusSimplePlugin_iBusRsp_stages_1_output_m2sPipe_ready = IBusSimplePlugin_iBusRsp_stages_2_input_ready;
  assign IBusSimplePlugin_iBusRsp_stages_2_input_payload = IBusSimplePlugin_iBusRsp_stages_1_output_m2sPipe_payload;
  always @(*) begin
    IBusSimplePlugin_iBusRsp_readyForError = 1'b1;
    if(IBusSimplePlugin_injector_decodeInput_valid) begin
      IBusSimplePlugin_iBusRsp_readyForError = 1'b0;
    end
  end

  assign when_Fetcher_l240 = (IBusSimplePlugin_iBusRsp_stages_1_input_valid || IBusSimplePlugin_iBusRsp_stages_2_input_valid);
  assign IBusSimplePlugin_decompressor_input_valid = (IBusSimplePlugin_iBusRsp_output_valid && (! IBusSimplePlugin_iBusRsp_redoFetch));
  assign IBusSimplePlugin_decompressor_input_payload_pc = IBusSimplePlugin_iBusRsp_output_payload_pc;
  assign IBusSimplePlugin_decompressor_input_payload_rsp_error = IBusSimplePlugin_iBusRsp_output_payload_rsp_error;
  assign IBusSimplePlugin_decompressor_input_payload_rsp_inst = IBusSimplePlugin_iBusRsp_output_payload_rsp_inst;
  assign IBusSimplePlugin_decompressor_input_payload_isRvc = IBusSimplePlugin_iBusRsp_output_payload_isRvc;
  assign IBusSimplePlugin_iBusRsp_output_ready = IBusSimplePlugin_decompressor_input_ready;
  assign IBusSimplePlugin_decompressor_flushNext = 1'b0;
  assign IBusSimplePlugin_decompressor_consumeCurrent = 1'b0;
  assign IBusSimplePlugin_decompressor_isInputLowRvc = (IBusSimplePlugin_decompressor_input_payload_rsp_inst[1 : 0] != 2'b11);
  assign IBusSimplePlugin_decompressor_isInputHighRvc = (IBusSimplePlugin_decompressor_input_payload_rsp_inst[17 : 16] != 2'b11);
  assign IBusSimplePlugin_decompressor_throw2Bytes = (IBusSimplePlugin_decompressor_throw2BytesReg || IBusSimplePlugin_decompressor_input_payload_pc[1]);
  assign IBusSimplePlugin_decompressor_unaligned = (IBusSimplePlugin_decompressor_throw2Bytes || IBusSimplePlugin_decompressor_bufferValid);
  assign IBusSimplePlugin_decompressor_bufferValidPatched = (IBusSimplePlugin_decompressor_input_valid ? IBusSimplePlugin_decompressor_bufferValid : IBusSimplePlugin_decompressor_bufferValidLatch);
  assign IBusSimplePlugin_decompressor_throw2BytesPatched = (IBusSimplePlugin_decompressor_input_valid ? IBusSimplePlugin_decompressor_throw2Bytes : IBusSimplePlugin_decompressor_throw2BytesLatch);
  assign IBusSimplePlugin_decompressor_raw = (IBusSimplePlugin_decompressor_bufferValidPatched ? {IBusSimplePlugin_decompressor_input_payload_rsp_inst[15 : 0],IBusSimplePlugin_decompressor_bufferData} : {IBusSimplePlugin_decompressor_input_payload_rsp_inst[31 : 16],(IBusSimplePlugin_decompressor_throw2BytesPatched ? IBusSimplePlugin_decompressor_input_payload_rsp_inst[31 : 16] : IBusSimplePlugin_decompressor_input_payload_rsp_inst[15 : 0])});
  assign IBusSimplePlugin_decompressor_isRvc = (IBusSimplePlugin_decompressor_raw[1 : 0] != 2'b11);
  assign _zz_IBusSimplePlugin_decompressor_decompressed = IBusSimplePlugin_decompressor_raw[15 : 0];
  always @(*) begin
    IBusSimplePlugin_decompressor_decompressed = 32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
    case(switch_Misc_l44)
      5'h0 : begin
        IBusSimplePlugin_decompressor_decompressed = {{{{{{{{{2'b00,_zz_IBusSimplePlugin_decompressor_decompressed[10 : 7]},_zz_IBusSimplePlugin_decompressor_decompressed[12 : 11]},_zz_IBusSimplePlugin_decompressor_decompressed[5]},_zz_IBusSimplePlugin_decompressor_decompressed[6]},2'b00},5'h02},3'b000},_zz_IBusSimplePlugin_decompressor_decompressed_2},7'h13};
      end
      5'h02 : begin
        IBusSimplePlugin_decompressor_decompressed = {{{{_zz_IBusSimplePlugin_decompressor_decompressed_3,_zz_IBusSimplePlugin_decompressor_decompressed_1},3'b010},_zz_IBusSimplePlugin_decompressor_decompressed_2},7'h03};
      end
      5'h06 : begin
        IBusSimplePlugin_decompressor_decompressed = {{{{{_zz_IBusSimplePlugin_decompressor_decompressed_3[11 : 5],_zz_IBusSimplePlugin_decompressor_decompressed_2},_zz_IBusSimplePlugin_decompressor_decompressed_1},3'b010},_zz_IBusSimplePlugin_decompressor_decompressed_3[4 : 0]},7'h23};
      end
      5'h08 : begin
        IBusSimplePlugin_decompressor_decompressed = {{{{_zz_IBusSimplePlugin_decompressor_decompressed_5,_zz_IBusSimplePlugin_decompressor_decompressed[11 : 7]},3'b000},_zz_IBusSimplePlugin_decompressor_decompressed[11 : 7]},7'h13};
      end
      5'h09 : begin
        IBusSimplePlugin_decompressor_decompressed = {{{{{_zz_IBusSimplePlugin_decompressor_decompressed_8[20],_zz_IBusSimplePlugin_decompressor_decompressed_8[10 : 1]},_zz_IBusSimplePlugin_decompressor_decompressed_8[11]},_zz_IBusSimplePlugin_decompressor_decompressed_8[19 : 12]},_zz_IBusSimplePlugin_decompressor_decompressed_20},7'h6f};
      end
      5'h0a : begin
        IBusSimplePlugin_decompressor_decompressed = {{{{_zz_IBusSimplePlugin_decompressor_decompressed_5,5'h0},3'b000},_zz_IBusSimplePlugin_decompressor_decompressed[11 : 7]},7'h13};
      end
      5'h0b : begin
        IBusSimplePlugin_decompressor_decompressed = ((_zz_IBusSimplePlugin_decompressor_decompressed[11 : 7] == 5'h02) ? {{{{{{{{{_zz_IBusSimplePlugin_decompressor_decompressed_12,_zz_IBusSimplePlugin_decompressor_decompressed[4 : 3]},_zz_IBusSimplePlugin_decompressor_decompressed[5]},_zz_IBusSimplePlugin_decompressor_decompressed[2]},_zz_IBusSimplePlugin_decompressor_decompressed[6]},4'b0000},_zz_IBusSimplePlugin_decompressor_decompressed[11 : 7]},3'b000},_zz_IBusSimplePlugin_decompressor_decompressed[11 : 7]},7'h13} : {{_zz_IBusSimplePlugin_decompressor_decompressed_27[31 : 12],_zz_IBusSimplePlugin_decompressor_decompressed[11 : 7]},7'h37});
      end
      5'h0c : begin
        IBusSimplePlugin_decompressor_decompressed = {{{{{((_zz_IBusSimplePlugin_decompressor_decompressed[11 : 10] == 2'b10) ? _zz_IBusSimplePlugin_decompressor_decompressed_26 : {{1'b0,(_zz_IBusSimplePlugin_decompressor_decompressed_28 || _zz_IBusSimplePlugin_decompressor_decompressed_29)},5'h0}),(((! _zz_IBusSimplePlugin_decompressor_decompressed[11]) || _zz_IBusSimplePlugin_decompressor_decompressed_22) ? _zz_IBusSimplePlugin_decompressor_decompressed[6 : 2] : _zz_IBusSimplePlugin_decompressor_decompressed_2)},_zz_IBusSimplePlugin_decompressor_decompressed_1},_zz_IBusSimplePlugin_decompressor_decompressed_24},_zz_IBusSimplePlugin_decompressor_decompressed_1},(_zz_IBusSimplePlugin_decompressor_decompressed_22 ? 7'h13 : 7'h33)};
      end
      5'h0d : begin
        IBusSimplePlugin_decompressor_decompressed = {{{{{_zz_IBusSimplePlugin_decompressor_decompressed_15[20],_zz_IBusSimplePlugin_decompressor_decompressed_15[10 : 1]},_zz_IBusSimplePlugin_decompressor_decompressed_15[11]},_zz_IBusSimplePlugin_decompressor_decompressed_15[19 : 12]},_zz_IBusSimplePlugin_decompressor_decompressed_19},7'h6f};
      end
      5'h0e : begin
        IBusSimplePlugin_decompressor_decompressed = {{{{{{{_zz_IBusSimplePlugin_decompressor_decompressed_18[12],_zz_IBusSimplePlugin_decompressor_decompressed_18[10 : 5]},_zz_IBusSimplePlugin_decompressor_decompressed_19},_zz_IBusSimplePlugin_decompressor_decompressed_1},3'b000},_zz_IBusSimplePlugin_decompressor_decompressed_18[4 : 1]},_zz_IBusSimplePlugin_decompressor_decompressed_18[11]},7'h63};
      end
      5'h0f : begin
        IBusSimplePlugin_decompressor_decompressed = {{{{{{{_zz_IBusSimplePlugin_decompressor_decompressed_18[12],_zz_IBusSimplePlugin_decompressor_decompressed_18[10 : 5]},_zz_IBusSimplePlugin_decompressor_decompressed_19},_zz_IBusSimplePlugin_decompressor_decompressed_1},3'b001},_zz_IBusSimplePlugin_decompressor_decompressed_18[4 : 1]},_zz_IBusSimplePlugin_decompressor_decompressed_18[11]},7'h63};
      end
      5'h10 : begin
        IBusSimplePlugin_decompressor_decompressed = {{{{{7'h0,_zz_IBusSimplePlugin_decompressor_decompressed[6 : 2]},_zz_IBusSimplePlugin_decompressor_decompressed[11 : 7]},3'b001},_zz_IBusSimplePlugin_decompressor_decompressed[11 : 7]},7'h13};
      end
      5'h12 : begin
        IBusSimplePlugin_decompressor_decompressed = {{{{{{{{4'b0000,_zz_IBusSimplePlugin_decompressor_decompressed[3 : 2]},_zz_IBusSimplePlugin_decompressor_decompressed[12]},_zz_IBusSimplePlugin_decompressor_decompressed[6 : 4]},2'b00},_zz_IBusSimplePlugin_decompressor_decompressed_21},3'b010},_zz_IBusSimplePlugin_decompressor_decompressed[11 : 7]},7'h03};
      end
      5'h14 : begin
        IBusSimplePlugin_decompressor_decompressed = ((_zz_IBusSimplePlugin_decompressor_decompressed[12 : 2] == 11'h400) ? 32'h00100073 : ((_zz_IBusSimplePlugin_decompressor_decompressed[6 : 2] == 5'h0) ? {{{{12'h0,_zz_IBusSimplePlugin_decompressor_decompressed[11 : 7]},3'b000},(_zz_IBusSimplePlugin_decompressor_decompressed[12] ? _zz_IBusSimplePlugin_decompressor_decompressed_20 : _zz_IBusSimplePlugin_decompressor_decompressed_19)},7'h67} : {{{{{_zz_IBusSimplePlugin_decompressor_decompressed_30,_zz_IBusSimplePlugin_decompressor_decompressed_31},(_zz_IBusSimplePlugin_decompressor_decompressed_32 ? _zz_IBusSimplePlugin_decompressor_decompressed_33 : _zz_IBusSimplePlugin_decompressor_decompressed_19)},3'b000},_zz_IBusSimplePlugin_decompressor_decompressed[11 : 7]},7'h33}));
      end
      5'h16 : begin
        IBusSimplePlugin_decompressor_decompressed = {{{{{_zz_IBusSimplePlugin_decompressor_decompressed_34[11 : 5],_zz_IBusSimplePlugin_decompressor_decompressed[6 : 2]},_zz_IBusSimplePlugin_decompressor_decompressed_21},3'b010},_zz_IBusSimplePlugin_decompressor_decompressed_35[4 : 0]},7'h23};
      end
      default : begin
      end
    endcase
  end

  assign _zz_IBusSimplePlugin_decompressor_decompressed_1 = {2'b01,_zz_IBusSimplePlugin_decompressor_decompressed[9 : 7]};
  assign _zz_IBusSimplePlugin_decompressor_decompressed_2 = {2'b01,_zz_IBusSimplePlugin_decompressor_decompressed[4 : 2]};
  assign _zz_IBusSimplePlugin_decompressor_decompressed_3 = {{{{5'h0,_zz_IBusSimplePlugin_decompressor_decompressed[5]},_zz_IBusSimplePlugin_decompressor_decompressed[12 : 10]},_zz_IBusSimplePlugin_decompressor_decompressed[6]},2'b00};
  assign _zz_IBusSimplePlugin_decompressor_decompressed_4 = _zz_IBusSimplePlugin_decompressor_decompressed[12];
  always @(*) begin
    _zz_IBusSimplePlugin_decompressor_decompressed_5[11] = _zz_IBusSimplePlugin_decompressor_decompressed_4;
    _zz_IBusSimplePlugin_decompressor_decompressed_5[10] = _zz_IBusSimplePlugin_decompressor_decompressed_4;
    _zz_IBusSimplePlugin_decompressor_decompressed_5[9] = _zz_IBusSimplePlugin_decompressor_decompressed_4;
    _zz_IBusSimplePlugin_decompressor_decompressed_5[8] = _zz_IBusSimplePlugin_decompressor_decompressed_4;
    _zz_IBusSimplePlugin_decompressor_decompressed_5[7] = _zz_IBusSimplePlugin_decompressor_decompressed_4;
    _zz_IBusSimplePlugin_decompressor_decompressed_5[6] = _zz_IBusSimplePlugin_decompressor_decompressed_4;
    _zz_IBusSimplePlugin_decompressor_decompressed_5[5] = _zz_IBusSimplePlugin_decompressor_decompressed_4;
    _zz_IBusSimplePlugin_decompressor_decompressed_5[4 : 0] = _zz_IBusSimplePlugin_decompressor_decompressed[6 : 2];
  end

  assign _zz_IBusSimplePlugin_decompressor_decompressed_6 = _zz_IBusSimplePlugin_decompressor_decompressed[12];
  always @(*) begin
    _zz_IBusSimplePlugin_decompressor_decompressed_7[9] = _zz_IBusSimplePlugin_decompressor_decompressed_6;
    _zz_IBusSimplePlugin_decompressor_decompressed_7[8] = _zz_IBusSimplePlugin_decompressor_decompressed_6;
    _zz_IBusSimplePlugin_decompressor_decompressed_7[7] = _zz_IBusSimplePlugin_decompressor_decompressed_6;
    _zz_IBusSimplePlugin_decompressor_decompressed_7[6] = _zz_IBusSimplePlugin_decompressor_decompressed_6;
    _zz_IBusSimplePlugin_decompressor_decompressed_7[5] = _zz_IBusSimplePlugin_decompressor_decompressed_6;
    _zz_IBusSimplePlugin_decompressor_decompressed_7[4] = _zz_IBusSimplePlugin_decompressor_decompressed_6;
    _zz_IBusSimplePlugin_decompressor_decompressed_7[3] = _zz_IBusSimplePlugin_decompressor_decompressed_6;
    _zz_IBusSimplePlugin_decompressor_decompressed_7[2] = _zz_IBusSimplePlugin_decompressor_decompressed_6;
    _zz_IBusSimplePlugin_decompressor_decompressed_7[1] = _zz_IBusSimplePlugin_decompressor_decompressed_6;
    _zz_IBusSimplePlugin_decompressor_decompressed_7[0] = _zz_IBusSimplePlugin_decompressor_decompressed_6;
  end

  assign _zz_IBusSimplePlugin_decompressor_decompressed_8 = {{{{{{{{_zz_IBusSimplePlugin_decompressor_decompressed_7,_zz_IBusSimplePlugin_decompressor_decompressed[8]},_zz_IBusSimplePlugin_decompressor_decompressed[10 : 9]},_zz_IBusSimplePlugin_decompressor_decompressed[6]},_zz_IBusSimplePlugin_decompressor_decompressed[7]},_zz_IBusSimplePlugin_decompressor_decompressed[2]},_zz_IBusSimplePlugin_decompressor_decompressed[11]},_zz_IBusSimplePlugin_decompressor_decompressed[5 : 3]},1'b0};
  assign _zz_IBusSimplePlugin_decompressor_decompressed_9 = _zz_IBusSimplePlugin_decompressor_decompressed[12];
  always @(*) begin
    _zz_IBusSimplePlugin_decompressor_decompressed_10[14] = _zz_IBusSimplePlugin_decompressor_decompressed_9;
    _zz_IBusSimplePlugin_decompressor_decompressed_10[13] = _zz_IBusSimplePlugin_decompressor_decompressed_9;
    _zz_IBusSimplePlugin_decompressor_decompressed_10[12] = _zz_IBusSimplePlugin_decompressor_decompressed_9;
    _zz_IBusSimplePlugin_decompressor_decompressed_10[11] = _zz_IBusSimplePlugin_decompressor_decompressed_9;
    _zz_IBusSimplePlugin_decompressor_decompressed_10[10] = _zz_IBusSimplePlugin_decompressor_decompressed_9;
    _zz_IBusSimplePlugin_decompressor_decompressed_10[9] = _zz_IBusSimplePlugin_decompressor_decompressed_9;
    _zz_IBusSimplePlugin_decompressor_decompressed_10[8] = _zz_IBusSimplePlugin_decompressor_decompressed_9;
    _zz_IBusSimplePlugin_decompressor_decompressed_10[7] = _zz_IBusSimplePlugin_decompressor_decompressed_9;
    _zz_IBusSimplePlugin_decompressor_decompressed_10[6] = _zz_IBusSimplePlugin_decompressor_decompressed_9;
    _zz_IBusSimplePlugin_decompressor_decompressed_10[5] = _zz_IBusSimplePlugin_decompressor_decompressed_9;
    _zz_IBusSimplePlugin_decompressor_decompressed_10[4] = _zz_IBusSimplePlugin_decompressor_decompressed_9;
    _zz_IBusSimplePlugin_decompressor_decompressed_10[3] = _zz_IBusSimplePlugin_decompressor_decompressed_9;
    _zz_IBusSimplePlugin_decompressor_decompressed_10[2] = _zz_IBusSimplePlugin_decompressor_decompressed_9;
    _zz_IBusSimplePlugin_decompressor_decompressed_10[1] = _zz_IBusSimplePlugin_decompressor_decompressed_9;
    _zz_IBusSimplePlugin_decompressor_decompressed_10[0] = _zz_IBusSimplePlugin_decompressor_decompressed_9;
  end

  assign _zz_IBusSimplePlugin_decompressor_decompressed_11 = _zz_IBusSimplePlugin_decompressor_decompressed[12];
  always @(*) begin
    _zz_IBusSimplePlugin_decompressor_decompressed_12[2] = _zz_IBusSimplePlugin_decompressor_decompressed_11;
    _zz_IBusSimplePlugin_decompressor_decompressed_12[1] = _zz_IBusSimplePlugin_decompressor_decompressed_11;
    _zz_IBusSimplePlugin_decompressor_decompressed_12[0] = _zz_IBusSimplePlugin_decompressor_decompressed_11;
  end

  assign _zz_IBusSimplePlugin_decompressor_decompressed_13 = _zz_IBusSimplePlugin_decompressor_decompressed[12];
  always @(*) begin
    _zz_IBusSimplePlugin_decompressor_decompressed_14[9] = _zz_IBusSimplePlugin_decompressor_decompressed_13;
    _zz_IBusSimplePlugin_decompressor_decompressed_14[8] = _zz_IBusSimplePlugin_decompressor_decompressed_13;
    _zz_IBusSimplePlugin_decompressor_decompressed_14[7] = _zz_IBusSimplePlugin_decompressor_decompressed_13;
    _zz_IBusSimplePlugin_decompressor_decompressed_14[6] = _zz_IBusSimplePlugin_decompressor_decompressed_13;
    _zz_IBusSimplePlugin_decompressor_decompressed_14[5] = _zz_IBusSimplePlugin_decompressor_decompressed_13;
    _zz_IBusSimplePlugin_decompressor_decompressed_14[4] = _zz_IBusSimplePlugin_decompressor_decompressed_13;
    _zz_IBusSimplePlugin_decompressor_decompressed_14[3] = _zz_IBusSimplePlugin_decompressor_decompressed_13;
    _zz_IBusSimplePlugin_decompressor_decompressed_14[2] = _zz_IBusSimplePlugin_decompressor_decompressed_13;
    _zz_IBusSimplePlugin_decompressor_decompressed_14[1] = _zz_IBusSimplePlugin_decompressor_decompressed_13;
    _zz_IBusSimplePlugin_decompressor_decompressed_14[0] = _zz_IBusSimplePlugin_decompressor_decompressed_13;
  end

  assign _zz_IBusSimplePlugin_decompressor_decompressed_15 = {{{{{{{{_zz_IBusSimplePlugin_decompressor_decompressed_14,_zz_IBusSimplePlugin_decompressor_decompressed[8]},_zz_IBusSimplePlugin_decompressor_decompressed[10 : 9]},_zz_IBusSimplePlugin_decompressor_decompressed[6]},_zz_IBusSimplePlugin_decompressor_decompressed[7]},_zz_IBusSimplePlugin_decompressor_decompressed[2]},_zz_IBusSimplePlugin_decompressor_decompressed[11]},_zz_IBusSimplePlugin_decompressor_decompressed[5 : 3]},1'b0};
  assign _zz_IBusSimplePlugin_decompressor_decompressed_16 = _zz_IBusSimplePlugin_decompressor_decompressed[12];
  always @(*) begin
    _zz_IBusSimplePlugin_decompressor_decompressed_17[4] = _zz_IBusSimplePlugin_decompressor_decompressed_16;
    _zz_IBusSimplePlugin_decompressor_decompressed_17[3] = _zz_IBusSimplePlugin_decompressor_decompressed_16;
    _zz_IBusSimplePlugin_decompressor_decompressed_17[2] = _zz_IBusSimplePlugin_decompressor_decompressed_16;
    _zz_IBusSimplePlugin_decompressor_decompressed_17[1] = _zz_IBusSimplePlugin_decompressor_decompressed_16;
    _zz_IBusSimplePlugin_decompressor_decompressed_17[0] = _zz_IBusSimplePlugin_decompressor_decompressed_16;
  end

  assign _zz_IBusSimplePlugin_decompressor_decompressed_18 = {{{{{_zz_IBusSimplePlugin_decompressor_decompressed_17,_zz_IBusSimplePlugin_decompressor_decompressed[6 : 5]},_zz_IBusSimplePlugin_decompressor_decompressed[2]},_zz_IBusSimplePlugin_decompressor_decompressed[11 : 10]},_zz_IBusSimplePlugin_decompressor_decompressed[4 : 3]},1'b0};
  assign _zz_IBusSimplePlugin_decompressor_decompressed_19 = 5'h0;
  assign _zz_IBusSimplePlugin_decompressor_decompressed_20 = 5'h01;
  assign _zz_IBusSimplePlugin_decompressor_decompressed_21 = 5'h02;
  assign switch_Misc_l44 = {_zz_IBusSimplePlugin_decompressor_decompressed[1 : 0],_zz_IBusSimplePlugin_decompressor_decompressed[15 : 13]};
  assign _zz_IBusSimplePlugin_decompressor_decompressed_22 = (_zz_IBusSimplePlugin_decompressor_decompressed[11 : 10] != 2'b11);
  assign switch_Misc_l200 = _zz_IBusSimplePlugin_decompressor_decompressed[11 : 10];
  assign switch_Misc_l200_1 = _zz_IBusSimplePlugin_decompressor_decompressed[6 : 5];
  always @(*) begin
    case(switch_Misc_l200_1)
      2'b00 : begin
        _zz_IBusSimplePlugin_decompressor_decompressed_23 = 3'b000;
      end
      2'b01 : begin
        _zz_IBusSimplePlugin_decompressor_decompressed_23 = 3'b100;
      end
      2'b10 : begin
        _zz_IBusSimplePlugin_decompressor_decompressed_23 = 3'b110;
      end
      default : begin
        _zz_IBusSimplePlugin_decompressor_decompressed_23 = 3'b111;
      end
    endcase
  end

  always @(*) begin
    case(switch_Misc_l200)
      2'b00 : begin
        _zz_IBusSimplePlugin_decompressor_decompressed_24 = 3'b101;
      end
      2'b01 : begin
        _zz_IBusSimplePlugin_decompressor_decompressed_24 = 3'b101;
      end
      2'b10 : begin
        _zz_IBusSimplePlugin_decompressor_decompressed_24 = 3'b111;
      end
      default : begin
        _zz_IBusSimplePlugin_decompressor_decompressed_24 = _zz_IBusSimplePlugin_decompressor_decompressed_23;
      end
    endcase
  end

  assign _zz_IBusSimplePlugin_decompressor_decompressed_25 = _zz_IBusSimplePlugin_decompressor_decompressed[12];
  always @(*) begin
    _zz_IBusSimplePlugin_decompressor_decompressed_26[6] = _zz_IBusSimplePlugin_decompressor_decompressed_25;
    _zz_IBusSimplePlugin_decompressor_decompressed_26[5] = _zz_IBusSimplePlugin_decompressor_decompressed_25;
    _zz_IBusSimplePlugin_decompressor_decompressed_26[4] = _zz_IBusSimplePlugin_decompressor_decompressed_25;
    _zz_IBusSimplePlugin_decompressor_decompressed_26[3] = _zz_IBusSimplePlugin_decompressor_decompressed_25;
    _zz_IBusSimplePlugin_decompressor_decompressed_26[2] = _zz_IBusSimplePlugin_decompressor_decompressed_25;
    _zz_IBusSimplePlugin_decompressor_decompressed_26[1] = _zz_IBusSimplePlugin_decompressor_decompressed_25;
    _zz_IBusSimplePlugin_decompressor_decompressed_26[0] = _zz_IBusSimplePlugin_decompressor_decompressed_25;
  end

  assign IBusSimplePlugin_decompressor_output_valid = (IBusSimplePlugin_decompressor_input_valid && (! ((IBusSimplePlugin_decompressor_throw2Bytes && (! IBusSimplePlugin_decompressor_bufferValid)) && (! IBusSimplePlugin_decompressor_isInputHighRvc))));
  assign IBusSimplePlugin_decompressor_output_payload_pc = IBusSimplePlugin_decompressor_input_payload_pc;
  assign IBusSimplePlugin_decompressor_output_payload_isRvc = IBusSimplePlugin_decompressor_isRvc;
  assign IBusSimplePlugin_decompressor_output_payload_rsp_inst = (IBusSimplePlugin_decompressor_isRvc ? IBusSimplePlugin_decompressor_decompressed : IBusSimplePlugin_decompressor_raw);
  assign IBusSimplePlugin_decompressor_input_ready = (IBusSimplePlugin_decompressor_output_ready && (((! IBusSimplePlugin_iBusRsp_stages_2_input_valid) || IBusSimplePlugin_decompressor_flushNext) || ((! (IBusSimplePlugin_decompressor_bufferValid && IBusSimplePlugin_decompressor_isInputHighRvc)) && (! (((! IBusSimplePlugin_decompressor_unaligned) && IBusSimplePlugin_decompressor_isInputLowRvc) && IBusSimplePlugin_decompressor_isInputHighRvc)))));
  assign IBusSimplePlugin_decompressor_output_fire = (IBusSimplePlugin_decompressor_output_valid && IBusSimplePlugin_decompressor_output_ready);
  assign IBusSimplePlugin_decompressor_bufferFill = (((((! IBusSimplePlugin_decompressor_unaligned) && IBusSimplePlugin_decompressor_isInputLowRvc) && (! IBusSimplePlugin_decompressor_isInputHighRvc)) || (IBusSimplePlugin_decompressor_bufferValid && (! IBusSimplePlugin_decompressor_isInputHighRvc))) || ((IBusSimplePlugin_decompressor_throw2Bytes && (! IBusSimplePlugin_decompressor_isRvc)) && (! IBusSimplePlugin_decompressor_isInputHighRvc)));
  assign when_Fetcher_l283 = (IBusSimplePlugin_decompressor_output_ready && IBusSimplePlugin_decompressor_input_valid);
  assign when_Fetcher_l286 = (IBusSimplePlugin_decompressor_output_ready && IBusSimplePlugin_decompressor_input_valid);
  assign when_Fetcher_l291 = (IBusSimplePlugin_externalFlush || IBusSimplePlugin_decompressor_consumeCurrent);
  assign IBusSimplePlugin_decompressor_output_ready = ((1'b0 && (! IBusSimplePlugin_injector_decodeInput_valid)) || IBusSimplePlugin_injector_decodeInput_ready);
  assign IBusSimplePlugin_injector_decodeInput_valid = _zz_IBusSimplePlugin_injector_decodeInput_valid;
  assign IBusSimplePlugin_injector_decodeInput_payload_pc = _zz_IBusSimplePlugin_injector_decodeInput_payload_pc;
  assign IBusSimplePlugin_injector_decodeInput_payload_rsp_error = _zz_IBusSimplePlugin_injector_decodeInput_payload_rsp_error;
  assign IBusSimplePlugin_injector_decodeInput_payload_rsp_inst = _zz_IBusSimplePlugin_injector_decodeInput_payload_rsp_inst;
  assign IBusSimplePlugin_injector_decodeInput_payload_isRvc = _zz_IBusSimplePlugin_injector_decodeInput_payload_isRvc;
  assign when_Fetcher_l329 = (! 1'b0);
  assign when_Fetcher_l329_1 = (! execute_arbitration_isStuck);
  assign when_Fetcher_l329_2 = (! memory_arbitration_isStuck);
  assign when_Fetcher_l329_3 = (! writeBack_arbitration_isStuck);
  assign IBusSimplePlugin_pcValids_0 = IBusSimplePlugin_injector_nextPcCalc_valids_0;
  assign IBusSimplePlugin_pcValids_1 = IBusSimplePlugin_injector_nextPcCalc_valids_1;
  assign IBusSimplePlugin_pcValids_2 = IBusSimplePlugin_injector_nextPcCalc_valids_2;
  assign IBusSimplePlugin_pcValids_3 = IBusSimplePlugin_injector_nextPcCalc_valids_3;
  assign IBusSimplePlugin_injector_decodeInput_ready = (! decode_arbitration_isStuck);
  always @(*) begin
    decode_arbitration_isValid = IBusSimplePlugin_injector_decodeInput_valid;
    case(switch_Fetcher_l362)
      3'b010 : begin
        decode_arbitration_isValid = 1'b1;
      end
      3'b011 : begin
        decode_arbitration_isValid = 1'b1;
      end
      default : begin
      end
    endcase
  end

  assign iBus_cmd_valid = IBusSimplePlugin_cmd_valid;
  assign IBusSimplePlugin_cmd_ready = iBus_cmd_ready;
  assign iBus_cmd_payload_pc = IBusSimplePlugin_cmd_payload_pc;
  assign IBusSimplePlugin_pending_next = (_zz_IBusSimplePlugin_pending_next - _zz_IBusSimplePlugin_pending_next_3);
  assign IBusSimplePlugin_cmdFork_canEmit = (IBusSimplePlugin_iBusRsp_stages_1_output_ready && (IBusSimplePlugin_pending_value != 3'b111));
  assign when_IBusSimplePlugin_l304 = (IBusSimplePlugin_iBusRsp_stages_1_input_valid && ((! IBusSimplePlugin_cmdFork_canEmit) || (! IBusSimplePlugin_cmd_ready)));
  assign IBusSimplePlugin_cmd_valid = (IBusSimplePlugin_iBusRsp_stages_1_input_valid && IBusSimplePlugin_cmdFork_canEmit);
  assign IBusSimplePlugin_cmd_fire = (IBusSimplePlugin_cmd_valid && IBusSimplePlugin_cmd_ready);
  assign IBusSimplePlugin_pending_inc = IBusSimplePlugin_cmd_fire;
  assign IBusSimplePlugin_cmd_payload_pc = {IBusSimplePlugin_iBusRsp_stages_1_input_payload[31 : 2],2'b00};
  assign IBusSimplePlugin_rspJoin_rspBuffer_flush = ((IBusSimplePlugin_rspJoin_rspBuffer_discardCounter != 3'b000) || IBusSimplePlugin_iBusRsp_flush);
  assign IBusSimplePlugin_rspJoin_rspBuffer_output_valid = (IBusSimplePlugin_rspJoin_rspBuffer_c_io_pop_valid && (IBusSimplePlugin_rspJoin_rspBuffer_discardCounter == 3'b000));
  assign IBusSimplePlugin_rspJoin_rspBuffer_output_payload_error = IBusSimplePlugin_rspJoin_rspBuffer_c_io_pop_payload_error;
  assign IBusSimplePlugin_rspJoin_rspBuffer_output_payload_inst = IBusSimplePlugin_rspJoin_rspBuffer_c_io_pop_payload_inst;
  assign IBusSimplePlugin_rspJoin_rspBuffer_c_io_pop_ready = (IBusSimplePlugin_rspJoin_rspBuffer_output_ready || IBusSimplePlugin_rspJoin_rspBuffer_flush);
  assign IBusSimplePlugin_rspJoin_rspBuffer_c_io_pop_fire = (IBusSimplePlugin_rspJoin_rspBuffer_c_io_pop_valid && IBusSimplePlugin_rspJoin_rspBuffer_c_io_pop_ready);
  assign IBusSimplePlugin_pending_dec = IBusSimplePlugin_rspJoin_rspBuffer_c_io_pop_fire;
  assign IBusSimplePlugin_rspJoin_fetchRsp_pc = IBusSimplePlugin_iBusRsp_stages_2_output_payload;
  always @(*) begin
    IBusSimplePlugin_rspJoin_fetchRsp_rsp_error = IBusSimplePlugin_rspJoin_rspBuffer_output_payload_error;
    if(when_IBusSimplePlugin_l375) begin
      IBusSimplePlugin_rspJoin_fetchRsp_rsp_error = 1'b0;
    end
  end

  assign IBusSimplePlugin_rspJoin_fetchRsp_rsp_inst = IBusSimplePlugin_rspJoin_rspBuffer_output_payload_inst;
  assign when_IBusSimplePlugin_l375 = (! IBusSimplePlugin_rspJoin_rspBuffer_output_valid);
  assign IBusSimplePlugin_rspJoin_exceptionDetected = 1'b0;
  assign IBusSimplePlugin_rspJoin_join_valid = (IBusSimplePlugin_iBusRsp_stages_2_output_valid && IBusSimplePlugin_rspJoin_rspBuffer_output_valid);
  assign IBusSimplePlugin_rspJoin_join_payload_pc = IBusSimplePlugin_rspJoin_fetchRsp_pc;
  assign IBusSimplePlugin_rspJoin_join_payload_rsp_error = IBusSimplePlugin_rspJoin_fetchRsp_rsp_error;
  assign IBusSimplePlugin_rspJoin_join_payload_rsp_inst = IBusSimplePlugin_rspJoin_fetchRsp_rsp_inst;
  assign IBusSimplePlugin_rspJoin_join_payload_isRvc = IBusSimplePlugin_rspJoin_fetchRsp_isRvc;
  assign IBusSimplePlugin_rspJoin_join_fire = (IBusSimplePlugin_rspJoin_join_valid && IBusSimplePlugin_rspJoin_join_ready);
  assign IBusSimplePlugin_iBusRsp_stages_2_output_ready = (IBusSimplePlugin_iBusRsp_stages_2_output_valid ? IBusSimplePlugin_rspJoin_join_fire : IBusSimplePlugin_rspJoin_join_ready);
  assign IBusSimplePlugin_rspJoin_join_fire_1 = (IBusSimplePlugin_rspJoin_join_valid && IBusSimplePlugin_rspJoin_join_ready);
  assign IBusSimplePlugin_rspJoin_rspBuffer_output_ready = IBusSimplePlugin_rspJoin_join_fire_1;
  assign _zz_IBusSimplePlugin_iBusRsp_output_valid = (! IBusSimplePlugin_rspJoin_exceptionDetected);
  assign IBusSimplePlugin_rspJoin_join_ready = (IBusSimplePlugin_iBusRsp_output_ready && _zz_IBusSimplePlugin_iBusRsp_output_valid);
  assign IBusSimplePlugin_iBusRsp_output_valid = (IBusSimplePlugin_rspJoin_join_valid && _zz_IBusSimplePlugin_iBusRsp_output_valid);
  assign IBusSimplePlugin_iBusRsp_output_payload_pc = IBusSimplePlugin_rspJoin_join_payload_pc;
  assign IBusSimplePlugin_iBusRsp_output_payload_rsp_error = IBusSimplePlugin_rspJoin_join_payload_rsp_error;
  assign IBusSimplePlugin_iBusRsp_output_payload_rsp_inst = IBusSimplePlugin_rspJoin_join_payload_rsp_inst;
  assign IBusSimplePlugin_iBusRsp_output_payload_isRvc = IBusSimplePlugin_rspJoin_join_payload_isRvc;
  assign _zz_dBus_cmd_valid = 1'b0;
  always @(*) begin
    execute_DBusSimplePlugin_skipCmd = 1'b0;
    if(execute_ALIGNEMENT_FAULT) begin
      execute_DBusSimplePlugin_skipCmd = 1'b1;
    end
  end

  assign dBus_cmd_valid = (((((execute_arbitration_isValid && execute_MEMORY_ENABLE) && (! execute_arbitration_isStuckByOthers)) && (! execute_arbitration_isFlushed)) && (! execute_DBusSimplePlugin_skipCmd)) && (! _zz_dBus_cmd_valid));
  assign dBus_cmd_payload_wr = execute_MEMORY_STORE;
  assign dBus_cmd_payload_size = execute_INSTRUCTION[13 : 12];
  always @(*) begin
    case(dBus_cmd_payload_size)
      2'b00 : begin
        _zz_dBus_cmd_payload_data = {{{execute_RS2[7 : 0],execute_RS2[7 : 0]},execute_RS2[7 : 0]},execute_RS2[7 : 0]};
      end
      2'b01 : begin
        _zz_dBus_cmd_payload_data = {execute_RS2[15 : 0],execute_RS2[15 : 0]};
      end
      default : begin
        _zz_dBus_cmd_payload_data = execute_RS2[31 : 0];
      end
    endcase
  end

  assign dBus_cmd_payload_data = _zz_dBus_cmd_payload_data;
  assign when_DBusSimplePlugin_l426 = ((((execute_arbitration_isValid && execute_MEMORY_ENABLE) && (! dBus_cmd_ready)) && (! execute_DBusSimplePlugin_skipCmd)) && (! _zz_dBus_cmd_valid));
  always @(*) begin
    case(dBus_cmd_payload_size)
      2'b00 : begin
        _zz_execute_DBusSimplePlugin_formalMask = 4'b0001;
      end
      2'b01 : begin
        _zz_execute_DBusSimplePlugin_formalMask = 4'b0011;
      end
      default : begin
        _zz_execute_DBusSimplePlugin_formalMask = 4'b1111;
      end
    endcase
  end

  assign execute_DBusSimplePlugin_formalMask = (_zz_execute_DBusSimplePlugin_formalMask <<< dBus_cmd_payload_address[1 : 0]);
  assign dBus_cmd_payload_address = execute_SRC_ADD;
  assign when_DBusSimplePlugin_l479 = (((memory_arbitration_isValid && memory_MEMORY_ENABLE) && (! memory_MEMORY_STORE)) && ((! dBus_rsp_ready) || 1'b0));
  always @(*) begin
    writeBack_DBusSimplePlugin_rspShifted = writeBack_MEMORY_READ_DATA;
    case(writeBack_MEMORY_ADDRESS_LOW)
      2'b01 : begin
        writeBack_DBusSimplePlugin_rspShifted[7 : 0] = writeBack_MEMORY_READ_DATA[15 : 8];
      end
      2'b10 : begin
        writeBack_DBusSimplePlugin_rspShifted[15 : 0] = writeBack_MEMORY_READ_DATA[31 : 16];
      end
      2'b11 : begin
        writeBack_DBusSimplePlugin_rspShifted[7 : 0] = writeBack_MEMORY_READ_DATA[31 : 24];
      end
      default : begin
      end
    endcase
  end

  assign switch_Misc_l200_2 = writeBack_INSTRUCTION[13 : 12];
  assign _zz_writeBack_DBusSimplePlugin_rspFormated = (writeBack_DBusSimplePlugin_rspShifted[7] && (! writeBack_INSTRUCTION[14]));
  always @(*) begin
    _zz_writeBack_DBusSimplePlugin_rspFormated_1[31] = _zz_writeBack_DBusSimplePlugin_rspFormated;
    _zz_writeBack_DBusSimplePlugin_rspFormated_1[30] = _zz_writeBack_DBusSimplePlugin_rspFormated;
    _zz_writeBack_DBusSimplePlugin_rspFormated_1[29] = _zz_writeBack_DBusSimplePlugin_rspFormated;
    _zz_writeBack_DBusSimplePlugin_rspFormated_1[28] = _zz_writeBack_DBusSimplePlugin_rspFormated;
    _zz_writeBack_DBusSimplePlugin_rspFormated_1[27] = _zz_writeBack_DBusSimplePlugin_rspFormated;
    _zz_writeBack_DBusSimplePlugin_rspFormated_1[26] = _zz_writeBack_DBusSimplePlugin_rspFormated;
    _zz_writeBack_DBusSimplePlugin_rspFormated_1[25] = _zz_writeBack_DBusSimplePlugin_rspFormated;
    _zz_writeBack_DBusSimplePlugin_rspFormated_1[24] = _zz_writeBack_DBusSimplePlugin_rspFormated;
    _zz_writeBack_DBusSimplePlugin_rspFormated_1[23] = _zz_writeBack_DBusSimplePlugin_rspFormated;
    _zz_writeBack_DBusSimplePlugin_rspFormated_1[22] = _zz_writeBack_DBusSimplePlugin_rspFormated;
    _zz_writeBack_DBusSimplePlugin_rspFormated_1[21] = _zz_writeBack_DBusSimplePlugin_rspFormated;
    _zz_writeBack_DBusSimplePlugin_rspFormated_1[20] = _zz_writeBack_DBusSimplePlugin_rspFormated;
    _zz_writeBack_DBusSimplePlugin_rspFormated_1[19] = _zz_writeBack_DBusSimplePlugin_rspFormated;
    _zz_writeBack_DBusSimplePlugin_rspFormated_1[18] = _zz_writeBack_DBusSimplePlugin_rspFormated;
    _zz_writeBack_DBusSimplePlugin_rspFormated_1[17] = _zz_writeBack_DBusSimplePlugin_rspFormated;
    _zz_writeBack_DBusSimplePlugin_rspFormated_1[16] = _zz_writeBack_DBusSimplePlugin_rspFormated;
    _zz_writeBack_DBusSimplePlugin_rspFormated_1[15] = _zz_writeBack_DBusSimplePlugin_rspFormated;
    _zz_writeBack_DBusSimplePlugin_rspFormated_1[14] = _zz_writeBack_DBusSimplePlugin_rspFormated;
    _zz_writeBack_DBusSimplePlugin_rspFormated_1[13] = _zz_writeBack_DBusSimplePlugin_rspFormated;
    _zz_writeBack_DBusSimplePlugin_rspFormated_1[12] = _zz_writeBack_DBusSimplePlugin_rspFormated;
    _zz_writeBack_DBusSimplePlugin_rspFormated_1[11] = _zz_writeBack_DBusSimplePlugin_rspFormated;
    _zz_writeBack_DBusSimplePlugin_rspFormated_1[10] = _zz_writeBack_DBusSimplePlugin_rspFormated;
    _zz_writeBack_DBusSimplePlugin_rspFormated_1[9] = _zz_writeBack_DBusSimplePlugin_rspFormated;
    _zz_writeBack_DBusSimplePlugin_rspFormated_1[8] = _zz_writeBack_DBusSimplePlugin_rspFormated;
    _zz_writeBack_DBusSimplePlugin_rspFormated_1[7 : 0] = writeBack_DBusSimplePlugin_rspShifted[7 : 0];
  end

  assign _zz_writeBack_DBusSimplePlugin_rspFormated_2 = (writeBack_DBusSimplePlugin_rspShifted[15] && (! writeBack_INSTRUCTION[14]));
  always @(*) begin
    _zz_writeBack_DBusSimplePlugin_rspFormated_3[31] = _zz_writeBack_DBusSimplePlugin_rspFormated_2;
    _zz_writeBack_DBusSimplePlugin_rspFormated_3[30] = _zz_writeBack_DBusSimplePlugin_rspFormated_2;
    _zz_writeBack_DBusSimplePlugin_rspFormated_3[29] = _zz_writeBack_DBusSimplePlugin_rspFormated_2;
    _zz_writeBack_DBusSimplePlugin_rspFormated_3[28] = _zz_writeBack_DBusSimplePlugin_rspFormated_2;
    _zz_writeBack_DBusSimplePlugin_rspFormated_3[27] = _zz_writeBack_DBusSimplePlugin_rspFormated_2;
    _zz_writeBack_DBusSimplePlugin_rspFormated_3[26] = _zz_writeBack_DBusSimplePlugin_rspFormated_2;
    _zz_writeBack_DBusSimplePlugin_rspFormated_3[25] = _zz_writeBack_DBusSimplePlugin_rspFormated_2;
    _zz_writeBack_DBusSimplePlugin_rspFormated_3[24] = _zz_writeBack_DBusSimplePlugin_rspFormated_2;
    _zz_writeBack_DBusSimplePlugin_rspFormated_3[23] = _zz_writeBack_DBusSimplePlugin_rspFormated_2;
    _zz_writeBack_DBusSimplePlugin_rspFormated_3[22] = _zz_writeBack_DBusSimplePlugin_rspFormated_2;
    _zz_writeBack_DBusSimplePlugin_rspFormated_3[21] = _zz_writeBack_DBusSimplePlugin_rspFormated_2;
    _zz_writeBack_DBusSimplePlugin_rspFormated_3[20] = _zz_writeBack_DBusSimplePlugin_rspFormated_2;
    _zz_writeBack_DBusSimplePlugin_rspFormated_3[19] = _zz_writeBack_DBusSimplePlugin_rspFormated_2;
    _zz_writeBack_DBusSimplePlugin_rspFormated_3[18] = _zz_writeBack_DBusSimplePlugin_rspFormated_2;
    _zz_writeBack_DBusSimplePlugin_rspFormated_3[17] = _zz_writeBack_DBusSimplePlugin_rspFormated_2;
    _zz_writeBack_DBusSimplePlugin_rspFormated_3[16] = _zz_writeBack_DBusSimplePlugin_rspFormated_2;
    _zz_writeBack_DBusSimplePlugin_rspFormated_3[15 : 0] = writeBack_DBusSimplePlugin_rspShifted[15 : 0];
  end

  always @(*) begin
    case(switch_Misc_l200_2)
      2'b00 : begin
        writeBack_DBusSimplePlugin_rspFormated = _zz_writeBack_DBusSimplePlugin_rspFormated_1;
      end
      2'b01 : begin
        writeBack_DBusSimplePlugin_rspFormated = _zz_writeBack_DBusSimplePlugin_rspFormated_3;
      end
      default : begin
        writeBack_DBusSimplePlugin_rspFormated = writeBack_DBusSimplePlugin_rspShifted;
      end
    endcase
  end

  assign when_DBusSimplePlugin_l558 = (writeBack_arbitration_isValid && writeBack_MEMORY_ENABLE);
  always @(*) begin
    CsrPlugin_privilege = 2'b11;
    if(CsrPlugin_forceMachineWire) begin
      CsrPlugin_privilege = 2'b11;
    end
  end

  assign CsrPlugin_misa_base = 2'b01;
  assign CsrPlugin_misa_extensions = 26'h0000042;
  assign _zz_when_CsrPlugin_l952 = (CsrPlugin_mip_MTIP && CsrPlugin_mie_MTIE);
  assign _zz_when_CsrPlugin_l952_1 = (CsrPlugin_mip_MSIP && CsrPlugin_mie_MSIE);
  assign _zz_when_CsrPlugin_l952_2 = (CsrPlugin_mip_MEIP && CsrPlugin_mie_MEIE);
  assign when_CsrPlugin_l946 = (CsrPlugin_mstatus_MIE || (CsrPlugin_privilege < 2'b11));
  assign when_CsrPlugin_l952 = ((_zz_when_CsrPlugin_l952 && 1'b1) && (! 1'b0));
  assign when_CsrPlugin_l952_1 = ((_zz_when_CsrPlugin_l952_1 && 1'b1) && (! 1'b0));
  assign when_CsrPlugin_l952_2 = ((_zz_when_CsrPlugin_l952_2 && 1'b1) && (! 1'b0));
  assign CsrPlugin_exception = 1'b0;
  assign CsrPlugin_lastStageWasWfi = 1'b0;
  assign CsrPlugin_pipelineLiberator_active = ((CsrPlugin_interrupt_valid && CsrPlugin_allowInterrupts) && decode_arbitration_isValid);
  assign when_CsrPlugin_l980 = (! execute_arbitration_isStuck);
  assign when_CsrPlugin_l980_1 = (! memory_arbitration_isStuck);
  assign when_CsrPlugin_l980_2 = (! writeBack_arbitration_isStuck);
  assign when_CsrPlugin_l985 = ((! CsrPlugin_pipelineLiberator_active) || decode_arbitration_removeIt);
  always @(*) begin
    CsrPlugin_pipelineLiberator_done = CsrPlugin_pipelineLiberator_pcValids_2;
    if(CsrPlugin_hadException) begin
      CsrPlugin_pipelineLiberator_done = 1'b0;
    end
  end

  assign CsrPlugin_interruptJump = ((CsrPlugin_interrupt_valid && CsrPlugin_pipelineLiberator_done) && CsrPlugin_allowInterrupts);
  assign CsrPlugin_targetPrivilege = CsrPlugin_interrupt_targetPrivilege;
  assign CsrPlugin_trapCause = CsrPlugin_interrupt_code;
  always @(*) begin
    CsrPlugin_xtvec_mode = 2'bxx;
    case(CsrPlugin_targetPrivilege)
      2'b11 : begin
        CsrPlugin_xtvec_mode = CsrPlugin_mtvec_mode;
      end
      default : begin
      end
    endcase
  end

  always @(*) begin
    CsrPlugin_xtvec_base = 30'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
    case(CsrPlugin_targetPrivilege)
      2'b11 : begin
        CsrPlugin_xtvec_base = CsrPlugin_mtvec_base;
      end
      default : begin
      end
    endcase
  end

  assign when_CsrPlugin_l1019 = (CsrPlugin_hadException || CsrPlugin_interruptJump);
  assign when_CsrPlugin_l1064 = (writeBack_arbitration_isValid && (writeBack_ENV_CTRL == `EnvCtrlEnum_binary_sequential_XRET));
  assign switch_CsrPlugin_l1068 = writeBack_INSTRUCTION[29 : 28];
  assign contextSwitching = CsrPlugin_jumpInterface_valid;
  assign when_CsrPlugin_l1116 = ({(writeBack_arbitration_isValid && (writeBack_ENV_CTRL == `EnvCtrlEnum_binary_sequential_XRET)),{(memory_arbitration_isValid && (memory_ENV_CTRL == `EnvCtrlEnum_binary_sequential_XRET)),(execute_arbitration_isValid && (execute_ENV_CTRL == `EnvCtrlEnum_binary_sequential_XRET))}} != 3'b000);
  assign execute_CsrPlugin_blockedBySideEffects = (({writeBack_arbitration_isValid,memory_arbitration_isValid} != 2'b00) || 1'b0);
  always @(*) begin
    execute_CsrPlugin_illegalAccess = 1'b1;
    if(execute_CsrPlugin_csr_768) begin
      execute_CsrPlugin_illegalAccess = 1'b0;
    end
    if(execute_CsrPlugin_csr_836) begin
      execute_CsrPlugin_illegalAccess = 1'b0;
    end
    if(execute_CsrPlugin_csr_772) begin
      execute_CsrPlugin_illegalAccess = 1'b0;
    end
    if(execute_CsrPlugin_csr_773) begin
      if(execute_CSR_WRITE_OPCODE) begin
        execute_CsrPlugin_illegalAccess = 1'b0;
      end
    end
    if(execute_CsrPlugin_csr_834) begin
      if(execute_CSR_READ_OPCODE) begin
        execute_CsrPlugin_illegalAccess = 1'b0;
      end
    end
    if(CsrPlugin_csrMapping_allowCsrSignal) begin
      execute_CsrPlugin_illegalAccess = 1'b0;
    end
    if(when_CsrPlugin_l1297) begin
      execute_CsrPlugin_illegalAccess = 1'b1;
    end
    if(when_CsrPlugin_l1302) begin
      execute_CsrPlugin_illegalAccess = 1'b0;
    end
  end

  always @(*) begin
    execute_CsrPlugin_illegalInstruction = 1'b0;
    if(when_CsrPlugin_l1136) begin
      if(when_CsrPlugin_l1137) begin
        execute_CsrPlugin_illegalInstruction = 1'b1;
      end
    end
  end

  assign when_CsrPlugin_l1136 = (execute_arbitration_isValid && (execute_ENV_CTRL == `EnvCtrlEnum_binary_sequential_XRET));
  assign when_CsrPlugin_l1137 = (CsrPlugin_privilege < execute_INSTRUCTION[29 : 28]);
  always @(*) begin
    execute_CsrPlugin_writeInstruction = ((execute_arbitration_isValid && execute_IS_CSR) && execute_CSR_WRITE_OPCODE);
    if(when_CsrPlugin_l1297) begin
      execute_CsrPlugin_writeInstruction = 1'b0;
    end
  end

  always @(*) begin
    execute_CsrPlugin_readInstruction = ((execute_arbitration_isValid && execute_IS_CSR) && execute_CSR_READ_OPCODE);
    if(when_CsrPlugin_l1297) begin
      execute_CsrPlugin_readInstruction = 1'b0;
    end
  end

  assign execute_CsrPlugin_writeEnable = (execute_CsrPlugin_writeInstruction && (! execute_arbitration_isStuck));
  assign execute_CsrPlugin_readEnable = (execute_CsrPlugin_readInstruction && (! execute_arbitration_isStuck));
  assign CsrPlugin_csrMapping_hazardFree = (! execute_CsrPlugin_blockedBySideEffects);
  assign execute_CsrPlugin_readToWriteData = CsrPlugin_csrMapping_readDataSignal;
  assign switch_Misc_l200_3 = execute_INSTRUCTION[13];
  always @(*) begin
    case(switch_Misc_l200_3)
      1'b0 : begin
        _zz_CsrPlugin_csrMapping_writeDataSignal = execute_SRC1;
      end
      default : begin
        _zz_CsrPlugin_csrMapping_writeDataSignal = (execute_INSTRUCTION[12] ? (execute_CsrPlugin_readToWriteData & (~ execute_SRC1)) : (execute_CsrPlugin_readToWriteData | execute_SRC1));
      end
    endcase
  end

  assign CsrPlugin_csrMapping_writeDataSignal = _zz_CsrPlugin_csrMapping_writeDataSignal;
  assign when_CsrPlugin_l1176 = (execute_arbitration_isValid && execute_IS_CSR);
  assign when_CsrPlugin_l1180 = (execute_arbitration_isValid && (execute_IS_CSR || 1'b0));
  assign execute_CsrPlugin_csrAddress = execute_INSTRUCTION[31 : 20];
  assign _zz_decode_BRANCH_CTRL_3 = ((decode_INSTRUCTION & 32'h00004050) == 32'h00004050);
  assign _zz_decode_BRANCH_CTRL_4 = ((decode_INSTRUCTION & 32'h00006004) == 32'h00002000);
  assign _zz_decode_BRANCH_CTRL_5 = ((decode_INSTRUCTION & 32'h00000004) == 32'h00000004);
  assign _zz_decode_BRANCH_CTRL_6 = ((decode_INSTRUCTION & 32'h00000048) == 32'h00000048);
  assign _zz_decode_BRANCH_CTRL_7 = ((decode_INSTRUCTION & 32'h00001000) == 32'h0);
  assign _zz_decode_BRANCH_CTRL_2 = {(((decode_INSTRUCTION & _zz__zz_decode_BRANCH_CTRL_2) == 32'h00000050) != 1'b0),{({_zz_decode_BRANCH_CTRL_6,_zz__zz_decode_BRANCH_CTRL_2_1} != 2'b00),{(_zz__zz_decode_BRANCH_CTRL_2_2 != 1'b0),{(_zz__zz_decode_BRANCH_CTRL_2_3 != _zz__zz_decode_BRANCH_CTRL_2_8),{_zz__zz_decode_BRANCH_CTRL_2_9,{_zz__zz_decode_BRANCH_CTRL_2_15,_zz__zz_decode_BRANCH_CTRL_2_16}}}}}};
  assign _zz_decode_SRC1_CTRL_2 = _zz_decode_BRANCH_CTRL_2[1 : 0];
  assign _zz_decode_SRC1_CTRL_1 = _zz_decode_SRC1_CTRL_2;
  assign _zz_decode_SRC2_CTRL_2 = _zz_decode_BRANCH_CTRL_2[6 : 5];
  assign _zz_decode_SRC2_CTRL_1 = _zz_decode_SRC2_CTRL_2;
  assign _zz_decode_ENV_CTRL_2 = _zz_decode_BRANCH_CTRL_2[13 : 13];
  assign _zz_decode_ENV_CTRL_1 = _zz_decode_ENV_CTRL_2;
  assign _zz_decode_ALU_CTRL_2 = _zz_decode_BRANCH_CTRL_2[16 : 15];
  assign _zz_decode_ALU_CTRL_1 = _zz_decode_ALU_CTRL_2;
  assign _zz_decode_ALU_BITWISE_CTRL_2 = _zz_decode_BRANCH_CTRL_2[19 : 18];
  assign _zz_decode_ALU_BITWISE_CTRL_1 = _zz_decode_ALU_BITWISE_CTRL_2;
  assign _zz_decode_SHIFT_CTRL_2 = _zz_decode_BRANCH_CTRL_2[26 : 25];
  assign _zz_decode_SHIFT_CTRL_1 = _zz_decode_SHIFT_CTRL_2;
  assign _zz_decode_BRANCH_CTRL_8 = _zz_decode_BRANCH_CTRL_2[28 : 27];
  assign _zz_decode_BRANCH_CTRL_1 = _zz_decode_BRANCH_CTRL_8;
  assign when_RegFilePlugin_l63 = (decode_INSTRUCTION[11 : 7] == 5'h0);
  assign decode_RegFilePlugin_regFileReadAddress1 = decode_INSTRUCTION_ANTICIPATED[19 : 15];
  assign decode_RegFilePlugin_regFileReadAddress2 = decode_INSTRUCTION_ANTICIPATED[24 : 20];
  assign decode_RegFilePlugin_rs1Data = _zz_RegFilePlugin_regFile_port0;
  assign decode_RegFilePlugin_rs2Data = _zz_RegFilePlugin_regFile_port1;
  always @(*) begin
    lastStageRegFileWrite_valid = (_zz_lastStageRegFileWrite_valid && writeBack_arbitration_isFiring);
    if(_zz_2) begin
      lastStageRegFileWrite_valid = 1'b1;
    end
  end

  always @(*) begin
    lastStageRegFileWrite_payload_address = _zz_lastStageRegFileWrite_payload_address[11 : 7];
    if(_zz_2) begin
      lastStageRegFileWrite_payload_address = 5'h0;
    end
  end

  always @(*) begin
    lastStageRegFileWrite_payload_data = _zz_decode_RS2_2;
    if(_zz_2) begin
      lastStageRegFileWrite_payload_data = 32'h0;
    end
  end

  always @(*) begin
    case(execute_ALU_BITWISE_CTRL)
      `AluBitwiseCtrlEnum_binary_sequential_AND_1 : begin
        execute_IntAluPlugin_bitwise = (execute_SRC1 & execute_SRC2);
      end
      `AluBitwiseCtrlEnum_binary_sequential_OR_1 : begin
        execute_IntAluPlugin_bitwise = (execute_SRC1 | execute_SRC2);
      end
      default : begin
        execute_IntAluPlugin_bitwise = (execute_SRC1 ^ execute_SRC2);
      end
    endcase
  end

  always @(*) begin
    case(execute_ALU_CTRL)
      `AluCtrlEnum_binary_sequential_BITWISE : begin
        _zz_execute_REGFILE_WRITE_DATA = execute_IntAluPlugin_bitwise;
      end
      `AluCtrlEnum_binary_sequential_SLT_SLTU : begin
        _zz_execute_REGFILE_WRITE_DATA = {31'd0, _zz__zz_execute_REGFILE_WRITE_DATA};
      end
      default : begin
        _zz_execute_REGFILE_WRITE_DATA = execute_SRC_ADD_SUB;
      end
    endcase
  end

  always @(*) begin
    case(decode_SRC1_CTRL)
      `Src1CtrlEnum_binary_sequential_RS : begin
        _zz_decode_SRC1_1 = _zz_decode_SRC1;
      end
      `Src1CtrlEnum_binary_sequential_PC_INCREMENT : begin
        _zz_decode_SRC1_1 = {29'd0, _zz__zz_decode_SRC1_1};
      end
      `Src1CtrlEnum_binary_sequential_IMU : begin
        _zz_decode_SRC1_1 = {decode_INSTRUCTION[31 : 12],12'h0};
      end
      default : begin
        _zz_decode_SRC1_1 = {27'd0, _zz__zz_decode_SRC1_1_1};
      end
    endcase
  end

  assign _zz_decode_SRC2_2 = decode_INSTRUCTION[31];
  always @(*) begin
    _zz_decode_SRC2_3[19] = _zz_decode_SRC2_2;
    _zz_decode_SRC2_3[18] = _zz_decode_SRC2_2;
    _zz_decode_SRC2_3[17] = _zz_decode_SRC2_2;
    _zz_decode_SRC2_3[16] = _zz_decode_SRC2_2;
    _zz_decode_SRC2_3[15] = _zz_decode_SRC2_2;
    _zz_decode_SRC2_3[14] = _zz_decode_SRC2_2;
    _zz_decode_SRC2_3[13] = _zz_decode_SRC2_2;
    _zz_decode_SRC2_3[12] = _zz_decode_SRC2_2;
    _zz_decode_SRC2_3[11] = _zz_decode_SRC2_2;
    _zz_decode_SRC2_3[10] = _zz_decode_SRC2_2;
    _zz_decode_SRC2_3[9] = _zz_decode_SRC2_2;
    _zz_decode_SRC2_3[8] = _zz_decode_SRC2_2;
    _zz_decode_SRC2_3[7] = _zz_decode_SRC2_2;
    _zz_decode_SRC2_3[6] = _zz_decode_SRC2_2;
    _zz_decode_SRC2_3[5] = _zz_decode_SRC2_2;
    _zz_decode_SRC2_3[4] = _zz_decode_SRC2_2;
    _zz_decode_SRC2_3[3] = _zz_decode_SRC2_2;
    _zz_decode_SRC2_3[2] = _zz_decode_SRC2_2;
    _zz_decode_SRC2_3[1] = _zz_decode_SRC2_2;
    _zz_decode_SRC2_3[0] = _zz_decode_SRC2_2;
  end

  assign _zz_decode_SRC2_4 = _zz__zz_decode_SRC2_4[11];
  always @(*) begin
    _zz_decode_SRC2_5[19] = _zz_decode_SRC2_4;
    _zz_decode_SRC2_5[18] = _zz_decode_SRC2_4;
    _zz_decode_SRC2_5[17] = _zz_decode_SRC2_4;
    _zz_decode_SRC2_5[16] = _zz_decode_SRC2_4;
    _zz_decode_SRC2_5[15] = _zz_decode_SRC2_4;
    _zz_decode_SRC2_5[14] = _zz_decode_SRC2_4;
    _zz_decode_SRC2_5[13] = _zz_decode_SRC2_4;
    _zz_decode_SRC2_5[12] = _zz_decode_SRC2_4;
    _zz_decode_SRC2_5[11] = _zz_decode_SRC2_4;
    _zz_decode_SRC2_5[10] = _zz_decode_SRC2_4;
    _zz_decode_SRC2_5[9] = _zz_decode_SRC2_4;
    _zz_decode_SRC2_5[8] = _zz_decode_SRC2_4;
    _zz_decode_SRC2_5[7] = _zz_decode_SRC2_4;
    _zz_decode_SRC2_5[6] = _zz_decode_SRC2_4;
    _zz_decode_SRC2_5[5] = _zz_decode_SRC2_4;
    _zz_decode_SRC2_5[4] = _zz_decode_SRC2_4;
    _zz_decode_SRC2_5[3] = _zz_decode_SRC2_4;
    _zz_decode_SRC2_5[2] = _zz_decode_SRC2_4;
    _zz_decode_SRC2_5[1] = _zz_decode_SRC2_4;
    _zz_decode_SRC2_5[0] = _zz_decode_SRC2_4;
  end

  always @(*) begin
    case(decode_SRC2_CTRL)
      `Src2CtrlEnum_binary_sequential_RS : begin
        _zz_decode_SRC2_6 = _zz_decode_SRC2_1;
      end
      `Src2CtrlEnum_binary_sequential_IMI : begin
        _zz_decode_SRC2_6 = {_zz_decode_SRC2_3,decode_INSTRUCTION[31 : 20]};
      end
      `Src2CtrlEnum_binary_sequential_IMS : begin
        _zz_decode_SRC2_6 = {_zz_decode_SRC2_5,{decode_INSTRUCTION[31 : 25],decode_INSTRUCTION[11 : 7]}};
      end
      default : begin
        _zz_decode_SRC2_6 = _zz_decode_SRC2;
      end
    endcase
  end

  always @(*) begin
    execute_SrcPlugin_addSub = _zz_execute_SrcPlugin_addSub;
    if(execute_SRC2_FORCE_ZERO) begin
      execute_SrcPlugin_addSub = execute_SRC1;
    end
  end

  assign execute_SrcPlugin_less = ((execute_SRC1[31] == execute_SRC2[31]) ? execute_SrcPlugin_addSub[31] : (execute_SRC_LESS_UNSIGNED ? execute_SRC2[31] : execute_SRC1[31]));
  assign execute_MulPlugin_a = execute_RS1;
  assign execute_MulPlugin_b = execute_RS2;
  assign switch_MulPlugin_l87 = execute_INSTRUCTION[13 : 12];
  always @(*) begin
    case(switch_MulPlugin_l87)
      2'b01 : begin
        execute_MulPlugin_aSigned = 1'b1;
      end
      2'b10 : begin
        execute_MulPlugin_aSigned = 1'b1;
      end
      default : begin
        execute_MulPlugin_aSigned = 1'b0;
      end
    endcase
  end

  always @(*) begin
    case(switch_MulPlugin_l87)
      2'b01 : begin
        execute_MulPlugin_bSigned = 1'b1;
      end
      2'b10 : begin
        execute_MulPlugin_bSigned = 1'b0;
      end
      default : begin
        execute_MulPlugin_bSigned = 1'b0;
      end
    endcase
  end

  assign execute_MulPlugin_aULow = execute_MulPlugin_a[15 : 0];
  assign execute_MulPlugin_bULow = execute_MulPlugin_b[15 : 0];
  assign execute_MulPlugin_aSLow = {1'b0,execute_MulPlugin_a[15 : 0]};
  assign execute_MulPlugin_bSLow = {1'b0,execute_MulPlugin_b[15 : 0]};
  assign execute_MulPlugin_aHigh = {(execute_MulPlugin_aSigned && execute_MulPlugin_a[31]),execute_MulPlugin_a[31 : 16]};
  assign execute_MulPlugin_bHigh = {(execute_MulPlugin_bSigned && execute_MulPlugin_b[31]),execute_MulPlugin_b[31 : 16]};
  assign writeBack_MulPlugin_result = ($signed(_zz_writeBack_MulPlugin_result) + $signed(_zz_writeBack_MulPlugin_result_1));
  assign when_MulPlugin_l147 = (writeBack_arbitration_isValid && writeBack_IS_MUL);
  assign switch_MulPlugin_l148 = writeBack_INSTRUCTION[13 : 12];
  assign memory_DivPlugin_frontendOk = 1'b1;
  always @(*) begin
    memory_DivPlugin_div_counter_willIncrement = 1'b0;
    if(when_MulDivIterativePlugin_l128) begin
      if(when_MulDivIterativePlugin_l132) begin
        memory_DivPlugin_div_counter_willIncrement = 1'b1;
      end
    end
  end

  always @(*) begin
    memory_DivPlugin_div_counter_willClear = 1'b0;
    if(when_MulDivIterativePlugin_l162) begin
      memory_DivPlugin_div_counter_willClear = 1'b1;
    end
  end

  assign memory_DivPlugin_div_counter_willOverflowIfInc = (memory_DivPlugin_div_counter_value == 6'h21);
  assign memory_DivPlugin_div_counter_willOverflow = (memory_DivPlugin_div_counter_willOverflowIfInc && memory_DivPlugin_div_counter_willIncrement);
  always @(*) begin
    if(memory_DivPlugin_div_counter_willOverflow) begin
      memory_DivPlugin_div_counter_valueNext = 6'h0;
    end else begin
      memory_DivPlugin_div_counter_valueNext = (memory_DivPlugin_div_counter_value + _zz_memory_DivPlugin_div_counter_valueNext);
    end
    if(memory_DivPlugin_div_counter_willClear) begin
      memory_DivPlugin_div_counter_valueNext = 6'h0;
    end
  end

  assign when_MulDivIterativePlugin_l126 = (memory_DivPlugin_div_counter_value == 6'h20);
  assign when_MulDivIterativePlugin_l126_1 = (! memory_arbitration_isStuck);
  assign when_MulDivIterativePlugin_l128 = (memory_arbitration_isValid && memory_IS_DIV);
  assign when_MulDivIterativePlugin_l129 = ((! memory_DivPlugin_frontendOk) || (! memory_DivPlugin_div_done));
  assign when_MulDivIterativePlugin_l132 = (memory_DivPlugin_frontendOk && (! memory_DivPlugin_div_done));
  assign _zz_memory_DivPlugin_div_stage_0_remainderShifted = memory_DivPlugin_rs1[31 : 0];
  assign memory_DivPlugin_div_stage_0_remainderShifted = {memory_DivPlugin_accumulator[31 : 0],_zz_memory_DivPlugin_div_stage_0_remainderShifted[31]};
  assign memory_DivPlugin_div_stage_0_remainderMinusDenominator = (memory_DivPlugin_div_stage_0_remainderShifted - _zz_memory_DivPlugin_div_stage_0_remainderMinusDenominator);
  assign memory_DivPlugin_div_stage_0_outRemainder = ((! memory_DivPlugin_div_stage_0_remainderMinusDenominator[32]) ? _zz_memory_DivPlugin_div_stage_0_outRemainder : _zz_memory_DivPlugin_div_stage_0_outRemainder_1);
  assign memory_DivPlugin_div_stage_0_outNumerator = _zz_memory_DivPlugin_div_stage_0_outNumerator[31:0];
  assign when_MulDivIterativePlugin_l151 = (memory_DivPlugin_div_counter_value == 6'h20);
  assign _zz_memory_DivPlugin_div_result = (memory_INSTRUCTION[13] ? memory_DivPlugin_accumulator[31 : 0] : memory_DivPlugin_rs1[31 : 0]);
  assign when_MulDivIterativePlugin_l162 = (! memory_arbitration_isStuck);
  assign _zz_memory_DivPlugin_rs2 = (execute_RS2[31] && execute_IS_RS2_SIGNED);
  assign _zz_memory_DivPlugin_rs1 = (1'b0 || ((execute_IS_DIV && execute_RS1[31]) && execute_IS_RS1_SIGNED));
  always @(*) begin
    _zz_memory_DivPlugin_rs1_1[32] = (execute_IS_RS1_SIGNED && execute_RS1[31]);
    _zz_memory_DivPlugin_rs1_1[31 : 0] = execute_RS1;
  end

  assign execute_FullBarrelShifterPlugin_amplitude = execute_SRC2[4 : 0];
  always @(*) begin
    _zz_execute_FullBarrelShifterPlugin_reversed[0] = execute_SRC1[31];
    _zz_execute_FullBarrelShifterPlugin_reversed[1] = execute_SRC1[30];
    _zz_execute_FullBarrelShifterPlugin_reversed[2] = execute_SRC1[29];
    _zz_execute_FullBarrelShifterPlugin_reversed[3] = execute_SRC1[28];
    _zz_execute_FullBarrelShifterPlugin_reversed[4] = execute_SRC1[27];
    _zz_execute_FullBarrelShifterPlugin_reversed[5] = execute_SRC1[26];
    _zz_execute_FullBarrelShifterPlugin_reversed[6] = execute_SRC1[25];
    _zz_execute_FullBarrelShifterPlugin_reversed[7] = execute_SRC1[24];
    _zz_execute_FullBarrelShifterPlugin_reversed[8] = execute_SRC1[23];
    _zz_execute_FullBarrelShifterPlugin_reversed[9] = execute_SRC1[22];
    _zz_execute_FullBarrelShifterPlugin_reversed[10] = execute_SRC1[21];
    _zz_execute_FullBarrelShifterPlugin_reversed[11] = execute_SRC1[20];
    _zz_execute_FullBarrelShifterPlugin_reversed[12] = execute_SRC1[19];
    _zz_execute_FullBarrelShifterPlugin_reversed[13] = execute_SRC1[18];
    _zz_execute_FullBarrelShifterPlugin_reversed[14] = execute_SRC1[17];
    _zz_execute_FullBarrelShifterPlugin_reversed[15] = execute_SRC1[16];
    _zz_execute_FullBarrelShifterPlugin_reversed[16] = execute_SRC1[15];
    _zz_execute_FullBarrelShifterPlugin_reversed[17] = execute_SRC1[14];
    _zz_execute_FullBarrelShifterPlugin_reversed[18] = execute_SRC1[13];
    _zz_execute_FullBarrelShifterPlugin_reversed[19] = execute_SRC1[12];
    _zz_execute_FullBarrelShifterPlugin_reversed[20] = execute_SRC1[11];
    _zz_execute_FullBarrelShifterPlugin_reversed[21] = execute_SRC1[10];
    _zz_execute_FullBarrelShifterPlugin_reversed[22] = execute_SRC1[9];
    _zz_execute_FullBarrelShifterPlugin_reversed[23] = execute_SRC1[8];
    _zz_execute_FullBarrelShifterPlugin_reversed[24] = execute_SRC1[7];
    _zz_execute_FullBarrelShifterPlugin_reversed[25] = execute_SRC1[6];
    _zz_execute_FullBarrelShifterPlugin_reversed[26] = execute_SRC1[5];
    _zz_execute_FullBarrelShifterPlugin_reversed[27] = execute_SRC1[4];
    _zz_execute_FullBarrelShifterPlugin_reversed[28] = execute_SRC1[3];
    _zz_execute_FullBarrelShifterPlugin_reversed[29] = execute_SRC1[2];
    _zz_execute_FullBarrelShifterPlugin_reversed[30] = execute_SRC1[1];
    _zz_execute_FullBarrelShifterPlugin_reversed[31] = execute_SRC1[0];
  end

  assign execute_FullBarrelShifterPlugin_reversed = ((execute_SHIFT_CTRL == `ShiftCtrlEnum_binary_sequential_SLL_1) ? _zz_execute_FullBarrelShifterPlugin_reversed : execute_SRC1);
  always @(*) begin
    _zz_decode_RS2_3[0] = memory_SHIFT_RIGHT[31];
    _zz_decode_RS2_3[1] = memory_SHIFT_RIGHT[30];
    _zz_decode_RS2_3[2] = memory_SHIFT_RIGHT[29];
    _zz_decode_RS2_3[3] = memory_SHIFT_RIGHT[28];
    _zz_decode_RS2_3[4] = memory_SHIFT_RIGHT[27];
    _zz_decode_RS2_3[5] = memory_SHIFT_RIGHT[26];
    _zz_decode_RS2_3[6] = memory_SHIFT_RIGHT[25];
    _zz_decode_RS2_3[7] = memory_SHIFT_RIGHT[24];
    _zz_decode_RS2_3[8] = memory_SHIFT_RIGHT[23];
    _zz_decode_RS2_3[9] = memory_SHIFT_RIGHT[22];
    _zz_decode_RS2_3[10] = memory_SHIFT_RIGHT[21];
    _zz_decode_RS2_3[11] = memory_SHIFT_RIGHT[20];
    _zz_decode_RS2_3[12] = memory_SHIFT_RIGHT[19];
    _zz_decode_RS2_3[13] = memory_SHIFT_RIGHT[18];
    _zz_decode_RS2_3[14] = memory_SHIFT_RIGHT[17];
    _zz_decode_RS2_3[15] = memory_SHIFT_RIGHT[16];
    _zz_decode_RS2_3[16] = memory_SHIFT_RIGHT[15];
    _zz_decode_RS2_3[17] = memory_SHIFT_RIGHT[14];
    _zz_decode_RS2_3[18] = memory_SHIFT_RIGHT[13];
    _zz_decode_RS2_3[19] = memory_SHIFT_RIGHT[12];
    _zz_decode_RS2_3[20] = memory_SHIFT_RIGHT[11];
    _zz_decode_RS2_3[21] = memory_SHIFT_RIGHT[10];
    _zz_decode_RS2_3[22] = memory_SHIFT_RIGHT[9];
    _zz_decode_RS2_3[23] = memory_SHIFT_RIGHT[8];
    _zz_decode_RS2_3[24] = memory_SHIFT_RIGHT[7];
    _zz_decode_RS2_3[25] = memory_SHIFT_RIGHT[6];
    _zz_decode_RS2_3[26] = memory_SHIFT_RIGHT[5];
    _zz_decode_RS2_3[27] = memory_SHIFT_RIGHT[4];
    _zz_decode_RS2_3[28] = memory_SHIFT_RIGHT[3];
    _zz_decode_RS2_3[29] = memory_SHIFT_RIGHT[2];
    _zz_decode_RS2_3[30] = memory_SHIFT_RIGHT[1];
    _zz_decode_RS2_3[31] = memory_SHIFT_RIGHT[0];
  end

  always @(*) begin
    HazardSimplePlugin_src0Hazard = 1'b0;
    if(when_HazardSimplePlugin_l57) begin
      if(when_HazardSimplePlugin_l58) begin
        if(when_HazardSimplePlugin_l48) begin
          HazardSimplePlugin_src0Hazard = 1'b1;
        end
      end
    end
    if(when_HazardSimplePlugin_l57_1) begin
      if(when_HazardSimplePlugin_l58_1) begin
        if(when_HazardSimplePlugin_l48_1) begin
          HazardSimplePlugin_src0Hazard = 1'b1;
        end
      end
    end
    if(when_HazardSimplePlugin_l57_2) begin
      if(when_HazardSimplePlugin_l58_2) begin
        if(when_HazardSimplePlugin_l48_2) begin
          HazardSimplePlugin_src0Hazard = 1'b1;
        end
      end
    end
    if(when_HazardSimplePlugin_l105) begin
      HazardSimplePlugin_src0Hazard = 1'b0;
    end
  end

  always @(*) begin
    HazardSimplePlugin_src1Hazard = 1'b0;
    if(when_HazardSimplePlugin_l57) begin
      if(when_HazardSimplePlugin_l58) begin
        if(when_HazardSimplePlugin_l51) begin
          HazardSimplePlugin_src1Hazard = 1'b1;
        end
      end
    end
    if(when_HazardSimplePlugin_l57_1) begin
      if(when_HazardSimplePlugin_l58_1) begin
        if(when_HazardSimplePlugin_l51_1) begin
          HazardSimplePlugin_src1Hazard = 1'b1;
        end
      end
    end
    if(when_HazardSimplePlugin_l57_2) begin
      if(when_HazardSimplePlugin_l58_2) begin
        if(when_HazardSimplePlugin_l51_2) begin
          HazardSimplePlugin_src1Hazard = 1'b1;
        end
      end
    end
    if(when_HazardSimplePlugin_l108) begin
      HazardSimplePlugin_src1Hazard = 1'b0;
    end
  end

  assign HazardSimplePlugin_writeBackWrites_valid = (_zz_lastStageRegFileWrite_valid && writeBack_arbitration_isFiring);
  assign HazardSimplePlugin_writeBackWrites_payload_address = _zz_lastStageRegFileWrite_payload_address[11 : 7];
  assign HazardSimplePlugin_writeBackWrites_payload_data = _zz_decode_RS2_2;
  assign HazardSimplePlugin_addr0Match = (HazardSimplePlugin_writeBackBuffer_payload_address == decode_INSTRUCTION[19 : 15]);
  assign HazardSimplePlugin_addr1Match = (HazardSimplePlugin_writeBackBuffer_payload_address == decode_INSTRUCTION[24 : 20]);
  assign when_HazardSimplePlugin_l47 = 1'b1;
  assign when_HazardSimplePlugin_l48 = (writeBack_INSTRUCTION[11 : 7] == decode_INSTRUCTION[19 : 15]);
  assign when_HazardSimplePlugin_l51 = (writeBack_INSTRUCTION[11 : 7] == decode_INSTRUCTION[24 : 20]);
  assign when_HazardSimplePlugin_l45 = (writeBack_arbitration_isValid && writeBack_REGFILE_WRITE_VALID);
  assign when_HazardSimplePlugin_l57 = (writeBack_arbitration_isValid && writeBack_REGFILE_WRITE_VALID);
  assign when_HazardSimplePlugin_l58 = (1'b0 || (! when_HazardSimplePlugin_l47));
  assign when_HazardSimplePlugin_l48_1 = (memory_INSTRUCTION[11 : 7] == decode_INSTRUCTION[19 : 15]);
  assign when_HazardSimplePlugin_l51_1 = (memory_INSTRUCTION[11 : 7] == decode_INSTRUCTION[24 : 20]);
  assign when_HazardSimplePlugin_l45_1 = (memory_arbitration_isValid && memory_REGFILE_WRITE_VALID);
  assign when_HazardSimplePlugin_l57_1 = (memory_arbitration_isValid && memory_REGFILE_WRITE_VALID);
  assign when_HazardSimplePlugin_l58_1 = (1'b0 || (! memory_BYPASSABLE_MEMORY_STAGE));
  assign when_HazardSimplePlugin_l48_2 = (execute_INSTRUCTION[11 : 7] == decode_INSTRUCTION[19 : 15]);
  assign when_HazardSimplePlugin_l51_2 = (execute_INSTRUCTION[11 : 7] == decode_INSTRUCTION[24 : 20]);
  assign when_HazardSimplePlugin_l45_2 = (execute_arbitration_isValid && execute_REGFILE_WRITE_VALID);
  assign when_HazardSimplePlugin_l57_2 = (execute_arbitration_isValid && execute_REGFILE_WRITE_VALID);
  assign when_HazardSimplePlugin_l58_2 = (1'b0 || (! execute_BYPASSABLE_EXECUTE_STAGE));
  assign when_HazardSimplePlugin_l105 = (! decode_RS1_USE);
  assign when_HazardSimplePlugin_l108 = (! decode_RS2_USE);
  assign when_HazardSimplePlugin_l113 = (decode_arbitration_isValid && (HazardSimplePlugin_src0Hazard || HazardSimplePlugin_src1Hazard));
  assign execute_BranchPlugin_eq = (execute_SRC1 == execute_SRC2);
  assign switch_Misc_l200_4 = execute_INSTRUCTION[14 : 12];
  always @(*) begin
    casez(switch_Misc_l200_4)
      3'b000 : begin
        _zz_execute_BRANCH_DO = execute_BranchPlugin_eq;
      end
      3'b001 : begin
        _zz_execute_BRANCH_DO = (! execute_BranchPlugin_eq);
      end
      3'b1?1 : begin
        _zz_execute_BRANCH_DO = (! execute_SRC_LESS);
      end
      default : begin
        _zz_execute_BRANCH_DO = execute_SRC_LESS;
      end
    endcase
  end

  always @(*) begin
    case(execute_BRANCH_CTRL)
      `BranchCtrlEnum_binary_sequential_INC : begin
        _zz_execute_BRANCH_DO_1 = 1'b0;
      end
      `BranchCtrlEnum_binary_sequential_JAL : begin
        _zz_execute_BRANCH_DO_1 = 1'b1;
      end
      `BranchCtrlEnum_binary_sequential_JALR : begin
        _zz_execute_BRANCH_DO_1 = 1'b1;
      end
      default : begin
        _zz_execute_BRANCH_DO_1 = _zz_execute_BRANCH_DO;
      end
    endcase
  end

  assign execute_BranchPlugin_branch_src1 = ((execute_BRANCH_CTRL == `BranchCtrlEnum_binary_sequential_JALR) ? execute_RS1 : execute_PC);
  assign _zz_execute_BranchPlugin_branch_src2 = _zz__zz_execute_BranchPlugin_branch_src2[19];
  always @(*) begin
    _zz_execute_BranchPlugin_branch_src2_1[10] = _zz_execute_BranchPlugin_branch_src2;
    _zz_execute_BranchPlugin_branch_src2_1[9] = _zz_execute_BranchPlugin_branch_src2;
    _zz_execute_BranchPlugin_branch_src2_1[8] = _zz_execute_BranchPlugin_branch_src2;
    _zz_execute_BranchPlugin_branch_src2_1[7] = _zz_execute_BranchPlugin_branch_src2;
    _zz_execute_BranchPlugin_branch_src2_1[6] = _zz_execute_BranchPlugin_branch_src2;
    _zz_execute_BranchPlugin_branch_src2_1[5] = _zz_execute_BranchPlugin_branch_src2;
    _zz_execute_BranchPlugin_branch_src2_1[4] = _zz_execute_BranchPlugin_branch_src2;
    _zz_execute_BranchPlugin_branch_src2_1[3] = _zz_execute_BranchPlugin_branch_src2;
    _zz_execute_BranchPlugin_branch_src2_1[2] = _zz_execute_BranchPlugin_branch_src2;
    _zz_execute_BranchPlugin_branch_src2_1[1] = _zz_execute_BranchPlugin_branch_src2;
    _zz_execute_BranchPlugin_branch_src2_1[0] = _zz_execute_BranchPlugin_branch_src2;
  end

  assign _zz_execute_BranchPlugin_branch_src2_2 = execute_INSTRUCTION[31];
  always @(*) begin
    _zz_execute_BranchPlugin_branch_src2_3[19] = _zz_execute_BranchPlugin_branch_src2_2;
    _zz_execute_BranchPlugin_branch_src2_3[18] = _zz_execute_BranchPlugin_branch_src2_2;
    _zz_execute_BranchPlugin_branch_src2_3[17] = _zz_execute_BranchPlugin_branch_src2_2;
    _zz_execute_BranchPlugin_branch_src2_3[16] = _zz_execute_BranchPlugin_branch_src2_2;
    _zz_execute_BranchPlugin_branch_src2_3[15] = _zz_execute_BranchPlugin_branch_src2_2;
    _zz_execute_BranchPlugin_branch_src2_3[14] = _zz_execute_BranchPlugin_branch_src2_2;
    _zz_execute_BranchPlugin_branch_src2_3[13] = _zz_execute_BranchPlugin_branch_src2_2;
    _zz_execute_BranchPlugin_branch_src2_3[12] = _zz_execute_BranchPlugin_branch_src2_2;
    _zz_execute_BranchPlugin_branch_src2_3[11] = _zz_execute_BranchPlugin_branch_src2_2;
    _zz_execute_BranchPlugin_branch_src2_3[10] = _zz_execute_BranchPlugin_branch_src2_2;
    _zz_execute_BranchPlugin_branch_src2_3[9] = _zz_execute_BranchPlugin_branch_src2_2;
    _zz_execute_BranchPlugin_branch_src2_3[8] = _zz_execute_BranchPlugin_branch_src2_2;
    _zz_execute_BranchPlugin_branch_src2_3[7] = _zz_execute_BranchPlugin_branch_src2_2;
    _zz_execute_BranchPlugin_branch_src2_3[6] = _zz_execute_BranchPlugin_branch_src2_2;
    _zz_execute_BranchPlugin_branch_src2_3[5] = _zz_execute_BranchPlugin_branch_src2_2;
    _zz_execute_BranchPlugin_branch_src2_3[4] = _zz_execute_BranchPlugin_branch_src2_2;
    _zz_execute_BranchPlugin_branch_src2_3[3] = _zz_execute_BranchPlugin_branch_src2_2;
    _zz_execute_BranchPlugin_branch_src2_3[2] = _zz_execute_BranchPlugin_branch_src2_2;
    _zz_execute_BranchPlugin_branch_src2_3[1] = _zz_execute_BranchPlugin_branch_src2_2;
    _zz_execute_BranchPlugin_branch_src2_3[0] = _zz_execute_BranchPlugin_branch_src2_2;
  end

  assign _zz_execute_BranchPlugin_branch_src2_4 = _zz__zz_execute_BranchPlugin_branch_src2_4[11];
  always @(*) begin
    _zz_execute_BranchPlugin_branch_src2_5[18] = _zz_execute_BranchPlugin_branch_src2_4;
    _zz_execute_BranchPlugin_branch_src2_5[17] = _zz_execute_BranchPlugin_branch_src2_4;
    _zz_execute_BranchPlugin_branch_src2_5[16] = _zz_execute_BranchPlugin_branch_src2_4;
    _zz_execute_BranchPlugin_branch_src2_5[15] = _zz_execute_BranchPlugin_branch_src2_4;
    _zz_execute_BranchPlugin_branch_src2_5[14] = _zz_execute_BranchPlugin_branch_src2_4;
    _zz_execute_BranchPlugin_branch_src2_5[13] = _zz_execute_BranchPlugin_branch_src2_4;
    _zz_execute_BranchPlugin_branch_src2_5[12] = _zz_execute_BranchPlugin_branch_src2_4;
    _zz_execute_BranchPlugin_branch_src2_5[11] = _zz_execute_BranchPlugin_branch_src2_4;
    _zz_execute_BranchPlugin_branch_src2_5[10] = _zz_execute_BranchPlugin_branch_src2_4;
    _zz_execute_BranchPlugin_branch_src2_5[9] = _zz_execute_BranchPlugin_branch_src2_4;
    _zz_execute_BranchPlugin_branch_src2_5[8] = _zz_execute_BranchPlugin_branch_src2_4;
    _zz_execute_BranchPlugin_branch_src2_5[7] = _zz_execute_BranchPlugin_branch_src2_4;
    _zz_execute_BranchPlugin_branch_src2_5[6] = _zz_execute_BranchPlugin_branch_src2_4;
    _zz_execute_BranchPlugin_branch_src2_5[5] = _zz_execute_BranchPlugin_branch_src2_4;
    _zz_execute_BranchPlugin_branch_src2_5[4] = _zz_execute_BranchPlugin_branch_src2_4;
    _zz_execute_BranchPlugin_branch_src2_5[3] = _zz_execute_BranchPlugin_branch_src2_4;
    _zz_execute_BranchPlugin_branch_src2_5[2] = _zz_execute_BranchPlugin_branch_src2_4;
    _zz_execute_BranchPlugin_branch_src2_5[1] = _zz_execute_BranchPlugin_branch_src2_4;
    _zz_execute_BranchPlugin_branch_src2_5[0] = _zz_execute_BranchPlugin_branch_src2_4;
  end

  always @(*) begin
    case(execute_BRANCH_CTRL)
      `BranchCtrlEnum_binary_sequential_JAL : begin
        _zz_execute_BranchPlugin_branch_src2_6 = {{_zz_execute_BranchPlugin_branch_src2_1,{{{execute_INSTRUCTION[31],execute_INSTRUCTION[19 : 12]},execute_INSTRUCTION[20]},execute_INSTRUCTION[30 : 21]}},1'b0};
      end
      `BranchCtrlEnum_binary_sequential_JALR : begin
        _zz_execute_BranchPlugin_branch_src2_6 = {_zz_execute_BranchPlugin_branch_src2_3,execute_INSTRUCTION[31 : 20]};
      end
      default : begin
        _zz_execute_BranchPlugin_branch_src2_6 = {{_zz_execute_BranchPlugin_branch_src2_5,{{{execute_INSTRUCTION[31],execute_INSTRUCTION[7]},execute_INSTRUCTION[30 : 25]},execute_INSTRUCTION[11 : 8]}},1'b0};
      end
    endcase
  end

  assign execute_BranchPlugin_branch_src2 = _zz_execute_BranchPlugin_branch_src2_6;
  assign execute_BranchPlugin_branchAdder = (execute_BranchPlugin_branch_src1 + execute_BranchPlugin_branch_src2);
  assign BranchPlugin_jumpInterface_valid = ((memory_arbitration_isValid && memory_BRANCH_DO) && (! 1'b0));
  assign BranchPlugin_jumpInterface_payload = memory_BRANCH_CALC;
  assign when_DebugPlugin_l225 = (DebugPlugin_haltIt && (! DebugPlugin_isPipBusy));
  assign DebugPlugin_allowEBreak = (DebugPlugin_debugUsed && (! DebugPlugin_disableEbreak));
  always @(*) begin
    debug_bus_cmd_ready = 1'b1;
    if(debug_bus_cmd_valid) begin
      case(switch_DebugPlugin_l256)
        6'h01 : begin
          if(debug_bus_cmd_payload_wr) begin
            debug_bus_cmd_ready = IBusSimplePlugin_injectionPort_ready;
          end
        end
        default : begin
        end
      endcase
    end
  end

  always @(*) begin
    debug_bus_rsp_data = DebugPlugin_busReadDataReg;
    if(when_DebugPlugin_l244) begin
      debug_bus_rsp_data[0] = DebugPlugin_resetIt;
      debug_bus_rsp_data[1] = DebugPlugin_haltIt;
      debug_bus_rsp_data[2] = DebugPlugin_isPipBusy;
      debug_bus_rsp_data[3] = DebugPlugin_haltedByBreak;
      debug_bus_rsp_data[4] = DebugPlugin_stepIt;
    end
  end

  assign when_DebugPlugin_l244 = (! _zz_when_DebugPlugin_l244);
  always @(*) begin
    IBusSimplePlugin_injectionPort_valid = 1'b0;
    if(debug_bus_cmd_valid) begin
      case(switch_DebugPlugin_l256)
        6'h01 : begin
          if(debug_bus_cmd_payload_wr) begin
            IBusSimplePlugin_injectionPort_valid = 1'b1;
          end
        end
        default : begin
        end
      endcase
    end
  end

  assign IBusSimplePlugin_injectionPort_payload = debug_bus_cmd_payload_data;
  assign switch_DebugPlugin_l256 = debug_bus_cmd_payload_address[7 : 2];
  assign when_DebugPlugin_l260 = debug_bus_cmd_payload_data[16];
  assign when_DebugPlugin_l260_1 = debug_bus_cmd_payload_data[24];
  assign when_DebugPlugin_l261 = debug_bus_cmd_payload_data[17];
  assign when_DebugPlugin_l261_1 = debug_bus_cmd_payload_data[25];
  assign when_DebugPlugin_l262 = debug_bus_cmd_payload_data[25];
  assign when_DebugPlugin_l263 = debug_bus_cmd_payload_data[25];
  assign when_DebugPlugin_l264 = debug_bus_cmd_payload_data[18];
  assign when_DebugPlugin_l264_1 = debug_bus_cmd_payload_data[26];
  assign when_DebugPlugin_l284 = (execute_arbitration_isValid && execute_DO_EBREAK);
  assign when_DebugPlugin_l287 = (({writeBack_arbitration_isValid,memory_arbitration_isValid} != 2'b00) == 1'b0);
  assign when_DebugPlugin_l300 = (DebugPlugin_stepIt && IBusSimplePlugin_incomingInstruction);
  assign debug_resetOut = DebugPlugin_resetIt_regNext;
  assign when_DebugPlugin_l316 = (DebugPlugin_haltIt || DebugPlugin_stepIt);
  assign when_Pipeline_l124 = (! execute_arbitration_isStuck);
  assign when_Pipeline_l124_1 = (! memory_arbitration_isStuck);
  assign when_Pipeline_l124_2 = (! writeBack_arbitration_isStuck);
  assign when_Pipeline_l124_3 = (! execute_arbitration_isStuck);
  assign when_Pipeline_l124_4 = (! memory_arbitration_isStuck);
  assign when_Pipeline_l124_5 = (! writeBack_arbitration_isStuck);
  assign when_Pipeline_l124_6 = (! execute_arbitration_isStuck);
  assign when_Pipeline_l124_7 = (! memory_arbitration_isStuck);
  assign when_Pipeline_l124_8 = (! writeBack_arbitration_isStuck);
  assign when_Pipeline_l124_9 = (! execute_arbitration_isStuck);
  assign when_Pipeline_l124_10 = (! execute_arbitration_isStuck);
  assign _zz_decode_SRC1_CTRL = _zz_decode_SRC1_CTRL_1;
  assign when_Pipeline_l124_11 = (! execute_arbitration_isStuck);
  assign when_Pipeline_l124_12 = (! execute_arbitration_isStuck);
  assign when_Pipeline_l124_13 = (! memory_arbitration_isStuck);
  assign when_Pipeline_l124_14 = (! writeBack_arbitration_isStuck);
  assign _zz_decode_SRC2_CTRL = _zz_decode_SRC2_CTRL_1;
  assign when_Pipeline_l124_15 = (! execute_arbitration_isStuck);
  assign when_Pipeline_l124_16 = (! memory_arbitration_isStuck);
  assign when_Pipeline_l124_17 = (! writeBack_arbitration_isStuck);
  assign when_Pipeline_l124_18 = (! execute_arbitration_isStuck);
  assign when_Pipeline_l124_19 = (! execute_arbitration_isStuck);
  assign when_Pipeline_l124_20 = (! memory_arbitration_isStuck);
  assign when_Pipeline_l124_21 = (! execute_arbitration_isStuck);
  assign when_Pipeline_l124_22 = (! memory_arbitration_isStuck);
  assign when_Pipeline_l124_23 = (! writeBack_arbitration_isStuck);
  assign when_Pipeline_l124_24 = (! execute_arbitration_isStuck);
  assign _zz_decode_to_execute_ENV_CTRL_1 = decode_ENV_CTRL;
  assign _zz_execute_to_memory_ENV_CTRL_1 = execute_ENV_CTRL;
  assign _zz_memory_to_writeBack_ENV_CTRL_1 = memory_ENV_CTRL;
  assign _zz_decode_ENV_CTRL = _zz_decode_ENV_CTRL_1;
  assign when_Pipeline_l124_25 = (! execute_arbitration_isStuck);
  assign _zz_execute_ENV_CTRL = decode_to_execute_ENV_CTRL;
  assign when_Pipeline_l124_26 = (! memory_arbitration_isStuck);
  assign _zz_memory_ENV_CTRL = execute_to_memory_ENV_CTRL;
  assign when_Pipeline_l124_27 = (! writeBack_arbitration_isStuck);
  assign _zz_writeBack_ENV_CTRL = memory_to_writeBack_ENV_CTRL;
  assign _zz_decode_to_execute_ALU_CTRL_1 = decode_ALU_CTRL;
  assign _zz_decode_ALU_CTRL = _zz_decode_ALU_CTRL_1;
  assign when_Pipeline_l124_28 = (! execute_arbitration_isStuck);
  assign _zz_execute_ALU_CTRL = decode_to_execute_ALU_CTRL;
  assign when_Pipeline_l124_29 = (! execute_arbitration_isStuck);
  assign _zz_decode_to_execute_ALU_BITWISE_CTRL_1 = decode_ALU_BITWISE_CTRL;
  assign _zz_decode_ALU_BITWISE_CTRL = _zz_decode_ALU_BITWISE_CTRL_1;
  assign when_Pipeline_l124_30 = (! execute_arbitration_isStuck);
  assign _zz_execute_ALU_BITWISE_CTRL = decode_to_execute_ALU_BITWISE_CTRL;
  assign when_Pipeline_l124_31 = (! execute_arbitration_isStuck);
  assign when_Pipeline_l124_32 = (! memory_arbitration_isStuck);
  assign when_Pipeline_l124_33 = (! writeBack_arbitration_isStuck);
  assign when_Pipeline_l124_34 = (! execute_arbitration_isStuck);
  assign when_Pipeline_l124_35 = (! memory_arbitration_isStuck);
  assign when_Pipeline_l124_36 = (! execute_arbitration_isStuck);
  assign when_Pipeline_l124_37 = (! execute_arbitration_isStuck);
  assign _zz_decode_to_execute_SHIFT_CTRL_1 = decode_SHIFT_CTRL;
  assign _zz_execute_to_memory_SHIFT_CTRL_1 = execute_SHIFT_CTRL;
  assign _zz_decode_SHIFT_CTRL = _zz_decode_SHIFT_CTRL_1;
  assign when_Pipeline_l124_38 = (! execute_arbitration_isStuck);
  assign _zz_execute_SHIFT_CTRL = decode_to_execute_SHIFT_CTRL;
  assign when_Pipeline_l124_39 = (! memory_arbitration_isStuck);
  assign _zz_memory_SHIFT_CTRL = execute_to_memory_SHIFT_CTRL;
  assign _zz_decode_to_execute_BRANCH_CTRL_1 = decode_BRANCH_CTRL;
  assign _zz_decode_BRANCH_CTRL = _zz_decode_BRANCH_CTRL_1;
  assign when_Pipeline_l124_40 = (! execute_arbitration_isStuck);
  assign _zz_execute_BRANCH_CTRL = decode_to_execute_BRANCH_CTRL;
  assign when_Pipeline_l124_41 = (! execute_arbitration_isStuck);
  assign when_Pipeline_l124_42 = (! execute_arbitration_isStuck);
  assign when_Pipeline_l124_43 = (! execute_arbitration_isStuck);
  assign when_Pipeline_l124_44 = (! execute_arbitration_isStuck);
  assign when_Pipeline_l124_45 = (! execute_arbitration_isStuck);
  assign when_Pipeline_l124_46 = (! execute_arbitration_isStuck);
  assign when_Pipeline_l124_47 = (! memory_arbitration_isStuck);
  assign when_Pipeline_l124_48 = (! writeBack_arbitration_isStuck);
  assign when_Pipeline_l124_49 = (! memory_arbitration_isStuck);
  assign when_Pipeline_l124_50 = (! writeBack_arbitration_isStuck);
  assign when_Pipeline_l124_51 = (! memory_arbitration_isStuck);
  assign when_Pipeline_l124_52 = (! memory_arbitration_isStuck);
  assign when_Pipeline_l124_53 = (! memory_arbitration_isStuck);
  assign when_Pipeline_l124_54 = (! memory_arbitration_isStuck);
  assign when_Pipeline_l124_55 = (! writeBack_arbitration_isStuck);
  assign when_Pipeline_l124_56 = (! memory_arbitration_isStuck);
  assign when_Pipeline_l124_57 = (! memory_arbitration_isStuck);
  assign when_Pipeline_l124_58 = (! memory_arbitration_isStuck);
  assign when_Pipeline_l124_59 = (! writeBack_arbitration_isStuck);
  assign when_Pipeline_l124_60 = (! writeBack_arbitration_isStuck);
  assign decode_arbitration_isFlushed = (({writeBack_arbitration_flushNext,{memory_arbitration_flushNext,execute_arbitration_flushNext}} != 3'b000) || ({writeBack_arbitration_flushIt,{memory_arbitration_flushIt,{execute_arbitration_flushIt,decode_arbitration_flushIt}}} != 4'b0000));
  assign execute_arbitration_isFlushed = (({writeBack_arbitration_flushNext,memory_arbitration_flushNext} != 2'b00) || ({writeBack_arbitration_flushIt,{memory_arbitration_flushIt,execute_arbitration_flushIt}} != 3'b000));
  assign memory_arbitration_isFlushed = ((writeBack_arbitration_flushNext != 1'b0) || ({writeBack_arbitration_flushIt,memory_arbitration_flushIt} != 2'b00));
  assign writeBack_arbitration_isFlushed = (1'b0 || (writeBack_arbitration_flushIt != 1'b0));
  assign decode_arbitration_isStuckByOthers = (decode_arbitration_haltByOther || (((1'b0 || execute_arbitration_isStuck) || memory_arbitration_isStuck) || writeBack_arbitration_isStuck));
  assign decode_arbitration_isStuck = (decode_arbitration_haltItself || decode_arbitration_isStuckByOthers);
  assign decode_arbitration_isMoving = ((! decode_arbitration_isStuck) && (! decode_arbitration_removeIt));
  assign decode_arbitration_isFiring = ((decode_arbitration_isValid && (! decode_arbitration_isStuck)) && (! decode_arbitration_removeIt));
  assign execute_arbitration_isStuckByOthers = (execute_arbitration_haltByOther || ((1'b0 || memory_arbitration_isStuck) || writeBack_arbitration_isStuck));
  assign execute_arbitration_isStuck = (execute_arbitration_haltItself || execute_arbitration_isStuckByOthers);
  assign execute_arbitration_isMoving = ((! execute_arbitration_isStuck) && (! execute_arbitration_removeIt));
  assign execute_arbitration_isFiring = ((execute_arbitration_isValid && (! execute_arbitration_isStuck)) && (! execute_arbitration_removeIt));
  assign memory_arbitration_isStuckByOthers = (memory_arbitration_haltByOther || (1'b0 || writeBack_arbitration_isStuck));
  assign memory_arbitration_isStuck = (memory_arbitration_haltItself || memory_arbitration_isStuckByOthers);
  assign memory_arbitration_isMoving = ((! memory_arbitration_isStuck) && (! memory_arbitration_removeIt));
  assign memory_arbitration_isFiring = ((memory_arbitration_isValid && (! memory_arbitration_isStuck)) && (! memory_arbitration_removeIt));
  assign writeBack_arbitration_isStuckByOthers = (writeBack_arbitration_haltByOther || 1'b0);
  assign writeBack_arbitration_isStuck = (writeBack_arbitration_haltItself || writeBack_arbitration_isStuckByOthers);
  assign writeBack_arbitration_isMoving = ((! writeBack_arbitration_isStuck) && (! writeBack_arbitration_removeIt));
  assign writeBack_arbitration_isFiring = ((writeBack_arbitration_isValid && (! writeBack_arbitration_isStuck)) && (! writeBack_arbitration_removeIt));
  assign when_Pipeline_l151 = ((! execute_arbitration_isStuck) || execute_arbitration_removeIt);
  assign when_Pipeline_l154 = ((! decode_arbitration_isStuck) && (! decode_arbitration_removeIt));
  assign when_Pipeline_l151_1 = ((! memory_arbitration_isStuck) || memory_arbitration_removeIt);
  assign when_Pipeline_l154_1 = ((! execute_arbitration_isStuck) && (! execute_arbitration_removeIt));
  assign when_Pipeline_l151_2 = ((! writeBack_arbitration_isStuck) || writeBack_arbitration_removeIt);
  assign when_Pipeline_l154_2 = ((! memory_arbitration_isStuck) && (! memory_arbitration_removeIt));
  always @(*) begin
    IBusSimplePlugin_injectionPort_ready = 1'b0;
    case(switch_Fetcher_l362)
      3'b100 : begin
        IBusSimplePlugin_injectionPort_ready = 1'b1;
      end
      default : begin
      end
    endcase
  end

  assign when_Fetcher_l360 = (switch_Fetcher_l362 != 3'b000);
  assign when_Fetcher_l378 = (! decode_arbitration_isStuck);
  assign when_Fetcher_l398 = (switch_Fetcher_l362 != 3'b000);
  assign when_CsrPlugin_l1264 = (! execute_arbitration_isStuck);
  assign when_CsrPlugin_l1264_1 = (! execute_arbitration_isStuck);
  assign when_CsrPlugin_l1264_2 = (! execute_arbitration_isStuck);
  assign when_CsrPlugin_l1264_3 = (! execute_arbitration_isStuck);
  assign when_CsrPlugin_l1264_4 = (! execute_arbitration_isStuck);
  always @(*) begin
    _zz_CsrPlugin_csrMapping_readDataInit = 32'h0;
    if(execute_CsrPlugin_csr_768) begin
      _zz_CsrPlugin_csrMapping_readDataInit[12 : 11] = CsrPlugin_mstatus_MPP;
      _zz_CsrPlugin_csrMapping_readDataInit[7 : 7] = CsrPlugin_mstatus_MPIE;
      _zz_CsrPlugin_csrMapping_readDataInit[3 : 3] = CsrPlugin_mstatus_MIE;
    end
  end

  always @(*) begin
    _zz_CsrPlugin_csrMapping_readDataInit_1 = 32'h0;
    if(execute_CsrPlugin_csr_836) begin
      _zz_CsrPlugin_csrMapping_readDataInit_1[11 : 11] = CsrPlugin_mip_MEIP;
      _zz_CsrPlugin_csrMapping_readDataInit_1[7 : 7] = CsrPlugin_mip_MTIP;
      _zz_CsrPlugin_csrMapping_readDataInit_1[3 : 3] = CsrPlugin_mip_MSIP;
    end
  end

  always @(*) begin
    _zz_CsrPlugin_csrMapping_readDataInit_2 = 32'h0;
    if(execute_CsrPlugin_csr_772) begin
      _zz_CsrPlugin_csrMapping_readDataInit_2[11 : 11] = CsrPlugin_mie_MEIE;
      _zz_CsrPlugin_csrMapping_readDataInit_2[7 : 7] = CsrPlugin_mie_MTIE;
      _zz_CsrPlugin_csrMapping_readDataInit_2[3 : 3] = CsrPlugin_mie_MSIE;
    end
  end

  always @(*) begin
    _zz_CsrPlugin_csrMapping_readDataInit_3 = 32'h0;
    if(execute_CsrPlugin_csr_834) begin
      _zz_CsrPlugin_csrMapping_readDataInit_3[31 : 31] = CsrPlugin_mcause_interrupt;
      _zz_CsrPlugin_csrMapping_readDataInit_3[3 : 0] = CsrPlugin_mcause_exceptionCode;
    end
  end

  assign CsrPlugin_csrMapping_readDataInit = ((_zz_CsrPlugin_csrMapping_readDataInit | _zz_CsrPlugin_csrMapping_readDataInit_1) | (_zz_CsrPlugin_csrMapping_readDataInit_2 | _zz_CsrPlugin_csrMapping_readDataInit_3));
  assign when_CsrPlugin_l1297 = (CsrPlugin_privilege < execute_CsrPlugin_csrAddress[9 : 8]);
  assign when_CsrPlugin_l1302 = ((! execute_arbitration_isValid) || (! execute_IS_CSR));
  always @(posedge io_mainClk or posedge resetCtrl_systemReset) begin
    if(resetCtrl_systemReset) begin
      IBusSimplePlugin_fetchPc_pcReg <= 32'h0;
      IBusSimplePlugin_fetchPc_correctionReg <= 1'b0;
      IBusSimplePlugin_fetchPc_booted <= 1'b0;
      IBusSimplePlugin_fetchPc_inc <= 1'b0;
      IBusSimplePlugin_decodePc_pcReg <= 32'h0;
      _zz_IBusSimplePlugin_iBusRsp_stages_0_output_ready_2 <= 1'b0;
      _zz_IBusSimplePlugin_iBusRsp_stages_1_output_m2sPipe_valid <= 1'b0;
      IBusSimplePlugin_decompressor_bufferValid <= 1'b0;
      IBusSimplePlugin_decompressor_throw2BytesReg <= 1'b0;
      _zz_IBusSimplePlugin_injector_decodeInput_valid <= 1'b0;
      IBusSimplePlugin_injector_nextPcCalc_valids_0 <= 1'b0;
      IBusSimplePlugin_injector_nextPcCalc_valids_1 <= 1'b0;
      IBusSimplePlugin_injector_nextPcCalc_valids_2 <= 1'b0;
      IBusSimplePlugin_injector_nextPcCalc_valids_3 <= 1'b0;
      IBusSimplePlugin_pending_value <= 3'b000;
      IBusSimplePlugin_rspJoin_rspBuffer_discardCounter <= 3'b000;
      CsrPlugin_mtvec_mode <= 2'b00;
      CsrPlugin_mtvec_base <= 30'h00000008;
      CsrPlugin_mstatus_MIE <= 1'b0;
      CsrPlugin_mstatus_MPIE <= 1'b0;
      CsrPlugin_mstatus_MPP <= 2'b11;
      CsrPlugin_mie_MEIE <= 1'b0;
      CsrPlugin_mie_MTIE <= 1'b0;
      CsrPlugin_mie_MSIE <= 1'b0;
      CsrPlugin_interrupt_valid <= 1'b0;
      CsrPlugin_pipelineLiberator_pcValids_0 <= 1'b0;
      CsrPlugin_pipelineLiberator_pcValids_1 <= 1'b0;
      CsrPlugin_pipelineLiberator_pcValids_2 <= 1'b0;
      CsrPlugin_hadException <= 1'b0;
      execute_CsrPlugin_wfiWake <= 1'b0;
      _zz_2 <= 1'b1;
      memory_DivPlugin_div_counter_value <= 6'h0;
      HazardSimplePlugin_writeBackBuffer_valid <= 1'b0;
      execute_arbitration_isValid <= 1'b0;
      memory_arbitration_isValid <= 1'b0;
      writeBack_arbitration_isValid <= 1'b0;
      switch_Fetcher_l362 <= 3'b000;
    end else begin
      if(IBusSimplePlugin_fetchPc_correction) begin
        IBusSimplePlugin_fetchPc_correctionReg <= 1'b1;
      end
      if(IBusSimplePlugin_fetchPc_output_fire) begin
        IBusSimplePlugin_fetchPc_correctionReg <= 1'b0;
      end
      IBusSimplePlugin_fetchPc_booted <= 1'b1;
      if(when_Fetcher_l131) begin
        IBusSimplePlugin_fetchPc_inc <= 1'b0;
      end
      if(IBusSimplePlugin_fetchPc_output_fire_1) begin
        IBusSimplePlugin_fetchPc_inc <= 1'b1;
      end
      if(when_Fetcher_l131_1) begin
        IBusSimplePlugin_fetchPc_inc <= 1'b0;
      end
      if(when_Fetcher_l158) begin
        IBusSimplePlugin_fetchPc_pcReg <= IBusSimplePlugin_fetchPc_pc;
      end
      if(when_Fetcher_l180) begin
        IBusSimplePlugin_decodePc_pcReg <= IBusSimplePlugin_decodePc_pcPlus;
      end
      if(when_Fetcher_l192) begin
        IBusSimplePlugin_decodePc_pcReg <= IBusSimplePlugin_jump_pcLoad_payload;
      end
      if(IBusSimplePlugin_iBusRsp_flush) begin
        _zz_IBusSimplePlugin_iBusRsp_stages_0_output_ready_2 <= 1'b0;
      end
      if(_zz_IBusSimplePlugin_iBusRsp_stages_0_output_ready) begin
        _zz_IBusSimplePlugin_iBusRsp_stages_0_output_ready_2 <= (IBusSimplePlugin_iBusRsp_stages_0_output_valid && (! 1'b0));
      end
      if(IBusSimplePlugin_iBusRsp_flush) begin
        _zz_IBusSimplePlugin_iBusRsp_stages_1_output_m2sPipe_valid <= 1'b0;
      end
      if(IBusSimplePlugin_iBusRsp_stages_1_output_ready) begin
        _zz_IBusSimplePlugin_iBusRsp_stages_1_output_m2sPipe_valid <= (IBusSimplePlugin_iBusRsp_stages_1_output_valid && (! IBusSimplePlugin_iBusRsp_flush));
      end
      if(IBusSimplePlugin_decompressor_output_fire) begin
        IBusSimplePlugin_decompressor_throw2BytesReg <= ((((! IBusSimplePlugin_decompressor_unaligned) && IBusSimplePlugin_decompressor_isInputLowRvc) && IBusSimplePlugin_decompressor_isInputHighRvc) || (IBusSimplePlugin_decompressor_bufferValid && IBusSimplePlugin_decompressor_isInputHighRvc));
      end
      if(when_Fetcher_l283) begin
        IBusSimplePlugin_decompressor_bufferValid <= 1'b0;
      end
      if(when_Fetcher_l286) begin
        if(IBusSimplePlugin_decompressor_bufferFill) begin
          IBusSimplePlugin_decompressor_bufferValid <= 1'b1;
        end
      end
      if(when_Fetcher_l291) begin
        IBusSimplePlugin_decompressor_throw2BytesReg <= 1'b0;
        IBusSimplePlugin_decompressor_bufferValid <= 1'b0;
      end
      if(decode_arbitration_removeIt) begin
        _zz_IBusSimplePlugin_injector_decodeInput_valid <= 1'b0;
      end
      if(IBusSimplePlugin_decompressor_output_ready) begin
        _zz_IBusSimplePlugin_injector_decodeInput_valid <= (IBusSimplePlugin_decompressor_output_valid && (! IBusSimplePlugin_externalFlush));
      end
      if(when_Fetcher_l329) begin
        IBusSimplePlugin_injector_nextPcCalc_valids_0 <= 1'b1;
      end
      if(IBusSimplePlugin_decodePc_flushed) begin
        IBusSimplePlugin_injector_nextPcCalc_valids_0 <= 1'b0;
      end
      if(when_Fetcher_l329_1) begin
        IBusSimplePlugin_injector_nextPcCalc_valids_1 <= IBusSimplePlugin_injector_nextPcCalc_valids_0;
      end
      if(IBusSimplePlugin_decodePc_flushed) begin
        IBusSimplePlugin_injector_nextPcCalc_valids_1 <= 1'b0;
      end
      if(when_Fetcher_l329_2) begin
        IBusSimplePlugin_injector_nextPcCalc_valids_2 <= IBusSimplePlugin_injector_nextPcCalc_valids_1;
      end
      if(IBusSimplePlugin_decodePc_flushed) begin
        IBusSimplePlugin_injector_nextPcCalc_valids_2 <= 1'b0;
      end
      if(when_Fetcher_l329_3) begin
        IBusSimplePlugin_injector_nextPcCalc_valids_3 <= IBusSimplePlugin_injector_nextPcCalc_valids_2;
      end
      if(IBusSimplePlugin_decodePc_flushed) begin
        IBusSimplePlugin_injector_nextPcCalc_valids_3 <= 1'b0;
      end
      IBusSimplePlugin_pending_value <= IBusSimplePlugin_pending_next;
      IBusSimplePlugin_rspJoin_rspBuffer_discardCounter <= (IBusSimplePlugin_rspJoin_rspBuffer_discardCounter - _zz_IBusSimplePlugin_rspJoin_rspBuffer_discardCounter);
      if(IBusSimplePlugin_iBusRsp_flush) begin
        IBusSimplePlugin_rspJoin_rspBuffer_discardCounter <= IBusSimplePlugin_pending_next;
      end
      `ifndef SYNTHESIS
        `ifdef FORMAL
          assert((! (((dBus_rsp_ready && memory_MEMORY_ENABLE) && memory_arbitration_isValid) && memory_arbitration_isStuck)));
        `else
          if(!(! (((dBus_rsp_ready && memory_MEMORY_ENABLE) && memory_arbitration_isValid) && memory_arbitration_isStuck))) begin
            $display("FAILURE DBusSimplePlugin doesn't allow memory stage stall when read happend");
            $finish;
          end
        `endif
      `endif
      `ifndef SYNTHESIS
        `ifdef FORMAL
          assert((! (((writeBack_arbitration_isValid && writeBack_MEMORY_ENABLE) && (! writeBack_MEMORY_STORE)) && writeBack_arbitration_isStuck)));
        `else
          if(!(! (((writeBack_arbitration_isValid && writeBack_MEMORY_ENABLE) && (! writeBack_MEMORY_STORE)) && writeBack_arbitration_isStuck))) begin
            $display("FAILURE DBusSimplePlugin doesn't allow writeback stage stall when read happend");
            $finish;
          end
        `endif
      `endif
      CsrPlugin_interrupt_valid <= 1'b0;
      if(when_CsrPlugin_l946) begin
        if(when_CsrPlugin_l952) begin
          CsrPlugin_interrupt_valid <= 1'b1;
        end
        if(when_CsrPlugin_l952_1) begin
          CsrPlugin_interrupt_valid <= 1'b1;
        end
        if(when_CsrPlugin_l952_2) begin
          CsrPlugin_interrupt_valid <= 1'b1;
        end
      end
      if(CsrPlugin_pipelineLiberator_active) begin
        if(when_CsrPlugin_l980) begin
          CsrPlugin_pipelineLiberator_pcValids_0 <= 1'b1;
        end
        if(when_CsrPlugin_l980_1) begin
          CsrPlugin_pipelineLiberator_pcValids_1 <= CsrPlugin_pipelineLiberator_pcValids_0;
        end
        if(when_CsrPlugin_l980_2) begin
          CsrPlugin_pipelineLiberator_pcValids_2 <= CsrPlugin_pipelineLiberator_pcValids_1;
        end
      end
      if(when_CsrPlugin_l985) begin
        CsrPlugin_pipelineLiberator_pcValids_0 <= 1'b0;
        CsrPlugin_pipelineLiberator_pcValids_1 <= 1'b0;
        CsrPlugin_pipelineLiberator_pcValids_2 <= 1'b0;
      end
      if(CsrPlugin_interruptJump) begin
        CsrPlugin_interrupt_valid <= 1'b0;
      end
      CsrPlugin_hadException <= CsrPlugin_exception;
      if(when_CsrPlugin_l1019) begin
        case(CsrPlugin_targetPrivilege)
          2'b11 : begin
            CsrPlugin_mstatus_MIE <= 1'b0;
            CsrPlugin_mstatus_MPIE <= CsrPlugin_mstatus_MIE;
            CsrPlugin_mstatus_MPP <= CsrPlugin_privilege;
          end
          default : begin
          end
        endcase
      end
      if(when_CsrPlugin_l1064) begin
        case(switch_CsrPlugin_l1068)
          2'b11 : begin
            CsrPlugin_mstatus_MPP <= 2'b00;
            CsrPlugin_mstatus_MIE <= CsrPlugin_mstatus_MPIE;
            CsrPlugin_mstatus_MPIE <= 1'b1;
          end
          default : begin
          end
        endcase
      end
      execute_CsrPlugin_wfiWake <= (({_zz_when_CsrPlugin_l952_2,{_zz_when_CsrPlugin_l952_1,_zz_when_CsrPlugin_l952}} != 3'b000) || CsrPlugin_thirdPartyWake);
      _zz_2 <= 1'b0;
      memory_DivPlugin_div_counter_value <= memory_DivPlugin_div_counter_valueNext;
      HazardSimplePlugin_writeBackBuffer_valid <= HazardSimplePlugin_writeBackWrites_valid;
      if(when_Pipeline_l151) begin
        execute_arbitration_isValid <= 1'b0;
      end
      if(when_Pipeline_l154) begin
        execute_arbitration_isValid <= decode_arbitration_isValid;
      end
      if(when_Pipeline_l151_1) begin
        memory_arbitration_isValid <= 1'b0;
      end
      if(when_Pipeline_l154_1) begin
        memory_arbitration_isValid <= execute_arbitration_isValid;
      end
      if(when_Pipeline_l151_2) begin
        writeBack_arbitration_isValid <= 1'b0;
      end
      if(when_Pipeline_l154_2) begin
        writeBack_arbitration_isValid <= memory_arbitration_isValid;
      end
      case(switch_Fetcher_l362)
        3'b000 : begin
          if(IBusSimplePlugin_injectionPort_valid) begin
            switch_Fetcher_l362 <= 3'b001;
          end
        end
        3'b001 : begin
          switch_Fetcher_l362 <= 3'b010;
        end
        3'b010 : begin
          switch_Fetcher_l362 <= 3'b011;
        end
        3'b011 : begin
          if(when_Fetcher_l378) begin
            switch_Fetcher_l362 <= 3'b100;
          end
        end
        3'b100 : begin
          switch_Fetcher_l362 <= 3'b000;
        end
        default : begin
        end
      endcase
      if(execute_CsrPlugin_csr_768) begin
        if(execute_CsrPlugin_writeEnable) begin
          CsrPlugin_mstatus_MPP <= CsrPlugin_csrMapping_writeDataSignal[12 : 11];
          CsrPlugin_mstatus_MPIE <= CsrPlugin_csrMapping_writeDataSignal[7];
          CsrPlugin_mstatus_MIE <= CsrPlugin_csrMapping_writeDataSignal[3];
        end
      end
      if(execute_CsrPlugin_csr_772) begin
        if(execute_CsrPlugin_writeEnable) begin
          CsrPlugin_mie_MEIE <= CsrPlugin_csrMapping_writeDataSignal[11];
          CsrPlugin_mie_MTIE <= CsrPlugin_csrMapping_writeDataSignal[7];
          CsrPlugin_mie_MSIE <= CsrPlugin_csrMapping_writeDataSignal[3];
        end
      end
      if(execute_CsrPlugin_csr_773) begin
        if(execute_CsrPlugin_writeEnable) begin
          CsrPlugin_mtvec_base <= CsrPlugin_csrMapping_writeDataSignal[31 : 2];
          CsrPlugin_mtvec_mode <= CsrPlugin_csrMapping_writeDataSignal[1 : 0];
        end
      end
    end
  end

  always @(posedge io_mainClk) begin
    if(IBusSimplePlugin_iBusRsp_stages_1_output_ready) begin
      _zz_IBusSimplePlugin_iBusRsp_stages_1_output_m2sPipe_payload <= IBusSimplePlugin_iBusRsp_stages_1_output_payload;
    end
    if(IBusSimplePlugin_decompressor_input_valid) begin
      IBusSimplePlugin_decompressor_bufferValidLatch <= IBusSimplePlugin_decompressor_bufferValid;
    end
    if(IBusSimplePlugin_decompressor_input_valid) begin
      IBusSimplePlugin_decompressor_throw2BytesLatch <= IBusSimplePlugin_decompressor_throw2Bytes;
    end
    if(when_Fetcher_l286) begin
      IBusSimplePlugin_decompressor_bufferData <= IBusSimplePlugin_decompressor_input_payload_rsp_inst[31 : 16];
    end
    if(IBusSimplePlugin_decompressor_output_ready) begin
      _zz_IBusSimplePlugin_injector_decodeInput_payload_pc <= IBusSimplePlugin_decompressor_output_payload_pc;
      _zz_IBusSimplePlugin_injector_decodeInput_payload_rsp_error <= IBusSimplePlugin_decompressor_output_payload_rsp_error;
      _zz_IBusSimplePlugin_injector_decodeInput_payload_rsp_inst <= IBusSimplePlugin_decompressor_output_payload_rsp_inst;
      _zz_IBusSimplePlugin_injector_decodeInput_payload_isRvc <= IBusSimplePlugin_decompressor_output_payload_isRvc;
    end
    if(IBusSimplePlugin_injector_decodeInput_ready) begin
      IBusSimplePlugin_injector_formal_rawInDecode <= IBusSimplePlugin_decompressor_raw;
    end
    CsrPlugin_mip_MEIP <= externalInterrupt;
    CsrPlugin_mip_MTIP <= timerInterrupt;
    CsrPlugin_mip_MSIP <= softwareInterrupt;
    CsrPlugin_mcycle <= (CsrPlugin_mcycle + 64'h0000000000000001);
    if(writeBack_arbitration_isFiring) begin
      CsrPlugin_minstret <= (CsrPlugin_minstret + 64'h0000000000000001);
    end
    if(when_CsrPlugin_l946) begin
      if(when_CsrPlugin_l952) begin
        CsrPlugin_interrupt_code <= 4'b0111;
        CsrPlugin_interrupt_targetPrivilege <= 2'b11;
      end
      if(when_CsrPlugin_l952_1) begin
        CsrPlugin_interrupt_code <= 4'b0011;
        CsrPlugin_interrupt_targetPrivilege <= 2'b11;
      end
      if(when_CsrPlugin_l952_2) begin
        CsrPlugin_interrupt_code <= 4'b1011;
        CsrPlugin_interrupt_targetPrivilege <= 2'b11;
      end
    end
    if(when_CsrPlugin_l1019) begin
      case(CsrPlugin_targetPrivilege)
        2'b11 : begin
          CsrPlugin_mcause_interrupt <= (! CsrPlugin_hadException);
          CsrPlugin_mcause_exceptionCode <= CsrPlugin_trapCause;
          CsrPlugin_mepc <= decode_PC;
        end
        default : begin
        end
      endcase
    end
    if(when_MulDivIterativePlugin_l126) begin
      memory_DivPlugin_div_done <= 1'b1;
    end
    if(when_MulDivIterativePlugin_l126_1) begin
      memory_DivPlugin_div_done <= 1'b0;
    end
    if(when_MulDivIterativePlugin_l128) begin
      if(when_MulDivIterativePlugin_l132) begin
        memory_DivPlugin_rs1[31 : 0] <= memory_DivPlugin_div_stage_0_outNumerator;
        memory_DivPlugin_accumulator[31 : 0] <= memory_DivPlugin_div_stage_0_outRemainder;
        if(when_MulDivIterativePlugin_l151) begin
          memory_DivPlugin_div_result <= _zz_memory_DivPlugin_div_result_1[31:0];
        end
      end
    end
    if(when_MulDivIterativePlugin_l162) begin
      memory_DivPlugin_accumulator <= 65'h0;
      memory_DivPlugin_rs1 <= ((_zz_memory_DivPlugin_rs1 ? (~ _zz_memory_DivPlugin_rs1_1) : _zz_memory_DivPlugin_rs1_1) + _zz_memory_DivPlugin_rs1_2);
      memory_DivPlugin_rs2 <= ((_zz_memory_DivPlugin_rs2 ? (~ execute_RS2) : execute_RS2) + _zz_memory_DivPlugin_rs2_1);
      memory_DivPlugin_div_needRevert <= ((_zz_memory_DivPlugin_rs1 ^ (_zz_memory_DivPlugin_rs2 && (! execute_INSTRUCTION[13]))) && (! (((execute_RS2 == 32'h0) && execute_IS_RS2_SIGNED) && (! execute_INSTRUCTION[13]))));
    end
    HazardSimplePlugin_writeBackBuffer_payload_address <= HazardSimplePlugin_writeBackWrites_payload_address;
    HazardSimplePlugin_writeBackBuffer_payload_data <= HazardSimplePlugin_writeBackWrites_payload_data;
    if(when_Pipeline_l124) begin
      decode_to_execute_PC <= _zz_decode_SRC2;
    end
    if(when_Pipeline_l124_1) begin
      execute_to_memory_PC <= execute_PC;
    end
    if(when_Pipeline_l124_2) begin
      memory_to_writeBack_PC <= memory_PC;
    end
    if(when_Pipeline_l124_3) begin
      decode_to_execute_INSTRUCTION <= decode_INSTRUCTION;
    end
    if(when_Pipeline_l124_4) begin
      execute_to_memory_INSTRUCTION <= execute_INSTRUCTION;
    end
    if(when_Pipeline_l124_5) begin
      memory_to_writeBack_INSTRUCTION <= memory_INSTRUCTION;
    end
    if(when_Pipeline_l124_6) begin
      decode_to_execute_FORMAL_PC_NEXT <= decode_FORMAL_PC_NEXT;
    end
    if(when_Pipeline_l124_7) begin
      execute_to_memory_FORMAL_PC_NEXT <= execute_FORMAL_PC_NEXT;
    end
    if(when_Pipeline_l124_8) begin
      memory_to_writeBack_FORMAL_PC_NEXT <= _zz_memory_to_writeBack_FORMAL_PC_NEXT;
    end
    if(when_Pipeline_l124_9) begin
      decode_to_execute_CSR_WRITE_OPCODE <= decode_CSR_WRITE_OPCODE;
    end
    if(when_Pipeline_l124_10) begin
      decode_to_execute_CSR_READ_OPCODE <= decode_CSR_READ_OPCODE;
    end
    if(when_Pipeline_l124_11) begin
      decode_to_execute_SRC_USE_SUB_LESS <= decode_SRC_USE_SUB_LESS;
    end
    if(when_Pipeline_l124_12) begin
      decode_to_execute_MEMORY_ENABLE <= decode_MEMORY_ENABLE;
    end
    if(when_Pipeline_l124_13) begin
      execute_to_memory_MEMORY_ENABLE <= execute_MEMORY_ENABLE;
    end
    if(when_Pipeline_l124_14) begin
      memory_to_writeBack_MEMORY_ENABLE <= memory_MEMORY_ENABLE;
    end
    if(when_Pipeline_l124_15) begin
      decode_to_execute_REGFILE_WRITE_VALID <= decode_REGFILE_WRITE_VALID;
    end
    if(when_Pipeline_l124_16) begin
      execute_to_memory_REGFILE_WRITE_VALID <= execute_REGFILE_WRITE_VALID;
    end
    if(when_Pipeline_l124_17) begin
      memory_to_writeBack_REGFILE_WRITE_VALID <= memory_REGFILE_WRITE_VALID;
    end
    if(when_Pipeline_l124_18) begin
      decode_to_execute_BYPASSABLE_EXECUTE_STAGE <= decode_BYPASSABLE_EXECUTE_STAGE;
    end
    if(when_Pipeline_l124_19) begin
      decode_to_execute_BYPASSABLE_MEMORY_STAGE <= decode_BYPASSABLE_MEMORY_STAGE;
    end
    if(when_Pipeline_l124_20) begin
      execute_to_memory_BYPASSABLE_MEMORY_STAGE <= execute_BYPASSABLE_MEMORY_STAGE;
    end
    if(when_Pipeline_l124_21) begin
      decode_to_execute_MEMORY_STORE <= decode_MEMORY_STORE;
    end
    if(when_Pipeline_l124_22) begin
      execute_to_memory_MEMORY_STORE <= execute_MEMORY_STORE;
    end
    if(when_Pipeline_l124_23) begin
      memory_to_writeBack_MEMORY_STORE <= memory_MEMORY_STORE;
    end
    if(when_Pipeline_l124_24) begin
      decode_to_execute_IS_CSR <= decode_IS_CSR;
    end
    if(when_Pipeline_l124_25) begin
      decode_to_execute_ENV_CTRL <= _zz_decode_to_execute_ENV_CTRL;
    end
    if(when_Pipeline_l124_26) begin
      execute_to_memory_ENV_CTRL <= _zz_execute_to_memory_ENV_CTRL;
    end
    if(when_Pipeline_l124_27) begin
      memory_to_writeBack_ENV_CTRL <= _zz_memory_to_writeBack_ENV_CTRL;
    end
    if(when_Pipeline_l124_28) begin
      decode_to_execute_ALU_CTRL <= _zz_decode_to_execute_ALU_CTRL;
    end
    if(when_Pipeline_l124_29) begin
      decode_to_execute_SRC_LESS_UNSIGNED <= decode_SRC_LESS_UNSIGNED;
    end
    if(when_Pipeline_l124_30) begin
      decode_to_execute_ALU_BITWISE_CTRL <= _zz_decode_to_execute_ALU_BITWISE_CTRL;
    end
    if(when_Pipeline_l124_31) begin
      decode_to_execute_IS_MUL <= decode_IS_MUL;
    end
    if(when_Pipeline_l124_32) begin
      execute_to_memory_IS_MUL <= execute_IS_MUL;
    end
    if(when_Pipeline_l124_33) begin
      memory_to_writeBack_IS_MUL <= memory_IS_MUL;
    end
    if(when_Pipeline_l124_34) begin
      decode_to_execute_IS_DIV <= decode_IS_DIV;
    end
    if(when_Pipeline_l124_35) begin
      execute_to_memory_IS_DIV <= execute_IS_DIV;
    end
    if(when_Pipeline_l124_36) begin
      decode_to_execute_IS_RS1_SIGNED <= decode_IS_RS1_SIGNED;
    end
    if(when_Pipeline_l124_37) begin
      decode_to_execute_IS_RS2_SIGNED <= decode_IS_RS2_SIGNED;
    end
    if(when_Pipeline_l124_38) begin
      decode_to_execute_SHIFT_CTRL <= _zz_decode_to_execute_SHIFT_CTRL;
    end
    if(when_Pipeline_l124_39) begin
      execute_to_memory_SHIFT_CTRL <= _zz_execute_to_memory_SHIFT_CTRL;
    end
    if(when_Pipeline_l124_40) begin
      decode_to_execute_BRANCH_CTRL <= _zz_decode_to_execute_BRANCH_CTRL;
    end
    if(when_Pipeline_l124_41) begin
      decode_to_execute_RS1 <= _zz_decode_SRC1;
    end
    if(when_Pipeline_l124_42) begin
      decode_to_execute_RS2 <= _zz_decode_SRC2_1;
    end
    if(when_Pipeline_l124_43) begin
      decode_to_execute_SRC2_FORCE_ZERO <= decode_SRC2_FORCE_ZERO;
    end
    if(when_Pipeline_l124_44) begin
      decode_to_execute_SRC1 <= decode_SRC1;
    end
    if(when_Pipeline_l124_45) begin
      decode_to_execute_SRC2 <= decode_SRC2;
    end
    if(when_Pipeline_l124_46) begin
      decode_to_execute_DO_EBREAK <= decode_DO_EBREAK;
    end
    if(when_Pipeline_l124_47) begin
      execute_to_memory_MEMORY_ADDRESS_LOW <= execute_MEMORY_ADDRESS_LOW;
    end
    if(when_Pipeline_l124_48) begin
      memory_to_writeBack_MEMORY_ADDRESS_LOW <= memory_MEMORY_ADDRESS_LOW;
    end
    if(when_Pipeline_l124_49) begin
      execute_to_memory_REGFILE_WRITE_DATA <= _zz_decode_RS2_1;
    end
    if(when_Pipeline_l124_50) begin
      memory_to_writeBack_REGFILE_WRITE_DATA <= _zz_decode_RS2;
    end
    if(when_Pipeline_l124_51) begin
      execute_to_memory_MUL_LL <= execute_MUL_LL;
    end
    if(when_Pipeline_l124_52) begin
      execute_to_memory_MUL_LH <= execute_MUL_LH;
    end
    if(when_Pipeline_l124_53) begin
      execute_to_memory_MUL_HL <= execute_MUL_HL;
    end
    if(when_Pipeline_l124_54) begin
      execute_to_memory_MUL_HH <= execute_MUL_HH;
    end
    if(when_Pipeline_l124_55) begin
      memory_to_writeBack_MUL_HH <= memory_MUL_HH;
    end
    if(when_Pipeline_l124_56) begin
      execute_to_memory_SHIFT_RIGHT <= execute_SHIFT_RIGHT;
    end
    if(when_Pipeline_l124_57) begin
      execute_to_memory_BRANCH_DO <= execute_BRANCH_DO;
    end
    if(when_Pipeline_l124_58) begin
      execute_to_memory_BRANCH_CALC <= execute_BRANCH_CALC;
    end
    if(when_Pipeline_l124_59) begin
      memory_to_writeBack_MEMORY_READ_DATA <= memory_MEMORY_READ_DATA;
    end
    if(when_Pipeline_l124_60) begin
      memory_to_writeBack_MUL_LOW <= memory_MUL_LOW;
    end
    if(when_Fetcher_l398) begin
      _zz_IBusSimplePlugin_injector_decodeInput_payload_rsp_inst <= IBusSimplePlugin_injectionPort_payload;
    end
    if(when_CsrPlugin_l1264) begin
      execute_CsrPlugin_csr_768 <= (decode_INSTRUCTION[31 : 20] == 12'h300);
    end
    if(when_CsrPlugin_l1264_1) begin
      execute_CsrPlugin_csr_836 <= (decode_INSTRUCTION[31 : 20] == 12'h344);
    end
    if(when_CsrPlugin_l1264_2) begin
      execute_CsrPlugin_csr_772 <= (decode_INSTRUCTION[31 : 20] == 12'h304);
    end
    if(when_CsrPlugin_l1264_3) begin
      execute_CsrPlugin_csr_773 <= (decode_INSTRUCTION[31 : 20] == 12'h305);
    end
    if(when_CsrPlugin_l1264_4) begin
      execute_CsrPlugin_csr_834 <= (decode_INSTRUCTION[31 : 20] == 12'h342);
    end
    if(execute_CsrPlugin_csr_836) begin
      if(execute_CsrPlugin_writeEnable) begin
        CsrPlugin_mip_MSIP <= CsrPlugin_csrMapping_writeDataSignal[3];
      end
    end
  end

  always @(posedge io_mainClk) begin
    DebugPlugin_firstCycle <= 1'b0;
    if(debug_bus_cmd_ready) begin
      DebugPlugin_firstCycle <= 1'b1;
    end
    DebugPlugin_secondCycle <= DebugPlugin_firstCycle;
    DebugPlugin_isPipBusy <= (({writeBack_arbitration_isValid,{memory_arbitration_isValid,{execute_arbitration_isValid,decode_arbitration_isValid}}} != 4'b0000) || IBusSimplePlugin_incomingInstruction);
    if(writeBack_arbitration_isValid) begin
      DebugPlugin_busReadDataReg <= _zz_decode_RS2_2;
    end
    _zz_when_DebugPlugin_l244 <= debug_bus_cmd_payload_address[2];
    if(when_DebugPlugin_l284) begin
      DebugPlugin_busReadDataReg <= execute_PC;
    end
    DebugPlugin_resetIt_regNext <= DebugPlugin_resetIt;
  end

  always @(posedge io_mainClk or posedge resetCtrl_mainClkReset) begin
    if(resetCtrl_mainClkReset) begin
      DebugPlugin_resetIt <= 1'b0;
      DebugPlugin_haltIt <= 1'b0;
      DebugPlugin_stepIt <= 1'b0;
      DebugPlugin_godmode <= 1'b0;
      DebugPlugin_haltedByBreak <= 1'b0;
      DebugPlugin_debugUsed <= 1'b0;
      DebugPlugin_disableEbreak <= 1'b0;
      _zz_3 <= 1'b0;
    end else begin
      if(when_DebugPlugin_l225) begin
        DebugPlugin_godmode <= 1'b1;
      end
      if(debug_bus_cmd_valid) begin
        DebugPlugin_debugUsed <= 1'b1;
      end
      if(debug_bus_cmd_valid) begin
        case(switch_DebugPlugin_l256)
          6'h0 : begin
            if(debug_bus_cmd_payload_wr) begin
              DebugPlugin_stepIt <= debug_bus_cmd_payload_data[4];
              if(when_DebugPlugin_l260) begin
                DebugPlugin_resetIt <= 1'b1;
              end
              if(when_DebugPlugin_l260_1) begin
                DebugPlugin_resetIt <= 1'b0;
              end
              if(when_DebugPlugin_l261) begin
                DebugPlugin_haltIt <= 1'b1;
              end
              if(when_DebugPlugin_l261_1) begin
                DebugPlugin_haltIt <= 1'b0;
              end
              if(when_DebugPlugin_l262) begin
                DebugPlugin_haltedByBreak <= 1'b0;
              end
              if(when_DebugPlugin_l263) begin
                DebugPlugin_godmode <= 1'b0;
              end
              if(when_DebugPlugin_l264) begin
                DebugPlugin_disableEbreak <= 1'b1;
              end
              if(when_DebugPlugin_l264_1) begin
                DebugPlugin_disableEbreak <= 1'b0;
              end
            end
          end
          default : begin
          end
        endcase
      end
      if(when_DebugPlugin_l284) begin
        if(when_DebugPlugin_l287) begin
          DebugPlugin_haltIt <= 1'b1;
          DebugPlugin_haltedByBreak <= 1'b1;
        end
      end
      if(when_DebugPlugin_l300) begin
        if(decode_arbitration_isValid) begin
          DebugPlugin_haltIt <= 1'b1;
        end
      end
      _zz_3 <= (DebugPlugin_stepIt && decode_arbitration_isFiring);
    end
  end


endmodule

module MuraxMasterArbiter (
  input               io_iBus_cmd_valid,
  output reg          io_iBus_cmd_ready,
  input      [31:0]   io_iBus_cmd_payload_pc,
  output              io_iBus_rsp_valid,
  output              io_iBus_rsp_payload_error,
  output     [31:0]   io_iBus_rsp_payload_inst,
  input               io_dBus_cmd_valid,
  output reg          io_dBus_cmd_ready,
  input               io_dBus_cmd_payload_wr,
  input      [31:0]   io_dBus_cmd_payload_address,
  input      [31:0]   io_dBus_cmd_payload_data,
  input      [1:0]    io_dBus_cmd_payload_size,
  output              io_dBus_rsp_ready,
  output              io_dBus_rsp_error,
  output     [31:0]   io_dBus_rsp_data,
  output reg          io_masterBus_cmd_valid,
  input               io_masterBus_cmd_ready,
  output              io_masterBus_cmd_payload_write,
  output     [31:0]   io_masterBus_cmd_payload_address,
  output     [31:0]   io_masterBus_cmd_payload_data,
  output     [3:0]    io_masterBus_cmd_payload_mask,
  input               io_masterBus_rsp_valid,
  input      [31:0]   io_masterBus_rsp_payload_data,
  input               io_mainClk,
  input               resetCtrl_systemReset
);
  reg        [3:0]    _zz_io_masterBus_cmd_payload_mask;
  reg                 rspPending;
  reg                 rspTarget;
  wire                io_masterBus_cmd_fire;
  wire                when_MuraxUtiles_l31;
  wire                when_MuraxUtiles_l36;

  always @(*) begin
    io_masterBus_cmd_valid = (io_iBus_cmd_valid || io_dBus_cmd_valid);
    if(when_MuraxUtiles_l36) begin
      io_masterBus_cmd_valid = 1'b0;
    end
  end

  assign io_masterBus_cmd_payload_write = (io_dBus_cmd_valid && io_dBus_cmd_payload_wr);
  assign io_masterBus_cmd_payload_address = (io_dBus_cmd_valid ? io_dBus_cmd_payload_address : io_iBus_cmd_payload_pc);
  assign io_masterBus_cmd_payload_data = io_dBus_cmd_payload_data;
  always @(*) begin
    case(io_dBus_cmd_payload_size)
      2'b00 : begin
        _zz_io_masterBus_cmd_payload_mask = 4'b0001;
      end
      2'b01 : begin
        _zz_io_masterBus_cmd_payload_mask = 4'b0011;
      end
      default : begin
        _zz_io_masterBus_cmd_payload_mask = 4'b1111;
      end
    endcase
  end

  assign io_masterBus_cmd_payload_mask = (_zz_io_masterBus_cmd_payload_mask <<< io_dBus_cmd_payload_address[1 : 0]);
  always @(*) begin
    io_iBus_cmd_ready = (io_masterBus_cmd_ready && (! io_dBus_cmd_valid));
    if(when_MuraxUtiles_l36) begin
      io_iBus_cmd_ready = 1'b0;
    end
  end

  always @(*) begin
    io_dBus_cmd_ready = io_masterBus_cmd_ready;
    if(when_MuraxUtiles_l36) begin
      io_dBus_cmd_ready = 1'b0;
    end
  end

  assign io_masterBus_cmd_fire = (io_masterBus_cmd_valid && io_masterBus_cmd_ready);
  assign when_MuraxUtiles_l31 = (io_masterBus_cmd_fire && (! io_masterBus_cmd_payload_write));
  assign when_MuraxUtiles_l36 = (rspPending && (! io_masterBus_rsp_valid));
  assign io_iBus_rsp_valid = (io_masterBus_rsp_valid && (! rspTarget));
  assign io_iBus_rsp_payload_inst = io_masterBus_rsp_payload_data;
  assign io_iBus_rsp_payload_error = 1'b0;
  assign io_dBus_rsp_ready = (io_masterBus_rsp_valid && rspTarget);
  assign io_dBus_rsp_data = io_masterBus_rsp_payload_data;
  assign io_dBus_rsp_error = 1'b0;
  always @(posedge io_mainClk or posedge resetCtrl_systemReset) begin
    if(resetCtrl_systemReset) begin
      rspPending <= 1'b0;
      rspTarget <= 1'b0;
    end else begin
      if(io_masterBus_rsp_valid) begin
        rspPending <= 1'b0;
      end
      if(when_MuraxUtiles_l31) begin
        rspTarget <= io_dBus_cmd_valid;
        rspPending <= 1'b1;
      end
    end
  end


endmodule

module BufferCC_5 (
  input               io_dataIn,
  output              io_dataOut,
  input               io_mainClk
);
  (* async_reg = "true" *) reg                 buffers_0;
  (* async_reg = "true" *) reg                 buffers_1;

  assign io_dataOut = buffers_1;
  always @(posedge io_mainClk) begin
    buffers_0 <= io_dataIn;
    buffers_1 <= buffers_0;
  end


endmodule

module LedsCtrl (
  input      [7:0]    io_value,
  input      [0:0]    io_ldir,
  output reg [7:0]    io_o_leds
);
  wire                when_LedsCtrl_l33;
  reg        [7:0]    _zz_io_o_leds;

  assign when_LedsCtrl_l33 = (io_ldir == 1'b0);
  always @(*) begin
    if(when_LedsCtrl_l33) begin
      io_o_leds = io_value;
    end else begin
      io_o_leds = _zz_io_o_leds;
    end
  end

  always @(*) begin
    _zz_io_o_leds[0] = io_value[7];
    _zz_io_o_leds[1] = io_value[6];
    _zz_io_o_leds[2] = io_value[5];
    _zz_io_o_leds[3] = io_value[4];
    _zz_io_o_leds[4] = io_value[3];
    _zz_io_o_leds[5] = io_value[2];
    _zz_io_o_leds[6] = io_value[1];
    _zz_io_o_leds[7] = io_value[0];
  end


endmodule

module StreamFifo_3 (
  input               io_push_valid,
  output              io_push_ready,
  input      [7:0]    io_push_payload,
  output              io_pop_valid,
  input               io_pop_ready,
  output     [7:0]    io_pop_payload,
  input               io_flush,
  output     [5:0]    io_occupancy,
  output     [5:0]    io_availability,
  input               io_mainClk,
  input               resetCtrl_systemReset
);
  reg        [7:0]    _zz_logic_ram_port0;
  wire       [4:0]    _zz_logic_pushPtr_valueNext;
  wire       [0:0]    _zz_logic_pushPtr_valueNext_1;
  wire       [4:0]    _zz_logic_popPtr_valueNext;
  wire       [0:0]    _zz_logic_popPtr_valueNext_1;
  wire                _zz_logic_ram_port;
  wire                _zz_io_pop_payload;
  wire       [4:0]    _zz_io_availability;
  reg                 _zz_1;
  reg                 logic_pushPtr_willIncrement;
  reg                 logic_pushPtr_willClear;
  reg        [4:0]    logic_pushPtr_valueNext;
  reg        [4:0]    logic_pushPtr_value;
  wire                logic_pushPtr_willOverflowIfInc;
  wire                logic_pushPtr_willOverflow;
  reg                 logic_popPtr_willIncrement;
  reg                 logic_popPtr_willClear;
  reg        [4:0]    logic_popPtr_valueNext;
  reg        [4:0]    logic_popPtr_value;
  wire                logic_popPtr_willOverflowIfInc;
  wire                logic_popPtr_willOverflow;
  wire                logic_ptrMatch;
  reg                 logic_risingOccupancy;
  wire                logic_pushing;
  wire                logic_popping;
  wire                logic_empty;
  wire                logic_full;
  reg                 _zz_io_pop_valid;
  wire                when_Stream_l933;
  wire       [4:0]    logic_ptrDif;
  reg [7:0] logic_ram [0:31];

  assign _zz_logic_pushPtr_valueNext_1 = logic_pushPtr_willIncrement;
  assign _zz_logic_pushPtr_valueNext = {4'd0, _zz_logic_pushPtr_valueNext_1};
  assign _zz_logic_popPtr_valueNext_1 = logic_popPtr_willIncrement;
  assign _zz_logic_popPtr_valueNext = {4'd0, _zz_logic_popPtr_valueNext_1};
  assign _zz_io_availability = (logic_popPtr_value - logic_pushPtr_value);
  assign _zz_io_pop_payload = 1'b1;
  always @(posedge io_mainClk) begin
    if(_zz_io_pop_payload) begin
      _zz_logic_ram_port0 <= logic_ram[logic_popPtr_valueNext];
    end
  end

  always @(posedge io_mainClk) begin
    if(_zz_1) begin
      logic_ram[logic_pushPtr_value] <= io_push_payload;
    end
  end

  always @(*) begin
    _zz_1 = 1'b0;
    if(logic_pushing) begin
      _zz_1 = 1'b1;
    end
  end

  always @(*) begin
    logic_pushPtr_willIncrement = 1'b0;
    if(logic_pushing) begin
      logic_pushPtr_willIncrement = 1'b1;
    end
  end

  always @(*) begin
    logic_pushPtr_willClear = 1'b0;
    if(io_flush) begin
      logic_pushPtr_willClear = 1'b1;
    end
  end

  assign logic_pushPtr_willOverflowIfInc = (logic_pushPtr_value == 5'h1f);
  assign logic_pushPtr_willOverflow = (logic_pushPtr_willOverflowIfInc && logic_pushPtr_willIncrement);
  always @(*) begin
    logic_pushPtr_valueNext = (logic_pushPtr_value + _zz_logic_pushPtr_valueNext);
    if(logic_pushPtr_willClear) begin
      logic_pushPtr_valueNext = 5'h0;
    end
  end

  always @(*) begin
    logic_popPtr_willIncrement = 1'b0;
    if(logic_popping) begin
      logic_popPtr_willIncrement = 1'b1;
    end
  end

  always @(*) begin
    logic_popPtr_willClear = 1'b0;
    if(io_flush) begin
      logic_popPtr_willClear = 1'b1;
    end
  end

  assign logic_popPtr_willOverflowIfInc = (logic_popPtr_value == 5'h1f);
  assign logic_popPtr_willOverflow = (logic_popPtr_willOverflowIfInc && logic_popPtr_willIncrement);
  always @(*) begin
    logic_popPtr_valueNext = (logic_popPtr_value + _zz_logic_popPtr_valueNext);
    if(logic_popPtr_willClear) begin
      logic_popPtr_valueNext = 5'h0;
    end
  end

  assign logic_ptrMatch = (logic_pushPtr_value == logic_popPtr_value);
  assign logic_pushing = (io_push_valid && io_push_ready);
  assign logic_popping = (io_pop_valid && io_pop_ready);
  assign logic_empty = (logic_ptrMatch && (! logic_risingOccupancy));
  assign logic_full = (logic_ptrMatch && logic_risingOccupancy);
  assign io_push_ready = (! logic_full);
  assign io_pop_valid = ((! logic_empty) && (! (_zz_io_pop_valid && (! logic_full))));
  assign io_pop_payload = _zz_logic_ram_port0;
  assign when_Stream_l933 = (logic_pushing != logic_popping);
  assign logic_ptrDif = (logic_pushPtr_value - logic_popPtr_value);
  assign io_occupancy = {(logic_risingOccupancy && logic_ptrMatch),logic_ptrDif};
  assign io_availability = {((! logic_risingOccupancy) && logic_ptrMatch),_zz_io_availability};
  always @(posedge io_mainClk or posedge resetCtrl_systemReset) begin
    if(resetCtrl_systemReset) begin
      logic_pushPtr_value <= 5'h0;
      logic_popPtr_value <= 5'h0;
      logic_risingOccupancy <= 1'b0;
      _zz_io_pop_valid <= 1'b0;
    end else begin
      logic_pushPtr_value <= logic_pushPtr_valueNext;
      logic_popPtr_value <= logic_popPtr_valueNext;
      _zz_io_pop_valid <= (logic_popPtr_valueNext == logic_pushPtr_value);
      if(when_Stream_l933) begin
        logic_risingOccupancy <= logic_pushing;
      end
      if(io_flush) begin
        logic_risingOccupancy <= 1'b0;
      end
    end
  end


endmodule

module StreamFifo_2 (
  input               io_push_valid,
  output              io_push_ready,
  input      `SpiMasterCtrlCmdMode_binary_sequential_type io_push_payload_mode,
  input      [8:0]    io_push_payload_args,
  output              io_pop_valid,
  input               io_pop_ready,
  output     `SpiMasterCtrlCmdMode_binary_sequential_type io_pop_payload_mode,
  output     [8:0]    io_pop_payload_args,
  input               io_flush,
  output     [5:0]    io_occupancy,
  output     [5:0]    io_availability,
  input               io_mainClk,
  input               resetCtrl_systemReset
);
  reg        [9:0]    _zz_logic_ram_port0;
  wire       [4:0]    _zz_logic_pushPtr_valueNext;
  wire       [0:0]    _zz_logic_pushPtr_valueNext_1;
  wire       [4:0]    _zz_logic_popPtr_valueNext;
  wire       [0:0]    _zz_logic_popPtr_valueNext_1;
  wire                _zz_logic_ram_port;
  wire                _zz__zz_io_pop_payload_mode_1;
  wire       [9:0]    _zz_logic_ram_port_1;
  wire       [4:0]    _zz_io_availability;
  reg                 _zz_1;
  reg                 logic_pushPtr_willIncrement;
  reg                 logic_pushPtr_willClear;
  reg        [4:0]    logic_pushPtr_valueNext;
  reg        [4:0]    logic_pushPtr_value;
  wire                logic_pushPtr_willOverflowIfInc;
  wire                logic_pushPtr_willOverflow;
  reg                 logic_popPtr_willIncrement;
  reg                 logic_popPtr_willClear;
  reg        [4:0]    logic_popPtr_valueNext;
  reg        [4:0]    logic_popPtr_value;
  wire                logic_popPtr_willOverflowIfInc;
  wire                logic_popPtr_willOverflow;
  wire                logic_ptrMatch;
  reg                 logic_risingOccupancy;
  wire                logic_pushing;
  wire                logic_popping;
  wire                logic_empty;
  wire                logic_full;
  reg                 _zz_io_pop_valid;
  wire       `SpiMasterCtrlCmdMode_binary_sequential_type _zz_io_pop_payload_mode;
  wire       [9:0]    _zz_io_pop_payload_mode_1;
  wire       `SpiMasterCtrlCmdMode_binary_sequential_type _zz_io_pop_payload_mode_2;
  wire                when_Stream_l933;
  wire       [4:0]    logic_ptrDif;
  `ifndef SYNTHESIS
  reg [31:0] io_push_payload_mode_string;
  reg [31:0] io_pop_payload_mode_string;
  reg [31:0] _zz_io_pop_payload_mode_string;
  reg [31:0] _zz_io_pop_payload_mode_2_string;
  `endif

  reg [9:0] logic_ram [0:31];

  assign _zz_logic_pushPtr_valueNext_1 = logic_pushPtr_willIncrement;
  assign _zz_logic_pushPtr_valueNext = {4'd0, _zz_logic_pushPtr_valueNext_1};
  assign _zz_logic_popPtr_valueNext_1 = logic_popPtr_willIncrement;
  assign _zz_logic_popPtr_valueNext = {4'd0, _zz_logic_popPtr_valueNext_1};
  assign _zz_io_availability = (logic_popPtr_value - logic_pushPtr_value);
  assign _zz__zz_io_pop_payload_mode_1 = 1'b1;
  assign _zz_logic_ram_port_1 = {io_push_payload_args,io_push_payload_mode};
  always @(posedge io_mainClk) begin
    if(_zz__zz_io_pop_payload_mode_1) begin
      _zz_logic_ram_port0 <= logic_ram[logic_popPtr_valueNext];
    end
  end

  always @(posedge io_mainClk) begin
    if(_zz_1) begin
      logic_ram[logic_pushPtr_value] <= _zz_logic_ram_port_1;
    end
  end

  `ifndef SYNTHESIS
  always @(*) begin
    case(io_push_payload_mode)
      `SpiMasterCtrlCmdMode_binary_sequential_DATA : io_push_payload_mode_string = "DATA";
      `SpiMasterCtrlCmdMode_binary_sequential_SS : io_push_payload_mode_string = "SS  ";
      default : io_push_payload_mode_string = "????";
    endcase
  end
  always @(*) begin
    case(io_pop_payload_mode)
      `SpiMasterCtrlCmdMode_binary_sequential_DATA : io_pop_payload_mode_string = "DATA";
      `SpiMasterCtrlCmdMode_binary_sequential_SS : io_pop_payload_mode_string = "SS  ";
      default : io_pop_payload_mode_string = "????";
    endcase
  end
  always @(*) begin
    case(_zz_io_pop_payload_mode)
      `SpiMasterCtrlCmdMode_binary_sequential_DATA : _zz_io_pop_payload_mode_string = "DATA";
      `SpiMasterCtrlCmdMode_binary_sequential_SS : _zz_io_pop_payload_mode_string = "SS  ";
      default : _zz_io_pop_payload_mode_string = "????";
    endcase
  end
  always @(*) begin
    case(_zz_io_pop_payload_mode_2)
      `SpiMasterCtrlCmdMode_binary_sequential_DATA : _zz_io_pop_payload_mode_2_string = "DATA";
      `SpiMasterCtrlCmdMode_binary_sequential_SS : _zz_io_pop_payload_mode_2_string = "SS  ";
      default : _zz_io_pop_payload_mode_2_string = "????";
    endcase
  end
  `endif

  always @(*) begin
    _zz_1 = 1'b0;
    if(logic_pushing) begin
      _zz_1 = 1'b1;
    end
  end

  always @(*) begin
    logic_pushPtr_willIncrement = 1'b0;
    if(logic_pushing) begin
      logic_pushPtr_willIncrement = 1'b1;
    end
  end

  always @(*) begin
    logic_pushPtr_willClear = 1'b0;
    if(io_flush) begin
      logic_pushPtr_willClear = 1'b1;
    end
  end

  assign logic_pushPtr_willOverflowIfInc = (logic_pushPtr_value == 5'h1f);
  assign logic_pushPtr_willOverflow = (logic_pushPtr_willOverflowIfInc && logic_pushPtr_willIncrement);
  always @(*) begin
    logic_pushPtr_valueNext = (logic_pushPtr_value + _zz_logic_pushPtr_valueNext);
    if(logic_pushPtr_willClear) begin
      logic_pushPtr_valueNext = 5'h0;
    end
  end

  always @(*) begin
    logic_popPtr_willIncrement = 1'b0;
    if(logic_popping) begin
      logic_popPtr_willIncrement = 1'b1;
    end
  end

  always @(*) begin
    logic_popPtr_willClear = 1'b0;
    if(io_flush) begin
      logic_popPtr_willClear = 1'b1;
    end
  end

  assign logic_popPtr_willOverflowIfInc = (logic_popPtr_value == 5'h1f);
  assign logic_popPtr_willOverflow = (logic_popPtr_willOverflowIfInc && logic_popPtr_willIncrement);
  always @(*) begin
    logic_popPtr_valueNext = (logic_popPtr_value + _zz_logic_popPtr_valueNext);
    if(logic_popPtr_willClear) begin
      logic_popPtr_valueNext = 5'h0;
    end
  end

  assign logic_ptrMatch = (logic_pushPtr_value == logic_popPtr_value);
  assign logic_pushing = (io_push_valid && io_push_ready);
  assign logic_popping = (io_pop_valid && io_pop_ready);
  assign logic_empty = (logic_ptrMatch && (! logic_risingOccupancy));
  assign logic_full = (logic_ptrMatch && logic_risingOccupancy);
  assign io_push_ready = (! logic_full);
  assign io_pop_valid = ((! logic_empty) && (! (_zz_io_pop_valid && (! logic_full))));
  assign _zz_io_pop_payload_mode_1 = _zz_logic_ram_port0;
  assign _zz_io_pop_payload_mode_2 = _zz_io_pop_payload_mode_1[0 : 0];
  assign _zz_io_pop_payload_mode = _zz_io_pop_payload_mode_2;
  assign io_pop_payload_mode = _zz_io_pop_payload_mode;
  assign io_pop_payload_args = _zz_io_pop_payload_mode_1[9 : 1];
  assign when_Stream_l933 = (logic_pushing != logic_popping);
  assign logic_ptrDif = (logic_pushPtr_value - logic_popPtr_value);
  assign io_occupancy = {(logic_risingOccupancy && logic_ptrMatch),logic_ptrDif};
  assign io_availability = {((! logic_risingOccupancy) && logic_ptrMatch),_zz_io_availability};
  always @(posedge io_mainClk or posedge resetCtrl_systemReset) begin
    if(resetCtrl_systemReset) begin
      logic_pushPtr_value <= 5'h0;
      logic_popPtr_value <= 5'h0;
      logic_risingOccupancy <= 1'b0;
      _zz_io_pop_valid <= 1'b0;
    end else begin
      logic_pushPtr_value <= logic_pushPtr_valueNext;
      logic_popPtr_value <= logic_popPtr_valueNext;
      _zz_io_pop_valid <= (logic_popPtr_valueNext == logic_pushPtr_value);
      if(when_Stream_l933) begin
        logic_risingOccupancy <= logic_pushing;
      end
      if(io_flush) begin
        logic_risingOccupancy <= 1'b0;
      end
    end
  end


endmodule

module SpiMasterCtrl (
  input               io_config_kind_cpol,
  input               io_config_kind_cpha,
  input      [15:0]   io_config_sclkToogle,
  input      [0:0]    io_config_ss_activeHigh,
  input      [15:0]   io_config_ss_setup,
  input      [15:0]   io_config_ss_hold,
  input      [15:0]   io_config_ss_disable,
  input               io_cmd_valid,
  output reg          io_cmd_ready,
  input      `SpiMasterCtrlCmdMode_binary_sequential_type io_cmd_payload_mode,
  input      [8:0]    io_cmd_payload_args,
  output              io_rsp_valid,
  output     [7:0]    io_rsp_payload,
  output     [0:0]    io_spi_ss,
  output              io_spi_sclk,
  output              io_spi_mosi,
  input               io_spi_miso,
  input               io_mainClk,
  input               resetCtrl_systemReset
);
  wire       [3:0]    _zz_fsm_counter_valueNext;
  wire       [0:0]    _zz_fsm_counter_valueNext_1;
  wire       [8:0]    _zz_fsm_buffer;
  wire                _zz_when;
  wire       [7:0]    _zz__zz_io_spi_mosi;
  wire       [2:0]    _zz__zz_io_spi_mosi_1;
  wire       [2:0]    _zz__zz_io_spi_mosi_2;
  reg        [15:0]   timer_counter;
  reg                 timer_reset;
  wire                timer_ss_setupHit;
  wire                timer_ss_holdHit;
  wire                timer_ss_disableHit;
  wire                timer_sclkToogleHit;
  reg                 fsm_counter_willIncrement;
  wire                fsm_counter_willClear;
  reg        [3:0]    fsm_counter_valueNext;
  reg        [3:0]    fsm_counter_value;
  wire                fsm_counter_willOverflowIfInc;
  wire                fsm_counter_willOverflow;
  reg        [7:0]    fsm_buffer;
  reg        [0:0]    fsm_ss;
  wire                when_SpiMasterCtrl_l194;
  wire                when_SpiMasterCtrl_l199;
  wire                when_SpiMasterCtrl_l211;
  wire                io_cmd_fire;
  reg                 _zz_io_rsp_valid;
  wire                when_SpiMasterCtrl_l232;
  reg                 _zz_io_spi_sclk;
  reg                 _zz_io_spi_mosi;
  `ifndef SYNTHESIS
  reg [31:0] io_cmd_payload_mode_string;
  `endif


  assign _zz_when = io_cmd_payload_args[0];
  assign _zz_fsm_counter_valueNext_1 = fsm_counter_willIncrement;
  assign _zz_fsm_counter_valueNext = {3'd0, _zz_fsm_counter_valueNext_1};
  assign _zz_fsm_buffer = {fsm_buffer,io_spi_miso};
  assign _zz__zz_io_spi_mosi = io_cmd_payload_args[7 : 0];
  assign _zz__zz_io_spi_mosi_1 = (3'b111 - _zz__zz_io_spi_mosi_2);
  assign _zz__zz_io_spi_mosi_2 = (fsm_counter_value >>> 1);
  `ifndef SYNTHESIS
  always @(*) begin
    case(io_cmd_payload_mode)
      `SpiMasterCtrlCmdMode_binary_sequential_DATA : io_cmd_payload_mode_string = "DATA";
      `SpiMasterCtrlCmdMode_binary_sequential_SS : io_cmd_payload_mode_string = "SS  ";
      default : io_cmd_payload_mode_string = "????";
    endcase
  end
  `endif

  always @(*) begin
    timer_reset = 1'b0;
    if(io_cmd_valid) begin
      if(when_SpiMasterCtrl_l194) begin
        if(timer_sclkToogleHit) begin
          timer_reset = 1'b1;
        end
      end else begin
        if(!_zz_when) begin
          if(when_SpiMasterCtrl_l211) begin
            if(timer_ss_holdHit) begin
              timer_reset = 1'b1;
            end
          end
        end
      end
    end
    if(when_SpiMasterCtrl_l232) begin
      timer_reset = 1'b1;
    end
  end

  assign timer_ss_setupHit = (timer_counter == io_config_ss_setup);
  assign timer_ss_holdHit = (timer_counter == io_config_ss_hold);
  assign timer_ss_disableHit = (timer_counter == io_config_ss_disable);
  assign timer_sclkToogleHit = (timer_counter == io_config_sclkToogle);
  always @(*) begin
    fsm_counter_willIncrement = 1'b0;
    if(io_cmd_valid) begin
      if(when_SpiMasterCtrl_l194) begin
        if(timer_sclkToogleHit) begin
          fsm_counter_willIncrement = 1'b1;
        end
      end else begin
        if(!_zz_when) begin
          if(when_SpiMasterCtrl_l211) begin
            if(timer_ss_holdHit) begin
              fsm_counter_willIncrement = 1'b1;
            end
          end
        end
      end
    end
  end

  assign fsm_counter_willClear = 1'b0;
  assign fsm_counter_willOverflowIfInc = (fsm_counter_value == 4'b1111);
  assign fsm_counter_willOverflow = (fsm_counter_willOverflowIfInc && fsm_counter_willIncrement);
  always @(*) begin
    fsm_counter_valueNext = (fsm_counter_value + _zz_fsm_counter_valueNext);
    if(fsm_counter_willClear) begin
      fsm_counter_valueNext = 4'b0000;
    end
  end

  always @(*) begin
    io_cmd_ready = 1'b0;
    if(io_cmd_valid) begin
      if(when_SpiMasterCtrl_l194) begin
        if(timer_sclkToogleHit) begin
          io_cmd_ready = fsm_counter_willOverflowIfInc;
        end
      end else begin
        if(_zz_when) begin
          if(timer_ss_setupHit) begin
            io_cmd_ready = 1'b1;
          end
        end else begin
          if(!when_SpiMasterCtrl_l211) begin
            if(timer_ss_disableHit) begin
              io_cmd_ready = 1'b1;
            end
          end
        end
      end
    end
  end

  assign when_SpiMasterCtrl_l194 = (io_cmd_payload_mode == `SpiMasterCtrlCmdMode_binary_sequential_DATA);
  assign when_SpiMasterCtrl_l199 = fsm_counter_value[0];
  assign when_SpiMasterCtrl_l211 = (! fsm_counter_value[0]);
  assign io_cmd_fire = (io_cmd_valid && io_cmd_ready);
  assign io_rsp_valid = _zz_io_rsp_valid;
  assign io_rsp_payload = fsm_buffer;
  assign when_SpiMasterCtrl_l232 = ((! io_cmd_valid) || io_cmd_ready);
  assign io_spi_ss = (fsm_ss ^ io_config_ss_activeHigh);
  assign io_spi_sclk = _zz_io_spi_sclk;
  assign io_spi_mosi = _zz_io_spi_mosi;
  always @(posedge io_mainClk) begin
    timer_counter <= (timer_counter + 16'h0001);
    if(timer_reset) begin
      timer_counter <= 16'h0;
    end
    if(io_cmd_valid) begin
      if(when_SpiMasterCtrl_l194) begin
        if(timer_sclkToogleHit) begin
          if(when_SpiMasterCtrl_l199) begin
            fsm_buffer <= _zz_fsm_buffer[7:0];
          end
        end
      end
    end
    _zz_io_spi_sclk <= (((io_cmd_valid && (io_cmd_payload_mode == `SpiMasterCtrlCmdMode_binary_sequential_DATA)) && (fsm_counter_value[0] ^ io_config_kind_cpha)) ^ io_config_kind_cpol);
    _zz_io_spi_mosi <= _zz__zz_io_spi_mosi[_zz__zz_io_spi_mosi_1];
  end

  always @(posedge io_mainClk or posedge resetCtrl_systemReset) begin
    if(resetCtrl_systemReset) begin
      fsm_counter_value <= 4'b0000;
      fsm_ss <= 1'b1;
      _zz_io_rsp_valid <= 1'b0;
    end else begin
      fsm_counter_value <= fsm_counter_valueNext;
      if(io_cmd_valid) begin
        if(!when_SpiMasterCtrl_l194) begin
          if(_zz_when) begin
            fsm_ss[0] <= 1'b0;
          end else begin
            if(!when_SpiMasterCtrl_l211) begin
              fsm_ss[0] <= 1'b1;
            end
          end
        end
      end
      _zz_io_rsp_valid <= ((io_cmd_fire && (io_cmd_payload_mode == `SpiMasterCtrlCmdMode_binary_sequential_DATA)) && io_cmd_payload_args[8]);
      if(when_SpiMasterCtrl_l232) begin
        fsm_counter_value <= 4'b0000;
      end
    end
  end


endmodule

module I2cSlave (
  output              io_i2c_sda_write,
  input               io_i2c_sda_read,
  output              io_i2c_scl_write,
  input               io_i2c_scl_read,
  input      [9:0]    io_config_samplingClockDivider,
  input      [19:0]   io_config_timeout,
  input      [5:0]    io_config_tsuData,
  output reg `I2cSlaveCmdMode_binary_sequential_type io_bus_cmd_kind,
  output              io_bus_cmd_data,
  input               io_bus_rsp_valid,
  input               io_bus_rsp_enable,
  input               io_bus_rsp_data,
  output              io_internals_inFrame,
  output              io_internals_sdaRead,
  output              io_internals_sclRead,
  input               io_mainClk,
  input               resetCtrl_systemReset
);
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
  wire                ctrl_rspBufferIn_rspBuffer_valid;
  reg                 ctrl_rspBufferIn_rspBuffer_ready;
  wire                ctrl_rspBufferIn_rspBuffer_payload_enable;
  wire                ctrl_rspBufferIn_rspBuffer_payload_data;
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


  BufferCC_2 io_i2c_scl_read_buffercc (
    .io_dataIn                (io_i2c_scl_read                      ), //i
    .io_dataOut               (io_i2c_scl_read_buffercc_io_dataOut  ), //o
    .io_mainClk               (io_mainClk                           ), //i
    .resetCtrl_systemReset    (resetCtrl_systemReset                )  //i
  );
  BufferCC_2 io_i2c_sda_read_buffercc (
    .io_dataIn                (io_i2c_sda_read                      ), //i
    .io_dataOut               (io_i2c_sda_read_buffercc_io_dataOut  ), //o
    .io_mainClk               (io_mainClk                           ), //i
    .resetCtrl_systemReset    (resetCtrl_systemReset                )  //i
  );
  `ifndef SYNTHESIS
  always @(*) begin
    case(io_bus_cmd_kind)
      `I2cSlaveCmdMode_binary_sequential_NONE : io_bus_cmd_kind_string = "NONE   ";
      `I2cSlaveCmdMode_binary_sequential_START : io_bus_cmd_kind_string = "START  ";
      `I2cSlaveCmdMode_binary_sequential_RESTART : io_bus_cmd_kind_string = "RESTART";
      `I2cSlaveCmdMode_binary_sequential_STOP : io_bus_cmd_kind_string = "STOP   ";
      `I2cSlaveCmdMode_binary_sequential_DROP : io_bus_cmd_kind_string = "DROP   ";
      `I2cSlaveCmdMode_binary_sequential_DRIVE : io_bus_cmd_kind_string = "DRIVE  ";
      `I2cSlaveCmdMode_binary_sequential_READ : io_bus_cmd_kind_string = "READ   ";
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
    ctrl_rspBufferIn_ready = ctrl_rspBufferIn_rspBuffer_ready;
    if(when_Stream_l342) begin
      ctrl_rspBufferIn_ready = 1'b1;
    end
  end

  assign when_Stream_l342 = (! ctrl_rspBufferIn_rspBuffer_valid);
  assign ctrl_rspBufferIn_rspBuffer_valid = ctrl_rspBufferIn_rValid;
  assign ctrl_rspBufferIn_rspBuffer_payload_enable = ctrl_rspBufferIn_rData_enable;
  assign ctrl_rspBufferIn_rspBuffer_payload_data = ctrl_rspBufferIn_rData_data;
  assign ctrl_rspAhead_valid = (ctrl_rspBufferIn_rspBuffer_valid ? ctrl_rspBufferIn_rspBuffer_valid : ctrl_rspBufferIn_valid);
  assign ctrl_rspAhead_payload_enable = (ctrl_rspBufferIn_rspBuffer_valid ? ctrl_rspBufferIn_rspBuffer_payload_enable : ctrl_rspBufferIn_payload_enable);
  assign ctrl_rspAhead_payload_data = (ctrl_rspBufferIn_rspBuffer_valid ? ctrl_rspBufferIn_rspBuffer_payload_data : ctrl_rspBufferIn_payload_data);
  assign ctrl_rspBufferIn_valid = io_bus_rsp_valid;
  assign ctrl_rspBufferIn_payload_enable = io_bus_rsp_enable;
  assign ctrl_rspBufferIn_payload_data = io_bus_rsp_data;
  always @(*) begin
    ctrl_rspBufferIn_rspBuffer_ready = 1'b0;
    if(ctrl_inFrame) begin
      if(sclEdge_fall) begin
        ctrl_rspBufferIn_rspBuffer_ready = 1'b1;
      end
    end
  end

  always @(*) begin
    io_bus_cmd_kind = `I2cSlaveCmdMode_binary_sequential_NONE;
    if(ctrl_inFrame) begin
      if(sclEdge_rise) begin
        io_bus_cmd_kind = `I2cSlaveCmdMode_binary_sequential_READ;
      end
    end
    if(ctrl_inFrameData) begin
      if(when_I2CSlave_l239) begin
        io_bus_cmd_kind = `I2cSlaveCmdMode_binary_sequential_DRIVE;
      end
    end
    if(detector_start) begin
      io_bus_cmd_kind = (ctrl_inFrame ? `I2cSlaveCmdMode_binary_sequential_RESTART : `I2cSlaveCmdMode_binary_sequential_START);
    end
    if(when_I2CSlave_l274) begin
      if(ctrl_inFrame) begin
        io_bus_cmd_kind = (timeout_tick ? `I2cSlaveCmdMode_binary_sequential_DROP : `I2cSlaveCmdMode_binary_sequential_STOP);
      end
    end
  end

  assign io_bus_cmd_data = filter_sda;
  assign when_I2CSlave_l239 = ((! ctrl_rspBufferIn_rspBuffer_valid) || ctrl_rspBufferIn_rspBuffer_ready);
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
  always @(posedge io_mainClk or posedge resetCtrl_systemReset) begin
    if(resetCtrl_systemReset) begin
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

  always @(posedge io_mainClk) begin
    if(ctrl_rspBufferIn_ready) begin
      ctrl_rspBufferIn_rData_enable <= ctrl_rspBufferIn_payload_enable;
      ctrl_rspBufferIn_rData_data <= ctrl_rspBufferIn_payload_data;
    end
  end


endmodule

module InterruptCtrl (
  input      [1:0]    io_inputs,
  input      [1:0]    io_clears,
  input      [1:0]    io_masks,
  output     [1:0]    io_pendings,
  input               io_mainClk,
  input               resetCtrl_systemReset
);
  reg        [1:0]    pendings;

  assign io_pendings = (pendings & io_masks);
  always @(posedge io_mainClk or posedge resetCtrl_systemReset) begin
    if(resetCtrl_systemReset) begin
      pendings <= 2'b00;
    end else begin
      pendings <= ((pendings & (~ io_clears)) | io_inputs);
    end
  end


endmodule

//Timer replaced by Timer

module Timer (
  input               io_tick,
  input               io_clear,
  input      [15:0]   io_limit,
  output              io_full,
  output     [15:0]   io_value,
  input               io_mainClk,
  input               resetCtrl_systemReset
);
  wire       [15:0]   _zz_counter;
  wire       [0:0]    _zz_counter_1;
  reg        [15:0]   counter;
  wire                limitHit;
  reg                 inhibitFull;

  assign _zz_counter_1 = (! limitHit);
  assign _zz_counter = {15'd0, _zz_counter_1};
  assign limitHit = (counter == io_limit);
  assign io_full = ((limitHit && io_tick) && (! inhibitFull));
  assign io_value = counter;
  always @(posedge io_mainClk or posedge resetCtrl_systemReset) begin
    if(resetCtrl_systemReset) begin
      inhibitFull <= 1'b0;
    end else begin
      if(io_tick) begin
        inhibitFull <= limitHit;
      end
      if(io_clear) begin
        inhibitFull <= 1'b0;
      end
    end
  end

  always @(posedge io_mainClk) begin
    if(io_tick) begin
      counter <= (counter + _zz_counter);
    end
    if(io_clear) begin
      counter <= 16'h0;
    end
  end


endmodule

module Prescaler (
  input               io_clear,
  input      [15:0]   io_limit,
  output              io_overflow,
  input               io_mainClk,
  input               resetCtrl_systemReset
);
  reg        [15:0]   counter;
  wire                when_Prescaler_l17;

  assign when_Prescaler_l17 = (io_clear || io_overflow);
  assign io_overflow = (counter == io_limit);
  always @(posedge io_mainClk) begin
    counter <= (counter + 16'h0001);
    if(when_Prescaler_l17) begin
      counter <= 16'h0;
    end
  end


endmodule

//StreamFifo replaced by StreamFifo

module StreamFifo (
  input               io_push_valid,
  output              io_push_ready,
  input      [7:0]    io_push_payload,
  output              io_pop_valid,
  input               io_pop_ready,
  output     [7:0]    io_pop_payload,
  input               io_flush,
  output     [4:0]    io_occupancy,
  output     [4:0]    io_availability,
  input               io_mainClk,
  input               resetCtrl_systemReset
);
  reg        [7:0]    _zz_logic_ram_port0;
  wire       [3:0]    _zz_logic_pushPtr_valueNext;
  wire       [0:0]    _zz_logic_pushPtr_valueNext_1;
  wire       [3:0]    _zz_logic_popPtr_valueNext;
  wire       [0:0]    _zz_logic_popPtr_valueNext_1;
  wire                _zz_logic_ram_port;
  wire                _zz_io_pop_payload;
  wire       [3:0]    _zz_io_availability;
  reg                 _zz_1;
  reg                 logic_pushPtr_willIncrement;
  reg                 logic_pushPtr_willClear;
  reg        [3:0]    logic_pushPtr_valueNext;
  reg        [3:0]    logic_pushPtr_value;
  wire                logic_pushPtr_willOverflowIfInc;
  wire                logic_pushPtr_willOverflow;
  reg                 logic_popPtr_willIncrement;
  reg                 logic_popPtr_willClear;
  reg        [3:0]    logic_popPtr_valueNext;
  reg        [3:0]    logic_popPtr_value;
  wire                logic_popPtr_willOverflowIfInc;
  wire                logic_popPtr_willOverflow;
  wire                logic_ptrMatch;
  reg                 logic_risingOccupancy;
  wire                logic_pushing;
  wire                logic_popping;
  wire                logic_empty;
  wire                logic_full;
  reg                 _zz_io_pop_valid;
  wire                when_Stream_l933;
  wire       [3:0]    logic_ptrDif;
  reg [7:0] logic_ram [0:15];

  assign _zz_logic_pushPtr_valueNext_1 = logic_pushPtr_willIncrement;
  assign _zz_logic_pushPtr_valueNext = {3'd0, _zz_logic_pushPtr_valueNext_1};
  assign _zz_logic_popPtr_valueNext_1 = logic_popPtr_willIncrement;
  assign _zz_logic_popPtr_valueNext = {3'd0, _zz_logic_popPtr_valueNext_1};
  assign _zz_io_availability = (logic_popPtr_value - logic_pushPtr_value);
  assign _zz_io_pop_payload = 1'b1;
  always @(posedge io_mainClk) begin
    if(_zz_io_pop_payload) begin
      _zz_logic_ram_port0 <= logic_ram[logic_popPtr_valueNext];
    end
  end

  always @(posedge io_mainClk) begin
    if(_zz_1) begin
      logic_ram[logic_pushPtr_value] <= io_push_payload;
    end
  end

  always @(*) begin
    _zz_1 = 1'b0;
    if(logic_pushing) begin
      _zz_1 = 1'b1;
    end
  end

  always @(*) begin
    logic_pushPtr_willIncrement = 1'b0;
    if(logic_pushing) begin
      logic_pushPtr_willIncrement = 1'b1;
    end
  end

  always @(*) begin
    logic_pushPtr_willClear = 1'b0;
    if(io_flush) begin
      logic_pushPtr_willClear = 1'b1;
    end
  end

  assign logic_pushPtr_willOverflowIfInc = (logic_pushPtr_value == 4'b1111);
  assign logic_pushPtr_willOverflow = (logic_pushPtr_willOverflowIfInc && logic_pushPtr_willIncrement);
  always @(*) begin
    logic_pushPtr_valueNext = (logic_pushPtr_value + _zz_logic_pushPtr_valueNext);
    if(logic_pushPtr_willClear) begin
      logic_pushPtr_valueNext = 4'b0000;
    end
  end

  always @(*) begin
    logic_popPtr_willIncrement = 1'b0;
    if(logic_popping) begin
      logic_popPtr_willIncrement = 1'b1;
    end
  end

  always @(*) begin
    logic_popPtr_willClear = 1'b0;
    if(io_flush) begin
      logic_popPtr_willClear = 1'b1;
    end
  end

  assign logic_popPtr_willOverflowIfInc = (logic_popPtr_value == 4'b1111);
  assign logic_popPtr_willOverflow = (logic_popPtr_willOverflowIfInc && logic_popPtr_willIncrement);
  always @(*) begin
    logic_popPtr_valueNext = (logic_popPtr_value + _zz_logic_popPtr_valueNext);
    if(logic_popPtr_willClear) begin
      logic_popPtr_valueNext = 4'b0000;
    end
  end

  assign logic_ptrMatch = (logic_pushPtr_value == logic_popPtr_value);
  assign logic_pushing = (io_push_valid && io_push_ready);
  assign logic_popping = (io_pop_valid && io_pop_ready);
  assign logic_empty = (logic_ptrMatch && (! logic_risingOccupancy));
  assign logic_full = (logic_ptrMatch && logic_risingOccupancy);
  assign io_push_ready = (! logic_full);
  assign io_pop_valid = ((! logic_empty) && (! (_zz_io_pop_valid && (! logic_full))));
  assign io_pop_payload = _zz_logic_ram_port0;
  assign when_Stream_l933 = (logic_pushing != logic_popping);
  assign logic_ptrDif = (logic_pushPtr_value - logic_popPtr_value);
  assign io_occupancy = {(logic_risingOccupancy && logic_ptrMatch),logic_ptrDif};
  assign io_availability = {((! logic_risingOccupancy) && logic_ptrMatch),_zz_io_availability};
  always @(posedge io_mainClk or posedge resetCtrl_systemReset) begin
    if(resetCtrl_systemReset) begin
      logic_pushPtr_value <= 4'b0000;
      logic_popPtr_value <= 4'b0000;
      logic_risingOccupancy <= 1'b0;
      _zz_io_pop_valid <= 1'b0;
    end else begin
      logic_pushPtr_value <= logic_pushPtr_valueNext;
      logic_popPtr_value <= logic_popPtr_valueNext;
      _zz_io_pop_valid <= (logic_popPtr_valueNext == logic_pushPtr_value);
      if(when_Stream_l933) begin
        logic_risingOccupancy <= logic_pushing;
      end
      if(io_flush) begin
        logic_risingOccupancy <= 1'b0;
      end
    end
  end


endmodule

module UartCtrl (
  input      [2:0]    io_config_frame_dataLength,
  input      `UartStopType_binary_sequential_type io_config_frame_stop,
  input      `UartParityType_binary_sequential_type io_config_frame_parity,
  input      [19:0]   io_config_clockDivider,
  input               io_write_valid,
  output reg          io_write_ready,
  input      [7:0]    io_write_payload,
  output              io_read_valid,
  input               io_read_ready,
  output     [7:0]    io_read_payload,
  output              io_uart_txd,
  input               io_uart_rxd,
  output              io_readError,
  input               io_writeBreak,
  output              io_readBreak,
  input               io_mainClk,
  input               resetCtrl_systemReset
);
  wire                tx_io_write_ready;
  wire                tx_io_txd;
  wire                rx_io_read_valid;
  wire       [7:0]    rx_io_read_payload;
  wire                rx_io_rts;
  wire                rx_io_error;
  wire                rx_io_break;
  reg        [19:0]   clockDivider_counter;
  wire                clockDivider_tick;
  reg                 io_write_thrown_valid;
  wire                io_write_thrown_ready;
  wire       [7:0]    io_write_thrown_payload;
  `ifndef SYNTHESIS
  reg [23:0] io_config_frame_stop_string;
  reg [31:0] io_config_frame_parity_string;
  `endif


  UartCtrlTx tx (
    .io_configFrame_dataLength    (io_config_frame_dataLength  ), //i
    .io_configFrame_stop          (io_config_frame_stop        ), //i
    .io_configFrame_parity        (io_config_frame_parity      ), //i
    .io_samplingTick              (clockDivider_tick           ), //i
    .io_write_valid               (io_write_thrown_valid       ), //i
    .io_write_ready               (tx_io_write_ready           ), //o
    .io_write_payload             (io_write_thrown_payload     ), //i
    .io_cts                       (1'b0                        ), //i
    .io_txd                       (tx_io_txd                   ), //o
    .io_break                     (io_writeBreak               ), //i
    .io_mainClk                   (io_mainClk                  ), //i
    .resetCtrl_systemReset        (resetCtrl_systemReset       )  //i
  );
  UartCtrlRx rx (
    .io_configFrame_dataLength    (io_config_frame_dataLength  ), //i
    .io_configFrame_stop          (io_config_frame_stop        ), //i
    .io_configFrame_parity        (io_config_frame_parity      ), //i
    .io_samplingTick              (clockDivider_tick           ), //i
    .io_read_valid                (rx_io_read_valid            ), //o
    .io_read_ready                (io_read_ready               ), //i
    .io_read_payload              (rx_io_read_payload          ), //o
    .io_rxd                       (io_uart_rxd                 ), //i
    .io_rts                       (rx_io_rts                   ), //o
    .io_error                     (rx_io_error                 ), //o
    .io_break                     (rx_io_break                 ), //o
    .io_mainClk                   (io_mainClk                  ), //i
    .resetCtrl_systemReset        (resetCtrl_systemReset       )  //i
  );
  `ifndef SYNTHESIS
  always @(*) begin
    case(io_config_frame_stop)
      `UartStopType_binary_sequential_ONE : io_config_frame_stop_string = "ONE";
      `UartStopType_binary_sequential_TWO : io_config_frame_stop_string = "TWO";
      default : io_config_frame_stop_string = "???";
    endcase
  end
  always @(*) begin
    case(io_config_frame_parity)
      `UartParityType_binary_sequential_NONE : io_config_frame_parity_string = "NONE";
      `UartParityType_binary_sequential_EVEN : io_config_frame_parity_string = "EVEN";
      `UartParityType_binary_sequential_ODD : io_config_frame_parity_string = "ODD ";
      default : io_config_frame_parity_string = "????";
    endcase
  end
  `endif

  assign clockDivider_tick = (clockDivider_counter == 20'h0);
  always @(*) begin
    io_write_thrown_valid = io_write_valid;
    if(rx_io_break) begin
      io_write_thrown_valid = 1'b0;
    end
  end

  always @(*) begin
    io_write_ready = io_write_thrown_ready;
    if(rx_io_break) begin
      io_write_ready = 1'b1;
    end
  end

  assign io_write_thrown_payload = io_write_payload;
  assign io_write_thrown_ready = tx_io_write_ready;
  assign io_read_valid = rx_io_read_valid;
  assign io_read_payload = rx_io_read_payload;
  assign io_uart_txd = tx_io_txd;
  assign io_readError = rx_io_error;
  assign io_readBreak = rx_io_break;
  always @(posedge io_mainClk or posedge resetCtrl_systemReset) begin
    if(resetCtrl_systemReset) begin
      clockDivider_counter <= 20'h0;
    end else begin
      clockDivider_counter <= (clockDivider_counter - 20'h00001);
      if(clockDivider_tick) begin
        clockDivider_counter <= io_config_clockDivider;
      end
    end
  end


endmodule

module BufferCC_4 (
  input      [15:0]   io_dataIn,
  output     [15:0]   io_dataOut,
  input               io_mainClk,
  input               resetCtrl_systemReset
);
  (* async_reg = "true" *) reg        [15:0]   buffers_0;
  (* async_reg = "true" *) reg        [15:0]   buffers_1;

  assign io_dataOut = buffers_1;
  always @(posedge io_mainClk) begin
    buffers_0 <= io_dataIn;
    buffers_1 <= buffers_0;
  end


endmodule

module FlowCCByToggle (
  input               io_input_valid,
  input               io_input_payload_last,
  input      [0:0]    io_input_payload_fragment,
  output              io_output_valid,
  output              io_output_payload_last,
  output     [0:0]    io_output_payload_fragment,
  input               io_jtag_tck,
  input               io_mainClk,
  input               resetCtrl_mainClkReset
);
  wire                inputArea_target_buffercc_io_dataOut;
  wire                outHitSignal;
  reg                 inputArea_target = 0;
  reg                 inputArea_data_last;
  reg        [0:0]    inputArea_data_fragment;
  wire                outputArea_target;
  reg                 outputArea_hit;
  wire                outputArea_flow_valid;
  wire                outputArea_flow_payload_last;
  wire       [0:0]    outputArea_flow_payload_fragment;
  reg                 outputArea_flow_m2sPipe_valid;
  reg                 outputArea_flow_m2sPipe_payload_last;
  reg        [0:0]    outputArea_flow_m2sPipe_payload_fragment;

  BufferCC_1 inputArea_target_buffercc (
    .io_dataIn                 (inputArea_target                      ), //i
    .io_dataOut                (inputArea_target_buffercc_io_dataOut  ), //o
    .io_mainClk                (io_mainClk                            ), //i
    .resetCtrl_mainClkReset    (resetCtrl_mainClkReset                )  //i
  );
  assign outputArea_target = inputArea_target_buffercc_io_dataOut;
  assign outputArea_flow_valid = (outputArea_target != outputArea_hit);
  assign outputArea_flow_payload_last = inputArea_data_last;
  assign outputArea_flow_payload_fragment = inputArea_data_fragment;
  assign io_output_valid = outputArea_flow_m2sPipe_valid;
  assign io_output_payload_last = outputArea_flow_m2sPipe_payload_last;
  assign io_output_payload_fragment = outputArea_flow_m2sPipe_payload_fragment;
  always @(posedge io_jtag_tck) begin
    if(io_input_valid) begin
      inputArea_target <= (! inputArea_target);
      inputArea_data_last <= io_input_payload_last;
      inputArea_data_fragment <= io_input_payload_fragment;
    end
  end

  always @(posedge io_mainClk) begin
    outputArea_hit <= outputArea_target;
    if(outputArea_flow_valid) begin
      outputArea_flow_m2sPipe_payload_last <= outputArea_flow_payload_last;
      outputArea_flow_m2sPipe_payload_fragment <= outputArea_flow_payload_fragment;
    end
  end

  always @(posedge io_mainClk or posedge resetCtrl_mainClkReset) begin
    if(resetCtrl_mainClkReset) begin
      outputArea_flow_m2sPipe_valid <= 1'b0;
    end else begin
      outputArea_flow_m2sPipe_valid <= outputArea_flow_valid;
    end
  end


endmodule

module StreamFifoLowLatency (
  input               io_push_valid,
  output              io_push_ready,
  input               io_push_payload_error,
  input      [31:0]   io_push_payload_inst,
  output reg          io_pop_valid,
  input               io_pop_ready,
  output reg          io_pop_payload_error,
  output reg [31:0]   io_pop_payload_inst,
  input               io_flush,
  output     [0:0]    io_occupancy,
  input               io_mainClk,
  input               resetCtrl_systemReset
);
  reg                 when_Phase_l623;
  reg                 pushPtr_willIncrement;
  reg                 pushPtr_willClear;
  wire                pushPtr_willOverflowIfInc;
  wire                pushPtr_willOverflow;
  reg                 popPtr_willIncrement;
  reg                 popPtr_willClear;
  wire                popPtr_willOverflowIfInc;
  wire                popPtr_willOverflow;
  wire                ptrMatch;
  reg                 risingOccupancy;
  wire                empty;
  wire                full;
  wire                pushing;
  wire                popping;
  wire                when_Stream_l995;
  wire       [32:0]   _zz_io_pop_payload_error;
  wire                when_Stream_l1008;
  reg        [32:0]   _zz_io_pop_payload_error_1;

  always @(*) begin
    when_Phase_l623 = 1'b0;
    if(pushing) begin
      when_Phase_l623 = 1'b1;
    end
  end

  always @(*) begin
    pushPtr_willIncrement = 1'b0;
    if(pushing) begin
      pushPtr_willIncrement = 1'b1;
    end
  end

  always @(*) begin
    pushPtr_willClear = 1'b0;
    if(io_flush) begin
      pushPtr_willClear = 1'b1;
    end
  end

  assign pushPtr_willOverflowIfInc = 1'b1;
  assign pushPtr_willOverflow = (pushPtr_willOverflowIfInc && pushPtr_willIncrement);
  always @(*) begin
    popPtr_willIncrement = 1'b0;
    if(popping) begin
      popPtr_willIncrement = 1'b1;
    end
  end

  always @(*) begin
    popPtr_willClear = 1'b0;
    if(io_flush) begin
      popPtr_willClear = 1'b1;
    end
  end

  assign popPtr_willOverflowIfInc = 1'b1;
  assign popPtr_willOverflow = (popPtr_willOverflowIfInc && popPtr_willIncrement);
  assign ptrMatch = 1'b1;
  assign empty = (ptrMatch && (! risingOccupancy));
  assign full = (ptrMatch && risingOccupancy);
  assign pushing = (io_push_valid && io_push_ready);
  assign popping = (io_pop_valid && io_pop_ready);
  assign io_push_ready = (! full);
  assign when_Stream_l995 = (! empty);
  always @(*) begin
    if(when_Stream_l995) begin
      io_pop_valid = 1'b1;
    end else begin
      io_pop_valid = io_push_valid;
    end
  end

  assign _zz_io_pop_payload_error = _zz_io_pop_payload_error_1;
  always @(*) begin
    if(when_Stream_l995) begin
      io_pop_payload_error = _zz_io_pop_payload_error[0];
    end else begin
      io_pop_payload_error = io_push_payload_error;
    end
  end

  always @(*) begin
    if(when_Stream_l995) begin
      io_pop_payload_inst = _zz_io_pop_payload_error[32 : 1];
    end else begin
      io_pop_payload_inst = io_push_payload_inst;
    end
  end

  assign when_Stream_l1008 = (pushing != popping);
  assign io_occupancy = (risingOccupancy && ptrMatch);
  always @(posedge io_mainClk or posedge resetCtrl_systemReset) begin
    if(resetCtrl_systemReset) begin
      risingOccupancy <= 1'b0;
    end else begin
      if(when_Stream_l1008) begin
        risingOccupancy <= pushing;
      end
      if(io_flush) begin
        risingOccupancy <= 1'b0;
      end
    end
  end

  always @(posedge io_mainClk) begin
    if(when_Phase_l623) begin
      _zz_io_pop_payload_error_1 <= {io_push_payload_inst,io_push_payload_error};
    end
  end


endmodule

//BufferCC_2 replaced by BufferCC_2

module BufferCC_2 (
  input               io_dataIn,
  output              io_dataOut,
  input               io_mainClk,
  input               resetCtrl_systemReset
);
  (* async_reg = "true" *) reg                 buffers_0;
  (* async_reg = "true" *) reg                 buffers_1;

  assign io_dataOut = buffers_1;
  always @(posedge io_mainClk or posedge resetCtrl_systemReset) begin
    if(resetCtrl_systemReset) begin
      buffers_0 <= 1'b1;
      buffers_1 <= 1'b1;
    end else begin
      buffers_0 <= io_dataIn;
      buffers_1 <= buffers_0;
    end
  end


endmodule

module UartCtrlRx (
  input      [2:0]    io_configFrame_dataLength,
  input      `UartStopType_binary_sequential_type io_configFrame_stop,
  input      `UartParityType_binary_sequential_type io_configFrame_parity,
  input               io_samplingTick,
  output              io_read_valid,
  input               io_read_ready,
  output     [7:0]    io_read_payload,
  input               io_rxd,
  output              io_rts,
  output reg          io_error,
  output              io_break,
  input               io_mainClk,
  input               resetCtrl_systemReset
);
  wire                io_rxd_buffercc_io_dataOut;
  wire       [2:0]    _zz_when_UartCtrlRx_l139;
  wire       [0:0]    _zz_when_UartCtrlRx_l139_1;
  reg                 _zz_io_rts;
  wire                sampler_synchroniser;
  wire                sampler_samples_0;
  reg                 sampler_samples_1;
  reg                 sampler_samples_2;
  reg                 sampler_value;
  reg                 sampler_tick;
  reg        [2:0]    bitTimer_counter;
  reg                 bitTimer_tick;
  wire                when_UartCtrlRx_l43;
  reg        [2:0]    bitCounter_value;
  reg        [6:0]    break_counter;
  wire                break_valid;
  wire                when_UartCtrlRx_l69;
  reg        `UartCtrlRxState_binary_sequential_type stateMachine_state;
  reg                 stateMachine_parity;
  reg        [7:0]    stateMachine_shifter;
  reg                 stateMachine_validReg;
  wire                when_UartCtrlRx_l93;
  wire                when_UartCtrlRx_l103;
  wire                when_UartCtrlRx_l111;
  wire                when_UartCtrlRx_l113;
  wire                when_UartCtrlRx_l125;
  wire                when_UartCtrlRx_l136;
  wire                when_UartCtrlRx_l139;
  `ifndef SYNTHESIS
  reg [23:0] io_configFrame_stop_string;
  reg [31:0] io_configFrame_parity_string;
  reg [47:0] stateMachine_state_string;
  `endif


  assign _zz_when_UartCtrlRx_l139_1 = ((io_configFrame_stop == `UartStopType_binary_sequential_ONE) ? 1'b0 : 1'b1);
  assign _zz_when_UartCtrlRx_l139 = {2'd0, _zz_when_UartCtrlRx_l139_1};
  BufferCC io_rxd_buffercc (
    .io_dataIn                (io_rxd                      ), //i
    .io_dataOut               (io_rxd_buffercc_io_dataOut  ), //o
    .io_mainClk               (io_mainClk                  ), //i
    .resetCtrl_systemReset    (resetCtrl_systemReset       )  //i
  );
  `ifndef SYNTHESIS
  always @(*) begin
    case(io_configFrame_stop)
      `UartStopType_binary_sequential_ONE : io_configFrame_stop_string = "ONE";
      `UartStopType_binary_sequential_TWO : io_configFrame_stop_string = "TWO";
      default : io_configFrame_stop_string = "???";
    endcase
  end
  always @(*) begin
    case(io_configFrame_parity)
      `UartParityType_binary_sequential_NONE : io_configFrame_parity_string = "NONE";
      `UartParityType_binary_sequential_EVEN : io_configFrame_parity_string = "EVEN";
      `UartParityType_binary_sequential_ODD : io_configFrame_parity_string = "ODD ";
      default : io_configFrame_parity_string = "????";
    endcase
  end
  always @(*) begin
    case(stateMachine_state)
      `UartCtrlRxState_binary_sequential_IDLE : stateMachine_state_string = "IDLE  ";
      `UartCtrlRxState_binary_sequential_START : stateMachine_state_string = "START ";
      `UartCtrlRxState_binary_sequential_DATA : stateMachine_state_string = "DATA  ";
      `UartCtrlRxState_binary_sequential_PARITY : stateMachine_state_string = "PARITY";
      `UartCtrlRxState_binary_sequential_STOP : stateMachine_state_string = "STOP  ";
      default : stateMachine_state_string = "??????";
    endcase
  end
  `endif

  always @(*) begin
    io_error = 1'b0;
    case(stateMachine_state)
      `UartCtrlRxState_binary_sequential_IDLE : begin
      end
      `UartCtrlRxState_binary_sequential_START : begin
      end
      `UartCtrlRxState_binary_sequential_DATA : begin
      end
      `UartCtrlRxState_binary_sequential_PARITY : begin
        if(bitTimer_tick) begin
          if(!when_UartCtrlRx_l125) begin
            io_error = 1'b1;
          end
        end
      end
      default : begin
        if(bitTimer_tick) begin
          if(when_UartCtrlRx_l136) begin
            io_error = 1'b1;
          end
        end
      end
    endcase
  end

  assign io_rts = _zz_io_rts;
  assign sampler_synchroniser = io_rxd_buffercc_io_dataOut;
  assign sampler_samples_0 = sampler_synchroniser;
  always @(*) begin
    bitTimer_tick = 1'b0;
    if(sampler_tick) begin
      if(when_UartCtrlRx_l43) begin
        bitTimer_tick = 1'b1;
      end
    end
  end

  assign when_UartCtrlRx_l43 = (bitTimer_counter == 3'b000);
  assign break_valid = (break_counter == 7'h41);
  assign when_UartCtrlRx_l69 = (io_samplingTick && (! break_valid));
  assign io_break = break_valid;
  assign io_read_valid = stateMachine_validReg;
  assign when_UartCtrlRx_l93 = ((sampler_tick && (! sampler_value)) && (! break_valid));
  assign when_UartCtrlRx_l103 = (sampler_value == 1'b1);
  assign when_UartCtrlRx_l111 = (bitCounter_value == io_configFrame_dataLength);
  assign when_UartCtrlRx_l113 = (io_configFrame_parity == `UartParityType_binary_sequential_NONE);
  assign when_UartCtrlRx_l125 = (stateMachine_parity == sampler_value);
  assign when_UartCtrlRx_l136 = (! sampler_value);
  assign when_UartCtrlRx_l139 = (bitCounter_value == _zz_when_UartCtrlRx_l139);
  assign io_read_payload = stateMachine_shifter;
  always @(posedge io_mainClk or posedge resetCtrl_systemReset) begin
    if(resetCtrl_systemReset) begin
      _zz_io_rts <= 1'b0;
      sampler_samples_1 <= 1'b1;
      sampler_samples_2 <= 1'b1;
      sampler_value <= 1'b1;
      sampler_tick <= 1'b0;
      break_counter <= 7'h0;
      stateMachine_state <= `UartCtrlRxState_binary_sequential_IDLE;
      stateMachine_validReg <= 1'b0;
    end else begin
      _zz_io_rts <= (! io_read_ready);
      if(io_samplingTick) begin
        sampler_samples_1 <= sampler_samples_0;
      end
      if(io_samplingTick) begin
        sampler_samples_2 <= sampler_samples_1;
      end
      sampler_value <= (((1'b0 || ((1'b1 && sampler_samples_0) && sampler_samples_1)) || ((1'b1 && sampler_samples_0) && sampler_samples_2)) || ((1'b1 && sampler_samples_1) && sampler_samples_2));
      sampler_tick <= io_samplingTick;
      if(sampler_value) begin
        break_counter <= 7'h0;
      end else begin
        if(when_UartCtrlRx_l69) begin
          break_counter <= (break_counter + 7'h01);
        end
      end
      stateMachine_validReg <= 1'b0;
      case(stateMachine_state)
        `UartCtrlRxState_binary_sequential_IDLE : begin
          if(when_UartCtrlRx_l93) begin
            stateMachine_state <= `UartCtrlRxState_binary_sequential_START;
          end
        end
        `UartCtrlRxState_binary_sequential_START : begin
          if(bitTimer_tick) begin
            stateMachine_state <= `UartCtrlRxState_binary_sequential_DATA;
            if(when_UartCtrlRx_l103) begin
              stateMachine_state <= `UartCtrlRxState_binary_sequential_IDLE;
            end
          end
        end
        `UartCtrlRxState_binary_sequential_DATA : begin
          if(bitTimer_tick) begin
            if(when_UartCtrlRx_l111) begin
              if(when_UartCtrlRx_l113) begin
                stateMachine_state <= `UartCtrlRxState_binary_sequential_STOP;
                stateMachine_validReg <= 1'b1;
              end else begin
                stateMachine_state <= `UartCtrlRxState_binary_sequential_PARITY;
              end
            end
          end
        end
        `UartCtrlRxState_binary_sequential_PARITY : begin
          if(bitTimer_tick) begin
            if(when_UartCtrlRx_l125) begin
              stateMachine_state <= `UartCtrlRxState_binary_sequential_STOP;
              stateMachine_validReg <= 1'b1;
            end else begin
              stateMachine_state <= `UartCtrlRxState_binary_sequential_IDLE;
            end
          end
        end
        default : begin
          if(bitTimer_tick) begin
            if(when_UartCtrlRx_l136) begin
              stateMachine_state <= `UartCtrlRxState_binary_sequential_IDLE;
            end else begin
              if(when_UartCtrlRx_l139) begin
                stateMachine_state <= `UartCtrlRxState_binary_sequential_IDLE;
              end
            end
          end
        end
      endcase
    end
  end

  always @(posedge io_mainClk) begin
    if(sampler_tick) begin
      bitTimer_counter <= (bitTimer_counter - 3'b001);
      if(when_UartCtrlRx_l43) begin
        bitTimer_counter <= 3'b100;
      end
    end
    if(bitTimer_tick) begin
      bitCounter_value <= (bitCounter_value + 3'b001);
    end
    if(bitTimer_tick) begin
      stateMachine_parity <= (stateMachine_parity ^ sampler_value);
    end
    case(stateMachine_state)
      `UartCtrlRxState_binary_sequential_IDLE : begin
        if(when_UartCtrlRx_l93) begin
          bitTimer_counter <= 3'b001;
        end
      end
      `UartCtrlRxState_binary_sequential_START : begin
        if(bitTimer_tick) begin
          bitCounter_value <= 3'b000;
          stateMachine_parity <= (io_configFrame_parity == `UartParityType_binary_sequential_ODD);
        end
      end
      `UartCtrlRxState_binary_sequential_DATA : begin
        if(bitTimer_tick) begin
          stateMachine_shifter[bitCounter_value] <= sampler_value;
          if(when_UartCtrlRx_l111) begin
            bitCounter_value <= 3'b000;
          end
        end
      end
      `UartCtrlRxState_binary_sequential_PARITY : begin
        if(bitTimer_tick) begin
          bitCounter_value <= 3'b000;
        end
      end
      default : begin
      end
    endcase
  end


endmodule

module UartCtrlTx (
  input      [2:0]    io_configFrame_dataLength,
  input      `UartStopType_binary_sequential_type io_configFrame_stop,
  input      `UartParityType_binary_sequential_type io_configFrame_parity,
  input               io_samplingTick,
  input               io_write_valid,
  output reg          io_write_ready,
  input      [7:0]    io_write_payload,
  input               io_cts,
  output              io_txd,
  input               io_break,
  input               io_mainClk,
  input               resetCtrl_systemReset
);
  wire       [2:0]    _zz_clockDivider_counter_valueNext;
  wire       [0:0]    _zz_clockDivider_counter_valueNext_1;
  wire       [2:0]    _zz_when_UartCtrlTx_l93;
  wire       [0:0]    _zz_when_UartCtrlTx_l93_1;
  reg                 clockDivider_counter_willIncrement;
  wire                clockDivider_counter_willClear;
  reg        [2:0]    clockDivider_counter_valueNext;
  reg        [2:0]    clockDivider_counter_value;
  wire                clockDivider_counter_willOverflowIfInc;
  wire                clockDivider_counter_willOverflow;
  reg        [2:0]    tickCounter_value;
  reg        `UartCtrlTxState_binary_sequential_type stateMachine_state;
  reg                 stateMachine_parity;
  reg                 stateMachine_txd;
  wire                when_UartCtrlTx_l58;
  wire                when_UartCtrlTx_l73;
  wire                when_UartCtrlTx_l76;
  wire                when_UartCtrlTx_l93;
  reg                 _zz_io_txd;
  `ifndef SYNTHESIS
  reg [23:0] io_configFrame_stop_string;
  reg [31:0] io_configFrame_parity_string;
  reg [47:0] stateMachine_state_string;
  `endif


  assign _zz_clockDivider_counter_valueNext_1 = clockDivider_counter_willIncrement;
  assign _zz_clockDivider_counter_valueNext = {2'd0, _zz_clockDivider_counter_valueNext_1};
  assign _zz_when_UartCtrlTx_l93_1 = ((io_configFrame_stop == `UartStopType_binary_sequential_ONE) ? 1'b0 : 1'b1);
  assign _zz_when_UartCtrlTx_l93 = {2'd0, _zz_when_UartCtrlTx_l93_1};
  `ifndef SYNTHESIS
  always @(*) begin
    case(io_configFrame_stop)
      `UartStopType_binary_sequential_ONE : io_configFrame_stop_string = "ONE";
      `UartStopType_binary_sequential_TWO : io_configFrame_stop_string = "TWO";
      default : io_configFrame_stop_string = "???";
    endcase
  end
  always @(*) begin
    case(io_configFrame_parity)
      `UartParityType_binary_sequential_NONE : io_configFrame_parity_string = "NONE";
      `UartParityType_binary_sequential_EVEN : io_configFrame_parity_string = "EVEN";
      `UartParityType_binary_sequential_ODD : io_configFrame_parity_string = "ODD ";
      default : io_configFrame_parity_string = "????";
    endcase
  end
  always @(*) begin
    case(stateMachine_state)
      `UartCtrlTxState_binary_sequential_IDLE : stateMachine_state_string = "IDLE  ";
      `UartCtrlTxState_binary_sequential_START : stateMachine_state_string = "START ";
      `UartCtrlTxState_binary_sequential_DATA : stateMachine_state_string = "DATA  ";
      `UartCtrlTxState_binary_sequential_PARITY : stateMachine_state_string = "PARITY";
      `UartCtrlTxState_binary_sequential_STOP : stateMachine_state_string = "STOP  ";
      default : stateMachine_state_string = "??????";
    endcase
  end
  `endif

  always @(*) begin
    clockDivider_counter_willIncrement = 1'b0;
    if(io_samplingTick) begin
      clockDivider_counter_willIncrement = 1'b1;
    end
  end

  assign clockDivider_counter_willClear = 1'b0;
  assign clockDivider_counter_willOverflowIfInc = (clockDivider_counter_value == 3'b100);
  assign clockDivider_counter_willOverflow = (clockDivider_counter_willOverflowIfInc && clockDivider_counter_willIncrement);
  always @(*) begin
    if(clockDivider_counter_willOverflow) begin
      clockDivider_counter_valueNext = 3'b000;
    end else begin
      clockDivider_counter_valueNext = (clockDivider_counter_value + _zz_clockDivider_counter_valueNext);
    end
    if(clockDivider_counter_willClear) begin
      clockDivider_counter_valueNext = 3'b000;
    end
  end

  always @(*) begin
    stateMachine_txd = 1'b1;
    case(stateMachine_state)
      `UartCtrlTxState_binary_sequential_IDLE : begin
      end
      `UartCtrlTxState_binary_sequential_START : begin
        stateMachine_txd = 1'b0;
      end
      `UartCtrlTxState_binary_sequential_DATA : begin
        stateMachine_txd = io_write_payload[tickCounter_value];
      end
      `UartCtrlTxState_binary_sequential_PARITY : begin
        stateMachine_txd = stateMachine_parity;
      end
      default : begin
      end
    endcase
  end

  always @(*) begin
    io_write_ready = io_break;
    case(stateMachine_state)
      `UartCtrlTxState_binary_sequential_IDLE : begin
      end
      `UartCtrlTxState_binary_sequential_START : begin
      end
      `UartCtrlTxState_binary_sequential_DATA : begin
        if(clockDivider_counter_willOverflow) begin
          if(when_UartCtrlTx_l73) begin
            io_write_ready = 1'b1;
          end
        end
      end
      `UartCtrlTxState_binary_sequential_PARITY : begin
      end
      default : begin
      end
    endcase
  end

  assign when_UartCtrlTx_l58 = ((io_write_valid && (! io_cts)) && clockDivider_counter_willOverflow);
  assign when_UartCtrlTx_l73 = (tickCounter_value == io_configFrame_dataLength);
  assign when_UartCtrlTx_l76 = (io_configFrame_parity == `UartParityType_binary_sequential_NONE);
  assign when_UartCtrlTx_l93 = (tickCounter_value == _zz_when_UartCtrlTx_l93);
  assign io_txd = _zz_io_txd;
  always @(posedge io_mainClk or posedge resetCtrl_systemReset) begin
    if(resetCtrl_systemReset) begin
      clockDivider_counter_value <= 3'b000;
      stateMachine_state <= `UartCtrlTxState_binary_sequential_IDLE;
      _zz_io_txd <= 1'b1;
    end else begin
      clockDivider_counter_value <= clockDivider_counter_valueNext;
      case(stateMachine_state)
        `UartCtrlTxState_binary_sequential_IDLE : begin
          if(when_UartCtrlTx_l58) begin
            stateMachine_state <= `UartCtrlTxState_binary_sequential_START;
          end
        end
        `UartCtrlTxState_binary_sequential_START : begin
          if(clockDivider_counter_willOverflow) begin
            stateMachine_state <= `UartCtrlTxState_binary_sequential_DATA;
          end
        end
        `UartCtrlTxState_binary_sequential_DATA : begin
          if(clockDivider_counter_willOverflow) begin
            if(when_UartCtrlTx_l73) begin
              if(when_UartCtrlTx_l76) begin
                stateMachine_state <= `UartCtrlTxState_binary_sequential_STOP;
              end else begin
                stateMachine_state <= `UartCtrlTxState_binary_sequential_PARITY;
              end
            end
          end
        end
        `UartCtrlTxState_binary_sequential_PARITY : begin
          if(clockDivider_counter_willOverflow) begin
            stateMachine_state <= `UartCtrlTxState_binary_sequential_STOP;
          end
        end
        default : begin
          if(clockDivider_counter_willOverflow) begin
            if(when_UartCtrlTx_l93) begin
              stateMachine_state <= (io_write_valid ? `UartCtrlTxState_binary_sequential_START : `UartCtrlTxState_binary_sequential_IDLE);
            end
          end
        end
      endcase
      _zz_io_txd <= (stateMachine_txd && (! io_break));
    end
  end

  always @(posedge io_mainClk) begin
    if(clockDivider_counter_willOverflow) begin
      tickCounter_value <= (tickCounter_value + 3'b001);
    end
    if(clockDivider_counter_willOverflow) begin
      stateMachine_parity <= (stateMachine_parity ^ stateMachine_txd);
    end
    case(stateMachine_state)
      `UartCtrlTxState_binary_sequential_IDLE : begin
      end
      `UartCtrlTxState_binary_sequential_START : begin
        if(clockDivider_counter_willOverflow) begin
          stateMachine_parity <= (io_configFrame_parity == `UartParityType_binary_sequential_ODD);
          tickCounter_value <= 3'b000;
        end
      end
      `UartCtrlTxState_binary_sequential_DATA : begin
        if(clockDivider_counter_willOverflow) begin
          if(when_UartCtrlTx_l73) begin
            tickCounter_value <= 3'b000;
          end
        end
      end
      `UartCtrlTxState_binary_sequential_PARITY : begin
        if(clockDivider_counter_willOverflow) begin
          tickCounter_value <= 3'b000;
        end
      end
      default : begin
      end
    endcase
  end


endmodule

module BufferCC_1 (
  input               io_dataIn,
  output              io_dataOut,
  input               io_mainClk,
  input               resetCtrl_mainClkReset
);
  (* async_reg = "true" *) reg                 buffers_0;
  (* async_reg = "true" *) reg                 buffers_1;

  assign io_dataOut = buffers_1;
  always @(posedge io_mainClk) begin
    buffers_0 <= io_dataIn;
    buffers_1 <= buffers_0;
  end


endmodule

module BufferCC (
  input               io_dataIn,
  output              io_dataOut,
  input               io_mainClk,
  input               resetCtrl_systemReset
);
  (* async_reg = "true" *) reg                 buffers_0;
  (* async_reg = "true" *) reg                 buffers_1;

  assign io_dataOut = buffers_1;
  always @(posedge io_mainClk or posedge resetCtrl_systemReset) begin
    if(resetCtrl_systemReset) begin
      buffers_0 <= 1'b0;
      buffers_1 <= 1'b0;
    end else begin
      buffers_0 <= io_dataIn;
      buffers_1 <= buffers_0;
    end
  end


endmodule
