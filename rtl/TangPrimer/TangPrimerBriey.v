// Generator : SpinalHDL v1.6.1    git head : 3bf789d53b1b5a36974196e2d591342e15ddf28c
// Component : TangPrimerBriey
// Git hash  : 4824827b7ed6331acfda1c2b0dd8c9fb7361cb96

`timescale 1ns/1ps 

module TangPrimerBriey (
  input               asyncReset,
  input               i_clk,
  output     [2:0]    o_rgb_led,
  input               jtag_tms,
  input               jtag_tdi,
  output              jtag_tdo,
  input               jtag_tck,
  output              uart_0_txd,
  input               uart_0_rxd,
  output     [0:0]    spi_0_ss,
  output              spi_0_sclk,
  output              spi_0_mosi,
  input               spi_0_miso,
  output              vga_vSync,
  output              vga_hSync,
  output              vga_colorEn,
  output     [4:0]    vga_color_r,
  output     [5:0]    vga_color_g,
  output     [4:0]    vga_color_b,
  output reg [2:0]    vga_color_r_low,
  output reg [1:0]    vga_color_g_low,
  output reg [2:0]    vga_color_b_low,
  output              vga_clk,
  output              vga_pwm,
   inout     [15:0]   gpioA,
   inout              i2c_0_scl,
   inout              i2c_0_sda,
  input               clk,
  input               reset
);

  wire                bufferCC_16_io_dataIn;
  wire                bufferCC_17_io_dataIn;
  wire                bufferCC_18_io_dataIn;
  wire                sdramArea_sdram_dm0;
  wire                sdramArea_sdram_dm1;
  wire                sdramArea_sdram_dm2;
  wire                sdramArea_sdram_dm3;
  wire                vgaArea_vgaCtrl_io_axi_ar_ready;
  wire       [7:0]    vgaArea_vgaCtrl_io_apb_PADDR;
  wire       [7:0]    axi_ledCtrl_io_apb_PADDR;
  wire       [3:0]    axi_gpioACtrl_io_apb_PADDR;
  wire       [7:0]    axi_timerCtrl_io_apb_PADDR;
  wire       [4:0]    axi_uartCtrl_io_apb_PADDR;
  wire       [7:0]    axi_i2cCtrl_io_apb_PADDR;
  wire       [7:0]    axi_spiCtrl_io_apb_PADDR;
  reg                 axi_core_cpu_dBus_cmd_ready;
  wire                axi_core_cpu_dBus_rsp_payload_last;
  wire                axi_core_cpu_dBus_rsp_payload_error;
  wire       [7:0]    axi_core_cpu_debug_bus_cmd_payload_address;
  wire                axi_core_cpu_iBus_rsp_payload_error;
  wire                streamFork_4_io_input_valid;
  reg                 streamFork_4_io_outputs_0_ready;
  reg                 streamFork_4_io_outputs_1_ready;
  reg                 dbus_axi_decoder_io_input_r_ready;
  wire       [22:0]   sdramCtrlArea_sdramCtrl_io_axi_arbiter_io_readInputs_0_ar_payload_addr;
  wire       [22:0]   sdramCtrlArea_sdramCtrl_io_axi_arbiter_io_readInputs_1_ar_payload_addr;
  wire       [22:0]   sdramCtrlArea_sdramCtrl_io_axi_arbiter_io_sharedInputs_0_arw_payload_addr;
  wire                sdramCtrlArea_sdramCtrl_io_axi_arbiter_io_output_arw_ready;
  wire                sdramCtrlArea_sdramCtrl_io_axi_arbiter_io_output_w_ready;
  wire       [14:0]   axi_ram_io_axi_arbiter_io_readInputs_0_ar_payload_addr;
  wire       [14:0]   axi_ram_io_axi_arbiter_io_sharedInputs_0_arw_payload_addr;
  wire                axi_ram_io_axi_arbiter_io_output_arw_ready;
  wire                axi_ram_io_axi_arbiter_io_output_w_ready;
  wire       [19:0]   axi_apbBridge_io_axi_arbiter_io_sharedInputs_0_arw_payload_addr;
  wire                axi_apbBridge_io_axi_arbiter_io_output_arw_ready;
  wire                axi_apbBridge_io_axi_arbiter_io_output_w_ready;
  wire                eG4S20PLL_1_extlock;
  wire                eG4S20PLL_1_clk0_out;
  wire                eG4S20PLL_1_clk1_out;
  wire                eG4S20PLL_1_clk2_out;
  wire                eG4S20PLL_1_clk3_out;
  wire                bufferCC_16_io_dataOut;
  wire                bufferCC_17_io_dataOut;
  wire                bufferCC_18_io_dataOut;
  wire                resetCtrl_axiReset_buffercc_io_dataOut;
  wire                resetCtrl_axiReset_buffercc_1_io_dataOut;
  wire                resetCtrl_axiReset_buffercc_2_io_dataOut;
  wire                sdramCtrlArea_sdramCtrl_io_axi_arw_ready;
  wire                sdramCtrlArea_sdramCtrl_io_axi_w_ready;
  wire                sdramCtrlArea_sdramCtrl_io_axi_b_valid;
  wire       [3:0]    sdramCtrlArea_sdramCtrl_io_axi_b_payload_id;
  wire       [1:0]    sdramCtrlArea_sdramCtrl_io_axi_b_payload_resp;
  wire                sdramCtrlArea_sdramCtrl_io_axi_r_valid;
  wire       [31:0]   sdramCtrlArea_sdramCtrl_io_axi_r_payload_data;
  wire       [3:0]    sdramCtrlArea_sdramCtrl_io_axi_r_payload_id;
  wire       [1:0]    sdramCtrlArea_sdramCtrl_io_axi_r_payload_resp;
  wire                sdramCtrlArea_sdramCtrl_io_axi_r_payload_last;
  wire       [10:0]   sdramCtrlArea_sdramCtrl_io_sdram_ADDR;
  wire       [1:0]    sdramCtrlArea_sdramCtrl_io_sdram_BA;
  wire                sdramCtrlArea_sdramCtrl_io_sdram_CASn;
  wire                sdramCtrlArea_sdramCtrl_io_sdram_CKE;
  wire                sdramCtrlArea_sdramCtrl_io_sdram_CSn;
  wire       [3:0]    sdramCtrlArea_sdramCtrl_io_sdram_DQM;
  wire                sdramCtrlArea_sdramCtrl_io_sdram_RASn;
  wire                sdramCtrlArea_sdramCtrl_io_sdram_WEn;
  wire       [31:0]   sdramCtrlArea_sdramCtrl_io_sdram_DQ_write;
  wire       [31:0]   sdramCtrlArea_sdramCtrl_io_sdram_DQ_writeEnable;
  wire       [31:0]   sdramArea_sdram_dq_read;
  wire                vgaArea_vgaCtrl_io_axi_ar_valid;
  wire       [31:0]   vgaArea_vgaCtrl_io_axi_ar_payload_addr;
  wire       [7:0]    vgaArea_vgaCtrl_io_axi_ar_payload_len;
  wire       [2:0]    vgaArea_vgaCtrl_io_axi_ar_payload_size;
  wire       [3:0]    vgaArea_vgaCtrl_io_axi_ar_payload_cache;
  wire       [2:0]    vgaArea_vgaCtrl_io_axi_ar_payload_prot;
  wire                vgaArea_vgaCtrl_io_axi_r_ready;
  wire                vgaArea_vgaCtrl_io_apb_PREADY;
  wire       [31:0]   vgaArea_vgaCtrl_io_apb_PRDATA;
  wire                vgaArea_vgaCtrl_io_vga_vSync;
  wire                vgaArea_vgaCtrl_io_vga_hSync;
  wire                vgaArea_vgaCtrl_io_vga_colorEn;
  wire       [4:0]    vgaArea_vgaCtrl_io_vga_color_r;
  wire       [5:0]    vgaArea_vgaCtrl_io_vga_color_g;
  wire       [4:0]    vgaArea_vgaCtrl_io_vga_color_b;
  wire                axi_ram_io_axi_arw_ready;
  wire                axi_ram_io_axi_w_ready;
  wire                axi_ram_io_axi_b_valid;
  wire       [3:0]    axi_ram_io_axi_b_payload_id;
  wire       [1:0]    axi_ram_io_axi_b_payload_resp;
  wire                axi_ram_io_axi_r_valid;
  wire       [31:0]   axi_ram_io_axi_r_payload_data;
  wire       [3:0]    axi_ram_io_axi_r_payload_id;
  wire       [1:0]    axi_ram_io_axi_r_payload_resp;
  wire                axi_ram_io_axi_r_payload_last;
  wire                axi_apbBridge_io_axi_arw_ready;
  wire                axi_apbBridge_io_axi_w_ready;
  wire                axi_apbBridge_io_axi_b_valid;
  wire       [3:0]    axi_apbBridge_io_axi_b_payload_id;
  wire       [1:0]    axi_apbBridge_io_axi_b_payload_resp;
  wire                axi_apbBridge_io_axi_r_valid;
  wire       [31:0]   axi_apbBridge_io_axi_r_payload_data;
  wire       [3:0]    axi_apbBridge_io_axi_r_payload_id;
  wire       [1:0]    axi_apbBridge_io_axi_r_payload_resp;
  wire                axi_apbBridge_io_axi_r_payload_last;
  wire       [19:0]   axi_apbBridge_io_apb_PADDR;
  wire       [0:0]    axi_apbBridge_io_apb_PSEL;
  wire                axi_apbBridge_io_apb_PENABLE;
  wire                axi_apbBridge_io_apb_PWRITE;
  wire       [31:0]   axi_apbBridge_io_apb_PWDATA;
  wire                axi_ledCtrl_io_apb_PREADY;
  wire       [31:0]   axi_ledCtrl_io_apb_PRDATA;
  wire                axi_ledCtrl_io_apb_PSLVERROR;
  wire       [2:0]    axi_ledCtrl_io_leds;
  wire                axi_gpioACtrl_io_apb_PREADY;
  wire       [31:0]   axi_gpioACtrl_io_apb_PRDATA;
  wire                axi_gpioACtrl_io_apb_PSLVERROR;
  wire       [15:0]   axi_gpioACtrl_io_gpio_write;
  wire       [15:0]   axi_gpioACtrl_io_gpio_writeEnable;
  wire       [15:0]   axi_gpioACtrl_io_value;
  wire                axi_timerCtrl_io_apb_PREADY;
  wire       [31:0]   axi_timerCtrl_io_apb_PRDATA;
  wire                axi_timerCtrl_io_apb_PSLVERROR;
  wire                axi_timerCtrl_io_interrupt;
  wire                axi_uartCtrl_io_apb_PREADY;
  wire       [31:0]   axi_uartCtrl_io_apb_PRDATA;
  wire                axi_uartCtrl_io_uart_txd;
  wire                axi_uartCtrl_io_interrupt;
  wire                axi_i2cCtrl_io_apb_PREADY;
  wire       [31:0]   axi_i2cCtrl_io_apb_PRDATA;
  wire                axi_i2cCtrl_io_i2c_scl_write;
  wire                axi_i2cCtrl_io_i2c_sda_write;
  wire                axi_i2cCtrl_io_interrupt;
  wire                axi_spiCtrl_io_apb_PREADY;
  wire       [31:0]   axi_spiCtrl_io_apb_PRDATA;
  wire                axi_spiCtrl_io_spi_sclk;
  wire                axi_spiCtrl_io_spi_mosi;
  wire       [0:0]    axi_spiCtrl_io_spi_ss;
  wire                axi_spiCtrl_io_interrupt;
  wire                axi_core_cpu_dBus_cmd_valid;
  wire                axi_core_cpu_dBus_cmd_payload_wr;
  wire                axi_core_cpu_dBus_cmd_payload_uncached;
  wire       [31:0]   axi_core_cpu_dBus_cmd_payload_address;
  wire       [31:0]   axi_core_cpu_dBus_cmd_payload_data;
  wire       [3:0]    axi_core_cpu_dBus_cmd_payload_mask;
  wire       [2:0]    axi_core_cpu_dBus_cmd_payload_size;
  wire                axi_core_cpu_dBus_cmd_payload_last;
  wire                axi_core_cpu_debug_bus_cmd_ready;
  wire       [31:0]   axi_core_cpu_debug_bus_rsp_data;
  wire                axi_core_cpu_debug_resetOut;
  wire                axi_core_cpu_iBus_cmd_valid;
  wire       [31:0]   axi_core_cpu_iBus_cmd_payload_address;
  wire       [2:0]    axi_core_cpu_iBus_cmd_payload_size;
  wire                streamFork_4_io_input_ready;
  wire                streamFork_4_io_outputs_0_valid;
  wire                streamFork_4_io_outputs_0_payload_wr;
  wire                streamFork_4_io_outputs_0_payload_uncached;
  wire       [31:0]   streamFork_4_io_outputs_0_payload_address;
  wire       [31:0]   streamFork_4_io_outputs_0_payload_data;
  wire       [3:0]    streamFork_4_io_outputs_0_payload_mask;
  wire       [2:0]    streamFork_4_io_outputs_0_payload_size;
  wire                streamFork_4_io_outputs_0_payload_last;
  wire                streamFork_4_io_outputs_1_valid;
  wire                streamFork_4_io_outputs_1_payload_wr;
  wire                streamFork_4_io_outputs_1_payload_uncached;
  wire       [31:0]   streamFork_4_io_outputs_1_payload_address;
  wire       [31:0]   streamFork_4_io_outputs_1_payload_data;
  wire       [3:0]    streamFork_4_io_outputs_1_payload_mask;
  wire       [2:0]    streamFork_4_io_outputs_1_payload_size;
  wire                streamFork_4_io_outputs_1_payload_last;
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
  wire                axi4ReadOnlyDecoder_2_io_input_ar_ready;
  wire                axi4ReadOnlyDecoder_2_io_input_r_valid;
  wire       [31:0]   axi4ReadOnlyDecoder_2_io_input_r_payload_data;
  wire       [1:0]    axi4ReadOnlyDecoder_2_io_input_r_payload_resp;
  wire                axi4ReadOnlyDecoder_2_io_input_r_payload_last;
  wire                axi4ReadOnlyDecoder_2_io_outputs_0_ar_valid;
  wire       [31:0]   axi4ReadOnlyDecoder_2_io_outputs_0_ar_payload_addr;
  wire       [7:0]    axi4ReadOnlyDecoder_2_io_outputs_0_ar_payload_len;
  wire       [1:0]    axi4ReadOnlyDecoder_2_io_outputs_0_ar_payload_burst;
  wire       [3:0]    axi4ReadOnlyDecoder_2_io_outputs_0_ar_payload_cache;
  wire       [2:0]    axi4ReadOnlyDecoder_2_io_outputs_0_ar_payload_prot;
  wire                axi4ReadOnlyDecoder_2_io_outputs_0_r_ready;
  wire                axi4ReadOnlyDecoder_2_io_outputs_1_ar_valid;
  wire       [31:0]   axi4ReadOnlyDecoder_2_io_outputs_1_ar_payload_addr;
  wire       [7:0]    axi4ReadOnlyDecoder_2_io_outputs_1_ar_payload_len;
  wire       [1:0]    axi4ReadOnlyDecoder_2_io_outputs_1_ar_payload_burst;
  wire       [3:0]    axi4ReadOnlyDecoder_2_io_outputs_1_ar_payload_cache;
  wire       [2:0]    axi4ReadOnlyDecoder_2_io_outputs_1_ar_payload_prot;
  wire                axi4ReadOnlyDecoder_2_io_outputs_1_r_ready;
  wire                dbus_axi_decoder_io_input_arw_ready;
  wire                dbus_axi_decoder_io_input_w_ready;
  wire                dbus_axi_decoder_io_input_b_valid;
  wire       [1:0]    dbus_axi_decoder_io_input_b_payload_resp;
  wire                dbus_axi_decoder_io_input_r_valid;
  wire       [31:0]   dbus_axi_decoder_io_input_r_payload_data;
  wire       [1:0]    dbus_axi_decoder_io_input_r_payload_resp;
  wire                dbus_axi_decoder_io_input_r_payload_last;
  wire                dbus_axi_decoder_io_sharedOutputs_0_arw_valid;
  wire       [31:0]   dbus_axi_decoder_io_sharedOutputs_0_arw_payload_addr;
  wire       [7:0]    dbus_axi_decoder_io_sharedOutputs_0_arw_payload_len;
  wire       [2:0]    dbus_axi_decoder_io_sharedOutputs_0_arw_payload_size;
  wire       [3:0]    dbus_axi_decoder_io_sharedOutputs_0_arw_payload_cache;
  wire       [2:0]    dbus_axi_decoder_io_sharedOutputs_0_arw_payload_prot;
  wire                dbus_axi_decoder_io_sharedOutputs_0_arw_payload_write;
  wire                dbus_axi_decoder_io_sharedOutputs_0_w_valid;
  wire       [31:0]   dbus_axi_decoder_io_sharedOutputs_0_w_payload_data;
  wire       [3:0]    dbus_axi_decoder_io_sharedOutputs_0_w_payload_strb;
  wire                dbus_axi_decoder_io_sharedOutputs_0_w_payload_last;
  wire                dbus_axi_decoder_io_sharedOutputs_0_b_ready;
  wire                dbus_axi_decoder_io_sharedOutputs_0_r_ready;
  wire                dbus_axi_decoder_io_sharedOutputs_1_arw_valid;
  wire       [31:0]   dbus_axi_decoder_io_sharedOutputs_1_arw_payload_addr;
  wire       [7:0]    dbus_axi_decoder_io_sharedOutputs_1_arw_payload_len;
  wire       [2:0]    dbus_axi_decoder_io_sharedOutputs_1_arw_payload_size;
  wire       [3:0]    dbus_axi_decoder_io_sharedOutputs_1_arw_payload_cache;
  wire       [2:0]    dbus_axi_decoder_io_sharedOutputs_1_arw_payload_prot;
  wire                dbus_axi_decoder_io_sharedOutputs_1_arw_payload_write;
  wire                dbus_axi_decoder_io_sharedOutputs_1_w_valid;
  wire       [31:0]   dbus_axi_decoder_io_sharedOutputs_1_w_payload_data;
  wire       [3:0]    dbus_axi_decoder_io_sharedOutputs_1_w_payload_strb;
  wire                dbus_axi_decoder_io_sharedOutputs_1_w_payload_last;
  wire                dbus_axi_decoder_io_sharedOutputs_1_b_ready;
  wire                dbus_axi_decoder_io_sharedOutputs_1_r_ready;
  wire                dbus_axi_decoder_io_sharedOutputs_2_arw_valid;
  wire       [31:0]   dbus_axi_decoder_io_sharedOutputs_2_arw_payload_addr;
  wire       [7:0]    dbus_axi_decoder_io_sharedOutputs_2_arw_payload_len;
  wire       [2:0]    dbus_axi_decoder_io_sharedOutputs_2_arw_payload_size;
  wire       [3:0]    dbus_axi_decoder_io_sharedOutputs_2_arw_payload_cache;
  wire       [2:0]    dbus_axi_decoder_io_sharedOutputs_2_arw_payload_prot;
  wire                dbus_axi_decoder_io_sharedOutputs_2_arw_payload_write;
  wire                dbus_axi_decoder_io_sharedOutputs_2_w_valid;
  wire       [31:0]   dbus_axi_decoder_io_sharedOutputs_2_w_payload_data;
  wire       [3:0]    dbus_axi_decoder_io_sharedOutputs_2_w_payload_strb;
  wire                dbus_axi_decoder_io_sharedOutputs_2_w_payload_last;
  wire                dbus_axi_decoder_io_sharedOutputs_2_b_ready;
  wire                dbus_axi_decoder_io_sharedOutputs_2_r_ready;
  wire                vgaArea_vgaCtrl_io_axi_decoder_io_input_ar_ready;
  wire                vgaArea_vgaCtrl_io_axi_decoder_io_input_r_valid;
  wire       [31:0]   vgaArea_vgaCtrl_io_axi_decoder_io_input_r_payload_data;
  wire                vgaArea_vgaCtrl_io_axi_decoder_io_input_r_payload_last;
  wire                vgaArea_vgaCtrl_io_axi_decoder_io_outputs_0_ar_valid;
  wire       [31:0]   vgaArea_vgaCtrl_io_axi_decoder_io_outputs_0_ar_payload_addr;
  wire       [7:0]    vgaArea_vgaCtrl_io_axi_decoder_io_outputs_0_ar_payload_len;
  wire       [2:0]    vgaArea_vgaCtrl_io_axi_decoder_io_outputs_0_ar_payload_size;
  wire       [3:0]    vgaArea_vgaCtrl_io_axi_decoder_io_outputs_0_ar_payload_cache;
  wire       [2:0]    vgaArea_vgaCtrl_io_axi_decoder_io_outputs_0_ar_payload_prot;
  wire                vgaArea_vgaCtrl_io_axi_decoder_io_outputs_0_r_ready;
  wire                sdramCtrlArea_sdramCtrl_io_axi_arbiter_io_readInputs_0_ar_ready;
  wire                sdramCtrlArea_sdramCtrl_io_axi_arbiter_io_readInputs_0_r_valid;
  wire       [31:0]   sdramCtrlArea_sdramCtrl_io_axi_arbiter_io_readInputs_0_r_payload_data;
  wire       [1:0]    sdramCtrlArea_sdramCtrl_io_axi_arbiter_io_readInputs_0_r_payload_id;
  wire       [1:0]    sdramCtrlArea_sdramCtrl_io_axi_arbiter_io_readInputs_0_r_payload_resp;
  wire                sdramCtrlArea_sdramCtrl_io_axi_arbiter_io_readInputs_0_r_payload_last;
  wire                sdramCtrlArea_sdramCtrl_io_axi_arbiter_io_readInputs_1_ar_ready;
  wire                sdramCtrlArea_sdramCtrl_io_axi_arbiter_io_readInputs_1_r_valid;
  wire       [31:0]   sdramCtrlArea_sdramCtrl_io_axi_arbiter_io_readInputs_1_r_payload_data;
  wire       [1:0]    sdramCtrlArea_sdramCtrl_io_axi_arbiter_io_readInputs_1_r_payload_id;
  wire       [1:0]    sdramCtrlArea_sdramCtrl_io_axi_arbiter_io_readInputs_1_r_payload_resp;
  wire                sdramCtrlArea_sdramCtrl_io_axi_arbiter_io_readInputs_1_r_payload_last;
  wire                sdramCtrlArea_sdramCtrl_io_axi_arbiter_io_sharedInputs_0_arw_ready;
  wire                sdramCtrlArea_sdramCtrl_io_axi_arbiter_io_sharedInputs_0_w_ready;
  wire                sdramCtrlArea_sdramCtrl_io_axi_arbiter_io_sharedInputs_0_b_valid;
  wire       [1:0]    sdramCtrlArea_sdramCtrl_io_axi_arbiter_io_sharedInputs_0_b_payload_id;
  wire       [1:0]    sdramCtrlArea_sdramCtrl_io_axi_arbiter_io_sharedInputs_0_b_payload_resp;
  wire                sdramCtrlArea_sdramCtrl_io_axi_arbiter_io_sharedInputs_0_r_valid;
  wire       [31:0]   sdramCtrlArea_sdramCtrl_io_axi_arbiter_io_sharedInputs_0_r_payload_data;
  wire       [1:0]    sdramCtrlArea_sdramCtrl_io_axi_arbiter_io_sharedInputs_0_r_payload_id;
  wire       [1:0]    sdramCtrlArea_sdramCtrl_io_axi_arbiter_io_sharedInputs_0_r_payload_resp;
  wire                sdramCtrlArea_sdramCtrl_io_axi_arbiter_io_sharedInputs_0_r_payload_last;
  wire                sdramCtrlArea_sdramCtrl_io_axi_arbiter_io_output_arw_valid;
  wire       [22:0]   sdramCtrlArea_sdramCtrl_io_axi_arbiter_io_output_arw_payload_addr;
  wire       [3:0]    sdramCtrlArea_sdramCtrl_io_axi_arbiter_io_output_arw_payload_id;
  wire       [7:0]    sdramCtrlArea_sdramCtrl_io_axi_arbiter_io_output_arw_payload_len;
  wire       [2:0]    sdramCtrlArea_sdramCtrl_io_axi_arbiter_io_output_arw_payload_size;
  wire       [1:0]    sdramCtrlArea_sdramCtrl_io_axi_arbiter_io_output_arw_payload_burst;
  wire                sdramCtrlArea_sdramCtrl_io_axi_arbiter_io_output_arw_payload_write;
  wire                sdramCtrlArea_sdramCtrl_io_axi_arbiter_io_output_w_valid;
  wire       [31:0]   sdramCtrlArea_sdramCtrl_io_axi_arbiter_io_output_w_payload_data;
  wire       [3:0]    sdramCtrlArea_sdramCtrl_io_axi_arbiter_io_output_w_payload_strb;
  wire                sdramCtrlArea_sdramCtrl_io_axi_arbiter_io_output_w_payload_last;
  wire                sdramCtrlArea_sdramCtrl_io_axi_arbiter_io_output_b_ready;
  wire                sdramCtrlArea_sdramCtrl_io_axi_arbiter_io_output_r_ready;
  wire                axi_ram_io_axi_arbiter_io_readInputs_0_ar_ready;
  wire                axi_ram_io_axi_arbiter_io_readInputs_0_r_valid;
  wire       [31:0]   axi_ram_io_axi_arbiter_io_readInputs_0_r_payload_data;
  wire       [2:0]    axi_ram_io_axi_arbiter_io_readInputs_0_r_payload_id;
  wire       [1:0]    axi_ram_io_axi_arbiter_io_readInputs_0_r_payload_resp;
  wire                axi_ram_io_axi_arbiter_io_readInputs_0_r_payload_last;
  wire                axi_ram_io_axi_arbiter_io_sharedInputs_0_arw_ready;
  wire                axi_ram_io_axi_arbiter_io_sharedInputs_0_w_ready;
  wire                axi_ram_io_axi_arbiter_io_sharedInputs_0_b_valid;
  wire       [2:0]    axi_ram_io_axi_arbiter_io_sharedInputs_0_b_payload_id;
  wire       [1:0]    axi_ram_io_axi_arbiter_io_sharedInputs_0_b_payload_resp;
  wire                axi_ram_io_axi_arbiter_io_sharedInputs_0_r_valid;
  wire       [31:0]   axi_ram_io_axi_arbiter_io_sharedInputs_0_r_payload_data;
  wire       [2:0]    axi_ram_io_axi_arbiter_io_sharedInputs_0_r_payload_id;
  wire       [1:0]    axi_ram_io_axi_arbiter_io_sharedInputs_0_r_payload_resp;
  wire                axi_ram_io_axi_arbiter_io_sharedInputs_0_r_payload_last;
  wire                axi_ram_io_axi_arbiter_io_output_arw_valid;
  wire       [14:0]   axi_ram_io_axi_arbiter_io_output_arw_payload_addr;
  wire       [3:0]    axi_ram_io_axi_arbiter_io_output_arw_payload_id;
  wire       [7:0]    axi_ram_io_axi_arbiter_io_output_arw_payload_len;
  wire       [2:0]    axi_ram_io_axi_arbiter_io_output_arw_payload_size;
  wire       [1:0]    axi_ram_io_axi_arbiter_io_output_arw_payload_burst;
  wire                axi_ram_io_axi_arbiter_io_output_arw_payload_write;
  wire                axi_ram_io_axi_arbiter_io_output_w_valid;
  wire       [31:0]   axi_ram_io_axi_arbiter_io_output_w_payload_data;
  wire       [3:0]    axi_ram_io_axi_arbiter_io_output_w_payload_strb;
  wire                axi_ram_io_axi_arbiter_io_output_w_payload_last;
  wire                axi_ram_io_axi_arbiter_io_output_b_ready;
  wire                axi_ram_io_axi_arbiter_io_output_r_ready;
  wire                axi_apbBridge_io_axi_arbiter_io_sharedInputs_0_arw_ready;
  wire                axi_apbBridge_io_axi_arbiter_io_sharedInputs_0_w_ready;
  wire                axi_apbBridge_io_axi_arbiter_io_sharedInputs_0_b_valid;
  wire       [3:0]    axi_apbBridge_io_axi_arbiter_io_sharedInputs_0_b_payload_id;
  wire       [1:0]    axi_apbBridge_io_axi_arbiter_io_sharedInputs_0_b_payload_resp;
  wire                axi_apbBridge_io_axi_arbiter_io_sharedInputs_0_r_valid;
  wire       [31:0]   axi_apbBridge_io_axi_arbiter_io_sharedInputs_0_r_payload_data;
  wire       [3:0]    axi_apbBridge_io_axi_arbiter_io_sharedInputs_0_r_payload_id;
  wire       [1:0]    axi_apbBridge_io_axi_arbiter_io_sharedInputs_0_r_payload_resp;
  wire                axi_apbBridge_io_axi_arbiter_io_sharedInputs_0_r_payload_last;
  wire                axi_apbBridge_io_axi_arbiter_io_output_arw_valid;
  wire       [19:0]   axi_apbBridge_io_axi_arbiter_io_output_arw_payload_addr;
  wire       [3:0]    axi_apbBridge_io_axi_arbiter_io_output_arw_payload_id;
  wire       [7:0]    axi_apbBridge_io_axi_arbiter_io_output_arw_payload_len;
  wire       [2:0]    axi_apbBridge_io_axi_arbiter_io_output_arw_payload_size;
  wire       [1:0]    axi_apbBridge_io_axi_arbiter_io_output_arw_payload_burst;
  wire                axi_apbBridge_io_axi_arbiter_io_output_arw_payload_write;
  wire                axi_apbBridge_io_axi_arbiter_io_output_w_valid;
  wire       [31:0]   axi_apbBridge_io_axi_arbiter_io_output_w_payload_data;
  wire       [3:0]    axi_apbBridge_io_axi_arbiter_io_output_w_payload_strb;
  wire                axi_apbBridge_io_axi_arbiter_io_output_w_payload_last;
  wire                axi_apbBridge_io_axi_arbiter_io_output_b_ready;
  wire                axi_apbBridge_io_axi_arbiter_io_output_r_ready;
  wire                io_apb_decoder_io_input_PREADY;
  wire       [31:0]   io_apb_decoder_io_input_PRDATA;
  wire                io_apb_decoder_io_input_PSLVERROR;
  wire       [19:0]   io_apb_decoder_io_output_PADDR;
  wire       [6:0]    io_apb_decoder_io_output_PSEL;
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
  wire       [19:0]   apb3Router_1_io_outputs_6_PADDR;
  wire       [0:0]    apb3Router_1_io_outputs_6_PSEL;
  wire                apb3Router_1_io_outputs_6_PENABLE;
  wire                apb3Router_1_io_outputs_6_PWRITE;
  wire       [31:0]   apb3Router_1_io_outputs_6_PWDATA;
  wire       [2:0]    _zz_dbus_axi_arw_payload_len;
  wire       [0:0]    _zz_when_InOutWrapper_l48_2;
  wire       [0:0]    _zz_when_InOutWrapper_l48_1_1;
  wire       [0:0]    _zz_i2c_0_scl_1;
  wire       [0:0]    _zz_i2c_0_sda_1;
  reg                 _zz_i2c_0_sda;
  reg                 _zz_i2c_0_scl;
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
  wire       [15:0]   _zz_io_gpio_read;
  wire       [15:0]   _zz_gpioA_16;
  wire       [15:0]   _zz_when_InOutWrapper_l65;
  wire                _zz_when_InOutWrapper_l48;
  wire                _zz_io_i2c_sda_read;
  wire                _zz_when_InOutWrapper_l48_1;
  wire                _zz_io_i2c_scl_read;
  wire                pll_locked;
  wire                axiClk;
  wire                sdramClk;
  wire                sdramCtrlClk;
  wire                vgaClk;
  reg                 resetCtrl_systemResetUnbuffered;
  reg        [5:0]    resetCtrl_systemResetCounter;
  wire       [5:0]    _zz_when_TangPrimerBriey_l338;
  wire                when_TangPrimerBriey_l338;
  wire                when_TangPrimerBriey_l342;
  (* async_reg = "true" *) reg                 resetCtrl_systemReset;
  (* async_reg = "true" *) reg                 resetCtrl_axiReset;
  wire                resetCtrl_vgaReset;
  wire                resetCtrl_sdramReset;
  wire                resetCtrl_sdramCtrlReset;
  wire                axi_core_externalInterrupt;
  wire                _zz_io_input_ar_valid;
  wire                _zz_iBus_cmd_ready;
  wire       [31:0]   _zz_io_input_ar_payload_addr;
  wire                _zz_iBus_rsp_valid;
  wire       [31:0]   _zz_iBus_rsp_payload_data;
  wire       [1:0]    _zz_iBus_rsp_payload_error;
  wire                dbus_axi_arw_valid;
  wire                dbus_axi_arw_ready;
  wire       [31:0]   dbus_axi_arw_payload_addr;
  wire       [7:0]    dbus_axi_arw_payload_len;
  wire       [2:0]    dbus_axi_arw_payload_size;
  wire       [3:0]    dbus_axi_arw_payload_cache;
  wire       [2:0]    dbus_axi_arw_payload_prot;
  wire                dbus_axi_arw_payload_write;
  wire                dbus_axi_w_valid;
  wire                dbus_axi_w_ready;
  wire       [31:0]   dbus_axi_w_payload_data;
  wire       [3:0]    dbus_axi_w_payload_strb;
  wire                dbus_axi_w_payload_last;
  wire                dbus_axi_b_valid;
  wire                dbus_axi_b_ready;
  wire       [1:0]    dbus_axi_b_payload_resp;
  wire                dbus_axi_r_valid;
  wire                dbus_axi_r_ready;
  wire       [31:0]   dbus_axi_r_payload_data;
  wire       [1:0]    dbus_axi_r_payload_resp;
  wire                dbus_axi_r_payload_last;
  wire                axi_core_cpu_dBus_cmd_m2sPipe_valid;
  reg                 axi_core_cpu_dBus_cmd_m2sPipe_ready;
  wire                axi_core_cpu_dBus_cmd_m2sPipe_payload_wr;
  wire                axi_core_cpu_dBus_cmd_m2sPipe_payload_uncached;
  wire       [31:0]   axi_core_cpu_dBus_cmd_m2sPipe_payload_address;
  wire       [31:0]   axi_core_cpu_dBus_cmd_m2sPipe_payload_data;
  wire       [3:0]    axi_core_cpu_dBus_cmd_m2sPipe_payload_mask;
  wire       [2:0]    axi_core_cpu_dBus_cmd_m2sPipe_payload_size;
  wire                axi_core_cpu_dBus_cmd_m2sPipe_payload_last;
  reg                 axi_core_cpu_dBus_cmd_rValid;
  reg                 axi_core_cpu_dBus_cmd_rData_wr;
  reg                 axi_core_cpu_dBus_cmd_rData_uncached;
  reg        [31:0]   axi_core_cpu_dBus_cmd_rData_address;
  reg        [31:0]   axi_core_cpu_dBus_cmd_rData_data;
  reg        [3:0]    axi_core_cpu_dBus_cmd_rData_mask;
  reg        [2:0]    axi_core_cpu_dBus_cmd_rData_size;
  reg                 axi_core_cpu_dBus_cmd_rData_last;
  wire                when_Stream_l342;
  wire                axi_core_cpu_dBus_cmd_m2sPipe_m2sPipe_valid;
  wire                axi_core_cpu_dBus_cmd_m2sPipe_m2sPipe_ready;
  wire                axi_core_cpu_dBus_cmd_m2sPipe_m2sPipe_payload_wr;
  wire                axi_core_cpu_dBus_cmd_m2sPipe_m2sPipe_payload_uncached;
  wire       [31:0]   axi_core_cpu_dBus_cmd_m2sPipe_m2sPipe_payload_address;
  wire       [31:0]   axi_core_cpu_dBus_cmd_m2sPipe_m2sPipe_payload_data;
  wire       [3:0]    axi_core_cpu_dBus_cmd_m2sPipe_m2sPipe_payload_mask;
  wire       [2:0]    axi_core_cpu_dBus_cmd_m2sPipe_m2sPipe_payload_size;
  wire                axi_core_cpu_dBus_cmd_m2sPipe_m2sPipe_payload_last;
  reg                 axi_core_cpu_dBus_cmd_m2sPipe_rValid;
  reg                 axi_core_cpu_dBus_cmd_m2sPipe_rData_wr;
  reg                 axi_core_cpu_dBus_cmd_m2sPipe_rData_uncached;
  reg        [31:0]   axi_core_cpu_dBus_cmd_m2sPipe_rData_address;
  reg        [31:0]   axi_core_cpu_dBus_cmd_m2sPipe_rData_data;
  reg        [3:0]    axi_core_cpu_dBus_cmd_m2sPipe_rData_mask;
  reg        [2:0]    axi_core_cpu_dBus_cmd_m2sPipe_rData_size;
  reg                 axi_core_cpu_dBus_cmd_m2sPipe_rData_last;
  wire                when_Stream_l342_1;
  wire                axi_core_cpu_dBus_cmd_m2sPipe_m2sPipe_s2mPipe_valid;
  wire                axi_core_cpu_dBus_cmd_m2sPipe_m2sPipe_s2mPipe_ready;
  wire                axi_core_cpu_dBus_cmd_m2sPipe_m2sPipe_s2mPipe_payload_wr;
  wire                axi_core_cpu_dBus_cmd_m2sPipe_m2sPipe_s2mPipe_payload_uncached;
  wire       [31:0]   axi_core_cpu_dBus_cmd_m2sPipe_m2sPipe_s2mPipe_payload_address;
  wire       [31:0]   axi_core_cpu_dBus_cmd_m2sPipe_m2sPipe_s2mPipe_payload_data;
  wire       [3:0]    axi_core_cpu_dBus_cmd_m2sPipe_m2sPipe_s2mPipe_payload_mask;
  wire       [2:0]    axi_core_cpu_dBus_cmd_m2sPipe_m2sPipe_s2mPipe_payload_size;
  wire                axi_core_cpu_dBus_cmd_m2sPipe_m2sPipe_s2mPipe_payload_last;
  reg                 axi_core_cpu_dBus_cmd_m2sPipe_m2sPipe_rValid;
  reg                 axi_core_cpu_dBus_cmd_m2sPipe_m2sPipe_rData_wr;
  reg                 axi_core_cpu_dBus_cmd_m2sPipe_m2sPipe_rData_uncached;
  reg        [31:0]   axi_core_cpu_dBus_cmd_m2sPipe_m2sPipe_rData_address;
  reg        [31:0]   axi_core_cpu_dBus_cmd_m2sPipe_m2sPipe_rData_data;
  reg        [3:0]    axi_core_cpu_dBus_cmd_m2sPipe_m2sPipe_rData_mask;
  reg        [2:0]    axi_core_cpu_dBus_cmd_m2sPipe_m2sPipe_rData_size;
  reg                 axi_core_cpu_dBus_cmd_m2sPipe_m2sPipe_rData_last;
  wire                axi_core_cpu_dBus_cmd_m2sPipe_m2sPipe_s2mPipe_fire;
  wire                when_Utils_l594;
  wire                dbus_axi_b_fire;
  reg                 _zz_when_Utils_l622;
  reg                 _zz_when_Utils_l622_1;
  reg        [2:0]    _zz_axi_core_cpu_dBus_cmd_m2sPipe_m2sPipe_s2mPipe_ready;
  reg        [2:0]    _zz_axi_core_cpu_dBus_cmd_m2sPipe_m2sPipe_s2mPipe_ready_1;
  wire                when_Utils_l622;
  wire                when_Utils_l624;
  wire                _zz_axi_core_cpu_dBus_cmd_m2sPipe_m2sPipe_s2mPipe_ready_2;
  wire                streamFork_4_io_outputs_0_fire;
  reg                 _zz_1;
  reg                 streamFork_4_io_outputs_0_thrown_valid;
  wire                streamFork_4_io_outputs_0_thrown_ready;
  wire                streamFork_4_io_outputs_0_thrown_payload_wr;
  wire                streamFork_4_io_outputs_0_thrown_payload_uncached;
  wire       [31:0]   streamFork_4_io_outputs_0_thrown_payload_address;
  wire       [31:0]   streamFork_4_io_outputs_0_thrown_payload_data;
  wire       [3:0]    streamFork_4_io_outputs_0_thrown_payload_mask;
  wire       [2:0]    streamFork_4_io_outputs_0_thrown_payload_size;
  wire                streamFork_4_io_outputs_0_thrown_payload_last;
  wire                when_Stream_l408;
  reg                 streamFork_4_io_outputs_1_thrown_valid;
  wire                streamFork_4_io_outputs_1_thrown_ready;
  wire                streamFork_4_io_outputs_1_thrown_payload_wr;
  wire                streamFork_4_io_outputs_1_thrown_payload_uncached;
  wire       [31:0]   streamFork_4_io_outputs_1_thrown_payload_address;
  wire       [31:0]   streamFork_4_io_outputs_1_thrown_payload_data;
  wire       [3:0]    streamFork_4_io_outputs_1_thrown_payload_mask;
  wire       [2:0]    streamFork_4_io_outputs_1_thrown_payload_size;
  wire                streamFork_4_io_outputs_1_thrown_payload_last;
  (* async_reg = "true" *) reg                 axi_core_cpu_debug_resetOut_regNext;
  wire                axi_core_cpu_debug_bus_cmd_fire;
  reg                 axi_core_cpu_debug_bus_cmd_fire_regNext;
  wire                axi4ReadOnlyDecoder_2_io_outputs_0_ar_validPipe_valid;
  wire                axi4ReadOnlyDecoder_2_io_outputs_0_ar_validPipe_ready;
  wire       [31:0]   axi4ReadOnlyDecoder_2_io_outputs_0_ar_validPipe_payload_addr;
  wire       [7:0]    axi4ReadOnlyDecoder_2_io_outputs_0_ar_validPipe_payload_len;
  wire       [1:0]    axi4ReadOnlyDecoder_2_io_outputs_0_ar_validPipe_payload_burst;
  wire       [3:0]    axi4ReadOnlyDecoder_2_io_outputs_0_ar_validPipe_payload_cache;
  wire       [2:0]    axi4ReadOnlyDecoder_2_io_outputs_0_ar_validPipe_payload_prot;
  reg                 axi4ReadOnlyDecoder_2_io_outputs_0_ar_rValid;
  wire                axi4ReadOnlyDecoder_2_io_outputs_0_ar_validPipe_fire;
  wire                axi4ReadOnlyDecoder_2_io_outputs_0_ar_validPipe_fire_1;
  wire                axi4ReadOnlyDecoder_2_io_outputs_1_ar_validPipe_valid;
  wire                axi4ReadOnlyDecoder_2_io_outputs_1_ar_validPipe_ready;
  wire       [31:0]   axi4ReadOnlyDecoder_2_io_outputs_1_ar_validPipe_payload_addr;
  wire       [7:0]    axi4ReadOnlyDecoder_2_io_outputs_1_ar_validPipe_payload_len;
  wire       [1:0]    axi4ReadOnlyDecoder_2_io_outputs_1_ar_validPipe_payload_burst;
  wire       [3:0]    axi4ReadOnlyDecoder_2_io_outputs_1_ar_validPipe_payload_cache;
  wire       [2:0]    axi4ReadOnlyDecoder_2_io_outputs_1_ar_validPipe_payload_prot;
  reg                 axi4ReadOnlyDecoder_2_io_outputs_1_ar_rValid;
  wire                axi4ReadOnlyDecoder_2_io_outputs_1_ar_validPipe_fire;
  wire                axi4ReadOnlyDecoder_2_io_outputs_1_ar_validPipe_fire_1;
  wire                dbus_axi_decoder_io_sharedOutputs_0_arw_validPipe_valid;
  wire                dbus_axi_decoder_io_sharedOutputs_0_arw_validPipe_ready;
  wire       [31:0]   dbus_axi_decoder_io_sharedOutputs_0_arw_validPipe_payload_addr;
  wire       [7:0]    dbus_axi_decoder_io_sharedOutputs_0_arw_validPipe_payload_len;
  wire       [2:0]    dbus_axi_decoder_io_sharedOutputs_0_arw_validPipe_payload_size;
  wire       [3:0]    dbus_axi_decoder_io_sharedOutputs_0_arw_validPipe_payload_cache;
  wire       [2:0]    dbus_axi_decoder_io_sharedOutputs_0_arw_validPipe_payload_prot;
  wire                dbus_axi_decoder_io_sharedOutputs_0_arw_validPipe_payload_write;
  reg                 dbus_axi_decoder_io_sharedOutputs_0_arw_rValid;
  wire                dbus_axi_decoder_io_sharedOutputs_0_arw_validPipe_fire;
  wire                dbus_axi_decoder_io_sharedOutputs_0_arw_validPipe_fire_1;
  wire                dbus_axi_decoder_io_sharedOutputs_1_arw_validPipe_valid;
  wire                dbus_axi_decoder_io_sharedOutputs_1_arw_validPipe_ready;
  wire       [31:0]   dbus_axi_decoder_io_sharedOutputs_1_arw_validPipe_payload_addr;
  wire       [7:0]    dbus_axi_decoder_io_sharedOutputs_1_arw_validPipe_payload_len;
  wire       [2:0]    dbus_axi_decoder_io_sharedOutputs_1_arw_validPipe_payload_size;
  wire       [3:0]    dbus_axi_decoder_io_sharedOutputs_1_arw_validPipe_payload_cache;
  wire       [2:0]    dbus_axi_decoder_io_sharedOutputs_1_arw_validPipe_payload_prot;
  wire                dbus_axi_decoder_io_sharedOutputs_1_arw_validPipe_payload_write;
  reg                 dbus_axi_decoder_io_sharedOutputs_1_arw_rValid;
  wire                dbus_axi_decoder_io_sharedOutputs_1_arw_validPipe_fire;
  wire                dbus_axi_decoder_io_sharedOutputs_1_arw_validPipe_fire_1;
  wire                dbus_axi_decoder_io_sharedOutputs_2_arw_validPipe_valid;
  wire                dbus_axi_decoder_io_sharedOutputs_2_arw_validPipe_ready;
  wire       [31:0]   dbus_axi_decoder_io_sharedOutputs_2_arw_validPipe_payload_addr;
  wire       [7:0]    dbus_axi_decoder_io_sharedOutputs_2_arw_validPipe_payload_len;
  wire       [2:0]    dbus_axi_decoder_io_sharedOutputs_2_arw_validPipe_payload_size;
  wire       [3:0]    dbus_axi_decoder_io_sharedOutputs_2_arw_validPipe_payload_cache;
  wire       [2:0]    dbus_axi_decoder_io_sharedOutputs_2_arw_validPipe_payload_prot;
  wire                dbus_axi_decoder_io_sharedOutputs_2_arw_validPipe_payload_write;
  reg                 dbus_axi_decoder_io_sharedOutputs_2_arw_rValid;
  wire                dbus_axi_decoder_io_sharedOutputs_2_arw_validPipe_fire;
  wire                dbus_axi_decoder_io_sharedOutputs_2_arw_validPipe_fire_1;
  wire                dbus_axi_decoder_io_input_r_m2sPipe_valid;
  wire                dbus_axi_decoder_io_input_r_m2sPipe_ready;
  wire       [31:0]   dbus_axi_decoder_io_input_r_m2sPipe_payload_data;
  wire       [1:0]    dbus_axi_decoder_io_input_r_m2sPipe_payload_resp;
  wire                dbus_axi_decoder_io_input_r_m2sPipe_payload_last;
  reg                 dbus_axi_decoder_io_input_r_rValid;
  reg        [31:0]   dbus_axi_decoder_io_input_r_rData_data;
  reg        [1:0]    dbus_axi_decoder_io_input_r_rData_resp;
  reg                 dbus_axi_decoder_io_input_r_rData_last;
  wire                when_Stream_l342_2;
  wire                vgaArea_vgaCtrl_io_axi_decoder_io_outputs_0_ar_validPipe_valid;
  wire                vgaArea_vgaCtrl_io_axi_decoder_io_outputs_0_ar_validPipe_ready;
  wire       [31:0]   vgaArea_vgaCtrl_io_axi_decoder_io_outputs_0_ar_validPipe_payload_addr;
  wire       [7:0]    vgaArea_vgaCtrl_io_axi_decoder_io_outputs_0_ar_validPipe_payload_len;
  wire       [2:0]    vgaArea_vgaCtrl_io_axi_decoder_io_outputs_0_ar_validPipe_payload_size;
  wire       [3:0]    vgaArea_vgaCtrl_io_axi_decoder_io_outputs_0_ar_validPipe_payload_cache;
  wire       [2:0]    vgaArea_vgaCtrl_io_axi_decoder_io_outputs_0_ar_validPipe_payload_prot;
  reg                 vgaArea_vgaCtrl_io_axi_decoder_io_outputs_0_ar_rValid;
  wire                vgaArea_vgaCtrl_io_axi_decoder_io_outputs_0_ar_validPipe_fire;
  wire                vgaArea_vgaCtrl_io_axi_decoder_io_outputs_0_ar_validPipe_fire_1;
  wire                vgaArea_vgaCtrl_io_axi_ar_halfPipe_valid;
  wire                vgaArea_vgaCtrl_io_axi_ar_halfPipe_ready;
  wire       [31:0]   vgaArea_vgaCtrl_io_axi_ar_halfPipe_payload_addr;
  wire       [7:0]    vgaArea_vgaCtrl_io_axi_ar_halfPipe_payload_len;
  wire       [2:0]    vgaArea_vgaCtrl_io_axi_ar_halfPipe_payload_size;
  wire       [3:0]    vgaArea_vgaCtrl_io_axi_ar_halfPipe_payload_cache;
  wire       [2:0]    vgaArea_vgaCtrl_io_axi_ar_halfPipe_payload_prot;
  reg                 vgaArea_vgaCtrl_io_axi_ar_rValid;
  wire                vgaArea_vgaCtrl_io_axi_ar_halfPipe_fire;
  reg        [31:0]   vgaArea_vgaCtrl_io_axi_ar_rData_addr;
  reg        [7:0]    vgaArea_vgaCtrl_io_axi_ar_rData_len;
  reg        [2:0]    vgaArea_vgaCtrl_io_axi_ar_rData_size;
  reg        [3:0]    vgaArea_vgaCtrl_io_axi_ar_rData_cache;
  reg        [2:0]    vgaArea_vgaCtrl_io_axi_ar_rData_prot;
  wire       [1:0]    _zz_io_readInputs_0_ar_payload_id;
  wire       [1:0]    _zz_io_readInputs_1_ar_payload_id;
  wire       [1:0]    _zz_io_sharedInputs_0_arw_payload_id;
  wire                sdramCtrlArea_sdramCtrl_io_axi_arbiter_io_output_arw_halfPipe_valid;
  wire                sdramCtrlArea_sdramCtrl_io_axi_arbiter_io_output_arw_halfPipe_ready;
  wire       [22:0]   sdramCtrlArea_sdramCtrl_io_axi_arbiter_io_output_arw_halfPipe_payload_addr;
  wire       [3:0]    sdramCtrlArea_sdramCtrl_io_axi_arbiter_io_output_arw_halfPipe_payload_id;
  wire       [7:0]    sdramCtrlArea_sdramCtrl_io_axi_arbiter_io_output_arw_halfPipe_payload_len;
  wire       [2:0]    sdramCtrlArea_sdramCtrl_io_axi_arbiter_io_output_arw_halfPipe_payload_size;
  wire       [1:0]    sdramCtrlArea_sdramCtrl_io_axi_arbiter_io_output_arw_halfPipe_payload_burst;
  wire                sdramCtrlArea_sdramCtrl_io_axi_arbiter_io_output_arw_halfPipe_payload_write;
  reg                 sdramCtrlArea_sdramCtrl_io_axi_arbiter_io_output_arw_rValid;
  wire                sdramCtrlArea_sdramCtrl_io_axi_arbiter_io_output_arw_halfPipe_fire;
  reg        [22:0]   sdramCtrlArea_sdramCtrl_io_axi_arbiter_io_output_arw_rData_addr;
  reg        [3:0]    sdramCtrlArea_sdramCtrl_io_axi_arbiter_io_output_arw_rData_id;
  reg        [7:0]    sdramCtrlArea_sdramCtrl_io_axi_arbiter_io_output_arw_rData_len;
  reg        [2:0]    sdramCtrlArea_sdramCtrl_io_axi_arbiter_io_output_arw_rData_size;
  reg        [1:0]    sdramCtrlArea_sdramCtrl_io_axi_arbiter_io_output_arw_rData_burst;
  reg                 sdramCtrlArea_sdramCtrl_io_axi_arbiter_io_output_arw_rData_write;
  wire                sdramCtrlArea_sdramCtrl_io_axi_arbiter_io_output_w_s2mPipe_valid;
  reg                 sdramCtrlArea_sdramCtrl_io_axi_arbiter_io_output_w_s2mPipe_ready;
  wire       [31:0]   sdramCtrlArea_sdramCtrl_io_axi_arbiter_io_output_w_s2mPipe_payload_data;
  wire       [3:0]    sdramCtrlArea_sdramCtrl_io_axi_arbiter_io_output_w_s2mPipe_payload_strb;
  wire                sdramCtrlArea_sdramCtrl_io_axi_arbiter_io_output_w_s2mPipe_payload_last;
  reg                 sdramCtrlArea_sdramCtrl_io_axi_arbiter_io_output_w_rValid;
  reg        [31:0]   sdramCtrlArea_sdramCtrl_io_axi_arbiter_io_output_w_rData_data;
  reg        [3:0]    sdramCtrlArea_sdramCtrl_io_axi_arbiter_io_output_w_rData_strb;
  reg                 sdramCtrlArea_sdramCtrl_io_axi_arbiter_io_output_w_rData_last;
  wire                sdramCtrlArea_sdramCtrl_io_axi_arbiter_io_output_w_s2mPipe_m2sPipe_valid;
  wire                sdramCtrlArea_sdramCtrl_io_axi_arbiter_io_output_w_s2mPipe_m2sPipe_ready;
  wire       [31:0]   sdramCtrlArea_sdramCtrl_io_axi_arbiter_io_output_w_s2mPipe_m2sPipe_payload_data;
  wire       [3:0]    sdramCtrlArea_sdramCtrl_io_axi_arbiter_io_output_w_s2mPipe_m2sPipe_payload_strb;
  wire                sdramCtrlArea_sdramCtrl_io_axi_arbiter_io_output_w_s2mPipe_m2sPipe_payload_last;
  reg                 sdramCtrlArea_sdramCtrl_io_axi_arbiter_io_output_w_s2mPipe_rValid;
  reg        [31:0]   sdramCtrlArea_sdramCtrl_io_axi_arbiter_io_output_w_s2mPipe_rData_data;
  reg        [3:0]    sdramCtrlArea_sdramCtrl_io_axi_arbiter_io_output_w_s2mPipe_rData_strb;
  reg                 sdramCtrlArea_sdramCtrl_io_axi_arbiter_io_output_w_s2mPipe_rData_last;
  wire                when_Stream_l342_3;
  wire       [2:0]    _zz_io_readInputs_0_ar_payload_id_1;
  wire       [2:0]    _zz_io_sharedInputs_0_arw_payload_id_1;
  wire                axi_ram_io_axi_arbiter_io_output_arw_halfPipe_valid;
  wire                axi_ram_io_axi_arbiter_io_output_arw_halfPipe_ready;
  wire       [14:0]   axi_ram_io_axi_arbiter_io_output_arw_halfPipe_payload_addr;
  wire       [3:0]    axi_ram_io_axi_arbiter_io_output_arw_halfPipe_payload_id;
  wire       [7:0]    axi_ram_io_axi_arbiter_io_output_arw_halfPipe_payload_len;
  wire       [2:0]    axi_ram_io_axi_arbiter_io_output_arw_halfPipe_payload_size;
  wire       [1:0]    axi_ram_io_axi_arbiter_io_output_arw_halfPipe_payload_burst;
  wire                axi_ram_io_axi_arbiter_io_output_arw_halfPipe_payload_write;
  reg                 axi_ram_io_axi_arbiter_io_output_arw_rValid;
  wire                axi_ram_io_axi_arbiter_io_output_arw_halfPipe_fire;
  reg        [14:0]   axi_ram_io_axi_arbiter_io_output_arw_rData_addr;
  reg        [3:0]    axi_ram_io_axi_arbiter_io_output_arw_rData_id;
  reg        [7:0]    axi_ram_io_axi_arbiter_io_output_arw_rData_len;
  reg        [2:0]    axi_ram_io_axi_arbiter_io_output_arw_rData_size;
  reg        [1:0]    axi_ram_io_axi_arbiter_io_output_arw_rData_burst;
  reg                 axi_ram_io_axi_arbiter_io_output_arw_rData_write;
  wire                axi_ram_io_axi_arbiter_io_output_w_s2mPipe_valid;
  reg                 axi_ram_io_axi_arbiter_io_output_w_s2mPipe_ready;
  wire       [31:0]   axi_ram_io_axi_arbiter_io_output_w_s2mPipe_payload_data;
  wire       [3:0]    axi_ram_io_axi_arbiter_io_output_w_s2mPipe_payload_strb;
  wire                axi_ram_io_axi_arbiter_io_output_w_s2mPipe_payload_last;
  reg                 axi_ram_io_axi_arbiter_io_output_w_rValid;
  reg        [31:0]   axi_ram_io_axi_arbiter_io_output_w_rData_data;
  reg        [3:0]    axi_ram_io_axi_arbiter_io_output_w_rData_strb;
  reg                 axi_ram_io_axi_arbiter_io_output_w_rData_last;
  wire                axi_ram_io_axi_arbiter_io_output_w_s2mPipe_m2sPipe_valid;
  wire                axi_ram_io_axi_arbiter_io_output_w_s2mPipe_m2sPipe_ready;
  wire       [31:0]   axi_ram_io_axi_arbiter_io_output_w_s2mPipe_m2sPipe_payload_data;
  wire       [3:0]    axi_ram_io_axi_arbiter_io_output_w_s2mPipe_m2sPipe_payload_strb;
  wire                axi_ram_io_axi_arbiter_io_output_w_s2mPipe_m2sPipe_payload_last;
  reg                 axi_ram_io_axi_arbiter_io_output_w_s2mPipe_rValid;
  reg        [31:0]   axi_ram_io_axi_arbiter_io_output_w_s2mPipe_rData_data;
  reg        [3:0]    axi_ram_io_axi_arbiter_io_output_w_s2mPipe_rData_strb;
  reg                 axi_ram_io_axi_arbiter_io_output_w_s2mPipe_rData_last;
  wire                when_Stream_l342_4;
  wire       [3:0]    _zz_io_sharedInputs_0_arw_payload_id_2;
  wire                axi_apbBridge_io_axi_arbiter_io_output_arw_halfPipe_valid;
  wire                axi_apbBridge_io_axi_arbiter_io_output_arw_halfPipe_ready;
  wire       [19:0]   axi_apbBridge_io_axi_arbiter_io_output_arw_halfPipe_payload_addr;
  wire       [3:0]    axi_apbBridge_io_axi_arbiter_io_output_arw_halfPipe_payload_id;
  wire       [7:0]    axi_apbBridge_io_axi_arbiter_io_output_arw_halfPipe_payload_len;
  wire       [2:0]    axi_apbBridge_io_axi_arbiter_io_output_arw_halfPipe_payload_size;
  wire       [1:0]    axi_apbBridge_io_axi_arbiter_io_output_arw_halfPipe_payload_burst;
  wire                axi_apbBridge_io_axi_arbiter_io_output_arw_halfPipe_payload_write;
  reg                 axi_apbBridge_io_axi_arbiter_io_output_arw_rValid;
  wire                axi_apbBridge_io_axi_arbiter_io_output_arw_halfPipe_fire;
  reg        [19:0]   axi_apbBridge_io_axi_arbiter_io_output_arw_rData_addr;
  reg        [3:0]    axi_apbBridge_io_axi_arbiter_io_output_arw_rData_id;
  reg        [7:0]    axi_apbBridge_io_axi_arbiter_io_output_arw_rData_len;
  reg        [2:0]    axi_apbBridge_io_axi_arbiter_io_output_arw_rData_size;
  reg        [1:0]    axi_apbBridge_io_axi_arbiter_io_output_arw_rData_burst;
  reg                 axi_apbBridge_io_axi_arbiter_io_output_arw_rData_write;
  wire                axi_apbBridge_io_axi_arbiter_io_output_w_halfPipe_valid;
  wire                axi_apbBridge_io_axi_arbiter_io_output_w_halfPipe_ready;
  wire       [31:0]   axi_apbBridge_io_axi_arbiter_io_output_w_halfPipe_payload_data;
  wire       [3:0]    axi_apbBridge_io_axi_arbiter_io_output_w_halfPipe_payload_strb;
  wire                axi_apbBridge_io_axi_arbiter_io_output_w_halfPipe_payload_last;
  reg                 axi_apbBridge_io_axi_arbiter_io_output_w_rValid;
  wire                axi_apbBridge_io_axi_arbiter_io_output_w_halfPipe_fire;
  reg        [31:0]   axi_apbBridge_io_axi_arbiter_io_output_w_rData_data;
  reg        [3:0]    axi_apbBridge_io_axi_arbiter_io_output_w_rData_strb;
  reg                 axi_apbBridge_io_axi_arbiter_io_output_w_rData_last;
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
  wire                when_InOutWrapper_l48;
  wire                when_InOutWrapper_l48_1;

  assign _zz_dbus_axi_arw_payload_len = ((streamFork_4_io_outputs_0_thrown_payload_size == 3'b101) ? 3'b111 : 3'b000);
  assign _zz_when_InOutWrapper_l48_2 = _zz_when_InOutWrapper_l48_1;
  assign _zz_when_InOutWrapper_l48_1_1 = _zz_when_InOutWrapper_l48;
  assign _zz_i2c_0_scl_1 = 1'b0;
  assign _zz_i2c_0_sda_1 = 1'b0;
  EG4S20PLL eG4S20PLL_1 (
    .refclk      (i_clk                   ), //i
    .extlock     (eG4S20PLL_1_extlock     ), //o
    .reset       (bufferCC_16_io_dataOut  ), //i
    .clk0_out    (eG4S20PLL_1_clk0_out    ), //o
    .clk1_out    (eG4S20PLL_1_clk1_out    ), //o
    .clk2_out    (eG4S20PLL_1_clk2_out    ), //o
    .clk3_out    (eG4S20PLL_1_clk3_out    )  //o
  );
  BufferCC_10 bufferCC_16 (
    .io_dataIn     (bufferCC_16_io_dataIn   ), //i
    .io_dataOut    (bufferCC_16_io_dataOut  ), //o
    .clk           (clk                     ), //i
    .reset         (reset                   )  //i
  );
  BufferCC_11 bufferCC_17 (
    .io_dataIn     (bufferCC_17_io_dataIn   ), //i
    .io_dataOut    (bufferCC_17_io_dataOut  ), //o
    .i_clk         (i_clk                   ), //i
    .asyncReset    (asyncReset              )  //i
  );
  BufferCC_11 bufferCC_18 (
    .io_dataIn     (bufferCC_18_io_dataIn   ), //i
    .io_dataOut    (bufferCC_18_io_dataOut  ), //o
    .i_clk         (i_clk                   ), //i
    .asyncReset    (asyncReset              )  //i
  );
  BufferCC_11 resetCtrl_axiReset_buffercc (
    .io_dataIn     (resetCtrl_axiReset                      ), //i
    .io_dataOut    (resetCtrl_axiReset_buffercc_io_dataOut  ), //o
    .i_clk         (i_clk                                   ), //i
    .asyncReset    (asyncReset                              )  //i
  );
  BufferCC_11 resetCtrl_axiReset_buffercc_1 (
    .io_dataIn     (resetCtrl_axiReset                        ), //i
    .io_dataOut    (resetCtrl_axiReset_buffercc_1_io_dataOut  ), //o
    .i_clk         (i_clk                                     ), //i
    .asyncReset    (asyncReset                                )  //i
  );
  BufferCC_11 resetCtrl_axiReset_buffercc_2 (
    .io_dataIn     (resetCtrl_axiReset                        ), //i
    .io_dataOut    (resetCtrl_axiReset_buffercc_2_io_dataOut  ), //o
    .i_clk         (i_clk                                     ), //i
    .asyncReset    (asyncReset                                )  //i
  );
  Axi4SharedSdramCtrl sdramCtrlArea_sdramCtrl (
    .io_axi_arw_valid            (sdramCtrlArea_sdramCtrl_io_axi_arbiter_io_output_arw_halfPipe_valid                    ), //i
    .io_axi_arw_ready            (sdramCtrlArea_sdramCtrl_io_axi_arw_ready                                               ), //o
    .io_axi_arw_payload_addr     (sdramCtrlArea_sdramCtrl_io_axi_arbiter_io_output_arw_halfPipe_payload_addr[22:0]       ), //i
    .io_axi_arw_payload_id       (sdramCtrlArea_sdramCtrl_io_axi_arbiter_io_output_arw_halfPipe_payload_id[3:0]          ), //i
    .io_axi_arw_payload_len      (sdramCtrlArea_sdramCtrl_io_axi_arbiter_io_output_arw_halfPipe_payload_len[7:0]         ), //i
    .io_axi_arw_payload_size     (sdramCtrlArea_sdramCtrl_io_axi_arbiter_io_output_arw_halfPipe_payload_size[2:0]        ), //i
    .io_axi_arw_payload_burst    (sdramCtrlArea_sdramCtrl_io_axi_arbiter_io_output_arw_halfPipe_payload_burst[1:0]       ), //i
    .io_axi_arw_payload_write    (sdramCtrlArea_sdramCtrl_io_axi_arbiter_io_output_arw_halfPipe_payload_write            ), //i
    .io_axi_w_valid              (sdramCtrlArea_sdramCtrl_io_axi_arbiter_io_output_w_s2mPipe_m2sPipe_valid               ), //i
    .io_axi_w_ready              (sdramCtrlArea_sdramCtrl_io_axi_w_ready                                                 ), //o
    .io_axi_w_payload_data       (sdramCtrlArea_sdramCtrl_io_axi_arbiter_io_output_w_s2mPipe_m2sPipe_payload_data[31:0]  ), //i
    .io_axi_w_payload_strb       (sdramCtrlArea_sdramCtrl_io_axi_arbiter_io_output_w_s2mPipe_m2sPipe_payload_strb[3:0]   ), //i
    .io_axi_w_payload_last       (sdramCtrlArea_sdramCtrl_io_axi_arbiter_io_output_w_s2mPipe_m2sPipe_payload_last        ), //i
    .io_axi_b_valid              (sdramCtrlArea_sdramCtrl_io_axi_b_valid                                                 ), //o
    .io_axi_b_ready              (sdramCtrlArea_sdramCtrl_io_axi_arbiter_io_output_b_ready                               ), //i
    .io_axi_b_payload_id         (sdramCtrlArea_sdramCtrl_io_axi_b_payload_id[3:0]                                       ), //o
    .io_axi_b_payload_resp       (sdramCtrlArea_sdramCtrl_io_axi_b_payload_resp[1:0]                                     ), //o
    .io_axi_r_valid              (sdramCtrlArea_sdramCtrl_io_axi_r_valid                                                 ), //o
    .io_axi_r_ready              (sdramCtrlArea_sdramCtrl_io_axi_arbiter_io_output_r_ready                               ), //i
    .io_axi_r_payload_data       (sdramCtrlArea_sdramCtrl_io_axi_r_payload_data[31:0]                                    ), //o
    .io_axi_r_payload_id         (sdramCtrlArea_sdramCtrl_io_axi_r_payload_id[3:0]                                       ), //o
    .io_axi_r_payload_resp       (sdramCtrlArea_sdramCtrl_io_axi_r_payload_resp[1:0]                                     ), //o
    .io_axi_r_payload_last       (sdramCtrlArea_sdramCtrl_io_axi_r_payload_last                                          ), //o
    .io_sdram_ADDR               (sdramCtrlArea_sdramCtrl_io_sdram_ADDR[10:0]                                            ), //o
    .io_sdram_BA                 (sdramCtrlArea_sdramCtrl_io_sdram_BA[1:0]                                               ), //o
    .io_sdram_DQ_read            (sdramArea_sdram_dq_read[31:0]                                                          ), //i
    .io_sdram_DQ_write           (sdramCtrlArea_sdramCtrl_io_sdram_DQ_write[31:0]                                        ), //o
    .io_sdram_DQ_writeEnable     (sdramCtrlArea_sdramCtrl_io_sdram_DQ_writeEnable[31:0]                                  ), //o
    .io_sdram_DQM                (sdramCtrlArea_sdramCtrl_io_sdram_DQM[3:0]                                              ), //o
    .io_sdram_CASn               (sdramCtrlArea_sdramCtrl_io_sdram_CASn                                                  ), //o
    .io_sdram_CKE                (sdramCtrlArea_sdramCtrl_io_sdram_CKE                                                   ), //o
    .io_sdram_CSn                (sdramCtrlArea_sdramCtrl_io_sdram_CSn                                                   ), //o
    .io_sdram_RASn               (sdramCtrlArea_sdramCtrl_io_sdram_RASn                                                  ), //o
    .io_sdram_WEn                (sdramCtrlArea_sdramCtrl_io_sdram_WEn                                                   ), //o
    .sdramCtrlClk                (sdramCtrlClk                                                                           ), //i
    .resetCtrl_sdramReset        (resetCtrl_sdramReset                                                                   )  //i
  );
  EG4S20SDRAM sdramArea_sdram (
    .clk               (sdramClk                                               ), //i
    .ras_n             (sdramCtrlArea_sdramCtrl_io_sdram_RASn                  ), //i
    .cas_n             (sdramCtrlArea_sdramCtrl_io_sdram_CASn                  ), //i
    .we_n              (sdramCtrlArea_sdramCtrl_io_sdram_WEn                   ), //i
    .cs_n              (1'b0                                                   ), //i
    .addr              (sdramCtrlArea_sdramCtrl_io_sdram_ADDR[10:0]            ), //i
    .ba                (sdramCtrlArea_sdramCtrl_io_sdram_BA[1:0]               ), //i
    .dq_read           (sdramArea_sdram_dq_read[31:0]                          ), //o
    .dq_write          (sdramCtrlArea_sdramCtrl_io_sdram_DQ_write[31:0]        ), //i
    .dq_writeEnable    (sdramCtrlArea_sdramCtrl_io_sdram_DQ_writeEnable[31:0]  ), //i
    .cke               (1'b1                                                   ), //i
    .dm0               (sdramArea_sdram_dm0                                    ), //i
    .dm1               (sdramArea_sdram_dm1                                    ), //i
    .dm2               (sdramArea_sdram_dm2                                    ), //i
    .dm3               (sdramArea_sdram_dm3                                    )  //i
  );
  Axi4VgaCtrl vgaArea_vgaCtrl (
    .io_axi_ar_valid            (vgaArea_vgaCtrl_io_axi_ar_valid                               ), //o
    .io_axi_ar_ready            (vgaArea_vgaCtrl_io_axi_ar_ready                               ), //i
    .io_axi_ar_payload_addr     (vgaArea_vgaCtrl_io_axi_ar_payload_addr[31:0]                  ), //o
    .io_axi_ar_payload_len      (vgaArea_vgaCtrl_io_axi_ar_payload_len[7:0]                    ), //o
    .io_axi_ar_payload_size     (vgaArea_vgaCtrl_io_axi_ar_payload_size[2:0]                   ), //o
    .io_axi_ar_payload_cache    (vgaArea_vgaCtrl_io_axi_ar_payload_cache[3:0]                  ), //o
    .io_axi_ar_payload_prot     (vgaArea_vgaCtrl_io_axi_ar_payload_prot[2:0]                   ), //o
    .io_axi_r_valid             (vgaArea_vgaCtrl_io_axi_decoder_io_input_r_valid               ), //i
    .io_axi_r_ready             (vgaArea_vgaCtrl_io_axi_r_ready                                ), //o
    .io_axi_r_payload_data      (vgaArea_vgaCtrl_io_axi_decoder_io_input_r_payload_data[31:0]  ), //i
    .io_axi_r_payload_last      (vgaArea_vgaCtrl_io_axi_decoder_io_input_r_payload_last        ), //i
    .io_apb_PADDR               (vgaArea_vgaCtrl_io_apb_PADDR[7:0]                             ), //i
    .io_apb_PSEL                (apb3Router_1_io_outputs_6_PSEL                                ), //i
    .io_apb_PENABLE             (apb3Router_1_io_outputs_6_PENABLE                             ), //i
    .io_apb_PREADY              (vgaArea_vgaCtrl_io_apb_PREADY                                 ), //o
    .io_apb_PWRITE              (apb3Router_1_io_outputs_6_PWRITE                              ), //i
    .io_apb_PWDATA              (apb3Router_1_io_outputs_6_PWDATA[31:0]                        ), //i
    .io_apb_PRDATA              (vgaArea_vgaCtrl_io_apb_PRDATA[31:0]                           ), //o
    .io_vga_vSync               (vgaArea_vgaCtrl_io_vga_vSync                                  ), //o
    .io_vga_hSync               (vgaArea_vgaCtrl_io_vga_hSync                                  ), //o
    .io_vga_colorEn             (vgaArea_vgaCtrl_io_vga_colorEn                                ), //o
    .io_vga_color_r             (vgaArea_vgaCtrl_io_vga_color_r[4:0]                           ), //o
    .io_vga_color_g             (vgaArea_vgaCtrl_io_vga_color_g[5:0]                           ), //o
    .io_vga_color_b             (vgaArea_vgaCtrl_io_vga_color_b[4:0]                           ), //o
    .vgaClk                     (vgaClk                                                        ), //i
    .resetCtrl_vgaReset         (resetCtrl_vgaReset                                            )  //i
  );
  Axi4SharedOnChipRam axi_ram (
    .io_axi_arw_valid            (axi_ram_io_axi_arbiter_io_output_arw_halfPipe_valid                    ), //i
    .io_axi_arw_ready            (axi_ram_io_axi_arw_ready                                               ), //o
    .io_axi_arw_payload_addr     (axi_ram_io_axi_arbiter_io_output_arw_halfPipe_payload_addr[14:0]       ), //i
    .io_axi_arw_payload_id       (axi_ram_io_axi_arbiter_io_output_arw_halfPipe_payload_id[3:0]          ), //i
    .io_axi_arw_payload_len      (axi_ram_io_axi_arbiter_io_output_arw_halfPipe_payload_len[7:0]         ), //i
    .io_axi_arw_payload_size     (axi_ram_io_axi_arbiter_io_output_arw_halfPipe_payload_size[2:0]        ), //i
    .io_axi_arw_payload_burst    (axi_ram_io_axi_arbiter_io_output_arw_halfPipe_payload_burst[1:0]       ), //i
    .io_axi_arw_payload_write    (axi_ram_io_axi_arbiter_io_output_arw_halfPipe_payload_write            ), //i
    .io_axi_w_valid              (axi_ram_io_axi_arbiter_io_output_w_s2mPipe_m2sPipe_valid               ), //i
    .io_axi_w_ready              (axi_ram_io_axi_w_ready                                                 ), //o
    .io_axi_w_payload_data       (axi_ram_io_axi_arbiter_io_output_w_s2mPipe_m2sPipe_payload_data[31:0]  ), //i
    .io_axi_w_payload_strb       (axi_ram_io_axi_arbiter_io_output_w_s2mPipe_m2sPipe_payload_strb[3:0]   ), //i
    .io_axi_w_payload_last       (axi_ram_io_axi_arbiter_io_output_w_s2mPipe_m2sPipe_payload_last        ), //i
    .io_axi_b_valid              (axi_ram_io_axi_b_valid                                                 ), //o
    .io_axi_b_ready              (axi_ram_io_axi_arbiter_io_output_b_ready                               ), //i
    .io_axi_b_payload_id         (axi_ram_io_axi_b_payload_id[3:0]                                       ), //o
    .io_axi_b_payload_resp       (axi_ram_io_axi_b_payload_resp[1:0]                                     ), //o
    .io_axi_r_valid              (axi_ram_io_axi_r_valid                                                 ), //o
    .io_axi_r_ready              (axi_ram_io_axi_arbiter_io_output_r_ready                               ), //i
    .io_axi_r_payload_data       (axi_ram_io_axi_r_payload_data[31:0]                                    ), //o
    .io_axi_r_payload_id         (axi_ram_io_axi_r_payload_id[3:0]                                       ), //o
    .io_axi_r_payload_resp       (axi_ram_io_axi_r_payload_resp[1:0]                                     ), //o
    .io_axi_r_payload_last       (axi_ram_io_axi_r_payload_last                                          ), //o
    .axiClk                      (axiClk                                                                 ), //i
    .resetCtrl_axiReset          (resetCtrl_axiReset                                                     )  //i
  );
  Axi4SharedToApb3Bridge axi_apbBridge (
    .io_axi_arw_valid            (axi_apbBridge_io_axi_arbiter_io_output_arw_halfPipe_valid               ), //i
    .io_axi_arw_ready            (axi_apbBridge_io_axi_arw_ready                                          ), //o
    .io_axi_arw_payload_addr     (axi_apbBridge_io_axi_arbiter_io_output_arw_halfPipe_payload_addr[19:0]  ), //i
    .io_axi_arw_payload_id       (axi_apbBridge_io_axi_arbiter_io_output_arw_halfPipe_payload_id[3:0]     ), //i
    .io_axi_arw_payload_len      (axi_apbBridge_io_axi_arbiter_io_output_arw_halfPipe_payload_len[7:0]    ), //i
    .io_axi_arw_payload_size     (axi_apbBridge_io_axi_arbiter_io_output_arw_halfPipe_payload_size[2:0]   ), //i
    .io_axi_arw_payload_burst    (axi_apbBridge_io_axi_arbiter_io_output_arw_halfPipe_payload_burst[1:0]  ), //i
    .io_axi_arw_payload_write    (axi_apbBridge_io_axi_arbiter_io_output_arw_halfPipe_payload_write       ), //i
    .io_axi_w_valid              (axi_apbBridge_io_axi_arbiter_io_output_w_halfPipe_valid                 ), //i
    .io_axi_w_ready              (axi_apbBridge_io_axi_w_ready                                            ), //o
    .io_axi_w_payload_data       (axi_apbBridge_io_axi_arbiter_io_output_w_halfPipe_payload_data[31:0]    ), //i
    .io_axi_w_payload_strb       (axi_apbBridge_io_axi_arbiter_io_output_w_halfPipe_payload_strb[3:0]     ), //i
    .io_axi_w_payload_last       (axi_apbBridge_io_axi_arbiter_io_output_w_halfPipe_payload_last          ), //i
    .io_axi_b_valid              (axi_apbBridge_io_axi_b_valid                                            ), //o
    .io_axi_b_ready              (axi_apbBridge_io_axi_arbiter_io_output_b_ready                          ), //i
    .io_axi_b_payload_id         (axi_apbBridge_io_axi_b_payload_id[3:0]                                  ), //o
    .io_axi_b_payload_resp       (axi_apbBridge_io_axi_b_payload_resp[1:0]                                ), //o
    .io_axi_r_valid              (axi_apbBridge_io_axi_r_valid                                            ), //o
    .io_axi_r_ready              (axi_apbBridge_io_axi_arbiter_io_output_r_ready                          ), //i
    .io_axi_r_payload_data       (axi_apbBridge_io_axi_r_payload_data[31:0]                               ), //o
    .io_axi_r_payload_id         (axi_apbBridge_io_axi_r_payload_id[3:0]                                  ), //o
    .io_axi_r_payload_resp       (axi_apbBridge_io_axi_r_payload_resp[1:0]                                ), //o
    .io_axi_r_payload_last       (axi_apbBridge_io_axi_r_payload_last                                     ), //o
    .io_apb_PADDR                (axi_apbBridge_io_apb_PADDR[19:0]                                        ), //o
    .io_apb_PSEL                 (axi_apbBridge_io_apb_PSEL                                               ), //o
    .io_apb_PENABLE              (axi_apbBridge_io_apb_PENABLE                                            ), //o
    .io_apb_PREADY               (io_apb_decoder_io_input_PREADY                                          ), //i
    .io_apb_PWRITE               (axi_apbBridge_io_apb_PWRITE                                             ), //o
    .io_apb_PWDATA               (axi_apbBridge_io_apb_PWDATA[31:0]                                       ), //o
    .io_apb_PRDATA               (io_apb_decoder_io_input_PRDATA[31:0]                                    ), //i
    .io_apb_PSLVERROR            (io_apb_decoder_io_input_PSLVERROR                                       ), //i
    .axiClk                      (axiClk                                                                  ), //i
    .resetCtrl_axiReset          (resetCtrl_axiReset                                                      )  //i
  );
  Apb3LedsCtrl axi_ledCtrl (
    .io_apb_PADDR          (axi_ledCtrl_io_apb_PADDR[7:0]           ), //i
    .io_apb_PSEL           (apb3Router_1_io_outputs_5_PSEL          ), //i
    .io_apb_PENABLE        (apb3Router_1_io_outputs_5_PENABLE       ), //i
    .io_apb_PREADY         (axi_ledCtrl_io_apb_PREADY               ), //o
    .io_apb_PWRITE         (apb3Router_1_io_outputs_5_PWRITE        ), //i
    .io_apb_PWDATA         (apb3Router_1_io_outputs_5_PWDATA[31:0]  ), //i
    .io_apb_PRDATA         (axi_ledCtrl_io_apb_PRDATA[31:0]         ), //o
    .io_apb_PSLVERROR      (axi_ledCtrl_io_apb_PSLVERROR            ), //o
    .io_leds               (axi_ledCtrl_io_leds[2:0]                ), //o
    .axiClk                (axiClk                                  ), //i
    .resetCtrl_axiReset    (resetCtrl_axiReset                      )  //i
  );
  Apb3Gpio axi_gpioACtrl (
    .io_apb_PADDR           (axi_gpioACtrl_io_apb_PADDR[3:0]          ), //i
    .io_apb_PSEL            (apb3Router_1_io_outputs_0_PSEL           ), //i
    .io_apb_PENABLE         (apb3Router_1_io_outputs_0_PENABLE        ), //i
    .io_apb_PREADY          (axi_gpioACtrl_io_apb_PREADY              ), //o
    .io_apb_PWRITE          (apb3Router_1_io_outputs_0_PWRITE         ), //i
    .io_apb_PWDATA          (apb3Router_1_io_outputs_0_PWDATA[31:0]   ), //i
    .io_apb_PRDATA          (axi_gpioACtrl_io_apb_PRDATA[31:0]        ), //o
    .io_apb_PSLVERROR       (axi_gpioACtrl_io_apb_PSLVERROR           ), //o
    .io_gpio_read           (_zz_io_gpio_read[15:0]                   ), //i
    .io_gpio_write          (axi_gpioACtrl_io_gpio_write[15:0]        ), //o
    .io_gpio_writeEnable    (axi_gpioACtrl_io_gpio_writeEnable[15:0]  ), //o
    .io_value               (axi_gpioACtrl_io_value[15:0]             ), //o
    .axiClk                 (axiClk                                   ), //i
    .resetCtrl_axiReset     (resetCtrl_axiReset                       )  //i
  );
  BrieyTimerCtrl axi_timerCtrl (
    .io_apb_PADDR          (axi_timerCtrl_io_apb_PADDR[7:0]         ), //i
    .io_apb_PSEL           (apb3Router_1_io_outputs_2_PSEL          ), //i
    .io_apb_PENABLE        (apb3Router_1_io_outputs_2_PENABLE       ), //i
    .io_apb_PREADY         (axi_timerCtrl_io_apb_PREADY             ), //o
    .io_apb_PWRITE         (apb3Router_1_io_outputs_2_PWRITE        ), //i
    .io_apb_PWDATA         (apb3Router_1_io_outputs_2_PWDATA[31:0]  ), //i
    .io_apb_PRDATA         (axi_timerCtrl_io_apb_PRDATA[31:0]       ), //o
    .io_apb_PSLVERROR      (axi_timerCtrl_io_apb_PSLVERROR          ), //o
    .io_interrupt          (axi_timerCtrl_io_interrupt              ), //o
    .axiClk                (axiClk                                  ), //i
    .resetCtrl_axiReset    (resetCtrl_axiReset                      )  //i
  );
  Apb3UartCtrl axi_uartCtrl (
    .io_apb_PADDR          (axi_uartCtrl_io_apb_PADDR[4:0]          ), //i
    .io_apb_PSEL           (apb3Router_1_io_outputs_1_PSEL          ), //i
    .io_apb_PENABLE        (apb3Router_1_io_outputs_1_PENABLE       ), //i
    .io_apb_PREADY         (axi_uartCtrl_io_apb_PREADY              ), //o
    .io_apb_PWRITE         (apb3Router_1_io_outputs_1_PWRITE        ), //i
    .io_apb_PWDATA         (apb3Router_1_io_outputs_1_PWDATA[31:0]  ), //i
    .io_apb_PRDATA         (axi_uartCtrl_io_apb_PRDATA[31:0]        ), //o
    .io_uart_txd           (axi_uartCtrl_io_uart_txd                ), //o
    .io_uart_rxd           (uart_0_rxd                              ), //i
    .io_interrupt          (axi_uartCtrl_io_interrupt               ), //o
    .axiClk                (axiClk                                  ), //i
    .resetCtrl_axiReset    (resetCtrl_axiReset                      )  //i
  );
  Apb3I2cCtrl axi_i2cCtrl (
    .io_apb_PADDR          (axi_i2cCtrl_io_apb_PADDR[7:0]           ), //i
    .io_apb_PSEL           (apb3Router_1_io_outputs_3_PSEL          ), //i
    .io_apb_PENABLE        (apb3Router_1_io_outputs_3_PENABLE       ), //i
    .io_apb_PREADY         (axi_i2cCtrl_io_apb_PREADY               ), //o
    .io_apb_PWRITE         (apb3Router_1_io_outputs_3_PWRITE        ), //i
    .io_apb_PWDATA         (apb3Router_1_io_outputs_3_PWDATA[31:0]  ), //i
    .io_apb_PRDATA         (axi_i2cCtrl_io_apb_PRDATA[31:0]         ), //o
    .io_i2c_sda_write      (axi_i2cCtrl_io_i2c_sda_write            ), //o
    .io_i2c_sda_read       (_zz_io_i2c_sda_read                     ), //i
    .io_i2c_scl_write      (axi_i2cCtrl_io_i2c_scl_write            ), //o
    .io_i2c_scl_read       (_zz_io_i2c_scl_read                     ), //i
    .io_interrupt          (axi_i2cCtrl_io_interrupt                ), //o
    .axiClk                (axiClk                                  ), //i
    .resetCtrl_axiReset    (resetCtrl_axiReset                      )  //i
  );
  Apb3SpiMasterCtrl axi_spiCtrl (
    .io_apb_PADDR          (axi_spiCtrl_io_apb_PADDR[7:0]           ), //i
    .io_apb_PSEL           (apb3Router_1_io_outputs_4_PSEL          ), //i
    .io_apb_PENABLE        (apb3Router_1_io_outputs_4_PENABLE       ), //i
    .io_apb_PREADY         (axi_spiCtrl_io_apb_PREADY               ), //o
    .io_apb_PWRITE         (apb3Router_1_io_outputs_4_PWRITE        ), //i
    .io_apb_PWDATA         (apb3Router_1_io_outputs_4_PWDATA[31:0]  ), //i
    .io_apb_PRDATA         (axi_spiCtrl_io_apb_PRDATA[31:0]         ), //o
    .io_spi_ss             (axi_spiCtrl_io_spi_ss                   ), //o
    .io_spi_sclk           (axi_spiCtrl_io_spi_sclk                 ), //o
    .io_spi_mosi           (axi_spiCtrl_io_spi_mosi                 ), //o
    .io_spi_miso           (spi_0_miso                              ), //i
    .io_interrupt          (axi_spiCtrl_io_interrupt                ), //o
    .axiClk                (axiClk                                  ), //i
    .resetCtrl_axiReset    (resetCtrl_axiReset                      )  //i
  );
  VexRiscv axi_core_cpu (
    .dBus_cmd_valid                   (axi_core_cpu_dBus_cmd_valid                      ), //o
    .dBus_cmd_ready                   (axi_core_cpu_dBus_cmd_ready                      ), //i
    .dBus_cmd_payload_wr              (axi_core_cpu_dBus_cmd_payload_wr                 ), //o
    .dBus_cmd_payload_uncached        (axi_core_cpu_dBus_cmd_payload_uncached           ), //o
    .dBus_cmd_payload_address         (axi_core_cpu_dBus_cmd_payload_address[31:0]      ), //o
    .dBus_cmd_payload_data            (axi_core_cpu_dBus_cmd_payload_data[31:0]         ), //o
    .dBus_cmd_payload_mask            (axi_core_cpu_dBus_cmd_payload_mask[3:0]          ), //o
    .dBus_cmd_payload_size            (axi_core_cpu_dBus_cmd_payload_size[2:0]          ), //o
    .dBus_cmd_payload_last            (axi_core_cpu_dBus_cmd_payload_last               ), //o
    .dBus_rsp_valid                   (dbus_axi_r_valid                                 ), //i
    .dBus_rsp_payload_last            (axi_core_cpu_dBus_rsp_payload_last               ), //i
    .dBus_rsp_payload_data            (dbus_axi_r_payload_data[31:0]                    ), //i
    .dBus_rsp_payload_error           (axi_core_cpu_dBus_rsp_payload_error              ), //i
    .timerInterrupt                   (axi_timerCtrl_io_interrupt                       ), //i
    .externalInterrupt                (axi_core_externalInterrupt                       ), //i
    .softwareInterrupt                (1'b0                                             ), //i
    .debug_bus_cmd_valid              (systemDebugger_1_io_mem_cmd_valid                ), //i
    .debug_bus_cmd_ready              (axi_core_cpu_debug_bus_cmd_ready                 ), //o
    .debug_bus_cmd_payload_wr         (systemDebugger_1_io_mem_cmd_payload_wr           ), //i
    .debug_bus_cmd_payload_address    (axi_core_cpu_debug_bus_cmd_payload_address[7:0]  ), //i
    .debug_bus_cmd_payload_data       (systemDebugger_1_io_mem_cmd_payload_data[31:0]   ), //i
    .debug_bus_rsp_data               (axi_core_cpu_debug_bus_rsp_data[31:0]            ), //o
    .debug_resetOut                   (axi_core_cpu_debug_resetOut                      ), //o
    .iBus_cmd_valid                   (axi_core_cpu_iBus_cmd_valid                      ), //o
    .iBus_cmd_ready                   (_zz_iBus_cmd_ready                               ), //i
    .iBus_cmd_payload_address         (axi_core_cpu_iBus_cmd_payload_address[31:0]      ), //o
    .iBus_cmd_payload_size            (axi_core_cpu_iBus_cmd_payload_size[2:0]          ), //o
    .iBus_rsp_valid                   (_zz_iBus_rsp_valid                               ), //i
    .iBus_rsp_payload_data            (_zz_iBus_rsp_payload_data[31:0]                  ), //i
    .iBus_rsp_payload_error           (axi_core_cpu_iBus_rsp_payload_error              ), //i
    .axiClk                           (axiClk                                           ), //i
    .resetCtrl_axiReset               (resetCtrl_axiReset                               ), //i
    .resetCtrl_systemReset            (resetCtrl_systemReset                            )  //i
  );
  StreamFork_3 streamFork_4 (
    .io_input_valid                   (streamFork_4_io_input_valid                                          ), //i
    .io_input_ready                   (streamFork_4_io_input_ready                                          ), //o
    .io_input_payload_wr              (axi_core_cpu_dBus_cmd_m2sPipe_m2sPipe_s2mPipe_payload_wr             ), //i
    .io_input_payload_uncached        (axi_core_cpu_dBus_cmd_m2sPipe_m2sPipe_s2mPipe_payload_uncached       ), //i
    .io_input_payload_address         (axi_core_cpu_dBus_cmd_m2sPipe_m2sPipe_s2mPipe_payload_address[31:0]  ), //i
    .io_input_payload_data            (axi_core_cpu_dBus_cmd_m2sPipe_m2sPipe_s2mPipe_payload_data[31:0]     ), //i
    .io_input_payload_mask            (axi_core_cpu_dBus_cmd_m2sPipe_m2sPipe_s2mPipe_payload_mask[3:0]      ), //i
    .io_input_payload_size            (axi_core_cpu_dBus_cmd_m2sPipe_m2sPipe_s2mPipe_payload_size[2:0]      ), //i
    .io_input_payload_last            (axi_core_cpu_dBus_cmd_m2sPipe_m2sPipe_s2mPipe_payload_last           ), //i
    .io_outputs_0_valid               (streamFork_4_io_outputs_0_valid                                      ), //o
    .io_outputs_0_ready               (streamFork_4_io_outputs_0_ready                                      ), //i
    .io_outputs_0_payload_wr          (streamFork_4_io_outputs_0_payload_wr                                 ), //o
    .io_outputs_0_payload_uncached    (streamFork_4_io_outputs_0_payload_uncached                           ), //o
    .io_outputs_0_payload_address     (streamFork_4_io_outputs_0_payload_address[31:0]                      ), //o
    .io_outputs_0_payload_data        (streamFork_4_io_outputs_0_payload_data[31:0]                         ), //o
    .io_outputs_0_payload_mask        (streamFork_4_io_outputs_0_payload_mask[3:0]                          ), //o
    .io_outputs_0_payload_size        (streamFork_4_io_outputs_0_payload_size[2:0]                          ), //o
    .io_outputs_0_payload_last        (streamFork_4_io_outputs_0_payload_last                               ), //o
    .io_outputs_1_valid               (streamFork_4_io_outputs_1_valid                                      ), //o
    .io_outputs_1_ready               (streamFork_4_io_outputs_1_ready                                      ), //i
    .io_outputs_1_payload_wr          (streamFork_4_io_outputs_1_payload_wr                                 ), //o
    .io_outputs_1_payload_uncached    (streamFork_4_io_outputs_1_payload_uncached                           ), //o
    .io_outputs_1_payload_address     (streamFork_4_io_outputs_1_payload_address[31:0]                      ), //o
    .io_outputs_1_payload_data        (streamFork_4_io_outputs_1_payload_data[31:0]                         ), //o
    .io_outputs_1_payload_mask        (streamFork_4_io_outputs_1_payload_mask[3:0]                          ), //o
    .io_outputs_1_payload_size        (streamFork_4_io_outputs_1_payload_size[2:0]                          ), //o
    .io_outputs_1_payload_last        (streamFork_4_io_outputs_1_payload_last                               ), //o
    .axiClk                           (axiClk                                                               ), //i
    .resetCtrl_axiReset               (resetCtrl_axiReset                                                   )  //i
  );
  JtagBridge jtagBridge_1 (
    .io_jtag_tms                       (jtag_tms                                           ), //i
    .io_jtag_tdi                       (jtag_tdi                                           ), //i
    .io_jtag_tdo                       (jtagBridge_1_io_jtag_tdo                           ), //o
    .io_jtag_tck                       (jtag_tck                                           ), //i
    .io_remote_cmd_valid               (jtagBridge_1_io_remote_cmd_valid                   ), //o
    .io_remote_cmd_ready               (systemDebugger_1_io_remote_cmd_ready               ), //i
    .io_remote_cmd_payload_last        (jtagBridge_1_io_remote_cmd_payload_last            ), //o
    .io_remote_cmd_payload_fragment    (jtagBridge_1_io_remote_cmd_payload_fragment        ), //o
    .io_remote_rsp_valid               (systemDebugger_1_io_remote_rsp_valid               ), //i
    .io_remote_rsp_ready               (jtagBridge_1_io_remote_rsp_ready                   ), //o
    .io_remote_rsp_payload_error       (systemDebugger_1_io_remote_rsp_payload_error       ), //i
    .io_remote_rsp_payload_data        (systemDebugger_1_io_remote_rsp_payload_data[31:0]  ), //i
    .axiClk                            (axiClk                                             ), //i
    .resetCtrl_systemReset             (resetCtrl_systemReset                              )  //i
  );
  SystemDebugger systemDebugger_1 (
    .io_remote_cmd_valid               (jtagBridge_1_io_remote_cmd_valid                   ), //i
    .io_remote_cmd_ready               (systemDebugger_1_io_remote_cmd_ready               ), //o
    .io_remote_cmd_payload_last        (jtagBridge_1_io_remote_cmd_payload_last            ), //i
    .io_remote_cmd_payload_fragment    (jtagBridge_1_io_remote_cmd_payload_fragment        ), //i
    .io_remote_rsp_valid               (systemDebugger_1_io_remote_rsp_valid               ), //o
    .io_remote_rsp_ready               (jtagBridge_1_io_remote_rsp_ready                   ), //i
    .io_remote_rsp_payload_error       (systemDebugger_1_io_remote_rsp_payload_error       ), //o
    .io_remote_rsp_payload_data        (systemDebugger_1_io_remote_rsp_payload_data[31:0]  ), //o
    .io_mem_cmd_valid                  (systemDebugger_1_io_mem_cmd_valid                  ), //o
    .io_mem_cmd_ready                  (axi_core_cpu_debug_bus_cmd_ready                   ), //i
    .io_mem_cmd_payload_address        (systemDebugger_1_io_mem_cmd_payload_address[31:0]  ), //o
    .io_mem_cmd_payload_data           (systemDebugger_1_io_mem_cmd_payload_data[31:0]     ), //o
    .io_mem_cmd_payload_wr             (systemDebugger_1_io_mem_cmd_payload_wr             ), //o
    .io_mem_cmd_payload_size           (systemDebugger_1_io_mem_cmd_payload_size[1:0]      ), //o
    .io_mem_rsp_valid                  (axi_core_cpu_debug_bus_cmd_fire_regNext            ), //i
    .io_mem_rsp_payload                (axi_core_cpu_debug_bus_rsp_data[31:0]              ), //i
    .axiClk                            (axiClk                                             ), //i
    .resetCtrl_systemReset             (resetCtrl_systemReset                              )  //i
  );
  Axi4ReadOnlyDecoder axi4ReadOnlyDecoder_2 (
    .io_input_ar_valid                (_zz_io_input_ar_valid                                                        ), //i
    .io_input_ar_ready                (axi4ReadOnlyDecoder_2_io_input_ar_ready                                      ), //o
    .io_input_ar_payload_addr         (_zz_io_input_ar_payload_addr[31:0]                                           ), //i
    .io_input_ar_payload_len          (8'h07                                                                        ), //i
    .io_input_ar_payload_burst        (2'b01                                                                        ), //i
    .io_input_ar_payload_cache        (4'b1111                                                                      ), //i
    .io_input_ar_payload_prot         (3'b110                                                                       ), //i
    .io_input_r_valid                 (axi4ReadOnlyDecoder_2_io_input_r_valid                                       ), //o
    .io_input_r_ready                 (1'b1                                                                         ), //i
    .io_input_r_payload_data          (axi4ReadOnlyDecoder_2_io_input_r_payload_data[31:0]                          ), //o
    .io_input_r_payload_resp          (axi4ReadOnlyDecoder_2_io_input_r_payload_resp[1:0]                           ), //o
    .io_input_r_payload_last          (axi4ReadOnlyDecoder_2_io_input_r_payload_last                                ), //o
    .io_outputs_0_ar_valid            (axi4ReadOnlyDecoder_2_io_outputs_0_ar_valid                                  ), //o
    .io_outputs_0_ar_ready            (axi4ReadOnlyDecoder_2_io_outputs_0_ar_validPipe_fire_1                       ), //i
    .io_outputs_0_ar_payload_addr     (axi4ReadOnlyDecoder_2_io_outputs_0_ar_payload_addr[31:0]                     ), //o
    .io_outputs_0_ar_payload_len      (axi4ReadOnlyDecoder_2_io_outputs_0_ar_payload_len[7:0]                       ), //o
    .io_outputs_0_ar_payload_burst    (axi4ReadOnlyDecoder_2_io_outputs_0_ar_payload_burst[1:0]                     ), //o
    .io_outputs_0_ar_payload_cache    (axi4ReadOnlyDecoder_2_io_outputs_0_ar_payload_cache[3:0]                     ), //o
    .io_outputs_0_ar_payload_prot     (axi4ReadOnlyDecoder_2_io_outputs_0_ar_payload_prot[2:0]                      ), //o
    .io_outputs_0_r_valid             (axi_ram_io_axi_arbiter_io_readInputs_0_r_valid                               ), //i
    .io_outputs_0_r_ready             (axi4ReadOnlyDecoder_2_io_outputs_0_r_ready                                   ), //o
    .io_outputs_0_r_payload_data      (axi_ram_io_axi_arbiter_io_readInputs_0_r_payload_data[31:0]                  ), //i
    .io_outputs_0_r_payload_resp      (axi_ram_io_axi_arbiter_io_readInputs_0_r_payload_resp[1:0]                   ), //i
    .io_outputs_0_r_payload_last      (axi_ram_io_axi_arbiter_io_readInputs_0_r_payload_last                        ), //i
    .io_outputs_1_ar_valid            (axi4ReadOnlyDecoder_2_io_outputs_1_ar_valid                                  ), //o
    .io_outputs_1_ar_ready            (axi4ReadOnlyDecoder_2_io_outputs_1_ar_validPipe_fire_1                       ), //i
    .io_outputs_1_ar_payload_addr     (axi4ReadOnlyDecoder_2_io_outputs_1_ar_payload_addr[31:0]                     ), //o
    .io_outputs_1_ar_payload_len      (axi4ReadOnlyDecoder_2_io_outputs_1_ar_payload_len[7:0]                       ), //o
    .io_outputs_1_ar_payload_burst    (axi4ReadOnlyDecoder_2_io_outputs_1_ar_payload_burst[1:0]                     ), //o
    .io_outputs_1_ar_payload_cache    (axi4ReadOnlyDecoder_2_io_outputs_1_ar_payload_cache[3:0]                     ), //o
    .io_outputs_1_ar_payload_prot     (axi4ReadOnlyDecoder_2_io_outputs_1_ar_payload_prot[2:0]                      ), //o
    .io_outputs_1_r_valid             (sdramCtrlArea_sdramCtrl_io_axi_arbiter_io_readInputs_0_r_valid               ), //i
    .io_outputs_1_r_ready             (axi4ReadOnlyDecoder_2_io_outputs_1_r_ready                                   ), //o
    .io_outputs_1_r_payload_data      (sdramCtrlArea_sdramCtrl_io_axi_arbiter_io_readInputs_0_r_payload_data[31:0]  ), //i
    .io_outputs_1_r_payload_resp      (sdramCtrlArea_sdramCtrl_io_axi_arbiter_io_readInputs_0_r_payload_resp[1:0]   ), //i
    .io_outputs_1_r_payload_last      (sdramCtrlArea_sdramCtrl_io_axi_arbiter_io_readInputs_0_r_payload_last        ), //i
    .axiClk                           (axiClk                                                                       ), //i
    .resetCtrl_axiReset               (resetCtrl_axiReset                                                           )  //i
  );
  Axi4SharedDecoder dbus_axi_decoder (
    .io_input_arw_valid                      (dbus_axi_arw_valid                                                             ), //i
    .io_input_arw_ready                      (dbus_axi_decoder_io_input_arw_ready                                            ), //o
    .io_input_arw_payload_addr               (dbus_axi_arw_payload_addr[31:0]                                                ), //i
    .io_input_arw_payload_len                (dbus_axi_arw_payload_len[7:0]                                                  ), //i
    .io_input_arw_payload_size               (dbus_axi_arw_payload_size[2:0]                                                 ), //i
    .io_input_arw_payload_cache              (dbus_axi_arw_payload_cache[3:0]                                                ), //i
    .io_input_arw_payload_prot               (dbus_axi_arw_payload_prot[2:0]                                                 ), //i
    .io_input_arw_payload_write              (dbus_axi_arw_payload_write                                                     ), //i
    .io_input_w_valid                        (dbus_axi_w_valid                                                               ), //i
    .io_input_w_ready                        (dbus_axi_decoder_io_input_w_ready                                              ), //o
    .io_input_w_payload_data                 (dbus_axi_w_payload_data[31:0]                                                  ), //i
    .io_input_w_payload_strb                 (dbus_axi_w_payload_strb[3:0]                                                   ), //i
    .io_input_w_payload_last                 (dbus_axi_w_payload_last                                                        ), //i
    .io_input_b_valid                        (dbus_axi_decoder_io_input_b_valid                                              ), //o
    .io_input_b_ready                        (dbus_axi_b_ready                                                               ), //i
    .io_input_b_payload_resp                 (dbus_axi_decoder_io_input_b_payload_resp[1:0]                                  ), //o
    .io_input_r_valid                        (dbus_axi_decoder_io_input_r_valid                                              ), //o
    .io_input_r_ready                        (dbus_axi_decoder_io_input_r_ready                                              ), //i
    .io_input_r_payload_data                 (dbus_axi_decoder_io_input_r_payload_data[31:0]                                 ), //o
    .io_input_r_payload_resp                 (dbus_axi_decoder_io_input_r_payload_resp[1:0]                                  ), //o
    .io_input_r_payload_last                 (dbus_axi_decoder_io_input_r_payload_last                                       ), //o
    .io_sharedOutputs_0_arw_valid            (dbus_axi_decoder_io_sharedOutputs_0_arw_valid                                  ), //o
    .io_sharedOutputs_0_arw_ready            (dbus_axi_decoder_io_sharedOutputs_0_arw_validPipe_fire_1                       ), //i
    .io_sharedOutputs_0_arw_payload_addr     (dbus_axi_decoder_io_sharedOutputs_0_arw_payload_addr[31:0]                     ), //o
    .io_sharedOutputs_0_arw_payload_len      (dbus_axi_decoder_io_sharedOutputs_0_arw_payload_len[7:0]                       ), //o
    .io_sharedOutputs_0_arw_payload_size     (dbus_axi_decoder_io_sharedOutputs_0_arw_payload_size[2:0]                      ), //o
    .io_sharedOutputs_0_arw_payload_cache    (dbus_axi_decoder_io_sharedOutputs_0_arw_payload_cache[3:0]                     ), //o
    .io_sharedOutputs_0_arw_payload_prot     (dbus_axi_decoder_io_sharedOutputs_0_arw_payload_prot[2:0]                      ), //o
    .io_sharedOutputs_0_arw_payload_write    (dbus_axi_decoder_io_sharedOutputs_0_arw_payload_write                          ), //o
    .io_sharedOutputs_0_w_valid              (dbus_axi_decoder_io_sharedOutputs_0_w_valid                                    ), //o
    .io_sharedOutputs_0_w_ready              (axi_ram_io_axi_arbiter_io_sharedInputs_0_w_ready                               ), //i
    .io_sharedOutputs_0_w_payload_data       (dbus_axi_decoder_io_sharedOutputs_0_w_payload_data[31:0]                       ), //o
    .io_sharedOutputs_0_w_payload_strb       (dbus_axi_decoder_io_sharedOutputs_0_w_payload_strb[3:0]                        ), //o
    .io_sharedOutputs_0_w_payload_last       (dbus_axi_decoder_io_sharedOutputs_0_w_payload_last                             ), //o
    .io_sharedOutputs_0_b_valid              (axi_ram_io_axi_arbiter_io_sharedInputs_0_b_valid                               ), //i
    .io_sharedOutputs_0_b_ready              (dbus_axi_decoder_io_sharedOutputs_0_b_ready                                    ), //o
    .io_sharedOutputs_0_b_payload_resp       (axi_ram_io_axi_arbiter_io_sharedInputs_0_b_payload_resp[1:0]                   ), //i
    .io_sharedOutputs_0_r_valid              (axi_ram_io_axi_arbiter_io_sharedInputs_0_r_valid                               ), //i
    .io_sharedOutputs_0_r_ready              (dbus_axi_decoder_io_sharedOutputs_0_r_ready                                    ), //o
    .io_sharedOutputs_0_r_payload_data       (axi_ram_io_axi_arbiter_io_sharedInputs_0_r_payload_data[31:0]                  ), //i
    .io_sharedOutputs_0_r_payload_resp       (axi_ram_io_axi_arbiter_io_sharedInputs_0_r_payload_resp[1:0]                   ), //i
    .io_sharedOutputs_0_r_payload_last       (axi_ram_io_axi_arbiter_io_sharedInputs_0_r_payload_last                        ), //i
    .io_sharedOutputs_1_arw_valid            (dbus_axi_decoder_io_sharedOutputs_1_arw_valid                                  ), //o
    .io_sharedOutputs_1_arw_ready            (dbus_axi_decoder_io_sharedOutputs_1_arw_validPipe_fire_1                       ), //i
    .io_sharedOutputs_1_arw_payload_addr     (dbus_axi_decoder_io_sharedOutputs_1_arw_payload_addr[31:0]                     ), //o
    .io_sharedOutputs_1_arw_payload_len      (dbus_axi_decoder_io_sharedOutputs_1_arw_payload_len[7:0]                       ), //o
    .io_sharedOutputs_1_arw_payload_size     (dbus_axi_decoder_io_sharedOutputs_1_arw_payload_size[2:0]                      ), //o
    .io_sharedOutputs_1_arw_payload_cache    (dbus_axi_decoder_io_sharedOutputs_1_arw_payload_cache[3:0]                     ), //o
    .io_sharedOutputs_1_arw_payload_prot     (dbus_axi_decoder_io_sharedOutputs_1_arw_payload_prot[2:0]                      ), //o
    .io_sharedOutputs_1_arw_payload_write    (dbus_axi_decoder_io_sharedOutputs_1_arw_payload_write                          ), //o
    .io_sharedOutputs_1_w_valid              (dbus_axi_decoder_io_sharedOutputs_1_w_valid                                    ), //o
    .io_sharedOutputs_1_w_ready              (sdramCtrlArea_sdramCtrl_io_axi_arbiter_io_sharedInputs_0_w_ready               ), //i
    .io_sharedOutputs_1_w_payload_data       (dbus_axi_decoder_io_sharedOutputs_1_w_payload_data[31:0]                       ), //o
    .io_sharedOutputs_1_w_payload_strb       (dbus_axi_decoder_io_sharedOutputs_1_w_payload_strb[3:0]                        ), //o
    .io_sharedOutputs_1_w_payload_last       (dbus_axi_decoder_io_sharedOutputs_1_w_payload_last                             ), //o
    .io_sharedOutputs_1_b_valid              (sdramCtrlArea_sdramCtrl_io_axi_arbiter_io_sharedInputs_0_b_valid               ), //i
    .io_sharedOutputs_1_b_ready              (dbus_axi_decoder_io_sharedOutputs_1_b_ready                                    ), //o
    .io_sharedOutputs_1_b_payload_resp       (sdramCtrlArea_sdramCtrl_io_axi_arbiter_io_sharedInputs_0_b_payload_resp[1:0]   ), //i
    .io_sharedOutputs_1_r_valid              (sdramCtrlArea_sdramCtrl_io_axi_arbiter_io_sharedInputs_0_r_valid               ), //i
    .io_sharedOutputs_1_r_ready              (dbus_axi_decoder_io_sharedOutputs_1_r_ready                                    ), //o
    .io_sharedOutputs_1_r_payload_data       (sdramCtrlArea_sdramCtrl_io_axi_arbiter_io_sharedInputs_0_r_payload_data[31:0]  ), //i
    .io_sharedOutputs_1_r_payload_resp       (sdramCtrlArea_sdramCtrl_io_axi_arbiter_io_sharedInputs_0_r_payload_resp[1:0]   ), //i
    .io_sharedOutputs_1_r_payload_last       (sdramCtrlArea_sdramCtrl_io_axi_arbiter_io_sharedInputs_0_r_payload_last        ), //i
    .io_sharedOutputs_2_arw_valid            (dbus_axi_decoder_io_sharedOutputs_2_arw_valid                                  ), //o
    .io_sharedOutputs_2_arw_ready            (dbus_axi_decoder_io_sharedOutputs_2_arw_validPipe_fire_1                       ), //i
    .io_sharedOutputs_2_arw_payload_addr     (dbus_axi_decoder_io_sharedOutputs_2_arw_payload_addr[31:0]                     ), //o
    .io_sharedOutputs_2_arw_payload_len      (dbus_axi_decoder_io_sharedOutputs_2_arw_payload_len[7:0]                       ), //o
    .io_sharedOutputs_2_arw_payload_size     (dbus_axi_decoder_io_sharedOutputs_2_arw_payload_size[2:0]                      ), //o
    .io_sharedOutputs_2_arw_payload_cache    (dbus_axi_decoder_io_sharedOutputs_2_arw_payload_cache[3:0]                     ), //o
    .io_sharedOutputs_2_arw_payload_prot     (dbus_axi_decoder_io_sharedOutputs_2_arw_payload_prot[2:0]                      ), //o
    .io_sharedOutputs_2_arw_payload_write    (dbus_axi_decoder_io_sharedOutputs_2_arw_payload_write                          ), //o
    .io_sharedOutputs_2_w_valid              (dbus_axi_decoder_io_sharedOutputs_2_w_valid                                    ), //o
    .io_sharedOutputs_2_w_ready              (axi_apbBridge_io_axi_arbiter_io_sharedInputs_0_w_ready                         ), //i
    .io_sharedOutputs_2_w_payload_data       (dbus_axi_decoder_io_sharedOutputs_2_w_payload_data[31:0]                       ), //o
    .io_sharedOutputs_2_w_payload_strb       (dbus_axi_decoder_io_sharedOutputs_2_w_payload_strb[3:0]                        ), //o
    .io_sharedOutputs_2_w_payload_last       (dbus_axi_decoder_io_sharedOutputs_2_w_payload_last                             ), //o
    .io_sharedOutputs_2_b_valid              (axi_apbBridge_io_axi_arbiter_io_sharedInputs_0_b_valid                         ), //i
    .io_sharedOutputs_2_b_ready              (dbus_axi_decoder_io_sharedOutputs_2_b_ready                                    ), //o
    .io_sharedOutputs_2_b_payload_resp       (axi_apbBridge_io_axi_arbiter_io_sharedInputs_0_b_payload_resp[1:0]             ), //i
    .io_sharedOutputs_2_r_valid              (axi_apbBridge_io_axi_arbiter_io_sharedInputs_0_r_valid                         ), //i
    .io_sharedOutputs_2_r_ready              (dbus_axi_decoder_io_sharedOutputs_2_r_ready                                    ), //o
    .io_sharedOutputs_2_r_payload_data       (axi_apbBridge_io_axi_arbiter_io_sharedInputs_0_r_payload_data[31:0]            ), //i
    .io_sharedOutputs_2_r_payload_resp       (axi_apbBridge_io_axi_arbiter_io_sharedInputs_0_r_payload_resp[1:0]             ), //i
    .io_sharedOutputs_2_r_payload_last       (axi_apbBridge_io_axi_arbiter_io_sharedInputs_0_r_payload_last                  ), //i
    .axiClk                                  (axiClk                                                                         ), //i
    .resetCtrl_axiReset                      (resetCtrl_axiReset                                                             )  //i
  );
  Axi4ReadOnlyDecoder_1 vgaArea_vgaCtrl_io_axi_decoder (
    .io_input_ar_valid                (vgaArea_vgaCtrl_io_axi_ar_halfPipe_valid                                     ), //i
    .io_input_ar_ready                (vgaArea_vgaCtrl_io_axi_decoder_io_input_ar_ready                             ), //o
    .io_input_ar_payload_addr         (vgaArea_vgaCtrl_io_axi_ar_halfPipe_payload_addr[31:0]                        ), //i
    .io_input_ar_payload_len          (vgaArea_vgaCtrl_io_axi_ar_halfPipe_payload_len[7:0]                          ), //i
    .io_input_ar_payload_size         (vgaArea_vgaCtrl_io_axi_ar_halfPipe_payload_size[2:0]                         ), //i
    .io_input_ar_payload_cache        (vgaArea_vgaCtrl_io_axi_ar_halfPipe_payload_cache[3:0]                        ), //i
    .io_input_ar_payload_prot         (vgaArea_vgaCtrl_io_axi_ar_halfPipe_payload_prot[2:0]                         ), //i
    .io_input_r_valid                 (vgaArea_vgaCtrl_io_axi_decoder_io_input_r_valid                              ), //o
    .io_input_r_ready                 (vgaArea_vgaCtrl_io_axi_r_ready                                               ), //i
    .io_input_r_payload_data          (vgaArea_vgaCtrl_io_axi_decoder_io_input_r_payload_data[31:0]                 ), //o
    .io_input_r_payload_last          (vgaArea_vgaCtrl_io_axi_decoder_io_input_r_payload_last                       ), //o
    .io_outputs_0_ar_valid            (vgaArea_vgaCtrl_io_axi_decoder_io_outputs_0_ar_valid                         ), //o
    .io_outputs_0_ar_ready            (vgaArea_vgaCtrl_io_axi_decoder_io_outputs_0_ar_validPipe_fire_1              ), //i
    .io_outputs_0_ar_payload_addr     (vgaArea_vgaCtrl_io_axi_decoder_io_outputs_0_ar_payload_addr[31:0]            ), //o
    .io_outputs_0_ar_payload_len      (vgaArea_vgaCtrl_io_axi_decoder_io_outputs_0_ar_payload_len[7:0]              ), //o
    .io_outputs_0_ar_payload_size     (vgaArea_vgaCtrl_io_axi_decoder_io_outputs_0_ar_payload_size[2:0]             ), //o
    .io_outputs_0_ar_payload_cache    (vgaArea_vgaCtrl_io_axi_decoder_io_outputs_0_ar_payload_cache[3:0]            ), //o
    .io_outputs_0_ar_payload_prot     (vgaArea_vgaCtrl_io_axi_decoder_io_outputs_0_ar_payload_prot[2:0]             ), //o
    .io_outputs_0_r_valid             (sdramCtrlArea_sdramCtrl_io_axi_arbiter_io_readInputs_1_r_valid               ), //i
    .io_outputs_0_r_ready             (vgaArea_vgaCtrl_io_axi_decoder_io_outputs_0_r_ready                          ), //o
    .io_outputs_0_r_payload_data      (sdramCtrlArea_sdramCtrl_io_axi_arbiter_io_readInputs_1_r_payload_data[31:0]  ), //i
    .io_outputs_0_r_payload_last      (sdramCtrlArea_sdramCtrl_io_axi_arbiter_io_readInputs_1_r_payload_last        ), //i
    .axiClk                           (axiClk                                                                       ), //i
    .resetCtrl_axiReset               (resetCtrl_axiReset                                                           )  //i
  );
  Axi4SharedArbiter sdramCtrlArea_sdramCtrl_io_axi_arbiter (
    .io_readInputs_0_ar_valid               (axi4ReadOnlyDecoder_2_io_outputs_1_ar_validPipe_valid                            ), //i
    .io_readInputs_0_ar_ready               (sdramCtrlArea_sdramCtrl_io_axi_arbiter_io_readInputs_0_ar_ready                  ), //o
    .io_readInputs_0_ar_payload_addr        (sdramCtrlArea_sdramCtrl_io_axi_arbiter_io_readInputs_0_ar_payload_addr[22:0]     ), //i
    .io_readInputs_0_ar_payload_id          (_zz_io_readInputs_0_ar_payload_id[1:0]                                           ), //i
    .io_readInputs_0_ar_payload_len         (axi4ReadOnlyDecoder_2_io_outputs_1_ar_validPipe_payload_len[7:0]                 ), //i
    .io_readInputs_0_ar_payload_size        (3'b010                                                                           ), //i
    .io_readInputs_0_ar_payload_burst       (axi4ReadOnlyDecoder_2_io_outputs_1_ar_validPipe_payload_burst[1:0]               ), //i
    .io_readInputs_0_r_valid                (sdramCtrlArea_sdramCtrl_io_axi_arbiter_io_readInputs_0_r_valid                   ), //o
    .io_readInputs_0_r_ready                (axi4ReadOnlyDecoder_2_io_outputs_1_r_ready                                       ), //i
    .io_readInputs_0_r_payload_data         (sdramCtrlArea_sdramCtrl_io_axi_arbiter_io_readInputs_0_r_payload_data[31:0]      ), //o
    .io_readInputs_0_r_payload_id           (sdramCtrlArea_sdramCtrl_io_axi_arbiter_io_readInputs_0_r_payload_id[1:0]         ), //o
    .io_readInputs_0_r_payload_resp         (sdramCtrlArea_sdramCtrl_io_axi_arbiter_io_readInputs_0_r_payload_resp[1:0]       ), //o
    .io_readInputs_0_r_payload_last         (sdramCtrlArea_sdramCtrl_io_axi_arbiter_io_readInputs_0_r_payload_last            ), //o
    .io_readInputs_1_ar_valid               (vgaArea_vgaCtrl_io_axi_decoder_io_outputs_0_ar_validPipe_valid                   ), //i
    .io_readInputs_1_ar_ready               (sdramCtrlArea_sdramCtrl_io_axi_arbiter_io_readInputs_1_ar_ready                  ), //o
    .io_readInputs_1_ar_payload_addr        (sdramCtrlArea_sdramCtrl_io_axi_arbiter_io_readInputs_1_ar_payload_addr[22:0]     ), //i
    .io_readInputs_1_ar_payload_id          (_zz_io_readInputs_1_ar_payload_id[1:0]                                           ), //i
    .io_readInputs_1_ar_payload_len         (vgaArea_vgaCtrl_io_axi_decoder_io_outputs_0_ar_validPipe_payload_len[7:0]        ), //i
    .io_readInputs_1_ar_payload_size        (vgaArea_vgaCtrl_io_axi_decoder_io_outputs_0_ar_validPipe_payload_size[2:0]       ), //i
    .io_readInputs_1_ar_payload_burst       (2'b01                                                                            ), //i
    .io_readInputs_1_r_valid                (sdramCtrlArea_sdramCtrl_io_axi_arbiter_io_readInputs_1_r_valid                   ), //o
    .io_readInputs_1_r_ready                (vgaArea_vgaCtrl_io_axi_decoder_io_outputs_0_r_ready                              ), //i
    .io_readInputs_1_r_payload_data         (sdramCtrlArea_sdramCtrl_io_axi_arbiter_io_readInputs_1_r_payload_data[31:0]      ), //o
    .io_readInputs_1_r_payload_id           (sdramCtrlArea_sdramCtrl_io_axi_arbiter_io_readInputs_1_r_payload_id[1:0]         ), //o
    .io_readInputs_1_r_payload_resp         (sdramCtrlArea_sdramCtrl_io_axi_arbiter_io_readInputs_1_r_payload_resp[1:0]       ), //o
    .io_readInputs_1_r_payload_last         (sdramCtrlArea_sdramCtrl_io_axi_arbiter_io_readInputs_1_r_payload_last            ), //o
    .io_sharedInputs_0_arw_valid            (dbus_axi_decoder_io_sharedOutputs_1_arw_validPipe_valid                          ), //i
    .io_sharedInputs_0_arw_ready            (sdramCtrlArea_sdramCtrl_io_axi_arbiter_io_sharedInputs_0_arw_ready               ), //o
    .io_sharedInputs_0_arw_payload_addr     (sdramCtrlArea_sdramCtrl_io_axi_arbiter_io_sharedInputs_0_arw_payload_addr[22:0]  ), //i
    .io_sharedInputs_0_arw_payload_id       (_zz_io_sharedInputs_0_arw_payload_id[1:0]                                        ), //i
    .io_sharedInputs_0_arw_payload_len      (dbus_axi_decoder_io_sharedOutputs_1_arw_validPipe_payload_len[7:0]               ), //i
    .io_sharedInputs_0_arw_payload_size     (dbus_axi_decoder_io_sharedOutputs_1_arw_validPipe_payload_size[2:0]              ), //i
    .io_sharedInputs_0_arw_payload_burst    (2'b01                                                                            ), //i
    .io_sharedInputs_0_arw_payload_write    (dbus_axi_decoder_io_sharedOutputs_1_arw_validPipe_payload_write                  ), //i
    .io_sharedInputs_0_w_valid              (dbus_axi_decoder_io_sharedOutputs_1_w_valid                                      ), //i
    .io_sharedInputs_0_w_ready              (sdramCtrlArea_sdramCtrl_io_axi_arbiter_io_sharedInputs_0_w_ready                 ), //o
    .io_sharedInputs_0_w_payload_data       (dbus_axi_decoder_io_sharedOutputs_1_w_payload_data[31:0]                         ), //i
    .io_sharedInputs_0_w_payload_strb       (dbus_axi_decoder_io_sharedOutputs_1_w_payload_strb[3:0]                          ), //i
    .io_sharedInputs_0_w_payload_last       (dbus_axi_decoder_io_sharedOutputs_1_w_payload_last                               ), //i
    .io_sharedInputs_0_b_valid              (sdramCtrlArea_sdramCtrl_io_axi_arbiter_io_sharedInputs_0_b_valid                 ), //o
    .io_sharedInputs_0_b_ready              (dbus_axi_decoder_io_sharedOutputs_1_b_ready                                      ), //i
    .io_sharedInputs_0_b_payload_id         (sdramCtrlArea_sdramCtrl_io_axi_arbiter_io_sharedInputs_0_b_payload_id[1:0]       ), //o
    .io_sharedInputs_0_b_payload_resp       (sdramCtrlArea_sdramCtrl_io_axi_arbiter_io_sharedInputs_0_b_payload_resp[1:0]     ), //o
    .io_sharedInputs_0_r_valid              (sdramCtrlArea_sdramCtrl_io_axi_arbiter_io_sharedInputs_0_r_valid                 ), //o
    .io_sharedInputs_0_r_ready              (dbus_axi_decoder_io_sharedOutputs_1_r_ready                                      ), //i
    .io_sharedInputs_0_r_payload_data       (sdramCtrlArea_sdramCtrl_io_axi_arbiter_io_sharedInputs_0_r_payload_data[31:0]    ), //o
    .io_sharedInputs_0_r_payload_id         (sdramCtrlArea_sdramCtrl_io_axi_arbiter_io_sharedInputs_0_r_payload_id[1:0]       ), //o
    .io_sharedInputs_0_r_payload_resp       (sdramCtrlArea_sdramCtrl_io_axi_arbiter_io_sharedInputs_0_r_payload_resp[1:0]     ), //o
    .io_sharedInputs_0_r_payload_last       (sdramCtrlArea_sdramCtrl_io_axi_arbiter_io_sharedInputs_0_r_payload_last          ), //o
    .io_output_arw_valid                    (sdramCtrlArea_sdramCtrl_io_axi_arbiter_io_output_arw_valid                       ), //o
    .io_output_arw_ready                    (sdramCtrlArea_sdramCtrl_io_axi_arbiter_io_output_arw_ready                       ), //i
    .io_output_arw_payload_addr             (sdramCtrlArea_sdramCtrl_io_axi_arbiter_io_output_arw_payload_addr[22:0]          ), //o
    .io_output_arw_payload_id               (sdramCtrlArea_sdramCtrl_io_axi_arbiter_io_output_arw_payload_id[3:0]             ), //o
    .io_output_arw_payload_len              (sdramCtrlArea_sdramCtrl_io_axi_arbiter_io_output_arw_payload_len[7:0]            ), //o
    .io_output_arw_payload_size             (sdramCtrlArea_sdramCtrl_io_axi_arbiter_io_output_arw_payload_size[2:0]           ), //o
    .io_output_arw_payload_burst            (sdramCtrlArea_sdramCtrl_io_axi_arbiter_io_output_arw_payload_burst[1:0]          ), //o
    .io_output_arw_payload_write            (sdramCtrlArea_sdramCtrl_io_axi_arbiter_io_output_arw_payload_write               ), //o
    .io_output_w_valid                      (sdramCtrlArea_sdramCtrl_io_axi_arbiter_io_output_w_valid                         ), //o
    .io_output_w_ready                      (sdramCtrlArea_sdramCtrl_io_axi_arbiter_io_output_w_ready                         ), //i
    .io_output_w_payload_data               (sdramCtrlArea_sdramCtrl_io_axi_arbiter_io_output_w_payload_data[31:0]            ), //o
    .io_output_w_payload_strb               (sdramCtrlArea_sdramCtrl_io_axi_arbiter_io_output_w_payload_strb[3:0]             ), //o
    .io_output_w_payload_last               (sdramCtrlArea_sdramCtrl_io_axi_arbiter_io_output_w_payload_last                  ), //o
    .io_output_b_valid                      (sdramCtrlArea_sdramCtrl_io_axi_b_valid                                           ), //i
    .io_output_b_ready                      (sdramCtrlArea_sdramCtrl_io_axi_arbiter_io_output_b_ready                         ), //o
    .io_output_b_payload_id                 (sdramCtrlArea_sdramCtrl_io_axi_b_payload_id[3:0]                                 ), //i
    .io_output_b_payload_resp               (sdramCtrlArea_sdramCtrl_io_axi_b_payload_resp[1:0]                               ), //i
    .io_output_r_valid                      (sdramCtrlArea_sdramCtrl_io_axi_r_valid                                           ), //i
    .io_output_r_ready                      (sdramCtrlArea_sdramCtrl_io_axi_arbiter_io_output_r_ready                         ), //o
    .io_output_r_payload_data               (sdramCtrlArea_sdramCtrl_io_axi_r_payload_data[31:0]                              ), //i
    .io_output_r_payload_id                 (sdramCtrlArea_sdramCtrl_io_axi_r_payload_id[3:0]                                 ), //i
    .io_output_r_payload_resp               (sdramCtrlArea_sdramCtrl_io_axi_r_payload_resp[1:0]                               ), //i
    .io_output_r_payload_last               (sdramCtrlArea_sdramCtrl_io_axi_r_payload_last                                    ), //i
    .axiClk                                 (axiClk                                                                           ), //i
    .resetCtrl_axiReset                     (resetCtrl_axiReset                                                               )  //i
  );
  Axi4SharedArbiter_1 axi_ram_io_axi_arbiter (
    .io_readInputs_0_ar_valid               (axi4ReadOnlyDecoder_2_io_outputs_0_ar_validPipe_valid                ), //i
    .io_readInputs_0_ar_ready               (axi_ram_io_axi_arbiter_io_readInputs_0_ar_ready                      ), //o
    .io_readInputs_0_ar_payload_addr        (axi_ram_io_axi_arbiter_io_readInputs_0_ar_payload_addr[14:0]         ), //i
    .io_readInputs_0_ar_payload_id          (_zz_io_readInputs_0_ar_payload_id_1[2:0]                             ), //i
    .io_readInputs_0_ar_payload_len         (axi4ReadOnlyDecoder_2_io_outputs_0_ar_validPipe_payload_len[7:0]     ), //i
    .io_readInputs_0_ar_payload_size        (3'b010                                                               ), //i
    .io_readInputs_0_ar_payload_burst       (axi4ReadOnlyDecoder_2_io_outputs_0_ar_validPipe_payload_burst[1:0]   ), //i
    .io_readInputs_0_r_valid                (axi_ram_io_axi_arbiter_io_readInputs_0_r_valid                       ), //o
    .io_readInputs_0_r_ready                (axi4ReadOnlyDecoder_2_io_outputs_0_r_ready                           ), //i
    .io_readInputs_0_r_payload_data         (axi_ram_io_axi_arbiter_io_readInputs_0_r_payload_data[31:0]          ), //o
    .io_readInputs_0_r_payload_id           (axi_ram_io_axi_arbiter_io_readInputs_0_r_payload_id[2:0]             ), //o
    .io_readInputs_0_r_payload_resp         (axi_ram_io_axi_arbiter_io_readInputs_0_r_payload_resp[1:0]           ), //o
    .io_readInputs_0_r_payload_last         (axi_ram_io_axi_arbiter_io_readInputs_0_r_payload_last                ), //o
    .io_sharedInputs_0_arw_valid            (dbus_axi_decoder_io_sharedOutputs_0_arw_validPipe_valid              ), //i
    .io_sharedInputs_0_arw_ready            (axi_ram_io_axi_arbiter_io_sharedInputs_0_arw_ready                   ), //o
    .io_sharedInputs_0_arw_payload_addr     (axi_ram_io_axi_arbiter_io_sharedInputs_0_arw_payload_addr[14:0]      ), //i
    .io_sharedInputs_0_arw_payload_id       (_zz_io_sharedInputs_0_arw_payload_id_1[2:0]                          ), //i
    .io_sharedInputs_0_arw_payload_len      (dbus_axi_decoder_io_sharedOutputs_0_arw_validPipe_payload_len[7:0]   ), //i
    .io_sharedInputs_0_arw_payload_size     (dbus_axi_decoder_io_sharedOutputs_0_arw_validPipe_payload_size[2:0]  ), //i
    .io_sharedInputs_0_arw_payload_burst    (2'b01                                                                ), //i
    .io_sharedInputs_0_arw_payload_write    (dbus_axi_decoder_io_sharedOutputs_0_arw_validPipe_payload_write      ), //i
    .io_sharedInputs_0_w_valid              (dbus_axi_decoder_io_sharedOutputs_0_w_valid                          ), //i
    .io_sharedInputs_0_w_ready              (axi_ram_io_axi_arbiter_io_sharedInputs_0_w_ready                     ), //o
    .io_sharedInputs_0_w_payload_data       (dbus_axi_decoder_io_sharedOutputs_0_w_payload_data[31:0]             ), //i
    .io_sharedInputs_0_w_payload_strb       (dbus_axi_decoder_io_sharedOutputs_0_w_payload_strb[3:0]              ), //i
    .io_sharedInputs_0_w_payload_last       (dbus_axi_decoder_io_sharedOutputs_0_w_payload_last                   ), //i
    .io_sharedInputs_0_b_valid              (axi_ram_io_axi_arbiter_io_sharedInputs_0_b_valid                     ), //o
    .io_sharedInputs_0_b_ready              (dbus_axi_decoder_io_sharedOutputs_0_b_ready                          ), //i
    .io_sharedInputs_0_b_payload_id         (axi_ram_io_axi_arbiter_io_sharedInputs_0_b_payload_id[2:0]           ), //o
    .io_sharedInputs_0_b_payload_resp       (axi_ram_io_axi_arbiter_io_sharedInputs_0_b_payload_resp[1:0]         ), //o
    .io_sharedInputs_0_r_valid              (axi_ram_io_axi_arbiter_io_sharedInputs_0_r_valid                     ), //o
    .io_sharedInputs_0_r_ready              (dbus_axi_decoder_io_sharedOutputs_0_r_ready                          ), //i
    .io_sharedInputs_0_r_payload_data       (axi_ram_io_axi_arbiter_io_sharedInputs_0_r_payload_data[31:0]        ), //o
    .io_sharedInputs_0_r_payload_id         (axi_ram_io_axi_arbiter_io_sharedInputs_0_r_payload_id[2:0]           ), //o
    .io_sharedInputs_0_r_payload_resp       (axi_ram_io_axi_arbiter_io_sharedInputs_0_r_payload_resp[1:0]         ), //o
    .io_sharedInputs_0_r_payload_last       (axi_ram_io_axi_arbiter_io_sharedInputs_0_r_payload_last              ), //o
    .io_output_arw_valid                    (axi_ram_io_axi_arbiter_io_output_arw_valid                           ), //o
    .io_output_arw_ready                    (axi_ram_io_axi_arbiter_io_output_arw_ready                           ), //i
    .io_output_arw_payload_addr             (axi_ram_io_axi_arbiter_io_output_arw_payload_addr[14:0]              ), //o
    .io_output_arw_payload_id               (axi_ram_io_axi_arbiter_io_output_arw_payload_id[3:0]                 ), //o
    .io_output_arw_payload_len              (axi_ram_io_axi_arbiter_io_output_arw_payload_len[7:0]                ), //o
    .io_output_arw_payload_size             (axi_ram_io_axi_arbiter_io_output_arw_payload_size[2:0]               ), //o
    .io_output_arw_payload_burst            (axi_ram_io_axi_arbiter_io_output_arw_payload_burst[1:0]              ), //o
    .io_output_arw_payload_write            (axi_ram_io_axi_arbiter_io_output_arw_payload_write                   ), //o
    .io_output_w_valid                      (axi_ram_io_axi_arbiter_io_output_w_valid                             ), //o
    .io_output_w_ready                      (axi_ram_io_axi_arbiter_io_output_w_ready                             ), //i
    .io_output_w_payload_data               (axi_ram_io_axi_arbiter_io_output_w_payload_data[31:0]                ), //o
    .io_output_w_payload_strb               (axi_ram_io_axi_arbiter_io_output_w_payload_strb[3:0]                 ), //o
    .io_output_w_payload_last               (axi_ram_io_axi_arbiter_io_output_w_payload_last                      ), //o
    .io_output_b_valid                      (axi_ram_io_axi_b_valid                                               ), //i
    .io_output_b_ready                      (axi_ram_io_axi_arbiter_io_output_b_ready                             ), //o
    .io_output_b_payload_id                 (axi_ram_io_axi_b_payload_id[3:0]                                     ), //i
    .io_output_b_payload_resp               (axi_ram_io_axi_b_payload_resp[1:0]                                   ), //i
    .io_output_r_valid                      (axi_ram_io_axi_r_valid                                               ), //i
    .io_output_r_ready                      (axi_ram_io_axi_arbiter_io_output_r_ready                             ), //o
    .io_output_r_payload_data               (axi_ram_io_axi_r_payload_data[31:0]                                  ), //i
    .io_output_r_payload_id                 (axi_ram_io_axi_r_payload_id[3:0]                                     ), //i
    .io_output_r_payload_resp               (axi_ram_io_axi_r_payload_resp[1:0]                                   ), //i
    .io_output_r_payload_last               (axi_ram_io_axi_r_payload_last                                        ), //i
    .axiClk                                 (axiClk                                                               ), //i
    .resetCtrl_axiReset                     (resetCtrl_axiReset                                                   )  //i
  );
  Axi4SharedArbiter_2 axi_apbBridge_io_axi_arbiter (
    .io_sharedInputs_0_arw_valid            (dbus_axi_decoder_io_sharedOutputs_2_arw_validPipe_valid                ), //i
    .io_sharedInputs_0_arw_ready            (axi_apbBridge_io_axi_arbiter_io_sharedInputs_0_arw_ready               ), //o
    .io_sharedInputs_0_arw_payload_addr     (axi_apbBridge_io_axi_arbiter_io_sharedInputs_0_arw_payload_addr[19:0]  ), //i
    .io_sharedInputs_0_arw_payload_id       (_zz_io_sharedInputs_0_arw_payload_id_2[3:0]                            ), //i
    .io_sharedInputs_0_arw_payload_len      (dbus_axi_decoder_io_sharedOutputs_2_arw_validPipe_payload_len[7:0]     ), //i
    .io_sharedInputs_0_arw_payload_size     (dbus_axi_decoder_io_sharedOutputs_2_arw_validPipe_payload_size[2:0]    ), //i
    .io_sharedInputs_0_arw_payload_burst    (2'b01                                                                  ), //i
    .io_sharedInputs_0_arw_payload_write    (dbus_axi_decoder_io_sharedOutputs_2_arw_validPipe_payload_write        ), //i
    .io_sharedInputs_0_w_valid              (dbus_axi_decoder_io_sharedOutputs_2_w_valid                            ), //i
    .io_sharedInputs_0_w_ready              (axi_apbBridge_io_axi_arbiter_io_sharedInputs_0_w_ready                 ), //o
    .io_sharedInputs_0_w_payload_data       (dbus_axi_decoder_io_sharedOutputs_2_w_payload_data[31:0]               ), //i
    .io_sharedInputs_0_w_payload_strb       (dbus_axi_decoder_io_sharedOutputs_2_w_payload_strb[3:0]                ), //i
    .io_sharedInputs_0_w_payload_last       (dbus_axi_decoder_io_sharedOutputs_2_w_payload_last                     ), //i
    .io_sharedInputs_0_b_valid              (axi_apbBridge_io_axi_arbiter_io_sharedInputs_0_b_valid                 ), //o
    .io_sharedInputs_0_b_ready              (dbus_axi_decoder_io_sharedOutputs_2_b_ready                            ), //i
    .io_sharedInputs_0_b_payload_id         (axi_apbBridge_io_axi_arbiter_io_sharedInputs_0_b_payload_id[3:0]       ), //o
    .io_sharedInputs_0_b_payload_resp       (axi_apbBridge_io_axi_arbiter_io_sharedInputs_0_b_payload_resp[1:0]     ), //o
    .io_sharedInputs_0_r_valid              (axi_apbBridge_io_axi_arbiter_io_sharedInputs_0_r_valid                 ), //o
    .io_sharedInputs_0_r_ready              (dbus_axi_decoder_io_sharedOutputs_2_r_ready                            ), //i
    .io_sharedInputs_0_r_payload_data       (axi_apbBridge_io_axi_arbiter_io_sharedInputs_0_r_payload_data[31:0]    ), //o
    .io_sharedInputs_0_r_payload_id         (axi_apbBridge_io_axi_arbiter_io_sharedInputs_0_r_payload_id[3:0]       ), //o
    .io_sharedInputs_0_r_payload_resp       (axi_apbBridge_io_axi_arbiter_io_sharedInputs_0_r_payload_resp[1:0]     ), //o
    .io_sharedInputs_0_r_payload_last       (axi_apbBridge_io_axi_arbiter_io_sharedInputs_0_r_payload_last          ), //o
    .io_output_arw_valid                    (axi_apbBridge_io_axi_arbiter_io_output_arw_valid                       ), //o
    .io_output_arw_ready                    (axi_apbBridge_io_axi_arbiter_io_output_arw_ready                       ), //i
    .io_output_arw_payload_addr             (axi_apbBridge_io_axi_arbiter_io_output_arw_payload_addr[19:0]          ), //o
    .io_output_arw_payload_id               (axi_apbBridge_io_axi_arbiter_io_output_arw_payload_id[3:0]             ), //o
    .io_output_arw_payload_len              (axi_apbBridge_io_axi_arbiter_io_output_arw_payload_len[7:0]            ), //o
    .io_output_arw_payload_size             (axi_apbBridge_io_axi_arbiter_io_output_arw_payload_size[2:0]           ), //o
    .io_output_arw_payload_burst            (axi_apbBridge_io_axi_arbiter_io_output_arw_payload_burst[1:0]          ), //o
    .io_output_arw_payload_write            (axi_apbBridge_io_axi_arbiter_io_output_arw_payload_write               ), //o
    .io_output_w_valid                      (axi_apbBridge_io_axi_arbiter_io_output_w_valid                         ), //o
    .io_output_w_ready                      (axi_apbBridge_io_axi_arbiter_io_output_w_ready                         ), //i
    .io_output_w_payload_data               (axi_apbBridge_io_axi_arbiter_io_output_w_payload_data[31:0]            ), //o
    .io_output_w_payload_strb               (axi_apbBridge_io_axi_arbiter_io_output_w_payload_strb[3:0]             ), //o
    .io_output_w_payload_last               (axi_apbBridge_io_axi_arbiter_io_output_w_payload_last                  ), //o
    .io_output_b_valid                      (axi_apbBridge_io_axi_b_valid                                           ), //i
    .io_output_b_ready                      (axi_apbBridge_io_axi_arbiter_io_output_b_ready                         ), //o
    .io_output_b_payload_id                 (axi_apbBridge_io_axi_b_payload_id[3:0]                                 ), //i
    .io_output_b_payload_resp               (axi_apbBridge_io_axi_b_payload_resp[1:0]                               ), //i
    .io_output_r_valid                      (axi_apbBridge_io_axi_r_valid                                           ), //i
    .io_output_r_ready                      (axi_apbBridge_io_axi_arbiter_io_output_r_ready                         ), //o
    .io_output_r_payload_data               (axi_apbBridge_io_axi_r_payload_data[31:0]                              ), //i
    .io_output_r_payload_id                 (axi_apbBridge_io_axi_r_payload_id[3:0]                                 ), //i
    .io_output_r_payload_resp               (axi_apbBridge_io_axi_r_payload_resp[1:0]                               ), //i
    .io_output_r_payload_last               (axi_apbBridge_io_axi_r_payload_last                                    ), //i
    .axiClk                                 (axiClk                                                                 ), //i
    .resetCtrl_axiReset                     (resetCtrl_axiReset                                                     )  //i
  );
  Apb3Decoder io_apb_decoder (
    .io_input_PADDR         (axi_apbBridge_io_apb_PADDR[19:0]       ), //i
    .io_input_PSEL          (axi_apbBridge_io_apb_PSEL              ), //i
    .io_input_PENABLE       (axi_apbBridge_io_apb_PENABLE           ), //i
    .io_input_PREADY        (io_apb_decoder_io_input_PREADY         ), //o
    .io_input_PWRITE        (axi_apbBridge_io_apb_PWRITE            ), //i
    .io_input_PWDATA        (axi_apbBridge_io_apb_PWDATA[31:0]      ), //i
    .io_input_PRDATA        (io_apb_decoder_io_input_PRDATA[31:0]   ), //o
    .io_input_PSLVERROR     (io_apb_decoder_io_input_PSLVERROR      ), //o
    .io_output_PADDR        (io_apb_decoder_io_output_PADDR[19:0]   ), //o
    .io_output_PSEL         (io_apb_decoder_io_output_PSEL[6:0]     ), //o
    .io_output_PENABLE      (io_apb_decoder_io_output_PENABLE       ), //o
    .io_output_PREADY       (apb3Router_1_io_input_PREADY           ), //i
    .io_output_PWRITE       (io_apb_decoder_io_output_PWRITE        ), //o
    .io_output_PWDATA       (io_apb_decoder_io_output_PWDATA[31:0]  ), //o
    .io_output_PRDATA       (apb3Router_1_io_input_PRDATA[31:0]     ), //i
    .io_output_PSLVERROR    (apb3Router_1_io_input_PSLVERROR        )  //i
  );
  Apb3Router apb3Router_1 (
    .io_input_PADDR            (io_apb_decoder_io_output_PADDR[19:0]    ), //i
    .io_input_PSEL             (io_apb_decoder_io_output_PSEL[6:0]      ), //i
    .io_input_PENABLE          (io_apb_decoder_io_output_PENABLE        ), //i
    .io_input_PREADY           (apb3Router_1_io_input_PREADY            ), //o
    .io_input_PWRITE           (io_apb_decoder_io_output_PWRITE         ), //i
    .io_input_PWDATA           (io_apb_decoder_io_output_PWDATA[31:0]   ), //i
    .io_input_PRDATA           (apb3Router_1_io_input_PRDATA[31:0]      ), //o
    .io_input_PSLVERROR        (apb3Router_1_io_input_PSLVERROR         ), //o
    .io_outputs_0_PADDR        (apb3Router_1_io_outputs_0_PADDR[19:0]   ), //o
    .io_outputs_0_PSEL         (apb3Router_1_io_outputs_0_PSEL          ), //o
    .io_outputs_0_PENABLE      (apb3Router_1_io_outputs_0_PENABLE       ), //o
    .io_outputs_0_PREADY       (axi_gpioACtrl_io_apb_PREADY             ), //i
    .io_outputs_0_PWRITE       (apb3Router_1_io_outputs_0_PWRITE        ), //o
    .io_outputs_0_PWDATA       (apb3Router_1_io_outputs_0_PWDATA[31:0]  ), //o
    .io_outputs_0_PRDATA       (axi_gpioACtrl_io_apb_PRDATA[31:0]       ), //i
    .io_outputs_0_PSLVERROR    (axi_gpioACtrl_io_apb_PSLVERROR          ), //i
    .io_outputs_1_PADDR        (apb3Router_1_io_outputs_1_PADDR[19:0]   ), //o
    .io_outputs_1_PSEL         (apb3Router_1_io_outputs_1_PSEL          ), //o
    .io_outputs_1_PENABLE      (apb3Router_1_io_outputs_1_PENABLE       ), //o
    .io_outputs_1_PREADY       (axi_uartCtrl_io_apb_PREADY              ), //i
    .io_outputs_1_PWRITE       (apb3Router_1_io_outputs_1_PWRITE        ), //o
    .io_outputs_1_PWDATA       (apb3Router_1_io_outputs_1_PWDATA[31:0]  ), //o
    .io_outputs_1_PRDATA       (axi_uartCtrl_io_apb_PRDATA[31:0]        ), //i
    .io_outputs_1_PSLVERROR    (1'b0                                    ), //i
    .io_outputs_2_PADDR        (apb3Router_1_io_outputs_2_PADDR[19:0]   ), //o
    .io_outputs_2_PSEL         (apb3Router_1_io_outputs_2_PSEL          ), //o
    .io_outputs_2_PENABLE      (apb3Router_1_io_outputs_2_PENABLE       ), //o
    .io_outputs_2_PREADY       (axi_timerCtrl_io_apb_PREADY             ), //i
    .io_outputs_2_PWRITE       (apb3Router_1_io_outputs_2_PWRITE        ), //o
    .io_outputs_2_PWDATA       (apb3Router_1_io_outputs_2_PWDATA[31:0]  ), //o
    .io_outputs_2_PRDATA       (axi_timerCtrl_io_apb_PRDATA[31:0]       ), //i
    .io_outputs_2_PSLVERROR    (axi_timerCtrl_io_apb_PSLVERROR          ), //i
    .io_outputs_3_PADDR        (apb3Router_1_io_outputs_3_PADDR[19:0]   ), //o
    .io_outputs_3_PSEL         (apb3Router_1_io_outputs_3_PSEL          ), //o
    .io_outputs_3_PENABLE      (apb3Router_1_io_outputs_3_PENABLE       ), //o
    .io_outputs_3_PREADY       (axi_i2cCtrl_io_apb_PREADY               ), //i
    .io_outputs_3_PWRITE       (apb3Router_1_io_outputs_3_PWRITE        ), //o
    .io_outputs_3_PWDATA       (apb3Router_1_io_outputs_3_PWDATA[31:0]  ), //o
    .io_outputs_3_PRDATA       (axi_i2cCtrl_io_apb_PRDATA[31:0]         ), //i
    .io_outputs_3_PSLVERROR    (1'b0                                    ), //i
    .io_outputs_4_PADDR        (apb3Router_1_io_outputs_4_PADDR[19:0]   ), //o
    .io_outputs_4_PSEL         (apb3Router_1_io_outputs_4_PSEL          ), //o
    .io_outputs_4_PENABLE      (apb3Router_1_io_outputs_4_PENABLE       ), //o
    .io_outputs_4_PREADY       (axi_spiCtrl_io_apb_PREADY               ), //i
    .io_outputs_4_PWRITE       (apb3Router_1_io_outputs_4_PWRITE        ), //o
    .io_outputs_4_PWDATA       (apb3Router_1_io_outputs_4_PWDATA[31:0]  ), //o
    .io_outputs_4_PRDATA       (axi_spiCtrl_io_apb_PRDATA[31:0]         ), //i
    .io_outputs_4_PSLVERROR    (1'b0                                    ), //i
    .io_outputs_5_PADDR        (apb3Router_1_io_outputs_5_PADDR[19:0]   ), //o
    .io_outputs_5_PSEL         (apb3Router_1_io_outputs_5_PSEL          ), //o
    .io_outputs_5_PENABLE      (apb3Router_1_io_outputs_5_PENABLE       ), //o
    .io_outputs_5_PREADY       (axi_ledCtrl_io_apb_PREADY               ), //i
    .io_outputs_5_PWRITE       (apb3Router_1_io_outputs_5_PWRITE        ), //o
    .io_outputs_5_PWDATA       (apb3Router_1_io_outputs_5_PWDATA[31:0]  ), //o
    .io_outputs_5_PRDATA       (axi_ledCtrl_io_apb_PRDATA[31:0]         ), //i
    .io_outputs_5_PSLVERROR    (axi_ledCtrl_io_apb_PSLVERROR            ), //i
    .io_outputs_6_PADDR        (apb3Router_1_io_outputs_6_PADDR[19:0]   ), //o
    .io_outputs_6_PSEL         (apb3Router_1_io_outputs_6_PSEL          ), //o
    .io_outputs_6_PENABLE      (apb3Router_1_io_outputs_6_PENABLE       ), //o
    .io_outputs_6_PREADY       (vgaArea_vgaCtrl_io_apb_PREADY           ), //i
    .io_outputs_6_PWRITE       (apb3Router_1_io_outputs_6_PWRITE        ), //o
    .io_outputs_6_PWDATA       (apb3Router_1_io_outputs_6_PWDATA[31:0]  ), //o
    .io_outputs_6_PRDATA       (vgaArea_vgaCtrl_io_apb_PRDATA[31:0]     ), //i
    .io_outputs_6_PSLVERROR    (1'b0                                    ), //i
    .axiClk                    (axiClk                                  ), //i
    .resetCtrl_axiReset        (resetCtrl_axiReset                      )  //i
  );
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
  assign i2c_0_scl = _zz_i2c_0_scl ? _zz_i2c_0_scl_1[0] : 1'bz;
  assign i2c_0_sda = _zz_i2c_0_sda ? _zz_i2c_0_sda_1[0] : 1'bz;
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

  assign vga_pwm = 1'b1;
  assign vga_clk = vgaClk;
  assign bufferCC_16_io_dataIn = (! asyncReset);
  assign pll_locked = eG4S20PLL_1_extlock;
  assign axiClk = eG4S20PLL_1_clk0_out;
  assign sdramCtrlClk = eG4S20PLL_1_clk1_out;
  assign sdramClk = eG4S20PLL_1_clk2_out;
  assign vgaClk = eG4S20PLL_1_clk3_out;
  always @(*) begin
    resetCtrl_systemResetUnbuffered = 1'b0;
    if(when_TangPrimerBriey_l338) begin
      resetCtrl_systemResetUnbuffered = 1'b1;
    end
  end

  assign _zz_when_TangPrimerBriey_l338[5 : 0] = 6'h3f;
  assign when_TangPrimerBriey_l338 = (resetCtrl_systemResetCounter != _zz_when_TangPrimerBriey_l338);
  assign bufferCC_17_io_dataIn = (! asyncReset);
  assign bufferCC_18_io_dataIn = ((! pll_locked) && bufferCC_17_io_dataOut);
  assign when_TangPrimerBriey_l342 = bufferCC_18_io_dataOut;
  assign resetCtrl_vgaReset = resetCtrl_axiReset_buffercc_io_dataOut;
  assign resetCtrl_sdramReset = resetCtrl_axiReset_buffercc_1_io_dataOut;
  assign resetCtrl_sdramCtrlReset = resetCtrl_axiReset_buffercc_2_io_dataOut;
  assign axi_core_externalInterrupt = 1'b0;
  assign _zz_io_input_ar_valid = axi_core_cpu_iBus_cmd_valid;
  assign _zz_io_input_ar_payload_addr = axi_core_cpu_iBus_cmd_payload_address;
  assign axi_core_cpu_iBus_rsp_payload_error = (! (_zz_iBus_rsp_payload_error == 2'b00));
  always @(*) begin
    axi_core_cpu_dBus_cmd_ready = axi_core_cpu_dBus_cmd_m2sPipe_ready;
    if(when_Stream_l342) begin
      axi_core_cpu_dBus_cmd_ready = 1'b1;
    end
  end

  assign when_Stream_l342 = (! axi_core_cpu_dBus_cmd_m2sPipe_valid);
  assign axi_core_cpu_dBus_cmd_m2sPipe_valid = axi_core_cpu_dBus_cmd_rValid;
  assign axi_core_cpu_dBus_cmd_m2sPipe_payload_wr = axi_core_cpu_dBus_cmd_rData_wr;
  assign axi_core_cpu_dBus_cmd_m2sPipe_payload_uncached = axi_core_cpu_dBus_cmd_rData_uncached;
  assign axi_core_cpu_dBus_cmd_m2sPipe_payload_address = axi_core_cpu_dBus_cmd_rData_address;
  assign axi_core_cpu_dBus_cmd_m2sPipe_payload_data = axi_core_cpu_dBus_cmd_rData_data;
  assign axi_core_cpu_dBus_cmd_m2sPipe_payload_mask = axi_core_cpu_dBus_cmd_rData_mask;
  assign axi_core_cpu_dBus_cmd_m2sPipe_payload_size = axi_core_cpu_dBus_cmd_rData_size;
  assign axi_core_cpu_dBus_cmd_m2sPipe_payload_last = axi_core_cpu_dBus_cmd_rData_last;
  always @(*) begin
    axi_core_cpu_dBus_cmd_m2sPipe_ready = axi_core_cpu_dBus_cmd_m2sPipe_m2sPipe_ready;
    if(when_Stream_l342_1) begin
      axi_core_cpu_dBus_cmd_m2sPipe_ready = 1'b1;
    end
  end

  assign when_Stream_l342_1 = (! axi_core_cpu_dBus_cmd_m2sPipe_m2sPipe_valid);
  assign axi_core_cpu_dBus_cmd_m2sPipe_m2sPipe_valid = axi_core_cpu_dBus_cmd_m2sPipe_rValid;
  assign axi_core_cpu_dBus_cmd_m2sPipe_m2sPipe_payload_wr = axi_core_cpu_dBus_cmd_m2sPipe_rData_wr;
  assign axi_core_cpu_dBus_cmd_m2sPipe_m2sPipe_payload_uncached = axi_core_cpu_dBus_cmd_m2sPipe_rData_uncached;
  assign axi_core_cpu_dBus_cmd_m2sPipe_m2sPipe_payload_address = axi_core_cpu_dBus_cmd_m2sPipe_rData_address;
  assign axi_core_cpu_dBus_cmd_m2sPipe_m2sPipe_payload_data = axi_core_cpu_dBus_cmd_m2sPipe_rData_data;
  assign axi_core_cpu_dBus_cmd_m2sPipe_m2sPipe_payload_mask = axi_core_cpu_dBus_cmd_m2sPipe_rData_mask;
  assign axi_core_cpu_dBus_cmd_m2sPipe_m2sPipe_payload_size = axi_core_cpu_dBus_cmd_m2sPipe_rData_size;
  assign axi_core_cpu_dBus_cmd_m2sPipe_m2sPipe_payload_last = axi_core_cpu_dBus_cmd_m2sPipe_rData_last;
  assign axi_core_cpu_dBus_cmd_m2sPipe_m2sPipe_ready = (! axi_core_cpu_dBus_cmd_m2sPipe_m2sPipe_rValid);
  assign axi_core_cpu_dBus_cmd_m2sPipe_m2sPipe_s2mPipe_valid = (axi_core_cpu_dBus_cmd_m2sPipe_m2sPipe_valid || axi_core_cpu_dBus_cmd_m2sPipe_m2sPipe_rValid);
  assign axi_core_cpu_dBus_cmd_m2sPipe_m2sPipe_s2mPipe_payload_wr = (axi_core_cpu_dBus_cmd_m2sPipe_m2sPipe_rValid ? axi_core_cpu_dBus_cmd_m2sPipe_m2sPipe_rData_wr : axi_core_cpu_dBus_cmd_m2sPipe_m2sPipe_payload_wr);
  assign axi_core_cpu_dBus_cmd_m2sPipe_m2sPipe_s2mPipe_payload_uncached = (axi_core_cpu_dBus_cmd_m2sPipe_m2sPipe_rValid ? axi_core_cpu_dBus_cmd_m2sPipe_m2sPipe_rData_uncached : axi_core_cpu_dBus_cmd_m2sPipe_m2sPipe_payload_uncached);
  assign axi_core_cpu_dBus_cmd_m2sPipe_m2sPipe_s2mPipe_payload_address = (axi_core_cpu_dBus_cmd_m2sPipe_m2sPipe_rValid ? axi_core_cpu_dBus_cmd_m2sPipe_m2sPipe_rData_address : axi_core_cpu_dBus_cmd_m2sPipe_m2sPipe_payload_address);
  assign axi_core_cpu_dBus_cmd_m2sPipe_m2sPipe_s2mPipe_payload_data = (axi_core_cpu_dBus_cmd_m2sPipe_m2sPipe_rValid ? axi_core_cpu_dBus_cmd_m2sPipe_m2sPipe_rData_data : axi_core_cpu_dBus_cmd_m2sPipe_m2sPipe_payload_data);
  assign axi_core_cpu_dBus_cmd_m2sPipe_m2sPipe_s2mPipe_payload_mask = (axi_core_cpu_dBus_cmd_m2sPipe_m2sPipe_rValid ? axi_core_cpu_dBus_cmd_m2sPipe_m2sPipe_rData_mask : axi_core_cpu_dBus_cmd_m2sPipe_m2sPipe_payload_mask);
  assign axi_core_cpu_dBus_cmd_m2sPipe_m2sPipe_s2mPipe_payload_size = (axi_core_cpu_dBus_cmd_m2sPipe_m2sPipe_rValid ? axi_core_cpu_dBus_cmd_m2sPipe_m2sPipe_rData_size : axi_core_cpu_dBus_cmd_m2sPipe_m2sPipe_payload_size);
  assign axi_core_cpu_dBus_cmd_m2sPipe_m2sPipe_s2mPipe_payload_last = (axi_core_cpu_dBus_cmd_m2sPipe_m2sPipe_rValid ? axi_core_cpu_dBus_cmd_m2sPipe_m2sPipe_rData_last : axi_core_cpu_dBus_cmd_m2sPipe_m2sPipe_payload_last);
  assign axi_core_cpu_dBus_cmd_m2sPipe_m2sPipe_s2mPipe_fire = (axi_core_cpu_dBus_cmd_m2sPipe_m2sPipe_s2mPipe_valid && axi_core_cpu_dBus_cmd_m2sPipe_m2sPipe_s2mPipe_ready);
  assign when_Utils_l594 = (axi_core_cpu_dBus_cmd_m2sPipe_m2sPipe_s2mPipe_fire && axi_core_cpu_dBus_cmd_m2sPipe_m2sPipe_s2mPipe_payload_wr);
  assign dbus_axi_b_fire = (dbus_axi_b_valid && dbus_axi_b_ready);
  always @(*) begin
    _zz_when_Utils_l622 = 1'b0;
    if(when_Utils_l594) begin
      _zz_when_Utils_l622 = 1'b1;
    end
  end

  always @(*) begin
    _zz_when_Utils_l622_1 = 1'b0;
    if(dbus_axi_b_fire) begin
      _zz_when_Utils_l622_1 = 1'b1;
    end
  end

  assign when_Utils_l622 = (_zz_when_Utils_l622 && (! _zz_when_Utils_l622_1));
  always @(*) begin
    if(when_Utils_l622) begin
      _zz_axi_core_cpu_dBus_cmd_m2sPipe_m2sPipe_s2mPipe_ready_1 = 3'b001;
    end else begin
      if(when_Utils_l624) begin
        _zz_axi_core_cpu_dBus_cmd_m2sPipe_m2sPipe_s2mPipe_ready_1 = 3'b111;
      end else begin
        _zz_axi_core_cpu_dBus_cmd_m2sPipe_m2sPipe_s2mPipe_ready_1 = 3'b000;
      end
    end
  end

  assign when_Utils_l624 = ((! _zz_when_Utils_l622) && _zz_when_Utils_l622_1);
  assign _zz_axi_core_cpu_dBus_cmd_m2sPipe_m2sPipe_s2mPipe_ready_2 = (! (((_zz_axi_core_cpu_dBus_cmd_m2sPipe_m2sPipe_s2mPipe_ready != 3'b000) && (! axi_core_cpu_dBus_cmd_m2sPipe_m2sPipe_s2mPipe_payload_wr)) || (_zz_axi_core_cpu_dBus_cmd_m2sPipe_m2sPipe_s2mPipe_ready == 3'b111)));
  assign axi_core_cpu_dBus_cmd_m2sPipe_m2sPipe_s2mPipe_ready = (streamFork_4_io_input_ready && _zz_axi_core_cpu_dBus_cmd_m2sPipe_m2sPipe_s2mPipe_ready_2);
  assign streamFork_4_io_input_valid = (axi_core_cpu_dBus_cmd_m2sPipe_m2sPipe_s2mPipe_valid && _zz_axi_core_cpu_dBus_cmd_m2sPipe_m2sPipe_s2mPipe_ready_2);
  assign streamFork_4_io_outputs_0_fire = (streamFork_4_io_outputs_0_valid && streamFork_4_io_outputs_0_ready);
  always @(*) begin
    streamFork_4_io_outputs_0_thrown_valid = streamFork_4_io_outputs_0_valid;
    if(_zz_1) begin
      streamFork_4_io_outputs_0_thrown_valid = 1'b0;
    end
  end

  always @(*) begin
    streamFork_4_io_outputs_0_ready = streamFork_4_io_outputs_0_thrown_ready;
    if(_zz_1) begin
      streamFork_4_io_outputs_0_ready = 1'b1;
    end
  end

  assign streamFork_4_io_outputs_0_thrown_payload_wr = streamFork_4_io_outputs_0_payload_wr;
  assign streamFork_4_io_outputs_0_thrown_payload_uncached = streamFork_4_io_outputs_0_payload_uncached;
  assign streamFork_4_io_outputs_0_thrown_payload_address = streamFork_4_io_outputs_0_payload_address;
  assign streamFork_4_io_outputs_0_thrown_payload_data = streamFork_4_io_outputs_0_payload_data;
  assign streamFork_4_io_outputs_0_thrown_payload_mask = streamFork_4_io_outputs_0_payload_mask;
  assign streamFork_4_io_outputs_0_thrown_payload_size = streamFork_4_io_outputs_0_payload_size;
  assign streamFork_4_io_outputs_0_thrown_payload_last = streamFork_4_io_outputs_0_payload_last;
  assign when_Stream_l408 = (! streamFork_4_io_outputs_1_payload_wr);
  always @(*) begin
    streamFork_4_io_outputs_1_thrown_valid = streamFork_4_io_outputs_1_valid;
    if(when_Stream_l408) begin
      streamFork_4_io_outputs_1_thrown_valid = 1'b0;
    end
  end

  always @(*) begin
    streamFork_4_io_outputs_1_ready = streamFork_4_io_outputs_1_thrown_ready;
    if(when_Stream_l408) begin
      streamFork_4_io_outputs_1_ready = 1'b1;
    end
  end

  assign streamFork_4_io_outputs_1_thrown_payload_wr = streamFork_4_io_outputs_1_payload_wr;
  assign streamFork_4_io_outputs_1_thrown_payload_uncached = streamFork_4_io_outputs_1_payload_uncached;
  assign streamFork_4_io_outputs_1_thrown_payload_address = streamFork_4_io_outputs_1_payload_address;
  assign streamFork_4_io_outputs_1_thrown_payload_data = streamFork_4_io_outputs_1_payload_data;
  assign streamFork_4_io_outputs_1_thrown_payload_mask = streamFork_4_io_outputs_1_payload_mask;
  assign streamFork_4_io_outputs_1_thrown_payload_size = streamFork_4_io_outputs_1_payload_size;
  assign streamFork_4_io_outputs_1_thrown_payload_last = streamFork_4_io_outputs_1_payload_last;
  assign dbus_axi_arw_valid = streamFork_4_io_outputs_0_thrown_valid;
  assign streamFork_4_io_outputs_0_thrown_ready = dbus_axi_arw_ready;
  assign dbus_axi_arw_payload_write = streamFork_4_io_outputs_0_thrown_payload_wr;
  assign dbus_axi_arw_payload_prot = 3'b010;
  assign dbus_axi_arw_payload_cache = 4'b1111;
  assign dbus_axi_arw_payload_size = 3'b010;
  assign dbus_axi_arw_payload_addr = streamFork_4_io_outputs_0_thrown_payload_address;
  assign dbus_axi_arw_payload_len = {5'd0, _zz_dbus_axi_arw_payload_len};
  assign dbus_axi_w_valid = streamFork_4_io_outputs_1_thrown_valid;
  assign streamFork_4_io_outputs_1_thrown_ready = dbus_axi_w_ready;
  assign dbus_axi_w_payload_data = streamFork_4_io_outputs_1_thrown_payload_data;
  assign dbus_axi_w_payload_strb = streamFork_4_io_outputs_1_thrown_payload_mask;
  assign dbus_axi_w_payload_last = streamFork_4_io_outputs_1_thrown_payload_last;
  assign axi_core_cpu_dBus_rsp_payload_error = (! (dbus_axi_r_payload_resp == 2'b00));
  assign dbus_axi_r_ready = 1'b1;
  assign dbus_axi_b_ready = 1'b1;
  assign axi_core_cpu_debug_bus_cmd_payload_address = systemDebugger_1_io_mem_cmd_payload_address[7:0];
  assign axi_core_cpu_debug_bus_cmd_fire = (systemDebugger_1_io_mem_cmd_valid && axi_core_cpu_debug_bus_cmd_ready);
  assign jtag_tdo = jtagBridge_1_io_jtag_tdo;
  assign axi4ReadOnlyDecoder_2_io_outputs_0_ar_validPipe_fire = (axi4ReadOnlyDecoder_2_io_outputs_0_ar_validPipe_valid && axi4ReadOnlyDecoder_2_io_outputs_0_ar_validPipe_ready);
  assign axi4ReadOnlyDecoder_2_io_outputs_0_ar_validPipe_fire_1 = (axi4ReadOnlyDecoder_2_io_outputs_0_ar_validPipe_valid && axi4ReadOnlyDecoder_2_io_outputs_0_ar_validPipe_ready);
  assign axi4ReadOnlyDecoder_2_io_outputs_0_ar_validPipe_valid = axi4ReadOnlyDecoder_2_io_outputs_0_ar_rValid;
  assign axi4ReadOnlyDecoder_2_io_outputs_0_ar_validPipe_payload_addr = axi4ReadOnlyDecoder_2_io_outputs_0_ar_payload_addr;
  assign axi4ReadOnlyDecoder_2_io_outputs_0_ar_validPipe_payload_len = axi4ReadOnlyDecoder_2_io_outputs_0_ar_payload_len;
  assign axi4ReadOnlyDecoder_2_io_outputs_0_ar_validPipe_payload_burst = axi4ReadOnlyDecoder_2_io_outputs_0_ar_payload_burst;
  assign axi4ReadOnlyDecoder_2_io_outputs_0_ar_validPipe_payload_cache = axi4ReadOnlyDecoder_2_io_outputs_0_ar_payload_cache;
  assign axi4ReadOnlyDecoder_2_io_outputs_0_ar_validPipe_payload_prot = axi4ReadOnlyDecoder_2_io_outputs_0_ar_payload_prot;
  assign axi4ReadOnlyDecoder_2_io_outputs_0_ar_validPipe_ready = axi_ram_io_axi_arbiter_io_readInputs_0_ar_ready;
  assign axi4ReadOnlyDecoder_2_io_outputs_1_ar_validPipe_fire = (axi4ReadOnlyDecoder_2_io_outputs_1_ar_validPipe_valid && axi4ReadOnlyDecoder_2_io_outputs_1_ar_validPipe_ready);
  assign axi4ReadOnlyDecoder_2_io_outputs_1_ar_validPipe_fire_1 = (axi4ReadOnlyDecoder_2_io_outputs_1_ar_validPipe_valid && axi4ReadOnlyDecoder_2_io_outputs_1_ar_validPipe_ready);
  assign axi4ReadOnlyDecoder_2_io_outputs_1_ar_validPipe_valid = axi4ReadOnlyDecoder_2_io_outputs_1_ar_rValid;
  assign axi4ReadOnlyDecoder_2_io_outputs_1_ar_validPipe_payload_addr = axi4ReadOnlyDecoder_2_io_outputs_1_ar_payload_addr;
  assign axi4ReadOnlyDecoder_2_io_outputs_1_ar_validPipe_payload_len = axi4ReadOnlyDecoder_2_io_outputs_1_ar_payload_len;
  assign axi4ReadOnlyDecoder_2_io_outputs_1_ar_validPipe_payload_burst = axi4ReadOnlyDecoder_2_io_outputs_1_ar_payload_burst;
  assign axi4ReadOnlyDecoder_2_io_outputs_1_ar_validPipe_payload_cache = axi4ReadOnlyDecoder_2_io_outputs_1_ar_payload_cache;
  assign axi4ReadOnlyDecoder_2_io_outputs_1_ar_validPipe_payload_prot = axi4ReadOnlyDecoder_2_io_outputs_1_ar_payload_prot;
  assign axi4ReadOnlyDecoder_2_io_outputs_1_ar_validPipe_ready = sdramCtrlArea_sdramCtrl_io_axi_arbiter_io_readInputs_0_ar_ready;
  assign _zz_iBus_cmd_ready = axi4ReadOnlyDecoder_2_io_input_ar_ready;
  assign _zz_iBus_rsp_valid = axi4ReadOnlyDecoder_2_io_input_r_valid;
  assign _zz_iBus_rsp_payload_data = axi4ReadOnlyDecoder_2_io_input_r_payload_data;
  assign _zz_iBus_rsp_payload_error = axi4ReadOnlyDecoder_2_io_input_r_payload_resp;
  assign dbus_axi_decoder_io_sharedOutputs_0_arw_validPipe_fire = (dbus_axi_decoder_io_sharedOutputs_0_arw_validPipe_valid && dbus_axi_decoder_io_sharedOutputs_0_arw_validPipe_ready);
  assign dbus_axi_decoder_io_sharedOutputs_0_arw_validPipe_fire_1 = (dbus_axi_decoder_io_sharedOutputs_0_arw_validPipe_valid && dbus_axi_decoder_io_sharedOutputs_0_arw_validPipe_ready);
  assign dbus_axi_decoder_io_sharedOutputs_0_arw_validPipe_valid = dbus_axi_decoder_io_sharedOutputs_0_arw_rValid;
  assign dbus_axi_decoder_io_sharedOutputs_0_arw_validPipe_payload_addr = dbus_axi_decoder_io_sharedOutputs_0_arw_payload_addr;
  assign dbus_axi_decoder_io_sharedOutputs_0_arw_validPipe_payload_len = dbus_axi_decoder_io_sharedOutputs_0_arw_payload_len;
  assign dbus_axi_decoder_io_sharedOutputs_0_arw_validPipe_payload_size = dbus_axi_decoder_io_sharedOutputs_0_arw_payload_size;
  assign dbus_axi_decoder_io_sharedOutputs_0_arw_validPipe_payload_cache = dbus_axi_decoder_io_sharedOutputs_0_arw_payload_cache;
  assign dbus_axi_decoder_io_sharedOutputs_0_arw_validPipe_payload_prot = dbus_axi_decoder_io_sharedOutputs_0_arw_payload_prot;
  assign dbus_axi_decoder_io_sharedOutputs_0_arw_validPipe_payload_write = dbus_axi_decoder_io_sharedOutputs_0_arw_payload_write;
  assign dbus_axi_decoder_io_sharedOutputs_0_arw_validPipe_ready = axi_ram_io_axi_arbiter_io_sharedInputs_0_arw_ready;
  assign dbus_axi_decoder_io_sharedOutputs_1_arw_validPipe_fire = (dbus_axi_decoder_io_sharedOutputs_1_arw_validPipe_valid && dbus_axi_decoder_io_sharedOutputs_1_arw_validPipe_ready);
  assign dbus_axi_decoder_io_sharedOutputs_1_arw_validPipe_fire_1 = (dbus_axi_decoder_io_sharedOutputs_1_arw_validPipe_valid && dbus_axi_decoder_io_sharedOutputs_1_arw_validPipe_ready);
  assign dbus_axi_decoder_io_sharedOutputs_1_arw_validPipe_valid = dbus_axi_decoder_io_sharedOutputs_1_arw_rValid;
  assign dbus_axi_decoder_io_sharedOutputs_1_arw_validPipe_payload_addr = dbus_axi_decoder_io_sharedOutputs_1_arw_payload_addr;
  assign dbus_axi_decoder_io_sharedOutputs_1_arw_validPipe_payload_len = dbus_axi_decoder_io_sharedOutputs_1_arw_payload_len;
  assign dbus_axi_decoder_io_sharedOutputs_1_arw_validPipe_payload_size = dbus_axi_decoder_io_sharedOutputs_1_arw_payload_size;
  assign dbus_axi_decoder_io_sharedOutputs_1_arw_validPipe_payload_cache = dbus_axi_decoder_io_sharedOutputs_1_arw_payload_cache;
  assign dbus_axi_decoder_io_sharedOutputs_1_arw_validPipe_payload_prot = dbus_axi_decoder_io_sharedOutputs_1_arw_payload_prot;
  assign dbus_axi_decoder_io_sharedOutputs_1_arw_validPipe_payload_write = dbus_axi_decoder_io_sharedOutputs_1_arw_payload_write;
  assign dbus_axi_decoder_io_sharedOutputs_1_arw_validPipe_ready = sdramCtrlArea_sdramCtrl_io_axi_arbiter_io_sharedInputs_0_arw_ready;
  assign dbus_axi_decoder_io_sharedOutputs_2_arw_validPipe_fire = (dbus_axi_decoder_io_sharedOutputs_2_arw_validPipe_valid && dbus_axi_decoder_io_sharedOutputs_2_arw_validPipe_ready);
  assign dbus_axi_decoder_io_sharedOutputs_2_arw_validPipe_fire_1 = (dbus_axi_decoder_io_sharedOutputs_2_arw_validPipe_valid && dbus_axi_decoder_io_sharedOutputs_2_arw_validPipe_ready);
  assign dbus_axi_decoder_io_sharedOutputs_2_arw_validPipe_valid = dbus_axi_decoder_io_sharedOutputs_2_arw_rValid;
  assign dbus_axi_decoder_io_sharedOutputs_2_arw_validPipe_payload_addr = dbus_axi_decoder_io_sharedOutputs_2_arw_payload_addr;
  assign dbus_axi_decoder_io_sharedOutputs_2_arw_validPipe_payload_len = dbus_axi_decoder_io_sharedOutputs_2_arw_payload_len;
  assign dbus_axi_decoder_io_sharedOutputs_2_arw_validPipe_payload_size = dbus_axi_decoder_io_sharedOutputs_2_arw_payload_size;
  assign dbus_axi_decoder_io_sharedOutputs_2_arw_validPipe_payload_cache = dbus_axi_decoder_io_sharedOutputs_2_arw_payload_cache;
  assign dbus_axi_decoder_io_sharedOutputs_2_arw_validPipe_payload_prot = dbus_axi_decoder_io_sharedOutputs_2_arw_payload_prot;
  assign dbus_axi_decoder_io_sharedOutputs_2_arw_validPipe_payload_write = dbus_axi_decoder_io_sharedOutputs_2_arw_payload_write;
  assign dbus_axi_decoder_io_sharedOutputs_2_arw_validPipe_ready = axi_apbBridge_io_axi_arbiter_io_sharedInputs_0_arw_ready;
  assign dbus_axi_arw_ready = dbus_axi_decoder_io_input_arw_ready;
  assign dbus_axi_w_ready = dbus_axi_decoder_io_input_w_ready;
  assign dbus_axi_b_valid = dbus_axi_decoder_io_input_b_valid;
  assign dbus_axi_b_payload_resp = dbus_axi_decoder_io_input_b_payload_resp;
  always @(*) begin
    dbus_axi_decoder_io_input_r_ready = dbus_axi_decoder_io_input_r_m2sPipe_ready;
    if(when_Stream_l342_2) begin
      dbus_axi_decoder_io_input_r_ready = 1'b1;
    end
  end

  assign when_Stream_l342_2 = (! dbus_axi_decoder_io_input_r_m2sPipe_valid);
  assign dbus_axi_decoder_io_input_r_m2sPipe_valid = dbus_axi_decoder_io_input_r_rValid;
  assign dbus_axi_decoder_io_input_r_m2sPipe_payload_data = dbus_axi_decoder_io_input_r_rData_data;
  assign dbus_axi_decoder_io_input_r_m2sPipe_payload_resp = dbus_axi_decoder_io_input_r_rData_resp;
  assign dbus_axi_decoder_io_input_r_m2sPipe_payload_last = dbus_axi_decoder_io_input_r_rData_last;
  assign dbus_axi_r_valid = dbus_axi_decoder_io_input_r_m2sPipe_valid;
  assign dbus_axi_decoder_io_input_r_m2sPipe_ready = dbus_axi_r_ready;
  assign dbus_axi_r_payload_data = dbus_axi_decoder_io_input_r_m2sPipe_payload_data;
  assign dbus_axi_r_payload_resp = dbus_axi_decoder_io_input_r_m2sPipe_payload_resp;
  assign dbus_axi_r_payload_last = dbus_axi_decoder_io_input_r_m2sPipe_payload_last;
  assign vgaArea_vgaCtrl_io_axi_decoder_io_outputs_0_ar_validPipe_fire = (vgaArea_vgaCtrl_io_axi_decoder_io_outputs_0_ar_validPipe_valid && vgaArea_vgaCtrl_io_axi_decoder_io_outputs_0_ar_validPipe_ready);
  assign vgaArea_vgaCtrl_io_axi_decoder_io_outputs_0_ar_validPipe_fire_1 = (vgaArea_vgaCtrl_io_axi_decoder_io_outputs_0_ar_validPipe_valid && vgaArea_vgaCtrl_io_axi_decoder_io_outputs_0_ar_validPipe_ready);
  assign vgaArea_vgaCtrl_io_axi_decoder_io_outputs_0_ar_validPipe_valid = vgaArea_vgaCtrl_io_axi_decoder_io_outputs_0_ar_rValid;
  assign vgaArea_vgaCtrl_io_axi_decoder_io_outputs_0_ar_validPipe_payload_addr = vgaArea_vgaCtrl_io_axi_decoder_io_outputs_0_ar_payload_addr;
  assign vgaArea_vgaCtrl_io_axi_decoder_io_outputs_0_ar_validPipe_payload_len = vgaArea_vgaCtrl_io_axi_decoder_io_outputs_0_ar_payload_len;
  assign vgaArea_vgaCtrl_io_axi_decoder_io_outputs_0_ar_validPipe_payload_size = vgaArea_vgaCtrl_io_axi_decoder_io_outputs_0_ar_payload_size;
  assign vgaArea_vgaCtrl_io_axi_decoder_io_outputs_0_ar_validPipe_payload_cache = vgaArea_vgaCtrl_io_axi_decoder_io_outputs_0_ar_payload_cache;
  assign vgaArea_vgaCtrl_io_axi_decoder_io_outputs_0_ar_validPipe_payload_prot = vgaArea_vgaCtrl_io_axi_decoder_io_outputs_0_ar_payload_prot;
  assign vgaArea_vgaCtrl_io_axi_decoder_io_outputs_0_ar_validPipe_ready = sdramCtrlArea_sdramCtrl_io_axi_arbiter_io_readInputs_1_ar_ready;
  assign vgaArea_vgaCtrl_io_axi_ar_halfPipe_fire = (vgaArea_vgaCtrl_io_axi_ar_halfPipe_valid && vgaArea_vgaCtrl_io_axi_ar_halfPipe_ready);
  assign vgaArea_vgaCtrl_io_axi_ar_ready = (! vgaArea_vgaCtrl_io_axi_ar_rValid);
  assign vgaArea_vgaCtrl_io_axi_ar_halfPipe_valid = vgaArea_vgaCtrl_io_axi_ar_rValid;
  assign vgaArea_vgaCtrl_io_axi_ar_halfPipe_payload_addr = vgaArea_vgaCtrl_io_axi_ar_rData_addr;
  assign vgaArea_vgaCtrl_io_axi_ar_halfPipe_payload_len = vgaArea_vgaCtrl_io_axi_ar_rData_len;
  assign vgaArea_vgaCtrl_io_axi_ar_halfPipe_payload_size = vgaArea_vgaCtrl_io_axi_ar_rData_size;
  assign vgaArea_vgaCtrl_io_axi_ar_halfPipe_payload_cache = vgaArea_vgaCtrl_io_axi_ar_rData_cache;
  assign vgaArea_vgaCtrl_io_axi_ar_halfPipe_payload_prot = vgaArea_vgaCtrl_io_axi_ar_rData_prot;
  assign vgaArea_vgaCtrl_io_axi_ar_halfPipe_ready = vgaArea_vgaCtrl_io_axi_decoder_io_input_ar_ready;
  assign sdramCtrlArea_sdramCtrl_io_axi_arbiter_io_readInputs_0_ar_payload_addr = axi4ReadOnlyDecoder_2_io_outputs_1_ar_validPipe_payload_addr[22:0];
  assign _zz_io_readInputs_0_ar_payload_id[1 : 0] = 2'b00;
  assign sdramCtrlArea_sdramCtrl_io_axi_arbiter_io_readInputs_1_ar_payload_addr = vgaArea_vgaCtrl_io_axi_decoder_io_outputs_0_ar_validPipe_payload_addr[22:0];
  assign _zz_io_readInputs_1_ar_payload_id[1 : 0] = 2'b00;
  assign sdramCtrlArea_sdramCtrl_io_axi_arbiter_io_sharedInputs_0_arw_payload_addr = dbus_axi_decoder_io_sharedOutputs_1_arw_validPipe_payload_addr[22:0];
  assign _zz_io_sharedInputs_0_arw_payload_id[1 : 0] = 2'b00;
  assign sdramCtrlArea_sdramCtrl_io_axi_arbiter_io_output_arw_halfPipe_fire = (sdramCtrlArea_sdramCtrl_io_axi_arbiter_io_output_arw_halfPipe_valid && sdramCtrlArea_sdramCtrl_io_axi_arbiter_io_output_arw_halfPipe_ready);
  assign sdramCtrlArea_sdramCtrl_io_axi_arbiter_io_output_arw_ready = (! sdramCtrlArea_sdramCtrl_io_axi_arbiter_io_output_arw_rValid);
  assign sdramCtrlArea_sdramCtrl_io_axi_arbiter_io_output_arw_halfPipe_valid = sdramCtrlArea_sdramCtrl_io_axi_arbiter_io_output_arw_rValid;
  assign sdramCtrlArea_sdramCtrl_io_axi_arbiter_io_output_arw_halfPipe_payload_addr = sdramCtrlArea_sdramCtrl_io_axi_arbiter_io_output_arw_rData_addr;
  assign sdramCtrlArea_sdramCtrl_io_axi_arbiter_io_output_arw_halfPipe_payload_id = sdramCtrlArea_sdramCtrl_io_axi_arbiter_io_output_arw_rData_id;
  assign sdramCtrlArea_sdramCtrl_io_axi_arbiter_io_output_arw_halfPipe_payload_len = sdramCtrlArea_sdramCtrl_io_axi_arbiter_io_output_arw_rData_len;
  assign sdramCtrlArea_sdramCtrl_io_axi_arbiter_io_output_arw_halfPipe_payload_size = sdramCtrlArea_sdramCtrl_io_axi_arbiter_io_output_arw_rData_size;
  assign sdramCtrlArea_sdramCtrl_io_axi_arbiter_io_output_arw_halfPipe_payload_burst = sdramCtrlArea_sdramCtrl_io_axi_arbiter_io_output_arw_rData_burst;
  assign sdramCtrlArea_sdramCtrl_io_axi_arbiter_io_output_arw_halfPipe_payload_write = sdramCtrlArea_sdramCtrl_io_axi_arbiter_io_output_arw_rData_write;
  assign sdramCtrlArea_sdramCtrl_io_axi_arbiter_io_output_arw_halfPipe_ready = sdramCtrlArea_sdramCtrl_io_axi_arw_ready;
  assign sdramCtrlArea_sdramCtrl_io_axi_arbiter_io_output_w_ready = (! sdramCtrlArea_sdramCtrl_io_axi_arbiter_io_output_w_rValid);
  assign sdramCtrlArea_sdramCtrl_io_axi_arbiter_io_output_w_s2mPipe_valid = (sdramCtrlArea_sdramCtrl_io_axi_arbiter_io_output_w_valid || sdramCtrlArea_sdramCtrl_io_axi_arbiter_io_output_w_rValid);
  assign sdramCtrlArea_sdramCtrl_io_axi_arbiter_io_output_w_s2mPipe_payload_data = (sdramCtrlArea_sdramCtrl_io_axi_arbiter_io_output_w_rValid ? sdramCtrlArea_sdramCtrl_io_axi_arbiter_io_output_w_rData_data : sdramCtrlArea_sdramCtrl_io_axi_arbiter_io_output_w_payload_data);
  assign sdramCtrlArea_sdramCtrl_io_axi_arbiter_io_output_w_s2mPipe_payload_strb = (sdramCtrlArea_sdramCtrl_io_axi_arbiter_io_output_w_rValid ? sdramCtrlArea_sdramCtrl_io_axi_arbiter_io_output_w_rData_strb : sdramCtrlArea_sdramCtrl_io_axi_arbiter_io_output_w_payload_strb);
  assign sdramCtrlArea_sdramCtrl_io_axi_arbiter_io_output_w_s2mPipe_payload_last = (sdramCtrlArea_sdramCtrl_io_axi_arbiter_io_output_w_rValid ? sdramCtrlArea_sdramCtrl_io_axi_arbiter_io_output_w_rData_last : sdramCtrlArea_sdramCtrl_io_axi_arbiter_io_output_w_payload_last);
  always @(*) begin
    sdramCtrlArea_sdramCtrl_io_axi_arbiter_io_output_w_s2mPipe_ready = sdramCtrlArea_sdramCtrl_io_axi_arbiter_io_output_w_s2mPipe_m2sPipe_ready;
    if(when_Stream_l342_3) begin
      sdramCtrlArea_sdramCtrl_io_axi_arbiter_io_output_w_s2mPipe_ready = 1'b1;
    end
  end

  assign when_Stream_l342_3 = (! sdramCtrlArea_sdramCtrl_io_axi_arbiter_io_output_w_s2mPipe_m2sPipe_valid);
  assign sdramCtrlArea_sdramCtrl_io_axi_arbiter_io_output_w_s2mPipe_m2sPipe_valid = sdramCtrlArea_sdramCtrl_io_axi_arbiter_io_output_w_s2mPipe_rValid;
  assign sdramCtrlArea_sdramCtrl_io_axi_arbiter_io_output_w_s2mPipe_m2sPipe_payload_data = sdramCtrlArea_sdramCtrl_io_axi_arbiter_io_output_w_s2mPipe_rData_data;
  assign sdramCtrlArea_sdramCtrl_io_axi_arbiter_io_output_w_s2mPipe_m2sPipe_payload_strb = sdramCtrlArea_sdramCtrl_io_axi_arbiter_io_output_w_s2mPipe_rData_strb;
  assign sdramCtrlArea_sdramCtrl_io_axi_arbiter_io_output_w_s2mPipe_m2sPipe_payload_last = sdramCtrlArea_sdramCtrl_io_axi_arbiter_io_output_w_s2mPipe_rData_last;
  assign sdramCtrlArea_sdramCtrl_io_axi_arbiter_io_output_w_s2mPipe_m2sPipe_ready = sdramCtrlArea_sdramCtrl_io_axi_w_ready;
  assign axi_ram_io_axi_arbiter_io_readInputs_0_ar_payload_addr = axi4ReadOnlyDecoder_2_io_outputs_0_ar_validPipe_payload_addr[14:0];
  assign _zz_io_readInputs_0_ar_payload_id_1[2 : 0] = 3'b000;
  assign axi_ram_io_axi_arbiter_io_sharedInputs_0_arw_payload_addr = dbus_axi_decoder_io_sharedOutputs_0_arw_validPipe_payload_addr[14:0];
  assign _zz_io_sharedInputs_0_arw_payload_id_1[2 : 0] = 3'b000;
  assign axi_ram_io_axi_arbiter_io_output_arw_halfPipe_fire = (axi_ram_io_axi_arbiter_io_output_arw_halfPipe_valid && axi_ram_io_axi_arbiter_io_output_arw_halfPipe_ready);
  assign axi_ram_io_axi_arbiter_io_output_arw_ready = (! axi_ram_io_axi_arbiter_io_output_arw_rValid);
  assign axi_ram_io_axi_arbiter_io_output_arw_halfPipe_valid = axi_ram_io_axi_arbiter_io_output_arw_rValid;
  assign axi_ram_io_axi_arbiter_io_output_arw_halfPipe_payload_addr = axi_ram_io_axi_arbiter_io_output_arw_rData_addr;
  assign axi_ram_io_axi_arbiter_io_output_arw_halfPipe_payload_id = axi_ram_io_axi_arbiter_io_output_arw_rData_id;
  assign axi_ram_io_axi_arbiter_io_output_arw_halfPipe_payload_len = axi_ram_io_axi_arbiter_io_output_arw_rData_len;
  assign axi_ram_io_axi_arbiter_io_output_arw_halfPipe_payload_size = axi_ram_io_axi_arbiter_io_output_arw_rData_size;
  assign axi_ram_io_axi_arbiter_io_output_arw_halfPipe_payload_burst = axi_ram_io_axi_arbiter_io_output_arw_rData_burst;
  assign axi_ram_io_axi_arbiter_io_output_arw_halfPipe_payload_write = axi_ram_io_axi_arbiter_io_output_arw_rData_write;
  assign axi_ram_io_axi_arbiter_io_output_arw_halfPipe_ready = axi_ram_io_axi_arw_ready;
  assign axi_ram_io_axi_arbiter_io_output_w_ready = (! axi_ram_io_axi_arbiter_io_output_w_rValid);
  assign axi_ram_io_axi_arbiter_io_output_w_s2mPipe_valid = (axi_ram_io_axi_arbiter_io_output_w_valid || axi_ram_io_axi_arbiter_io_output_w_rValid);
  assign axi_ram_io_axi_arbiter_io_output_w_s2mPipe_payload_data = (axi_ram_io_axi_arbiter_io_output_w_rValid ? axi_ram_io_axi_arbiter_io_output_w_rData_data : axi_ram_io_axi_arbiter_io_output_w_payload_data);
  assign axi_ram_io_axi_arbiter_io_output_w_s2mPipe_payload_strb = (axi_ram_io_axi_arbiter_io_output_w_rValid ? axi_ram_io_axi_arbiter_io_output_w_rData_strb : axi_ram_io_axi_arbiter_io_output_w_payload_strb);
  assign axi_ram_io_axi_arbiter_io_output_w_s2mPipe_payload_last = (axi_ram_io_axi_arbiter_io_output_w_rValid ? axi_ram_io_axi_arbiter_io_output_w_rData_last : axi_ram_io_axi_arbiter_io_output_w_payload_last);
  always @(*) begin
    axi_ram_io_axi_arbiter_io_output_w_s2mPipe_ready = axi_ram_io_axi_arbiter_io_output_w_s2mPipe_m2sPipe_ready;
    if(when_Stream_l342_4) begin
      axi_ram_io_axi_arbiter_io_output_w_s2mPipe_ready = 1'b1;
    end
  end

  assign when_Stream_l342_4 = (! axi_ram_io_axi_arbiter_io_output_w_s2mPipe_m2sPipe_valid);
  assign axi_ram_io_axi_arbiter_io_output_w_s2mPipe_m2sPipe_valid = axi_ram_io_axi_arbiter_io_output_w_s2mPipe_rValid;
  assign axi_ram_io_axi_arbiter_io_output_w_s2mPipe_m2sPipe_payload_data = axi_ram_io_axi_arbiter_io_output_w_s2mPipe_rData_data;
  assign axi_ram_io_axi_arbiter_io_output_w_s2mPipe_m2sPipe_payload_strb = axi_ram_io_axi_arbiter_io_output_w_s2mPipe_rData_strb;
  assign axi_ram_io_axi_arbiter_io_output_w_s2mPipe_m2sPipe_payload_last = axi_ram_io_axi_arbiter_io_output_w_s2mPipe_rData_last;
  assign axi_ram_io_axi_arbiter_io_output_w_s2mPipe_m2sPipe_ready = axi_ram_io_axi_w_ready;
  assign axi_apbBridge_io_axi_arbiter_io_sharedInputs_0_arw_payload_addr = dbus_axi_decoder_io_sharedOutputs_2_arw_validPipe_payload_addr[19:0];
  assign _zz_io_sharedInputs_0_arw_payload_id_2[3 : 0] = 4'b0000;
  assign axi_apbBridge_io_axi_arbiter_io_output_arw_halfPipe_fire = (axi_apbBridge_io_axi_arbiter_io_output_arw_halfPipe_valid && axi_apbBridge_io_axi_arbiter_io_output_arw_halfPipe_ready);
  assign axi_apbBridge_io_axi_arbiter_io_output_arw_ready = (! axi_apbBridge_io_axi_arbiter_io_output_arw_rValid);
  assign axi_apbBridge_io_axi_arbiter_io_output_arw_halfPipe_valid = axi_apbBridge_io_axi_arbiter_io_output_arw_rValid;
  assign axi_apbBridge_io_axi_arbiter_io_output_arw_halfPipe_payload_addr = axi_apbBridge_io_axi_arbiter_io_output_arw_rData_addr;
  assign axi_apbBridge_io_axi_arbiter_io_output_arw_halfPipe_payload_id = axi_apbBridge_io_axi_arbiter_io_output_arw_rData_id;
  assign axi_apbBridge_io_axi_arbiter_io_output_arw_halfPipe_payload_len = axi_apbBridge_io_axi_arbiter_io_output_arw_rData_len;
  assign axi_apbBridge_io_axi_arbiter_io_output_arw_halfPipe_payload_size = axi_apbBridge_io_axi_arbiter_io_output_arw_rData_size;
  assign axi_apbBridge_io_axi_arbiter_io_output_arw_halfPipe_payload_burst = axi_apbBridge_io_axi_arbiter_io_output_arw_rData_burst;
  assign axi_apbBridge_io_axi_arbiter_io_output_arw_halfPipe_payload_write = axi_apbBridge_io_axi_arbiter_io_output_arw_rData_write;
  assign axi_apbBridge_io_axi_arbiter_io_output_arw_halfPipe_ready = axi_apbBridge_io_axi_arw_ready;
  assign axi_apbBridge_io_axi_arbiter_io_output_w_halfPipe_fire = (axi_apbBridge_io_axi_arbiter_io_output_w_halfPipe_valid && axi_apbBridge_io_axi_arbiter_io_output_w_halfPipe_ready);
  assign axi_apbBridge_io_axi_arbiter_io_output_w_ready = (! axi_apbBridge_io_axi_arbiter_io_output_w_rValid);
  assign axi_apbBridge_io_axi_arbiter_io_output_w_halfPipe_valid = axi_apbBridge_io_axi_arbiter_io_output_w_rValid;
  assign axi_apbBridge_io_axi_arbiter_io_output_w_halfPipe_payload_data = axi_apbBridge_io_axi_arbiter_io_output_w_rData_data;
  assign axi_apbBridge_io_axi_arbiter_io_output_w_halfPipe_payload_strb = axi_apbBridge_io_axi_arbiter_io_output_w_rData_strb;
  assign axi_apbBridge_io_axi_arbiter_io_output_w_halfPipe_payload_last = axi_apbBridge_io_axi_arbiter_io_output_w_rData_last;
  assign axi_apbBridge_io_axi_arbiter_io_output_w_halfPipe_ready = axi_apbBridge_io_axi_w_ready;
  assign axi_gpioACtrl_io_apb_PADDR = apb3Router_1_io_outputs_0_PADDR[3:0];
  assign axi_uartCtrl_io_apb_PADDR = apb3Router_1_io_outputs_1_PADDR[4:0];
  assign axi_timerCtrl_io_apb_PADDR = apb3Router_1_io_outputs_2_PADDR[7:0];
  assign axi_i2cCtrl_io_apb_PADDR = apb3Router_1_io_outputs_3_PADDR[7:0];
  assign axi_spiCtrl_io_apb_PADDR = apb3Router_1_io_outputs_4_PADDR[7:0];
  assign axi_ledCtrl_io_apb_PADDR = apb3Router_1_io_outputs_5_PADDR[7:0];
  assign vgaArea_vgaCtrl_io_apb_PADDR = apb3Router_1_io_outputs_6_PADDR[7:0];
  assign _zz_gpioA_16 = axi_gpioACtrl_io_gpio_write;
  assign _zz_when_InOutWrapper_l65 = axi_gpioACtrl_io_gpio_writeEnable;
  assign o_rgb_led = (~ axi_ledCtrl_io_leds);
  assign uart_0_txd = axi_uartCtrl_io_uart_txd;
  assign sdramArea_sdram_dm0 = sdramCtrlArea_sdramCtrl_io_sdram_DQM[0];
  assign sdramArea_sdram_dm1 = sdramCtrlArea_sdramCtrl_io_sdram_DQM[1];
  assign sdramArea_sdram_dm2 = sdramCtrlArea_sdramCtrl_io_sdram_DQM[2];
  assign sdramArea_sdram_dm3 = sdramCtrlArea_sdramCtrl_io_sdram_DQM[3];
  assign vga_vSync = vgaArea_vgaCtrl_io_vga_vSync;
  assign vga_hSync = vgaArea_vgaCtrl_io_vga_hSync;
  assign vga_colorEn = vgaArea_vgaCtrl_io_vga_colorEn;
  assign vga_color_r = vgaArea_vgaCtrl_io_vga_color_r;
  assign vga_color_g = vgaArea_vgaCtrl_io_vga_color_g;
  assign vga_color_b = vgaArea_vgaCtrl_io_vga_color_b;
  always @(*) begin
    vga_color_r_low[0] = vgaArea_vgaCtrl_io_vga_color_r[0];
    vga_color_r_low[1] = vgaArea_vgaCtrl_io_vga_color_r[0];
    vga_color_r_low[2] = vgaArea_vgaCtrl_io_vga_color_r[0];
  end

  always @(*) begin
    vga_color_g_low[0] = vgaArea_vgaCtrl_io_vga_color_g[0];
    vga_color_g_low[1] = vgaArea_vgaCtrl_io_vga_color_g[0];
  end

  always @(*) begin
    vga_color_b_low[0] = vgaArea_vgaCtrl_io_vga_color_b[0];
    vga_color_b_low[1] = vgaArea_vgaCtrl_io_vga_color_b[0];
    vga_color_b_low[2] = vgaArea_vgaCtrl_io_vga_color_b[0];
  end

  assign _zz_when_InOutWrapper_l48 = axi_i2cCtrl_io_i2c_sda_write;
  assign _zz_when_InOutWrapper_l48_1 = axi_i2cCtrl_io_i2c_scl_write;
  assign spi_0_ss = axi_spiCtrl_io_spi_ss;
  assign spi_0_sclk = axi_spiCtrl_io_spi_sclk;
  assign spi_0_mosi = axi_spiCtrl_io_spi_mosi;
  assign _zz_io_gpio_read = gpioA;
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
  assign _zz_io_i2c_scl_read = i2c_0_scl;
  assign when_InOutWrapper_l48 = (! _zz_when_InOutWrapper_l48_2[0]);
  assign _zz_io_i2c_sda_read = i2c_0_sda;
  assign when_InOutWrapper_l48_1 = (! _zz_when_InOutWrapper_l48_1_1[0]);
  always @(posedge i_clk or negedge asyncReset) begin
    if(!asyncReset) begin
      resetCtrl_systemResetCounter <= 6'h0;
    end else begin
      if(when_TangPrimerBriey_l338) begin
        resetCtrl_systemResetCounter <= (resetCtrl_systemResetCounter + 6'h01);
      end
      if(when_TangPrimerBriey_l342) begin
        resetCtrl_systemResetCounter <= 6'h0;
      end
    end
  end

  always @(posedge i_clk) begin
    resetCtrl_systemReset <= resetCtrl_systemResetUnbuffered;
    resetCtrl_axiReset <= resetCtrl_systemResetUnbuffered;
    if(axi_core_cpu_debug_resetOut_regNext) begin
      resetCtrl_axiReset <= 1'b1;
    end
  end

  always @(posedge axiClk or posedge resetCtrl_axiReset) begin
    if(resetCtrl_axiReset) begin
      axi_core_cpu_dBus_cmd_rValid <= 1'b0;
      axi_core_cpu_dBus_cmd_m2sPipe_rValid <= 1'b0;
      axi_core_cpu_dBus_cmd_m2sPipe_m2sPipe_rValid <= 1'b0;
      _zz_axi_core_cpu_dBus_cmd_m2sPipe_m2sPipe_s2mPipe_ready <= 3'b000;
      _zz_1 <= 1'b0;
      axi4ReadOnlyDecoder_2_io_outputs_0_ar_rValid <= 1'b0;
      axi4ReadOnlyDecoder_2_io_outputs_1_ar_rValid <= 1'b0;
      dbus_axi_decoder_io_sharedOutputs_0_arw_rValid <= 1'b0;
      dbus_axi_decoder_io_sharedOutputs_1_arw_rValid <= 1'b0;
      dbus_axi_decoder_io_sharedOutputs_2_arw_rValid <= 1'b0;
      dbus_axi_decoder_io_input_r_rValid <= 1'b0;
      vgaArea_vgaCtrl_io_axi_decoder_io_outputs_0_ar_rValid <= 1'b0;
      vgaArea_vgaCtrl_io_axi_ar_rValid <= 1'b0;
      sdramCtrlArea_sdramCtrl_io_axi_arbiter_io_output_arw_rValid <= 1'b0;
      sdramCtrlArea_sdramCtrl_io_axi_arbiter_io_output_w_rValid <= 1'b0;
      sdramCtrlArea_sdramCtrl_io_axi_arbiter_io_output_w_s2mPipe_rValid <= 1'b0;
      axi_ram_io_axi_arbiter_io_output_arw_rValid <= 1'b0;
      axi_ram_io_axi_arbiter_io_output_w_rValid <= 1'b0;
      axi_ram_io_axi_arbiter_io_output_w_s2mPipe_rValid <= 1'b0;
      axi_apbBridge_io_axi_arbiter_io_output_arw_rValid <= 1'b0;
      axi_apbBridge_io_axi_arbiter_io_output_w_rValid <= 1'b0;
    end else begin
      if(axi_core_cpu_dBus_cmd_ready) begin
        axi_core_cpu_dBus_cmd_rValid <= axi_core_cpu_dBus_cmd_valid;
      end
      if(axi_core_cpu_dBus_cmd_m2sPipe_ready) begin
        axi_core_cpu_dBus_cmd_m2sPipe_rValid <= axi_core_cpu_dBus_cmd_m2sPipe_valid;
      end
      if(axi_core_cpu_dBus_cmd_m2sPipe_m2sPipe_valid) begin
        axi_core_cpu_dBus_cmd_m2sPipe_m2sPipe_rValid <= 1'b1;
      end
      if(axi_core_cpu_dBus_cmd_m2sPipe_m2sPipe_s2mPipe_ready) begin
        axi_core_cpu_dBus_cmd_m2sPipe_m2sPipe_rValid <= 1'b0;
      end
      _zz_axi_core_cpu_dBus_cmd_m2sPipe_m2sPipe_s2mPipe_ready <= (_zz_axi_core_cpu_dBus_cmd_m2sPipe_m2sPipe_s2mPipe_ready + _zz_axi_core_cpu_dBus_cmd_m2sPipe_m2sPipe_s2mPipe_ready_1);
      if(streamFork_4_io_outputs_0_fire) begin
        _zz_1 <= (! streamFork_4_io_outputs_0_payload_last);
      end
      if(axi4ReadOnlyDecoder_2_io_outputs_0_ar_valid) begin
        axi4ReadOnlyDecoder_2_io_outputs_0_ar_rValid <= 1'b1;
      end
      if(axi4ReadOnlyDecoder_2_io_outputs_0_ar_validPipe_fire) begin
        axi4ReadOnlyDecoder_2_io_outputs_0_ar_rValid <= 1'b0;
      end
      if(axi4ReadOnlyDecoder_2_io_outputs_1_ar_valid) begin
        axi4ReadOnlyDecoder_2_io_outputs_1_ar_rValid <= 1'b1;
      end
      if(axi4ReadOnlyDecoder_2_io_outputs_1_ar_validPipe_fire) begin
        axi4ReadOnlyDecoder_2_io_outputs_1_ar_rValid <= 1'b0;
      end
      if(dbus_axi_decoder_io_sharedOutputs_0_arw_valid) begin
        dbus_axi_decoder_io_sharedOutputs_0_arw_rValid <= 1'b1;
      end
      if(dbus_axi_decoder_io_sharedOutputs_0_arw_validPipe_fire) begin
        dbus_axi_decoder_io_sharedOutputs_0_arw_rValid <= 1'b0;
      end
      if(dbus_axi_decoder_io_sharedOutputs_1_arw_valid) begin
        dbus_axi_decoder_io_sharedOutputs_1_arw_rValid <= 1'b1;
      end
      if(dbus_axi_decoder_io_sharedOutputs_1_arw_validPipe_fire) begin
        dbus_axi_decoder_io_sharedOutputs_1_arw_rValid <= 1'b0;
      end
      if(dbus_axi_decoder_io_sharedOutputs_2_arw_valid) begin
        dbus_axi_decoder_io_sharedOutputs_2_arw_rValid <= 1'b1;
      end
      if(dbus_axi_decoder_io_sharedOutputs_2_arw_validPipe_fire) begin
        dbus_axi_decoder_io_sharedOutputs_2_arw_rValid <= 1'b0;
      end
      if(dbus_axi_decoder_io_input_r_ready) begin
        dbus_axi_decoder_io_input_r_rValid <= dbus_axi_decoder_io_input_r_valid;
      end
      if(vgaArea_vgaCtrl_io_axi_decoder_io_outputs_0_ar_valid) begin
        vgaArea_vgaCtrl_io_axi_decoder_io_outputs_0_ar_rValid <= 1'b1;
      end
      if(vgaArea_vgaCtrl_io_axi_decoder_io_outputs_0_ar_validPipe_fire) begin
        vgaArea_vgaCtrl_io_axi_decoder_io_outputs_0_ar_rValid <= 1'b0;
      end
      if(vgaArea_vgaCtrl_io_axi_ar_valid) begin
        vgaArea_vgaCtrl_io_axi_ar_rValid <= 1'b1;
      end
      if(vgaArea_vgaCtrl_io_axi_ar_halfPipe_fire) begin
        vgaArea_vgaCtrl_io_axi_ar_rValid <= 1'b0;
      end
      if(sdramCtrlArea_sdramCtrl_io_axi_arbiter_io_output_arw_valid) begin
        sdramCtrlArea_sdramCtrl_io_axi_arbiter_io_output_arw_rValid <= 1'b1;
      end
      if(sdramCtrlArea_sdramCtrl_io_axi_arbiter_io_output_arw_halfPipe_fire) begin
        sdramCtrlArea_sdramCtrl_io_axi_arbiter_io_output_arw_rValid <= 1'b0;
      end
      if(sdramCtrlArea_sdramCtrl_io_axi_arbiter_io_output_w_valid) begin
        sdramCtrlArea_sdramCtrl_io_axi_arbiter_io_output_w_rValid <= 1'b1;
      end
      if(sdramCtrlArea_sdramCtrl_io_axi_arbiter_io_output_w_s2mPipe_ready) begin
        sdramCtrlArea_sdramCtrl_io_axi_arbiter_io_output_w_rValid <= 1'b0;
      end
      if(sdramCtrlArea_sdramCtrl_io_axi_arbiter_io_output_w_s2mPipe_ready) begin
        sdramCtrlArea_sdramCtrl_io_axi_arbiter_io_output_w_s2mPipe_rValid <= sdramCtrlArea_sdramCtrl_io_axi_arbiter_io_output_w_s2mPipe_valid;
      end
      if(axi_ram_io_axi_arbiter_io_output_arw_valid) begin
        axi_ram_io_axi_arbiter_io_output_arw_rValid <= 1'b1;
      end
      if(axi_ram_io_axi_arbiter_io_output_arw_halfPipe_fire) begin
        axi_ram_io_axi_arbiter_io_output_arw_rValid <= 1'b0;
      end
      if(axi_ram_io_axi_arbiter_io_output_w_valid) begin
        axi_ram_io_axi_arbiter_io_output_w_rValid <= 1'b1;
      end
      if(axi_ram_io_axi_arbiter_io_output_w_s2mPipe_ready) begin
        axi_ram_io_axi_arbiter_io_output_w_rValid <= 1'b0;
      end
      if(axi_ram_io_axi_arbiter_io_output_w_s2mPipe_ready) begin
        axi_ram_io_axi_arbiter_io_output_w_s2mPipe_rValid <= axi_ram_io_axi_arbiter_io_output_w_s2mPipe_valid;
      end
      if(axi_apbBridge_io_axi_arbiter_io_output_arw_valid) begin
        axi_apbBridge_io_axi_arbiter_io_output_arw_rValid <= 1'b1;
      end
      if(axi_apbBridge_io_axi_arbiter_io_output_arw_halfPipe_fire) begin
        axi_apbBridge_io_axi_arbiter_io_output_arw_rValid <= 1'b0;
      end
      if(axi_apbBridge_io_axi_arbiter_io_output_w_valid) begin
        axi_apbBridge_io_axi_arbiter_io_output_w_rValid <= 1'b1;
      end
      if(axi_apbBridge_io_axi_arbiter_io_output_w_halfPipe_fire) begin
        axi_apbBridge_io_axi_arbiter_io_output_w_rValid <= 1'b0;
      end
    end
  end

  always @(posedge axiClk) begin
    if(axi_core_cpu_dBus_cmd_ready) begin
      axi_core_cpu_dBus_cmd_rData_wr <= axi_core_cpu_dBus_cmd_payload_wr;
      axi_core_cpu_dBus_cmd_rData_uncached <= axi_core_cpu_dBus_cmd_payload_uncached;
      axi_core_cpu_dBus_cmd_rData_address <= axi_core_cpu_dBus_cmd_payload_address;
      axi_core_cpu_dBus_cmd_rData_data <= axi_core_cpu_dBus_cmd_payload_data;
      axi_core_cpu_dBus_cmd_rData_mask <= axi_core_cpu_dBus_cmd_payload_mask;
      axi_core_cpu_dBus_cmd_rData_size <= axi_core_cpu_dBus_cmd_payload_size;
      axi_core_cpu_dBus_cmd_rData_last <= axi_core_cpu_dBus_cmd_payload_last;
    end
    if(axi_core_cpu_dBus_cmd_m2sPipe_ready) begin
      axi_core_cpu_dBus_cmd_m2sPipe_rData_wr <= axi_core_cpu_dBus_cmd_m2sPipe_payload_wr;
      axi_core_cpu_dBus_cmd_m2sPipe_rData_uncached <= axi_core_cpu_dBus_cmd_m2sPipe_payload_uncached;
      axi_core_cpu_dBus_cmd_m2sPipe_rData_address <= axi_core_cpu_dBus_cmd_m2sPipe_payload_address;
      axi_core_cpu_dBus_cmd_m2sPipe_rData_data <= axi_core_cpu_dBus_cmd_m2sPipe_payload_data;
      axi_core_cpu_dBus_cmd_m2sPipe_rData_mask <= axi_core_cpu_dBus_cmd_m2sPipe_payload_mask;
      axi_core_cpu_dBus_cmd_m2sPipe_rData_size <= axi_core_cpu_dBus_cmd_m2sPipe_payload_size;
      axi_core_cpu_dBus_cmd_m2sPipe_rData_last <= axi_core_cpu_dBus_cmd_m2sPipe_payload_last;
    end
    if(axi_core_cpu_dBus_cmd_m2sPipe_m2sPipe_ready) begin
      axi_core_cpu_dBus_cmd_m2sPipe_m2sPipe_rData_wr <= axi_core_cpu_dBus_cmd_m2sPipe_m2sPipe_payload_wr;
      axi_core_cpu_dBus_cmd_m2sPipe_m2sPipe_rData_uncached <= axi_core_cpu_dBus_cmd_m2sPipe_m2sPipe_payload_uncached;
      axi_core_cpu_dBus_cmd_m2sPipe_m2sPipe_rData_address <= axi_core_cpu_dBus_cmd_m2sPipe_m2sPipe_payload_address;
      axi_core_cpu_dBus_cmd_m2sPipe_m2sPipe_rData_data <= axi_core_cpu_dBus_cmd_m2sPipe_m2sPipe_payload_data;
      axi_core_cpu_dBus_cmd_m2sPipe_m2sPipe_rData_mask <= axi_core_cpu_dBus_cmd_m2sPipe_m2sPipe_payload_mask;
      axi_core_cpu_dBus_cmd_m2sPipe_m2sPipe_rData_size <= axi_core_cpu_dBus_cmd_m2sPipe_m2sPipe_payload_size;
      axi_core_cpu_dBus_cmd_m2sPipe_m2sPipe_rData_last <= axi_core_cpu_dBus_cmd_m2sPipe_m2sPipe_payload_last;
    end
    if(dbus_axi_decoder_io_input_r_ready) begin
      dbus_axi_decoder_io_input_r_rData_data <= dbus_axi_decoder_io_input_r_payload_data;
      dbus_axi_decoder_io_input_r_rData_resp <= dbus_axi_decoder_io_input_r_payload_resp;
      dbus_axi_decoder_io_input_r_rData_last <= dbus_axi_decoder_io_input_r_payload_last;
    end
    if(vgaArea_vgaCtrl_io_axi_ar_ready) begin
      vgaArea_vgaCtrl_io_axi_ar_rData_addr <= vgaArea_vgaCtrl_io_axi_ar_payload_addr;
      vgaArea_vgaCtrl_io_axi_ar_rData_len <= vgaArea_vgaCtrl_io_axi_ar_payload_len;
      vgaArea_vgaCtrl_io_axi_ar_rData_size <= vgaArea_vgaCtrl_io_axi_ar_payload_size;
      vgaArea_vgaCtrl_io_axi_ar_rData_cache <= vgaArea_vgaCtrl_io_axi_ar_payload_cache;
      vgaArea_vgaCtrl_io_axi_ar_rData_prot <= vgaArea_vgaCtrl_io_axi_ar_payload_prot;
    end
    if(sdramCtrlArea_sdramCtrl_io_axi_arbiter_io_output_arw_ready) begin
      sdramCtrlArea_sdramCtrl_io_axi_arbiter_io_output_arw_rData_addr <= sdramCtrlArea_sdramCtrl_io_axi_arbiter_io_output_arw_payload_addr;
      sdramCtrlArea_sdramCtrl_io_axi_arbiter_io_output_arw_rData_id <= sdramCtrlArea_sdramCtrl_io_axi_arbiter_io_output_arw_payload_id;
      sdramCtrlArea_sdramCtrl_io_axi_arbiter_io_output_arw_rData_len <= sdramCtrlArea_sdramCtrl_io_axi_arbiter_io_output_arw_payload_len;
      sdramCtrlArea_sdramCtrl_io_axi_arbiter_io_output_arw_rData_size <= sdramCtrlArea_sdramCtrl_io_axi_arbiter_io_output_arw_payload_size;
      sdramCtrlArea_sdramCtrl_io_axi_arbiter_io_output_arw_rData_burst <= sdramCtrlArea_sdramCtrl_io_axi_arbiter_io_output_arw_payload_burst;
      sdramCtrlArea_sdramCtrl_io_axi_arbiter_io_output_arw_rData_write <= sdramCtrlArea_sdramCtrl_io_axi_arbiter_io_output_arw_payload_write;
    end
    if(sdramCtrlArea_sdramCtrl_io_axi_arbiter_io_output_w_ready) begin
      sdramCtrlArea_sdramCtrl_io_axi_arbiter_io_output_w_rData_data <= sdramCtrlArea_sdramCtrl_io_axi_arbiter_io_output_w_payload_data;
      sdramCtrlArea_sdramCtrl_io_axi_arbiter_io_output_w_rData_strb <= sdramCtrlArea_sdramCtrl_io_axi_arbiter_io_output_w_payload_strb;
      sdramCtrlArea_sdramCtrl_io_axi_arbiter_io_output_w_rData_last <= sdramCtrlArea_sdramCtrl_io_axi_arbiter_io_output_w_payload_last;
    end
    if(sdramCtrlArea_sdramCtrl_io_axi_arbiter_io_output_w_s2mPipe_ready) begin
      sdramCtrlArea_sdramCtrl_io_axi_arbiter_io_output_w_s2mPipe_rData_data <= sdramCtrlArea_sdramCtrl_io_axi_arbiter_io_output_w_s2mPipe_payload_data;
      sdramCtrlArea_sdramCtrl_io_axi_arbiter_io_output_w_s2mPipe_rData_strb <= sdramCtrlArea_sdramCtrl_io_axi_arbiter_io_output_w_s2mPipe_payload_strb;
      sdramCtrlArea_sdramCtrl_io_axi_arbiter_io_output_w_s2mPipe_rData_last <= sdramCtrlArea_sdramCtrl_io_axi_arbiter_io_output_w_s2mPipe_payload_last;
    end
    if(axi_ram_io_axi_arbiter_io_output_arw_ready) begin
      axi_ram_io_axi_arbiter_io_output_arw_rData_addr <= axi_ram_io_axi_arbiter_io_output_arw_payload_addr;
      axi_ram_io_axi_arbiter_io_output_arw_rData_id <= axi_ram_io_axi_arbiter_io_output_arw_payload_id;
      axi_ram_io_axi_arbiter_io_output_arw_rData_len <= axi_ram_io_axi_arbiter_io_output_arw_payload_len;
      axi_ram_io_axi_arbiter_io_output_arw_rData_size <= axi_ram_io_axi_arbiter_io_output_arw_payload_size;
      axi_ram_io_axi_arbiter_io_output_arw_rData_burst <= axi_ram_io_axi_arbiter_io_output_arw_payload_burst;
      axi_ram_io_axi_arbiter_io_output_arw_rData_write <= axi_ram_io_axi_arbiter_io_output_arw_payload_write;
    end
    if(axi_ram_io_axi_arbiter_io_output_w_ready) begin
      axi_ram_io_axi_arbiter_io_output_w_rData_data <= axi_ram_io_axi_arbiter_io_output_w_payload_data;
      axi_ram_io_axi_arbiter_io_output_w_rData_strb <= axi_ram_io_axi_arbiter_io_output_w_payload_strb;
      axi_ram_io_axi_arbiter_io_output_w_rData_last <= axi_ram_io_axi_arbiter_io_output_w_payload_last;
    end
    if(axi_ram_io_axi_arbiter_io_output_w_s2mPipe_ready) begin
      axi_ram_io_axi_arbiter_io_output_w_s2mPipe_rData_data <= axi_ram_io_axi_arbiter_io_output_w_s2mPipe_payload_data;
      axi_ram_io_axi_arbiter_io_output_w_s2mPipe_rData_strb <= axi_ram_io_axi_arbiter_io_output_w_s2mPipe_payload_strb;
      axi_ram_io_axi_arbiter_io_output_w_s2mPipe_rData_last <= axi_ram_io_axi_arbiter_io_output_w_s2mPipe_payload_last;
    end
    if(axi_apbBridge_io_axi_arbiter_io_output_arw_ready) begin
      axi_apbBridge_io_axi_arbiter_io_output_arw_rData_addr <= axi_apbBridge_io_axi_arbiter_io_output_arw_payload_addr;
      axi_apbBridge_io_axi_arbiter_io_output_arw_rData_id <= axi_apbBridge_io_axi_arbiter_io_output_arw_payload_id;
      axi_apbBridge_io_axi_arbiter_io_output_arw_rData_len <= axi_apbBridge_io_axi_arbiter_io_output_arw_payload_len;
      axi_apbBridge_io_axi_arbiter_io_output_arw_rData_size <= axi_apbBridge_io_axi_arbiter_io_output_arw_payload_size;
      axi_apbBridge_io_axi_arbiter_io_output_arw_rData_burst <= axi_apbBridge_io_axi_arbiter_io_output_arw_payload_burst;
      axi_apbBridge_io_axi_arbiter_io_output_arw_rData_write <= axi_apbBridge_io_axi_arbiter_io_output_arw_payload_write;
    end
    if(axi_apbBridge_io_axi_arbiter_io_output_w_ready) begin
      axi_apbBridge_io_axi_arbiter_io_output_w_rData_data <= axi_apbBridge_io_axi_arbiter_io_output_w_payload_data;
      axi_apbBridge_io_axi_arbiter_io_output_w_rData_strb <= axi_apbBridge_io_axi_arbiter_io_output_w_payload_strb;
      axi_apbBridge_io_axi_arbiter_io_output_w_rData_last <= axi_apbBridge_io_axi_arbiter_io_output_w_payload_last;
    end
  end

  always @(posedge axiClk) begin
    axi_core_cpu_debug_resetOut_regNext <= axi_core_cpu_debug_resetOut;
  end

  always @(posedge axiClk or posedge resetCtrl_systemReset) begin
    if(resetCtrl_systemReset) begin
      axi_core_cpu_debug_bus_cmd_fire_regNext <= 1'b0;
    end else begin
      axi_core_cpu_debug_bus_cmd_fire_regNext <= axi_core_cpu_debug_bus_cmd_fire;
    end
  end


endmodule

module Apb3Router (
  input      [19:0]   io_input_PADDR,
  input      [6:0]    io_input_PSEL,
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
  output     [19:0]   io_outputs_6_PADDR,
  output     [0:0]    io_outputs_6_PSEL,
  output              io_outputs_6_PENABLE,
  input               io_outputs_6_PREADY,
  output              io_outputs_6_PWRITE,
  output     [31:0]   io_outputs_6_PWDATA,
  input      [31:0]   io_outputs_6_PRDATA,
  input               io_outputs_6_PSLVERROR,
  input               axiClk,
  input               resetCtrl_axiReset
);

  reg                 _zz_io_input_PREADY;
  reg        [31:0]   _zz_io_input_PRDATA;
  reg                 _zz_io_input_PSLVERROR;
  wire                _zz_selIndex;
  wire                _zz_selIndex_1;
  wire                _zz_selIndex_2;
  wire                _zz_selIndex_3;
  wire                _zz_selIndex_4;
  wire                _zz_selIndex_5;
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
      3'b101 : begin
        _zz_io_input_PREADY = io_outputs_5_PREADY;
        _zz_io_input_PRDATA = io_outputs_5_PRDATA;
        _zz_io_input_PSLVERROR = io_outputs_5_PSLVERROR;
      end
      default : begin
        _zz_io_input_PREADY = io_outputs_6_PREADY;
        _zz_io_input_PRDATA = io_outputs_6_PRDATA;
        _zz_io_input_PSLVERROR = io_outputs_6_PSLVERROR;
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
  assign io_outputs_6_PADDR = io_input_PADDR;
  assign io_outputs_6_PENABLE = io_input_PENABLE;
  assign io_outputs_6_PSEL[0] = io_input_PSEL[6];
  assign io_outputs_6_PWRITE = io_input_PWRITE;
  assign io_outputs_6_PWDATA = io_input_PWDATA;
  assign _zz_selIndex = io_input_PSEL[3];
  assign _zz_selIndex_1 = io_input_PSEL[5];
  assign _zz_selIndex_2 = io_input_PSEL[6];
  assign _zz_selIndex_3 = ((io_input_PSEL[1] || _zz_selIndex) || _zz_selIndex_1);
  assign _zz_selIndex_4 = ((io_input_PSEL[2] || _zz_selIndex) || _zz_selIndex_2);
  assign _zz_selIndex_5 = ((io_input_PSEL[4] || _zz_selIndex_1) || _zz_selIndex_2);
  assign io_input_PREADY = _zz_io_input_PREADY;
  assign io_input_PRDATA = _zz_io_input_PRDATA;
  assign io_input_PSLVERROR = _zz_io_input_PSLVERROR;
  always @(posedge axiClk) begin
    selIndex <= {_zz_selIndex_5,{_zz_selIndex_4,_zz_selIndex_3}};
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
  output reg [6:0]    io_output_PSEL,
  output              io_output_PENABLE,
  input               io_output_PREADY,
  output              io_output_PWRITE,
  output     [31:0]   io_output_PWDATA,
  input      [31:0]   io_output_PRDATA,
  input               io_output_PSLVERROR
);

  wire                when_Apb3Decoder_l88;

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
    io_output_PSEL[5] = (((io_input_PADDR & (~ 20'h003ff)) == 20'h32000) && io_input_PSEL[0]);
    io_output_PSEL[6] = (((io_input_PADDR & (~ 20'h00fff)) == 20'h33000) && io_input_PSEL[0]);
  end

  always @(*) begin
    io_input_PREADY = io_output_PREADY;
    if(when_Apb3Decoder_l88) begin
      io_input_PREADY = 1'b1;
    end
  end

  assign io_input_PRDATA = io_output_PRDATA;
  always @(*) begin
    io_input_PSLVERROR = io_output_PSLVERROR;
    if(when_Apb3Decoder_l88) begin
      io_input_PSLVERROR = 1'b1;
    end
  end

  assign when_Apb3Decoder_l88 = (io_input_PSEL[0] && (io_output_PSEL == 7'h0));

endmodule

module Axi4SharedArbiter_2 (
  input               io_sharedInputs_0_arw_valid,
  output              io_sharedInputs_0_arw_ready,
  input      [19:0]   io_sharedInputs_0_arw_payload_addr,
  input      [3:0]    io_sharedInputs_0_arw_payload_id,
  input      [7:0]    io_sharedInputs_0_arw_payload_len,
  input      [2:0]    io_sharedInputs_0_arw_payload_size,
  input      [1:0]    io_sharedInputs_0_arw_payload_burst,
  input               io_sharedInputs_0_arw_payload_write,
  input               io_sharedInputs_0_w_valid,
  output              io_sharedInputs_0_w_ready,
  input      [31:0]   io_sharedInputs_0_w_payload_data,
  input      [3:0]    io_sharedInputs_0_w_payload_strb,
  input               io_sharedInputs_0_w_payload_last,
  output              io_sharedInputs_0_b_valid,
  input               io_sharedInputs_0_b_ready,
  output     [3:0]    io_sharedInputs_0_b_payload_id,
  output     [1:0]    io_sharedInputs_0_b_payload_resp,
  output              io_sharedInputs_0_r_valid,
  input               io_sharedInputs_0_r_ready,
  output     [31:0]   io_sharedInputs_0_r_payload_data,
  output     [3:0]    io_sharedInputs_0_r_payload_id,
  output     [1:0]    io_sharedInputs_0_r_payload_resp,
  output              io_sharedInputs_0_r_payload_last,
  output              io_output_arw_valid,
  input               io_output_arw_ready,
  output     [19:0]   io_output_arw_payload_addr,
  output     [3:0]    io_output_arw_payload_id,
  output     [7:0]    io_output_arw_payload_len,
  output     [2:0]    io_output_arw_payload_size,
  output     [1:0]    io_output_arw_payload_burst,
  output              io_output_arw_payload_write,
  output              io_output_w_valid,
  input               io_output_w_ready,
  output     [31:0]   io_output_w_payload_data,
  output     [3:0]    io_output_w_payload_strb,
  output              io_output_w_payload_last,
  input               io_output_b_valid,
  output              io_output_b_ready,
  input      [3:0]    io_output_b_payload_id,
  input      [1:0]    io_output_b_payload_resp,
  input               io_output_r_valid,
  output              io_output_r_ready,
  input      [31:0]   io_output_r_payload_data,
  input      [3:0]    io_output_r_payload_id,
  input      [1:0]    io_output_r_payload_resp,
  input               io_output_r_payload_last,
  input               axiClk,
  input               resetCtrl_axiReset
);

  reg                 cmdArbiter_io_output_fork_io_outputs_1_ready;
  wire                cmdArbiter_io_output_fork_io_outputs_1_thrown_translated_fifo_io_pop_ready;
  wire                cmdArbiter_io_inputs_0_ready;
  wire                cmdArbiter_io_output_valid;
  wire       [19:0]   cmdArbiter_io_output_payload_addr;
  wire       [3:0]    cmdArbiter_io_output_payload_id;
  wire       [7:0]    cmdArbiter_io_output_payload_len;
  wire       [2:0]    cmdArbiter_io_output_payload_size;
  wire       [1:0]    cmdArbiter_io_output_payload_burst;
  wire                cmdArbiter_io_output_payload_write;
  wire       [0:0]    cmdArbiter_io_chosenOH;
  wire                cmdArbiter_io_output_fork_io_input_ready;
  wire                cmdArbiter_io_output_fork_io_outputs_0_valid;
  wire       [19:0]   cmdArbiter_io_output_fork_io_outputs_0_payload_addr;
  wire       [3:0]    cmdArbiter_io_output_fork_io_outputs_0_payload_id;
  wire       [7:0]    cmdArbiter_io_output_fork_io_outputs_0_payload_len;
  wire       [2:0]    cmdArbiter_io_output_fork_io_outputs_0_payload_size;
  wire       [1:0]    cmdArbiter_io_output_fork_io_outputs_0_payload_burst;
  wire                cmdArbiter_io_output_fork_io_outputs_0_payload_write;
  wire                cmdArbiter_io_output_fork_io_outputs_1_valid;
  wire       [19:0]   cmdArbiter_io_output_fork_io_outputs_1_payload_addr;
  wire       [3:0]    cmdArbiter_io_output_fork_io_outputs_1_payload_id;
  wire       [7:0]    cmdArbiter_io_output_fork_io_outputs_1_payload_len;
  wire       [2:0]    cmdArbiter_io_output_fork_io_outputs_1_payload_size;
  wire       [1:0]    cmdArbiter_io_output_fork_io_outputs_1_payload_burst;
  wire                cmdArbiter_io_output_fork_io_outputs_1_payload_write;
  wire                cmdArbiter_io_output_fork_io_outputs_1_thrown_translated_fifo_io_push_ready;
  wire                cmdArbiter_io_output_fork_io_outputs_1_thrown_translated_fifo_io_pop_valid;
  wire       [2:0]    cmdArbiter_io_output_fork_io_outputs_1_thrown_translated_fifo_io_occupancy;
  wire                inputsCmd_0_valid;
  wire                inputsCmd_0_ready;
  wire       [19:0]   inputsCmd_0_payload_addr;
  wire       [3:0]    inputsCmd_0_payload_id;
  wire       [7:0]    inputsCmd_0_payload_len;
  wire       [2:0]    inputsCmd_0_payload_size;
  wire       [1:0]    inputsCmd_0_payload_burst;
  wire                inputsCmd_0_payload_write;
  wire                when_Stream_l408;
  reg                 cmdArbiter_io_output_fork_io_outputs_1_thrown_valid;
  wire                cmdArbiter_io_output_fork_io_outputs_1_thrown_ready;
  wire       [19:0]   cmdArbiter_io_output_fork_io_outputs_1_thrown_payload_addr;
  wire       [3:0]    cmdArbiter_io_output_fork_io_outputs_1_thrown_payload_id;
  wire       [7:0]    cmdArbiter_io_output_fork_io_outputs_1_thrown_payload_len;
  wire       [2:0]    cmdArbiter_io_output_fork_io_outputs_1_thrown_payload_size;
  wire       [1:0]    cmdArbiter_io_output_fork_io_outputs_1_thrown_payload_burst;
  wire                cmdArbiter_io_output_fork_io_outputs_1_thrown_payload_write;
  wire                cmdArbiter_io_output_fork_io_outputs_1_thrown_translated_valid;
  wire                cmdArbiter_io_output_fork_io_outputs_1_thrown_translated_ready;
  wire                writeLogic_routeDataInput_valid;
  wire                writeLogic_routeDataInput_ready;
  wire       [31:0]   writeLogic_routeDataInput_payload_data;
  wire       [3:0]    writeLogic_routeDataInput_payload_strb;
  wire                writeLogic_routeDataInput_payload_last;
  wire                io_output_w_fire;
  wire                writeLogic_writeRspSels_0;
  wire                readRspSels_0;

  StreamArbiter_2 cmdArbiter (
    .io_inputs_0_valid            (inputsCmd_0_valid                         ), //i
    .io_inputs_0_ready            (cmdArbiter_io_inputs_0_ready              ), //o
    .io_inputs_0_payload_addr     (inputsCmd_0_payload_addr[19:0]            ), //i
    .io_inputs_0_payload_id       (inputsCmd_0_payload_id[3:0]               ), //i
    .io_inputs_0_payload_len      (inputsCmd_0_payload_len[7:0]              ), //i
    .io_inputs_0_payload_size     (inputsCmd_0_payload_size[2:0]             ), //i
    .io_inputs_0_payload_burst    (inputsCmd_0_payload_burst[1:0]            ), //i
    .io_inputs_0_payload_write    (inputsCmd_0_payload_write                 ), //i
    .io_output_valid              (cmdArbiter_io_output_valid                ), //o
    .io_output_ready              (cmdArbiter_io_output_fork_io_input_ready  ), //i
    .io_output_payload_addr       (cmdArbiter_io_output_payload_addr[19:0]   ), //o
    .io_output_payload_id         (cmdArbiter_io_output_payload_id[3:0]      ), //o
    .io_output_payload_len        (cmdArbiter_io_output_payload_len[7:0]     ), //o
    .io_output_payload_size       (cmdArbiter_io_output_payload_size[2:0]    ), //o
    .io_output_payload_burst      (cmdArbiter_io_output_payload_burst[1:0]   ), //o
    .io_output_payload_write      (cmdArbiter_io_output_payload_write        ), //o
    .io_chosenOH                  (cmdArbiter_io_chosenOH                    ), //o
    .axiClk                       (axiClk                                    ), //i
    .resetCtrl_axiReset           (resetCtrl_axiReset                        )  //i
  );
  StreamFork_2 cmdArbiter_io_output_fork (
    .io_input_valid                (cmdArbiter_io_output_valid                                 ), //i
    .io_input_ready                (cmdArbiter_io_output_fork_io_input_ready                   ), //o
    .io_input_payload_addr         (cmdArbiter_io_output_payload_addr[19:0]                    ), //i
    .io_input_payload_id           (cmdArbiter_io_output_payload_id[3:0]                       ), //i
    .io_input_payload_len          (cmdArbiter_io_output_payload_len[7:0]                      ), //i
    .io_input_payload_size         (cmdArbiter_io_output_payload_size[2:0]                     ), //i
    .io_input_payload_burst        (cmdArbiter_io_output_payload_burst[1:0]                    ), //i
    .io_input_payload_write        (cmdArbiter_io_output_payload_write                         ), //i
    .io_outputs_0_valid            (cmdArbiter_io_output_fork_io_outputs_0_valid               ), //o
    .io_outputs_0_ready            (io_output_arw_ready                                        ), //i
    .io_outputs_0_payload_addr     (cmdArbiter_io_output_fork_io_outputs_0_payload_addr[19:0]  ), //o
    .io_outputs_0_payload_id       (cmdArbiter_io_output_fork_io_outputs_0_payload_id[3:0]     ), //o
    .io_outputs_0_payload_len      (cmdArbiter_io_output_fork_io_outputs_0_payload_len[7:0]    ), //o
    .io_outputs_0_payload_size     (cmdArbiter_io_output_fork_io_outputs_0_payload_size[2:0]   ), //o
    .io_outputs_0_payload_burst    (cmdArbiter_io_output_fork_io_outputs_0_payload_burst[1:0]  ), //o
    .io_outputs_0_payload_write    (cmdArbiter_io_output_fork_io_outputs_0_payload_write       ), //o
    .io_outputs_1_valid            (cmdArbiter_io_output_fork_io_outputs_1_valid               ), //o
    .io_outputs_1_ready            (cmdArbiter_io_output_fork_io_outputs_1_ready               ), //i
    .io_outputs_1_payload_addr     (cmdArbiter_io_output_fork_io_outputs_1_payload_addr[19:0]  ), //o
    .io_outputs_1_payload_id       (cmdArbiter_io_output_fork_io_outputs_1_payload_id[3:0]     ), //o
    .io_outputs_1_payload_len      (cmdArbiter_io_output_fork_io_outputs_1_payload_len[7:0]    ), //o
    .io_outputs_1_payload_size     (cmdArbiter_io_output_fork_io_outputs_1_payload_size[2:0]   ), //o
    .io_outputs_1_payload_burst    (cmdArbiter_io_output_fork_io_outputs_1_payload_burst[1:0]  ), //o
    .io_outputs_1_payload_write    (cmdArbiter_io_output_fork_io_outputs_1_payload_write       ), //o
    .axiClk                        (axiClk                                                     ), //i
    .resetCtrl_axiReset            (resetCtrl_axiReset                                         )  //i
  );
  StreamFifoLowLatency_1 cmdArbiter_io_output_fork_io_outputs_1_thrown_translated_fifo (
    .io_push_valid         (cmdArbiter_io_output_fork_io_outputs_1_thrown_translated_valid                   ), //i
    .io_push_ready         (cmdArbiter_io_output_fork_io_outputs_1_thrown_translated_fifo_io_push_ready      ), //o
    .io_pop_valid          (cmdArbiter_io_output_fork_io_outputs_1_thrown_translated_fifo_io_pop_valid       ), //o
    .io_pop_ready          (cmdArbiter_io_output_fork_io_outputs_1_thrown_translated_fifo_io_pop_ready       ), //i
    .io_flush              (1'b0                                                                             ), //i
    .io_occupancy          (cmdArbiter_io_output_fork_io_outputs_1_thrown_translated_fifo_io_occupancy[2:0]  ), //o
    .axiClk                (axiClk                                                                           ), //i
    .resetCtrl_axiReset    (resetCtrl_axiReset                                                               )  //i
  );
  assign inputsCmd_0_valid = io_sharedInputs_0_arw_valid;
  assign io_sharedInputs_0_arw_ready = inputsCmd_0_ready;
  assign inputsCmd_0_payload_addr = io_sharedInputs_0_arw_payload_addr;
  assign inputsCmd_0_payload_id = io_sharedInputs_0_arw_payload_id;
  assign inputsCmd_0_payload_len = io_sharedInputs_0_arw_payload_len;
  assign inputsCmd_0_payload_size = io_sharedInputs_0_arw_payload_size;
  assign inputsCmd_0_payload_burst = io_sharedInputs_0_arw_payload_burst;
  assign inputsCmd_0_payload_write = io_sharedInputs_0_arw_payload_write;
  assign inputsCmd_0_ready = cmdArbiter_io_inputs_0_ready;
  assign io_output_arw_valid = cmdArbiter_io_output_fork_io_outputs_0_valid;
  assign io_output_arw_payload_addr = cmdArbiter_io_output_fork_io_outputs_0_payload_addr;
  assign io_output_arw_payload_len = cmdArbiter_io_output_fork_io_outputs_0_payload_len;
  assign io_output_arw_payload_size = cmdArbiter_io_output_fork_io_outputs_0_payload_size;
  assign io_output_arw_payload_burst = cmdArbiter_io_output_fork_io_outputs_0_payload_burst;
  assign io_output_arw_payload_write = cmdArbiter_io_output_fork_io_outputs_0_payload_write;
  assign io_output_arw_payload_id = (cmdArbiter_io_output_fork_io_outputs_0_payload_write ? cmdArbiter_io_output_fork_io_outputs_0_payload_id : cmdArbiter_io_output_fork_io_outputs_0_payload_id);
  assign when_Stream_l408 = (! cmdArbiter_io_output_fork_io_outputs_1_payload_write);
  always @(*) begin
    cmdArbiter_io_output_fork_io_outputs_1_thrown_valid = cmdArbiter_io_output_fork_io_outputs_1_valid;
    if(when_Stream_l408) begin
      cmdArbiter_io_output_fork_io_outputs_1_thrown_valid = 1'b0;
    end
  end

  always @(*) begin
    cmdArbiter_io_output_fork_io_outputs_1_ready = cmdArbiter_io_output_fork_io_outputs_1_thrown_ready;
    if(when_Stream_l408) begin
      cmdArbiter_io_output_fork_io_outputs_1_ready = 1'b1;
    end
  end

  assign cmdArbiter_io_output_fork_io_outputs_1_thrown_payload_addr = cmdArbiter_io_output_fork_io_outputs_1_payload_addr;
  assign cmdArbiter_io_output_fork_io_outputs_1_thrown_payload_id = cmdArbiter_io_output_fork_io_outputs_1_payload_id;
  assign cmdArbiter_io_output_fork_io_outputs_1_thrown_payload_len = cmdArbiter_io_output_fork_io_outputs_1_payload_len;
  assign cmdArbiter_io_output_fork_io_outputs_1_thrown_payload_size = cmdArbiter_io_output_fork_io_outputs_1_payload_size;
  assign cmdArbiter_io_output_fork_io_outputs_1_thrown_payload_burst = cmdArbiter_io_output_fork_io_outputs_1_payload_burst;
  assign cmdArbiter_io_output_fork_io_outputs_1_thrown_payload_write = cmdArbiter_io_output_fork_io_outputs_1_payload_write;
  assign cmdArbiter_io_output_fork_io_outputs_1_thrown_translated_valid = cmdArbiter_io_output_fork_io_outputs_1_thrown_valid;
  assign cmdArbiter_io_output_fork_io_outputs_1_thrown_ready = cmdArbiter_io_output_fork_io_outputs_1_thrown_translated_ready;
  assign cmdArbiter_io_output_fork_io_outputs_1_thrown_translated_ready = cmdArbiter_io_output_fork_io_outputs_1_thrown_translated_fifo_io_push_ready;
  assign writeLogic_routeDataInput_valid = io_sharedInputs_0_w_valid;
  assign writeLogic_routeDataInput_ready = io_sharedInputs_0_w_ready;
  assign writeLogic_routeDataInput_payload_data = io_sharedInputs_0_w_payload_data;
  assign writeLogic_routeDataInput_payload_strb = io_sharedInputs_0_w_payload_strb;
  assign writeLogic_routeDataInput_payload_last = io_sharedInputs_0_w_payload_last;
  assign io_output_w_valid = (cmdArbiter_io_output_fork_io_outputs_1_thrown_translated_fifo_io_pop_valid && writeLogic_routeDataInput_valid);
  assign io_output_w_payload_data = writeLogic_routeDataInput_payload_data;
  assign io_output_w_payload_strb = writeLogic_routeDataInput_payload_strb;
  assign io_output_w_payload_last = writeLogic_routeDataInput_payload_last;
  assign io_sharedInputs_0_w_ready = ((cmdArbiter_io_output_fork_io_outputs_1_thrown_translated_fifo_io_pop_valid && io_output_w_ready) && 1'b1);
  assign io_output_w_fire = (io_output_w_valid && io_output_w_ready);
  assign cmdArbiter_io_output_fork_io_outputs_1_thrown_translated_fifo_io_pop_ready = (io_output_w_fire && io_output_w_payload_last);
  assign writeLogic_writeRspSels_0 = 1'b1;
  assign io_sharedInputs_0_b_valid = (io_output_b_valid && writeLogic_writeRspSels_0);
  assign io_sharedInputs_0_b_payload_resp = io_output_b_payload_resp;
  assign io_sharedInputs_0_b_payload_id = io_output_b_payload_id;
  assign io_output_b_ready = io_sharedInputs_0_b_ready;
  assign readRspSels_0 = 1'b1;
  assign io_sharedInputs_0_r_valid = (io_output_r_valid && readRspSels_0);
  assign io_sharedInputs_0_r_payload_data = io_output_r_payload_data;
  assign io_sharedInputs_0_r_payload_resp = io_output_r_payload_resp;
  assign io_sharedInputs_0_r_payload_last = io_output_r_payload_last;
  assign io_sharedInputs_0_r_payload_id = io_output_r_payload_id;
  assign io_output_r_ready = io_sharedInputs_0_r_ready;

endmodule

module Axi4SharedArbiter_1 (
  input               io_readInputs_0_ar_valid,
  output              io_readInputs_0_ar_ready,
  input      [14:0]   io_readInputs_0_ar_payload_addr,
  input      [2:0]    io_readInputs_0_ar_payload_id,
  input      [7:0]    io_readInputs_0_ar_payload_len,
  input      [2:0]    io_readInputs_0_ar_payload_size,
  input      [1:0]    io_readInputs_0_ar_payload_burst,
  output              io_readInputs_0_r_valid,
  input               io_readInputs_0_r_ready,
  output     [31:0]   io_readInputs_0_r_payload_data,
  output     [2:0]    io_readInputs_0_r_payload_id,
  output     [1:0]    io_readInputs_0_r_payload_resp,
  output              io_readInputs_0_r_payload_last,
  input               io_sharedInputs_0_arw_valid,
  output              io_sharedInputs_0_arw_ready,
  input      [14:0]   io_sharedInputs_0_arw_payload_addr,
  input      [2:0]    io_sharedInputs_0_arw_payload_id,
  input      [7:0]    io_sharedInputs_0_arw_payload_len,
  input      [2:0]    io_sharedInputs_0_arw_payload_size,
  input      [1:0]    io_sharedInputs_0_arw_payload_burst,
  input               io_sharedInputs_0_arw_payload_write,
  input               io_sharedInputs_0_w_valid,
  output              io_sharedInputs_0_w_ready,
  input      [31:0]   io_sharedInputs_0_w_payload_data,
  input      [3:0]    io_sharedInputs_0_w_payload_strb,
  input               io_sharedInputs_0_w_payload_last,
  output              io_sharedInputs_0_b_valid,
  input               io_sharedInputs_0_b_ready,
  output     [2:0]    io_sharedInputs_0_b_payload_id,
  output     [1:0]    io_sharedInputs_0_b_payload_resp,
  output              io_sharedInputs_0_r_valid,
  input               io_sharedInputs_0_r_ready,
  output     [31:0]   io_sharedInputs_0_r_payload_data,
  output     [2:0]    io_sharedInputs_0_r_payload_id,
  output     [1:0]    io_sharedInputs_0_r_payload_resp,
  output              io_sharedInputs_0_r_payload_last,
  output              io_output_arw_valid,
  input               io_output_arw_ready,
  output     [14:0]   io_output_arw_payload_addr,
  output     [3:0]    io_output_arw_payload_id,
  output     [7:0]    io_output_arw_payload_len,
  output     [2:0]    io_output_arw_payload_size,
  output     [1:0]    io_output_arw_payload_burst,
  output              io_output_arw_payload_write,
  output              io_output_w_valid,
  input               io_output_w_ready,
  output     [31:0]   io_output_w_payload_data,
  output     [3:0]    io_output_w_payload_strb,
  output              io_output_w_payload_last,
  input               io_output_b_valid,
  output              io_output_b_ready,
  input      [3:0]    io_output_b_payload_id,
  input      [1:0]    io_output_b_payload_resp,
  input               io_output_r_valid,
  output              io_output_r_ready,
  input      [31:0]   io_output_r_payload_data,
  input      [3:0]    io_output_r_payload_id,
  input      [1:0]    io_output_r_payload_resp,
  input               io_output_r_payload_last,
  input               axiClk,
  input               resetCtrl_axiReset
);

  reg                 cmdArbiter_io_output_fork_io_outputs_1_ready;
  wire                cmdArbiter_io_output_fork_io_outputs_1_thrown_translated_fifo_io_pop_ready;
  wire                cmdArbiter_io_inputs_0_ready;
  wire                cmdArbiter_io_inputs_1_ready;
  wire                cmdArbiter_io_output_valid;
  wire       [14:0]   cmdArbiter_io_output_payload_addr;
  wire       [2:0]    cmdArbiter_io_output_payload_id;
  wire       [7:0]    cmdArbiter_io_output_payload_len;
  wire       [2:0]    cmdArbiter_io_output_payload_size;
  wire       [1:0]    cmdArbiter_io_output_payload_burst;
  wire                cmdArbiter_io_output_payload_write;
  wire       [0:0]    cmdArbiter_io_chosen;
  wire       [1:0]    cmdArbiter_io_chosenOH;
  wire                cmdArbiter_io_output_fork_io_input_ready;
  wire                cmdArbiter_io_output_fork_io_outputs_0_valid;
  wire       [14:0]   cmdArbiter_io_output_fork_io_outputs_0_payload_addr;
  wire       [2:0]    cmdArbiter_io_output_fork_io_outputs_0_payload_id;
  wire       [7:0]    cmdArbiter_io_output_fork_io_outputs_0_payload_len;
  wire       [2:0]    cmdArbiter_io_output_fork_io_outputs_0_payload_size;
  wire       [1:0]    cmdArbiter_io_output_fork_io_outputs_0_payload_burst;
  wire                cmdArbiter_io_output_fork_io_outputs_0_payload_write;
  wire                cmdArbiter_io_output_fork_io_outputs_1_valid;
  wire       [14:0]   cmdArbiter_io_output_fork_io_outputs_1_payload_addr;
  wire       [2:0]    cmdArbiter_io_output_fork_io_outputs_1_payload_id;
  wire       [7:0]    cmdArbiter_io_output_fork_io_outputs_1_payload_len;
  wire       [2:0]    cmdArbiter_io_output_fork_io_outputs_1_payload_size;
  wire       [1:0]    cmdArbiter_io_output_fork_io_outputs_1_payload_burst;
  wire                cmdArbiter_io_output_fork_io_outputs_1_payload_write;
  wire                cmdArbiter_io_output_fork_io_outputs_1_thrown_translated_fifo_io_push_ready;
  wire                cmdArbiter_io_output_fork_io_outputs_1_thrown_translated_fifo_io_pop_valid;
  wire       [2:0]    cmdArbiter_io_output_fork_io_outputs_1_thrown_translated_fifo_io_occupancy;
  wire       [1:0]    _zz__zz_io_output_arw_payload_id;
  wire       [3:0]    _zz_io_output_arw_payload_id_1;
  wire       [2:0]    _zz_io_output_arw_payload_id_2;
  reg                 _zz_io_output_r_ready;
  wire                inputsCmd_0_valid;
  wire                inputsCmd_0_ready;
  wire       [14:0]   inputsCmd_0_payload_addr;
  wire       [2:0]    inputsCmd_0_payload_id;
  wire       [7:0]    inputsCmd_0_payload_len;
  wire       [2:0]    inputsCmd_0_payload_size;
  wire       [1:0]    inputsCmd_0_payload_burst;
  wire                inputsCmd_0_payload_write;
  wire                inputsCmd_1_valid;
  wire                inputsCmd_1_ready;
  wire       [14:0]   inputsCmd_1_payload_addr;
  wire       [2:0]    inputsCmd_1_payload_id;
  wire       [7:0]    inputsCmd_1_payload_len;
  wire       [2:0]    inputsCmd_1_payload_size;
  wire       [1:0]    inputsCmd_1_payload_burst;
  wire                inputsCmd_1_payload_write;
  wire                _zz_io_output_arw_payload_id;
  wire                when_Stream_l408;
  reg                 cmdArbiter_io_output_fork_io_outputs_1_thrown_valid;
  wire                cmdArbiter_io_output_fork_io_outputs_1_thrown_ready;
  wire       [14:0]   cmdArbiter_io_output_fork_io_outputs_1_thrown_payload_addr;
  wire       [2:0]    cmdArbiter_io_output_fork_io_outputs_1_thrown_payload_id;
  wire       [7:0]    cmdArbiter_io_output_fork_io_outputs_1_thrown_payload_len;
  wire       [2:0]    cmdArbiter_io_output_fork_io_outputs_1_thrown_payload_size;
  wire       [1:0]    cmdArbiter_io_output_fork_io_outputs_1_thrown_payload_burst;
  wire                cmdArbiter_io_output_fork_io_outputs_1_thrown_payload_write;
  wire                cmdArbiter_io_output_fork_io_outputs_1_thrown_translated_valid;
  wire                cmdArbiter_io_output_fork_io_outputs_1_thrown_translated_ready;
  wire                writeLogic_routeDataInput_valid;
  wire                writeLogic_routeDataInput_ready;
  wire       [31:0]   writeLogic_routeDataInput_payload_data;
  wire       [3:0]    writeLogic_routeDataInput_payload_strb;
  wire                writeLogic_routeDataInput_payload_last;
  wire                io_output_w_fire;
  wire                writeLogic_writeRspSels_0;
  wire       [0:0]    readRspIndex;
  wire                readRspSels_0;
  wire                readRspSels_1;

  assign _zz__zz_io_output_arw_payload_id = {cmdArbiter_io_chosenOH[1 : 1],cmdArbiter_io_chosenOH[0 : 0]};
  assign _zz_io_output_arw_payload_id_2 = cmdArbiter_io_output_fork_io_outputs_0_payload_id;
  assign _zz_io_output_arw_payload_id_1 = {1'd0, _zz_io_output_arw_payload_id_2};
  StreamArbiter_1 cmdArbiter (
    .io_inputs_0_valid            (inputsCmd_0_valid                         ), //i
    .io_inputs_0_ready            (cmdArbiter_io_inputs_0_ready              ), //o
    .io_inputs_0_payload_addr     (inputsCmd_0_payload_addr[14:0]            ), //i
    .io_inputs_0_payload_id       (inputsCmd_0_payload_id[2:0]               ), //i
    .io_inputs_0_payload_len      (inputsCmd_0_payload_len[7:0]              ), //i
    .io_inputs_0_payload_size     (inputsCmd_0_payload_size[2:0]             ), //i
    .io_inputs_0_payload_burst    (inputsCmd_0_payload_burst[1:0]            ), //i
    .io_inputs_0_payload_write    (inputsCmd_0_payload_write                 ), //i
    .io_inputs_1_valid            (inputsCmd_1_valid                         ), //i
    .io_inputs_1_ready            (cmdArbiter_io_inputs_1_ready              ), //o
    .io_inputs_1_payload_addr     (inputsCmd_1_payload_addr[14:0]            ), //i
    .io_inputs_1_payload_id       (inputsCmd_1_payload_id[2:0]               ), //i
    .io_inputs_1_payload_len      (inputsCmd_1_payload_len[7:0]              ), //i
    .io_inputs_1_payload_size     (inputsCmd_1_payload_size[2:0]             ), //i
    .io_inputs_1_payload_burst    (inputsCmd_1_payload_burst[1:0]            ), //i
    .io_inputs_1_payload_write    (inputsCmd_1_payload_write                 ), //i
    .io_output_valid              (cmdArbiter_io_output_valid                ), //o
    .io_output_ready              (cmdArbiter_io_output_fork_io_input_ready  ), //i
    .io_output_payload_addr       (cmdArbiter_io_output_payload_addr[14:0]   ), //o
    .io_output_payload_id         (cmdArbiter_io_output_payload_id[2:0]      ), //o
    .io_output_payload_len        (cmdArbiter_io_output_payload_len[7:0]     ), //o
    .io_output_payload_size       (cmdArbiter_io_output_payload_size[2:0]    ), //o
    .io_output_payload_burst      (cmdArbiter_io_output_payload_burst[1:0]   ), //o
    .io_output_payload_write      (cmdArbiter_io_output_payload_write        ), //o
    .io_chosen                    (cmdArbiter_io_chosen                      ), //o
    .io_chosenOH                  (cmdArbiter_io_chosenOH[1:0]               ), //o
    .axiClk                       (axiClk                                    ), //i
    .resetCtrl_axiReset           (resetCtrl_axiReset                        )  //i
  );
  StreamFork_1 cmdArbiter_io_output_fork (
    .io_input_valid                (cmdArbiter_io_output_valid                                 ), //i
    .io_input_ready                (cmdArbiter_io_output_fork_io_input_ready                   ), //o
    .io_input_payload_addr         (cmdArbiter_io_output_payload_addr[14:0]                    ), //i
    .io_input_payload_id           (cmdArbiter_io_output_payload_id[2:0]                       ), //i
    .io_input_payload_len          (cmdArbiter_io_output_payload_len[7:0]                      ), //i
    .io_input_payload_size         (cmdArbiter_io_output_payload_size[2:0]                     ), //i
    .io_input_payload_burst        (cmdArbiter_io_output_payload_burst[1:0]                    ), //i
    .io_input_payload_write        (cmdArbiter_io_output_payload_write                         ), //i
    .io_outputs_0_valid            (cmdArbiter_io_output_fork_io_outputs_0_valid               ), //o
    .io_outputs_0_ready            (io_output_arw_ready                                        ), //i
    .io_outputs_0_payload_addr     (cmdArbiter_io_output_fork_io_outputs_0_payload_addr[14:0]  ), //o
    .io_outputs_0_payload_id       (cmdArbiter_io_output_fork_io_outputs_0_payload_id[2:0]     ), //o
    .io_outputs_0_payload_len      (cmdArbiter_io_output_fork_io_outputs_0_payload_len[7:0]    ), //o
    .io_outputs_0_payload_size     (cmdArbiter_io_output_fork_io_outputs_0_payload_size[2:0]   ), //o
    .io_outputs_0_payload_burst    (cmdArbiter_io_output_fork_io_outputs_0_payload_burst[1:0]  ), //o
    .io_outputs_0_payload_write    (cmdArbiter_io_output_fork_io_outputs_0_payload_write       ), //o
    .io_outputs_1_valid            (cmdArbiter_io_output_fork_io_outputs_1_valid               ), //o
    .io_outputs_1_ready            (cmdArbiter_io_output_fork_io_outputs_1_ready               ), //i
    .io_outputs_1_payload_addr     (cmdArbiter_io_output_fork_io_outputs_1_payload_addr[14:0]  ), //o
    .io_outputs_1_payload_id       (cmdArbiter_io_output_fork_io_outputs_1_payload_id[2:0]     ), //o
    .io_outputs_1_payload_len      (cmdArbiter_io_output_fork_io_outputs_1_payload_len[7:0]    ), //o
    .io_outputs_1_payload_size     (cmdArbiter_io_output_fork_io_outputs_1_payload_size[2:0]   ), //o
    .io_outputs_1_payload_burst    (cmdArbiter_io_output_fork_io_outputs_1_payload_burst[1:0]  ), //o
    .io_outputs_1_payload_write    (cmdArbiter_io_output_fork_io_outputs_1_payload_write       ), //o
    .axiClk                        (axiClk                                                     ), //i
    .resetCtrl_axiReset            (resetCtrl_axiReset                                         )  //i
  );
  StreamFifoLowLatency_1 cmdArbiter_io_output_fork_io_outputs_1_thrown_translated_fifo (
    .io_push_valid         (cmdArbiter_io_output_fork_io_outputs_1_thrown_translated_valid                   ), //i
    .io_push_ready         (cmdArbiter_io_output_fork_io_outputs_1_thrown_translated_fifo_io_push_ready      ), //o
    .io_pop_valid          (cmdArbiter_io_output_fork_io_outputs_1_thrown_translated_fifo_io_pop_valid       ), //o
    .io_pop_ready          (cmdArbiter_io_output_fork_io_outputs_1_thrown_translated_fifo_io_pop_ready       ), //i
    .io_flush              (1'b0                                                                             ), //i
    .io_occupancy          (cmdArbiter_io_output_fork_io_outputs_1_thrown_translated_fifo_io_occupancy[2:0]  ), //o
    .axiClk                (axiClk                                                                           ), //i
    .resetCtrl_axiReset    (resetCtrl_axiReset                                                               )  //i
  );
  always @(*) begin
    case(readRspIndex)
      1'b0 : begin
        _zz_io_output_r_ready = io_readInputs_0_r_ready;
      end
      default : begin
        _zz_io_output_r_ready = io_sharedInputs_0_r_ready;
      end
    endcase
  end

  assign inputsCmd_0_valid = io_readInputs_0_ar_valid;
  assign io_readInputs_0_ar_ready = inputsCmd_0_ready;
  assign inputsCmd_0_payload_addr = io_readInputs_0_ar_payload_addr;
  assign inputsCmd_0_payload_id = io_readInputs_0_ar_payload_id;
  assign inputsCmd_0_payload_len = io_readInputs_0_ar_payload_len;
  assign inputsCmd_0_payload_size = io_readInputs_0_ar_payload_size;
  assign inputsCmd_0_payload_burst = io_readInputs_0_ar_payload_burst;
  assign inputsCmd_0_payload_write = 1'b0;
  assign inputsCmd_1_valid = io_sharedInputs_0_arw_valid;
  assign io_sharedInputs_0_arw_ready = inputsCmd_1_ready;
  assign inputsCmd_1_payload_addr = io_sharedInputs_0_arw_payload_addr;
  assign inputsCmd_1_payload_id = io_sharedInputs_0_arw_payload_id;
  assign inputsCmd_1_payload_len = io_sharedInputs_0_arw_payload_len;
  assign inputsCmd_1_payload_size = io_sharedInputs_0_arw_payload_size;
  assign inputsCmd_1_payload_burst = io_sharedInputs_0_arw_payload_burst;
  assign inputsCmd_1_payload_write = io_sharedInputs_0_arw_payload_write;
  assign inputsCmd_0_ready = cmdArbiter_io_inputs_0_ready;
  assign inputsCmd_1_ready = cmdArbiter_io_inputs_1_ready;
  assign io_output_arw_valid = cmdArbiter_io_output_fork_io_outputs_0_valid;
  assign io_output_arw_payload_addr = cmdArbiter_io_output_fork_io_outputs_0_payload_addr;
  assign io_output_arw_payload_len = cmdArbiter_io_output_fork_io_outputs_0_payload_len;
  assign io_output_arw_payload_size = cmdArbiter_io_output_fork_io_outputs_0_payload_size;
  assign io_output_arw_payload_burst = cmdArbiter_io_output_fork_io_outputs_0_payload_burst;
  assign io_output_arw_payload_write = cmdArbiter_io_output_fork_io_outputs_0_payload_write;
  assign _zz_io_output_arw_payload_id = _zz__zz_io_output_arw_payload_id[1];
  assign io_output_arw_payload_id = (cmdArbiter_io_output_fork_io_outputs_0_payload_write ? _zz_io_output_arw_payload_id_1 : {_zz_io_output_arw_payload_id,cmdArbiter_io_output_fork_io_outputs_0_payload_id});
  assign when_Stream_l408 = (! cmdArbiter_io_output_fork_io_outputs_1_payload_write);
  always @(*) begin
    cmdArbiter_io_output_fork_io_outputs_1_thrown_valid = cmdArbiter_io_output_fork_io_outputs_1_valid;
    if(when_Stream_l408) begin
      cmdArbiter_io_output_fork_io_outputs_1_thrown_valid = 1'b0;
    end
  end

  always @(*) begin
    cmdArbiter_io_output_fork_io_outputs_1_ready = cmdArbiter_io_output_fork_io_outputs_1_thrown_ready;
    if(when_Stream_l408) begin
      cmdArbiter_io_output_fork_io_outputs_1_ready = 1'b1;
    end
  end

  assign cmdArbiter_io_output_fork_io_outputs_1_thrown_payload_addr = cmdArbiter_io_output_fork_io_outputs_1_payload_addr;
  assign cmdArbiter_io_output_fork_io_outputs_1_thrown_payload_id = cmdArbiter_io_output_fork_io_outputs_1_payload_id;
  assign cmdArbiter_io_output_fork_io_outputs_1_thrown_payload_len = cmdArbiter_io_output_fork_io_outputs_1_payload_len;
  assign cmdArbiter_io_output_fork_io_outputs_1_thrown_payload_size = cmdArbiter_io_output_fork_io_outputs_1_payload_size;
  assign cmdArbiter_io_output_fork_io_outputs_1_thrown_payload_burst = cmdArbiter_io_output_fork_io_outputs_1_payload_burst;
  assign cmdArbiter_io_output_fork_io_outputs_1_thrown_payload_write = cmdArbiter_io_output_fork_io_outputs_1_payload_write;
  assign cmdArbiter_io_output_fork_io_outputs_1_thrown_translated_valid = cmdArbiter_io_output_fork_io_outputs_1_thrown_valid;
  assign cmdArbiter_io_output_fork_io_outputs_1_thrown_ready = cmdArbiter_io_output_fork_io_outputs_1_thrown_translated_ready;
  assign cmdArbiter_io_output_fork_io_outputs_1_thrown_translated_ready = cmdArbiter_io_output_fork_io_outputs_1_thrown_translated_fifo_io_push_ready;
  assign writeLogic_routeDataInput_valid = io_sharedInputs_0_w_valid;
  assign writeLogic_routeDataInput_ready = io_sharedInputs_0_w_ready;
  assign writeLogic_routeDataInput_payload_data = io_sharedInputs_0_w_payload_data;
  assign writeLogic_routeDataInput_payload_strb = io_sharedInputs_0_w_payload_strb;
  assign writeLogic_routeDataInput_payload_last = io_sharedInputs_0_w_payload_last;
  assign io_output_w_valid = (cmdArbiter_io_output_fork_io_outputs_1_thrown_translated_fifo_io_pop_valid && writeLogic_routeDataInput_valid);
  assign io_output_w_payload_data = writeLogic_routeDataInput_payload_data;
  assign io_output_w_payload_strb = writeLogic_routeDataInput_payload_strb;
  assign io_output_w_payload_last = writeLogic_routeDataInput_payload_last;
  assign io_sharedInputs_0_w_ready = ((cmdArbiter_io_output_fork_io_outputs_1_thrown_translated_fifo_io_pop_valid && io_output_w_ready) && 1'b1);
  assign io_output_w_fire = (io_output_w_valid && io_output_w_ready);
  assign cmdArbiter_io_output_fork_io_outputs_1_thrown_translated_fifo_io_pop_ready = (io_output_w_fire && io_output_w_payload_last);
  assign writeLogic_writeRspSels_0 = 1'b1;
  assign io_sharedInputs_0_b_valid = (io_output_b_valid && writeLogic_writeRspSels_0);
  assign io_sharedInputs_0_b_payload_resp = io_output_b_payload_resp;
  assign io_sharedInputs_0_b_payload_id = io_output_b_payload_id[2:0];
  assign io_output_b_ready = io_sharedInputs_0_b_ready;
  assign readRspIndex = io_output_r_payload_id[3 : 3];
  assign readRspSels_0 = (readRspIndex == 1'b0);
  assign readRspSels_1 = (readRspIndex == 1'b1);
  assign io_readInputs_0_r_valid = (io_output_r_valid && readRspSels_0);
  assign io_readInputs_0_r_payload_data = io_output_r_payload_data;
  assign io_readInputs_0_r_payload_resp = io_output_r_payload_resp;
  assign io_readInputs_0_r_payload_last = io_output_r_payload_last;
  assign io_readInputs_0_r_payload_id = io_output_r_payload_id[2:0];
  assign io_sharedInputs_0_r_valid = (io_output_r_valid && readRspSels_1);
  assign io_sharedInputs_0_r_payload_data = io_output_r_payload_data;
  assign io_sharedInputs_0_r_payload_resp = io_output_r_payload_resp;
  assign io_sharedInputs_0_r_payload_last = io_output_r_payload_last;
  assign io_sharedInputs_0_r_payload_id = io_output_r_payload_id[2:0];
  assign io_output_r_ready = _zz_io_output_r_ready;

endmodule

module Axi4SharedArbiter (
  input               io_readInputs_0_ar_valid,
  output              io_readInputs_0_ar_ready,
  input      [22:0]   io_readInputs_0_ar_payload_addr,
  input      [1:0]    io_readInputs_0_ar_payload_id,
  input      [7:0]    io_readInputs_0_ar_payload_len,
  input      [2:0]    io_readInputs_0_ar_payload_size,
  input      [1:0]    io_readInputs_0_ar_payload_burst,
  output              io_readInputs_0_r_valid,
  input               io_readInputs_0_r_ready,
  output     [31:0]   io_readInputs_0_r_payload_data,
  output     [1:0]    io_readInputs_0_r_payload_id,
  output     [1:0]    io_readInputs_0_r_payload_resp,
  output              io_readInputs_0_r_payload_last,
  input               io_readInputs_1_ar_valid,
  output              io_readInputs_1_ar_ready,
  input      [22:0]   io_readInputs_1_ar_payload_addr,
  input      [1:0]    io_readInputs_1_ar_payload_id,
  input      [7:0]    io_readInputs_1_ar_payload_len,
  input      [2:0]    io_readInputs_1_ar_payload_size,
  input      [1:0]    io_readInputs_1_ar_payload_burst,
  output              io_readInputs_1_r_valid,
  input               io_readInputs_1_r_ready,
  output     [31:0]   io_readInputs_1_r_payload_data,
  output     [1:0]    io_readInputs_1_r_payload_id,
  output     [1:0]    io_readInputs_1_r_payload_resp,
  output              io_readInputs_1_r_payload_last,
  input               io_sharedInputs_0_arw_valid,
  output              io_sharedInputs_0_arw_ready,
  input      [22:0]   io_sharedInputs_0_arw_payload_addr,
  input      [1:0]    io_sharedInputs_0_arw_payload_id,
  input      [7:0]    io_sharedInputs_0_arw_payload_len,
  input      [2:0]    io_sharedInputs_0_arw_payload_size,
  input      [1:0]    io_sharedInputs_0_arw_payload_burst,
  input               io_sharedInputs_0_arw_payload_write,
  input               io_sharedInputs_0_w_valid,
  output              io_sharedInputs_0_w_ready,
  input      [31:0]   io_sharedInputs_0_w_payload_data,
  input      [3:0]    io_sharedInputs_0_w_payload_strb,
  input               io_sharedInputs_0_w_payload_last,
  output              io_sharedInputs_0_b_valid,
  input               io_sharedInputs_0_b_ready,
  output     [1:0]    io_sharedInputs_0_b_payload_id,
  output     [1:0]    io_sharedInputs_0_b_payload_resp,
  output              io_sharedInputs_0_r_valid,
  input               io_sharedInputs_0_r_ready,
  output     [31:0]   io_sharedInputs_0_r_payload_data,
  output     [1:0]    io_sharedInputs_0_r_payload_id,
  output     [1:0]    io_sharedInputs_0_r_payload_resp,
  output              io_sharedInputs_0_r_payload_last,
  output              io_output_arw_valid,
  input               io_output_arw_ready,
  output     [22:0]   io_output_arw_payload_addr,
  output     [3:0]    io_output_arw_payload_id,
  output     [7:0]    io_output_arw_payload_len,
  output     [2:0]    io_output_arw_payload_size,
  output     [1:0]    io_output_arw_payload_burst,
  output              io_output_arw_payload_write,
  output              io_output_w_valid,
  input               io_output_w_ready,
  output     [31:0]   io_output_w_payload_data,
  output     [3:0]    io_output_w_payload_strb,
  output              io_output_w_payload_last,
  input               io_output_b_valid,
  output              io_output_b_ready,
  input      [3:0]    io_output_b_payload_id,
  input      [1:0]    io_output_b_payload_resp,
  input               io_output_r_valid,
  output              io_output_r_ready,
  input      [31:0]   io_output_r_payload_data,
  input      [3:0]    io_output_r_payload_id,
  input      [1:0]    io_output_r_payload_resp,
  input               io_output_r_payload_last,
  input               axiClk,
  input               resetCtrl_axiReset
);

  reg                 cmdArbiter_io_output_fork_io_outputs_1_ready;
  wire                cmdArbiter_io_output_fork_io_outputs_1_thrown_translated_fifo_io_pop_ready;
  wire                cmdArbiter_io_inputs_0_ready;
  wire                cmdArbiter_io_inputs_1_ready;
  wire                cmdArbiter_io_inputs_2_ready;
  wire                cmdArbiter_io_output_valid;
  wire       [22:0]   cmdArbiter_io_output_payload_addr;
  wire       [1:0]    cmdArbiter_io_output_payload_id;
  wire       [7:0]    cmdArbiter_io_output_payload_len;
  wire       [2:0]    cmdArbiter_io_output_payload_size;
  wire       [1:0]    cmdArbiter_io_output_payload_burst;
  wire                cmdArbiter_io_output_payload_write;
  wire       [1:0]    cmdArbiter_io_chosen;
  wire       [2:0]    cmdArbiter_io_chosenOH;
  wire                cmdArbiter_io_output_fork_io_input_ready;
  wire                cmdArbiter_io_output_fork_io_outputs_0_valid;
  wire       [22:0]   cmdArbiter_io_output_fork_io_outputs_0_payload_addr;
  wire       [1:0]    cmdArbiter_io_output_fork_io_outputs_0_payload_id;
  wire       [7:0]    cmdArbiter_io_output_fork_io_outputs_0_payload_len;
  wire       [2:0]    cmdArbiter_io_output_fork_io_outputs_0_payload_size;
  wire       [1:0]    cmdArbiter_io_output_fork_io_outputs_0_payload_burst;
  wire                cmdArbiter_io_output_fork_io_outputs_0_payload_write;
  wire                cmdArbiter_io_output_fork_io_outputs_1_valid;
  wire       [22:0]   cmdArbiter_io_output_fork_io_outputs_1_payload_addr;
  wire       [1:0]    cmdArbiter_io_output_fork_io_outputs_1_payload_id;
  wire       [7:0]    cmdArbiter_io_output_fork_io_outputs_1_payload_len;
  wire       [2:0]    cmdArbiter_io_output_fork_io_outputs_1_payload_size;
  wire       [1:0]    cmdArbiter_io_output_fork_io_outputs_1_payload_burst;
  wire                cmdArbiter_io_output_fork_io_outputs_1_payload_write;
  wire                cmdArbiter_io_output_fork_io_outputs_1_thrown_translated_fifo_io_push_ready;
  wire                cmdArbiter_io_output_fork_io_outputs_1_thrown_translated_fifo_io_pop_valid;
  wire       [2:0]    cmdArbiter_io_output_fork_io_outputs_1_thrown_translated_fifo_io_occupancy;
  wire       [3:0]    _zz_io_output_arw_payload_id_3;
  wire       [1:0]    _zz_io_output_arw_payload_id_4;
  reg                 _zz_io_output_r_ready;
  wire                inputsCmd_0_valid;
  wire                inputsCmd_0_ready;
  wire       [22:0]   inputsCmd_0_payload_addr;
  wire       [1:0]    inputsCmd_0_payload_id;
  wire       [7:0]    inputsCmd_0_payload_len;
  wire       [2:0]    inputsCmd_0_payload_size;
  wire       [1:0]    inputsCmd_0_payload_burst;
  wire                inputsCmd_0_payload_write;
  wire                inputsCmd_1_valid;
  wire                inputsCmd_1_ready;
  wire       [22:0]   inputsCmd_1_payload_addr;
  wire       [1:0]    inputsCmd_1_payload_id;
  wire       [7:0]    inputsCmd_1_payload_len;
  wire       [2:0]    inputsCmd_1_payload_size;
  wire       [1:0]    inputsCmd_1_payload_burst;
  wire                inputsCmd_1_payload_write;
  wire                inputsCmd_2_valid;
  wire                inputsCmd_2_ready;
  wire       [22:0]   inputsCmd_2_payload_addr;
  wire       [1:0]    inputsCmd_2_payload_id;
  wire       [7:0]    inputsCmd_2_payload_len;
  wire       [2:0]    inputsCmd_2_payload_size;
  wire       [1:0]    inputsCmd_2_payload_burst;
  wire                inputsCmd_2_payload_write;
  wire       [2:0]    _zz_io_output_arw_payload_id;
  wire                _zz_io_output_arw_payload_id_1;
  wire                _zz_io_output_arw_payload_id_2;
  wire                when_Stream_l408;
  reg                 cmdArbiter_io_output_fork_io_outputs_1_thrown_valid;
  wire                cmdArbiter_io_output_fork_io_outputs_1_thrown_ready;
  wire       [22:0]   cmdArbiter_io_output_fork_io_outputs_1_thrown_payload_addr;
  wire       [1:0]    cmdArbiter_io_output_fork_io_outputs_1_thrown_payload_id;
  wire       [7:0]    cmdArbiter_io_output_fork_io_outputs_1_thrown_payload_len;
  wire       [2:0]    cmdArbiter_io_output_fork_io_outputs_1_thrown_payload_size;
  wire       [1:0]    cmdArbiter_io_output_fork_io_outputs_1_thrown_payload_burst;
  wire                cmdArbiter_io_output_fork_io_outputs_1_thrown_payload_write;
  wire                cmdArbiter_io_output_fork_io_outputs_1_thrown_translated_valid;
  wire                cmdArbiter_io_output_fork_io_outputs_1_thrown_translated_ready;
  wire                writeLogic_routeDataInput_valid;
  wire                writeLogic_routeDataInput_ready;
  wire       [31:0]   writeLogic_routeDataInput_payload_data;
  wire       [3:0]    writeLogic_routeDataInput_payload_strb;
  wire                writeLogic_routeDataInput_payload_last;
  wire                io_output_w_fire;
  wire                writeLogic_writeRspSels_0;
  wire       [1:0]    readRspIndex;
  wire                readRspSels_0;
  wire                readRspSels_1;
  wire                readRspSels_2;

  assign _zz_io_output_arw_payload_id_4 = cmdArbiter_io_output_fork_io_outputs_0_payload_id;
  assign _zz_io_output_arw_payload_id_3 = {2'd0, _zz_io_output_arw_payload_id_4};
  StreamArbiter cmdArbiter (
    .io_inputs_0_valid            (inputsCmd_0_valid                         ), //i
    .io_inputs_0_ready            (cmdArbiter_io_inputs_0_ready              ), //o
    .io_inputs_0_payload_addr     (inputsCmd_0_payload_addr[22:0]            ), //i
    .io_inputs_0_payload_id       (inputsCmd_0_payload_id[1:0]               ), //i
    .io_inputs_0_payload_len      (inputsCmd_0_payload_len[7:0]              ), //i
    .io_inputs_0_payload_size     (inputsCmd_0_payload_size[2:0]             ), //i
    .io_inputs_0_payload_burst    (inputsCmd_0_payload_burst[1:0]            ), //i
    .io_inputs_0_payload_write    (inputsCmd_0_payload_write                 ), //i
    .io_inputs_1_valid            (inputsCmd_1_valid                         ), //i
    .io_inputs_1_ready            (cmdArbiter_io_inputs_1_ready              ), //o
    .io_inputs_1_payload_addr     (inputsCmd_1_payload_addr[22:0]            ), //i
    .io_inputs_1_payload_id       (inputsCmd_1_payload_id[1:0]               ), //i
    .io_inputs_1_payload_len      (inputsCmd_1_payload_len[7:0]              ), //i
    .io_inputs_1_payload_size     (inputsCmd_1_payload_size[2:0]             ), //i
    .io_inputs_1_payload_burst    (inputsCmd_1_payload_burst[1:0]            ), //i
    .io_inputs_1_payload_write    (inputsCmd_1_payload_write                 ), //i
    .io_inputs_2_valid            (inputsCmd_2_valid                         ), //i
    .io_inputs_2_ready            (cmdArbiter_io_inputs_2_ready              ), //o
    .io_inputs_2_payload_addr     (inputsCmd_2_payload_addr[22:0]            ), //i
    .io_inputs_2_payload_id       (inputsCmd_2_payload_id[1:0]               ), //i
    .io_inputs_2_payload_len      (inputsCmd_2_payload_len[7:0]              ), //i
    .io_inputs_2_payload_size     (inputsCmd_2_payload_size[2:0]             ), //i
    .io_inputs_2_payload_burst    (inputsCmd_2_payload_burst[1:0]            ), //i
    .io_inputs_2_payload_write    (inputsCmd_2_payload_write                 ), //i
    .io_output_valid              (cmdArbiter_io_output_valid                ), //o
    .io_output_ready              (cmdArbiter_io_output_fork_io_input_ready  ), //i
    .io_output_payload_addr       (cmdArbiter_io_output_payload_addr[22:0]   ), //o
    .io_output_payload_id         (cmdArbiter_io_output_payload_id[1:0]      ), //o
    .io_output_payload_len        (cmdArbiter_io_output_payload_len[7:0]     ), //o
    .io_output_payload_size       (cmdArbiter_io_output_payload_size[2:0]    ), //o
    .io_output_payload_burst      (cmdArbiter_io_output_payload_burst[1:0]   ), //o
    .io_output_payload_write      (cmdArbiter_io_output_payload_write        ), //o
    .io_chosen                    (cmdArbiter_io_chosen[1:0]                 ), //o
    .io_chosenOH                  (cmdArbiter_io_chosenOH[2:0]               ), //o
    .axiClk                       (axiClk                                    ), //i
    .resetCtrl_axiReset           (resetCtrl_axiReset                        )  //i
  );
  StreamFork cmdArbiter_io_output_fork (
    .io_input_valid                (cmdArbiter_io_output_valid                                 ), //i
    .io_input_ready                (cmdArbiter_io_output_fork_io_input_ready                   ), //o
    .io_input_payload_addr         (cmdArbiter_io_output_payload_addr[22:0]                    ), //i
    .io_input_payload_id           (cmdArbiter_io_output_payload_id[1:0]                       ), //i
    .io_input_payload_len          (cmdArbiter_io_output_payload_len[7:0]                      ), //i
    .io_input_payload_size         (cmdArbiter_io_output_payload_size[2:0]                     ), //i
    .io_input_payload_burst        (cmdArbiter_io_output_payload_burst[1:0]                    ), //i
    .io_input_payload_write        (cmdArbiter_io_output_payload_write                         ), //i
    .io_outputs_0_valid            (cmdArbiter_io_output_fork_io_outputs_0_valid               ), //o
    .io_outputs_0_ready            (io_output_arw_ready                                        ), //i
    .io_outputs_0_payload_addr     (cmdArbiter_io_output_fork_io_outputs_0_payload_addr[22:0]  ), //o
    .io_outputs_0_payload_id       (cmdArbiter_io_output_fork_io_outputs_0_payload_id[1:0]     ), //o
    .io_outputs_0_payload_len      (cmdArbiter_io_output_fork_io_outputs_0_payload_len[7:0]    ), //o
    .io_outputs_0_payload_size     (cmdArbiter_io_output_fork_io_outputs_0_payload_size[2:0]   ), //o
    .io_outputs_0_payload_burst    (cmdArbiter_io_output_fork_io_outputs_0_payload_burst[1:0]  ), //o
    .io_outputs_0_payload_write    (cmdArbiter_io_output_fork_io_outputs_0_payload_write       ), //o
    .io_outputs_1_valid            (cmdArbiter_io_output_fork_io_outputs_1_valid               ), //o
    .io_outputs_1_ready            (cmdArbiter_io_output_fork_io_outputs_1_ready               ), //i
    .io_outputs_1_payload_addr     (cmdArbiter_io_output_fork_io_outputs_1_payload_addr[22:0]  ), //o
    .io_outputs_1_payload_id       (cmdArbiter_io_output_fork_io_outputs_1_payload_id[1:0]     ), //o
    .io_outputs_1_payload_len      (cmdArbiter_io_output_fork_io_outputs_1_payload_len[7:0]    ), //o
    .io_outputs_1_payload_size     (cmdArbiter_io_output_fork_io_outputs_1_payload_size[2:0]   ), //o
    .io_outputs_1_payload_burst    (cmdArbiter_io_output_fork_io_outputs_1_payload_burst[1:0]  ), //o
    .io_outputs_1_payload_write    (cmdArbiter_io_output_fork_io_outputs_1_payload_write       ), //o
    .axiClk                        (axiClk                                                     ), //i
    .resetCtrl_axiReset            (resetCtrl_axiReset                                         )  //i
  );
  StreamFifoLowLatency_1 cmdArbiter_io_output_fork_io_outputs_1_thrown_translated_fifo (
    .io_push_valid         (cmdArbiter_io_output_fork_io_outputs_1_thrown_translated_valid                   ), //i
    .io_push_ready         (cmdArbiter_io_output_fork_io_outputs_1_thrown_translated_fifo_io_push_ready      ), //o
    .io_pop_valid          (cmdArbiter_io_output_fork_io_outputs_1_thrown_translated_fifo_io_pop_valid       ), //o
    .io_pop_ready          (cmdArbiter_io_output_fork_io_outputs_1_thrown_translated_fifo_io_pop_ready       ), //i
    .io_flush              (1'b0                                                                             ), //i
    .io_occupancy          (cmdArbiter_io_output_fork_io_outputs_1_thrown_translated_fifo_io_occupancy[2:0]  ), //o
    .axiClk                (axiClk                                                                           ), //i
    .resetCtrl_axiReset    (resetCtrl_axiReset                                                               )  //i
  );
  always @(*) begin
    case(readRspIndex)
      2'b00 : begin
        _zz_io_output_r_ready = io_readInputs_0_r_ready;
      end
      2'b01 : begin
        _zz_io_output_r_ready = io_readInputs_1_r_ready;
      end
      default : begin
        _zz_io_output_r_ready = io_sharedInputs_0_r_ready;
      end
    endcase
  end

  assign inputsCmd_0_valid = io_readInputs_0_ar_valid;
  assign io_readInputs_0_ar_ready = inputsCmd_0_ready;
  assign inputsCmd_0_payload_addr = io_readInputs_0_ar_payload_addr;
  assign inputsCmd_0_payload_id = io_readInputs_0_ar_payload_id;
  assign inputsCmd_0_payload_len = io_readInputs_0_ar_payload_len;
  assign inputsCmd_0_payload_size = io_readInputs_0_ar_payload_size;
  assign inputsCmd_0_payload_burst = io_readInputs_0_ar_payload_burst;
  assign inputsCmd_0_payload_write = 1'b0;
  assign inputsCmd_1_valid = io_readInputs_1_ar_valid;
  assign io_readInputs_1_ar_ready = inputsCmd_1_ready;
  assign inputsCmd_1_payload_addr = io_readInputs_1_ar_payload_addr;
  assign inputsCmd_1_payload_id = io_readInputs_1_ar_payload_id;
  assign inputsCmd_1_payload_len = io_readInputs_1_ar_payload_len;
  assign inputsCmd_1_payload_size = io_readInputs_1_ar_payload_size;
  assign inputsCmd_1_payload_burst = io_readInputs_1_ar_payload_burst;
  assign inputsCmd_1_payload_write = 1'b0;
  assign inputsCmd_2_valid = io_sharedInputs_0_arw_valid;
  assign io_sharedInputs_0_arw_ready = inputsCmd_2_ready;
  assign inputsCmd_2_payload_addr = io_sharedInputs_0_arw_payload_addr;
  assign inputsCmd_2_payload_id = io_sharedInputs_0_arw_payload_id;
  assign inputsCmd_2_payload_len = io_sharedInputs_0_arw_payload_len;
  assign inputsCmd_2_payload_size = io_sharedInputs_0_arw_payload_size;
  assign inputsCmd_2_payload_burst = io_sharedInputs_0_arw_payload_burst;
  assign inputsCmd_2_payload_write = io_sharedInputs_0_arw_payload_write;
  assign inputsCmd_0_ready = cmdArbiter_io_inputs_0_ready;
  assign inputsCmd_1_ready = cmdArbiter_io_inputs_1_ready;
  assign inputsCmd_2_ready = cmdArbiter_io_inputs_2_ready;
  assign io_output_arw_valid = cmdArbiter_io_output_fork_io_outputs_0_valid;
  assign io_output_arw_payload_addr = cmdArbiter_io_output_fork_io_outputs_0_payload_addr;
  assign io_output_arw_payload_len = cmdArbiter_io_output_fork_io_outputs_0_payload_len;
  assign io_output_arw_payload_size = cmdArbiter_io_output_fork_io_outputs_0_payload_size;
  assign io_output_arw_payload_burst = cmdArbiter_io_output_fork_io_outputs_0_payload_burst;
  assign io_output_arw_payload_write = cmdArbiter_io_output_fork_io_outputs_0_payload_write;
  assign _zz_io_output_arw_payload_id = {cmdArbiter_io_chosenOH[2 : 2],cmdArbiter_io_chosenOH[1 : 0]};
  assign _zz_io_output_arw_payload_id_1 = _zz_io_output_arw_payload_id[1];
  assign _zz_io_output_arw_payload_id_2 = _zz_io_output_arw_payload_id[2];
  assign io_output_arw_payload_id = (cmdArbiter_io_output_fork_io_outputs_0_payload_write ? _zz_io_output_arw_payload_id_3 : {{_zz_io_output_arw_payload_id_2,_zz_io_output_arw_payload_id_1},cmdArbiter_io_output_fork_io_outputs_0_payload_id});
  assign when_Stream_l408 = (! cmdArbiter_io_output_fork_io_outputs_1_payload_write);
  always @(*) begin
    cmdArbiter_io_output_fork_io_outputs_1_thrown_valid = cmdArbiter_io_output_fork_io_outputs_1_valid;
    if(when_Stream_l408) begin
      cmdArbiter_io_output_fork_io_outputs_1_thrown_valid = 1'b0;
    end
  end

  always @(*) begin
    cmdArbiter_io_output_fork_io_outputs_1_ready = cmdArbiter_io_output_fork_io_outputs_1_thrown_ready;
    if(when_Stream_l408) begin
      cmdArbiter_io_output_fork_io_outputs_1_ready = 1'b1;
    end
  end

  assign cmdArbiter_io_output_fork_io_outputs_1_thrown_payload_addr = cmdArbiter_io_output_fork_io_outputs_1_payload_addr;
  assign cmdArbiter_io_output_fork_io_outputs_1_thrown_payload_id = cmdArbiter_io_output_fork_io_outputs_1_payload_id;
  assign cmdArbiter_io_output_fork_io_outputs_1_thrown_payload_len = cmdArbiter_io_output_fork_io_outputs_1_payload_len;
  assign cmdArbiter_io_output_fork_io_outputs_1_thrown_payload_size = cmdArbiter_io_output_fork_io_outputs_1_payload_size;
  assign cmdArbiter_io_output_fork_io_outputs_1_thrown_payload_burst = cmdArbiter_io_output_fork_io_outputs_1_payload_burst;
  assign cmdArbiter_io_output_fork_io_outputs_1_thrown_payload_write = cmdArbiter_io_output_fork_io_outputs_1_payload_write;
  assign cmdArbiter_io_output_fork_io_outputs_1_thrown_translated_valid = cmdArbiter_io_output_fork_io_outputs_1_thrown_valid;
  assign cmdArbiter_io_output_fork_io_outputs_1_thrown_ready = cmdArbiter_io_output_fork_io_outputs_1_thrown_translated_ready;
  assign cmdArbiter_io_output_fork_io_outputs_1_thrown_translated_ready = cmdArbiter_io_output_fork_io_outputs_1_thrown_translated_fifo_io_push_ready;
  assign writeLogic_routeDataInput_valid = io_sharedInputs_0_w_valid;
  assign writeLogic_routeDataInput_ready = io_sharedInputs_0_w_ready;
  assign writeLogic_routeDataInput_payload_data = io_sharedInputs_0_w_payload_data;
  assign writeLogic_routeDataInput_payload_strb = io_sharedInputs_0_w_payload_strb;
  assign writeLogic_routeDataInput_payload_last = io_sharedInputs_0_w_payload_last;
  assign io_output_w_valid = (cmdArbiter_io_output_fork_io_outputs_1_thrown_translated_fifo_io_pop_valid && writeLogic_routeDataInput_valid);
  assign io_output_w_payload_data = writeLogic_routeDataInput_payload_data;
  assign io_output_w_payload_strb = writeLogic_routeDataInput_payload_strb;
  assign io_output_w_payload_last = writeLogic_routeDataInput_payload_last;
  assign io_sharedInputs_0_w_ready = ((cmdArbiter_io_output_fork_io_outputs_1_thrown_translated_fifo_io_pop_valid && io_output_w_ready) && 1'b1);
  assign io_output_w_fire = (io_output_w_valid && io_output_w_ready);
  assign cmdArbiter_io_output_fork_io_outputs_1_thrown_translated_fifo_io_pop_ready = (io_output_w_fire && io_output_w_payload_last);
  assign writeLogic_writeRspSels_0 = 1'b1;
  assign io_sharedInputs_0_b_valid = (io_output_b_valid && writeLogic_writeRspSels_0);
  assign io_sharedInputs_0_b_payload_resp = io_output_b_payload_resp;
  assign io_sharedInputs_0_b_payload_id = io_output_b_payload_id[1:0];
  assign io_output_b_ready = io_sharedInputs_0_b_ready;
  assign readRspIndex = io_output_r_payload_id[3 : 2];
  assign readRspSels_0 = (readRspIndex == 2'b00);
  assign readRspSels_1 = (readRspIndex == 2'b01);
  assign readRspSels_2 = (readRspIndex == 2'b10);
  assign io_readInputs_0_r_valid = (io_output_r_valid && readRspSels_0);
  assign io_readInputs_0_r_payload_data = io_output_r_payload_data;
  assign io_readInputs_0_r_payload_resp = io_output_r_payload_resp;
  assign io_readInputs_0_r_payload_last = io_output_r_payload_last;
  assign io_readInputs_0_r_payload_id = io_output_r_payload_id[1:0];
  assign io_readInputs_1_r_valid = (io_output_r_valid && readRspSels_1);
  assign io_readInputs_1_r_payload_data = io_output_r_payload_data;
  assign io_readInputs_1_r_payload_resp = io_output_r_payload_resp;
  assign io_readInputs_1_r_payload_last = io_output_r_payload_last;
  assign io_readInputs_1_r_payload_id = io_output_r_payload_id[1:0];
  assign io_sharedInputs_0_r_valid = (io_output_r_valid && readRspSels_2);
  assign io_sharedInputs_0_r_payload_data = io_output_r_payload_data;
  assign io_sharedInputs_0_r_payload_resp = io_output_r_payload_resp;
  assign io_sharedInputs_0_r_payload_last = io_output_r_payload_last;
  assign io_sharedInputs_0_r_payload_id = io_output_r_payload_id[1:0];
  assign io_output_r_ready = _zz_io_output_r_ready;

endmodule

module Axi4ReadOnlyDecoder_1 (
  input               io_input_ar_valid,
  output              io_input_ar_ready,
  input      [31:0]   io_input_ar_payload_addr,
  input      [7:0]    io_input_ar_payload_len,
  input      [2:0]    io_input_ar_payload_size,
  input      [3:0]    io_input_ar_payload_cache,
  input      [2:0]    io_input_ar_payload_prot,
  output reg          io_input_r_valid,
  input               io_input_r_ready,
  output     [31:0]   io_input_r_payload_data,
  output reg          io_input_r_payload_last,
  output              io_outputs_0_ar_valid,
  input               io_outputs_0_ar_ready,
  output     [31:0]   io_outputs_0_ar_payload_addr,
  output     [7:0]    io_outputs_0_ar_payload_len,
  output     [2:0]    io_outputs_0_ar_payload_size,
  output     [3:0]    io_outputs_0_ar_payload_cache,
  output     [2:0]    io_outputs_0_ar_payload_prot,
  input               io_outputs_0_r_valid,
  output              io_outputs_0_r_ready,
  input      [31:0]   io_outputs_0_r_payload_data,
  input               io_outputs_0_r_payload_last,
  input               axiClk,
  input               resetCtrl_axiReset
);

  wire                errorSlave_io_axi_ar_valid;
  wire                errorSlave_io_axi_ar_ready;
  wire                errorSlave_io_axi_r_valid;
  wire       [31:0]   errorSlave_io_axi_r_payload_data;
  wire                errorSlave_io_axi_r_payload_last;
  wire                io_input_ar_fire;
  wire                io_input_r_fire;
  wire                when_Utils_l597;
  reg                 pendingCmdCounter_incrementIt;
  reg                 pendingCmdCounter_decrementIt;
  wire       [2:0]    pendingCmdCounter_valueNext;
  reg        [2:0]    pendingCmdCounter_value;
  wire                pendingCmdCounter_willOverflowIfInc;
  wire                pendingCmdCounter_willOverflow;
  reg        [2:0]    pendingCmdCounter_finalIncrement;
  wire                when_Utils_l622;
  wire                when_Utils_l624;
  wire       [0:0]    decodedCmdSels;
  wire                decodedCmdError;
  reg        [0:0]    pendingSels;
  reg                 pendingError;
  wire                allowCmd;

  Axi4ReadOnlyErrorSlave_1 errorSlave (
    .io_axi_ar_valid            (errorSlave_io_axi_ar_valid              ), //i
    .io_axi_ar_ready            (errorSlave_io_axi_ar_ready              ), //o
    .io_axi_ar_payload_addr     (io_input_ar_payload_addr[31:0]          ), //i
    .io_axi_ar_payload_len      (io_input_ar_payload_len[7:0]            ), //i
    .io_axi_ar_payload_size     (io_input_ar_payload_size[2:0]           ), //i
    .io_axi_ar_payload_cache    (io_input_ar_payload_cache[3:0]          ), //i
    .io_axi_ar_payload_prot     (io_input_ar_payload_prot[2:0]           ), //i
    .io_axi_r_valid             (errorSlave_io_axi_r_valid               ), //o
    .io_axi_r_ready             (io_input_r_ready                        ), //i
    .io_axi_r_payload_data      (errorSlave_io_axi_r_payload_data[31:0]  ), //o
    .io_axi_r_payload_last      (errorSlave_io_axi_r_payload_last        ), //o
    .axiClk                     (axiClk                                  ), //i
    .resetCtrl_axiReset         (resetCtrl_axiReset                      )  //i
  );
  assign io_input_ar_fire = (io_input_ar_valid && io_input_ar_ready);
  assign io_input_r_fire = (io_input_r_valid && io_input_r_ready);
  assign when_Utils_l597 = (io_input_r_fire && io_input_r_payload_last);
  always @(*) begin
    pendingCmdCounter_incrementIt = 1'b0;
    if(io_input_ar_fire) begin
      pendingCmdCounter_incrementIt = 1'b1;
    end
  end

  always @(*) begin
    pendingCmdCounter_decrementIt = 1'b0;
    if(when_Utils_l597) begin
      pendingCmdCounter_decrementIt = 1'b1;
    end
  end

  assign pendingCmdCounter_willOverflowIfInc = ((pendingCmdCounter_value == 3'b111) && (! pendingCmdCounter_decrementIt));
  assign pendingCmdCounter_willOverflow = (pendingCmdCounter_willOverflowIfInc && pendingCmdCounter_incrementIt);
  assign when_Utils_l622 = (pendingCmdCounter_incrementIt && (! pendingCmdCounter_decrementIt));
  always @(*) begin
    if(when_Utils_l622) begin
      pendingCmdCounter_finalIncrement = 3'b001;
    end else begin
      if(when_Utils_l624) begin
        pendingCmdCounter_finalIncrement = 3'b111;
      end else begin
        pendingCmdCounter_finalIncrement = 3'b000;
      end
    end
  end

  assign when_Utils_l624 = ((! pendingCmdCounter_incrementIt) && pendingCmdCounter_decrementIt);
  assign pendingCmdCounter_valueNext = (pendingCmdCounter_value + pendingCmdCounter_finalIncrement);
  assign decodedCmdSels = (((io_input_ar_payload_addr & (~ 32'h007fffff)) == 32'h40000000) && io_input_ar_valid);
  assign decodedCmdError = (decodedCmdSels == 1'b0);
  assign allowCmd = ((pendingCmdCounter_value == 3'b000) || ((pendingCmdCounter_value != 3'b111) && (pendingSels == decodedCmdSels)));
  assign io_input_ar_ready = (((|(decodedCmdSels & io_outputs_0_ar_ready)) || (decodedCmdError && errorSlave_io_axi_ar_ready)) && allowCmd);
  assign errorSlave_io_axi_ar_valid = ((io_input_ar_valid && decodedCmdError) && allowCmd);
  assign io_outputs_0_ar_valid = ((io_input_ar_valid && decodedCmdSels[0]) && allowCmd);
  assign io_outputs_0_ar_payload_addr = io_input_ar_payload_addr;
  assign io_outputs_0_ar_payload_len = io_input_ar_payload_len;
  assign io_outputs_0_ar_payload_size = io_input_ar_payload_size;
  assign io_outputs_0_ar_payload_cache = io_input_ar_payload_cache;
  assign io_outputs_0_ar_payload_prot = io_input_ar_payload_prot;
  always @(*) begin
    io_input_r_valid = (|io_outputs_0_r_valid);
    if(errorSlave_io_axi_r_valid) begin
      io_input_r_valid = 1'b1;
    end
  end

  assign io_input_r_payload_data = io_outputs_0_r_payload_data;
  always @(*) begin
    io_input_r_payload_last = io_outputs_0_r_payload_last;
    if(pendingError) begin
      io_input_r_payload_last = errorSlave_io_axi_r_payload_last;
    end
  end

  assign io_outputs_0_r_ready = io_input_r_ready;
  always @(posedge axiClk or posedge resetCtrl_axiReset) begin
    if(resetCtrl_axiReset) begin
      pendingCmdCounter_value <= 3'b000;
      pendingSels <= 1'b0;
      pendingError <= 1'b0;
    end else begin
      pendingCmdCounter_value <= pendingCmdCounter_valueNext;
      if(io_input_ar_ready) begin
        pendingSels <= decodedCmdSels;
      end
      if(io_input_ar_ready) begin
        pendingError <= decodedCmdError;
      end
    end
  end


endmodule

module Axi4SharedDecoder (
  input               io_input_arw_valid,
  output              io_input_arw_ready,
  input      [31:0]   io_input_arw_payload_addr,
  input      [7:0]    io_input_arw_payload_len,
  input      [2:0]    io_input_arw_payload_size,
  input      [3:0]    io_input_arw_payload_cache,
  input      [2:0]    io_input_arw_payload_prot,
  input               io_input_arw_payload_write,
  input               io_input_w_valid,
  output              io_input_w_ready,
  input      [31:0]   io_input_w_payload_data,
  input      [3:0]    io_input_w_payload_strb,
  input               io_input_w_payload_last,
  output              io_input_b_valid,
  input               io_input_b_ready,
  output reg [1:0]    io_input_b_payload_resp,
  output              io_input_r_valid,
  input               io_input_r_ready,
  output     [31:0]   io_input_r_payload_data,
  output reg [1:0]    io_input_r_payload_resp,
  output reg          io_input_r_payload_last,
  output              io_sharedOutputs_0_arw_valid,
  input               io_sharedOutputs_0_arw_ready,
  output     [31:0]   io_sharedOutputs_0_arw_payload_addr,
  output     [7:0]    io_sharedOutputs_0_arw_payload_len,
  output     [2:0]    io_sharedOutputs_0_arw_payload_size,
  output     [3:0]    io_sharedOutputs_0_arw_payload_cache,
  output     [2:0]    io_sharedOutputs_0_arw_payload_prot,
  output              io_sharedOutputs_0_arw_payload_write,
  output              io_sharedOutputs_0_w_valid,
  input               io_sharedOutputs_0_w_ready,
  output     [31:0]   io_sharedOutputs_0_w_payload_data,
  output     [3:0]    io_sharedOutputs_0_w_payload_strb,
  output              io_sharedOutputs_0_w_payload_last,
  input               io_sharedOutputs_0_b_valid,
  output              io_sharedOutputs_0_b_ready,
  input      [1:0]    io_sharedOutputs_0_b_payload_resp,
  input               io_sharedOutputs_0_r_valid,
  output              io_sharedOutputs_0_r_ready,
  input      [31:0]   io_sharedOutputs_0_r_payload_data,
  input      [1:0]    io_sharedOutputs_0_r_payload_resp,
  input               io_sharedOutputs_0_r_payload_last,
  output              io_sharedOutputs_1_arw_valid,
  input               io_sharedOutputs_1_arw_ready,
  output     [31:0]   io_sharedOutputs_1_arw_payload_addr,
  output     [7:0]    io_sharedOutputs_1_arw_payload_len,
  output     [2:0]    io_sharedOutputs_1_arw_payload_size,
  output     [3:0]    io_sharedOutputs_1_arw_payload_cache,
  output     [2:0]    io_sharedOutputs_1_arw_payload_prot,
  output              io_sharedOutputs_1_arw_payload_write,
  output              io_sharedOutputs_1_w_valid,
  input               io_sharedOutputs_1_w_ready,
  output     [31:0]   io_sharedOutputs_1_w_payload_data,
  output     [3:0]    io_sharedOutputs_1_w_payload_strb,
  output              io_sharedOutputs_1_w_payload_last,
  input               io_sharedOutputs_1_b_valid,
  output              io_sharedOutputs_1_b_ready,
  input      [1:0]    io_sharedOutputs_1_b_payload_resp,
  input               io_sharedOutputs_1_r_valid,
  output              io_sharedOutputs_1_r_ready,
  input      [31:0]   io_sharedOutputs_1_r_payload_data,
  input      [1:0]    io_sharedOutputs_1_r_payload_resp,
  input               io_sharedOutputs_1_r_payload_last,
  output              io_sharedOutputs_2_arw_valid,
  input               io_sharedOutputs_2_arw_ready,
  output     [31:0]   io_sharedOutputs_2_arw_payload_addr,
  output     [7:0]    io_sharedOutputs_2_arw_payload_len,
  output     [2:0]    io_sharedOutputs_2_arw_payload_size,
  output     [3:0]    io_sharedOutputs_2_arw_payload_cache,
  output     [2:0]    io_sharedOutputs_2_arw_payload_prot,
  output              io_sharedOutputs_2_arw_payload_write,
  output              io_sharedOutputs_2_w_valid,
  input               io_sharedOutputs_2_w_ready,
  output     [31:0]   io_sharedOutputs_2_w_payload_data,
  output     [3:0]    io_sharedOutputs_2_w_payload_strb,
  output              io_sharedOutputs_2_w_payload_last,
  input               io_sharedOutputs_2_b_valid,
  output              io_sharedOutputs_2_b_ready,
  input      [1:0]    io_sharedOutputs_2_b_payload_resp,
  input               io_sharedOutputs_2_r_valid,
  output              io_sharedOutputs_2_r_ready,
  input      [31:0]   io_sharedOutputs_2_r_payload_data,
  input      [1:0]    io_sharedOutputs_2_r_payload_resp,
  input               io_sharedOutputs_2_r_payload_last,
  input               axiClk,
  input               resetCtrl_axiReset
);

  wire                errorSlave_io_axi_arw_valid;
  wire                errorSlave_io_axi_w_valid;
  wire                errorSlave_io_axi_arw_ready;
  wire                errorSlave_io_axi_w_ready;
  wire                errorSlave_io_axi_b_valid;
  wire       [1:0]    errorSlave_io_axi_b_payload_resp;
  wire                errorSlave_io_axi_r_valid;
  wire       [31:0]   errorSlave_io_axi_r_payload_data;
  wire       [1:0]    errorSlave_io_axi_r_payload_resp;
  wire                errorSlave_io_axi_r_payload_last;
  reg        [1:0]    _zz_io_input_b_payload_resp;
  reg        [31:0]   _zz_io_input_r_payload_data;
  reg        [1:0]    _zz_io_input_r_payload_resp;
  reg                 _zz_io_input_r_payload_last;
  reg        [2:0]    _zz_pendingCmdCounter;
  reg        [2:0]    _zz_pendingCmdCounter_1;
  reg        [2:0]    _zz_pendingCmdCounter_2;
  wire                cmdAllowedStart;
  wire                io_input_arw_fire;
  wire                io_input_b_fire;
  wire                io_input_r_fire;
  wire                when_Utils_l648;
  reg        [2:0]    pendingCmdCounter;
  wire       [2:0]    _zz_pendingCmdCounter_3;
  wire                when_Utils_l594;
  wire                io_input_w_fire;
  wire                when_Utils_l597;
  reg                 pendingDataCounter_incrementIt;
  reg                 pendingDataCounter_decrementIt;
  wire       [2:0]    pendingDataCounter_valueNext;
  reg        [2:0]    pendingDataCounter_value;
  wire                pendingDataCounter_willOverflowIfInc;
  wire                pendingDataCounter_willOverflow;
  reg        [2:0]    pendingDataCounter_finalIncrement;
  wire                when_Utils_l622;
  wire                when_Utils_l624;
  wire       [2:0]    decodedCmdSels;
  wire                decodedCmdError;
  reg        [2:0]    pendingSels;
  reg                 pendingError;
  wire                allowCmd;
  wire                allowData;
  reg                 _zz_cmdAllowedStart;
  wire       [2:0]    _zz_io_sharedOutputs_0_arw_valid;
  wire       [2:0]    _zz_io_sharedOutputs_0_w_valid;
  wire       [2:0]    _zz_writeRspIndex;
  wire                _zz_writeRspIndex_1;
  wire                _zz_writeRspIndex_2;
  wire       [1:0]    writeRspIndex;
  wire       [2:0]    _zz_readRspIndex;
  wire                _zz_readRspIndex_1;
  wire                _zz_readRspIndex_2;
  wire       [1:0]    readRspIndex;

  Axi4SharedErrorSlave errorSlave (
    .io_axi_arw_valid            (errorSlave_io_axi_arw_valid             ), //i
    .io_axi_arw_ready            (errorSlave_io_axi_arw_ready             ), //o
    .io_axi_arw_payload_addr     (io_input_arw_payload_addr[31:0]         ), //i
    .io_axi_arw_payload_len      (io_input_arw_payload_len[7:0]           ), //i
    .io_axi_arw_payload_size     (io_input_arw_payload_size[2:0]          ), //i
    .io_axi_arw_payload_cache    (io_input_arw_payload_cache[3:0]         ), //i
    .io_axi_arw_payload_prot     (io_input_arw_payload_prot[2:0]          ), //i
    .io_axi_arw_payload_write    (io_input_arw_payload_write              ), //i
    .io_axi_w_valid              (errorSlave_io_axi_w_valid               ), //i
    .io_axi_w_ready              (errorSlave_io_axi_w_ready               ), //o
    .io_axi_w_payload_data       (io_input_w_payload_data[31:0]           ), //i
    .io_axi_w_payload_strb       (io_input_w_payload_strb[3:0]            ), //i
    .io_axi_w_payload_last       (io_input_w_payload_last                 ), //i
    .io_axi_b_valid              (errorSlave_io_axi_b_valid               ), //o
    .io_axi_b_ready              (io_input_b_ready                        ), //i
    .io_axi_b_payload_resp       (errorSlave_io_axi_b_payload_resp[1:0]   ), //o
    .io_axi_r_valid              (errorSlave_io_axi_r_valid               ), //o
    .io_axi_r_ready              (io_input_r_ready                        ), //i
    .io_axi_r_payload_data       (errorSlave_io_axi_r_payload_data[31:0]  ), //o
    .io_axi_r_payload_resp       (errorSlave_io_axi_r_payload_resp[1:0]   ), //o
    .io_axi_r_payload_last       (errorSlave_io_axi_r_payload_last        ), //o
    .axiClk                      (axiClk                                  ), //i
    .resetCtrl_axiReset          (resetCtrl_axiReset                      )  //i
  );
  always @(*) begin
    case(writeRspIndex)
      2'b00 : begin
        _zz_io_input_b_payload_resp = io_sharedOutputs_0_b_payload_resp;
      end
      2'b01 : begin
        _zz_io_input_b_payload_resp = io_sharedOutputs_1_b_payload_resp;
      end
      default : begin
        _zz_io_input_b_payload_resp = io_sharedOutputs_2_b_payload_resp;
      end
    endcase
  end

  always @(*) begin
    case(readRspIndex)
      2'b00 : begin
        _zz_io_input_r_payload_data = io_sharedOutputs_0_r_payload_data;
        _zz_io_input_r_payload_resp = io_sharedOutputs_0_r_payload_resp;
        _zz_io_input_r_payload_last = io_sharedOutputs_0_r_payload_last;
      end
      2'b01 : begin
        _zz_io_input_r_payload_data = io_sharedOutputs_1_r_payload_data;
        _zz_io_input_r_payload_resp = io_sharedOutputs_1_r_payload_resp;
        _zz_io_input_r_payload_last = io_sharedOutputs_1_r_payload_last;
      end
      default : begin
        _zz_io_input_r_payload_data = io_sharedOutputs_2_r_payload_data;
        _zz_io_input_r_payload_resp = io_sharedOutputs_2_r_payload_resp;
        _zz_io_input_r_payload_last = io_sharedOutputs_2_r_payload_last;
      end
    endcase
  end

  always @(*) begin
    _zz_pendingCmdCounter = _zz_pendingCmdCounter_1;
    if(when_Utils_l648) begin
      _zz_pendingCmdCounter = (_zz_pendingCmdCounter_1 - 3'b001);
    end
  end

  always @(*) begin
    _zz_pendingCmdCounter_1 = _zz_pendingCmdCounter_2;
    if(io_input_b_fire) begin
      _zz_pendingCmdCounter_1 = (_zz_pendingCmdCounter_2 - 3'b001);
    end
  end

  always @(*) begin
    _zz_pendingCmdCounter_2 = _zz_pendingCmdCounter_3;
    if(io_input_arw_fire) begin
      _zz_pendingCmdCounter_2 = (_zz_pendingCmdCounter_3 + 3'b001);
    end
  end

  assign io_input_arw_fire = (io_input_arw_valid && io_input_arw_ready);
  assign io_input_b_fire = (io_input_b_valid && io_input_b_ready);
  assign io_input_r_fire = (io_input_r_valid && io_input_r_ready);
  assign when_Utils_l648 = (io_input_r_fire && io_input_r_payload_last);
  assign _zz_pendingCmdCounter_3 = pendingCmdCounter;
  assign when_Utils_l594 = (cmdAllowedStart && io_input_arw_payload_write);
  assign io_input_w_fire = (io_input_w_valid && io_input_w_ready);
  assign when_Utils_l597 = (io_input_w_fire && io_input_w_payload_last);
  always @(*) begin
    pendingDataCounter_incrementIt = 1'b0;
    if(when_Utils_l594) begin
      pendingDataCounter_incrementIt = 1'b1;
    end
  end

  always @(*) begin
    pendingDataCounter_decrementIt = 1'b0;
    if(when_Utils_l597) begin
      pendingDataCounter_decrementIt = 1'b1;
    end
  end

  assign pendingDataCounter_willOverflowIfInc = ((pendingDataCounter_value == 3'b111) && (! pendingDataCounter_decrementIt));
  assign pendingDataCounter_willOverflow = (pendingDataCounter_willOverflowIfInc && pendingDataCounter_incrementIt);
  assign when_Utils_l622 = (pendingDataCounter_incrementIt && (! pendingDataCounter_decrementIt));
  always @(*) begin
    if(when_Utils_l622) begin
      pendingDataCounter_finalIncrement = 3'b001;
    end else begin
      if(when_Utils_l624) begin
        pendingDataCounter_finalIncrement = 3'b111;
      end else begin
        pendingDataCounter_finalIncrement = 3'b000;
      end
    end
  end

  assign when_Utils_l624 = ((! pendingDataCounter_incrementIt) && pendingDataCounter_decrementIt);
  assign pendingDataCounter_valueNext = (pendingDataCounter_value + pendingDataCounter_finalIncrement);
  assign decodedCmdSels = {((io_input_arw_payload_addr & (~ 32'h000fffff)) == 32'hf0000000),{((io_input_arw_payload_addr & (~ 32'h007fffff)) == 32'h40000000),((io_input_arw_payload_addr & (~ 32'h00007fff)) == 32'h80000000)}};
  assign decodedCmdError = (decodedCmdSels == 3'b000);
  assign allowCmd = ((pendingCmdCounter == 3'b000) || ((pendingCmdCounter != 3'b111) && (pendingSels == decodedCmdSels)));
  assign allowData = (pendingDataCounter_value != 3'b000);
  assign cmdAllowedStart = ((io_input_arw_valid && allowCmd) && _zz_cmdAllowedStart);
  assign io_input_arw_ready = (((|(decodedCmdSels & {io_sharedOutputs_2_arw_ready,{io_sharedOutputs_1_arw_ready,io_sharedOutputs_0_arw_ready}})) || (decodedCmdError && errorSlave_io_axi_arw_ready)) && allowCmd);
  assign errorSlave_io_axi_arw_valid = ((io_input_arw_valid && decodedCmdError) && allowCmd);
  assign _zz_io_sharedOutputs_0_arw_valid = decodedCmdSels[2 : 0];
  assign io_sharedOutputs_0_arw_valid = ((io_input_arw_valid && _zz_io_sharedOutputs_0_arw_valid[0]) && allowCmd);
  assign io_sharedOutputs_0_arw_payload_addr = io_input_arw_payload_addr;
  assign io_sharedOutputs_0_arw_payload_len = io_input_arw_payload_len;
  assign io_sharedOutputs_0_arw_payload_size = io_input_arw_payload_size;
  assign io_sharedOutputs_0_arw_payload_cache = io_input_arw_payload_cache;
  assign io_sharedOutputs_0_arw_payload_prot = io_input_arw_payload_prot;
  assign io_sharedOutputs_0_arw_payload_write = io_input_arw_payload_write;
  assign io_sharedOutputs_1_arw_valid = ((io_input_arw_valid && _zz_io_sharedOutputs_0_arw_valid[1]) && allowCmd);
  assign io_sharedOutputs_1_arw_payload_addr = io_input_arw_payload_addr;
  assign io_sharedOutputs_1_arw_payload_len = io_input_arw_payload_len;
  assign io_sharedOutputs_1_arw_payload_size = io_input_arw_payload_size;
  assign io_sharedOutputs_1_arw_payload_cache = io_input_arw_payload_cache;
  assign io_sharedOutputs_1_arw_payload_prot = io_input_arw_payload_prot;
  assign io_sharedOutputs_1_arw_payload_write = io_input_arw_payload_write;
  assign io_sharedOutputs_2_arw_valid = ((io_input_arw_valid && _zz_io_sharedOutputs_0_arw_valid[2]) && allowCmd);
  assign io_sharedOutputs_2_arw_payload_addr = io_input_arw_payload_addr;
  assign io_sharedOutputs_2_arw_payload_len = io_input_arw_payload_len;
  assign io_sharedOutputs_2_arw_payload_size = io_input_arw_payload_size;
  assign io_sharedOutputs_2_arw_payload_cache = io_input_arw_payload_cache;
  assign io_sharedOutputs_2_arw_payload_prot = io_input_arw_payload_prot;
  assign io_sharedOutputs_2_arw_payload_write = io_input_arw_payload_write;
  assign io_input_w_ready = (((|(pendingSels[2 : 0] & {io_sharedOutputs_2_w_ready,{io_sharedOutputs_1_w_ready,io_sharedOutputs_0_w_ready}})) || (pendingError && errorSlave_io_axi_w_ready)) && allowData);
  assign errorSlave_io_axi_w_valid = ((io_input_w_valid && pendingError) && allowData);
  assign _zz_io_sharedOutputs_0_w_valid = pendingSels[2 : 0];
  assign io_sharedOutputs_0_w_valid = ((io_input_w_valid && _zz_io_sharedOutputs_0_w_valid[0]) && allowData);
  assign io_sharedOutputs_0_w_payload_data = io_input_w_payload_data;
  assign io_sharedOutputs_0_w_payload_strb = io_input_w_payload_strb;
  assign io_sharedOutputs_0_w_payload_last = io_input_w_payload_last;
  assign io_sharedOutputs_1_w_valid = ((io_input_w_valid && _zz_io_sharedOutputs_0_w_valid[1]) && allowData);
  assign io_sharedOutputs_1_w_payload_data = io_input_w_payload_data;
  assign io_sharedOutputs_1_w_payload_strb = io_input_w_payload_strb;
  assign io_sharedOutputs_1_w_payload_last = io_input_w_payload_last;
  assign io_sharedOutputs_2_w_valid = ((io_input_w_valid && _zz_io_sharedOutputs_0_w_valid[2]) && allowData);
  assign io_sharedOutputs_2_w_payload_data = io_input_w_payload_data;
  assign io_sharedOutputs_2_w_payload_strb = io_input_w_payload_strb;
  assign io_sharedOutputs_2_w_payload_last = io_input_w_payload_last;
  assign _zz_writeRspIndex = pendingSels[2 : 0];
  assign _zz_writeRspIndex_1 = _zz_writeRspIndex[1];
  assign _zz_writeRspIndex_2 = _zz_writeRspIndex[2];
  assign writeRspIndex = {_zz_writeRspIndex_2,_zz_writeRspIndex_1};
  assign io_input_b_valid = ((|{io_sharedOutputs_2_b_valid,{io_sharedOutputs_1_b_valid,io_sharedOutputs_0_b_valid}}) || errorSlave_io_axi_b_valid);
  always @(*) begin
    io_input_b_payload_resp = _zz_io_input_b_payload_resp;
    if(pendingError) begin
      io_input_b_payload_resp = errorSlave_io_axi_b_payload_resp;
    end
  end

  assign io_sharedOutputs_0_b_ready = io_input_b_ready;
  assign io_sharedOutputs_1_b_ready = io_input_b_ready;
  assign io_sharedOutputs_2_b_ready = io_input_b_ready;
  assign _zz_readRspIndex = pendingSels[2 : 0];
  assign _zz_readRspIndex_1 = _zz_readRspIndex[1];
  assign _zz_readRspIndex_2 = _zz_readRspIndex[2];
  assign readRspIndex = {_zz_readRspIndex_2,_zz_readRspIndex_1};
  assign io_input_r_valid = ((|{io_sharedOutputs_2_r_valid,{io_sharedOutputs_1_r_valid,io_sharedOutputs_0_r_valid}}) || errorSlave_io_axi_r_valid);
  assign io_input_r_payload_data = _zz_io_input_r_payload_data;
  always @(*) begin
    io_input_r_payload_resp = _zz_io_input_r_payload_resp;
    if(pendingError) begin
      io_input_r_payload_resp = errorSlave_io_axi_r_payload_resp;
    end
  end

  always @(*) begin
    io_input_r_payload_last = _zz_io_input_r_payload_last;
    if(pendingError) begin
      io_input_r_payload_last = errorSlave_io_axi_r_payload_last;
    end
  end

  assign io_sharedOutputs_0_r_ready = io_input_r_ready;
  assign io_sharedOutputs_1_r_ready = io_input_r_ready;
  assign io_sharedOutputs_2_r_ready = io_input_r_ready;
  always @(posedge axiClk or posedge resetCtrl_axiReset) begin
    if(resetCtrl_axiReset) begin
      pendingCmdCounter <= 3'b000;
      pendingDataCounter_value <= 3'b000;
      pendingSels <= 3'b000;
      pendingError <= 1'b0;
      _zz_cmdAllowedStart <= 1'b1;
    end else begin
      pendingCmdCounter <= _zz_pendingCmdCounter;
      pendingDataCounter_value <= pendingDataCounter_valueNext;
      if(cmdAllowedStart) begin
        pendingSels <= decodedCmdSels;
      end
      if(cmdAllowedStart) begin
        pendingError <= decodedCmdError;
      end
      if(cmdAllowedStart) begin
        _zz_cmdAllowedStart <= 1'b0;
      end
      if(io_input_arw_ready) begin
        _zz_cmdAllowedStart <= 1'b1;
      end
    end
  end


endmodule

module Axi4ReadOnlyDecoder (
  input               io_input_ar_valid,
  output              io_input_ar_ready,
  input      [31:0]   io_input_ar_payload_addr,
  input      [7:0]    io_input_ar_payload_len,
  input      [1:0]    io_input_ar_payload_burst,
  input      [3:0]    io_input_ar_payload_cache,
  input      [2:0]    io_input_ar_payload_prot,
  output reg          io_input_r_valid,
  input               io_input_r_ready,
  output     [31:0]   io_input_r_payload_data,
  output reg [1:0]    io_input_r_payload_resp,
  output reg          io_input_r_payload_last,
  output              io_outputs_0_ar_valid,
  input               io_outputs_0_ar_ready,
  output     [31:0]   io_outputs_0_ar_payload_addr,
  output     [7:0]    io_outputs_0_ar_payload_len,
  output     [1:0]    io_outputs_0_ar_payload_burst,
  output     [3:0]    io_outputs_0_ar_payload_cache,
  output     [2:0]    io_outputs_0_ar_payload_prot,
  input               io_outputs_0_r_valid,
  output              io_outputs_0_r_ready,
  input      [31:0]   io_outputs_0_r_payload_data,
  input      [1:0]    io_outputs_0_r_payload_resp,
  input               io_outputs_0_r_payload_last,
  output              io_outputs_1_ar_valid,
  input               io_outputs_1_ar_ready,
  output     [31:0]   io_outputs_1_ar_payload_addr,
  output     [7:0]    io_outputs_1_ar_payload_len,
  output     [1:0]    io_outputs_1_ar_payload_burst,
  output     [3:0]    io_outputs_1_ar_payload_cache,
  output     [2:0]    io_outputs_1_ar_payload_prot,
  input               io_outputs_1_r_valid,
  output              io_outputs_1_r_ready,
  input      [31:0]   io_outputs_1_r_payload_data,
  input      [1:0]    io_outputs_1_r_payload_resp,
  input               io_outputs_1_r_payload_last,
  input               axiClk,
  input               resetCtrl_axiReset
);

  wire                errorSlave_io_axi_ar_valid;
  wire                errorSlave_io_axi_ar_ready;
  wire                errorSlave_io_axi_r_valid;
  wire       [31:0]   errorSlave_io_axi_r_payload_data;
  wire       [1:0]    errorSlave_io_axi_r_payload_resp;
  wire                errorSlave_io_axi_r_payload_last;
  wire                io_input_ar_fire;
  wire                io_input_r_fire;
  wire                when_Utils_l597;
  reg                 pendingCmdCounter_incrementIt;
  reg                 pendingCmdCounter_decrementIt;
  wire       [2:0]    pendingCmdCounter_valueNext;
  reg        [2:0]    pendingCmdCounter_value;
  wire                pendingCmdCounter_willOverflowIfInc;
  wire                pendingCmdCounter_willOverflow;
  reg        [2:0]    pendingCmdCounter_finalIncrement;
  wire                when_Utils_l622;
  wire                when_Utils_l624;
  wire       [1:0]    decodedCmdSels;
  wire                decodedCmdError;
  reg        [1:0]    pendingSels;
  reg                 pendingError;
  wire                allowCmd;
  wire                _zz_io_input_r_payload_data;
  wire                _zz_readRspIndex;
  wire       [0:0]    readRspIndex;

  Axi4ReadOnlyErrorSlave errorSlave (
    .io_axi_ar_valid            (errorSlave_io_axi_ar_valid              ), //i
    .io_axi_ar_ready            (errorSlave_io_axi_ar_ready              ), //o
    .io_axi_ar_payload_addr     (io_input_ar_payload_addr[31:0]          ), //i
    .io_axi_ar_payload_len      (io_input_ar_payload_len[7:0]            ), //i
    .io_axi_ar_payload_burst    (io_input_ar_payload_burst[1:0]          ), //i
    .io_axi_ar_payload_cache    (io_input_ar_payload_cache[3:0]          ), //i
    .io_axi_ar_payload_prot     (io_input_ar_payload_prot[2:0]           ), //i
    .io_axi_r_valid             (errorSlave_io_axi_r_valid               ), //o
    .io_axi_r_ready             (io_input_r_ready                        ), //i
    .io_axi_r_payload_data      (errorSlave_io_axi_r_payload_data[31:0]  ), //o
    .io_axi_r_payload_resp      (errorSlave_io_axi_r_payload_resp[1:0]   ), //o
    .io_axi_r_payload_last      (errorSlave_io_axi_r_payload_last        ), //o
    .axiClk                     (axiClk                                  ), //i
    .resetCtrl_axiReset         (resetCtrl_axiReset                      )  //i
  );
  assign io_input_ar_fire = (io_input_ar_valid && io_input_ar_ready);
  assign io_input_r_fire = (io_input_r_valid && io_input_r_ready);
  assign when_Utils_l597 = (io_input_r_fire && io_input_r_payload_last);
  always @(*) begin
    pendingCmdCounter_incrementIt = 1'b0;
    if(io_input_ar_fire) begin
      pendingCmdCounter_incrementIt = 1'b1;
    end
  end

  always @(*) begin
    pendingCmdCounter_decrementIt = 1'b0;
    if(when_Utils_l597) begin
      pendingCmdCounter_decrementIt = 1'b1;
    end
  end

  assign pendingCmdCounter_willOverflowIfInc = ((pendingCmdCounter_value == 3'b111) && (! pendingCmdCounter_decrementIt));
  assign pendingCmdCounter_willOverflow = (pendingCmdCounter_willOverflowIfInc && pendingCmdCounter_incrementIt);
  assign when_Utils_l622 = (pendingCmdCounter_incrementIt && (! pendingCmdCounter_decrementIt));
  always @(*) begin
    if(when_Utils_l622) begin
      pendingCmdCounter_finalIncrement = 3'b001;
    end else begin
      if(when_Utils_l624) begin
        pendingCmdCounter_finalIncrement = 3'b111;
      end else begin
        pendingCmdCounter_finalIncrement = 3'b000;
      end
    end
  end

  assign when_Utils_l624 = ((! pendingCmdCounter_incrementIt) && pendingCmdCounter_decrementIt);
  assign pendingCmdCounter_valueNext = (pendingCmdCounter_value + pendingCmdCounter_finalIncrement);
  assign decodedCmdSels = {(((io_input_ar_payload_addr & (~ 32'h007fffff)) == 32'h40000000) && io_input_ar_valid),(((io_input_ar_payload_addr & (~ 32'h00007fff)) == 32'h80000000) && io_input_ar_valid)};
  assign decodedCmdError = (decodedCmdSels == 2'b00);
  assign allowCmd = ((pendingCmdCounter_value == 3'b000) || ((pendingCmdCounter_value != 3'b111) && (pendingSels == decodedCmdSels)));
  assign io_input_ar_ready = (((|(decodedCmdSels & {io_outputs_1_ar_ready,io_outputs_0_ar_ready})) || (decodedCmdError && errorSlave_io_axi_ar_ready)) && allowCmd);
  assign errorSlave_io_axi_ar_valid = ((io_input_ar_valid && decodedCmdError) && allowCmd);
  assign io_outputs_0_ar_valid = ((io_input_ar_valid && decodedCmdSels[0]) && allowCmd);
  assign io_outputs_0_ar_payload_addr = io_input_ar_payload_addr;
  assign io_outputs_0_ar_payload_len = io_input_ar_payload_len;
  assign io_outputs_0_ar_payload_burst = io_input_ar_payload_burst;
  assign io_outputs_0_ar_payload_cache = io_input_ar_payload_cache;
  assign io_outputs_0_ar_payload_prot = io_input_ar_payload_prot;
  assign io_outputs_1_ar_valid = ((io_input_ar_valid && decodedCmdSels[1]) && allowCmd);
  assign io_outputs_1_ar_payload_addr = io_input_ar_payload_addr;
  assign io_outputs_1_ar_payload_len = io_input_ar_payload_len;
  assign io_outputs_1_ar_payload_burst = io_input_ar_payload_burst;
  assign io_outputs_1_ar_payload_cache = io_input_ar_payload_cache;
  assign io_outputs_1_ar_payload_prot = io_input_ar_payload_prot;
  assign _zz_io_input_r_payload_data = pendingSels[0];
  assign _zz_readRspIndex = pendingSels[1];
  assign readRspIndex = _zz_readRspIndex;
  always @(*) begin
    io_input_r_valid = (|{io_outputs_1_r_valid,io_outputs_0_r_valid});
    if(errorSlave_io_axi_r_valid) begin
      io_input_r_valid = 1'b1;
    end
  end

  assign io_input_r_payload_data = (_zz_io_input_r_payload_data ? io_outputs_0_r_payload_data : io_outputs_1_r_payload_data);
  always @(*) begin
    io_input_r_payload_resp = (_zz_io_input_r_payload_data ? io_outputs_0_r_payload_resp : io_outputs_1_r_payload_resp);
    if(pendingError) begin
      io_input_r_payload_resp = errorSlave_io_axi_r_payload_resp;
    end
  end

  always @(*) begin
    io_input_r_payload_last = (_zz_io_input_r_payload_data ? io_outputs_0_r_payload_last : io_outputs_1_r_payload_last);
    if(pendingError) begin
      io_input_r_payload_last = errorSlave_io_axi_r_payload_last;
    end
  end

  assign io_outputs_0_r_ready = io_input_r_ready;
  assign io_outputs_1_r_ready = io_input_r_ready;
  always @(posedge axiClk or posedge resetCtrl_axiReset) begin
    if(resetCtrl_axiReset) begin
      pendingCmdCounter_value <= 3'b000;
      pendingSels <= 2'b00;
      pendingError <= 1'b0;
    end else begin
      pendingCmdCounter_value <= pendingCmdCounter_valueNext;
      if(io_input_ar_ready) begin
        pendingSels <= decodedCmdSels;
      end
      if(io_input_ar_ready) begin
        pendingError <= decodedCmdError;
      end
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
  input               axiClk,
  input               resetCtrl_systemReset
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
  always @(posedge axiClk or posedge resetCtrl_systemReset) begin
    if(resetCtrl_systemReset) begin
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

  always @(posedge axiClk) begin
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
  input               axiClk,
  input               resetCtrl_systemReset
);
  localparam JtagState_RESET = 4'd0;
  localparam JtagState_IDLE = 4'd1;
  localparam JtagState_IR_SELECT = 4'd2;
  localparam JtagState_IR_CAPTURE = 4'd3;
  localparam JtagState_IR_SHIFT = 4'd4;
  localparam JtagState_IR_EXIT1 = 4'd5;
  localparam JtagState_IR_PAUSE = 4'd6;
  localparam JtagState_IR_EXIT2 = 4'd7;
  localparam JtagState_IR_UPDATE = 4'd8;
  localparam JtagState_DR_SELECT = 4'd9;
  localparam JtagState_DR_CAPTURE = 4'd10;
  localparam JtagState_DR_SHIFT = 4'd11;
  localparam JtagState_DR_EXIT1 = 4'd12;
  localparam JtagState_DR_PAUSE = 4'd13;
  localparam JtagState_DR_EXIT2 = 4'd14;
  localparam JtagState_DR_UPDATE = 4'd15;

  wire                flowCCByToggle_1_io_output_valid;
  wire                flowCCByToggle_1_io_output_payload_last;
  wire       [0:0]    flowCCByToggle_1_io_output_payload_fragment;
  wire       [3:0]    _zz_jtag_tap_isBypass;
  wire       [3:0]    _zz_jtag_tap_isBypass_1;
  wire       [1:0]    _zz_jtag_tap_instructionShift;
  wire                system_cmd_valid;
  wire                system_cmd_payload_last;
  wire       [0:0]    system_cmd_payload_fragment;
  (* async_reg = "true" *) reg                 system_rsp_valid;
  (* async_reg = "true" *) reg                 system_rsp_payload_error;
  (* async_reg = "true" *) reg        [31:0]   system_rsp_payload_data;
  wire                io_remote_rsp_fire;
  wire       [3:0]    jtag_tap_fsm_stateNext;
  reg        [3:0]    jtag_tap_fsm_state = JtagState_RESET;
  reg        [3:0]    _zz_jtag_tap_fsm_stateNext;
  reg        [3:0]    jtag_tap_instruction;
  reg        [3:0]    jtag_tap_instructionShift;
  reg                 jtag_tap_bypass;
  reg                 jtag_tap_tdoUnbufferd;
  reg                 jtag_tap_tdoDr;
  wire                jtag_tap_tdoIr;
  wire                jtag_tap_isBypass;
  reg                 jtag_tap_tdoUnbufferd_regNext;
  wire                jtag_idcodeArea_ctrl_tdi;
  wire                jtag_idcodeArea_ctrl_enable;
  wire                jtag_idcodeArea_ctrl_capture;
  wire                jtag_idcodeArea_ctrl_shift;
  wire                jtag_idcodeArea_ctrl_update;
  wire                jtag_idcodeArea_ctrl_reset;
  wire                jtag_idcodeArea_ctrl_tdo;
  reg        [31:0]   jtag_idcodeArea_shifter;
  wire                when_JtagTap_l120;
  wire                jtag_writeArea_ctrl_tdi;
  wire                jtag_writeArea_ctrl_enable;
  wire                jtag_writeArea_ctrl_capture;
  wire                jtag_writeArea_ctrl_shift;
  wire                jtag_writeArea_ctrl_update;
  wire                jtag_writeArea_ctrl_reset;
  wire                jtag_writeArea_ctrl_tdo;
  wire                jtag_writeArea_source_valid;
  wire                jtag_writeArea_source_payload_last;
  wire       [0:0]    jtag_writeArea_source_payload_fragment;
  reg                 jtag_writeArea_valid;
  reg                 jtag_writeArea_data;
  wire                jtag_readArea_ctrl_tdi;
  wire                jtag_readArea_ctrl_enable;
  wire                jtag_readArea_ctrl_capture;
  wire                jtag_readArea_ctrl_shift;
  wire                jtag_readArea_ctrl_update;
  wire                jtag_readArea_ctrl_reset;
  wire                jtag_readArea_ctrl_tdo;
  reg        [33:0]   jtag_readArea_full_shifter;
  `ifndef SYNTHESIS
  reg [79:0] jtag_tap_fsm_stateNext_string;
  reg [79:0] jtag_tap_fsm_state_string;
  reg [79:0] _zz_jtag_tap_fsm_stateNext_string;
  `endif


  assign _zz_jtag_tap_isBypass = jtag_tap_instruction;
  assign _zz_jtag_tap_isBypass_1 = 4'b1111;
  assign _zz_jtag_tap_instructionShift = 2'b01;
  FlowCCByToggle flowCCByToggle_1 (
    .io_input_valid                (jtag_writeArea_source_valid                  ), //i
    .io_input_payload_last         (jtag_writeArea_source_payload_last           ), //i
    .io_input_payload_fragment     (jtag_writeArea_source_payload_fragment       ), //i
    .io_output_valid               (flowCCByToggle_1_io_output_valid             ), //o
    .io_output_payload_last        (flowCCByToggle_1_io_output_payload_last      ), //o
    .io_output_payload_fragment    (flowCCByToggle_1_io_output_payload_fragment  ), //o
    .io_jtag_tck                   (io_jtag_tck                                  ), //i
    .axiClk                        (axiClk                                       ), //i
    .resetCtrl_systemReset         (resetCtrl_systemReset                        )  //i
  );
  `ifndef SYNTHESIS
  always @(*) begin
    case(jtag_tap_fsm_stateNext)
      JtagState_RESET : jtag_tap_fsm_stateNext_string = "RESET     ";
      JtagState_IDLE : jtag_tap_fsm_stateNext_string = "IDLE      ";
      JtagState_IR_SELECT : jtag_tap_fsm_stateNext_string = "IR_SELECT ";
      JtagState_IR_CAPTURE : jtag_tap_fsm_stateNext_string = "IR_CAPTURE";
      JtagState_IR_SHIFT : jtag_tap_fsm_stateNext_string = "IR_SHIFT  ";
      JtagState_IR_EXIT1 : jtag_tap_fsm_stateNext_string = "IR_EXIT1  ";
      JtagState_IR_PAUSE : jtag_tap_fsm_stateNext_string = "IR_PAUSE  ";
      JtagState_IR_EXIT2 : jtag_tap_fsm_stateNext_string = "IR_EXIT2  ";
      JtagState_IR_UPDATE : jtag_tap_fsm_stateNext_string = "IR_UPDATE ";
      JtagState_DR_SELECT : jtag_tap_fsm_stateNext_string = "DR_SELECT ";
      JtagState_DR_CAPTURE : jtag_tap_fsm_stateNext_string = "DR_CAPTURE";
      JtagState_DR_SHIFT : jtag_tap_fsm_stateNext_string = "DR_SHIFT  ";
      JtagState_DR_EXIT1 : jtag_tap_fsm_stateNext_string = "DR_EXIT1  ";
      JtagState_DR_PAUSE : jtag_tap_fsm_stateNext_string = "DR_PAUSE  ";
      JtagState_DR_EXIT2 : jtag_tap_fsm_stateNext_string = "DR_EXIT2  ";
      JtagState_DR_UPDATE : jtag_tap_fsm_stateNext_string = "DR_UPDATE ";
      default : jtag_tap_fsm_stateNext_string = "??????????";
    endcase
  end
  always @(*) begin
    case(jtag_tap_fsm_state)
      JtagState_RESET : jtag_tap_fsm_state_string = "RESET     ";
      JtagState_IDLE : jtag_tap_fsm_state_string = "IDLE      ";
      JtagState_IR_SELECT : jtag_tap_fsm_state_string = "IR_SELECT ";
      JtagState_IR_CAPTURE : jtag_tap_fsm_state_string = "IR_CAPTURE";
      JtagState_IR_SHIFT : jtag_tap_fsm_state_string = "IR_SHIFT  ";
      JtagState_IR_EXIT1 : jtag_tap_fsm_state_string = "IR_EXIT1  ";
      JtagState_IR_PAUSE : jtag_tap_fsm_state_string = "IR_PAUSE  ";
      JtagState_IR_EXIT2 : jtag_tap_fsm_state_string = "IR_EXIT2  ";
      JtagState_IR_UPDATE : jtag_tap_fsm_state_string = "IR_UPDATE ";
      JtagState_DR_SELECT : jtag_tap_fsm_state_string = "DR_SELECT ";
      JtagState_DR_CAPTURE : jtag_tap_fsm_state_string = "DR_CAPTURE";
      JtagState_DR_SHIFT : jtag_tap_fsm_state_string = "DR_SHIFT  ";
      JtagState_DR_EXIT1 : jtag_tap_fsm_state_string = "DR_EXIT1  ";
      JtagState_DR_PAUSE : jtag_tap_fsm_state_string = "DR_PAUSE  ";
      JtagState_DR_EXIT2 : jtag_tap_fsm_state_string = "DR_EXIT2  ";
      JtagState_DR_UPDATE : jtag_tap_fsm_state_string = "DR_UPDATE ";
      default : jtag_tap_fsm_state_string = "??????????";
    endcase
  end
  always @(*) begin
    case(_zz_jtag_tap_fsm_stateNext)
      JtagState_RESET : _zz_jtag_tap_fsm_stateNext_string = "RESET     ";
      JtagState_IDLE : _zz_jtag_tap_fsm_stateNext_string = "IDLE      ";
      JtagState_IR_SELECT : _zz_jtag_tap_fsm_stateNext_string = "IR_SELECT ";
      JtagState_IR_CAPTURE : _zz_jtag_tap_fsm_stateNext_string = "IR_CAPTURE";
      JtagState_IR_SHIFT : _zz_jtag_tap_fsm_stateNext_string = "IR_SHIFT  ";
      JtagState_IR_EXIT1 : _zz_jtag_tap_fsm_stateNext_string = "IR_EXIT1  ";
      JtagState_IR_PAUSE : _zz_jtag_tap_fsm_stateNext_string = "IR_PAUSE  ";
      JtagState_IR_EXIT2 : _zz_jtag_tap_fsm_stateNext_string = "IR_EXIT2  ";
      JtagState_IR_UPDATE : _zz_jtag_tap_fsm_stateNext_string = "IR_UPDATE ";
      JtagState_DR_SELECT : _zz_jtag_tap_fsm_stateNext_string = "DR_SELECT ";
      JtagState_DR_CAPTURE : _zz_jtag_tap_fsm_stateNext_string = "DR_CAPTURE";
      JtagState_DR_SHIFT : _zz_jtag_tap_fsm_stateNext_string = "DR_SHIFT  ";
      JtagState_DR_EXIT1 : _zz_jtag_tap_fsm_stateNext_string = "DR_EXIT1  ";
      JtagState_DR_PAUSE : _zz_jtag_tap_fsm_stateNext_string = "DR_PAUSE  ";
      JtagState_DR_EXIT2 : _zz_jtag_tap_fsm_stateNext_string = "DR_EXIT2  ";
      JtagState_DR_UPDATE : _zz_jtag_tap_fsm_stateNext_string = "DR_UPDATE ";
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
      JtagState_IDLE : begin
        _zz_jtag_tap_fsm_stateNext = (io_jtag_tms ? JtagState_DR_SELECT : JtagState_IDLE);
      end
      JtagState_IR_SELECT : begin
        _zz_jtag_tap_fsm_stateNext = (io_jtag_tms ? JtagState_RESET : JtagState_IR_CAPTURE);
      end
      JtagState_IR_CAPTURE : begin
        _zz_jtag_tap_fsm_stateNext = (io_jtag_tms ? JtagState_IR_EXIT1 : JtagState_IR_SHIFT);
      end
      JtagState_IR_SHIFT : begin
        _zz_jtag_tap_fsm_stateNext = (io_jtag_tms ? JtagState_IR_EXIT1 : JtagState_IR_SHIFT);
      end
      JtagState_IR_EXIT1 : begin
        _zz_jtag_tap_fsm_stateNext = (io_jtag_tms ? JtagState_IR_UPDATE : JtagState_IR_PAUSE);
      end
      JtagState_IR_PAUSE : begin
        _zz_jtag_tap_fsm_stateNext = (io_jtag_tms ? JtagState_IR_EXIT2 : JtagState_IR_PAUSE);
      end
      JtagState_IR_EXIT2 : begin
        _zz_jtag_tap_fsm_stateNext = (io_jtag_tms ? JtagState_IR_UPDATE : JtagState_IR_SHIFT);
      end
      JtagState_IR_UPDATE : begin
        _zz_jtag_tap_fsm_stateNext = (io_jtag_tms ? JtagState_DR_SELECT : JtagState_IDLE);
      end
      JtagState_DR_SELECT : begin
        _zz_jtag_tap_fsm_stateNext = (io_jtag_tms ? JtagState_IR_SELECT : JtagState_DR_CAPTURE);
      end
      JtagState_DR_CAPTURE : begin
        _zz_jtag_tap_fsm_stateNext = (io_jtag_tms ? JtagState_DR_EXIT1 : JtagState_DR_SHIFT);
      end
      JtagState_DR_SHIFT : begin
        _zz_jtag_tap_fsm_stateNext = (io_jtag_tms ? JtagState_DR_EXIT1 : JtagState_DR_SHIFT);
      end
      JtagState_DR_EXIT1 : begin
        _zz_jtag_tap_fsm_stateNext = (io_jtag_tms ? JtagState_DR_UPDATE : JtagState_DR_PAUSE);
      end
      JtagState_DR_PAUSE : begin
        _zz_jtag_tap_fsm_stateNext = (io_jtag_tms ? JtagState_DR_EXIT2 : JtagState_DR_PAUSE);
      end
      JtagState_DR_EXIT2 : begin
        _zz_jtag_tap_fsm_stateNext = (io_jtag_tms ? JtagState_DR_UPDATE : JtagState_DR_SHIFT);
      end
      JtagState_DR_UPDATE : begin
        _zz_jtag_tap_fsm_stateNext = (io_jtag_tms ? JtagState_DR_SELECT : JtagState_IDLE);
      end
      default : begin
        _zz_jtag_tap_fsm_stateNext = (io_jtag_tms ? JtagState_RESET : JtagState_IDLE);
      end
    endcase
  end

  assign jtag_tap_fsm_stateNext = _zz_jtag_tap_fsm_stateNext;
  always @(*) begin
    jtag_tap_tdoUnbufferd = jtag_tap_bypass;
    case(jtag_tap_fsm_state)
      JtagState_IR_SHIFT : begin
        jtag_tap_tdoUnbufferd = jtag_tap_tdoIr;
      end
      JtagState_DR_SHIFT : begin
        if(jtag_tap_isBypass) begin
          jtag_tap_tdoUnbufferd = jtag_tap_bypass;
        end else begin
          jtag_tap_tdoUnbufferd = jtag_tap_tdoDr;
        end
      end
      default : begin
      end
    endcase
  end

  always @(*) begin
    jtag_tap_tdoDr = 1'b0;
    if(jtag_idcodeArea_ctrl_enable) begin
      jtag_tap_tdoDr = jtag_idcodeArea_ctrl_tdo;
    end
    if(jtag_writeArea_ctrl_enable) begin
      jtag_tap_tdoDr = jtag_writeArea_ctrl_tdo;
    end
    if(jtag_readArea_ctrl_enable) begin
      jtag_tap_tdoDr = jtag_readArea_ctrl_tdo;
    end
  end

  assign jtag_tap_tdoIr = jtag_tap_instructionShift[0];
  assign jtag_tap_isBypass = ($signed(_zz_jtag_tap_isBypass) == $signed(_zz_jtag_tap_isBypass_1));
  assign io_jtag_tdo = jtag_tap_tdoUnbufferd_regNext;
  assign jtag_idcodeArea_ctrl_tdo = jtag_idcodeArea_shifter[0];
  assign jtag_idcodeArea_ctrl_tdi = io_jtag_tdi;
  assign jtag_idcodeArea_ctrl_enable = (jtag_tap_instruction == 4'b0001);
  assign jtag_idcodeArea_ctrl_capture = (jtag_tap_fsm_state == JtagState_DR_CAPTURE);
  assign jtag_idcodeArea_ctrl_shift = (jtag_tap_fsm_state == JtagState_DR_SHIFT);
  assign jtag_idcodeArea_ctrl_update = (jtag_tap_fsm_state == JtagState_DR_UPDATE);
  assign jtag_idcodeArea_ctrl_reset = (jtag_tap_fsm_state == JtagState_RESET);
  assign when_JtagTap_l120 = (jtag_tap_fsm_state == JtagState_RESET);
  assign jtag_writeArea_source_valid = jtag_writeArea_valid;
  assign jtag_writeArea_source_payload_last = (! (jtag_writeArea_ctrl_enable && jtag_writeArea_ctrl_shift));
  assign jtag_writeArea_source_payload_fragment[0] = jtag_writeArea_data;
  assign system_cmd_valid = flowCCByToggle_1_io_output_valid;
  assign system_cmd_payload_last = flowCCByToggle_1_io_output_payload_last;
  assign system_cmd_payload_fragment = flowCCByToggle_1_io_output_payload_fragment;
  assign jtag_writeArea_ctrl_tdo = 1'b0;
  assign jtag_writeArea_ctrl_tdi = io_jtag_tdi;
  assign jtag_writeArea_ctrl_enable = (jtag_tap_instruction == 4'b0010);
  assign jtag_writeArea_ctrl_capture = (jtag_tap_fsm_state == JtagState_DR_CAPTURE);
  assign jtag_writeArea_ctrl_shift = (jtag_tap_fsm_state == JtagState_DR_SHIFT);
  assign jtag_writeArea_ctrl_update = (jtag_tap_fsm_state == JtagState_DR_UPDATE);
  assign jtag_writeArea_ctrl_reset = (jtag_tap_fsm_state == JtagState_RESET);
  assign jtag_readArea_ctrl_tdo = jtag_readArea_full_shifter[0];
  assign jtag_readArea_ctrl_tdi = io_jtag_tdi;
  assign jtag_readArea_ctrl_enable = (jtag_tap_instruction == 4'b0011);
  assign jtag_readArea_ctrl_capture = (jtag_tap_fsm_state == JtagState_DR_CAPTURE);
  assign jtag_readArea_ctrl_shift = (jtag_tap_fsm_state == JtagState_DR_SHIFT);
  assign jtag_readArea_ctrl_update = (jtag_tap_fsm_state == JtagState_DR_UPDATE);
  assign jtag_readArea_ctrl_reset = (jtag_tap_fsm_state == JtagState_RESET);
  always @(posedge axiClk) begin
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
      JtagState_IR_CAPTURE : begin
        jtag_tap_instructionShift <= {2'd0, _zz_jtag_tap_instructionShift};
      end
      JtagState_IR_SHIFT : begin
        jtag_tap_instructionShift <= ({io_jtag_tdi,jtag_tap_instructionShift} >>> 1);
      end
      JtagState_IR_UPDATE : begin
        jtag_tap_instruction <= jtag_tap_instructionShift;
      end
      JtagState_DR_SHIFT : begin
        jtag_tap_instructionShift <= ({io_jtag_tdi,jtag_tap_instructionShift} >>> 1);
      end
      default : begin
      end
    endcase
    if(jtag_idcodeArea_ctrl_enable) begin
      if(jtag_idcodeArea_ctrl_shift) begin
        jtag_idcodeArea_shifter <= ({jtag_idcodeArea_ctrl_tdi,jtag_idcodeArea_shifter} >>> 1);
      end
    end
    if(jtag_idcodeArea_ctrl_capture) begin
      jtag_idcodeArea_shifter <= 32'h10001fff;
    end
    if(when_JtagTap_l120) begin
      jtag_tap_instruction <= 4'b0001;
    end
    jtag_writeArea_valid <= (jtag_writeArea_ctrl_enable && jtag_writeArea_ctrl_shift);
    jtag_writeArea_data <= jtag_writeArea_ctrl_tdi;
    if(jtag_readArea_ctrl_enable) begin
      if(jtag_readArea_ctrl_capture) begin
        jtag_readArea_full_shifter <= {{system_rsp_payload_data,system_rsp_payload_error},system_rsp_valid};
      end
      if(jtag_readArea_ctrl_shift) begin
        jtag_readArea_full_shifter <= ({jtag_readArea_ctrl_tdi,jtag_readArea_full_shifter} >>> 1);
      end
    end
  end

  always @(negedge io_jtag_tck) begin
    jtag_tap_tdoUnbufferd_regNext <= jtag_tap_tdoUnbufferd;
  end


endmodule

module StreamFork_3 (
  input               io_input_valid,
  output reg          io_input_ready,
  input               io_input_payload_wr,
  input               io_input_payload_uncached,
  input      [31:0]   io_input_payload_address,
  input      [31:0]   io_input_payload_data,
  input      [3:0]    io_input_payload_mask,
  input      [2:0]    io_input_payload_size,
  input               io_input_payload_last,
  output              io_outputs_0_valid,
  input               io_outputs_0_ready,
  output              io_outputs_0_payload_wr,
  output              io_outputs_0_payload_uncached,
  output     [31:0]   io_outputs_0_payload_address,
  output     [31:0]   io_outputs_0_payload_data,
  output     [3:0]    io_outputs_0_payload_mask,
  output     [2:0]    io_outputs_0_payload_size,
  output              io_outputs_0_payload_last,
  output              io_outputs_1_valid,
  input               io_outputs_1_ready,
  output              io_outputs_1_payload_wr,
  output              io_outputs_1_payload_uncached,
  output     [31:0]   io_outputs_1_payload_address,
  output     [31:0]   io_outputs_1_payload_data,
  output     [3:0]    io_outputs_1_payload_mask,
  output     [2:0]    io_outputs_1_payload_size,
  output              io_outputs_1_payload_last,
  input               axiClk,
  input               resetCtrl_axiReset
);

  reg                 _zz_io_outputs_0_valid;
  reg                 _zz_io_outputs_1_valid;
  wire                when_Stream_l817;
  wire                when_Stream_l817_1;
  wire                io_outputs_0_fire;
  wire                io_outputs_1_fire;

  always @(*) begin
    io_input_ready = 1'b1;
    if(when_Stream_l817) begin
      io_input_ready = 1'b0;
    end
    if(when_Stream_l817_1) begin
      io_input_ready = 1'b0;
    end
  end

  assign when_Stream_l817 = ((! io_outputs_0_ready) && _zz_io_outputs_0_valid);
  assign when_Stream_l817_1 = ((! io_outputs_1_ready) && _zz_io_outputs_1_valid);
  assign io_outputs_0_valid = (io_input_valid && _zz_io_outputs_0_valid);
  assign io_outputs_0_payload_wr = io_input_payload_wr;
  assign io_outputs_0_payload_uncached = io_input_payload_uncached;
  assign io_outputs_0_payload_address = io_input_payload_address;
  assign io_outputs_0_payload_data = io_input_payload_data;
  assign io_outputs_0_payload_mask = io_input_payload_mask;
  assign io_outputs_0_payload_size = io_input_payload_size;
  assign io_outputs_0_payload_last = io_input_payload_last;
  assign io_outputs_0_fire = (io_outputs_0_valid && io_outputs_0_ready);
  assign io_outputs_1_valid = (io_input_valid && _zz_io_outputs_1_valid);
  assign io_outputs_1_payload_wr = io_input_payload_wr;
  assign io_outputs_1_payload_uncached = io_input_payload_uncached;
  assign io_outputs_1_payload_address = io_input_payload_address;
  assign io_outputs_1_payload_data = io_input_payload_data;
  assign io_outputs_1_payload_mask = io_input_payload_mask;
  assign io_outputs_1_payload_size = io_input_payload_size;
  assign io_outputs_1_payload_last = io_input_payload_last;
  assign io_outputs_1_fire = (io_outputs_1_valid && io_outputs_1_ready);
  always @(posedge axiClk or posedge resetCtrl_axiReset) begin
    if(resetCtrl_axiReset) begin
      _zz_io_outputs_0_valid <= 1'b1;
      _zz_io_outputs_1_valid <= 1'b1;
    end else begin
      if(io_outputs_0_fire) begin
        _zz_io_outputs_0_valid <= 1'b0;
      end
      if(io_outputs_1_fire) begin
        _zz_io_outputs_1_valid <= 1'b0;
      end
      if(io_input_ready) begin
        _zz_io_outputs_0_valid <= 1'b1;
        _zz_io_outputs_1_valid <= 1'b1;
      end
    end
  end


endmodule

module VexRiscv (
  output              dBus_cmd_valid,
  input               dBus_cmd_ready,
  output              dBus_cmd_payload_wr,
  output              dBus_cmd_payload_uncached,
  output     [31:0]   dBus_cmd_payload_address,
  output     [31:0]   dBus_cmd_payload_data,
  output     [3:0]    dBus_cmd_payload_mask,
  output     [2:0]    dBus_cmd_payload_size,
  output              dBus_cmd_payload_last,
  input               dBus_rsp_valid,
  input               dBus_rsp_payload_last,
  input      [31:0]   dBus_rsp_payload_data,
  input               dBus_rsp_payload_error,
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
  output              iBus_cmd_valid,
  input               iBus_cmd_ready,
  output reg [31:0]   iBus_cmd_payload_address,
  output     [2:0]    iBus_cmd_payload_size,
  input               iBus_rsp_valid,
  input      [31:0]   iBus_rsp_payload_data,
  input               iBus_rsp_payload_error,
  input               axiClk,
  input               resetCtrl_axiReset,
  input               resetCtrl_systemReset
);
  localparam ShiftCtrlEnum_DISABLE_1 = 2'd0;
  localparam ShiftCtrlEnum_SLL_1 = 2'd1;
  localparam ShiftCtrlEnum_SRL_1 = 2'd2;
  localparam ShiftCtrlEnum_SRA_1 = 2'd3;
  localparam EnvCtrlEnum_NONE = 1'd0;
  localparam EnvCtrlEnum_XRET = 1'd1;
  localparam BranchCtrlEnum_INC = 2'd0;
  localparam BranchCtrlEnum_B = 2'd1;
  localparam BranchCtrlEnum_JAL = 2'd2;
  localparam BranchCtrlEnum_JALR = 2'd3;
  localparam AluBitwiseCtrlEnum_XOR_1 = 2'd0;
  localparam AluBitwiseCtrlEnum_OR_1 = 2'd1;
  localparam AluBitwiseCtrlEnum_AND_1 = 2'd2;
  localparam Src2CtrlEnum_RS = 2'd0;
  localparam Src2CtrlEnum_IMI = 2'd1;
  localparam Src2CtrlEnum_IMS = 2'd2;
  localparam Src2CtrlEnum_PC = 2'd3;
  localparam AluCtrlEnum_ADD_SUB = 2'd0;
  localparam AluCtrlEnum_SLT_SLTU = 2'd1;
  localparam AluCtrlEnum_BITWISE = 2'd2;
  localparam Src1CtrlEnum_RS = 2'd0;
  localparam Src1CtrlEnum_IMU = 2'd1;
  localparam Src1CtrlEnum_PC_INCREMENT = 2'd2;
  localparam Src1CtrlEnum_URS1 = 2'd3;

  wire                IBusCachedPlugin_cache_io_flush;
  wire                IBusCachedPlugin_cache_io_cpu_prefetch_isValid;
  wire                IBusCachedPlugin_cache_io_cpu_fetch_isValid;
  wire                IBusCachedPlugin_cache_io_cpu_fetch_isStuck;
  wire                IBusCachedPlugin_cache_io_cpu_fetch_isRemoved;
  wire                IBusCachedPlugin_cache_io_cpu_decode_isValid;
  wire                IBusCachedPlugin_cache_io_cpu_decode_isStuck;
  wire                IBusCachedPlugin_cache_io_cpu_decode_isUser;
  reg                 IBusCachedPlugin_cache_io_cpu_fill_valid;
  wire                dataCache_1_io_cpu_execute_isValid;
  wire       [31:0]   dataCache_1_io_cpu_execute_address;
  wire                dataCache_1_io_cpu_memory_isValid;
  wire       [31:0]   dataCache_1_io_cpu_memory_address;
  reg                 dataCache_1_io_cpu_memory_mmuRsp_isIoAccess;
  reg                 dataCache_1_io_cpu_writeBack_isValid;
  wire                dataCache_1_io_cpu_writeBack_isUser;
  wire       [31:0]   dataCache_1_io_cpu_writeBack_storeData;
  wire       [31:0]   dataCache_1_io_cpu_writeBack_address;
  wire                dataCache_1_io_cpu_writeBack_fence_SW;
  wire                dataCache_1_io_cpu_writeBack_fence_SR;
  wire                dataCache_1_io_cpu_writeBack_fence_SO;
  wire                dataCache_1_io_cpu_writeBack_fence_SI;
  wire                dataCache_1_io_cpu_writeBack_fence_PW;
  wire                dataCache_1_io_cpu_writeBack_fence_PR;
  wire                dataCache_1_io_cpu_writeBack_fence_PO;
  wire                dataCache_1_io_cpu_writeBack_fence_PI;
  wire       [3:0]    dataCache_1_io_cpu_writeBack_fence_FM;
  wire                dataCache_1_io_cpu_flush_valid;
  reg        [31:0]   _zz_RegFilePlugin_regFile_port0;
  reg        [31:0]   _zz_RegFilePlugin_regFile_port1;
  wire                IBusCachedPlugin_cache_io_cpu_prefetch_haltIt;
  wire       [31:0]   IBusCachedPlugin_cache_io_cpu_fetch_data;
  wire       [31:0]   IBusCachedPlugin_cache_io_cpu_fetch_physicalAddress;
  wire                IBusCachedPlugin_cache_io_cpu_decode_error;
  wire                IBusCachedPlugin_cache_io_cpu_decode_mmuRefilling;
  wire                IBusCachedPlugin_cache_io_cpu_decode_mmuException;
  wire       [31:0]   IBusCachedPlugin_cache_io_cpu_decode_data;
  wire                IBusCachedPlugin_cache_io_cpu_decode_cacheMiss;
  wire       [31:0]   IBusCachedPlugin_cache_io_cpu_decode_physicalAddress;
  wire                IBusCachedPlugin_cache_io_mem_cmd_valid;
  wire       [31:0]   IBusCachedPlugin_cache_io_mem_cmd_payload_address;
  wire       [2:0]    IBusCachedPlugin_cache_io_mem_cmd_payload_size;
  wire                dataCache_1_io_cpu_execute_haltIt;
  wire                dataCache_1_io_cpu_execute_refilling;
  wire                dataCache_1_io_cpu_memory_isWrite;
  wire                dataCache_1_io_cpu_writeBack_haltIt;
  wire       [31:0]   dataCache_1_io_cpu_writeBack_data;
  wire                dataCache_1_io_cpu_writeBack_mmuException;
  wire                dataCache_1_io_cpu_writeBack_unalignedAccess;
  wire                dataCache_1_io_cpu_writeBack_accessError;
  wire                dataCache_1_io_cpu_writeBack_isWrite;
  wire                dataCache_1_io_cpu_writeBack_keepMemRspData;
  wire                dataCache_1_io_cpu_writeBack_exclusiveOk;
  wire                dataCache_1_io_cpu_flush_ready;
  wire                dataCache_1_io_cpu_redo;
  wire                dataCache_1_io_mem_cmd_valid;
  wire                dataCache_1_io_mem_cmd_payload_wr;
  wire                dataCache_1_io_mem_cmd_payload_uncached;
  wire       [31:0]   dataCache_1_io_mem_cmd_payload_address;
  wire       [31:0]   dataCache_1_io_mem_cmd_payload_data;
  wire       [3:0]    dataCache_1_io_mem_cmd_payload_mask;
  wire       [2:0]    dataCache_1_io_mem_cmd_payload_size;
  wire                dataCache_1_io_mem_cmd_payload_last;
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
  wire       [31:0]   _zz_decode_LEGAL_INSTRUCTION;
  wire       [31:0]   _zz_decode_LEGAL_INSTRUCTION_1;
  wire       [31:0]   _zz_decode_LEGAL_INSTRUCTION_2;
  wire                _zz_decode_LEGAL_INSTRUCTION_3;
  wire       [0:0]    _zz_decode_LEGAL_INSTRUCTION_4;
  wire       [12:0]   _zz_decode_LEGAL_INSTRUCTION_5;
  wire       [31:0]   _zz_decode_LEGAL_INSTRUCTION_6;
  wire       [31:0]   _zz_decode_LEGAL_INSTRUCTION_7;
  wire       [31:0]   _zz_decode_LEGAL_INSTRUCTION_8;
  wire                _zz_decode_LEGAL_INSTRUCTION_9;
  wire       [0:0]    _zz_decode_LEGAL_INSTRUCTION_10;
  wire       [6:0]    _zz_decode_LEGAL_INSTRUCTION_11;
  wire       [31:0]   _zz_decode_LEGAL_INSTRUCTION_12;
  wire       [31:0]   _zz_decode_LEGAL_INSTRUCTION_13;
  wire       [31:0]   _zz_decode_LEGAL_INSTRUCTION_14;
  wire                _zz_decode_LEGAL_INSTRUCTION_15;
  wire       [0:0]    _zz_decode_LEGAL_INSTRUCTION_16;
  wire       [0:0]    _zz_decode_LEGAL_INSTRUCTION_17;
  wire       [3:0]    _zz__zz_IBusCachedPlugin_jump_pcLoad_payload_1;
  reg        [31:0]   _zz_IBusCachedPlugin_jump_pcLoad_payload_5;
  wire       [1:0]    _zz_IBusCachedPlugin_jump_pcLoad_payload_6;
  wire       [31:0]   _zz_IBusCachedPlugin_fetchPc_pc;
  wire       [2:0]    _zz_IBusCachedPlugin_fetchPc_pc_1;
  wire       [31:0]   _zz_IBusCachedPlugin_decodePc_pcPlus;
  wire       [2:0]    _zz_IBusCachedPlugin_decodePc_pcPlus_1;
  wire       [31:0]   _zz_IBusCachedPlugin_decompressor_decompressed_27;
  wire                _zz_IBusCachedPlugin_decompressor_decompressed_28;
  wire                _zz_IBusCachedPlugin_decompressor_decompressed_29;
  wire       [6:0]    _zz_IBusCachedPlugin_decompressor_decompressed_30;
  wire       [4:0]    _zz_IBusCachedPlugin_decompressor_decompressed_31;
  wire                _zz_IBusCachedPlugin_decompressor_decompressed_32;
  wire       [4:0]    _zz_IBusCachedPlugin_decompressor_decompressed_33;
  wire       [11:0]   _zz_IBusCachedPlugin_decompressor_decompressed_34;
  wire       [11:0]   _zz_IBusCachedPlugin_decompressor_decompressed_35;
  wire       [11:0]   _zz__zz_IBusCachedPlugin_decodePrediction_cmd_hadBranch;
  wire       [31:0]   _zz_IBusCachedPlugin_decodePrediction_cmd_hadBranch_2;
  wire       [19:0]   _zz__zz_IBusCachedPlugin_predictionJumpInterface_payload;
  wire       [11:0]   _zz__zz_IBusCachedPlugin_predictionJumpInterface_payload_2;
  wire       [0:0]    _zz_IBusCachedPlugin_predictionJumpInterface_payload_4;
  wire       [7:0]    _zz_IBusCachedPlugin_predictionJumpInterface_payload_5;
  wire                _zz_IBusCachedPlugin_predictionJumpInterface_payload_6;
  wire       [0:0]    _zz_IBusCachedPlugin_predictionJumpInterface_payload_7;
  wire       [0:0]    _zz_IBusCachedPlugin_predictionJumpInterface_payload_8;
  wire       [2:0]    _zz_DBusCachedPlugin_exceptionBus_payload_code;
  wire       [2:0]    _zz_DBusCachedPlugin_exceptionBus_payload_code_1;
  reg        [7:0]    _zz_writeBack_DBusCachedPlugin_rspShifted;
  wire       [1:0]    _zz_writeBack_DBusCachedPlugin_rspShifted_1;
  reg        [7:0]    _zz_writeBack_DBusCachedPlugin_rspShifted_2;
  wire       [0:0]    _zz_writeBack_DBusCachedPlugin_rspShifted_3;
  wire       [31:0]   _zz__zz_decode_ENV_CTRL_2;
  wire                _zz__zz_decode_ENV_CTRL_2_1;
  wire                _zz__zz_decode_ENV_CTRL_2_2;
  wire       [0:0]    _zz__zz_decode_ENV_CTRL_2_3;
  wire       [0:0]    _zz__zz_decode_ENV_CTRL_2_4;
  wire       [0:0]    _zz__zz_decode_ENV_CTRL_2_5;
  wire                _zz__zz_decode_ENV_CTRL_2_6;
  wire       [0:0]    _zz__zz_decode_ENV_CTRL_2_7;
  wire       [24:0]   _zz__zz_decode_ENV_CTRL_2_8;
  wire                _zz__zz_decode_ENV_CTRL_2_9;
  wire       [0:0]    _zz__zz_decode_ENV_CTRL_2_10;
  wire                _zz__zz_decode_ENV_CTRL_2_11;
  wire       [31:0]   _zz__zz_decode_ENV_CTRL_2_12;
  wire       [31:0]   _zz__zz_decode_ENV_CTRL_2_13;
  wire       [31:0]   _zz__zz_decode_ENV_CTRL_2_14;
  wire       [31:0]   _zz__zz_decode_ENV_CTRL_2_15;
  wire       [0:0]    _zz__zz_decode_ENV_CTRL_2_16;
  wire                _zz__zz_decode_ENV_CTRL_2_17;
  wire       [0:0]    _zz__zz_decode_ENV_CTRL_2_18;
  wire       [31:0]   _zz__zz_decode_ENV_CTRL_2_19;
  wire       [0:0]    _zz__zz_decode_ENV_CTRL_2_20;
  wire       [31:0]   _zz__zz_decode_ENV_CTRL_2_21;
  wire       [20:0]   _zz__zz_decode_ENV_CTRL_2_22;
  wire                _zz__zz_decode_ENV_CTRL_2_23;
  wire       [0:0]    _zz__zz_decode_ENV_CTRL_2_24;
  wire       [31:0]   _zz__zz_decode_ENV_CTRL_2_25;
  wire                _zz__zz_decode_ENV_CTRL_2_26;
  wire       [31:0]   _zz__zz_decode_ENV_CTRL_2_27;
  wire       [31:0]   _zz__zz_decode_ENV_CTRL_2_28;
  wire       [0:0]    _zz__zz_decode_ENV_CTRL_2_29;
  wire       [0:0]    _zz__zz_decode_ENV_CTRL_2_30;
  wire       [0:0]    _zz__zz_decode_ENV_CTRL_2_31;
  wire       [16:0]   _zz__zz_decode_ENV_CTRL_2_32;
  wire       [0:0]    _zz__zz_decode_ENV_CTRL_2_33;
  wire                _zz__zz_decode_ENV_CTRL_2_34;
  wire       [31:0]   _zz__zz_decode_ENV_CTRL_2_35;
  wire       [31:0]   _zz__zz_decode_ENV_CTRL_2_36;
  wire       [31:0]   _zz__zz_decode_ENV_CTRL_2_37;
  wire       [31:0]   _zz__zz_decode_ENV_CTRL_2_38;
  wire       [0:0]    _zz__zz_decode_ENV_CTRL_2_39;
  wire                _zz__zz_decode_ENV_CTRL_2_40;
  wire       [0:0]    _zz__zz_decode_ENV_CTRL_2_41;
  wire       [0:0]    _zz__zz_decode_ENV_CTRL_2_42;
  wire       [31:0]   _zz__zz_decode_ENV_CTRL_2_43;
  wire       [13:0]   _zz__zz_decode_ENV_CTRL_2_44;
  wire                _zz__zz_decode_ENV_CTRL_2_45;
  wire       [4:0]    _zz__zz_decode_ENV_CTRL_2_46;
  wire       [31:0]   _zz__zz_decode_ENV_CTRL_2_47;
  wire       [31:0]   _zz__zz_decode_ENV_CTRL_2_48;
  wire       [0:0]    _zz__zz_decode_ENV_CTRL_2_49;
  wire       [31:0]   _zz__zz_decode_ENV_CTRL_2_50;
  wire       [31:0]   _zz__zz_decode_ENV_CTRL_2_51;
  wire       [1:0]    _zz__zz_decode_ENV_CTRL_2_52;
  wire                _zz__zz_decode_ENV_CTRL_2_53;
  wire       [31:0]   _zz__zz_decode_ENV_CTRL_2_54;
  wire                _zz__zz_decode_ENV_CTRL_2_55;
  wire       [31:0]   _zz__zz_decode_ENV_CTRL_2_56;
  wire                _zz__zz_decode_ENV_CTRL_2_57;
  wire       [0:0]    _zz__zz_decode_ENV_CTRL_2_58;
  wire       [31:0]   _zz__zz_decode_ENV_CTRL_2_59;
  wire       [31:0]   _zz__zz_decode_ENV_CTRL_2_60;
  wire       [2:0]    _zz__zz_decode_ENV_CTRL_2_61;
  wire                _zz__zz_decode_ENV_CTRL_2_62;
  wire       [31:0]   _zz__zz_decode_ENV_CTRL_2_63;
  wire       [0:0]    _zz__zz_decode_ENV_CTRL_2_64;
  wire       [31:0]   _zz__zz_decode_ENV_CTRL_2_65;
  wire       [31:0]   _zz__zz_decode_ENV_CTRL_2_66;
  wire       [0:0]    _zz__zz_decode_ENV_CTRL_2_67;
  wire       [31:0]   _zz__zz_decode_ENV_CTRL_2_68;
  wire       [31:0]   _zz__zz_decode_ENV_CTRL_2_69;
  wire       [0:0]    _zz__zz_decode_ENV_CTRL_2_70;
  wire       [0:0]    _zz__zz_decode_ENV_CTRL_2_71;
  wire       [4:0]    _zz__zz_decode_ENV_CTRL_2_72;
  wire                _zz__zz_decode_ENV_CTRL_2_73;
  wire       [31:0]   _zz__zz_decode_ENV_CTRL_2_74;
  wire       [0:0]    _zz__zz_decode_ENV_CTRL_2_75;
  wire       [31:0]   _zz__zz_decode_ENV_CTRL_2_76;
  wire       [31:0]   _zz__zz_decode_ENV_CTRL_2_77;
  wire       [2:0]    _zz__zz_decode_ENV_CTRL_2_78;
  wire                _zz__zz_decode_ENV_CTRL_2_79;
  wire       [0:0]    _zz__zz_decode_ENV_CTRL_2_80;
  wire       [31:0]   _zz__zz_decode_ENV_CTRL_2_81;
  wire       [0:0]    _zz__zz_decode_ENV_CTRL_2_82;
  wire       [31:0]   _zz__zz_decode_ENV_CTRL_2_83;
  wire       [9:0]    _zz__zz_decode_ENV_CTRL_2_84;
  wire       [1:0]    _zz__zz_decode_ENV_CTRL_2_85;
  wire                _zz__zz_decode_ENV_CTRL_2_86;
  wire       [31:0]   _zz__zz_decode_ENV_CTRL_2_87;
  wire                _zz__zz_decode_ENV_CTRL_2_88;
  wire       [0:0]    _zz__zz_decode_ENV_CTRL_2_89;
  wire       [0:0]    _zz__zz_decode_ENV_CTRL_2_90;
  wire       [31:0]   _zz__zz_decode_ENV_CTRL_2_91;
  wire       [31:0]   _zz__zz_decode_ENV_CTRL_2_92;
  wire       [0:0]    _zz__zz_decode_ENV_CTRL_2_93;
  wire       [0:0]    _zz__zz_decode_ENV_CTRL_2_94;
  wire       [31:0]   _zz__zz_decode_ENV_CTRL_2_95;
  wire       [31:0]   _zz__zz_decode_ENV_CTRL_2_96;
  wire       [6:0]    _zz__zz_decode_ENV_CTRL_2_97;
  wire                _zz__zz_decode_ENV_CTRL_2_98;
  wire                _zz__zz_decode_ENV_CTRL_2_99;
  wire       [0:0]    _zz__zz_decode_ENV_CTRL_2_100;
  wire       [3:0]    _zz__zz_decode_ENV_CTRL_2_101;
  wire       [31:0]   _zz__zz_decode_ENV_CTRL_2_102;
  wire       [31:0]   _zz__zz_decode_ENV_CTRL_2_103;
  wire       [0:0]    _zz__zz_decode_ENV_CTRL_2_104;
  wire       [31:0]   _zz__zz_decode_ENV_CTRL_2_105;
  wire       [0:0]    _zz__zz_decode_ENV_CTRL_2_106;
  wire       [31:0]   _zz__zz_decode_ENV_CTRL_2_107;
  wire       [4:0]    _zz__zz_decode_ENV_CTRL_2_108;
  wire                _zz__zz_decode_ENV_CTRL_2_109;
  wire       [31:0]   _zz__zz_decode_ENV_CTRL_2_110;
  wire       [31:0]   _zz__zz_decode_ENV_CTRL_2_111;
  wire       [0:0]    _zz__zz_decode_ENV_CTRL_2_112;
  wire       [0:0]    _zz__zz_decode_ENV_CTRL_2_113;
  wire       [31:0]   _zz__zz_decode_ENV_CTRL_2_114;
  wire       [1:0]    _zz__zz_decode_ENV_CTRL_2_115;
  wire       [31:0]   _zz__zz_decode_ENV_CTRL_2_116;
  wire       [31:0]   _zz__zz_decode_ENV_CTRL_2_117;
  wire       [31:0]   _zz__zz_decode_ENV_CTRL_2_118;
  wire       [31:0]   _zz__zz_decode_ENV_CTRL_2_119;
  wire       [2:0]    _zz__zz_decode_ENV_CTRL_2_120;
  wire       [1:0]    _zz__zz_decode_ENV_CTRL_2_121;
  wire       [31:0]   _zz__zz_decode_ENV_CTRL_2_122;
  wire       [31:0]   _zz__zz_decode_ENV_CTRL_2_123;
  wire                _zz__zz_decode_ENV_CTRL_2_124;
  wire                _zz__zz_decode_ENV_CTRL_2_125;
  wire                _zz__zz_decode_ENV_CTRL_2_126;
  wire       [31:0]   _zz__zz_decode_ENV_CTRL_2_127;
  wire       [31:0]   _zz__zz_decode_ENV_CTRL_2_128;
  wire                _zz_RegFilePlugin_regFile_port;
  wire                _zz_decode_RegFilePlugin_rs1Data;
  wire                _zz_RegFilePlugin_regFile_port_1;
  wire                _zz_decode_RegFilePlugin_rs2Data;
  wire       [0:0]    _zz__zz_execute_REGFILE_WRITE_DATA;
  wire       [2:0]    _zz__zz_execute_SRC1;
  wire       [4:0]    _zz__zz_execute_SRC1_1;
  wire       [11:0]   _zz__zz_execute_SRC2_3;
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
  wire       [19:0]   _zz__zz_execute_BranchPlugin_branch_src2_2;
  wire       [11:0]   _zz__zz_execute_BranchPlugin_branch_src2_4;
  wire                _zz_execute_BranchPlugin_branch_src2_6;
  wire                _zz_execute_BranchPlugin_branch_src2_7;
  wire                _zz_execute_BranchPlugin_branch_src2_8;
  wire       [2:0]    _zz_execute_BranchPlugin_branch_src2_9;
  wire       [1:0]    _zz__zz_CsrPlugin_exceptionPortCtrl_exceptionContext_code_1;
  wire       [1:0]    _zz__zz_CsrPlugin_exceptionPortCtrl_exceptionContext_code_1_1;
  wire                _zz_when;
  wire       [29:0]   _zz_CsrPlugin_jumpInterface_payload;
  wire       [29:0]   _zz_CsrPlugin_jumpInterface_payload_1;
  wire       [51:0]   memory_MUL_LOW;
  wire       [31:0]   execute_BRANCH_CALC;
  wire                execute_BRANCH_DO;
  wire       [33:0]   memory_MUL_HH;
  wire       [33:0]   execute_MUL_HH;
  wire       [33:0]   execute_MUL_HL;
  wire       [33:0]   execute_MUL_LH;
  wire       [31:0]   execute_MUL_LL;
  wire       [31:0]   execute_SHIFT_RIGHT;
  wire       [31:0]   execute_REGFILE_WRITE_DATA;
  wire       [31:0]   memory_MEMORY_STORE_DATA_RF;
  wire       [31:0]   execute_MEMORY_STORE_DATA_RF;
  wire                decode_DO_EBREAK;
  wire                decode_CSR_READ_OPCODE;
  wire                decode_CSR_WRITE_OPCODE;
  wire                decode_PREDICTION_HAD_BRANCHED2;
  wire                decode_SRC2_FORCE_ZERO;
  wire       [0:0]    _zz_memory_to_writeBack_ENV_CTRL;
  wire       [0:0]    _zz_memory_to_writeBack_ENV_CTRL_1;
  wire       [0:0]    _zz_execute_to_memory_ENV_CTRL;
  wire       [0:0]    _zz_execute_to_memory_ENV_CTRL_1;
  wire       [0:0]    decode_ENV_CTRL;
  wire       [0:0]    _zz_decode_ENV_CTRL;
  wire       [0:0]    _zz_decode_to_execute_ENV_CTRL;
  wire       [0:0]    _zz_decode_to_execute_ENV_CTRL_1;
  wire                decode_IS_CSR;
  wire       [1:0]    _zz_decode_to_execute_BRANCH_CTRL;
  wire       [1:0]    _zz_decode_to_execute_BRANCH_CTRL_1;
  wire                decode_IS_RS2_SIGNED;
  wire                decode_IS_RS1_SIGNED;
  wire                decode_IS_DIV;
  wire                memory_IS_MUL;
  wire                execute_IS_MUL;
  wire                decode_IS_MUL;
  wire       [1:0]    _zz_execute_to_memory_SHIFT_CTRL;
  wire       [1:0]    _zz_execute_to_memory_SHIFT_CTRL_1;
  wire       [1:0]    decode_SHIFT_CTRL;
  wire       [1:0]    _zz_decode_SHIFT_CTRL;
  wire       [1:0]    _zz_decode_to_execute_SHIFT_CTRL;
  wire       [1:0]    _zz_decode_to_execute_SHIFT_CTRL_1;
  wire       [1:0]    decode_ALU_BITWISE_CTRL;
  wire       [1:0]    _zz_decode_ALU_BITWISE_CTRL;
  wire       [1:0]    _zz_decode_to_execute_ALU_BITWISE_CTRL;
  wire       [1:0]    _zz_decode_to_execute_ALU_BITWISE_CTRL_1;
  wire                decode_SRC_LESS_UNSIGNED;
  wire                decode_MEMORY_MANAGMENT;
  wire                memory_MEMORY_WR;
  wire                decode_MEMORY_WR;
  wire                execute_BYPASSABLE_MEMORY_STAGE;
  wire                decode_BYPASSABLE_MEMORY_STAGE;
  wire                decode_BYPASSABLE_EXECUTE_STAGE;
  wire       [1:0]    decode_SRC2_CTRL;
  wire       [1:0]    _zz_decode_SRC2_CTRL;
  wire       [1:0]    _zz_decode_to_execute_SRC2_CTRL;
  wire       [1:0]    _zz_decode_to_execute_SRC2_CTRL_1;
  wire       [1:0]    decode_ALU_CTRL;
  wire       [1:0]    _zz_decode_ALU_CTRL;
  wire       [1:0]    _zz_decode_to_execute_ALU_CTRL;
  wire       [1:0]    _zz_decode_to_execute_ALU_CTRL_1;
  wire       [1:0]    decode_SRC1_CTRL;
  wire       [1:0]    _zz_decode_SRC1_CTRL;
  wire       [1:0]    _zz_decode_to_execute_SRC1_CTRL;
  wire       [1:0]    _zz_decode_to_execute_SRC1_CTRL_1;
  wire                decode_MEMORY_FORCE_CONSTISTENCY;
  wire       [31:0]   writeBack_FORMAL_PC_NEXT;
  wire       [31:0]   memory_FORMAL_PC_NEXT;
  wire       [31:0]   execute_FORMAL_PC_NEXT;
  wire       [31:0]   decode_FORMAL_PC_NEXT;
  wire       [31:0]   memory_PC;
  wire                execute_DO_EBREAK;
  wire                decode_IS_EBREAK;
  wire                execute_CSR_READ_OPCODE;
  wire                execute_CSR_WRITE_OPCODE;
  wire                execute_IS_CSR;
  wire       [0:0]    memory_ENV_CTRL;
  wire       [0:0]    _zz_memory_ENV_CTRL;
  wire       [0:0]    execute_ENV_CTRL;
  wire       [0:0]    _zz_execute_ENV_CTRL;
  wire       [0:0]    writeBack_ENV_CTRL;
  wire       [0:0]    _zz_writeBack_ENV_CTRL;
  wire       [31:0]   memory_BRANCH_CALC;
  wire                memory_BRANCH_DO;
  wire       [31:0]   execute_PC;
  wire                execute_BRANCH_COND_RESULT;
  wire                execute_PREDICTION_HAD_BRANCHED2;
  wire       [1:0]    execute_BRANCH_CTRL;
  wire       [1:0]    _zz_execute_BRANCH_CTRL;
  wire                decode_RS2_USE;
  wire                decode_RS1_USE;
  reg        [31:0]   _zz_decode_RS2;
  wire                execute_REGFILE_WRITE_VALID;
  wire                execute_BYPASSABLE_EXECUTE_STAGE;
  wire                memory_REGFILE_WRITE_VALID;
  wire                memory_BYPASSABLE_MEMORY_STAGE;
  wire                writeBack_REGFILE_WRITE_VALID;
  reg        [31:0]   decode_RS2;
  reg        [31:0]   decode_RS1;
  wire                execute_IS_RS1_SIGNED;
  wire                execute_IS_DIV;
  wire                execute_IS_RS2_SIGNED;
  wire       [31:0]   memory_INSTRUCTION;
  wire                memory_IS_DIV;
  wire                writeBack_IS_MUL;
  wire       [33:0]   writeBack_MUL_HH;
  wire       [51:0]   writeBack_MUL_LOW;
  wire       [33:0]   memory_MUL_HL;
  wire       [33:0]   memory_MUL_LH;
  wire       [31:0]   memory_MUL_LL;
  (* keep , syn_keep *) wire       [31:0]   execute_RS1 /* synthesis syn_keep = 1 */ ;
  wire       [31:0]   memory_SHIFT_RIGHT;
  reg        [31:0]   _zz_decode_RS2_1;
  wire       [1:0]    memory_SHIFT_CTRL;
  wire       [1:0]    _zz_memory_SHIFT_CTRL;
  wire       [1:0]    execute_SHIFT_CTRL;
  wire       [1:0]    _zz_execute_SHIFT_CTRL;
  wire                execute_SRC_LESS_UNSIGNED;
  wire                execute_SRC2_FORCE_ZERO;
  wire                execute_SRC_USE_SUB_LESS;
  wire       [31:0]   _zz_execute_SRC2;
  wire       [1:0]    execute_SRC2_CTRL;
  wire       [1:0]    _zz_execute_SRC2_CTRL;
  wire                execute_IS_RVC;
  wire       [1:0]    execute_SRC1_CTRL;
  wire       [1:0]    _zz_execute_SRC1_CTRL;
  wire                decode_SRC_USE_SUB_LESS;
  wire                decode_SRC_ADD_ZERO;
  wire       [31:0]   execute_SRC_ADD_SUB;
  wire                execute_SRC_LESS;
  wire       [1:0]    execute_ALU_CTRL;
  wire       [1:0]    _zz_execute_ALU_CTRL;
  wire       [31:0]   execute_SRC2;
  wire       [31:0]   execute_SRC1;
  wire       [1:0]    execute_ALU_BITWISE_CTRL;
  wire       [1:0]    _zz_execute_ALU_BITWISE_CTRL;
  wire       [31:0]   _zz_lastStageRegFileWrite_payload_address;
  wire                _zz_lastStageRegFileWrite_valid;
  reg                 _zz_1;
  wire       [31:0]   decode_INSTRUCTION_ANTICIPATED;
  reg                 decode_REGFILE_WRITE_VALID;
  wire                decode_LEGAL_INSTRUCTION;
  wire       [0:0]    _zz_decode_ENV_CTRL_1;
  wire       [1:0]    _zz_decode_BRANCH_CTRL;
  wire       [1:0]    _zz_decode_SHIFT_CTRL_1;
  wire       [1:0]    _zz_decode_ALU_BITWISE_CTRL_1;
  wire       [1:0]    _zz_decode_SRC2_CTRL_1;
  wire       [1:0]    _zz_decode_ALU_CTRL_1;
  wire       [1:0]    _zz_decode_SRC1_CTRL_1;
  reg        [31:0]   _zz_decode_RS2_2;
  wire                writeBack_MEMORY_WR;
  wire       [31:0]   writeBack_MEMORY_STORE_DATA_RF;
  wire       [31:0]   writeBack_REGFILE_WRITE_DATA;
  wire                writeBack_MEMORY_ENABLE;
  wire       [31:0]   memory_REGFILE_WRITE_DATA;
  wire                memory_MEMORY_ENABLE;
  wire                execute_MEMORY_FORCE_CONSTISTENCY;
  wire                execute_MEMORY_MANAGMENT;
  (* keep , syn_keep *) wire       [31:0]   execute_RS2 /* synthesis syn_keep = 1 */ ;
  wire                execute_MEMORY_WR;
  wire       [31:0]   execute_SRC_ADD;
  wire                execute_MEMORY_ENABLE;
  wire       [31:0]   execute_INSTRUCTION;
  wire                decode_MEMORY_ENABLE;
  wire                decode_FLUSH_ALL;
  reg                 IBusCachedPlugin_rsp_issueDetected_4;
  reg                 IBusCachedPlugin_rsp_issueDetected_3;
  reg                 IBusCachedPlugin_rsp_issueDetected_2;
  reg                 IBusCachedPlugin_rsp_issueDetected_1;
  wire       [1:0]    decode_BRANCH_CTRL;
  wire       [1:0]    _zz_decode_BRANCH_CTRL_1;
  reg        [31:0]   _zz_memory_to_writeBack_FORMAL_PC_NEXT;
  reg        [31:0]   _zz_decode_to_execute_FORMAL_PC_NEXT;
  wire       [31:0]   decode_PC;
  wire       [31:0]   decode_INSTRUCTION;
  wire                decode_IS_RVC;
  wire       [31:0]   writeBack_PC;
  wire       [31:0]   writeBack_INSTRUCTION;
  reg                 decode_arbitration_haltItself;
  reg                 decode_arbitration_haltByOther;
  reg                 decode_arbitration_removeIt;
  wire                decode_arbitration_flushIt;
  reg                 decode_arbitration_flushNext;
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
  reg                 writeBack_arbitration_haltItself;
  wire                writeBack_arbitration_haltByOther;
  reg                 writeBack_arbitration_removeIt;
  reg                 writeBack_arbitration_flushIt;
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
  reg                 IBusCachedPlugin_fetcherHalt;
  reg                 IBusCachedPlugin_incomingInstruction;
  wire                IBusCachedPlugin_predictionJumpInterface_valid;
  (* keep , syn_keep *) wire       [31:0]   IBusCachedPlugin_predictionJumpInterface_payload /* synthesis syn_keep = 1 */ ;
  wire                IBusCachedPlugin_decodePrediction_cmd_hadBranch;
  wire                IBusCachedPlugin_decodePrediction_rsp_wasWrong;
  wire                IBusCachedPlugin_pcValids_0;
  wire                IBusCachedPlugin_pcValids_1;
  wire                IBusCachedPlugin_pcValids_2;
  wire                IBusCachedPlugin_pcValids_3;
  reg                 IBusCachedPlugin_decodeExceptionPort_valid;
  reg        [3:0]    IBusCachedPlugin_decodeExceptionPort_payload_code;
  wire       [31:0]   IBusCachedPlugin_decodeExceptionPort_payload_badAddr;
  wire                IBusCachedPlugin_mmuBus_cmd_0_isValid;
  wire                IBusCachedPlugin_mmuBus_cmd_0_isStuck;
  wire       [31:0]   IBusCachedPlugin_mmuBus_cmd_0_virtualAddress;
  wire                IBusCachedPlugin_mmuBus_cmd_0_bypassTranslation;
  wire       [31:0]   IBusCachedPlugin_mmuBus_rsp_physicalAddress;
  wire                IBusCachedPlugin_mmuBus_rsp_isIoAccess;
  wire                IBusCachedPlugin_mmuBus_rsp_isPaging;
  wire                IBusCachedPlugin_mmuBus_rsp_allowRead;
  wire                IBusCachedPlugin_mmuBus_rsp_allowWrite;
  wire                IBusCachedPlugin_mmuBus_rsp_allowExecute;
  wire                IBusCachedPlugin_mmuBus_rsp_exception;
  wire                IBusCachedPlugin_mmuBus_rsp_refilling;
  wire                IBusCachedPlugin_mmuBus_rsp_bypassTranslation;
  wire                IBusCachedPlugin_mmuBus_end;
  wire                IBusCachedPlugin_mmuBus_busy;
  wire                DBusCachedPlugin_mmuBus_cmd_0_isValid;
  wire                DBusCachedPlugin_mmuBus_cmd_0_isStuck;
  wire       [31:0]   DBusCachedPlugin_mmuBus_cmd_0_virtualAddress;
  wire                DBusCachedPlugin_mmuBus_cmd_0_bypassTranslation;
  wire       [31:0]   DBusCachedPlugin_mmuBus_rsp_physicalAddress;
  wire                DBusCachedPlugin_mmuBus_rsp_isIoAccess;
  wire                DBusCachedPlugin_mmuBus_rsp_isPaging;
  wire                DBusCachedPlugin_mmuBus_rsp_allowRead;
  wire                DBusCachedPlugin_mmuBus_rsp_allowWrite;
  wire                DBusCachedPlugin_mmuBus_rsp_allowExecute;
  wire                DBusCachedPlugin_mmuBus_rsp_exception;
  wire                DBusCachedPlugin_mmuBus_rsp_refilling;
  wire                DBusCachedPlugin_mmuBus_rsp_bypassTranslation;
  wire                DBusCachedPlugin_mmuBus_end;
  wire                DBusCachedPlugin_mmuBus_busy;
  reg                 DBusCachedPlugin_redoBranch_valid;
  wire       [31:0]   DBusCachedPlugin_redoBranch_payload;
  reg                 DBusCachedPlugin_exceptionBus_valid;
  reg        [3:0]    DBusCachedPlugin_exceptionBus_payload_code;
  wire       [31:0]   DBusCachedPlugin_exceptionBus_payload_badAddr;
  reg                 _zz_when_DBusCachedPlugin_l390;
  wire                decodeExceptionPort_valid;
  wire       [3:0]    decodeExceptionPort_payload_code;
  wire       [31:0]   decodeExceptionPort_payload_badAddr;
  wire                BranchPlugin_jumpInterface_valid;
  wire       [31:0]   BranchPlugin_jumpInterface_payload;
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
  reg                 IBusCachedPlugin_injectionPort_valid;
  reg                 IBusCachedPlugin_injectionPort_ready;
  wire       [31:0]   IBusCachedPlugin_injectionPort_payload;
  wire                IBusCachedPlugin_externalFlush;
  wire                IBusCachedPlugin_jump_pcLoad_valid;
  wire       [31:0]   IBusCachedPlugin_jump_pcLoad_payload;
  wire       [3:0]    _zz_IBusCachedPlugin_jump_pcLoad_payload;
  wire       [3:0]    _zz_IBusCachedPlugin_jump_pcLoad_payload_1;
  wire                _zz_IBusCachedPlugin_jump_pcLoad_payload_2;
  wire                _zz_IBusCachedPlugin_jump_pcLoad_payload_3;
  wire                _zz_IBusCachedPlugin_jump_pcLoad_payload_4;
  wire                IBusCachedPlugin_fetchPc_output_valid;
  wire                IBusCachedPlugin_fetchPc_output_ready;
  wire       [31:0]   IBusCachedPlugin_fetchPc_output_payload;
  reg        [31:0]   IBusCachedPlugin_fetchPc_pcReg /* verilator public */ ;
  reg                 IBusCachedPlugin_fetchPc_correction;
  reg                 IBusCachedPlugin_fetchPc_correctionReg;
  wire                IBusCachedPlugin_fetchPc_output_fire;
  wire                IBusCachedPlugin_fetchPc_corrected;
  reg                 IBusCachedPlugin_fetchPc_pcRegPropagate;
  reg                 IBusCachedPlugin_fetchPc_booted;
  reg                 IBusCachedPlugin_fetchPc_inc;
  wire                when_Fetcher_l131;
  wire                IBusCachedPlugin_fetchPc_output_fire_1;
  wire                when_Fetcher_l131_1;
  reg        [31:0]   IBusCachedPlugin_fetchPc_pc;
  wire                IBusCachedPlugin_fetchPc_redo_valid;
  reg        [31:0]   IBusCachedPlugin_fetchPc_redo_payload;
  reg                 IBusCachedPlugin_fetchPc_flushed;
  wire                when_Fetcher_l158;
  reg                 IBusCachedPlugin_decodePc_flushed;
  reg        [31:0]   IBusCachedPlugin_decodePc_pcReg /* verilator public */ ;
  wire       [31:0]   IBusCachedPlugin_decodePc_pcPlus;
  reg                 IBusCachedPlugin_decodePc_injectedDecode;
  wire                when_Fetcher_l180;
  wire                when_Fetcher_l192;
  reg                 IBusCachedPlugin_iBusRsp_redoFetch;
  wire                IBusCachedPlugin_iBusRsp_stages_0_input_valid;
  wire                IBusCachedPlugin_iBusRsp_stages_0_input_ready;
  wire       [31:0]   IBusCachedPlugin_iBusRsp_stages_0_input_payload;
  wire                IBusCachedPlugin_iBusRsp_stages_0_output_valid;
  wire                IBusCachedPlugin_iBusRsp_stages_0_output_ready;
  wire       [31:0]   IBusCachedPlugin_iBusRsp_stages_0_output_payload;
  reg                 IBusCachedPlugin_iBusRsp_stages_0_halt;
  wire                IBusCachedPlugin_iBusRsp_stages_1_input_valid;
  wire                IBusCachedPlugin_iBusRsp_stages_1_input_ready;
  wire       [31:0]   IBusCachedPlugin_iBusRsp_stages_1_input_payload;
  wire                IBusCachedPlugin_iBusRsp_stages_1_output_valid;
  wire                IBusCachedPlugin_iBusRsp_stages_1_output_ready;
  wire       [31:0]   IBusCachedPlugin_iBusRsp_stages_1_output_payload;
  reg                 IBusCachedPlugin_iBusRsp_stages_1_halt;
  wire                IBusCachedPlugin_iBusRsp_stages_2_input_valid;
  wire                IBusCachedPlugin_iBusRsp_stages_2_input_ready;
  wire       [31:0]   IBusCachedPlugin_iBusRsp_stages_2_input_payload;
  wire                IBusCachedPlugin_iBusRsp_stages_2_output_valid;
  wire                IBusCachedPlugin_iBusRsp_stages_2_output_ready;
  wire       [31:0]   IBusCachedPlugin_iBusRsp_stages_2_output_payload;
  reg                 IBusCachedPlugin_iBusRsp_stages_2_halt;
  wire                _zz_IBusCachedPlugin_iBusRsp_stages_0_input_ready;
  wire                _zz_IBusCachedPlugin_iBusRsp_stages_1_input_ready;
  wire                _zz_IBusCachedPlugin_iBusRsp_stages_2_input_ready;
  wire                IBusCachedPlugin_iBusRsp_flush;
  wire                _zz_IBusCachedPlugin_iBusRsp_stages_0_output_ready;
  wire                _zz_IBusCachedPlugin_iBusRsp_stages_0_output_ready_1;
  reg                 _zz_IBusCachedPlugin_iBusRsp_stages_0_output_ready_2;
  wire                IBusCachedPlugin_iBusRsp_stages_1_output_m2sPipe_valid;
  wire                IBusCachedPlugin_iBusRsp_stages_1_output_m2sPipe_ready;
  wire       [31:0]   IBusCachedPlugin_iBusRsp_stages_1_output_m2sPipe_payload;
  reg                 _zz_IBusCachedPlugin_iBusRsp_stages_1_output_m2sPipe_valid;
  reg        [31:0]   _zz_IBusCachedPlugin_iBusRsp_stages_1_output_m2sPipe_payload;
  reg                 IBusCachedPlugin_iBusRsp_readyForError;
  wire                IBusCachedPlugin_iBusRsp_output_valid;
  wire                IBusCachedPlugin_iBusRsp_output_ready;
  wire       [31:0]   IBusCachedPlugin_iBusRsp_output_payload_pc;
  wire                IBusCachedPlugin_iBusRsp_output_payload_rsp_error;
  wire       [31:0]   IBusCachedPlugin_iBusRsp_output_payload_rsp_inst;
  wire                IBusCachedPlugin_iBusRsp_output_payload_isRvc;
  wire                when_Fetcher_l240;
  wire                IBusCachedPlugin_decompressor_input_valid;
  wire                IBusCachedPlugin_decompressor_input_ready;
  wire       [31:0]   IBusCachedPlugin_decompressor_input_payload_pc;
  wire                IBusCachedPlugin_decompressor_input_payload_rsp_error;
  wire       [31:0]   IBusCachedPlugin_decompressor_input_payload_rsp_inst;
  wire                IBusCachedPlugin_decompressor_input_payload_isRvc;
  wire                IBusCachedPlugin_decompressor_output_valid;
  wire                IBusCachedPlugin_decompressor_output_ready;
  wire       [31:0]   IBusCachedPlugin_decompressor_output_payload_pc;
  wire                IBusCachedPlugin_decompressor_output_payload_rsp_error;
  wire       [31:0]   IBusCachedPlugin_decompressor_output_payload_rsp_inst;
  wire                IBusCachedPlugin_decompressor_output_payload_isRvc;
  wire                IBusCachedPlugin_decompressor_flushNext;
  wire                IBusCachedPlugin_decompressor_consumeCurrent;
  reg                 IBusCachedPlugin_decompressor_bufferValid;
  reg        [15:0]   IBusCachedPlugin_decompressor_bufferData;
  wire                IBusCachedPlugin_decompressor_isInputLowRvc;
  wire                IBusCachedPlugin_decompressor_isInputHighRvc;
  reg                 IBusCachedPlugin_decompressor_throw2BytesReg;
  wire                IBusCachedPlugin_decompressor_throw2Bytes;
  wire                IBusCachedPlugin_decompressor_unaligned;
  reg                 IBusCachedPlugin_decompressor_bufferValidLatch;
  reg                 IBusCachedPlugin_decompressor_throw2BytesLatch;
  wire                IBusCachedPlugin_decompressor_bufferValidPatched;
  wire                IBusCachedPlugin_decompressor_throw2BytesPatched;
  wire       [31:0]   IBusCachedPlugin_decompressor_raw;
  wire                IBusCachedPlugin_decompressor_isRvc;
  wire       [15:0]   _zz_IBusCachedPlugin_decompressor_decompressed;
  reg        [31:0]   IBusCachedPlugin_decompressor_decompressed;
  wire       [4:0]    _zz_IBusCachedPlugin_decompressor_decompressed_1;
  wire       [4:0]    _zz_IBusCachedPlugin_decompressor_decompressed_2;
  wire       [11:0]   _zz_IBusCachedPlugin_decompressor_decompressed_3;
  wire                _zz_IBusCachedPlugin_decompressor_decompressed_4;
  reg        [11:0]   _zz_IBusCachedPlugin_decompressor_decompressed_5;
  wire                _zz_IBusCachedPlugin_decompressor_decompressed_6;
  reg        [9:0]    _zz_IBusCachedPlugin_decompressor_decompressed_7;
  wire       [20:0]   _zz_IBusCachedPlugin_decompressor_decompressed_8;
  wire                _zz_IBusCachedPlugin_decompressor_decompressed_9;
  reg        [14:0]   _zz_IBusCachedPlugin_decompressor_decompressed_10;
  wire                _zz_IBusCachedPlugin_decompressor_decompressed_11;
  reg        [2:0]    _zz_IBusCachedPlugin_decompressor_decompressed_12;
  wire                _zz_IBusCachedPlugin_decompressor_decompressed_13;
  reg        [9:0]    _zz_IBusCachedPlugin_decompressor_decompressed_14;
  wire       [20:0]   _zz_IBusCachedPlugin_decompressor_decompressed_15;
  wire                _zz_IBusCachedPlugin_decompressor_decompressed_16;
  reg        [4:0]    _zz_IBusCachedPlugin_decompressor_decompressed_17;
  wire       [12:0]   _zz_IBusCachedPlugin_decompressor_decompressed_18;
  wire       [4:0]    _zz_IBusCachedPlugin_decompressor_decompressed_19;
  wire       [4:0]    _zz_IBusCachedPlugin_decompressor_decompressed_20;
  wire       [4:0]    _zz_IBusCachedPlugin_decompressor_decompressed_21;
  wire       [4:0]    switch_Misc_l44;
  wire                _zz_IBusCachedPlugin_decompressor_decompressed_22;
  wire       [1:0]    switch_Misc_l204;
  wire       [1:0]    switch_Misc_l204_1;
  reg        [2:0]    _zz_IBusCachedPlugin_decompressor_decompressed_23;
  reg        [2:0]    _zz_IBusCachedPlugin_decompressor_decompressed_24;
  wire                _zz_IBusCachedPlugin_decompressor_decompressed_25;
  reg        [6:0]    _zz_IBusCachedPlugin_decompressor_decompressed_26;
  wire                IBusCachedPlugin_decompressor_output_fire;
  wire                IBusCachedPlugin_decompressor_bufferFill;
  wire                when_Fetcher_l283;
  wire                when_Fetcher_l286;
  wire                when_Fetcher_l291;
  wire                IBusCachedPlugin_injector_decodeInput_valid;
  wire                IBusCachedPlugin_injector_decodeInput_ready;
  wire       [31:0]   IBusCachedPlugin_injector_decodeInput_payload_pc;
  wire                IBusCachedPlugin_injector_decodeInput_payload_rsp_error;
  wire       [31:0]   IBusCachedPlugin_injector_decodeInput_payload_rsp_inst;
  wire                IBusCachedPlugin_injector_decodeInput_payload_isRvc;
  reg                 _zz_IBusCachedPlugin_injector_decodeInput_valid;
  reg        [31:0]   _zz_IBusCachedPlugin_injector_decodeInput_payload_pc;
  reg                 _zz_IBusCachedPlugin_injector_decodeInput_payload_rsp_error;
  reg        [31:0]   _zz_IBusCachedPlugin_injector_decodeInput_payload_rsp_inst;
  reg                 _zz_IBusCachedPlugin_injector_decodeInput_payload_isRvc;
  reg                 IBusCachedPlugin_injector_nextPcCalc_valids_0;
  wire                when_Fetcher_l329;
  reg                 IBusCachedPlugin_injector_nextPcCalc_valids_1;
  wire                when_Fetcher_l329_1;
  reg                 IBusCachedPlugin_injector_nextPcCalc_valids_2;
  wire                when_Fetcher_l329_2;
  reg                 IBusCachedPlugin_injector_nextPcCalc_valids_3;
  wire                when_Fetcher_l329_3;
  reg        [31:0]   IBusCachedPlugin_injector_formal_rawInDecode;
  wire                _zz_IBusCachedPlugin_decodePrediction_cmd_hadBranch;
  reg        [18:0]   _zz_IBusCachedPlugin_decodePrediction_cmd_hadBranch_1;
  wire                _zz_IBusCachedPlugin_predictionJumpInterface_payload;
  reg        [10:0]   _zz_IBusCachedPlugin_predictionJumpInterface_payload_1;
  wire                _zz_IBusCachedPlugin_predictionJumpInterface_payload_2;
  reg        [18:0]   _zz_IBusCachedPlugin_predictionJumpInterface_payload_3;
  wire       [31:0]   _zz_IBusCachedPlugin_rspCounter;
  reg        [31:0]   IBusCachedPlugin_rspCounter;
  wire                IBusCachedPlugin_s0_tightlyCoupledHit;
  reg                 IBusCachedPlugin_s1_tightlyCoupledHit;
  reg                 IBusCachedPlugin_s2_tightlyCoupledHit;
  wire                IBusCachedPlugin_rsp_iBusRspOutputHalt;
  wire                IBusCachedPlugin_rsp_issueDetected;
  reg                 IBusCachedPlugin_rsp_redoFetch;
  wire                when_IBusCachedPlugin_l239;
  wire                when_IBusCachedPlugin_l244;
  wire                when_IBusCachedPlugin_l250;
  wire                when_IBusCachedPlugin_l256;
  wire                when_IBusCachedPlugin_l267;
  wire       [31:0]   _zz_DBusCachedPlugin_rspCounter;
  reg        [31:0]   DBusCachedPlugin_rspCounter;
  wire                when_DBusCachedPlugin_l307;
  wire       [1:0]    execute_DBusCachedPlugin_size;
  reg        [31:0]   _zz_execute_MEMORY_STORE_DATA_RF;
  wire                dataCache_1_io_cpu_flush_isStall;
  wire                when_DBusCachedPlugin_l347;
  wire                when_DBusCachedPlugin_l363;
  wire                when_DBusCachedPlugin_l390;
  wire                when_DBusCachedPlugin_l442;
  wire                when_DBusCachedPlugin_l462;
  wire       [7:0]    writeBack_DBusCachedPlugin_rspSplits_0;
  wire       [7:0]    writeBack_DBusCachedPlugin_rspSplits_1;
  wire       [7:0]    writeBack_DBusCachedPlugin_rspSplits_2;
  wire       [7:0]    writeBack_DBusCachedPlugin_rspSplits_3;
  reg        [31:0]   writeBack_DBusCachedPlugin_rspShifted;
  wire       [31:0]   writeBack_DBusCachedPlugin_rspRf;
  wire       [1:0]    switch_Misc_l204_2;
  wire                _zz_writeBack_DBusCachedPlugin_rspFormated;
  reg        [31:0]   _zz_writeBack_DBusCachedPlugin_rspFormated_1;
  wire                _zz_writeBack_DBusCachedPlugin_rspFormated_2;
  reg        [31:0]   _zz_writeBack_DBusCachedPlugin_rspFormated_3;
  reg        [31:0]   writeBack_DBusCachedPlugin_rspFormated;
  wire                when_DBusCachedPlugin_l488;
  wire       [31:0]   _zz_decode_ENV_CTRL_2;
  wire                _zz_decode_ENV_CTRL_3;
  wire                _zz_decode_ENV_CTRL_4;
  wire                _zz_decode_ENV_CTRL_5;
  wire                _zz_decode_ENV_CTRL_6;
  wire                _zz_decode_ENV_CTRL_7;
  wire       [1:0]    _zz_decode_SRC1_CTRL_2;
  wire       [1:0]    _zz_decode_ALU_CTRL_2;
  wire       [1:0]    _zz_decode_SRC2_CTRL_2;
  wire       [1:0]    _zz_decode_ALU_BITWISE_CTRL_2;
  wire       [1:0]    _zz_decode_SHIFT_CTRL_2;
  wire       [1:0]    _zz_decode_BRANCH_CTRL_2;
  wire       [0:0]    _zz_decode_ENV_CTRL_8;
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
  reg        [31:0]   _zz_execute_SRC1;
  wire                _zz_execute_SRC2_1;
  reg        [19:0]   _zz_execute_SRC2_2;
  wire                _zz_execute_SRC2_3;
  reg        [19:0]   _zz_execute_SRC2_4;
  reg        [31:0]   _zz_execute_SRC2_5;
  reg        [31:0]   execute_SrcPlugin_addSub;
  wire                execute_SrcPlugin_less;
  wire       [4:0]    execute_FullBarrelShifterPlugin_amplitude;
  reg        [31:0]   _zz_execute_FullBarrelShifterPlugin_reversed;
  wire       [31:0]   execute_FullBarrelShifterPlugin_reversed;
  reg        [31:0]   _zz_decode_RS2_3;
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
  wire       [2:0]    switch_Misc_l204_3;
  reg                 _zz_execute_BRANCH_COND_RESULT;
  reg                 _zz_execute_BRANCH_COND_RESULT_1;
  wire                execute_BranchPlugin_missAlignedTarget;
  reg        [31:0]   execute_BranchPlugin_branch_src1;
  reg        [31:0]   execute_BranchPlugin_branch_src2;
  wire                _zz_execute_BranchPlugin_branch_src2;
  reg        [19:0]   _zz_execute_BranchPlugin_branch_src2_1;
  wire                _zz_execute_BranchPlugin_branch_src2_2;
  reg        [10:0]   _zz_execute_BranchPlugin_branch_src2_3;
  wire                _zz_execute_BranchPlugin_branch_src2_4;
  reg        [18:0]   _zz_execute_BranchPlugin_branch_src2_5;
  wire       [31:0]   execute_BranchPlugin_branchAdder;
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
  reg                 CsrPlugin_exceptionPortCtrl_exceptionValids_decode;
  reg                 CsrPlugin_exceptionPortCtrl_exceptionValids_execute;
  reg                 CsrPlugin_exceptionPortCtrl_exceptionValids_memory;
  reg                 CsrPlugin_exceptionPortCtrl_exceptionValids_writeBack;
  reg                 CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_decode;
  reg                 CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_execute;
  reg                 CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_memory;
  reg                 CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_writeBack;
  reg        [3:0]    CsrPlugin_exceptionPortCtrl_exceptionContext_code;
  reg        [31:0]   CsrPlugin_exceptionPortCtrl_exceptionContext_badAddr;
  wire       [1:0]    CsrPlugin_exceptionPortCtrl_exceptionTargetPrivilegeUncapped;
  wire       [1:0]    CsrPlugin_exceptionPortCtrl_exceptionTargetPrivilege;
  wire       [1:0]    _zz_CsrPlugin_exceptionPortCtrl_exceptionContext_code;
  wire                _zz_CsrPlugin_exceptionPortCtrl_exceptionContext_code_1;
  wire                when_CsrPlugin_l909;
  wire                when_CsrPlugin_l909_1;
  wire                when_CsrPlugin_l909_2;
  wire                when_CsrPlugin_l909_3;
  wire                when_CsrPlugin_l922;
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
  wire                when_CsrPlugin_l991;
  wire                CsrPlugin_interruptJump /* verilator public */ ;
  reg                 CsrPlugin_hadException /* verilator public */ ;
  reg        [1:0]    CsrPlugin_targetPrivilege;
  reg        [3:0]    CsrPlugin_trapCause;
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
  wire                switch_Misc_l204_4;
  reg        [31:0]   _zz_CsrPlugin_csrMapping_writeDataSignal;
  wire                when_CsrPlugin_l1176;
  wire                when_CsrPlugin_l1180;
  wire       [11:0]   execute_CsrPlugin_csrAddress;
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
  wire       [5:0]    switch_DebugPlugin_l267;
  wire                when_DebugPlugin_l271;
  wire                when_DebugPlugin_l271_1;
  wire                when_DebugPlugin_l272;
  wire                when_DebugPlugin_l272_1;
  wire                when_DebugPlugin_l273;
  wire                when_DebugPlugin_l274;
  wire                when_DebugPlugin_l275;
  wire                when_DebugPlugin_l275_1;
  wire                when_DebugPlugin_l295;
  wire                when_DebugPlugin_l298;
  wire                when_DebugPlugin_l311;
  reg                 _zz_3;
  reg                 DebugPlugin_resetIt_regNext;
  wire                when_DebugPlugin_l327;
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
  reg                 decode_to_execute_IS_RVC;
  wire                when_Pipeline_l124_7;
  reg        [31:0]   decode_to_execute_FORMAL_PC_NEXT;
  wire                when_Pipeline_l124_8;
  reg        [31:0]   execute_to_memory_FORMAL_PC_NEXT;
  wire                when_Pipeline_l124_9;
  reg        [31:0]   memory_to_writeBack_FORMAL_PC_NEXT;
  wire                when_Pipeline_l124_10;
  reg                 decode_to_execute_MEMORY_FORCE_CONSTISTENCY;
  wire                when_Pipeline_l124_11;
  reg        [1:0]    decode_to_execute_SRC1_CTRL;
  wire                when_Pipeline_l124_12;
  reg                 decode_to_execute_SRC_USE_SUB_LESS;
  wire                when_Pipeline_l124_13;
  reg                 decode_to_execute_MEMORY_ENABLE;
  wire                when_Pipeline_l124_14;
  reg                 execute_to_memory_MEMORY_ENABLE;
  wire                when_Pipeline_l124_15;
  reg                 memory_to_writeBack_MEMORY_ENABLE;
  wire                when_Pipeline_l124_16;
  reg        [1:0]    decode_to_execute_ALU_CTRL;
  wire                when_Pipeline_l124_17;
  reg        [1:0]    decode_to_execute_SRC2_CTRL;
  wire                when_Pipeline_l124_18;
  reg                 decode_to_execute_REGFILE_WRITE_VALID;
  wire                when_Pipeline_l124_19;
  reg                 execute_to_memory_REGFILE_WRITE_VALID;
  wire                when_Pipeline_l124_20;
  reg                 memory_to_writeBack_REGFILE_WRITE_VALID;
  wire                when_Pipeline_l124_21;
  reg                 decode_to_execute_BYPASSABLE_EXECUTE_STAGE;
  wire                when_Pipeline_l124_22;
  reg                 decode_to_execute_BYPASSABLE_MEMORY_STAGE;
  wire                when_Pipeline_l124_23;
  reg                 execute_to_memory_BYPASSABLE_MEMORY_STAGE;
  wire                when_Pipeline_l124_24;
  reg                 decode_to_execute_MEMORY_WR;
  wire                when_Pipeline_l124_25;
  reg                 execute_to_memory_MEMORY_WR;
  wire                when_Pipeline_l124_26;
  reg                 memory_to_writeBack_MEMORY_WR;
  wire                when_Pipeline_l124_27;
  reg                 decode_to_execute_MEMORY_MANAGMENT;
  wire                when_Pipeline_l124_28;
  reg                 decode_to_execute_SRC_LESS_UNSIGNED;
  wire                when_Pipeline_l124_29;
  reg        [1:0]    decode_to_execute_ALU_BITWISE_CTRL;
  wire                when_Pipeline_l124_30;
  reg        [1:0]    decode_to_execute_SHIFT_CTRL;
  wire                when_Pipeline_l124_31;
  reg        [1:0]    execute_to_memory_SHIFT_CTRL;
  wire                when_Pipeline_l124_32;
  reg                 decode_to_execute_IS_MUL;
  wire                when_Pipeline_l124_33;
  reg                 execute_to_memory_IS_MUL;
  wire                when_Pipeline_l124_34;
  reg                 memory_to_writeBack_IS_MUL;
  wire                when_Pipeline_l124_35;
  reg                 decode_to_execute_IS_DIV;
  wire                when_Pipeline_l124_36;
  reg                 execute_to_memory_IS_DIV;
  wire                when_Pipeline_l124_37;
  reg                 decode_to_execute_IS_RS1_SIGNED;
  wire                when_Pipeline_l124_38;
  reg                 decode_to_execute_IS_RS2_SIGNED;
  wire                when_Pipeline_l124_39;
  reg        [1:0]    decode_to_execute_BRANCH_CTRL;
  wire                when_Pipeline_l124_40;
  reg                 decode_to_execute_IS_CSR;
  wire                when_Pipeline_l124_41;
  reg        [0:0]    decode_to_execute_ENV_CTRL;
  wire                when_Pipeline_l124_42;
  reg        [0:0]    execute_to_memory_ENV_CTRL;
  wire                when_Pipeline_l124_43;
  reg        [0:0]    memory_to_writeBack_ENV_CTRL;
  wire                when_Pipeline_l124_44;
  reg        [31:0]   decode_to_execute_RS1;
  wire                when_Pipeline_l124_45;
  reg        [31:0]   decode_to_execute_RS2;
  wire                when_Pipeline_l124_46;
  reg                 decode_to_execute_SRC2_FORCE_ZERO;
  wire                when_Pipeline_l124_47;
  reg                 decode_to_execute_PREDICTION_HAD_BRANCHED2;
  wire                when_Pipeline_l124_48;
  reg                 decode_to_execute_CSR_WRITE_OPCODE;
  wire                when_Pipeline_l124_49;
  reg                 decode_to_execute_CSR_READ_OPCODE;
  wire                when_Pipeline_l124_50;
  reg                 decode_to_execute_DO_EBREAK;
  wire                when_Pipeline_l124_51;
  reg        [31:0]   execute_to_memory_MEMORY_STORE_DATA_RF;
  wire                when_Pipeline_l124_52;
  reg        [31:0]   memory_to_writeBack_MEMORY_STORE_DATA_RF;
  wire                when_Pipeline_l124_53;
  reg        [31:0]   execute_to_memory_REGFILE_WRITE_DATA;
  wire                when_Pipeline_l124_54;
  reg        [31:0]   memory_to_writeBack_REGFILE_WRITE_DATA;
  wire                when_Pipeline_l124_55;
  reg        [31:0]   execute_to_memory_SHIFT_RIGHT;
  wire                when_Pipeline_l124_56;
  reg        [31:0]   execute_to_memory_MUL_LL;
  wire                when_Pipeline_l124_57;
  reg        [33:0]   execute_to_memory_MUL_LH;
  wire                when_Pipeline_l124_58;
  reg        [33:0]   execute_to_memory_MUL_HL;
  wire                when_Pipeline_l124_59;
  reg        [33:0]   execute_to_memory_MUL_HH;
  wire                when_Pipeline_l124_60;
  reg        [33:0]   memory_to_writeBack_MUL_HH;
  wire                when_Pipeline_l124_61;
  reg                 execute_to_memory_BRANCH_DO;
  wire                when_Pipeline_l124_62;
  reg        [31:0]   execute_to_memory_BRANCH_CALC;
  wire                when_Pipeline_l124_63;
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
  reg                 execute_CsrPlugin_csr_833;
  wire                when_CsrPlugin_l1264_5;
  reg                 execute_CsrPlugin_csr_834;
  wire                when_CsrPlugin_l1264_6;
  reg                 execute_CsrPlugin_csr_835;
  wire                when_CsrPlugin_l1264_7;
  reg                 execute_CsrPlugin_csr_2816;
  wire                when_CsrPlugin_l1264_8;
  reg                 execute_CsrPlugin_csr_2944;
  wire                when_CsrPlugin_l1264_9;
  reg                 execute_CsrPlugin_csr_2818;
  wire                when_CsrPlugin_l1264_10;
  reg                 execute_CsrPlugin_csr_2946;
  wire                when_CsrPlugin_l1264_11;
  reg                 execute_CsrPlugin_csr_3072;
  wire                when_CsrPlugin_l1264_12;
  reg                 execute_CsrPlugin_csr_3200;
  wire                when_CsrPlugin_l1264_13;
  reg                 execute_CsrPlugin_csr_3074;
  wire                when_CsrPlugin_l1264_14;
  reg                 execute_CsrPlugin_csr_3202;
  reg        [31:0]   _zz_CsrPlugin_csrMapping_readDataInit;
  reg        [31:0]   _zz_CsrPlugin_csrMapping_readDataInit_1;
  reg        [31:0]   _zz_CsrPlugin_csrMapping_readDataInit_2;
  reg        [31:0]   _zz_CsrPlugin_csrMapping_readDataInit_3;
  reg        [31:0]   _zz_CsrPlugin_csrMapping_readDataInit_4;
  reg        [31:0]   _zz_CsrPlugin_csrMapping_readDataInit_5;
  reg        [31:0]   _zz_CsrPlugin_csrMapping_readDataInit_6;
  reg        [31:0]   _zz_CsrPlugin_csrMapping_readDataInit_7;
  reg        [31:0]   _zz_CsrPlugin_csrMapping_readDataInit_8;
  reg        [31:0]   _zz_CsrPlugin_csrMapping_readDataInit_9;
  reg        [31:0]   _zz_CsrPlugin_csrMapping_readDataInit_10;
  reg        [31:0]   _zz_CsrPlugin_csrMapping_readDataInit_11;
  reg        [31:0]   _zz_CsrPlugin_csrMapping_readDataInit_12;
  reg        [31:0]   _zz_CsrPlugin_csrMapping_readDataInit_13;
  reg        [31:0]   _zz_CsrPlugin_csrMapping_readDataInit_14;
  wire                when_CsrPlugin_l1297;
  wire                when_CsrPlugin_l1302;
  `ifndef SYNTHESIS
  reg [31:0] _zz_memory_to_writeBack_ENV_CTRL_string;
  reg [31:0] _zz_memory_to_writeBack_ENV_CTRL_1_string;
  reg [31:0] _zz_execute_to_memory_ENV_CTRL_string;
  reg [31:0] _zz_execute_to_memory_ENV_CTRL_1_string;
  reg [31:0] decode_ENV_CTRL_string;
  reg [31:0] _zz_decode_ENV_CTRL_string;
  reg [31:0] _zz_decode_to_execute_ENV_CTRL_string;
  reg [31:0] _zz_decode_to_execute_ENV_CTRL_1_string;
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
  reg [23:0] decode_SRC2_CTRL_string;
  reg [23:0] _zz_decode_SRC2_CTRL_string;
  reg [23:0] _zz_decode_to_execute_SRC2_CTRL_string;
  reg [23:0] _zz_decode_to_execute_SRC2_CTRL_1_string;
  reg [63:0] decode_ALU_CTRL_string;
  reg [63:0] _zz_decode_ALU_CTRL_string;
  reg [63:0] _zz_decode_to_execute_ALU_CTRL_string;
  reg [63:0] _zz_decode_to_execute_ALU_CTRL_1_string;
  reg [95:0] decode_SRC1_CTRL_string;
  reg [95:0] _zz_decode_SRC1_CTRL_string;
  reg [95:0] _zz_decode_to_execute_SRC1_CTRL_string;
  reg [95:0] _zz_decode_to_execute_SRC1_CTRL_1_string;
  reg [31:0] memory_ENV_CTRL_string;
  reg [31:0] _zz_memory_ENV_CTRL_string;
  reg [31:0] execute_ENV_CTRL_string;
  reg [31:0] _zz_execute_ENV_CTRL_string;
  reg [31:0] writeBack_ENV_CTRL_string;
  reg [31:0] _zz_writeBack_ENV_CTRL_string;
  reg [31:0] execute_BRANCH_CTRL_string;
  reg [31:0] _zz_execute_BRANCH_CTRL_string;
  reg [71:0] memory_SHIFT_CTRL_string;
  reg [71:0] _zz_memory_SHIFT_CTRL_string;
  reg [71:0] execute_SHIFT_CTRL_string;
  reg [71:0] _zz_execute_SHIFT_CTRL_string;
  reg [23:0] execute_SRC2_CTRL_string;
  reg [23:0] _zz_execute_SRC2_CTRL_string;
  reg [95:0] execute_SRC1_CTRL_string;
  reg [95:0] _zz_execute_SRC1_CTRL_string;
  reg [63:0] execute_ALU_CTRL_string;
  reg [63:0] _zz_execute_ALU_CTRL_string;
  reg [39:0] execute_ALU_BITWISE_CTRL_string;
  reg [39:0] _zz_execute_ALU_BITWISE_CTRL_string;
  reg [31:0] _zz_decode_ENV_CTRL_1_string;
  reg [31:0] _zz_decode_BRANCH_CTRL_string;
  reg [71:0] _zz_decode_SHIFT_CTRL_1_string;
  reg [39:0] _zz_decode_ALU_BITWISE_CTRL_1_string;
  reg [23:0] _zz_decode_SRC2_CTRL_1_string;
  reg [63:0] _zz_decode_ALU_CTRL_1_string;
  reg [95:0] _zz_decode_SRC1_CTRL_1_string;
  reg [31:0] decode_BRANCH_CTRL_string;
  reg [31:0] _zz_decode_BRANCH_CTRL_1_string;
  reg [95:0] _zz_decode_SRC1_CTRL_2_string;
  reg [63:0] _zz_decode_ALU_CTRL_2_string;
  reg [23:0] _zz_decode_SRC2_CTRL_2_string;
  reg [39:0] _zz_decode_ALU_BITWISE_CTRL_2_string;
  reg [71:0] _zz_decode_SHIFT_CTRL_2_string;
  reg [31:0] _zz_decode_BRANCH_CTRL_2_string;
  reg [31:0] _zz_decode_ENV_CTRL_8_string;
  reg [95:0] decode_to_execute_SRC1_CTRL_string;
  reg [63:0] decode_to_execute_ALU_CTRL_string;
  reg [23:0] decode_to_execute_SRC2_CTRL_string;
  reg [39:0] decode_to_execute_ALU_BITWISE_CTRL_string;
  reg [71:0] decode_to_execute_SHIFT_CTRL_string;
  reg [71:0] execute_to_memory_SHIFT_CTRL_string;
  reg [31:0] decode_to_execute_BRANCH_CTRL_string;
  reg [31:0] decode_to_execute_ENV_CTRL_string;
  reg [31:0] execute_to_memory_ENV_CTRL_string;
  reg [31:0] memory_to_writeBack_ENV_CTRL_string;
  `endif

  reg [31:0] RegFilePlugin_regFile [0:31] /* verilator public */ ;

  assign _zz_when = ({decodeExceptionPort_valid,IBusCachedPlugin_decodeExceptionPort_valid} != 2'b00);
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
  assign _zz_execute_SHIFT_RIGHT_2 = {((execute_SHIFT_CTRL == ShiftCtrlEnum_SRA_1) && execute_FullBarrelShifterPlugin_reversed[31]),execute_FullBarrelShifterPlugin_reversed};
  assign _zz_decode_FORMAL_PC_NEXT_1 = (decode_IS_RVC ? 3'b010 : 3'b100);
  assign _zz_decode_FORMAL_PC_NEXT = {29'd0, _zz_decode_FORMAL_PC_NEXT_1};
  assign _zz__zz_IBusCachedPlugin_jump_pcLoad_payload_1 = (_zz_IBusCachedPlugin_jump_pcLoad_payload - 4'b0001);
  assign _zz_IBusCachedPlugin_fetchPc_pc_1 = {IBusCachedPlugin_fetchPc_inc,2'b00};
  assign _zz_IBusCachedPlugin_fetchPc_pc = {29'd0, _zz_IBusCachedPlugin_fetchPc_pc_1};
  assign _zz_IBusCachedPlugin_decodePc_pcPlus_1 = (decode_IS_RVC ? 3'b010 : 3'b100);
  assign _zz_IBusCachedPlugin_decodePc_pcPlus = {29'd0, _zz_IBusCachedPlugin_decodePc_pcPlus_1};
  assign _zz_IBusCachedPlugin_decompressor_decompressed_27 = {{_zz_IBusCachedPlugin_decompressor_decompressed_10,_zz_IBusCachedPlugin_decompressor_decompressed[6 : 2]},12'h0};
  assign _zz_IBusCachedPlugin_decompressor_decompressed_34 = {{{4'b0000,_zz_IBusCachedPlugin_decompressor_decompressed[8 : 7]},_zz_IBusCachedPlugin_decompressor_decompressed[12 : 9]},2'b00};
  assign _zz_IBusCachedPlugin_decompressor_decompressed_35 = {{{4'b0000,_zz_IBusCachedPlugin_decompressor_decompressed[8 : 7]},_zz_IBusCachedPlugin_decompressor_decompressed[12 : 9]},2'b00};
  assign _zz__zz_IBusCachedPlugin_decodePrediction_cmd_hadBranch = {{{decode_INSTRUCTION[31],decode_INSTRUCTION[7]},decode_INSTRUCTION[30 : 25]},decode_INSTRUCTION[11 : 8]};
  assign _zz_IBusCachedPlugin_decodePrediction_cmd_hadBranch_2 = {{_zz_IBusCachedPlugin_decodePrediction_cmd_hadBranch_1,{{{decode_INSTRUCTION[31],decode_INSTRUCTION[7]},decode_INSTRUCTION[30 : 25]},decode_INSTRUCTION[11 : 8]}},1'b0};
  assign _zz__zz_IBusCachedPlugin_predictionJumpInterface_payload = {{{decode_INSTRUCTION[31],decode_INSTRUCTION[19 : 12]},decode_INSTRUCTION[20]},decode_INSTRUCTION[30 : 21]};
  assign _zz__zz_IBusCachedPlugin_predictionJumpInterface_payload_2 = {{{decode_INSTRUCTION[31],decode_INSTRUCTION[7]},decode_INSTRUCTION[30 : 25]},decode_INSTRUCTION[11 : 8]};
  assign _zz_DBusCachedPlugin_exceptionBus_payload_code = (writeBack_MEMORY_WR ? 3'b111 : 3'b101);
  assign _zz_DBusCachedPlugin_exceptionBus_payload_code_1 = (writeBack_MEMORY_WR ? 3'b110 : 3'b100);
  assign _zz__zz_execute_REGFILE_WRITE_DATA = execute_SRC_LESS;
  assign _zz__zz_execute_SRC1 = (execute_IS_RVC ? 3'b010 : 3'b100);
  assign _zz__zz_execute_SRC1_1 = execute_INSTRUCTION[19 : 15];
  assign _zz__zz_execute_SRC2_3 = {execute_INSTRUCTION[31 : 25],execute_INSTRUCTION[11 : 7]};
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
  assign _zz__zz_execute_BranchPlugin_branch_src2_2 = {{{execute_INSTRUCTION[31],execute_INSTRUCTION[19 : 12]},execute_INSTRUCTION[20]},execute_INSTRUCTION[30 : 21]};
  assign _zz__zz_execute_BranchPlugin_branch_src2_4 = {{{execute_INSTRUCTION[31],execute_INSTRUCTION[7]},execute_INSTRUCTION[30 : 25]},execute_INSTRUCTION[11 : 8]};
  assign _zz_execute_BranchPlugin_branch_src2_9 = (execute_IS_RVC ? 3'b010 : 3'b100);
  assign _zz__zz_CsrPlugin_exceptionPortCtrl_exceptionContext_code_1 = (_zz_CsrPlugin_exceptionPortCtrl_exceptionContext_code & (~ _zz__zz_CsrPlugin_exceptionPortCtrl_exceptionContext_code_1_1));
  assign _zz__zz_CsrPlugin_exceptionPortCtrl_exceptionContext_code_1_1 = (_zz_CsrPlugin_exceptionPortCtrl_exceptionContext_code - 2'b01);
  assign _zz_CsrPlugin_jumpInterface_payload = (CsrPlugin_xtvec_base + _zz_CsrPlugin_jumpInterface_payload_1);
  assign _zz_CsrPlugin_jumpInterface_payload_1 = {26'd0, CsrPlugin_trapCause};
  assign _zz_decode_RegFilePlugin_rs1Data = 1'b1;
  assign _zz_decode_RegFilePlugin_rs2Data = 1'b1;
  assign _zz_IBusCachedPlugin_jump_pcLoad_payload_6 = {_zz_IBusCachedPlugin_jump_pcLoad_payload_4,_zz_IBusCachedPlugin_jump_pcLoad_payload_3};
  assign _zz_writeBack_DBusCachedPlugin_rspShifted_1 = dataCache_1_io_cpu_writeBack_address[1 : 0];
  assign _zz_writeBack_DBusCachedPlugin_rspShifted_3 = dataCache_1_io_cpu_writeBack_address[1 : 1];
  assign _zz_decode_LEGAL_INSTRUCTION = 32'h0000107f;
  assign _zz_decode_LEGAL_INSTRUCTION_1 = (decode_INSTRUCTION & 32'h0000207f);
  assign _zz_decode_LEGAL_INSTRUCTION_2 = 32'h00002073;
  assign _zz_decode_LEGAL_INSTRUCTION_3 = ((decode_INSTRUCTION & 32'h0000407f) == 32'h00004063);
  assign _zz_decode_LEGAL_INSTRUCTION_4 = ((decode_INSTRUCTION & 32'h0000207f) == 32'h00002013);
  assign _zz_decode_LEGAL_INSTRUCTION_5 = {((decode_INSTRUCTION & 32'h0000603f) == 32'h00000023),{((decode_INSTRUCTION & 32'h0000207f) == 32'h00000003),{((decode_INSTRUCTION & _zz_decode_LEGAL_INSTRUCTION_6) == 32'h00000003),{(_zz_decode_LEGAL_INSTRUCTION_7 == _zz_decode_LEGAL_INSTRUCTION_8),{_zz_decode_LEGAL_INSTRUCTION_9,{_zz_decode_LEGAL_INSTRUCTION_10,_zz_decode_LEGAL_INSTRUCTION_11}}}}}};
  assign _zz_decode_LEGAL_INSTRUCTION_6 = 32'h0000505f;
  assign _zz_decode_LEGAL_INSTRUCTION_7 = (decode_INSTRUCTION & 32'h0000707b);
  assign _zz_decode_LEGAL_INSTRUCTION_8 = 32'h00000063;
  assign _zz_decode_LEGAL_INSTRUCTION_9 = ((decode_INSTRUCTION & 32'h0000607f) == 32'h0000000f);
  assign _zz_decode_LEGAL_INSTRUCTION_10 = ((decode_INSTRUCTION & 32'hfc00007f) == 32'h00000033);
  assign _zz_decode_LEGAL_INSTRUCTION_11 = {((decode_INSTRUCTION & 32'h01f0707f) == 32'h0000500f),{((decode_INSTRUCTION & 32'hbc00707f) == 32'h00005013),{((decode_INSTRUCTION & _zz_decode_LEGAL_INSTRUCTION_12) == 32'h00001013),{(_zz_decode_LEGAL_INSTRUCTION_13 == _zz_decode_LEGAL_INSTRUCTION_14),{_zz_decode_LEGAL_INSTRUCTION_15,{_zz_decode_LEGAL_INSTRUCTION_16,_zz_decode_LEGAL_INSTRUCTION_17}}}}}};
  assign _zz_decode_LEGAL_INSTRUCTION_12 = 32'hfc00307f;
  assign _zz_decode_LEGAL_INSTRUCTION_13 = (decode_INSTRUCTION & 32'hbe00707f);
  assign _zz_decode_LEGAL_INSTRUCTION_14 = 32'h00005033;
  assign _zz_decode_LEGAL_INSTRUCTION_15 = ((decode_INSTRUCTION & 32'hbe00707f) == 32'h00000033);
  assign _zz_decode_LEGAL_INSTRUCTION_16 = ((decode_INSTRUCTION & 32'hdfffffff) == 32'h10200073);
  assign _zz_decode_LEGAL_INSTRUCTION_17 = ((decode_INSTRUCTION & 32'hffffffff) == 32'h00100073);
  assign _zz_IBusCachedPlugin_decompressor_decompressed_28 = (_zz_IBusCachedPlugin_decompressor_decompressed[11 : 10] == 2'b01);
  assign _zz_IBusCachedPlugin_decompressor_decompressed_29 = ((_zz_IBusCachedPlugin_decompressor_decompressed[11 : 10] == 2'b11) && (_zz_IBusCachedPlugin_decompressor_decompressed[6 : 5] == 2'b00));
  assign _zz_IBusCachedPlugin_decompressor_decompressed_30 = 7'h0;
  assign _zz_IBusCachedPlugin_decompressor_decompressed_31 = _zz_IBusCachedPlugin_decompressor_decompressed[6 : 2];
  assign _zz_IBusCachedPlugin_decompressor_decompressed_32 = _zz_IBusCachedPlugin_decompressor_decompressed[12];
  assign _zz_IBusCachedPlugin_decompressor_decompressed_33 = _zz_IBusCachedPlugin_decompressor_decompressed[11 : 7];
  assign _zz_IBusCachedPlugin_predictionJumpInterface_payload_4 = decode_INSTRUCTION[31];
  assign _zz_IBusCachedPlugin_predictionJumpInterface_payload_5 = decode_INSTRUCTION[19 : 12];
  assign _zz_IBusCachedPlugin_predictionJumpInterface_payload_6 = decode_INSTRUCTION[20];
  assign _zz_IBusCachedPlugin_predictionJumpInterface_payload_7 = decode_INSTRUCTION[31];
  assign _zz_IBusCachedPlugin_predictionJumpInterface_payload_8 = decode_INSTRUCTION[7];
  assign _zz__zz_decode_ENV_CTRL_2 = 32'h00103050;
  assign _zz__zz_decode_ENV_CTRL_2_1 = ((decode_INSTRUCTION & 32'h00001050) == 32'h00001050);
  assign _zz__zz_decode_ENV_CTRL_2_2 = ((decode_INSTRUCTION & 32'h00002050) == 32'h00002050);
  assign _zz__zz_decode_ENV_CTRL_2_3 = _zz_decode_ENV_CTRL_6;
  assign _zz__zz_decode_ENV_CTRL_2_4 = ((decode_INSTRUCTION & 32'h0000001c) == 32'h00000004);
  assign _zz__zz_decode_ENV_CTRL_2_5 = ((decode_INSTRUCTION & 32'h00000058) == 32'h00000040);
  assign _zz__zz_decode_ENV_CTRL_2_6 = (|_zz_decode_ENV_CTRL_7);
  assign _zz__zz_decode_ENV_CTRL_2_7 = (|_zz_decode_ENV_CTRL_7);
  assign _zz__zz_decode_ENV_CTRL_2_8 = {(|_zz__zz_decode_ENV_CTRL_2_9),{(|_zz__zz_decode_ENV_CTRL_2_10),{_zz__zz_decode_ENV_CTRL_2_11,{_zz__zz_decode_ENV_CTRL_2_16,_zz__zz_decode_ENV_CTRL_2_22}}}};
  assign _zz__zz_decode_ENV_CTRL_2_9 = ((decode_INSTRUCTION & 32'h02004064) == 32'h02004020);
  assign _zz__zz_decode_ENV_CTRL_2_10 = ((decode_INSTRUCTION & 32'h02004074) == 32'h02000030);
  assign _zz__zz_decode_ENV_CTRL_2_11 = (|{(_zz__zz_decode_ENV_CTRL_2_12 == _zz__zz_decode_ENV_CTRL_2_13),(_zz__zz_decode_ENV_CTRL_2_14 == _zz__zz_decode_ENV_CTRL_2_15)});
  assign _zz__zz_decode_ENV_CTRL_2_16 = (|{_zz__zz_decode_ENV_CTRL_2_17,{_zz__zz_decode_ENV_CTRL_2_18,_zz__zz_decode_ENV_CTRL_2_20}});
  assign _zz__zz_decode_ENV_CTRL_2_22 = {(|_zz__zz_decode_ENV_CTRL_2_23),{(|_zz__zz_decode_ENV_CTRL_2_24),{_zz__zz_decode_ENV_CTRL_2_26,{_zz__zz_decode_ENV_CTRL_2_29,_zz__zz_decode_ENV_CTRL_2_32}}}};
  assign _zz__zz_decode_ENV_CTRL_2_12 = (decode_INSTRUCTION & 32'h00007034);
  assign _zz__zz_decode_ENV_CTRL_2_13 = 32'h00005010;
  assign _zz__zz_decode_ENV_CTRL_2_14 = (decode_INSTRUCTION & 32'h02007064);
  assign _zz__zz_decode_ENV_CTRL_2_15 = 32'h00005020;
  assign _zz__zz_decode_ENV_CTRL_2_17 = ((decode_INSTRUCTION & 32'h40003054) == 32'h40001010);
  assign _zz__zz_decode_ENV_CTRL_2_18 = ((decode_INSTRUCTION & _zz__zz_decode_ENV_CTRL_2_19) == 32'h00001010);
  assign _zz__zz_decode_ENV_CTRL_2_20 = ((decode_INSTRUCTION & _zz__zz_decode_ENV_CTRL_2_21) == 32'h00001010);
  assign _zz__zz_decode_ENV_CTRL_2_23 = ((decode_INSTRUCTION & 32'h00000064) == 32'h00000024);
  assign _zz__zz_decode_ENV_CTRL_2_24 = ((decode_INSTRUCTION & _zz__zz_decode_ENV_CTRL_2_25) == 32'h00001000);
  assign _zz__zz_decode_ENV_CTRL_2_26 = (|(_zz__zz_decode_ENV_CTRL_2_27 == _zz__zz_decode_ENV_CTRL_2_28));
  assign _zz__zz_decode_ENV_CTRL_2_29 = (|{_zz__zz_decode_ENV_CTRL_2_30,_zz__zz_decode_ENV_CTRL_2_31});
  assign _zz__zz_decode_ENV_CTRL_2_32 = {(|_zz__zz_decode_ENV_CTRL_2_33),{_zz__zz_decode_ENV_CTRL_2_34,{_zz__zz_decode_ENV_CTRL_2_39,_zz__zz_decode_ENV_CTRL_2_44}}};
  assign _zz__zz_decode_ENV_CTRL_2_19 = 32'h00007034;
  assign _zz__zz_decode_ENV_CTRL_2_21 = 32'h02007054;
  assign _zz__zz_decode_ENV_CTRL_2_25 = 32'h00001000;
  assign _zz__zz_decode_ENV_CTRL_2_27 = (decode_INSTRUCTION & 32'h00003000);
  assign _zz__zz_decode_ENV_CTRL_2_28 = 32'h00002000;
  assign _zz__zz_decode_ENV_CTRL_2_30 = ((decode_INSTRUCTION & 32'h00002010) == 32'h00002000);
  assign _zz__zz_decode_ENV_CTRL_2_31 = ((decode_INSTRUCTION & 32'h00005000) == 32'h00001000);
  assign _zz__zz_decode_ENV_CTRL_2_33 = ((decode_INSTRUCTION & 32'h00004048) == 32'h00004008);
  assign _zz__zz_decode_ENV_CTRL_2_34 = (|{(_zz__zz_decode_ENV_CTRL_2_35 == _zz__zz_decode_ENV_CTRL_2_36),(_zz__zz_decode_ENV_CTRL_2_37 == _zz__zz_decode_ENV_CTRL_2_38)});
  assign _zz__zz_decode_ENV_CTRL_2_39 = (|{_zz__zz_decode_ENV_CTRL_2_40,{_zz__zz_decode_ENV_CTRL_2_41,_zz__zz_decode_ENV_CTRL_2_42}});
  assign _zz__zz_decode_ENV_CTRL_2_44 = {(|_zz__zz_decode_ENV_CTRL_2_45),{(|_zz__zz_decode_ENV_CTRL_2_46),{_zz__zz_decode_ENV_CTRL_2_57,{_zz__zz_decode_ENV_CTRL_2_70,_zz__zz_decode_ENV_CTRL_2_84}}}};
  assign _zz__zz_decode_ENV_CTRL_2_35 = (decode_INSTRUCTION & 32'h00000034);
  assign _zz__zz_decode_ENV_CTRL_2_36 = 32'h00000020;
  assign _zz__zz_decode_ENV_CTRL_2_37 = (decode_INSTRUCTION & 32'h00000064);
  assign _zz__zz_decode_ENV_CTRL_2_38 = 32'h00000020;
  assign _zz__zz_decode_ENV_CTRL_2_40 = ((decode_INSTRUCTION & 32'h00000050) == 32'h00000040);
  assign _zz__zz_decode_ENV_CTRL_2_41 = _zz_decode_ENV_CTRL_4;
  assign _zz__zz_decode_ENV_CTRL_2_42 = ((decode_INSTRUCTION & _zz__zz_decode_ENV_CTRL_2_43) == 32'h00000040);
  assign _zz__zz_decode_ENV_CTRL_2_45 = ((decode_INSTRUCTION & 32'h00000020) == 32'h00000020);
  assign _zz__zz_decode_ENV_CTRL_2_46 = {(_zz__zz_decode_ENV_CTRL_2_47 == _zz__zz_decode_ENV_CTRL_2_48),{_zz_decode_ENV_CTRL_5,{_zz__zz_decode_ENV_CTRL_2_49,_zz__zz_decode_ENV_CTRL_2_52}}};
  assign _zz__zz_decode_ENV_CTRL_2_57 = (|{_zz_decode_ENV_CTRL_5,{_zz__zz_decode_ENV_CTRL_2_58,_zz__zz_decode_ENV_CTRL_2_61}});
  assign _zz__zz_decode_ENV_CTRL_2_70 = (|{_zz__zz_decode_ENV_CTRL_2_71,_zz__zz_decode_ENV_CTRL_2_72});
  assign _zz__zz_decode_ENV_CTRL_2_84 = {(|_zz__zz_decode_ENV_CTRL_2_85),{_zz__zz_decode_ENV_CTRL_2_88,{_zz__zz_decode_ENV_CTRL_2_93,_zz__zz_decode_ENV_CTRL_2_97}}};
  assign _zz__zz_decode_ENV_CTRL_2_43 = 32'h00103040;
  assign _zz__zz_decode_ENV_CTRL_2_47 = (decode_INSTRUCTION & 32'h00000040);
  assign _zz__zz_decode_ENV_CTRL_2_48 = 32'h00000040;
  assign _zz__zz_decode_ENV_CTRL_2_49 = (_zz__zz_decode_ENV_CTRL_2_50 == _zz__zz_decode_ENV_CTRL_2_51);
  assign _zz__zz_decode_ENV_CTRL_2_52 = {_zz__zz_decode_ENV_CTRL_2_53,_zz__zz_decode_ENV_CTRL_2_55};
  assign _zz__zz_decode_ENV_CTRL_2_58 = (_zz__zz_decode_ENV_CTRL_2_59 == _zz__zz_decode_ENV_CTRL_2_60);
  assign _zz__zz_decode_ENV_CTRL_2_61 = {_zz__zz_decode_ENV_CTRL_2_62,{_zz__zz_decode_ENV_CTRL_2_64,_zz__zz_decode_ENV_CTRL_2_67}};
  assign _zz__zz_decode_ENV_CTRL_2_71 = _zz_decode_ENV_CTRL_6;
  assign _zz__zz_decode_ENV_CTRL_2_72 = {_zz__zz_decode_ENV_CTRL_2_73,{_zz__zz_decode_ENV_CTRL_2_75,_zz__zz_decode_ENV_CTRL_2_78}};
  assign _zz__zz_decode_ENV_CTRL_2_85 = {_zz_decode_ENV_CTRL_5,_zz__zz_decode_ENV_CTRL_2_86};
  assign _zz__zz_decode_ENV_CTRL_2_88 = (|{_zz__zz_decode_ENV_CTRL_2_89,_zz__zz_decode_ENV_CTRL_2_90});
  assign _zz__zz_decode_ENV_CTRL_2_93 = (|_zz__zz_decode_ENV_CTRL_2_94);
  assign _zz__zz_decode_ENV_CTRL_2_97 = {_zz__zz_decode_ENV_CTRL_2_98,{_zz__zz_decode_ENV_CTRL_2_100,_zz__zz_decode_ENV_CTRL_2_108}};
  assign _zz__zz_decode_ENV_CTRL_2_50 = (decode_INSTRUCTION & 32'h00004020);
  assign _zz__zz_decode_ENV_CTRL_2_51 = 32'h00004020;
  assign _zz__zz_decode_ENV_CTRL_2_53 = ((decode_INSTRUCTION & _zz__zz_decode_ENV_CTRL_2_54) == 32'h00000010);
  assign _zz__zz_decode_ENV_CTRL_2_55 = ((decode_INSTRUCTION & _zz__zz_decode_ENV_CTRL_2_56) == 32'h00000020);
  assign _zz__zz_decode_ENV_CTRL_2_59 = (decode_INSTRUCTION & 32'h00002030);
  assign _zz__zz_decode_ENV_CTRL_2_60 = 32'h00002010;
  assign _zz__zz_decode_ENV_CTRL_2_62 = ((decode_INSTRUCTION & _zz__zz_decode_ENV_CTRL_2_63) == 32'h00000010);
  assign _zz__zz_decode_ENV_CTRL_2_64 = (_zz__zz_decode_ENV_CTRL_2_65 == _zz__zz_decode_ENV_CTRL_2_66);
  assign _zz__zz_decode_ENV_CTRL_2_67 = (_zz__zz_decode_ENV_CTRL_2_68 == _zz__zz_decode_ENV_CTRL_2_69);
  assign _zz__zz_decode_ENV_CTRL_2_73 = ((decode_INSTRUCTION & _zz__zz_decode_ENV_CTRL_2_74) == 32'h00001010);
  assign _zz__zz_decode_ENV_CTRL_2_75 = (_zz__zz_decode_ENV_CTRL_2_76 == _zz__zz_decode_ENV_CTRL_2_77);
  assign _zz__zz_decode_ENV_CTRL_2_78 = {_zz__zz_decode_ENV_CTRL_2_79,{_zz__zz_decode_ENV_CTRL_2_80,_zz__zz_decode_ENV_CTRL_2_82}};
  assign _zz__zz_decode_ENV_CTRL_2_86 = ((decode_INSTRUCTION & _zz__zz_decode_ENV_CTRL_2_87) == 32'h00000020);
  assign _zz__zz_decode_ENV_CTRL_2_89 = _zz_decode_ENV_CTRL_5;
  assign _zz__zz_decode_ENV_CTRL_2_90 = (_zz__zz_decode_ENV_CTRL_2_91 == _zz__zz_decode_ENV_CTRL_2_92);
  assign _zz__zz_decode_ENV_CTRL_2_94 = (_zz__zz_decode_ENV_CTRL_2_95 == _zz__zz_decode_ENV_CTRL_2_96);
  assign _zz__zz_decode_ENV_CTRL_2_98 = (|_zz__zz_decode_ENV_CTRL_2_99);
  assign _zz__zz_decode_ENV_CTRL_2_100 = (|_zz__zz_decode_ENV_CTRL_2_101);
  assign _zz__zz_decode_ENV_CTRL_2_108 = {_zz__zz_decode_ENV_CTRL_2_109,{_zz__zz_decode_ENV_CTRL_2_112,_zz__zz_decode_ENV_CTRL_2_120}};
  assign _zz__zz_decode_ENV_CTRL_2_54 = 32'h00000030;
  assign _zz__zz_decode_ENV_CTRL_2_56 = 32'h02000020;
  assign _zz__zz_decode_ENV_CTRL_2_63 = 32'h00001030;
  assign _zz__zz_decode_ENV_CTRL_2_65 = (decode_INSTRUCTION & 32'h02002060);
  assign _zz__zz_decode_ENV_CTRL_2_66 = 32'h00002020;
  assign _zz__zz_decode_ENV_CTRL_2_68 = (decode_INSTRUCTION & 32'h02003020);
  assign _zz__zz_decode_ENV_CTRL_2_69 = 32'h00000020;
  assign _zz__zz_decode_ENV_CTRL_2_74 = 32'h00001010;
  assign _zz__zz_decode_ENV_CTRL_2_76 = (decode_INSTRUCTION & 32'h00002010);
  assign _zz__zz_decode_ENV_CTRL_2_77 = 32'h00002010;
  assign _zz__zz_decode_ENV_CTRL_2_79 = ((decode_INSTRUCTION & 32'h00000050) == 32'h00000010);
  assign _zz__zz_decode_ENV_CTRL_2_80 = ((decode_INSTRUCTION & _zz__zz_decode_ENV_CTRL_2_81) == 32'h00000004);
  assign _zz__zz_decode_ENV_CTRL_2_82 = ((decode_INSTRUCTION & _zz__zz_decode_ENV_CTRL_2_83) == 32'h0);
  assign _zz__zz_decode_ENV_CTRL_2_87 = 32'h00000070;
  assign _zz__zz_decode_ENV_CTRL_2_91 = (decode_INSTRUCTION & 32'h00000020);
  assign _zz__zz_decode_ENV_CTRL_2_92 = 32'h0;
  assign _zz__zz_decode_ENV_CTRL_2_95 = (decode_INSTRUCTION & 32'h00004014);
  assign _zz__zz_decode_ENV_CTRL_2_96 = 32'h00004010;
  assign _zz__zz_decode_ENV_CTRL_2_99 = ((decode_INSTRUCTION & 32'h00006014) == 32'h00002010);
  assign _zz__zz_decode_ENV_CTRL_2_101 = {(_zz__zz_decode_ENV_CTRL_2_102 == _zz__zz_decode_ENV_CTRL_2_103),{_zz_decode_ENV_CTRL_4,{_zz__zz_decode_ENV_CTRL_2_104,_zz__zz_decode_ENV_CTRL_2_106}}};
  assign _zz__zz_decode_ENV_CTRL_2_109 = (|(_zz__zz_decode_ENV_CTRL_2_110 == _zz__zz_decode_ENV_CTRL_2_111));
  assign _zz__zz_decode_ENV_CTRL_2_112 = (|{_zz__zz_decode_ENV_CTRL_2_113,_zz__zz_decode_ENV_CTRL_2_115});
  assign _zz__zz_decode_ENV_CTRL_2_120 = {(|_zz__zz_decode_ENV_CTRL_2_121),{_zz__zz_decode_ENV_CTRL_2_124,_zz__zz_decode_ENV_CTRL_2_126}};
  assign _zz__zz_decode_ENV_CTRL_2_81 = 32'h0000000c;
  assign _zz__zz_decode_ENV_CTRL_2_83 = 32'h00000028;
  assign _zz__zz_decode_ENV_CTRL_2_102 = (decode_INSTRUCTION & 32'h00000044);
  assign _zz__zz_decode_ENV_CTRL_2_103 = 32'h0;
  assign _zz__zz_decode_ENV_CTRL_2_104 = ((decode_INSTRUCTION & _zz__zz_decode_ENV_CTRL_2_105) == 32'h00002000);
  assign _zz__zz_decode_ENV_CTRL_2_106 = ((decode_INSTRUCTION & _zz__zz_decode_ENV_CTRL_2_107) == 32'h00001000);
  assign _zz__zz_decode_ENV_CTRL_2_110 = (decode_INSTRUCTION & 32'h00000058);
  assign _zz__zz_decode_ENV_CTRL_2_111 = 32'h0;
  assign _zz__zz_decode_ENV_CTRL_2_113 = ((decode_INSTRUCTION & _zz__zz_decode_ENV_CTRL_2_114) == 32'h00000040);
  assign _zz__zz_decode_ENV_CTRL_2_115 = {(_zz__zz_decode_ENV_CTRL_2_116 == _zz__zz_decode_ENV_CTRL_2_117),(_zz__zz_decode_ENV_CTRL_2_118 == _zz__zz_decode_ENV_CTRL_2_119)};
  assign _zz__zz_decode_ENV_CTRL_2_121 = {(_zz__zz_decode_ENV_CTRL_2_122 == _zz__zz_decode_ENV_CTRL_2_123),_zz_decode_ENV_CTRL_3};
  assign _zz__zz_decode_ENV_CTRL_2_124 = (|{_zz__zz_decode_ENV_CTRL_2_125,_zz_decode_ENV_CTRL_3});
  assign _zz__zz_decode_ENV_CTRL_2_126 = (|(_zz__zz_decode_ENV_CTRL_2_127 == _zz__zz_decode_ENV_CTRL_2_128));
  assign _zz__zz_decode_ENV_CTRL_2_105 = 32'h00006004;
  assign _zz__zz_decode_ENV_CTRL_2_107 = 32'h00005004;
  assign _zz__zz_decode_ENV_CTRL_2_114 = 32'h00000044;
  assign _zz__zz_decode_ENV_CTRL_2_116 = (decode_INSTRUCTION & 32'h00002014);
  assign _zz__zz_decode_ENV_CTRL_2_117 = 32'h00002010;
  assign _zz__zz_decode_ENV_CTRL_2_118 = (decode_INSTRUCTION & 32'h40000034);
  assign _zz__zz_decode_ENV_CTRL_2_119 = 32'h40000030;
  assign _zz__zz_decode_ENV_CTRL_2_122 = (decode_INSTRUCTION & 32'h00000014);
  assign _zz__zz_decode_ENV_CTRL_2_123 = 32'h00000004;
  assign _zz__zz_decode_ENV_CTRL_2_125 = ((decode_INSTRUCTION & 32'h00000044) == 32'h00000004);
  assign _zz__zz_decode_ENV_CTRL_2_127 = (decode_INSTRUCTION & 32'h00005048);
  assign _zz__zz_decode_ENV_CTRL_2_128 = 32'h00001008;
  assign _zz_execute_BranchPlugin_branch_src2_6 = execute_INSTRUCTION[31];
  assign _zz_execute_BranchPlugin_branch_src2_7 = execute_INSTRUCTION[31];
  assign _zz_execute_BranchPlugin_branch_src2_8 = execute_INSTRUCTION[7];
  always @(posedge axiClk) begin
    if(_zz_decode_RegFilePlugin_rs1Data) begin
      _zz_RegFilePlugin_regFile_port0 <= RegFilePlugin_regFile[decode_RegFilePlugin_regFileReadAddress1];
    end
  end

  always @(posedge axiClk) begin
    if(_zz_decode_RegFilePlugin_rs2Data) begin
      _zz_RegFilePlugin_regFile_port1 <= RegFilePlugin_regFile[decode_RegFilePlugin_regFileReadAddress2];
    end
  end

  always @(posedge axiClk) begin
    if(_zz_1) begin
      RegFilePlugin_regFile[lastStageRegFileWrite_payload_address] <= lastStageRegFileWrite_payload_data;
    end
  end

  InstructionCache IBusCachedPlugin_cache (
    .io_flush                                 (IBusCachedPlugin_cache_io_flush                             ), //i
    .io_cpu_prefetch_isValid                  (IBusCachedPlugin_cache_io_cpu_prefetch_isValid              ), //i
    .io_cpu_prefetch_haltIt                   (IBusCachedPlugin_cache_io_cpu_prefetch_haltIt               ), //o
    .io_cpu_prefetch_pc                       (IBusCachedPlugin_iBusRsp_stages_0_input_payload[31:0]       ), //i
    .io_cpu_fetch_isValid                     (IBusCachedPlugin_cache_io_cpu_fetch_isValid                 ), //i
    .io_cpu_fetch_isStuck                     (IBusCachedPlugin_cache_io_cpu_fetch_isStuck                 ), //i
    .io_cpu_fetch_isRemoved                   (IBusCachedPlugin_cache_io_cpu_fetch_isRemoved               ), //i
    .io_cpu_fetch_pc                          (IBusCachedPlugin_iBusRsp_stages_1_input_payload[31:0]       ), //i
    .io_cpu_fetch_data                        (IBusCachedPlugin_cache_io_cpu_fetch_data[31:0]              ), //o
    .io_cpu_fetch_mmuRsp_physicalAddress      (IBusCachedPlugin_mmuBus_rsp_physicalAddress[31:0]           ), //i
    .io_cpu_fetch_mmuRsp_isIoAccess           (IBusCachedPlugin_mmuBus_rsp_isIoAccess                      ), //i
    .io_cpu_fetch_mmuRsp_isPaging             (IBusCachedPlugin_mmuBus_rsp_isPaging                        ), //i
    .io_cpu_fetch_mmuRsp_allowRead            (IBusCachedPlugin_mmuBus_rsp_allowRead                       ), //i
    .io_cpu_fetch_mmuRsp_allowWrite           (IBusCachedPlugin_mmuBus_rsp_allowWrite                      ), //i
    .io_cpu_fetch_mmuRsp_allowExecute         (IBusCachedPlugin_mmuBus_rsp_allowExecute                    ), //i
    .io_cpu_fetch_mmuRsp_exception            (IBusCachedPlugin_mmuBus_rsp_exception                       ), //i
    .io_cpu_fetch_mmuRsp_refilling            (IBusCachedPlugin_mmuBus_rsp_refilling                       ), //i
    .io_cpu_fetch_mmuRsp_bypassTranslation    (IBusCachedPlugin_mmuBus_rsp_bypassTranslation               ), //i
    .io_cpu_fetch_physicalAddress             (IBusCachedPlugin_cache_io_cpu_fetch_physicalAddress[31:0]   ), //o
    .io_cpu_decode_isValid                    (IBusCachedPlugin_cache_io_cpu_decode_isValid                ), //i
    .io_cpu_decode_isStuck                    (IBusCachedPlugin_cache_io_cpu_decode_isStuck                ), //i
    .io_cpu_decode_pc                         (IBusCachedPlugin_iBusRsp_stages_2_input_payload[31:0]       ), //i
    .io_cpu_decode_physicalAddress            (IBusCachedPlugin_cache_io_cpu_decode_physicalAddress[31:0]  ), //o
    .io_cpu_decode_data                       (IBusCachedPlugin_cache_io_cpu_decode_data[31:0]             ), //o
    .io_cpu_decode_cacheMiss                  (IBusCachedPlugin_cache_io_cpu_decode_cacheMiss              ), //o
    .io_cpu_decode_error                      (IBusCachedPlugin_cache_io_cpu_decode_error                  ), //o
    .io_cpu_decode_mmuRefilling               (IBusCachedPlugin_cache_io_cpu_decode_mmuRefilling           ), //o
    .io_cpu_decode_mmuException               (IBusCachedPlugin_cache_io_cpu_decode_mmuException           ), //o
    .io_cpu_decode_isUser                     (IBusCachedPlugin_cache_io_cpu_decode_isUser                 ), //i
    .io_cpu_fill_valid                        (IBusCachedPlugin_cache_io_cpu_fill_valid                    ), //i
    .io_cpu_fill_payload                      (IBusCachedPlugin_cache_io_cpu_decode_physicalAddress[31:0]  ), //i
    .io_mem_cmd_valid                         (IBusCachedPlugin_cache_io_mem_cmd_valid                     ), //o
    .io_mem_cmd_ready                         (iBus_cmd_ready                                              ), //i
    .io_mem_cmd_payload_address               (IBusCachedPlugin_cache_io_mem_cmd_payload_address[31:0]     ), //o
    .io_mem_cmd_payload_size                  (IBusCachedPlugin_cache_io_mem_cmd_payload_size[2:0]         ), //o
    .io_mem_rsp_valid                         (iBus_rsp_valid                                              ), //i
    .io_mem_rsp_payload_data                  (iBus_rsp_payload_data[31:0]                                 ), //i
    .io_mem_rsp_payload_error                 (iBus_rsp_payload_error                                      ), //i
    .axiClk                                   (axiClk                                                      ), //i
    .resetCtrl_axiReset                       (resetCtrl_axiReset                                          )  //i
  );
  DataCache dataCache_1 (
    .io_cpu_execute_isValid                    (dataCache_1_io_cpu_execute_isValid                 ), //i
    .io_cpu_execute_address                    (dataCache_1_io_cpu_execute_address[31:0]           ), //i
    .io_cpu_execute_haltIt                     (dataCache_1_io_cpu_execute_haltIt                  ), //o
    .io_cpu_execute_args_wr                    (execute_MEMORY_WR                                  ), //i
    .io_cpu_execute_args_size                  (execute_DBusCachedPlugin_size[1:0]                 ), //i
    .io_cpu_execute_args_totalyConsistent      (execute_MEMORY_FORCE_CONSTISTENCY                  ), //i
    .io_cpu_execute_refilling                  (dataCache_1_io_cpu_execute_refilling               ), //o
    .io_cpu_memory_isValid                     (dataCache_1_io_cpu_memory_isValid                  ), //i
    .io_cpu_memory_isStuck                     (memory_arbitration_isStuck                         ), //i
    .io_cpu_memory_isWrite                     (dataCache_1_io_cpu_memory_isWrite                  ), //o
    .io_cpu_memory_address                     (dataCache_1_io_cpu_memory_address[31:0]            ), //i
    .io_cpu_memory_mmuRsp_physicalAddress      (DBusCachedPlugin_mmuBus_rsp_physicalAddress[31:0]  ), //i
    .io_cpu_memory_mmuRsp_isIoAccess           (dataCache_1_io_cpu_memory_mmuRsp_isIoAccess        ), //i
    .io_cpu_memory_mmuRsp_isPaging             (DBusCachedPlugin_mmuBus_rsp_isPaging               ), //i
    .io_cpu_memory_mmuRsp_allowRead            (DBusCachedPlugin_mmuBus_rsp_allowRead              ), //i
    .io_cpu_memory_mmuRsp_allowWrite           (DBusCachedPlugin_mmuBus_rsp_allowWrite             ), //i
    .io_cpu_memory_mmuRsp_allowExecute         (DBusCachedPlugin_mmuBus_rsp_allowExecute           ), //i
    .io_cpu_memory_mmuRsp_exception            (DBusCachedPlugin_mmuBus_rsp_exception              ), //i
    .io_cpu_memory_mmuRsp_refilling            (DBusCachedPlugin_mmuBus_rsp_refilling              ), //i
    .io_cpu_memory_mmuRsp_bypassTranslation    (DBusCachedPlugin_mmuBus_rsp_bypassTranslation      ), //i
    .io_cpu_writeBack_isValid                  (dataCache_1_io_cpu_writeBack_isValid               ), //i
    .io_cpu_writeBack_isStuck                  (writeBack_arbitration_isStuck                      ), //i
    .io_cpu_writeBack_isUser                   (dataCache_1_io_cpu_writeBack_isUser                ), //i
    .io_cpu_writeBack_haltIt                   (dataCache_1_io_cpu_writeBack_haltIt                ), //o
    .io_cpu_writeBack_isWrite                  (dataCache_1_io_cpu_writeBack_isWrite               ), //o
    .io_cpu_writeBack_storeData                (dataCache_1_io_cpu_writeBack_storeData[31:0]       ), //i
    .io_cpu_writeBack_data                     (dataCache_1_io_cpu_writeBack_data[31:0]            ), //o
    .io_cpu_writeBack_address                  (dataCache_1_io_cpu_writeBack_address[31:0]         ), //i
    .io_cpu_writeBack_mmuException             (dataCache_1_io_cpu_writeBack_mmuException          ), //o
    .io_cpu_writeBack_unalignedAccess          (dataCache_1_io_cpu_writeBack_unalignedAccess       ), //o
    .io_cpu_writeBack_accessError              (dataCache_1_io_cpu_writeBack_accessError           ), //o
    .io_cpu_writeBack_keepMemRspData           (dataCache_1_io_cpu_writeBack_keepMemRspData        ), //o
    .io_cpu_writeBack_fence_SW                 (dataCache_1_io_cpu_writeBack_fence_SW              ), //i
    .io_cpu_writeBack_fence_SR                 (dataCache_1_io_cpu_writeBack_fence_SR              ), //i
    .io_cpu_writeBack_fence_SO                 (dataCache_1_io_cpu_writeBack_fence_SO              ), //i
    .io_cpu_writeBack_fence_SI                 (dataCache_1_io_cpu_writeBack_fence_SI              ), //i
    .io_cpu_writeBack_fence_PW                 (dataCache_1_io_cpu_writeBack_fence_PW              ), //i
    .io_cpu_writeBack_fence_PR                 (dataCache_1_io_cpu_writeBack_fence_PR              ), //i
    .io_cpu_writeBack_fence_PO                 (dataCache_1_io_cpu_writeBack_fence_PO              ), //i
    .io_cpu_writeBack_fence_PI                 (dataCache_1_io_cpu_writeBack_fence_PI              ), //i
    .io_cpu_writeBack_fence_FM                 (dataCache_1_io_cpu_writeBack_fence_FM[3:0]         ), //i
    .io_cpu_writeBack_exclusiveOk              (dataCache_1_io_cpu_writeBack_exclusiveOk           ), //o
    .io_cpu_redo                               (dataCache_1_io_cpu_redo                            ), //o
    .io_cpu_flush_valid                        (dataCache_1_io_cpu_flush_valid                     ), //i
    .io_cpu_flush_ready                        (dataCache_1_io_cpu_flush_ready                     ), //o
    .io_mem_cmd_valid                          (dataCache_1_io_mem_cmd_valid                       ), //o
    .io_mem_cmd_ready                          (dBus_cmd_ready                                     ), //i
    .io_mem_cmd_payload_wr                     (dataCache_1_io_mem_cmd_payload_wr                  ), //o
    .io_mem_cmd_payload_uncached               (dataCache_1_io_mem_cmd_payload_uncached            ), //o
    .io_mem_cmd_payload_address                (dataCache_1_io_mem_cmd_payload_address[31:0]       ), //o
    .io_mem_cmd_payload_data                   (dataCache_1_io_mem_cmd_payload_data[31:0]          ), //o
    .io_mem_cmd_payload_mask                   (dataCache_1_io_mem_cmd_payload_mask[3:0]           ), //o
    .io_mem_cmd_payload_size                   (dataCache_1_io_mem_cmd_payload_size[2:0]           ), //o
    .io_mem_cmd_payload_last                   (dataCache_1_io_mem_cmd_payload_last                ), //o
    .io_mem_rsp_valid                          (dBus_rsp_valid                                     ), //i
    .io_mem_rsp_payload_last                   (dBus_rsp_payload_last                              ), //i
    .io_mem_rsp_payload_data                   (dBus_rsp_payload_data[31:0]                        ), //i
    .io_mem_rsp_payload_error                  (dBus_rsp_payload_error                             ), //i
    .axiClk                                    (axiClk                                             ), //i
    .resetCtrl_axiReset                        (resetCtrl_axiReset                                 )  //i
  );
  always @(*) begin
    case(_zz_IBusCachedPlugin_jump_pcLoad_payload_6)
      2'b00 : begin
        _zz_IBusCachedPlugin_jump_pcLoad_payload_5 = DBusCachedPlugin_redoBranch_payload;
      end
      2'b01 : begin
        _zz_IBusCachedPlugin_jump_pcLoad_payload_5 = CsrPlugin_jumpInterface_payload;
      end
      2'b10 : begin
        _zz_IBusCachedPlugin_jump_pcLoad_payload_5 = BranchPlugin_jumpInterface_payload;
      end
      default : begin
        _zz_IBusCachedPlugin_jump_pcLoad_payload_5 = IBusCachedPlugin_predictionJumpInterface_payload;
      end
    endcase
  end

  always @(*) begin
    case(_zz_writeBack_DBusCachedPlugin_rspShifted_1)
      2'b00 : begin
        _zz_writeBack_DBusCachedPlugin_rspShifted = writeBack_DBusCachedPlugin_rspSplits_0;
      end
      2'b01 : begin
        _zz_writeBack_DBusCachedPlugin_rspShifted = writeBack_DBusCachedPlugin_rspSplits_1;
      end
      2'b10 : begin
        _zz_writeBack_DBusCachedPlugin_rspShifted = writeBack_DBusCachedPlugin_rspSplits_2;
      end
      default : begin
        _zz_writeBack_DBusCachedPlugin_rspShifted = writeBack_DBusCachedPlugin_rspSplits_3;
      end
    endcase
  end

  always @(*) begin
    case(_zz_writeBack_DBusCachedPlugin_rspShifted_3)
      1'b0 : begin
        _zz_writeBack_DBusCachedPlugin_rspShifted_2 = writeBack_DBusCachedPlugin_rspSplits_1;
      end
      default : begin
        _zz_writeBack_DBusCachedPlugin_rspShifted_2 = writeBack_DBusCachedPlugin_rspSplits_3;
      end
    endcase
  end

  `ifndef SYNTHESIS
  always @(*) begin
    case(_zz_memory_to_writeBack_ENV_CTRL)
      EnvCtrlEnum_NONE : _zz_memory_to_writeBack_ENV_CTRL_string = "NONE";
      EnvCtrlEnum_XRET : _zz_memory_to_writeBack_ENV_CTRL_string = "XRET";
      default : _zz_memory_to_writeBack_ENV_CTRL_string = "????";
    endcase
  end
  always @(*) begin
    case(_zz_memory_to_writeBack_ENV_CTRL_1)
      EnvCtrlEnum_NONE : _zz_memory_to_writeBack_ENV_CTRL_1_string = "NONE";
      EnvCtrlEnum_XRET : _zz_memory_to_writeBack_ENV_CTRL_1_string = "XRET";
      default : _zz_memory_to_writeBack_ENV_CTRL_1_string = "????";
    endcase
  end
  always @(*) begin
    case(_zz_execute_to_memory_ENV_CTRL)
      EnvCtrlEnum_NONE : _zz_execute_to_memory_ENV_CTRL_string = "NONE";
      EnvCtrlEnum_XRET : _zz_execute_to_memory_ENV_CTRL_string = "XRET";
      default : _zz_execute_to_memory_ENV_CTRL_string = "????";
    endcase
  end
  always @(*) begin
    case(_zz_execute_to_memory_ENV_CTRL_1)
      EnvCtrlEnum_NONE : _zz_execute_to_memory_ENV_CTRL_1_string = "NONE";
      EnvCtrlEnum_XRET : _zz_execute_to_memory_ENV_CTRL_1_string = "XRET";
      default : _zz_execute_to_memory_ENV_CTRL_1_string = "????";
    endcase
  end
  always @(*) begin
    case(decode_ENV_CTRL)
      EnvCtrlEnum_NONE : decode_ENV_CTRL_string = "NONE";
      EnvCtrlEnum_XRET : decode_ENV_CTRL_string = "XRET";
      default : decode_ENV_CTRL_string = "????";
    endcase
  end
  always @(*) begin
    case(_zz_decode_ENV_CTRL)
      EnvCtrlEnum_NONE : _zz_decode_ENV_CTRL_string = "NONE";
      EnvCtrlEnum_XRET : _zz_decode_ENV_CTRL_string = "XRET";
      default : _zz_decode_ENV_CTRL_string = "????";
    endcase
  end
  always @(*) begin
    case(_zz_decode_to_execute_ENV_CTRL)
      EnvCtrlEnum_NONE : _zz_decode_to_execute_ENV_CTRL_string = "NONE";
      EnvCtrlEnum_XRET : _zz_decode_to_execute_ENV_CTRL_string = "XRET";
      default : _zz_decode_to_execute_ENV_CTRL_string = "????";
    endcase
  end
  always @(*) begin
    case(_zz_decode_to_execute_ENV_CTRL_1)
      EnvCtrlEnum_NONE : _zz_decode_to_execute_ENV_CTRL_1_string = "NONE";
      EnvCtrlEnum_XRET : _zz_decode_to_execute_ENV_CTRL_1_string = "XRET";
      default : _zz_decode_to_execute_ENV_CTRL_1_string = "????";
    endcase
  end
  always @(*) begin
    case(_zz_decode_to_execute_BRANCH_CTRL)
      BranchCtrlEnum_INC : _zz_decode_to_execute_BRANCH_CTRL_string = "INC ";
      BranchCtrlEnum_B : _zz_decode_to_execute_BRANCH_CTRL_string = "B   ";
      BranchCtrlEnum_JAL : _zz_decode_to_execute_BRANCH_CTRL_string = "JAL ";
      BranchCtrlEnum_JALR : _zz_decode_to_execute_BRANCH_CTRL_string = "JALR";
      default : _zz_decode_to_execute_BRANCH_CTRL_string = "????";
    endcase
  end
  always @(*) begin
    case(_zz_decode_to_execute_BRANCH_CTRL_1)
      BranchCtrlEnum_INC : _zz_decode_to_execute_BRANCH_CTRL_1_string = "INC ";
      BranchCtrlEnum_B : _zz_decode_to_execute_BRANCH_CTRL_1_string = "B   ";
      BranchCtrlEnum_JAL : _zz_decode_to_execute_BRANCH_CTRL_1_string = "JAL ";
      BranchCtrlEnum_JALR : _zz_decode_to_execute_BRANCH_CTRL_1_string = "JALR";
      default : _zz_decode_to_execute_BRANCH_CTRL_1_string = "????";
    endcase
  end
  always @(*) begin
    case(_zz_execute_to_memory_SHIFT_CTRL)
      ShiftCtrlEnum_DISABLE_1 : _zz_execute_to_memory_SHIFT_CTRL_string = "DISABLE_1";
      ShiftCtrlEnum_SLL_1 : _zz_execute_to_memory_SHIFT_CTRL_string = "SLL_1    ";
      ShiftCtrlEnum_SRL_1 : _zz_execute_to_memory_SHIFT_CTRL_string = "SRL_1    ";
      ShiftCtrlEnum_SRA_1 : _zz_execute_to_memory_SHIFT_CTRL_string = "SRA_1    ";
      default : _zz_execute_to_memory_SHIFT_CTRL_string = "?????????";
    endcase
  end
  always @(*) begin
    case(_zz_execute_to_memory_SHIFT_CTRL_1)
      ShiftCtrlEnum_DISABLE_1 : _zz_execute_to_memory_SHIFT_CTRL_1_string = "DISABLE_1";
      ShiftCtrlEnum_SLL_1 : _zz_execute_to_memory_SHIFT_CTRL_1_string = "SLL_1    ";
      ShiftCtrlEnum_SRL_1 : _zz_execute_to_memory_SHIFT_CTRL_1_string = "SRL_1    ";
      ShiftCtrlEnum_SRA_1 : _zz_execute_to_memory_SHIFT_CTRL_1_string = "SRA_1    ";
      default : _zz_execute_to_memory_SHIFT_CTRL_1_string = "?????????";
    endcase
  end
  always @(*) begin
    case(decode_SHIFT_CTRL)
      ShiftCtrlEnum_DISABLE_1 : decode_SHIFT_CTRL_string = "DISABLE_1";
      ShiftCtrlEnum_SLL_1 : decode_SHIFT_CTRL_string = "SLL_1    ";
      ShiftCtrlEnum_SRL_1 : decode_SHIFT_CTRL_string = "SRL_1    ";
      ShiftCtrlEnum_SRA_1 : decode_SHIFT_CTRL_string = "SRA_1    ";
      default : decode_SHIFT_CTRL_string = "?????????";
    endcase
  end
  always @(*) begin
    case(_zz_decode_SHIFT_CTRL)
      ShiftCtrlEnum_DISABLE_1 : _zz_decode_SHIFT_CTRL_string = "DISABLE_1";
      ShiftCtrlEnum_SLL_1 : _zz_decode_SHIFT_CTRL_string = "SLL_1    ";
      ShiftCtrlEnum_SRL_1 : _zz_decode_SHIFT_CTRL_string = "SRL_1    ";
      ShiftCtrlEnum_SRA_1 : _zz_decode_SHIFT_CTRL_string = "SRA_1    ";
      default : _zz_decode_SHIFT_CTRL_string = "?????????";
    endcase
  end
  always @(*) begin
    case(_zz_decode_to_execute_SHIFT_CTRL)
      ShiftCtrlEnum_DISABLE_1 : _zz_decode_to_execute_SHIFT_CTRL_string = "DISABLE_1";
      ShiftCtrlEnum_SLL_1 : _zz_decode_to_execute_SHIFT_CTRL_string = "SLL_1    ";
      ShiftCtrlEnum_SRL_1 : _zz_decode_to_execute_SHIFT_CTRL_string = "SRL_1    ";
      ShiftCtrlEnum_SRA_1 : _zz_decode_to_execute_SHIFT_CTRL_string = "SRA_1    ";
      default : _zz_decode_to_execute_SHIFT_CTRL_string = "?????????";
    endcase
  end
  always @(*) begin
    case(_zz_decode_to_execute_SHIFT_CTRL_1)
      ShiftCtrlEnum_DISABLE_1 : _zz_decode_to_execute_SHIFT_CTRL_1_string = "DISABLE_1";
      ShiftCtrlEnum_SLL_1 : _zz_decode_to_execute_SHIFT_CTRL_1_string = "SLL_1    ";
      ShiftCtrlEnum_SRL_1 : _zz_decode_to_execute_SHIFT_CTRL_1_string = "SRL_1    ";
      ShiftCtrlEnum_SRA_1 : _zz_decode_to_execute_SHIFT_CTRL_1_string = "SRA_1    ";
      default : _zz_decode_to_execute_SHIFT_CTRL_1_string = "?????????";
    endcase
  end
  always @(*) begin
    case(decode_ALU_BITWISE_CTRL)
      AluBitwiseCtrlEnum_XOR_1 : decode_ALU_BITWISE_CTRL_string = "XOR_1";
      AluBitwiseCtrlEnum_OR_1 : decode_ALU_BITWISE_CTRL_string = "OR_1 ";
      AluBitwiseCtrlEnum_AND_1 : decode_ALU_BITWISE_CTRL_string = "AND_1";
      default : decode_ALU_BITWISE_CTRL_string = "?????";
    endcase
  end
  always @(*) begin
    case(_zz_decode_ALU_BITWISE_CTRL)
      AluBitwiseCtrlEnum_XOR_1 : _zz_decode_ALU_BITWISE_CTRL_string = "XOR_1";
      AluBitwiseCtrlEnum_OR_1 : _zz_decode_ALU_BITWISE_CTRL_string = "OR_1 ";
      AluBitwiseCtrlEnum_AND_1 : _zz_decode_ALU_BITWISE_CTRL_string = "AND_1";
      default : _zz_decode_ALU_BITWISE_CTRL_string = "?????";
    endcase
  end
  always @(*) begin
    case(_zz_decode_to_execute_ALU_BITWISE_CTRL)
      AluBitwiseCtrlEnum_XOR_1 : _zz_decode_to_execute_ALU_BITWISE_CTRL_string = "XOR_1";
      AluBitwiseCtrlEnum_OR_1 : _zz_decode_to_execute_ALU_BITWISE_CTRL_string = "OR_1 ";
      AluBitwiseCtrlEnum_AND_1 : _zz_decode_to_execute_ALU_BITWISE_CTRL_string = "AND_1";
      default : _zz_decode_to_execute_ALU_BITWISE_CTRL_string = "?????";
    endcase
  end
  always @(*) begin
    case(_zz_decode_to_execute_ALU_BITWISE_CTRL_1)
      AluBitwiseCtrlEnum_XOR_1 : _zz_decode_to_execute_ALU_BITWISE_CTRL_1_string = "XOR_1";
      AluBitwiseCtrlEnum_OR_1 : _zz_decode_to_execute_ALU_BITWISE_CTRL_1_string = "OR_1 ";
      AluBitwiseCtrlEnum_AND_1 : _zz_decode_to_execute_ALU_BITWISE_CTRL_1_string = "AND_1";
      default : _zz_decode_to_execute_ALU_BITWISE_CTRL_1_string = "?????";
    endcase
  end
  always @(*) begin
    case(decode_SRC2_CTRL)
      Src2CtrlEnum_RS : decode_SRC2_CTRL_string = "RS ";
      Src2CtrlEnum_IMI : decode_SRC2_CTRL_string = "IMI";
      Src2CtrlEnum_IMS : decode_SRC2_CTRL_string = "IMS";
      Src2CtrlEnum_PC : decode_SRC2_CTRL_string = "PC ";
      default : decode_SRC2_CTRL_string = "???";
    endcase
  end
  always @(*) begin
    case(_zz_decode_SRC2_CTRL)
      Src2CtrlEnum_RS : _zz_decode_SRC2_CTRL_string = "RS ";
      Src2CtrlEnum_IMI : _zz_decode_SRC2_CTRL_string = "IMI";
      Src2CtrlEnum_IMS : _zz_decode_SRC2_CTRL_string = "IMS";
      Src2CtrlEnum_PC : _zz_decode_SRC2_CTRL_string = "PC ";
      default : _zz_decode_SRC2_CTRL_string = "???";
    endcase
  end
  always @(*) begin
    case(_zz_decode_to_execute_SRC2_CTRL)
      Src2CtrlEnum_RS : _zz_decode_to_execute_SRC2_CTRL_string = "RS ";
      Src2CtrlEnum_IMI : _zz_decode_to_execute_SRC2_CTRL_string = "IMI";
      Src2CtrlEnum_IMS : _zz_decode_to_execute_SRC2_CTRL_string = "IMS";
      Src2CtrlEnum_PC : _zz_decode_to_execute_SRC2_CTRL_string = "PC ";
      default : _zz_decode_to_execute_SRC2_CTRL_string = "???";
    endcase
  end
  always @(*) begin
    case(_zz_decode_to_execute_SRC2_CTRL_1)
      Src2CtrlEnum_RS : _zz_decode_to_execute_SRC2_CTRL_1_string = "RS ";
      Src2CtrlEnum_IMI : _zz_decode_to_execute_SRC2_CTRL_1_string = "IMI";
      Src2CtrlEnum_IMS : _zz_decode_to_execute_SRC2_CTRL_1_string = "IMS";
      Src2CtrlEnum_PC : _zz_decode_to_execute_SRC2_CTRL_1_string = "PC ";
      default : _zz_decode_to_execute_SRC2_CTRL_1_string = "???";
    endcase
  end
  always @(*) begin
    case(decode_ALU_CTRL)
      AluCtrlEnum_ADD_SUB : decode_ALU_CTRL_string = "ADD_SUB ";
      AluCtrlEnum_SLT_SLTU : decode_ALU_CTRL_string = "SLT_SLTU";
      AluCtrlEnum_BITWISE : decode_ALU_CTRL_string = "BITWISE ";
      default : decode_ALU_CTRL_string = "????????";
    endcase
  end
  always @(*) begin
    case(_zz_decode_ALU_CTRL)
      AluCtrlEnum_ADD_SUB : _zz_decode_ALU_CTRL_string = "ADD_SUB ";
      AluCtrlEnum_SLT_SLTU : _zz_decode_ALU_CTRL_string = "SLT_SLTU";
      AluCtrlEnum_BITWISE : _zz_decode_ALU_CTRL_string = "BITWISE ";
      default : _zz_decode_ALU_CTRL_string = "????????";
    endcase
  end
  always @(*) begin
    case(_zz_decode_to_execute_ALU_CTRL)
      AluCtrlEnum_ADD_SUB : _zz_decode_to_execute_ALU_CTRL_string = "ADD_SUB ";
      AluCtrlEnum_SLT_SLTU : _zz_decode_to_execute_ALU_CTRL_string = "SLT_SLTU";
      AluCtrlEnum_BITWISE : _zz_decode_to_execute_ALU_CTRL_string = "BITWISE ";
      default : _zz_decode_to_execute_ALU_CTRL_string = "????????";
    endcase
  end
  always @(*) begin
    case(_zz_decode_to_execute_ALU_CTRL_1)
      AluCtrlEnum_ADD_SUB : _zz_decode_to_execute_ALU_CTRL_1_string = "ADD_SUB ";
      AluCtrlEnum_SLT_SLTU : _zz_decode_to_execute_ALU_CTRL_1_string = "SLT_SLTU";
      AluCtrlEnum_BITWISE : _zz_decode_to_execute_ALU_CTRL_1_string = "BITWISE ";
      default : _zz_decode_to_execute_ALU_CTRL_1_string = "????????";
    endcase
  end
  always @(*) begin
    case(decode_SRC1_CTRL)
      Src1CtrlEnum_RS : decode_SRC1_CTRL_string = "RS          ";
      Src1CtrlEnum_IMU : decode_SRC1_CTRL_string = "IMU         ";
      Src1CtrlEnum_PC_INCREMENT : decode_SRC1_CTRL_string = "PC_INCREMENT";
      Src1CtrlEnum_URS1 : decode_SRC1_CTRL_string = "URS1        ";
      default : decode_SRC1_CTRL_string = "????????????";
    endcase
  end
  always @(*) begin
    case(_zz_decode_SRC1_CTRL)
      Src1CtrlEnum_RS : _zz_decode_SRC1_CTRL_string = "RS          ";
      Src1CtrlEnum_IMU : _zz_decode_SRC1_CTRL_string = "IMU         ";
      Src1CtrlEnum_PC_INCREMENT : _zz_decode_SRC1_CTRL_string = "PC_INCREMENT";
      Src1CtrlEnum_URS1 : _zz_decode_SRC1_CTRL_string = "URS1        ";
      default : _zz_decode_SRC1_CTRL_string = "????????????";
    endcase
  end
  always @(*) begin
    case(_zz_decode_to_execute_SRC1_CTRL)
      Src1CtrlEnum_RS : _zz_decode_to_execute_SRC1_CTRL_string = "RS          ";
      Src1CtrlEnum_IMU : _zz_decode_to_execute_SRC1_CTRL_string = "IMU         ";
      Src1CtrlEnum_PC_INCREMENT : _zz_decode_to_execute_SRC1_CTRL_string = "PC_INCREMENT";
      Src1CtrlEnum_URS1 : _zz_decode_to_execute_SRC1_CTRL_string = "URS1        ";
      default : _zz_decode_to_execute_SRC1_CTRL_string = "????????????";
    endcase
  end
  always @(*) begin
    case(_zz_decode_to_execute_SRC1_CTRL_1)
      Src1CtrlEnum_RS : _zz_decode_to_execute_SRC1_CTRL_1_string = "RS          ";
      Src1CtrlEnum_IMU : _zz_decode_to_execute_SRC1_CTRL_1_string = "IMU         ";
      Src1CtrlEnum_PC_INCREMENT : _zz_decode_to_execute_SRC1_CTRL_1_string = "PC_INCREMENT";
      Src1CtrlEnum_URS1 : _zz_decode_to_execute_SRC1_CTRL_1_string = "URS1        ";
      default : _zz_decode_to_execute_SRC1_CTRL_1_string = "????????????";
    endcase
  end
  always @(*) begin
    case(memory_ENV_CTRL)
      EnvCtrlEnum_NONE : memory_ENV_CTRL_string = "NONE";
      EnvCtrlEnum_XRET : memory_ENV_CTRL_string = "XRET";
      default : memory_ENV_CTRL_string = "????";
    endcase
  end
  always @(*) begin
    case(_zz_memory_ENV_CTRL)
      EnvCtrlEnum_NONE : _zz_memory_ENV_CTRL_string = "NONE";
      EnvCtrlEnum_XRET : _zz_memory_ENV_CTRL_string = "XRET";
      default : _zz_memory_ENV_CTRL_string = "????";
    endcase
  end
  always @(*) begin
    case(execute_ENV_CTRL)
      EnvCtrlEnum_NONE : execute_ENV_CTRL_string = "NONE";
      EnvCtrlEnum_XRET : execute_ENV_CTRL_string = "XRET";
      default : execute_ENV_CTRL_string = "????";
    endcase
  end
  always @(*) begin
    case(_zz_execute_ENV_CTRL)
      EnvCtrlEnum_NONE : _zz_execute_ENV_CTRL_string = "NONE";
      EnvCtrlEnum_XRET : _zz_execute_ENV_CTRL_string = "XRET";
      default : _zz_execute_ENV_CTRL_string = "????";
    endcase
  end
  always @(*) begin
    case(writeBack_ENV_CTRL)
      EnvCtrlEnum_NONE : writeBack_ENV_CTRL_string = "NONE";
      EnvCtrlEnum_XRET : writeBack_ENV_CTRL_string = "XRET";
      default : writeBack_ENV_CTRL_string = "????";
    endcase
  end
  always @(*) begin
    case(_zz_writeBack_ENV_CTRL)
      EnvCtrlEnum_NONE : _zz_writeBack_ENV_CTRL_string = "NONE";
      EnvCtrlEnum_XRET : _zz_writeBack_ENV_CTRL_string = "XRET";
      default : _zz_writeBack_ENV_CTRL_string = "????";
    endcase
  end
  always @(*) begin
    case(execute_BRANCH_CTRL)
      BranchCtrlEnum_INC : execute_BRANCH_CTRL_string = "INC ";
      BranchCtrlEnum_B : execute_BRANCH_CTRL_string = "B   ";
      BranchCtrlEnum_JAL : execute_BRANCH_CTRL_string = "JAL ";
      BranchCtrlEnum_JALR : execute_BRANCH_CTRL_string = "JALR";
      default : execute_BRANCH_CTRL_string = "????";
    endcase
  end
  always @(*) begin
    case(_zz_execute_BRANCH_CTRL)
      BranchCtrlEnum_INC : _zz_execute_BRANCH_CTRL_string = "INC ";
      BranchCtrlEnum_B : _zz_execute_BRANCH_CTRL_string = "B   ";
      BranchCtrlEnum_JAL : _zz_execute_BRANCH_CTRL_string = "JAL ";
      BranchCtrlEnum_JALR : _zz_execute_BRANCH_CTRL_string = "JALR";
      default : _zz_execute_BRANCH_CTRL_string = "????";
    endcase
  end
  always @(*) begin
    case(memory_SHIFT_CTRL)
      ShiftCtrlEnum_DISABLE_1 : memory_SHIFT_CTRL_string = "DISABLE_1";
      ShiftCtrlEnum_SLL_1 : memory_SHIFT_CTRL_string = "SLL_1    ";
      ShiftCtrlEnum_SRL_1 : memory_SHIFT_CTRL_string = "SRL_1    ";
      ShiftCtrlEnum_SRA_1 : memory_SHIFT_CTRL_string = "SRA_1    ";
      default : memory_SHIFT_CTRL_string = "?????????";
    endcase
  end
  always @(*) begin
    case(_zz_memory_SHIFT_CTRL)
      ShiftCtrlEnum_DISABLE_1 : _zz_memory_SHIFT_CTRL_string = "DISABLE_1";
      ShiftCtrlEnum_SLL_1 : _zz_memory_SHIFT_CTRL_string = "SLL_1    ";
      ShiftCtrlEnum_SRL_1 : _zz_memory_SHIFT_CTRL_string = "SRL_1    ";
      ShiftCtrlEnum_SRA_1 : _zz_memory_SHIFT_CTRL_string = "SRA_1    ";
      default : _zz_memory_SHIFT_CTRL_string = "?????????";
    endcase
  end
  always @(*) begin
    case(execute_SHIFT_CTRL)
      ShiftCtrlEnum_DISABLE_1 : execute_SHIFT_CTRL_string = "DISABLE_1";
      ShiftCtrlEnum_SLL_1 : execute_SHIFT_CTRL_string = "SLL_1    ";
      ShiftCtrlEnum_SRL_1 : execute_SHIFT_CTRL_string = "SRL_1    ";
      ShiftCtrlEnum_SRA_1 : execute_SHIFT_CTRL_string = "SRA_1    ";
      default : execute_SHIFT_CTRL_string = "?????????";
    endcase
  end
  always @(*) begin
    case(_zz_execute_SHIFT_CTRL)
      ShiftCtrlEnum_DISABLE_1 : _zz_execute_SHIFT_CTRL_string = "DISABLE_1";
      ShiftCtrlEnum_SLL_1 : _zz_execute_SHIFT_CTRL_string = "SLL_1    ";
      ShiftCtrlEnum_SRL_1 : _zz_execute_SHIFT_CTRL_string = "SRL_1    ";
      ShiftCtrlEnum_SRA_1 : _zz_execute_SHIFT_CTRL_string = "SRA_1    ";
      default : _zz_execute_SHIFT_CTRL_string = "?????????";
    endcase
  end
  always @(*) begin
    case(execute_SRC2_CTRL)
      Src2CtrlEnum_RS : execute_SRC2_CTRL_string = "RS ";
      Src2CtrlEnum_IMI : execute_SRC2_CTRL_string = "IMI";
      Src2CtrlEnum_IMS : execute_SRC2_CTRL_string = "IMS";
      Src2CtrlEnum_PC : execute_SRC2_CTRL_string = "PC ";
      default : execute_SRC2_CTRL_string = "???";
    endcase
  end
  always @(*) begin
    case(_zz_execute_SRC2_CTRL)
      Src2CtrlEnum_RS : _zz_execute_SRC2_CTRL_string = "RS ";
      Src2CtrlEnum_IMI : _zz_execute_SRC2_CTRL_string = "IMI";
      Src2CtrlEnum_IMS : _zz_execute_SRC2_CTRL_string = "IMS";
      Src2CtrlEnum_PC : _zz_execute_SRC2_CTRL_string = "PC ";
      default : _zz_execute_SRC2_CTRL_string = "???";
    endcase
  end
  always @(*) begin
    case(execute_SRC1_CTRL)
      Src1CtrlEnum_RS : execute_SRC1_CTRL_string = "RS          ";
      Src1CtrlEnum_IMU : execute_SRC1_CTRL_string = "IMU         ";
      Src1CtrlEnum_PC_INCREMENT : execute_SRC1_CTRL_string = "PC_INCREMENT";
      Src1CtrlEnum_URS1 : execute_SRC1_CTRL_string = "URS1        ";
      default : execute_SRC1_CTRL_string = "????????????";
    endcase
  end
  always @(*) begin
    case(_zz_execute_SRC1_CTRL)
      Src1CtrlEnum_RS : _zz_execute_SRC1_CTRL_string = "RS          ";
      Src1CtrlEnum_IMU : _zz_execute_SRC1_CTRL_string = "IMU         ";
      Src1CtrlEnum_PC_INCREMENT : _zz_execute_SRC1_CTRL_string = "PC_INCREMENT";
      Src1CtrlEnum_URS1 : _zz_execute_SRC1_CTRL_string = "URS1        ";
      default : _zz_execute_SRC1_CTRL_string = "????????????";
    endcase
  end
  always @(*) begin
    case(execute_ALU_CTRL)
      AluCtrlEnum_ADD_SUB : execute_ALU_CTRL_string = "ADD_SUB ";
      AluCtrlEnum_SLT_SLTU : execute_ALU_CTRL_string = "SLT_SLTU";
      AluCtrlEnum_BITWISE : execute_ALU_CTRL_string = "BITWISE ";
      default : execute_ALU_CTRL_string = "????????";
    endcase
  end
  always @(*) begin
    case(_zz_execute_ALU_CTRL)
      AluCtrlEnum_ADD_SUB : _zz_execute_ALU_CTRL_string = "ADD_SUB ";
      AluCtrlEnum_SLT_SLTU : _zz_execute_ALU_CTRL_string = "SLT_SLTU";
      AluCtrlEnum_BITWISE : _zz_execute_ALU_CTRL_string = "BITWISE ";
      default : _zz_execute_ALU_CTRL_string = "????????";
    endcase
  end
  always @(*) begin
    case(execute_ALU_BITWISE_CTRL)
      AluBitwiseCtrlEnum_XOR_1 : execute_ALU_BITWISE_CTRL_string = "XOR_1";
      AluBitwiseCtrlEnum_OR_1 : execute_ALU_BITWISE_CTRL_string = "OR_1 ";
      AluBitwiseCtrlEnum_AND_1 : execute_ALU_BITWISE_CTRL_string = "AND_1";
      default : execute_ALU_BITWISE_CTRL_string = "?????";
    endcase
  end
  always @(*) begin
    case(_zz_execute_ALU_BITWISE_CTRL)
      AluBitwiseCtrlEnum_XOR_1 : _zz_execute_ALU_BITWISE_CTRL_string = "XOR_1";
      AluBitwiseCtrlEnum_OR_1 : _zz_execute_ALU_BITWISE_CTRL_string = "OR_1 ";
      AluBitwiseCtrlEnum_AND_1 : _zz_execute_ALU_BITWISE_CTRL_string = "AND_1";
      default : _zz_execute_ALU_BITWISE_CTRL_string = "?????";
    endcase
  end
  always @(*) begin
    case(_zz_decode_ENV_CTRL_1)
      EnvCtrlEnum_NONE : _zz_decode_ENV_CTRL_1_string = "NONE";
      EnvCtrlEnum_XRET : _zz_decode_ENV_CTRL_1_string = "XRET";
      default : _zz_decode_ENV_CTRL_1_string = "????";
    endcase
  end
  always @(*) begin
    case(_zz_decode_BRANCH_CTRL)
      BranchCtrlEnum_INC : _zz_decode_BRANCH_CTRL_string = "INC ";
      BranchCtrlEnum_B : _zz_decode_BRANCH_CTRL_string = "B   ";
      BranchCtrlEnum_JAL : _zz_decode_BRANCH_CTRL_string = "JAL ";
      BranchCtrlEnum_JALR : _zz_decode_BRANCH_CTRL_string = "JALR";
      default : _zz_decode_BRANCH_CTRL_string = "????";
    endcase
  end
  always @(*) begin
    case(_zz_decode_SHIFT_CTRL_1)
      ShiftCtrlEnum_DISABLE_1 : _zz_decode_SHIFT_CTRL_1_string = "DISABLE_1";
      ShiftCtrlEnum_SLL_1 : _zz_decode_SHIFT_CTRL_1_string = "SLL_1    ";
      ShiftCtrlEnum_SRL_1 : _zz_decode_SHIFT_CTRL_1_string = "SRL_1    ";
      ShiftCtrlEnum_SRA_1 : _zz_decode_SHIFT_CTRL_1_string = "SRA_1    ";
      default : _zz_decode_SHIFT_CTRL_1_string = "?????????";
    endcase
  end
  always @(*) begin
    case(_zz_decode_ALU_BITWISE_CTRL_1)
      AluBitwiseCtrlEnum_XOR_1 : _zz_decode_ALU_BITWISE_CTRL_1_string = "XOR_1";
      AluBitwiseCtrlEnum_OR_1 : _zz_decode_ALU_BITWISE_CTRL_1_string = "OR_1 ";
      AluBitwiseCtrlEnum_AND_1 : _zz_decode_ALU_BITWISE_CTRL_1_string = "AND_1";
      default : _zz_decode_ALU_BITWISE_CTRL_1_string = "?????";
    endcase
  end
  always @(*) begin
    case(_zz_decode_SRC2_CTRL_1)
      Src2CtrlEnum_RS : _zz_decode_SRC2_CTRL_1_string = "RS ";
      Src2CtrlEnum_IMI : _zz_decode_SRC2_CTRL_1_string = "IMI";
      Src2CtrlEnum_IMS : _zz_decode_SRC2_CTRL_1_string = "IMS";
      Src2CtrlEnum_PC : _zz_decode_SRC2_CTRL_1_string = "PC ";
      default : _zz_decode_SRC2_CTRL_1_string = "???";
    endcase
  end
  always @(*) begin
    case(_zz_decode_ALU_CTRL_1)
      AluCtrlEnum_ADD_SUB : _zz_decode_ALU_CTRL_1_string = "ADD_SUB ";
      AluCtrlEnum_SLT_SLTU : _zz_decode_ALU_CTRL_1_string = "SLT_SLTU";
      AluCtrlEnum_BITWISE : _zz_decode_ALU_CTRL_1_string = "BITWISE ";
      default : _zz_decode_ALU_CTRL_1_string = "????????";
    endcase
  end
  always @(*) begin
    case(_zz_decode_SRC1_CTRL_1)
      Src1CtrlEnum_RS : _zz_decode_SRC1_CTRL_1_string = "RS          ";
      Src1CtrlEnum_IMU : _zz_decode_SRC1_CTRL_1_string = "IMU         ";
      Src1CtrlEnum_PC_INCREMENT : _zz_decode_SRC1_CTRL_1_string = "PC_INCREMENT";
      Src1CtrlEnum_URS1 : _zz_decode_SRC1_CTRL_1_string = "URS1        ";
      default : _zz_decode_SRC1_CTRL_1_string = "????????????";
    endcase
  end
  always @(*) begin
    case(decode_BRANCH_CTRL)
      BranchCtrlEnum_INC : decode_BRANCH_CTRL_string = "INC ";
      BranchCtrlEnum_B : decode_BRANCH_CTRL_string = "B   ";
      BranchCtrlEnum_JAL : decode_BRANCH_CTRL_string = "JAL ";
      BranchCtrlEnum_JALR : decode_BRANCH_CTRL_string = "JALR";
      default : decode_BRANCH_CTRL_string = "????";
    endcase
  end
  always @(*) begin
    case(_zz_decode_BRANCH_CTRL_1)
      BranchCtrlEnum_INC : _zz_decode_BRANCH_CTRL_1_string = "INC ";
      BranchCtrlEnum_B : _zz_decode_BRANCH_CTRL_1_string = "B   ";
      BranchCtrlEnum_JAL : _zz_decode_BRANCH_CTRL_1_string = "JAL ";
      BranchCtrlEnum_JALR : _zz_decode_BRANCH_CTRL_1_string = "JALR";
      default : _zz_decode_BRANCH_CTRL_1_string = "????";
    endcase
  end
  always @(*) begin
    case(_zz_decode_SRC1_CTRL_2)
      Src1CtrlEnum_RS : _zz_decode_SRC1_CTRL_2_string = "RS          ";
      Src1CtrlEnum_IMU : _zz_decode_SRC1_CTRL_2_string = "IMU         ";
      Src1CtrlEnum_PC_INCREMENT : _zz_decode_SRC1_CTRL_2_string = "PC_INCREMENT";
      Src1CtrlEnum_URS1 : _zz_decode_SRC1_CTRL_2_string = "URS1        ";
      default : _zz_decode_SRC1_CTRL_2_string = "????????????";
    endcase
  end
  always @(*) begin
    case(_zz_decode_ALU_CTRL_2)
      AluCtrlEnum_ADD_SUB : _zz_decode_ALU_CTRL_2_string = "ADD_SUB ";
      AluCtrlEnum_SLT_SLTU : _zz_decode_ALU_CTRL_2_string = "SLT_SLTU";
      AluCtrlEnum_BITWISE : _zz_decode_ALU_CTRL_2_string = "BITWISE ";
      default : _zz_decode_ALU_CTRL_2_string = "????????";
    endcase
  end
  always @(*) begin
    case(_zz_decode_SRC2_CTRL_2)
      Src2CtrlEnum_RS : _zz_decode_SRC2_CTRL_2_string = "RS ";
      Src2CtrlEnum_IMI : _zz_decode_SRC2_CTRL_2_string = "IMI";
      Src2CtrlEnum_IMS : _zz_decode_SRC2_CTRL_2_string = "IMS";
      Src2CtrlEnum_PC : _zz_decode_SRC2_CTRL_2_string = "PC ";
      default : _zz_decode_SRC2_CTRL_2_string = "???";
    endcase
  end
  always @(*) begin
    case(_zz_decode_ALU_BITWISE_CTRL_2)
      AluBitwiseCtrlEnum_XOR_1 : _zz_decode_ALU_BITWISE_CTRL_2_string = "XOR_1";
      AluBitwiseCtrlEnum_OR_1 : _zz_decode_ALU_BITWISE_CTRL_2_string = "OR_1 ";
      AluBitwiseCtrlEnum_AND_1 : _zz_decode_ALU_BITWISE_CTRL_2_string = "AND_1";
      default : _zz_decode_ALU_BITWISE_CTRL_2_string = "?????";
    endcase
  end
  always @(*) begin
    case(_zz_decode_SHIFT_CTRL_2)
      ShiftCtrlEnum_DISABLE_1 : _zz_decode_SHIFT_CTRL_2_string = "DISABLE_1";
      ShiftCtrlEnum_SLL_1 : _zz_decode_SHIFT_CTRL_2_string = "SLL_1    ";
      ShiftCtrlEnum_SRL_1 : _zz_decode_SHIFT_CTRL_2_string = "SRL_1    ";
      ShiftCtrlEnum_SRA_1 : _zz_decode_SHIFT_CTRL_2_string = "SRA_1    ";
      default : _zz_decode_SHIFT_CTRL_2_string = "?????????";
    endcase
  end
  always @(*) begin
    case(_zz_decode_BRANCH_CTRL_2)
      BranchCtrlEnum_INC : _zz_decode_BRANCH_CTRL_2_string = "INC ";
      BranchCtrlEnum_B : _zz_decode_BRANCH_CTRL_2_string = "B   ";
      BranchCtrlEnum_JAL : _zz_decode_BRANCH_CTRL_2_string = "JAL ";
      BranchCtrlEnum_JALR : _zz_decode_BRANCH_CTRL_2_string = "JALR";
      default : _zz_decode_BRANCH_CTRL_2_string = "????";
    endcase
  end
  always @(*) begin
    case(_zz_decode_ENV_CTRL_8)
      EnvCtrlEnum_NONE : _zz_decode_ENV_CTRL_8_string = "NONE";
      EnvCtrlEnum_XRET : _zz_decode_ENV_CTRL_8_string = "XRET";
      default : _zz_decode_ENV_CTRL_8_string = "????";
    endcase
  end
  always @(*) begin
    case(decode_to_execute_SRC1_CTRL)
      Src1CtrlEnum_RS : decode_to_execute_SRC1_CTRL_string = "RS          ";
      Src1CtrlEnum_IMU : decode_to_execute_SRC1_CTRL_string = "IMU         ";
      Src1CtrlEnum_PC_INCREMENT : decode_to_execute_SRC1_CTRL_string = "PC_INCREMENT";
      Src1CtrlEnum_URS1 : decode_to_execute_SRC1_CTRL_string = "URS1        ";
      default : decode_to_execute_SRC1_CTRL_string = "????????????";
    endcase
  end
  always @(*) begin
    case(decode_to_execute_ALU_CTRL)
      AluCtrlEnum_ADD_SUB : decode_to_execute_ALU_CTRL_string = "ADD_SUB ";
      AluCtrlEnum_SLT_SLTU : decode_to_execute_ALU_CTRL_string = "SLT_SLTU";
      AluCtrlEnum_BITWISE : decode_to_execute_ALU_CTRL_string = "BITWISE ";
      default : decode_to_execute_ALU_CTRL_string = "????????";
    endcase
  end
  always @(*) begin
    case(decode_to_execute_SRC2_CTRL)
      Src2CtrlEnum_RS : decode_to_execute_SRC2_CTRL_string = "RS ";
      Src2CtrlEnum_IMI : decode_to_execute_SRC2_CTRL_string = "IMI";
      Src2CtrlEnum_IMS : decode_to_execute_SRC2_CTRL_string = "IMS";
      Src2CtrlEnum_PC : decode_to_execute_SRC2_CTRL_string = "PC ";
      default : decode_to_execute_SRC2_CTRL_string = "???";
    endcase
  end
  always @(*) begin
    case(decode_to_execute_ALU_BITWISE_CTRL)
      AluBitwiseCtrlEnum_XOR_1 : decode_to_execute_ALU_BITWISE_CTRL_string = "XOR_1";
      AluBitwiseCtrlEnum_OR_1 : decode_to_execute_ALU_BITWISE_CTRL_string = "OR_1 ";
      AluBitwiseCtrlEnum_AND_1 : decode_to_execute_ALU_BITWISE_CTRL_string = "AND_1";
      default : decode_to_execute_ALU_BITWISE_CTRL_string = "?????";
    endcase
  end
  always @(*) begin
    case(decode_to_execute_SHIFT_CTRL)
      ShiftCtrlEnum_DISABLE_1 : decode_to_execute_SHIFT_CTRL_string = "DISABLE_1";
      ShiftCtrlEnum_SLL_1 : decode_to_execute_SHIFT_CTRL_string = "SLL_1    ";
      ShiftCtrlEnum_SRL_1 : decode_to_execute_SHIFT_CTRL_string = "SRL_1    ";
      ShiftCtrlEnum_SRA_1 : decode_to_execute_SHIFT_CTRL_string = "SRA_1    ";
      default : decode_to_execute_SHIFT_CTRL_string = "?????????";
    endcase
  end
  always @(*) begin
    case(execute_to_memory_SHIFT_CTRL)
      ShiftCtrlEnum_DISABLE_1 : execute_to_memory_SHIFT_CTRL_string = "DISABLE_1";
      ShiftCtrlEnum_SLL_1 : execute_to_memory_SHIFT_CTRL_string = "SLL_1    ";
      ShiftCtrlEnum_SRL_1 : execute_to_memory_SHIFT_CTRL_string = "SRL_1    ";
      ShiftCtrlEnum_SRA_1 : execute_to_memory_SHIFT_CTRL_string = "SRA_1    ";
      default : execute_to_memory_SHIFT_CTRL_string = "?????????";
    endcase
  end
  always @(*) begin
    case(decode_to_execute_BRANCH_CTRL)
      BranchCtrlEnum_INC : decode_to_execute_BRANCH_CTRL_string = "INC ";
      BranchCtrlEnum_B : decode_to_execute_BRANCH_CTRL_string = "B   ";
      BranchCtrlEnum_JAL : decode_to_execute_BRANCH_CTRL_string = "JAL ";
      BranchCtrlEnum_JALR : decode_to_execute_BRANCH_CTRL_string = "JALR";
      default : decode_to_execute_BRANCH_CTRL_string = "????";
    endcase
  end
  always @(*) begin
    case(decode_to_execute_ENV_CTRL)
      EnvCtrlEnum_NONE : decode_to_execute_ENV_CTRL_string = "NONE";
      EnvCtrlEnum_XRET : decode_to_execute_ENV_CTRL_string = "XRET";
      default : decode_to_execute_ENV_CTRL_string = "????";
    endcase
  end
  always @(*) begin
    case(execute_to_memory_ENV_CTRL)
      EnvCtrlEnum_NONE : execute_to_memory_ENV_CTRL_string = "NONE";
      EnvCtrlEnum_XRET : execute_to_memory_ENV_CTRL_string = "XRET";
      default : execute_to_memory_ENV_CTRL_string = "????";
    endcase
  end
  always @(*) begin
    case(memory_to_writeBack_ENV_CTRL)
      EnvCtrlEnum_NONE : memory_to_writeBack_ENV_CTRL_string = "NONE";
      EnvCtrlEnum_XRET : memory_to_writeBack_ENV_CTRL_string = "XRET";
      default : memory_to_writeBack_ENV_CTRL_string = "????";
    endcase
  end
  `endif

  assign memory_MUL_LOW = ($signed(_zz_memory_MUL_LOW) + $signed(_zz_memory_MUL_LOW_7));
  assign execute_BRANCH_CALC = {execute_BranchPlugin_branchAdder[31 : 1],1'b0};
  assign execute_BRANCH_DO = ((execute_PREDICTION_HAD_BRANCHED2 != execute_BRANCH_COND_RESULT) || execute_BranchPlugin_missAlignedTarget);
  assign memory_MUL_HH = execute_to_memory_MUL_HH;
  assign execute_MUL_HH = ($signed(execute_MulPlugin_aHigh) * $signed(execute_MulPlugin_bHigh));
  assign execute_MUL_HL = ($signed(execute_MulPlugin_aHigh) * $signed(execute_MulPlugin_bSLow));
  assign execute_MUL_LH = ($signed(execute_MulPlugin_aSLow) * $signed(execute_MulPlugin_bHigh));
  assign execute_MUL_LL = (execute_MulPlugin_aULow * execute_MulPlugin_bULow);
  assign execute_SHIFT_RIGHT = _zz_execute_SHIFT_RIGHT;
  assign execute_REGFILE_WRITE_DATA = _zz_execute_REGFILE_WRITE_DATA;
  assign memory_MEMORY_STORE_DATA_RF = execute_to_memory_MEMORY_STORE_DATA_RF;
  assign execute_MEMORY_STORE_DATA_RF = _zz_execute_MEMORY_STORE_DATA_RF;
  assign decode_DO_EBREAK = (((! DebugPlugin_haltIt) && (decode_IS_EBREAK || 1'b0)) && DebugPlugin_allowEBreak);
  assign decode_CSR_READ_OPCODE = (decode_INSTRUCTION[13 : 7] != 7'h20);
  assign decode_CSR_WRITE_OPCODE = (! (((decode_INSTRUCTION[14 : 13] == 2'b01) && (decode_INSTRUCTION[19 : 15] == 5'h0)) || ((decode_INSTRUCTION[14 : 13] == 2'b11) && (decode_INSTRUCTION[19 : 15] == 5'h0))));
  assign decode_PREDICTION_HAD_BRANCHED2 = IBusCachedPlugin_decodePrediction_cmd_hadBranch;
  assign decode_SRC2_FORCE_ZERO = (decode_SRC_ADD_ZERO && (! decode_SRC_USE_SUB_LESS));
  assign _zz_memory_to_writeBack_ENV_CTRL = _zz_memory_to_writeBack_ENV_CTRL_1;
  assign _zz_execute_to_memory_ENV_CTRL = _zz_execute_to_memory_ENV_CTRL_1;
  assign decode_ENV_CTRL = _zz_decode_ENV_CTRL;
  assign _zz_decode_to_execute_ENV_CTRL = _zz_decode_to_execute_ENV_CTRL_1;
  assign decode_IS_CSR = _zz_decode_ENV_CTRL_2[29];
  assign _zz_decode_to_execute_BRANCH_CTRL = _zz_decode_to_execute_BRANCH_CTRL_1;
  assign decode_IS_RS2_SIGNED = _zz_decode_ENV_CTRL_2[26];
  assign decode_IS_RS1_SIGNED = _zz_decode_ENV_CTRL_2[25];
  assign decode_IS_DIV = _zz_decode_ENV_CTRL_2[24];
  assign memory_IS_MUL = execute_to_memory_IS_MUL;
  assign execute_IS_MUL = decode_to_execute_IS_MUL;
  assign decode_IS_MUL = _zz_decode_ENV_CTRL_2[23];
  assign _zz_execute_to_memory_SHIFT_CTRL = _zz_execute_to_memory_SHIFT_CTRL_1;
  assign decode_SHIFT_CTRL = _zz_decode_SHIFT_CTRL;
  assign _zz_decode_to_execute_SHIFT_CTRL = _zz_decode_to_execute_SHIFT_CTRL_1;
  assign decode_ALU_BITWISE_CTRL = _zz_decode_ALU_BITWISE_CTRL;
  assign _zz_decode_to_execute_ALU_BITWISE_CTRL = _zz_decode_to_execute_ALU_BITWISE_CTRL_1;
  assign decode_SRC_LESS_UNSIGNED = _zz_decode_ENV_CTRL_2[17];
  assign decode_MEMORY_MANAGMENT = _zz_decode_ENV_CTRL_2[16];
  assign memory_MEMORY_WR = execute_to_memory_MEMORY_WR;
  assign decode_MEMORY_WR = _zz_decode_ENV_CTRL_2[13];
  assign execute_BYPASSABLE_MEMORY_STAGE = decode_to_execute_BYPASSABLE_MEMORY_STAGE;
  assign decode_BYPASSABLE_MEMORY_STAGE = _zz_decode_ENV_CTRL_2[12];
  assign decode_BYPASSABLE_EXECUTE_STAGE = _zz_decode_ENV_CTRL_2[11];
  assign decode_SRC2_CTRL = _zz_decode_SRC2_CTRL;
  assign _zz_decode_to_execute_SRC2_CTRL = _zz_decode_to_execute_SRC2_CTRL_1;
  assign decode_ALU_CTRL = _zz_decode_ALU_CTRL;
  assign _zz_decode_to_execute_ALU_CTRL = _zz_decode_to_execute_ALU_CTRL_1;
  assign decode_SRC1_CTRL = _zz_decode_SRC1_CTRL;
  assign _zz_decode_to_execute_SRC1_CTRL = _zz_decode_to_execute_SRC1_CTRL_1;
  assign decode_MEMORY_FORCE_CONSTISTENCY = 1'b0;
  assign writeBack_FORMAL_PC_NEXT = memory_to_writeBack_FORMAL_PC_NEXT;
  assign memory_FORMAL_PC_NEXT = execute_to_memory_FORMAL_PC_NEXT;
  assign execute_FORMAL_PC_NEXT = decode_to_execute_FORMAL_PC_NEXT;
  assign decode_FORMAL_PC_NEXT = (decode_PC + _zz_decode_FORMAL_PC_NEXT);
  assign memory_PC = execute_to_memory_PC;
  assign execute_DO_EBREAK = decode_to_execute_DO_EBREAK;
  assign decode_IS_EBREAK = _zz_decode_ENV_CTRL_2[31];
  assign execute_CSR_READ_OPCODE = decode_to_execute_CSR_READ_OPCODE;
  assign execute_CSR_WRITE_OPCODE = decode_to_execute_CSR_WRITE_OPCODE;
  assign execute_IS_CSR = decode_to_execute_IS_CSR;
  assign memory_ENV_CTRL = _zz_memory_ENV_CTRL;
  assign execute_ENV_CTRL = _zz_execute_ENV_CTRL;
  assign writeBack_ENV_CTRL = _zz_writeBack_ENV_CTRL;
  assign memory_BRANCH_CALC = execute_to_memory_BRANCH_CALC;
  assign memory_BRANCH_DO = execute_to_memory_BRANCH_DO;
  assign execute_PC = decode_to_execute_PC;
  assign execute_BRANCH_COND_RESULT = _zz_execute_BRANCH_COND_RESULT_1;
  assign execute_PREDICTION_HAD_BRANCHED2 = decode_to_execute_PREDICTION_HAD_BRANCHED2;
  assign execute_BRANCH_CTRL = _zz_execute_BRANCH_CTRL;
  assign decode_RS2_USE = _zz_decode_ENV_CTRL_2[15];
  assign decode_RS1_USE = _zz_decode_ENV_CTRL_2[5];
  always @(*) begin
    _zz_decode_RS2 = execute_REGFILE_WRITE_DATA;
    if(when_CsrPlugin_l1176) begin
      _zz_decode_RS2 = CsrPlugin_csrMapping_readDataSignal;
    end
  end

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
          decode_RS2 = _zz_decode_RS2_1;
        end
      end
    end
    if(when_HazardSimplePlugin_l45_2) begin
      if(execute_BYPASSABLE_EXECUTE_STAGE) begin
        if(when_HazardSimplePlugin_l51_2) begin
          decode_RS2 = _zz_decode_RS2;
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
          decode_RS1 = _zz_decode_RS2_1;
        end
      end
    end
    if(when_HazardSimplePlugin_l45_2) begin
      if(execute_BYPASSABLE_EXECUTE_STAGE) begin
        if(when_HazardSimplePlugin_l48_2) begin
          decode_RS1 = _zz_decode_RS2;
        end
      end
    end
  end

  assign execute_IS_RS1_SIGNED = decode_to_execute_IS_RS1_SIGNED;
  assign execute_IS_DIV = decode_to_execute_IS_DIV;
  assign execute_IS_RS2_SIGNED = decode_to_execute_IS_RS2_SIGNED;
  assign memory_INSTRUCTION = execute_to_memory_INSTRUCTION;
  assign memory_IS_DIV = execute_to_memory_IS_DIV;
  assign writeBack_IS_MUL = memory_to_writeBack_IS_MUL;
  assign writeBack_MUL_HH = memory_to_writeBack_MUL_HH;
  assign writeBack_MUL_LOW = memory_to_writeBack_MUL_LOW;
  assign memory_MUL_HL = execute_to_memory_MUL_HL;
  assign memory_MUL_LH = execute_to_memory_MUL_LH;
  assign memory_MUL_LL = execute_to_memory_MUL_LL;
  assign execute_RS1 = decode_to_execute_RS1;
  assign memory_SHIFT_RIGHT = execute_to_memory_SHIFT_RIGHT;
  always @(*) begin
    _zz_decode_RS2_1 = memory_REGFILE_WRITE_DATA;
    if(memory_arbitration_isValid) begin
      case(memory_SHIFT_CTRL)
        ShiftCtrlEnum_SLL_1 : begin
          _zz_decode_RS2_1 = _zz_decode_RS2_3;
        end
        ShiftCtrlEnum_SRL_1, ShiftCtrlEnum_SRA_1 : begin
          _zz_decode_RS2_1 = memory_SHIFT_RIGHT;
        end
        default : begin
        end
      endcase
    end
    if(when_MulDivIterativePlugin_l128) begin
      _zz_decode_RS2_1 = memory_DivPlugin_div_result;
    end
  end

  assign memory_SHIFT_CTRL = _zz_memory_SHIFT_CTRL;
  assign execute_SHIFT_CTRL = _zz_execute_SHIFT_CTRL;
  assign execute_SRC_LESS_UNSIGNED = decode_to_execute_SRC_LESS_UNSIGNED;
  assign execute_SRC2_FORCE_ZERO = decode_to_execute_SRC2_FORCE_ZERO;
  assign execute_SRC_USE_SUB_LESS = decode_to_execute_SRC_USE_SUB_LESS;
  assign _zz_execute_SRC2 = execute_PC;
  assign execute_SRC2_CTRL = _zz_execute_SRC2_CTRL;
  assign execute_IS_RVC = decode_to_execute_IS_RVC;
  assign execute_SRC1_CTRL = _zz_execute_SRC1_CTRL;
  assign decode_SRC_USE_SUB_LESS = _zz_decode_ENV_CTRL_2[3];
  assign decode_SRC_ADD_ZERO = _zz_decode_ENV_CTRL_2[20];
  assign execute_SRC_ADD_SUB = execute_SrcPlugin_addSub;
  assign execute_SRC_LESS = execute_SrcPlugin_less;
  assign execute_ALU_CTRL = _zz_execute_ALU_CTRL;
  assign execute_SRC2 = _zz_execute_SRC2_5;
  assign execute_SRC1 = _zz_execute_SRC1;
  assign execute_ALU_BITWISE_CTRL = _zz_execute_ALU_BITWISE_CTRL;
  assign _zz_lastStageRegFileWrite_payload_address = writeBack_INSTRUCTION;
  assign _zz_lastStageRegFileWrite_valid = writeBack_REGFILE_WRITE_VALID;
  always @(*) begin
    _zz_1 = 1'b0;
    if(lastStageRegFileWrite_valid) begin
      _zz_1 = 1'b1;
    end
  end

  assign decode_INSTRUCTION_ANTICIPATED = (decode_arbitration_isStuck ? decode_INSTRUCTION : IBusCachedPlugin_decompressor_output_payload_rsp_inst);
  always @(*) begin
    decode_REGFILE_WRITE_VALID = _zz_decode_ENV_CTRL_2[10];
    if(when_RegFilePlugin_l63) begin
      decode_REGFILE_WRITE_VALID = 1'b0;
    end
  end

  assign decode_LEGAL_INSTRUCTION = (|{((decode_INSTRUCTION & 32'h0000005f) == 32'h00000017),{((decode_INSTRUCTION & 32'h0000007f) == 32'h0000006f),{((decode_INSTRUCTION & 32'h0000106f) == 32'h00000003),{((decode_INSTRUCTION & _zz_decode_LEGAL_INSTRUCTION) == 32'h00001073),{(_zz_decode_LEGAL_INSTRUCTION_1 == _zz_decode_LEGAL_INSTRUCTION_2),{_zz_decode_LEGAL_INSTRUCTION_3,{_zz_decode_LEGAL_INSTRUCTION_4,_zz_decode_LEGAL_INSTRUCTION_5}}}}}}});
  always @(*) begin
    _zz_decode_RS2_2 = writeBack_REGFILE_WRITE_DATA;
    if(when_DBusCachedPlugin_l488) begin
      _zz_decode_RS2_2 = writeBack_DBusCachedPlugin_rspFormated;
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

  assign writeBack_MEMORY_WR = memory_to_writeBack_MEMORY_WR;
  assign writeBack_MEMORY_STORE_DATA_RF = memory_to_writeBack_MEMORY_STORE_DATA_RF;
  assign writeBack_REGFILE_WRITE_DATA = memory_to_writeBack_REGFILE_WRITE_DATA;
  assign writeBack_MEMORY_ENABLE = memory_to_writeBack_MEMORY_ENABLE;
  assign memory_REGFILE_WRITE_DATA = execute_to_memory_REGFILE_WRITE_DATA;
  assign memory_MEMORY_ENABLE = execute_to_memory_MEMORY_ENABLE;
  assign execute_MEMORY_FORCE_CONSTISTENCY = decode_to_execute_MEMORY_FORCE_CONSTISTENCY;
  assign execute_MEMORY_MANAGMENT = decode_to_execute_MEMORY_MANAGMENT;
  assign execute_RS2 = decode_to_execute_RS2;
  assign execute_MEMORY_WR = decode_to_execute_MEMORY_WR;
  assign execute_SRC_ADD = execute_SrcPlugin_addSub;
  assign execute_MEMORY_ENABLE = decode_to_execute_MEMORY_ENABLE;
  assign execute_INSTRUCTION = decode_to_execute_INSTRUCTION;
  assign decode_MEMORY_ENABLE = _zz_decode_ENV_CTRL_2[4];
  assign decode_FLUSH_ALL = _zz_decode_ENV_CTRL_2[0];
  always @(*) begin
    IBusCachedPlugin_rsp_issueDetected_4 = IBusCachedPlugin_rsp_issueDetected_3;
    if(when_IBusCachedPlugin_l256) begin
      IBusCachedPlugin_rsp_issueDetected_4 = 1'b1;
    end
  end

  always @(*) begin
    IBusCachedPlugin_rsp_issueDetected_3 = IBusCachedPlugin_rsp_issueDetected_2;
    if(when_IBusCachedPlugin_l250) begin
      IBusCachedPlugin_rsp_issueDetected_3 = 1'b1;
    end
  end

  always @(*) begin
    IBusCachedPlugin_rsp_issueDetected_2 = IBusCachedPlugin_rsp_issueDetected_1;
    if(when_IBusCachedPlugin_l244) begin
      IBusCachedPlugin_rsp_issueDetected_2 = 1'b1;
    end
  end

  always @(*) begin
    IBusCachedPlugin_rsp_issueDetected_1 = IBusCachedPlugin_rsp_issueDetected;
    if(when_IBusCachedPlugin_l239) begin
      IBusCachedPlugin_rsp_issueDetected_1 = 1'b1;
    end
  end

  assign decode_BRANCH_CTRL = _zz_decode_BRANCH_CTRL_1;
  always @(*) begin
    _zz_memory_to_writeBack_FORMAL_PC_NEXT = memory_FORMAL_PC_NEXT;
    if(BranchPlugin_jumpInterface_valid) begin
      _zz_memory_to_writeBack_FORMAL_PC_NEXT = BranchPlugin_jumpInterface_payload;
    end
  end

  always @(*) begin
    _zz_decode_to_execute_FORMAL_PC_NEXT = decode_FORMAL_PC_NEXT;
    if(IBusCachedPlugin_predictionJumpInterface_valid) begin
      _zz_decode_to_execute_FORMAL_PC_NEXT = IBusCachedPlugin_predictionJumpInterface_payload;
    end
  end

  assign decode_PC = IBusCachedPlugin_decodePc_pcReg;
  assign decode_INSTRUCTION = IBusCachedPlugin_injector_decodeInput_payload_rsp_inst;
  assign decode_IS_RVC = IBusCachedPlugin_injector_decodeInput_payload_isRvc;
  assign writeBack_PC = memory_to_writeBack_PC;
  assign writeBack_INSTRUCTION = memory_to_writeBack_INSTRUCTION;
  always @(*) begin
    decode_arbitration_haltItself = 1'b0;
    if(when_DBusCachedPlugin_l307) begin
      decode_arbitration_haltItself = 1'b1;
    end
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
    if(when_HazardSimplePlugin_l113) begin
      decode_arbitration_haltByOther = 1'b1;
    end
    if(CsrPlugin_pipelineLiberator_active) begin
      decode_arbitration_haltByOther = 1'b1;
    end
    if(when_CsrPlugin_l1116) begin
      decode_arbitration_haltByOther = 1'b1;
    end
  end

  always @(*) begin
    decode_arbitration_removeIt = 1'b0;
    if(_zz_when) begin
      decode_arbitration_removeIt = 1'b1;
    end
    if(decode_arbitration_isFlushed) begin
      decode_arbitration_removeIt = 1'b1;
    end
  end

  assign decode_arbitration_flushIt = 1'b0;
  always @(*) begin
    decode_arbitration_flushNext = 1'b0;
    if(IBusCachedPlugin_predictionJumpInterface_valid) begin
      decode_arbitration_flushNext = 1'b1;
    end
    if(_zz_when) begin
      decode_arbitration_flushNext = 1'b1;
    end
  end

  always @(*) begin
    execute_arbitration_haltItself = 1'b0;
    if(when_DBusCachedPlugin_l347) begin
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
    if(when_DBusCachedPlugin_l363) begin
      execute_arbitration_haltByOther = 1'b1;
    end
    if(when_DebugPlugin_l295) begin
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
    if(when_DebugPlugin_l295) begin
      if(when_DebugPlugin_l298) begin
        execute_arbitration_flushIt = 1'b1;
      end
    end
  end

  always @(*) begin
    execute_arbitration_flushNext = 1'b0;
    if(when_DebugPlugin_l295) begin
      if(when_DebugPlugin_l298) begin
        execute_arbitration_flushNext = 1'b1;
      end
    end
    if(_zz_3) begin
      execute_arbitration_flushNext = 1'b1;
    end
  end

  always @(*) begin
    memory_arbitration_haltItself = 1'b0;
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

  always @(*) begin
    writeBack_arbitration_haltItself = 1'b0;
    if(when_DBusCachedPlugin_l462) begin
      writeBack_arbitration_haltItself = 1'b1;
    end
  end

  assign writeBack_arbitration_haltByOther = 1'b0;
  always @(*) begin
    writeBack_arbitration_removeIt = 1'b0;
    if(DBusCachedPlugin_exceptionBus_valid) begin
      writeBack_arbitration_removeIt = 1'b1;
    end
    if(writeBack_arbitration_isFlushed) begin
      writeBack_arbitration_removeIt = 1'b1;
    end
  end

  always @(*) begin
    writeBack_arbitration_flushIt = 1'b0;
    if(DBusCachedPlugin_redoBranch_valid) begin
      writeBack_arbitration_flushIt = 1'b1;
    end
  end

  always @(*) begin
    writeBack_arbitration_flushNext = 1'b0;
    if(DBusCachedPlugin_redoBranch_valid) begin
      writeBack_arbitration_flushNext = 1'b1;
    end
    if(DBusCachedPlugin_exceptionBus_valid) begin
      writeBack_arbitration_flushNext = 1'b1;
    end
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
    IBusCachedPlugin_fetcherHalt = 1'b0;
    if(when_CsrPlugin_l922) begin
      IBusCachedPlugin_fetcherHalt = 1'b1;
    end
    if(when_CsrPlugin_l1019) begin
      IBusCachedPlugin_fetcherHalt = 1'b1;
    end
    if(when_CsrPlugin_l1064) begin
      IBusCachedPlugin_fetcherHalt = 1'b1;
    end
    if(when_DebugPlugin_l295) begin
      if(when_DebugPlugin_l298) begin
        IBusCachedPlugin_fetcherHalt = 1'b1;
      end
    end
    if(DebugPlugin_haltIt) begin
      IBusCachedPlugin_fetcherHalt = 1'b1;
    end
    if(when_DebugPlugin_l311) begin
      IBusCachedPlugin_fetcherHalt = 1'b1;
    end
  end

  always @(*) begin
    IBusCachedPlugin_incomingInstruction = 1'b0;
    if(when_Fetcher_l240) begin
      IBusCachedPlugin_incomingInstruction = 1'b1;
    end
    if(IBusCachedPlugin_injector_decodeInput_valid) begin
      IBusCachedPlugin_incomingInstruction = 1'b1;
    end
  end

  always @(*) begin
    _zz_when_DBusCachedPlugin_l390 = 1'b0;
    if(DebugPlugin_godmode) begin
      _zz_when_DBusCachedPlugin_l390 = 1'b1;
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
    if(when_DebugPlugin_l327) begin
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

  assign IBusCachedPlugin_externalFlush = ({writeBack_arbitration_flushNext,{memory_arbitration_flushNext,{execute_arbitration_flushNext,decode_arbitration_flushNext}}} != 4'b0000);
  assign IBusCachedPlugin_jump_pcLoad_valid = ({CsrPlugin_jumpInterface_valid,{BranchPlugin_jumpInterface_valid,{DBusCachedPlugin_redoBranch_valid,IBusCachedPlugin_predictionJumpInterface_valid}}} != 4'b0000);
  assign _zz_IBusCachedPlugin_jump_pcLoad_payload = {IBusCachedPlugin_predictionJumpInterface_valid,{BranchPlugin_jumpInterface_valid,{CsrPlugin_jumpInterface_valid,DBusCachedPlugin_redoBranch_valid}}};
  assign _zz_IBusCachedPlugin_jump_pcLoad_payload_1 = (_zz_IBusCachedPlugin_jump_pcLoad_payload & (~ _zz__zz_IBusCachedPlugin_jump_pcLoad_payload_1));
  assign _zz_IBusCachedPlugin_jump_pcLoad_payload_2 = _zz_IBusCachedPlugin_jump_pcLoad_payload_1[3];
  assign _zz_IBusCachedPlugin_jump_pcLoad_payload_3 = (_zz_IBusCachedPlugin_jump_pcLoad_payload_1[1] || _zz_IBusCachedPlugin_jump_pcLoad_payload_2);
  assign _zz_IBusCachedPlugin_jump_pcLoad_payload_4 = (_zz_IBusCachedPlugin_jump_pcLoad_payload_1[2] || _zz_IBusCachedPlugin_jump_pcLoad_payload_2);
  assign IBusCachedPlugin_jump_pcLoad_payload = _zz_IBusCachedPlugin_jump_pcLoad_payload_5;
  always @(*) begin
    IBusCachedPlugin_fetchPc_correction = 1'b0;
    if(IBusCachedPlugin_fetchPc_redo_valid) begin
      IBusCachedPlugin_fetchPc_correction = 1'b1;
    end
    if(IBusCachedPlugin_jump_pcLoad_valid) begin
      IBusCachedPlugin_fetchPc_correction = 1'b1;
    end
  end

  assign IBusCachedPlugin_fetchPc_output_fire = (IBusCachedPlugin_fetchPc_output_valid && IBusCachedPlugin_fetchPc_output_ready);
  assign IBusCachedPlugin_fetchPc_corrected = (IBusCachedPlugin_fetchPc_correction || IBusCachedPlugin_fetchPc_correctionReg);
  always @(*) begin
    IBusCachedPlugin_fetchPc_pcRegPropagate = 1'b0;
    if(IBusCachedPlugin_iBusRsp_stages_1_input_ready) begin
      IBusCachedPlugin_fetchPc_pcRegPropagate = 1'b1;
    end
  end

  assign when_Fetcher_l131 = (IBusCachedPlugin_fetchPc_correction || IBusCachedPlugin_fetchPc_pcRegPropagate);
  assign IBusCachedPlugin_fetchPc_output_fire_1 = (IBusCachedPlugin_fetchPc_output_valid && IBusCachedPlugin_fetchPc_output_ready);
  assign when_Fetcher_l131_1 = ((! IBusCachedPlugin_fetchPc_output_valid) && IBusCachedPlugin_fetchPc_output_ready);
  always @(*) begin
    IBusCachedPlugin_fetchPc_pc = (IBusCachedPlugin_fetchPc_pcReg + _zz_IBusCachedPlugin_fetchPc_pc);
    if(IBusCachedPlugin_fetchPc_inc) begin
      IBusCachedPlugin_fetchPc_pc[1] = 1'b0;
    end
    if(IBusCachedPlugin_fetchPc_redo_valid) begin
      IBusCachedPlugin_fetchPc_pc = IBusCachedPlugin_fetchPc_redo_payload;
    end
    if(IBusCachedPlugin_jump_pcLoad_valid) begin
      IBusCachedPlugin_fetchPc_pc = IBusCachedPlugin_jump_pcLoad_payload;
    end
    IBusCachedPlugin_fetchPc_pc[0] = 1'b0;
  end

  always @(*) begin
    IBusCachedPlugin_fetchPc_flushed = 1'b0;
    if(IBusCachedPlugin_fetchPc_redo_valid) begin
      IBusCachedPlugin_fetchPc_flushed = 1'b1;
    end
    if(IBusCachedPlugin_jump_pcLoad_valid) begin
      IBusCachedPlugin_fetchPc_flushed = 1'b1;
    end
  end

  assign when_Fetcher_l158 = (IBusCachedPlugin_fetchPc_booted && ((IBusCachedPlugin_fetchPc_output_ready || IBusCachedPlugin_fetchPc_correction) || IBusCachedPlugin_fetchPc_pcRegPropagate));
  assign IBusCachedPlugin_fetchPc_output_valid = ((! IBusCachedPlugin_fetcherHalt) && IBusCachedPlugin_fetchPc_booted);
  assign IBusCachedPlugin_fetchPc_output_payload = IBusCachedPlugin_fetchPc_pc;
  always @(*) begin
    IBusCachedPlugin_decodePc_flushed = 1'b0;
    if(when_Fetcher_l192) begin
      IBusCachedPlugin_decodePc_flushed = 1'b1;
    end
  end

  assign IBusCachedPlugin_decodePc_pcPlus = (IBusCachedPlugin_decodePc_pcReg + _zz_IBusCachedPlugin_decodePc_pcPlus);
  always @(*) begin
    IBusCachedPlugin_decodePc_injectedDecode = 1'b0;
    if(when_Fetcher_l360) begin
      IBusCachedPlugin_decodePc_injectedDecode = 1'b1;
    end
  end

  assign when_Fetcher_l180 = (decode_arbitration_isFiring && (! IBusCachedPlugin_decodePc_injectedDecode));
  assign when_Fetcher_l192 = (IBusCachedPlugin_jump_pcLoad_valid && ((! decode_arbitration_isStuck) || decode_arbitration_removeIt));
  always @(*) begin
    IBusCachedPlugin_iBusRsp_redoFetch = 1'b0;
    if(IBusCachedPlugin_rsp_redoFetch) begin
      IBusCachedPlugin_iBusRsp_redoFetch = 1'b1;
    end
  end

  assign IBusCachedPlugin_iBusRsp_stages_0_input_valid = IBusCachedPlugin_fetchPc_output_valid;
  assign IBusCachedPlugin_fetchPc_output_ready = IBusCachedPlugin_iBusRsp_stages_0_input_ready;
  assign IBusCachedPlugin_iBusRsp_stages_0_input_payload = IBusCachedPlugin_fetchPc_output_payload;
  always @(*) begin
    IBusCachedPlugin_iBusRsp_stages_0_halt = 1'b0;
    if(IBusCachedPlugin_cache_io_cpu_prefetch_haltIt) begin
      IBusCachedPlugin_iBusRsp_stages_0_halt = 1'b1;
    end
  end

  assign _zz_IBusCachedPlugin_iBusRsp_stages_0_input_ready = (! IBusCachedPlugin_iBusRsp_stages_0_halt);
  assign IBusCachedPlugin_iBusRsp_stages_0_input_ready = (IBusCachedPlugin_iBusRsp_stages_0_output_ready && _zz_IBusCachedPlugin_iBusRsp_stages_0_input_ready);
  assign IBusCachedPlugin_iBusRsp_stages_0_output_valid = (IBusCachedPlugin_iBusRsp_stages_0_input_valid && _zz_IBusCachedPlugin_iBusRsp_stages_0_input_ready);
  assign IBusCachedPlugin_iBusRsp_stages_0_output_payload = IBusCachedPlugin_iBusRsp_stages_0_input_payload;
  always @(*) begin
    IBusCachedPlugin_iBusRsp_stages_1_halt = 1'b0;
    if(IBusCachedPlugin_mmuBus_busy) begin
      IBusCachedPlugin_iBusRsp_stages_1_halt = 1'b1;
    end
  end

  assign _zz_IBusCachedPlugin_iBusRsp_stages_1_input_ready = (! IBusCachedPlugin_iBusRsp_stages_1_halt);
  assign IBusCachedPlugin_iBusRsp_stages_1_input_ready = (IBusCachedPlugin_iBusRsp_stages_1_output_ready && _zz_IBusCachedPlugin_iBusRsp_stages_1_input_ready);
  assign IBusCachedPlugin_iBusRsp_stages_1_output_valid = (IBusCachedPlugin_iBusRsp_stages_1_input_valid && _zz_IBusCachedPlugin_iBusRsp_stages_1_input_ready);
  assign IBusCachedPlugin_iBusRsp_stages_1_output_payload = IBusCachedPlugin_iBusRsp_stages_1_input_payload;
  always @(*) begin
    IBusCachedPlugin_iBusRsp_stages_2_halt = 1'b0;
    if(when_IBusCachedPlugin_l267) begin
      IBusCachedPlugin_iBusRsp_stages_2_halt = 1'b1;
    end
  end

  assign _zz_IBusCachedPlugin_iBusRsp_stages_2_input_ready = (! IBusCachedPlugin_iBusRsp_stages_2_halt);
  assign IBusCachedPlugin_iBusRsp_stages_2_input_ready = (IBusCachedPlugin_iBusRsp_stages_2_output_ready && _zz_IBusCachedPlugin_iBusRsp_stages_2_input_ready);
  assign IBusCachedPlugin_iBusRsp_stages_2_output_valid = (IBusCachedPlugin_iBusRsp_stages_2_input_valid && _zz_IBusCachedPlugin_iBusRsp_stages_2_input_ready);
  assign IBusCachedPlugin_iBusRsp_stages_2_output_payload = IBusCachedPlugin_iBusRsp_stages_2_input_payload;
  assign IBusCachedPlugin_fetchPc_redo_valid = IBusCachedPlugin_iBusRsp_redoFetch;
  always @(*) begin
    IBusCachedPlugin_fetchPc_redo_payload = IBusCachedPlugin_iBusRsp_stages_2_input_payload;
    if(IBusCachedPlugin_decompressor_throw2BytesReg) begin
      IBusCachedPlugin_fetchPc_redo_payload[1] = 1'b1;
    end
  end

  assign IBusCachedPlugin_iBusRsp_flush = (IBusCachedPlugin_externalFlush || IBusCachedPlugin_iBusRsp_redoFetch);
  assign IBusCachedPlugin_iBusRsp_stages_0_output_ready = _zz_IBusCachedPlugin_iBusRsp_stages_0_output_ready;
  assign _zz_IBusCachedPlugin_iBusRsp_stages_0_output_ready = ((1'b0 && (! _zz_IBusCachedPlugin_iBusRsp_stages_0_output_ready_1)) || IBusCachedPlugin_iBusRsp_stages_1_input_ready);
  assign _zz_IBusCachedPlugin_iBusRsp_stages_0_output_ready_1 = _zz_IBusCachedPlugin_iBusRsp_stages_0_output_ready_2;
  assign IBusCachedPlugin_iBusRsp_stages_1_input_valid = _zz_IBusCachedPlugin_iBusRsp_stages_0_output_ready_1;
  assign IBusCachedPlugin_iBusRsp_stages_1_input_payload = IBusCachedPlugin_fetchPc_pcReg;
  assign IBusCachedPlugin_iBusRsp_stages_1_output_ready = ((1'b0 && (! IBusCachedPlugin_iBusRsp_stages_1_output_m2sPipe_valid)) || IBusCachedPlugin_iBusRsp_stages_1_output_m2sPipe_ready);
  assign IBusCachedPlugin_iBusRsp_stages_1_output_m2sPipe_valid = _zz_IBusCachedPlugin_iBusRsp_stages_1_output_m2sPipe_valid;
  assign IBusCachedPlugin_iBusRsp_stages_1_output_m2sPipe_payload = _zz_IBusCachedPlugin_iBusRsp_stages_1_output_m2sPipe_payload;
  assign IBusCachedPlugin_iBusRsp_stages_2_input_valid = IBusCachedPlugin_iBusRsp_stages_1_output_m2sPipe_valid;
  assign IBusCachedPlugin_iBusRsp_stages_1_output_m2sPipe_ready = IBusCachedPlugin_iBusRsp_stages_2_input_ready;
  assign IBusCachedPlugin_iBusRsp_stages_2_input_payload = IBusCachedPlugin_iBusRsp_stages_1_output_m2sPipe_payload;
  always @(*) begin
    IBusCachedPlugin_iBusRsp_readyForError = 1'b1;
    if(IBusCachedPlugin_injector_decodeInput_valid) begin
      IBusCachedPlugin_iBusRsp_readyForError = 1'b0;
    end
  end

  assign when_Fetcher_l240 = (IBusCachedPlugin_iBusRsp_stages_1_input_valid || IBusCachedPlugin_iBusRsp_stages_2_input_valid);
  assign IBusCachedPlugin_decompressor_input_valid = (IBusCachedPlugin_iBusRsp_output_valid && (! IBusCachedPlugin_iBusRsp_redoFetch));
  assign IBusCachedPlugin_decompressor_input_payload_pc = IBusCachedPlugin_iBusRsp_output_payload_pc;
  assign IBusCachedPlugin_decompressor_input_payload_rsp_error = IBusCachedPlugin_iBusRsp_output_payload_rsp_error;
  assign IBusCachedPlugin_decompressor_input_payload_rsp_inst = IBusCachedPlugin_iBusRsp_output_payload_rsp_inst;
  assign IBusCachedPlugin_decompressor_input_payload_isRvc = IBusCachedPlugin_iBusRsp_output_payload_isRvc;
  assign IBusCachedPlugin_iBusRsp_output_ready = IBusCachedPlugin_decompressor_input_ready;
  assign IBusCachedPlugin_decompressor_flushNext = 1'b0;
  assign IBusCachedPlugin_decompressor_consumeCurrent = 1'b0;
  assign IBusCachedPlugin_decompressor_isInputLowRvc = (IBusCachedPlugin_decompressor_input_payload_rsp_inst[1 : 0] != 2'b11);
  assign IBusCachedPlugin_decompressor_isInputHighRvc = (IBusCachedPlugin_decompressor_input_payload_rsp_inst[17 : 16] != 2'b11);
  assign IBusCachedPlugin_decompressor_throw2Bytes = (IBusCachedPlugin_decompressor_throw2BytesReg || IBusCachedPlugin_decompressor_input_payload_pc[1]);
  assign IBusCachedPlugin_decompressor_unaligned = (IBusCachedPlugin_decompressor_throw2Bytes || IBusCachedPlugin_decompressor_bufferValid);
  assign IBusCachedPlugin_decompressor_bufferValidPatched = (IBusCachedPlugin_decompressor_input_valid ? IBusCachedPlugin_decompressor_bufferValid : IBusCachedPlugin_decompressor_bufferValidLatch);
  assign IBusCachedPlugin_decompressor_throw2BytesPatched = (IBusCachedPlugin_decompressor_input_valid ? IBusCachedPlugin_decompressor_throw2Bytes : IBusCachedPlugin_decompressor_throw2BytesLatch);
  assign IBusCachedPlugin_decompressor_raw = (IBusCachedPlugin_decompressor_bufferValidPatched ? {IBusCachedPlugin_decompressor_input_payload_rsp_inst[15 : 0],IBusCachedPlugin_decompressor_bufferData} : {IBusCachedPlugin_decompressor_input_payload_rsp_inst[31 : 16],(IBusCachedPlugin_decompressor_throw2BytesPatched ? IBusCachedPlugin_decompressor_input_payload_rsp_inst[31 : 16] : IBusCachedPlugin_decompressor_input_payload_rsp_inst[15 : 0])});
  assign IBusCachedPlugin_decompressor_isRvc = (IBusCachedPlugin_decompressor_raw[1 : 0] != 2'b11);
  assign _zz_IBusCachedPlugin_decompressor_decompressed = IBusCachedPlugin_decompressor_raw[15 : 0];
  always @(*) begin
    IBusCachedPlugin_decompressor_decompressed = 32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
    case(switch_Misc_l44)
      5'h0 : begin
        IBusCachedPlugin_decompressor_decompressed = {{{{{{{{{2'b00,_zz_IBusCachedPlugin_decompressor_decompressed[10 : 7]},_zz_IBusCachedPlugin_decompressor_decompressed[12 : 11]},_zz_IBusCachedPlugin_decompressor_decompressed[5]},_zz_IBusCachedPlugin_decompressor_decompressed[6]},2'b00},5'h02},3'b000},_zz_IBusCachedPlugin_decompressor_decompressed_2},7'h13};
      end
      5'h02 : begin
        IBusCachedPlugin_decompressor_decompressed = {{{{_zz_IBusCachedPlugin_decompressor_decompressed_3,_zz_IBusCachedPlugin_decompressor_decompressed_1},3'b010},_zz_IBusCachedPlugin_decompressor_decompressed_2},7'h03};
      end
      5'h06 : begin
        IBusCachedPlugin_decompressor_decompressed = {{{{{_zz_IBusCachedPlugin_decompressor_decompressed_3[11 : 5],_zz_IBusCachedPlugin_decompressor_decompressed_2},_zz_IBusCachedPlugin_decompressor_decompressed_1},3'b010},_zz_IBusCachedPlugin_decompressor_decompressed_3[4 : 0]},7'h23};
      end
      5'h08 : begin
        IBusCachedPlugin_decompressor_decompressed = {{{{_zz_IBusCachedPlugin_decompressor_decompressed_5,_zz_IBusCachedPlugin_decompressor_decompressed[11 : 7]},3'b000},_zz_IBusCachedPlugin_decompressor_decompressed[11 : 7]},7'h13};
      end
      5'h09 : begin
        IBusCachedPlugin_decompressor_decompressed = {{{{{_zz_IBusCachedPlugin_decompressor_decompressed_8[20],_zz_IBusCachedPlugin_decompressor_decompressed_8[10 : 1]},_zz_IBusCachedPlugin_decompressor_decompressed_8[11]},_zz_IBusCachedPlugin_decompressor_decompressed_8[19 : 12]},_zz_IBusCachedPlugin_decompressor_decompressed_20},7'h6f};
      end
      5'h0a : begin
        IBusCachedPlugin_decompressor_decompressed = {{{{_zz_IBusCachedPlugin_decompressor_decompressed_5,5'h0},3'b000},_zz_IBusCachedPlugin_decompressor_decompressed[11 : 7]},7'h13};
      end
      5'h0b : begin
        IBusCachedPlugin_decompressor_decompressed = ((_zz_IBusCachedPlugin_decompressor_decompressed[11 : 7] == 5'h02) ? {{{{{{{{{_zz_IBusCachedPlugin_decompressor_decompressed_12,_zz_IBusCachedPlugin_decompressor_decompressed[4 : 3]},_zz_IBusCachedPlugin_decompressor_decompressed[5]},_zz_IBusCachedPlugin_decompressor_decompressed[2]},_zz_IBusCachedPlugin_decompressor_decompressed[6]},4'b0000},_zz_IBusCachedPlugin_decompressor_decompressed[11 : 7]},3'b000},_zz_IBusCachedPlugin_decompressor_decompressed[11 : 7]},7'h13} : {{_zz_IBusCachedPlugin_decompressor_decompressed_27[31 : 12],_zz_IBusCachedPlugin_decompressor_decompressed[11 : 7]},7'h37});
      end
      5'h0c : begin
        IBusCachedPlugin_decompressor_decompressed = {{{{{((_zz_IBusCachedPlugin_decompressor_decompressed[11 : 10] == 2'b10) ? _zz_IBusCachedPlugin_decompressor_decompressed_26 : {{1'b0,(_zz_IBusCachedPlugin_decompressor_decompressed_28 || _zz_IBusCachedPlugin_decompressor_decompressed_29)},5'h0}),(((! _zz_IBusCachedPlugin_decompressor_decompressed[11]) || _zz_IBusCachedPlugin_decompressor_decompressed_22) ? _zz_IBusCachedPlugin_decompressor_decompressed[6 : 2] : _zz_IBusCachedPlugin_decompressor_decompressed_2)},_zz_IBusCachedPlugin_decompressor_decompressed_1},_zz_IBusCachedPlugin_decompressor_decompressed_24},_zz_IBusCachedPlugin_decompressor_decompressed_1},(_zz_IBusCachedPlugin_decompressor_decompressed_22 ? 7'h13 : 7'h33)};
      end
      5'h0d : begin
        IBusCachedPlugin_decompressor_decompressed = {{{{{_zz_IBusCachedPlugin_decompressor_decompressed_15[20],_zz_IBusCachedPlugin_decompressor_decompressed_15[10 : 1]},_zz_IBusCachedPlugin_decompressor_decompressed_15[11]},_zz_IBusCachedPlugin_decompressor_decompressed_15[19 : 12]},_zz_IBusCachedPlugin_decompressor_decompressed_19},7'h6f};
      end
      5'h0e : begin
        IBusCachedPlugin_decompressor_decompressed = {{{{{{{_zz_IBusCachedPlugin_decompressor_decompressed_18[12],_zz_IBusCachedPlugin_decompressor_decompressed_18[10 : 5]},_zz_IBusCachedPlugin_decompressor_decompressed_19},_zz_IBusCachedPlugin_decompressor_decompressed_1},3'b000},_zz_IBusCachedPlugin_decompressor_decompressed_18[4 : 1]},_zz_IBusCachedPlugin_decompressor_decompressed_18[11]},7'h63};
      end
      5'h0f : begin
        IBusCachedPlugin_decompressor_decompressed = {{{{{{{_zz_IBusCachedPlugin_decompressor_decompressed_18[12],_zz_IBusCachedPlugin_decompressor_decompressed_18[10 : 5]},_zz_IBusCachedPlugin_decompressor_decompressed_19},_zz_IBusCachedPlugin_decompressor_decompressed_1},3'b001},_zz_IBusCachedPlugin_decompressor_decompressed_18[4 : 1]},_zz_IBusCachedPlugin_decompressor_decompressed_18[11]},7'h63};
      end
      5'h10 : begin
        IBusCachedPlugin_decompressor_decompressed = {{{{{7'h0,_zz_IBusCachedPlugin_decompressor_decompressed[6 : 2]},_zz_IBusCachedPlugin_decompressor_decompressed[11 : 7]},3'b001},_zz_IBusCachedPlugin_decompressor_decompressed[11 : 7]},7'h13};
      end
      5'h12 : begin
        IBusCachedPlugin_decompressor_decompressed = {{{{{{{{4'b0000,_zz_IBusCachedPlugin_decompressor_decompressed[3 : 2]},_zz_IBusCachedPlugin_decompressor_decompressed[12]},_zz_IBusCachedPlugin_decompressor_decompressed[6 : 4]},2'b00},_zz_IBusCachedPlugin_decompressor_decompressed_21},3'b010},_zz_IBusCachedPlugin_decompressor_decompressed[11 : 7]},7'h03};
      end
      5'h14 : begin
        IBusCachedPlugin_decompressor_decompressed = ((_zz_IBusCachedPlugin_decompressor_decompressed[12 : 2] == 11'h400) ? 32'h00100073 : ((_zz_IBusCachedPlugin_decompressor_decompressed[6 : 2] == 5'h0) ? {{{{12'h0,_zz_IBusCachedPlugin_decompressor_decompressed[11 : 7]},3'b000},(_zz_IBusCachedPlugin_decompressor_decompressed[12] ? _zz_IBusCachedPlugin_decompressor_decompressed_20 : _zz_IBusCachedPlugin_decompressor_decompressed_19)},7'h67} : {{{{{_zz_IBusCachedPlugin_decompressor_decompressed_30,_zz_IBusCachedPlugin_decompressor_decompressed_31},(_zz_IBusCachedPlugin_decompressor_decompressed_32 ? _zz_IBusCachedPlugin_decompressor_decompressed_33 : _zz_IBusCachedPlugin_decompressor_decompressed_19)},3'b000},_zz_IBusCachedPlugin_decompressor_decompressed[11 : 7]},7'h33}));
      end
      5'h16 : begin
        IBusCachedPlugin_decompressor_decompressed = {{{{{_zz_IBusCachedPlugin_decompressor_decompressed_34[11 : 5],_zz_IBusCachedPlugin_decompressor_decompressed[6 : 2]},_zz_IBusCachedPlugin_decompressor_decompressed_21},3'b010},_zz_IBusCachedPlugin_decompressor_decompressed_35[4 : 0]},7'h23};
      end
      default : begin
      end
    endcase
  end

  assign _zz_IBusCachedPlugin_decompressor_decompressed_1 = {2'b01,_zz_IBusCachedPlugin_decompressor_decompressed[9 : 7]};
  assign _zz_IBusCachedPlugin_decompressor_decompressed_2 = {2'b01,_zz_IBusCachedPlugin_decompressor_decompressed[4 : 2]};
  assign _zz_IBusCachedPlugin_decompressor_decompressed_3 = {{{{5'h0,_zz_IBusCachedPlugin_decompressor_decompressed[5]},_zz_IBusCachedPlugin_decompressor_decompressed[12 : 10]},_zz_IBusCachedPlugin_decompressor_decompressed[6]},2'b00};
  assign _zz_IBusCachedPlugin_decompressor_decompressed_4 = _zz_IBusCachedPlugin_decompressor_decompressed[12];
  always @(*) begin
    _zz_IBusCachedPlugin_decompressor_decompressed_5[11] = _zz_IBusCachedPlugin_decompressor_decompressed_4;
    _zz_IBusCachedPlugin_decompressor_decompressed_5[10] = _zz_IBusCachedPlugin_decompressor_decompressed_4;
    _zz_IBusCachedPlugin_decompressor_decompressed_5[9] = _zz_IBusCachedPlugin_decompressor_decompressed_4;
    _zz_IBusCachedPlugin_decompressor_decompressed_5[8] = _zz_IBusCachedPlugin_decompressor_decompressed_4;
    _zz_IBusCachedPlugin_decompressor_decompressed_5[7] = _zz_IBusCachedPlugin_decompressor_decompressed_4;
    _zz_IBusCachedPlugin_decompressor_decompressed_5[6] = _zz_IBusCachedPlugin_decompressor_decompressed_4;
    _zz_IBusCachedPlugin_decompressor_decompressed_5[5] = _zz_IBusCachedPlugin_decompressor_decompressed_4;
    _zz_IBusCachedPlugin_decompressor_decompressed_5[4 : 0] = _zz_IBusCachedPlugin_decompressor_decompressed[6 : 2];
  end

  assign _zz_IBusCachedPlugin_decompressor_decompressed_6 = _zz_IBusCachedPlugin_decompressor_decompressed[12];
  always @(*) begin
    _zz_IBusCachedPlugin_decompressor_decompressed_7[9] = _zz_IBusCachedPlugin_decompressor_decompressed_6;
    _zz_IBusCachedPlugin_decompressor_decompressed_7[8] = _zz_IBusCachedPlugin_decompressor_decompressed_6;
    _zz_IBusCachedPlugin_decompressor_decompressed_7[7] = _zz_IBusCachedPlugin_decompressor_decompressed_6;
    _zz_IBusCachedPlugin_decompressor_decompressed_7[6] = _zz_IBusCachedPlugin_decompressor_decompressed_6;
    _zz_IBusCachedPlugin_decompressor_decompressed_7[5] = _zz_IBusCachedPlugin_decompressor_decompressed_6;
    _zz_IBusCachedPlugin_decompressor_decompressed_7[4] = _zz_IBusCachedPlugin_decompressor_decompressed_6;
    _zz_IBusCachedPlugin_decompressor_decompressed_7[3] = _zz_IBusCachedPlugin_decompressor_decompressed_6;
    _zz_IBusCachedPlugin_decompressor_decompressed_7[2] = _zz_IBusCachedPlugin_decompressor_decompressed_6;
    _zz_IBusCachedPlugin_decompressor_decompressed_7[1] = _zz_IBusCachedPlugin_decompressor_decompressed_6;
    _zz_IBusCachedPlugin_decompressor_decompressed_7[0] = _zz_IBusCachedPlugin_decompressor_decompressed_6;
  end

  assign _zz_IBusCachedPlugin_decompressor_decompressed_8 = {{{{{{{{_zz_IBusCachedPlugin_decompressor_decompressed_7,_zz_IBusCachedPlugin_decompressor_decompressed[8]},_zz_IBusCachedPlugin_decompressor_decompressed[10 : 9]},_zz_IBusCachedPlugin_decompressor_decompressed[6]},_zz_IBusCachedPlugin_decompressor_decompressed[7]},_zz_IBusCachedPlugin_decompressor_decompressed[2]},_zz_IBusCachedPlugin_decompressor_decompressed[11]},_zz_IBusCachedPlugin_decompressor_decompressed[5 : 3]},1'b0};
  assign _zz_IBusCachedPlugin_decompressor_decompressed_9 = _zz_IBusCachedPlugin_decompressor_decompressed[12];
  always @(*) begin
    _zz_IBusCachedPlugin_decompressor_decompressed_10[14] = _zz_IBusCachedPlugin_decompressor_decompressed_9;
    _zz_IBusCachedPlugin_decompressor_decompressed_10[13] = _zz_IBusCachedPlugin_decompressor_decompressed_9;
    _zz_IBusCachedPlugin_decompressor_decompressed_10[12] = _zz_IBusCachedPlugin_decompressor_decompressed_9;
    _zz_IBusCachedPlugin_decompressor_decompressed_10[11] = _zz_IBusCachedPlugin_decompressor_decompressed_9;
    _zz_IBusCachedPlugin_decompressor_decompressed_10[10] = _zz_IBusCachedPlugin_decompressor_decompressed_9;
    _zz_IBusCachedPlugin_decompressor_decompressed_10[9] = _zz_IBusCachedPlugin_decompressor_decompressed_9;
    _zz_IBusCachedPlugin_decompressor_decompressed_10[8] = _zz_IBusCachedPlugin_decompressor_decompressed_9;
    _zz_IBusCachedPlugin_decompressor_decompressed_10[7] = _zz_IBusCachedPlugin_decompressor_decompressed_9;
    _zz_IBusCachedPlugin_decompressor_decompressed_10[6] = _zz_IBusCachedPlugin_decompressor_decompressed_9;
    _zz_IBusCachedPlugin_decompressor_decompressed_10[5] = _zz_IBusCachedPlugin_decompressor_decompressed_9;
    _zz_IBusCachedPlugin_decompressor_decompressed_10[4] = _zz_IBusCachedPlugin_decompressor_decompressed_9;
    _zz_IBusCachedPlugin_decompressor_decompressed_10[3] = _zz_IBusCachedPlugin_decompressor_decompressed_9;
    _zz_IBusCachedPlugin_decompressor_decompressed_10[2] = _zz_IBusCachedPlugin_decompressor_decompressed_9;
    _zz_IBusCachedPlugin_decompressor_decompressed_10[1] = _zz_IBusCachedPlugin_decompressor_decompressed_9;
    _zz_IBusCachedPlugin_decompressor_decompressed_10[0] = _zz_IBusCachedPlugin_decompressor_decompressed_9;
  end

  assign _zz_IBusCachedPlugin_decompressor_decompressed_11 = _zz_IBusCachedPlugin_decompressor_decompressed[12];
  always @(*) begin
    _zz_IBusCachedPlugin_decompressor_decompressed_12[2] = _zz_IBusCachedPlugin_decompressor_decompressed_11;
    _zz_IBusCachedPlugin_decompressor_decompressed_12[1] = _zz_IBusCachedPlugin_decompressor_decompressed_11;
    _zz_IBusCachedPlugin_decompressor_decompressed_12[0] = _zz_IBusCachedPlugin_decompressor_decompressed_11;
  end

  assign _zz_IBusCachedPlugin_decompressor_decompressed_13 = _zz_IBusCachedPlugin_decompressor_decompressed[12];
  always @(*) begin
    _zz_IBusCachedPlugin_decompressor_decompressed_14[9] = _zz_IBusCachedPlugin_decompressor_decompressed_13;
    _zz_IBusCachedPlugin_decompressor_decompressed_14[8] = _zz_IBusCachedPlugin_decompressor_decompressed_13;
    _zz_IBusCachedPlugin_decompressor_decompressed_14[7] = _zz_IBusCachedPlugin_decompressor_decompressed_13;
    _zz_IBusCachedPlugin_decompressor_decompressed_14[6] = _zz_IBusCachedPlugin_decompressor_decompressed_13;
    _zz_IBusCachedPlugin_decompressor_decompressed_14[5] = _zz_IBusCachedPlugin_decompressor_decompressed_13;
    _zz_IBusCachedPlugin_decompressor_decompressed_14[4] = _zz_IBusCachedPlugin_decompressor_decompressed_13;
    _zz_IBusCachedPlugin_decompressor_decompressed_14[3] = _zz_IBusCachedPlugin_decompressor_decompressed_13;
    _zz_IBusCachedPlugin_decompressor_decompressed_14[2] = _zz_IBusCachedPlugin_decompressor_decompressed_13;
    _zz_IBusCachedPlugin_decompressor_decompressed_14[1] = _zz_IBusCachedPlugin_decompressor_decompressed_13;
    _zz_IBusCachedPlugin_decompressor_decompressed_14[0] = _zz_IBusCachedPlugin_decompressor_decompressed_13;
  end

  assign _zz_IBusCachedPlugin_decompressor_decompressed_15 = {{{{{{{{_zz_IBusCachedPlugin_decompressor_decompressed_14,_zz_IBusCachedPlugin_decompressor_decompressed[8]},_zz_IBusCachedPlugin_decompressor_decompressed[10 : 9]},_zz_IBusCachedPlugin_decompressor_decompressed[6]},_zz_IBusCachedPlugin_decompressor_decompressed[7]},_zz_IBusCachedPlugin_decompressor_decompressed[2]},_zz_IBusCachedPlugin_decompressor_decompressed[11]},_zz_IBusCachedPlugin_decompressor_decompressed[5 : 3]},1'b0};
  assign _zz_IBusCachedPlugin_decompressor_decompressed_16 = _zz_IBusCachedPlugin_decompressor_decompressed[12];
  always @(*) begin
    _zz_IBusCachedPlugin_decompressor_decompressed_17[4] = _zz_IBusCachedPlugin_decompressor_decompressed_16;
    _zz_IBusCachedPlugin_decompressor_decompressed_17[3] = _zz_IBusCachedPlugin_decompressor_decompressed_16;
    _zz_IBusCachedPlugin_decompressor_decompressed_17[2] = _zz_IBusCachedPlugin_decompressor_decompressed_16;
    _zz_IBusCachedPlugin_decompressor_decompressed_17[1] = _zz_IBusCachedPlugin_decompressor_decompressed_16;
    _zz_IBusCachedPlugin_decompressor_decompressed_17[0] = _zz_IBusCachedPlugin_decompressor_decompressed_16;
  end

  assign _zz_IBusCachedPlugin_decompressor_decompressed_18 = {{{{{_zz_IBusCachedPlugin_decompressor_decompressed_17,_zz_IBusCachedPlugin_decompressor_decompressed[6 : 5]},_zz_IBusCachedPlugin_decompressor_decompressed[2]},_zz_IBusCachedPlugin_decompressor_decompressed[11 : 10]},_zz_IBusCachedPlugin_decompressor_decompressed[4 : 3]},1'b0};
  assign _zz_IBusCachedPlugin_decompressor_decompressed_19 = 5'h0;
  assign _zz_IBusCachedPlugin_decompressor_decompressed_20 = 5'h01;
  assign _zz_IBusCachedPlugin_decompressor_decompressed_21 = 5'h02;
  assign switch_Misc_l44 = {_zz_IBusCachedPlugin_decompressor_decompressed[1 : 0],_zz_IBusCachedPlugin_decompressor_decompressed[15 : 13]};
  assign _zz_IBusCachedPlugin_decompressor_decompressed_22 = (_zz_IBusCachedPlugin_decompressor_decompressed[11 : 10] != 2'b11);
  assign switch_Misc_l204 = _zz_IBusCachedPlugin_decompressor_decompressed[11 : 10];
  assign switch_Misc_l204_1 = _zz_IBusCachedPlugin_decompressor_decompressed[6 : 5];
  always @(*) begin
    case(switch_Misc_l204_1)
      2'b00 : begin
        _zz_IBusCachedPlugin_decompressor_decompressed_23 = 3'b000;
      end
      2'b01 : begin
        _zz_IBusCachedPlugin_decompressor_decompressed_23 = 3'b100;
      end
      2'b10 : begin
        _zz_IBusCachedPlugin_decompressor_decompressed_23 = 3'b110;
      end
      default : begin
        _zz_IBusCachedPlugin_decompressor_decompressed_23 = 3'b111;
      end
    endcase
  end

  always @(*) begin
    case(switch_Misc_l204)
      2'b00 : begin
        _zz_IBusCachedPlugin_decompressor_decompressed_24 = 3'b101;
      end
      2'b01 : begin
        _zz_IBusCachedPlugin_decompressor_decompressed_24 = 3'b101;
      end
      2'b10 : begin
        _zz_IBusCachedPlugin_decompressor_decompressed_24 = 3'b111;
      end
      default : begin
        _zz_IBusCachedPlugin_decompressor_decompressed_24 = _zz_IBusCachedPlugin_decompressor_decompressed_23;
      end
    endcase
  end

  assign _zz_IBusCachedPlugin_decompressor_decompressed_25 = _zz_IBusCachedPlugin_decompressor_decompressed[12];
  always @(*) begin
    _zz_IBusCachedPlugin_decompressor_decompressed_26[6] = _zz_IBusCachedPlugin_decompressor_decompressed_25;
    _zz_IBusCachedPlugin_decompressor_decompressed_26[5] = _zz_IBusCachedPlugin_decompressor_decompressed_25;
    _zz_IBusCachedPlugin_decompressor_decompressed_26[4] = _zz_IBusCachedPlugin_decompressor_decompressed_25;
    _zz_IBusCachedPlugin_decompressor_decompressed_26[3] = _zz_IBusCachedPlugin_decompressor_decompressed_25;
    _zz_IBusCachedPlugin_decompressor_decompressed_26[2] = _zz_IBusCachedPlugin_decompressor_decompressed_25;
    _zz_IBusCachedPlugin_decompressor_decompressed_26[1] = _zz_IBusCachedPlugin_decompressor_decompressed_25;
    _zz_IBusCachedPlugin_decompressor_decompressed_26[0] = _zz_IBusCachedPlugin_decompressor_decompressed_25;
  end

  assign IBusCachedPlugin_decompressor_output_valid = (IBusCachedPlugin_decompressor_input_valid && (! ((IBusCachedPlugin_decompressor_throw2Bytes && (! IBusCachedPlugin_decompressor_bufferValid)) && (! IBusCachedPlugin_decompressor_isInputHighRvc))));
  assign IBusCachedPlugin_decompressor_output_payload_pc = IBusCachedPlugin_decompressor_input_payload_pc;
  assign IBusCachedPlugin_decompressor_output_payload_isRvc = IBusCachedPlugin_decompressor_isRvc;
  assign IBusCachedPlugin_decompressor_output_payload_rsp_inst = (IBusCachedPlugin_decompressor_isRvc ? IBusCachedPlugin_decompressor_decompressed : IBusCachedPlugin_decompressor_raw);
  assign IBusCachedPlugin_decompressor_input_ready = (IBusCachedPlugin_decompressor_output_ready && (((! IBusCachedPlugin_iBusRsp_stages_2_input_valid) || IBusCachedPlugin_decompressor_flushNext) || ((! (IBusCachedPlugin_decompressor_bufferValid && IBusCachedPlugin_decompressor_isInputHighRvc)) && (! (((! IBusCachedPlugin_decompressor_unaligned) && IBusCachedPlugin_decompressor_isInputLowRvc) && IBusCachedPlugin_decompressor_isInputHighRvc)))));
  assign IBusCachedPlugin_decompressor_output_fire = (IBusCachedPlugin_decompressor_output_valid && IBusCachedPlugin_decompressor_output_ready);
  assign IBusCachedPlugin_decompressor_bufferFill = (((((! IBusCachedPlugin_decompressor_unaligned) && IBusCachedPlugin_decompressor_isInputLowRvc) && (! IBusCachedPlugin_decompressor_isInputHighRvc)) || (IBusCachedPlugin_decompressor_bufferValid && (! IBusCachedPlugin_decompressor_isInputHighRvc))) || ((IBusCachedPlugin_decompressor_throw2Bytes && (! IBusCachedPlugin_decompressor_isRvc)) && (! IBusCachedPlugin_decompressor_isInputHighRvc)));
  assign when_Fetcher_l283 = (IBusCachedPlugin_decompressor_output_ready && IBusCachedPlugin_decompressor_input_valid);
  assign when_Fetcher_l286 = (IBusCachedPlugin_decompressor_output_ready && IBusCachedPlugin_decompressor_input_valid);
  assign when_Fetcher_l291 = (IBusCachedPlugin_externalFlush || IBusCachedPlugin_decompressor_consumeCurrent);
  assign IBusCachedPlugin_decompressor_output_ready = ((1'b0 && (! IBusCachedPlugin_injector_decodeInput_valid)) || IBusCachedPlugin_injector_decodeInput_ready);
  assign IBusCachedPlugin_injector_decodeInput_valid = _zz_IBusCachedPlugin_injector_decodeInput_valid;
  assign IBusCachedPlugin_injector_decodeInput_payload_pc = _zz_IBusCachedPlugin_injector_decodeInput_payload_pc;
  assign IBusCachedPlugin_injector_decodeInput_payload_rsp_error = _zz_IBusCachedPlugin_injector_decodeInput_payload_rsp_error;
  assign IBusCachedPlugin_injector_decodeInput_payload_rsp_inst = _zz_IBusCachedPlugin_injector_decodeInput_payload_rsp_inst;
  assign IBusCachedPlugin_injector_decodeInput_payload_isRvc = _zz_IBusCachedPlugin_injector_decodeInput_payload_isRvc;
  assign when_Fetcher_l329 = (! 1'b0);
  assign when_Fetcher_l329_1 = (! execute_arbitration_isStuck);
  assign when_Fetcher_l329_2 = (! memory_arbitration_isStuck);
  assign when_Fetcher_l329_3 = (! writeBack_arbitration_isStuck);
  assign IBusCachedPlugin_pcValids_0 = IBusCachedPlugin_injector_nextPcCalc_valids_0;
  assign IBusCachedPlugin_pcValids_1 = IBusCachedPlugin_injector_nextPcCalc_valids_1;
  assign IBusCachedPlugin_pcValids_2 = IBusCachedPlugin_injector_nextPcCalc_valids_2;
  assign IBusCachedPlugin_pcValids_3 = IBusCachedPlugin_injector_nextPcCalc_valids_3;
  assign IBusCachedPlugin_injector_decodeInput_ready = (! decode_arbitration_isStuck);
  always @(*) begin
    decode_arbitration_isValid = IBusCachedPlugin_injector_decodeInput_valid;
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

  assign _zz_IBusCachedPlugin_decodePrediction_cmd_hadBranch = _zz__zz_IBusCachedPlugin_decodePrediction_cmd_hadBranch[11];
  always @(*) begin
    _zz_IBusCachedPlugin_decodePrediction_cmd_hadBranch_1[18] = _zz_IBusCachedPlugin_decodePrediction_cmd_hadBranch;
    _zz_IBusCachedPlugin_decodePrediction_cmd_hadBranch_1[17] = _zz_IBusCachedPlugin_decodePrediction_cmd_hadBranch;
    _zz_IBusCachedPlugin_decodePrediction_cmd_hadBranch_1[16] = _zz_IBusCachedPlugin_decodePrediction_cmd_hadBranch;
    _zz_IBusCachedPlugin_decodePrediction_cmd_hadBranch_1[15] = _zz_IBusCachedPlugin_decodePrediction_cmd_hadBranch;
    _zz_IBusCachedPlugin_decodePrediction_cmd_hadBranch_1[14] = _zz_IBusCachedPlugin_decodePrediction_cmd_hadBranch;
    _zz_IBusCachedPlugin_decodePrediction_cmd_hadBranch_1[13] = _zz_IBusCachedPlugin_decodePrediction_cmd_hadBranch;
    _zz_IBusCachedPlugin_decodePrediction_cmd_hadBranch_1[12] = _zz_IBusCachedPlugin_decodePrediction_cmd_hadBranch;
    _zz_IBusCachedPlugin_decodePrediction_cmd_hadBranch_1[11] = _zz_IBusCachedPlugin_decodePrediction_cmd_hadBranch;
    _zz_IBusCachedPlugin_decodePrediction_cmd_hadBranch_1[10] = _zz_IBusCachedPlugin_decodePrediction_cmd_hadBranch;
    _zz_IBusCachedPlugin_decodePrediction_cmd_hadBranch_1[9] = _zz_IBusCachedPlugin_decodePrediction_cmd_hadBranch;
    _zz_IBusCachedPlugin_decodePrediction_cmd_hadBranch_1[8] = _zz_IBusCachedPlugin_decodePrediction_cmd_hadBranch;
    _zz_IBusCachedPlugin_decodePrediction_cmd_hadBranch_1[7] = _zz_IBusCachedPlugin_decodePrediction_cmd_hadBranch;
    _zz_IBusCachedPlugin_decodePrediction_cmd_hadBranch_1[6] = _zz_IBusCachedPlugin_decodePrediction_cmd_hadBranch;
    _zz_IBusCachedPlugin_decodePrediction_cmd_hadBranch_1[5] = _zz_IBusCachedPlugin_decodePrediction_cmd_hadBranch;
    _zz_IBusCachedPlugin_decodePrediction_cmd_hadBranch_1[4] = _zz_IBusCachedPlugin_decodePrediction_cmd_hadBranch;
    _zz_IBusCachedPlugin_decodePrediction_cmd_hadBranch_1[3] = _zz_IBusCachedPlugin_decodePrediction_cmd_hadBranch;
    _zz_IBusCachedPlugin_decodePrediction_cmd_hadBranch_1[2] = _zz_IBusCachedPlugin_decodePrediction_cmd_hadBranch;
    _zz_IBusCachedPlugin_decodePrediction_cmd_hadBranch_1[1] = _zz_IBusCachedPlugin_decodePrediction_cmd_hadBranch;
    _zz_IBusCachedPlugin_decodePrediction_cmd_hadBranch_1[0] = _zz_IBusCachedPlugin_decodePrediction_cmd_hadBranch;
  end

  assign IBusCachedPlugin_decodePrediction_cmd_hadBranch = ((decode_BRANCH_CTRL == BranchCtrlEnum_JAL) || ((decode_BRANCH_CTRL == BranchCtrlEnum_B) && _zz_IBusCachedPlugin_decodePrediction_cmd_hadBranch_2[31]));
  assign IBusCachedPlugin_predictionJumpInterface_valid = (decode_arbitration_isValid && IBusCachedPlugin_decodePrediction_cmd_hadBranch);
  assign _zz_IBusCachedPlugin_predictionJumpInterface_payload = _zz__zz_IBusCachedPlugin_predictionJumpInterface_payload[19];
  always @(*) begin
    _zz_IBusCachedPlugin_predictionJumpInterface_payload_1[10] = _zz_IBusCachedPlugin_predictionJumpInterface_payload;
    _zz_IBusCachedPlugin_predictionJumpInterface_payload_1[9] = _zz_IBusCachedPlugin_predictionJumpInterface_payload;
    _zz_IBusCachedPlugin_predictionJumpInterface_payload_1[8] = _zz_IBusCachedPlugin_predictionJumpInterface_payload;
    _zz_IBusCachedPlugin_predictionJumpInterface_payload_1[7] = _zz_IBusCachedPlugin_predictionJumpInterface_payload;
    _zz_IBusCachedPlugin_predictionJumpInterface_payload_1[6] = _zz_IBusCachedPlugin_predictionJumpInterface_payload;
    _zz_IBusCachedPlugin_predictionJumpInterface_payload_1[5] = _zz_IBusCachedPlugin_predictionJumpInterface_payload;
    _zz_IBusCachedPlugin_predictionJumpInterface_payload_1[4] = _zz_IBusCachedPlugin_predictionJumpInterface_payload;
    _zz_IBusCachedPlugin_predictionJumpInterface_payload_1[3] = _zz_IBusCachedPlugin_predictionJumpInterface_payload;
    _zz_IBusCachedPlugin_predictionJumpInterface_payload_1[2] = _zz_IBusCachedPlugin_predictionJumpInterface_payload;
    _zz_IBusCachedPlugin_predictionJumpInterface_payload_1[1] = _zz_IBusCachedPlugin_predictionJumpInterface_payload;
    _zz_IBusCachedPlugin_predictionJumpInterface_payload_1[0] = _zz_IBusCachedPlugin_predictionJumpInterface_payload;
  end

  assign _zz_IBusCachedPlugin_predictionJumpInterface_payload_2 = _zz__zz_IBusCachedPlugin_predictionJumpInterface_payload_2[11];
  always @(*) begin
    _zz_IBusCachedPlugin_predictionJumpInterface_payload_3[18] = _zz_IBusCachedPlugin_predictionJumpInterface_payload_2;
    _zz_IBusCachedPlugin_predictionJumpInterface_payload_3[17] = _zz_IBusCachedPlugin_predictionJumpInterface_payload_2;
    _zz_IBusCachedPlugin_predictionJumpInterface_payload_3[16] = _zz_IBusCachedPlugin_predictionJumpInterface_payload_2;
    _zz_IBusCachedPlugin_predictionJumpInterface_payload_3[15] = _zz_IBusCachedPlugin_predictionJumpInterface_payload_2;
    _zz_IBusCachedPlugin_predictionJumpInterface_payload_3[14] = _zz_IBusCachedPlugin_predictionJumpInterface_payload_2;
    _zz_IBusCachedPlugin_predictionJumpInterface_payload_3[13] = _zz_IBusCachedPlugin_predictionJumpInterface_payload_2;
    _zz_IBusCachedPlugin_predictionJumpInterface_payload_3[12] = _zz_IBusCachedPlugin_predictionJumpInterface_payload_2;
    _zz_IBusCachedPlugin_predictionJumpInterface_payload_3[11] = _zz_IBusCachedPlugin_predictionJumpInterface_payload_2;
    _zz_IBusCachedPlugin_predictionJumpInterface_payload_3[10] = _zz_IBusCachedPlugin_predictionJumpInterface_payload_2;
    _zz_IBusCachedPlugin_predictionJumpInterface_payload_3[9] = _zz_IBusCachedPlugin_predictionJumpInterface_payload_2;
    _zz_IBusCachedPlugin_predictionJumpInterface_payload_3[8] = _zz_IBusCachedPlugin_predictionJumpInterface_payload_2;
    _zz_IBusCachedPlugin_predictionJumpInterface_payload_3[7] = _zz_IBusCachedPlugin_predictionJumpInterface_payload_2;
    _zz_IBusCachedPlugin_predictionJumpInterface_payload_3[6] = _zz_IBusCachedPlugin_predictionJumpInterface_payload_2;
    _zz_IBusCachedPlugin_predictionJumpInterface_payload_3[5] = _zz_IBusCachedPlugin_predictionJumpInterface_payload_2;
    _zz_IBusCachedPlugin_predictionJumpInterface_payload_3[4] = _zz_IBusCachedPlugin_predictionJumpInterface_payload_2;
    _zz_IBusCachedPlugin_predictionJumpInterface_payload_3[3] = _zz_IBusCachedPlugin_predictionJumpInterface_payload_2;
    _zz_IBusCachedPlugin_predictionJumpInterface_payload_3[2] = _zz_IBusCachedPlugin_predictionJumpInterface_payload_2;
    _zz_IBusCachedPlugin_predictionJumpInterface_payload_3[1] = _zz_IBusCachedPlugin_predictionJumpInterface_payload_2;
    _zz_IBusCachedPlugin_predictionJumpInterface_payload_3[0] = _zz_IBusCachedPlugin_predictionJumpInterface_payload_2;
  end

  assign IBusCachedPlugin_predictionJumpInterface_payload = (decode_PC + ((decode_BRANCH_CTRL == BranchCtrlEnum_JAL) ? {{_zz_IBusCachedPlugin_predictionJumpInterface_payload_1,{{{_zz_IBusCachedPlugin_predictionJumpInterface_payload_4,_zz_IBusCachedPlugin_predictionJumpInterface_payload_5},_zz_IBusCachedPlugin_predictionJumpInterface_payload_6},decode_INSTRUCTION[30 : 21]}},1'b0} : {{_zz_IBusCachedPlugin_predictionJumpInterface_payload_3,{{{_zz_IBusCachedPlugin_predictionJumpInterface_payload_7,_zz_IBusCachedPlugin_predictionJumpInterface_payload_8},decode_INSTRUCTION[30 : 25]},decode_INSTRUCTION[11 : 8]}},1'b0}));
  assign iBus_cmd_valid = IBusCachedPlugin_cache_io_mem_cmd_valid;
  always @(*) begin
    iBus_cmd_payload_address = IBusCachedPlugin_cache_io_mem_cmd_payload_address;
    iBus_cmd_payload_address = IBusCachedPlugin_cache_io_mem_cmd_payload_address;
  end

  assign iBus_cmd_payload_size = IBusCachedPlugin_cache_io_mem_cmd_payload_size;
  assign IBusCachedPlugin_s0_tightlyCoupledHit = 1'b0;
  assign IBusCachedPlugin_cache_io_cpu_prefetch_isValid = (IBusCachedPlugin_iBusRsp_stages_0_input_valid && (! IBusCachedPlugin_s0_tightlyCoupledHit));
  assign IBusCachedPlugin_cache_io_cpu_fetch_isValid = (IBusCachedPlugin_iBusRsp_stages_1_input_valid && (! IBusCachedPlugin_s1_tightlyCoupledHit));
  assign IBusCachedPlugin_cache_io_cpu_fetch_isStuck = (! IBusCachedPlugin_iBusRsp_stages_1_input_ready);
  assign IBusCachedPlugin_mmuBus_cmd_0_isValid = IBusCachedPlugin_cache_io_cpu_fetch_isValid;
  assign IBusCachedPlugin_mmuBus_cmd_0_isStuck = (! IBusCachedPlugin_iBusRsp_stages_1_input_ready);
  assign IBusCachedPlugin_mmuBus_cmd_0_virtualAddress = IBusCachedPlugin_iBusRsp_stages_1_input_payload;
  assign IBusCachedPlugin_mmuBus_cmd_0_bypassTranslation = 1'b0;
  assign IBusCachedPlugin_mmuBus_end = (IBusCachedPlugin_iBusRsp_stages_1_input_ready || IBusCachedPlugin_externalFlush);
  assign IBusCachedPlugin_cache_io_cpu_decode_isValid = (IBusCachedPlugin_iBusRsp_stages_2_input_valid && (! IBusCachedPlugin_s2_tightlyCoupledHit));
  assign IBusCachedPlugin_cache_io_cpu_decode_isStuck = (! IBusCachedPlugin_iBusRsp_stages_2_input_ready);
  assign IBusCachedPlugin_cache_io_cpu_decode_isUser = (CsrPlugin_privilege == 2'b00);
  assign IBusCachedPlugin_rsp_iBusRspOutputHalt = 1'b0;
  assign IBusCachedPlugin_rsp_issueDetected = 1'b0;
  always @(*) begin
    IBusCachedPlugin_rsp_redoFetch = 1'b0;
    if(when_IBusCachedPlugin_l239) begin
      IBusCachedPlugin_rsp_redoFetch = 1'b1;
    end
    if(when_IBusCachedPlugin_l250) begin
      IBusCachedPlugin_rsp_redoFetch = 1'b1;
    end
  end

  always @(*) begin
    IBusCachedPlugin_cache_io_cpu_fill_valid = (IBusCachedPlugin_rsp_redoFetch && (! IBusCachedPlugin_cache_io_cpu_decode_mmuRefilling));
    if(when_IBusCachedPlugin_l250) begin
      IBusCachedPlugin_cache_io_cpu_fill_valid = 1'b1;
    end
  end

  always @(*) begin
    IBusCachedPlugin_decodeExceptionPort_valid = 1'b0;
    if(when_IBusCachedPlugin_l244) begin
      IBusCachedPlugin_decodeExceptionPort_valid = IBusCachedPlugin_iBusRsp_readyForError;
    end
    if(when_IBusCachedPlugin_l256) begin
      IBusCachedPlugin_decodeExceptionPort_valid = IBusCachedPlugin_iBusRsp_readyForError;
    end
  end

  always @(*) begin
    IBusCachedPlugin_decodeExceptionPort_payload_code = 4'bxxxx;
    if(when_IBusCachedPlugin_l244) begin
      IBusCachedPlugin_decodeExceptionPort_payload_code = 4'b1100;
    end
    if(when_IBusCachedPlugin_l256) begin
      IBusCachedPlugin_decodeExceptionPort_payload_code = 4'b0001;
    end
  end

  assign IBusCachedPlugin_decodeExceptionPort_payload_badAddr = {IBusCachedPlugin_iBusRsp_stages_2_input_payload[31 : 2],2'b00};
  assign when_IBusCachedPlugin_l239 = ((IBusCachedPlugin_cache_io_cpu_decode_isValid && IBusCachedPlugin_cache_io_cpu_decode_mmuRefilling) && (! IBusCachedPlugin_rsp_issueDetected));
  assign when_IBusCachedPlugin_l244 = ((IBusCachedPlugin_cache_io_cpu_decode_isValid && IBusCachedPlugin_cache_io_cpu_decode_mmuException) && (! IBusCachedPlugin_rsp_issueDetected_1));
  assign when_IBusCachedPlugin_l250 = ((IBusCachedPlugin_cache_io_cpu_decode_isValid && IBusCachedPlugin_cache_io_cpu_decode_cacheMiss) && (! IBusCachedPlugin_rsp_issueDetected_2));
  assign when_IBusCachedPlugin_l256 = ((IBusCachedPlugin_cache_io_cpu_decode_isValid && IBusCachedPlugin_cache_io_cpu_decode_error) && (! IBusCachedPlugin_rsp_issueDetected_3));
  assign when_IBusCachedPlugin_l267 = (IBusCachedPlugin_rsp_issueDetected_4 || IBusCachedPlugin_rsp_iBusRspOutputHalt);
  assign IBusCachedPlugin_iBusRsp_output_valid = IBusCachedPlugin_iBusRsp_stages_2_output_valid;
  assign IBusCachedPlugin_iBusRsp_stages_2_output_ready = IBusCachedPlugin_iBusRsp_output_ready;
  assign IBusCachedPlugin_iBusRsp_output_payload_rsp_inst = IBusCachedPlugin_cache_io_cpu_decode_data;
  assign IBusCachedPlugin_iBusRsp_output_payload_pc = IBusCachedPlugin_iBusRsp_stages_2_output_payload;
  assign IBusCachedPlugin_cache_io_flush = (decode_arbitration_isValid && decode_FLUSH_ALL);
  assign dBus_cmd_valid = dataCache_1_io_mem_cmd_valid;
  assign dBus_cmd_payload_wr = dataCache_1_io_mem_cmd_payload_wr;
  assign dBus_cmd_payload_uncached = dataCache_1_io_mem_cmd_payload_uncached;
  assign dBus_cmd_payload_address = dataCache_1_io_mem_cmd_payload_address;
  assign dBus_cmd_payload_data = dataCache_1_io_mem_cmd_payload_data;
  assign dBus_cmd_payload_mask = dataCache_1_io_mem_cmd_payload_mask;
  assign dBus_cmd_payload_size = dataCache_1_io_mem_cmd_payload_size;
  assign dBus_cmd_payload_last = dataCache_1_io_mem_cmd_payload_last;
  assign when_DBusCachedPlugin_l307 = ((DBusCachedPlugin_mmuBus_busy && decode_arbitration_isValid) && decode_MEMORY_ENABLE);
  assign execute_DBusCachedPlugin_size = execute_INSTRUCTION[13 : 12];
  assign dataCache_1_io_cpu_execute_isValid = (execute_arbitration_isValid && execute_MEMORY_ENABLE);
  assign dataCache_1_io_cpu_execute_address = execute_SRC_ADD;
  always @(*) begin
    case(execute_DBusCachedPlugin_size)
      2'b00 : begin
        _zz_execute_MEMORY_STORE_DATA_RF = {{{execute_RS2[7 : 0],execute_RS2[7 : 0]},execute_RS2[7 : 0]},execute_RS2[7 : 0]};
      end
      2'b01 : begin
        _zz_execute_MEMORY_STORE_DATA_RF = {execute_RS2[15 : 0],execute_RS2[15 : 0]};
      end
      default : begin
        _zz_execute_MEMORY_STORE_DATA_RF = execute_RS2[31 : 0];
      end
    endcase
  end

  assign dataCache_1_io_cpu_flush_valid = (execute_arbitration_isValid && execute_MEMORY_MANAGMENT);
  assign dataCache_1_io_cpu_flush_isStall = (dataCache_1_io_cpu_flush_valid && (! dataCache_1_io_cpu_flush_ready));
  assign when_DBusCachedPlugin_l347 = (dataCache_1_io_cpu_flush_isStall || dataCache_1_io_cpu_execute_haltIt);
  assign when_DBusCachedPlugin_l363 = (dataCache_1_io_cpu_execute_refilling && execute_arbitration_isValid);
  assign dataCache_1_io_cpu_memory_isValid = (memory_arbitration_isValid && memory_MEMORY_ENABLE);
  assign dataCache_1_io_cpu_memory_address = memory_REGFILE_WRITE_DATA;
  assign DBusCachedPlugin_mmuBus_cmd_0_isValid = dataCache_1_io_cpu_memory_isValid;
  assign DBusCachedPlugin_mmuBus_cmd_0_isStuck = memory_arbitration_isStuck;
  assign DBusCachedPlugin_mmuBus_cmd_0_virtualAddress = dataCache_1_io_cpu_memory_address;
  assign DBusCachedPlugin_mmuBus_cmd_0_bypassTranslation = 1'b0;
  assign DBusCachedPlugin_mmuBus_end = ((! memory_arbitration_isStuck) || memory_arbitration_removeIt);
  always @(*) begin
    dataCache_1_io_cpu_memory_mmuRsp_isIoAccess = DBusCachedPlugin_mmuBus_rsp_isIoAccess;
    if(when_DBusCachedPlugin_l390) begin
      dataCache_1_io_cpu_memory_mmuRsp_isIoAccess = 1'b1;
    end
  end

  assign when_DBusCachedPlugin_l390 = (_zz_when_DBusCachedPlugin_l390 && (! dataCache_1_io_cpu_memory_isWrite));
  always @(*) begin
    dataCache_1_io_cpu_writeBack_isValid = (writeBack_arbitration_isValid && writeBack_MEMORY_ENABLE);
    if(writeBack_arbitration_haltByOther) begin
      dataCache_1_io_cpu_writeBack_isValid = 1'b0;
    end
  end

  assign dataCache_1_io_cpu_writeBack_isUser = (CsrPlugin_privilege == 2'b00);
  assign dataCache_1_io_cpu_writeBack_address = writeBack_REGFILE_WRITE_DATA;
  assign dataCache_1_io_cpu_writeBack_storeData[31 : 0] = writeBack_MEMORY_STORE_DATA_RF;
  always @(*) begin
    DBusCachedPlugin_redoBranch_valid = 1'b0;
    if(when_DBusCachedPlugin_l442) begin
      if(dataCache_1_io_cpu_redo) begin
        DBusCachedPlugin_redoBranch_valid = 1'b1;
      end
    end
  end

  assign DBusCachedPlugin_redoBranch_payload = writeBack_PC;
  always @(*) begin
    DBusCachedPlugin_exceptionBus_valid = 1'b0;
    if(when_DBusCachedPlugin_l442) begin
      if(dataCache_1_io_cpu_writeBack_accessError) begin
        DBusCachedPlugin_exceptionBus_valid = 1'b1;
      end
      if(dataCache_1_io_cpu_writeBack_mmuException) begin
        DBusCachedPlugin_exceptionBus_valid = 1'b1;
      end
      if(dataCache_1_io_cpu_writeBack_unalignedAccess) begin
        DBusCachedPlugin_exceptionBus_valid = 1'b1;
      end
      if(dataCache_1_io_cpu_redo) begin
        DBusCachedPlugin_exceptionBus_valid = 1'b0;
      end
    end
  end

  assign DBusCachedPlugin_exceptionBus_payload_badAddr = writeBack_REGFILE_WRITE_DATA;
  always @(*) begin
    DBusCachedPlugin_exceptionBus_payload_code = 4'bxxxx;
    if(when_DBusCachedPlugin_l442) begin
      if(dataCache_1_io_cpu_writeBack_accessError) begin
        DBusCachedPlugin_exceptionBus_payload_code = {1'd0, _zz_DBusCachedPlugin_exceptionBus_payload_code};
      end
      if(dataCache_1_io_cpu_writeBack_mmuException) begin
        DBusCachedPlugin_exceptionBus_payload_code = (writeBack_MEMORY_WR ? 4'b1111 : 4'b1101);
      end
      if(dataCache_1_io_cpu_writeBack_unalignedAccess) begin
        DBusCachedPlugin_exceptionBus_payload_code = {1'd0, _zz_DBusCachedPlugin_exceptionBus_payload_code_1};
      end
    end
  end

  assign when_DBusCachedPlugin_l442 = (writeBack_arbitration_isValid && writeBack_MEMORY_ENABLE);
  assign when_DBusCachedPlugin_l462 = (dataCache_1_io_cpu_writeBack_isValid && dataCache_1_io_cpu_writeBack_haltIt);
  assign writeBack_DBusCachedPlugin_rspSplits_0 = dataCache_1_io_cpu_writeBack_data[7 : 0];
  assign writeBack_DBusCachedPlugin_rspSplits_1 = dataCache_1_io_cpu_writeBack_data[15 : 8];
  assign writeBack_DBusCachedPlugin_rspSplits_2 = dataCache_1_io_cpu_writeBack_data[23 : 16];
  assign writeBack_DBusCachedPlugin_rspSplits_3 = dataCache_1_io_cpu_writeBack_data[31 : 24];
  always @(*) begin
    writeBack_DBusCachedPlugin_rspShifted[7 : 0] = _zz_writeBack_DBusCachedPlugin_rspShifted;
    writeBack_DBusCachedPlugin_rspShifted[15 : 8] = _zz_writeBack_DBusCachedPlugin_rspShifted_2;
    writeBack_DBusCachedPlugin_rspShifted[23 : 16] = writeBack_DBusCachedPlugin_rspSplits_2;
    writeBack_DBusCachedPlugin_rspShifted[31 : 24] = writeBack_DBusCachedPlugin_rspSplits_3;
  end

  assign writeBack_DBusCachedPlugin_rspRf = writeBack_DBusCachedPlugin_rspShifted[31 : 0];
  assign switch_Misc_l204_2 = writeBack_INSTRUCTION[13 : 12];
  assign _zz_writeBack_DBusCachedPlugin_rspFormated = (writeBack_DBusCachedPlugin_rspRf[7] && (! writeBack_INSTRUCTION[14]));
  always @(*) begin
    _zz_writeBack_DBusCachedPlugin_rspFormated_1[31] = _zz_writeBack_DBusCachedPlugin_rspFormated;
    _zz_writeBack_DBusCachedPlugin_rspFormated_1[30] = _zz_writeBack_DBusCachedPlugin_rspFormated;
    _zz_writeBack_DBusCachedPlugin_rspFormated_1[29] = _zz_writeBack_DBusCachedPlugin_rspFormated;
    _zz_writeBack_DBusCachedPlugin_rspFormated_1[28] = _zz_writeBack_DBusCachedPlugin_rspFormated;
    _zz_writeBack_DBusCachedPlugin_rspFormated_1[27] = _zz_writeBack_DBusCachedPlugin_rspFormated;
    _zz_writeBack_DBusCachedPlugin_rspFormated_1[26] = _zz_writeBack_DBusCachedPlugin_rspFormated;
    _zz_writeBack_DBusCachedPlugin_rspFormated_1[25] = _zz_writeBack_DBusCachedPlugin_rspFormated;
    _zz_writeBack_DBusCachedPlugin_rspFormated_1[24] = _zz_writeBack_DBusCachedPlugin_rspFormated;
    _zz_writeBack_DBusCachedPlugin_rspFormated_1[23] = _zz_writeBack_DBusCachedPlugin_rspFormated;
    _zz_writeBack_DBusCachedPlugin_rspFormated_1[22] = _zz_writeBack_DBusCachedPlugin_rspFormated;
    _zz_writeBack_DBusCachedPlugin_rspFormated_1[21] = _zz_writeBack_DBusCachedPlugin_rspFormated;
    _zz_writeBack_DBusCachedPlugin_rspFormated_1[20] = _zz_writeBack_DBusCachedPlugin_rspFormated;
    _zz_writeBack_DBusCachedPlugin_rspFormated_1[19] = _zz_writeBack_DBusCachedPlugin_rspFormated;
    _zz_writeBack_DBusCachedPlugin_rspFormated_1[18] = _zz_writeBack_DBusCachedPlugin_rspFormated;
    _zz_writeBack_DBusCachedPlugin_rspFormated_1[17] = _zz_writeBack_DBusCachedPlugin_rspFormated;
    _zz_writeBack_DBusCachedPlugin_rspFormated_1[16] = _zz_writeBack_DBusCachedPlugin_rspFormated;
    _zz_writeBack_DBusCachedPlugin_rspFormated_1[15] = _zz_writeBack_DBusCachedPlugin_rspFormated;
    _zz_writeBack_DBusCachedPlugin_rspFormated_1[14] = _zz_writeBack_DBusCachedPlugin_rspFormated;
    _zz_writeBack_DBusCachedPlugin_rspFormated_1[13] = _zz_writeBack_DBusCachedPlugin_rspFormated;
    _zz_writeBack_DBusCachedPlugin_rspFormated_1[12] = _zz_writeBack_DBusCachedPlugin_rspFormated;
    _zz_writeBack_DBusCachedPlugin_rspFormated_1[11] = _zz_writeBack_DBusCachedPlugin_rspFormated;
    _zz_writeBack_DBusCachedPlugin_rspFormated_1[10] = _zz_writeBack_DBusCachedPlugin_rspFormated;
    _zz_writeBack_DBusCachedPlugin_rspFormated_1[9] = _zz_writeBack_DBusCachedPlugin_rspFormated;
    _zz_writeBack_DBusCachedPlugin_rspFormated_1[8] = _zz_writeBack_DBusCachedPlugin_rspFormated;
    _zz_writeBack_DBusCachedPlugin_rspFormated_1[7 : 0] = writeBack_DBusCachedPlugin_rspRf[7 : 0];
  end

  assign _zz_writeBack_DBusCachedPlugin_rspFormated_2 = (writeBack_DBusCachedPlugin_rspRf[15] && (! writeBack_INSTRUCTION[14]));
  always @(*) begin
    _zz_writeBack_DBusCachedPlugin_rspFormated_3[31] = _zz_writeBack_DBusCachedPlugin_rspFormated_2;
    _zz_writeBack_DBusCachedPlugin_rspFormated_3[30] = _zz_writeBack_DBusCachedPlugin_rspFormated_2;
    _zz_writeBack_DBusCachedPlugin_rspFormated_3[29] = _zz_writeBack_DBusCachedPlugin_rspFormated_2;
    _zz_writeBack_DBusCachedPlugin_rspFormated_3[28] = _zz_writeBack_DBusCachedPlugin_rspFormated_2;
    _zz_writeBack_DBusCachedPlugin_rspFormated_3[27] = _zz_writeBack_DBusCachedPlugin_rspFormated_2;
    _zz_writeBack_DBusCachedPlugin_rspFormated_3[26] = _zz_writeBack_DBusCachedPlugin_rspFormated_2;
    _zz_writeBack_DBusCachedPlugin_rspFormated_3[25] = _zz_writeBack_DBusCachedPlugin_rspFormated_2;
    _zz_writeBack_DBusCachedPlugin_rspFormated_3[24] = _zz_writeBack_DBusCachedPlugin_rspFormated_2;
    _zz_writeBack_DBusCachedPlugin_rspFormated_3[23] = _zz_writeBack_DBusCachedPlugin_rspFormated_2;
    _zz_writeBack_DBusCachedPlugin_rspFormated_3[22] = _zz_writeBack_DBusCachedPlugin_rspFormated_2;
    _zz_writeBack_DBusCachedPlugin_rspFormated_3[21] = _zz_writeBack_DBusCachedPlugin_rspFormated_2;
    _zz_writeBack_DBusCachedPlugin_rspFormated_3[20] = _zz_writeBack_DBusCachedPlugin_rspFormated_2;
    _zz_writeBack_DBusCachedPlugin_rspFormated_3[19] = _zz_writeBack_DBusCachedPlugin_rspFormated_2;
    _zz_writeBack_DBusCachedPlugin_rspFormated_3[18] = _zz_writeBack_DBusCachedPlugin_rspFormated_2;
    _zz_writeBack_DBusCachedPlugin_rspFormated_3[17] = _zz_writeBack_DBusCachedPlugin_rspFormated_2;
    _zz_writeBack_DBusCachedPlugin_rspFormated_3[16] = _zz_writeBack_DBusCachedPlugin_rspFormated_2;
    _zz_writeBack_DBusCachedPlugin_rspFormated_3[15 : 0] = writeBack_DBusCachedPlugin_rspRf[15 : 0];
  end

  always @(*) begin
    case(switch_Misc_l204_2)
      2'b00 : begin
        writeBack_DBusCachedPlugin_rspFormated = _zz_writeBack_DBusCachedPlugin_rspFormated_1;
      end
      2'b01 : begin
        writeBack_DBusCachedPlugin_rspFormated = _zz_writeBack_DBusCachedPlugin_rspFormated_3;
      end
      default : begin
        writeBack_DBusCachedPlugin_rspFormated = writeBack_DBusCachedPlugin_rspRf;
      end
    endcase
  end

  assign when_DBusCachedPlugin_l488 = (writeBack_arbitration_isValid && writeBack_MEMORY_ENABLE);
  assign IBusCachedPlugin_mmuBus_rsp_physicalAddress = IBusCachedPlugin_mmuBus_cmd_0_virtualAddress;
  assign IBusCachedPlugin_mmuBus_rsp_allowRead = 1'b1;
  assign IBusCachedPlugin_mmuBus_rsp_allowWrite = 1'b1;
  assign IBusCachedPlugin_mmuBus_rsp_allowExecute = 1'b1;
  assign IBusCachedPlugin_mmuBus_rsp_isIoAccess = (IBusCachedPlugin_mmuBus_rsp_physicalAddress[31 : 28] == 4'b1111);
  assign IBusCachedPlugin_mmuBus_rsp_isPaging = 1'b0;
  assign IBusCachedPlugin_mmuBus_rsp_exception = 1'b0;
  assign IBusCachedPlugin_mmuBus_rsp_refilling = 1'b0;
  assign IBusCachedPlugin_mmuBus_busy = 1'b0;
  assign DBusCachedPlugin_mmuBus_rsp_physicalAddress = DBusCachedPlugin_mmuBus_cmd_0_virtualAddress;
  assign DBusCachedPlugin_mmuBus_rsp_allowRead = 1'b1;
  assign DBusCachedPlugin_mmuBus_rsp_allowWrite = 1'b1;
  assign DBusCachedPlugin_mmuBus_rsp_allowExecute = 1'b1;
  assign DBusCachedPlugin_mmuBus_rsp_isIoAccess = (DBusCachedPlugin_mmuBus_rsp_physicalAddress[31 : 28] == 4'b1111);
  assign DBusCachedPlugin_mmuBus_rsp_isPaging = 1'b0;
  assign DBusCachedPlugin_mmuBus_rsp_exception = 1'b0;
  assign DBusCachedPlugin_mmuBus_rsp_refilling = 1'b0;
  assign DBusCachedPlugin_mmuBus_busy = 1'b0;
  assign _zz_decode_ENV_CTRL_3 = ((decode_INSTRUCTION & 32'h00004050) == 32'h00004050);
  assign _zz_decode_ENV_CTRL_4 = ((decode_INSTRUCTION & 32'h00000018) == 32'h0);
  assign _zz_decode_ENV_CTRL_5 = ((decode_INSTRUCTION & 32'h00000004) == 32'h00000004);
  assign _zz_decode_ENV_CTRL_6 = ((decode_INSTRUCTION & 32'h00000048) == 32'h00000048);
  assign _zz_decode_ENV_CTRL_7 = ((decode_INSTRUCTION & 32'h00001000) == 32'h0);
  assign _zz_decode_ENV_CTRL_2 = {(|((decode_INSTRUCTION & 32'h10003050) == 32'h00000050)),{(|((decode_INSTRUCTION & _zz__zz_decode_ENV_CTRL_2) == 32'h00000050)),{(|{_zz__zz_decode_ENV_CTRL_2_1,_zz__zz_decode_ENV_CTRL_2_2}),{(|{_zz__zz_decode_ENV_CTRL_2_3,_zz__zz_decode_ENV_CTRL_2_4}),{(|_zz__zz_decode_ENV_CTRL_2_5),{_zz__zz_decode_ENV_CTRL_2_6,{_zz__zz_decode_ENV_CTRL_2_7,_zz__zz_decode_ENV_CTRL_2_8}}}}}}};
  assign _zz_decode_SRC1_CTRL_2 = _zz_decode_ENV_CTRL_2[2 : 1];
  assign _zz_decode_SRC1_CTRL_1 = _zz_decode_SRC1_CTRL_2;
  assign _zz_decode_ALU_CTRL_2 = _zz_decode_ENV_CTRL_2[7 : 6];
  assign _zz_decode_ALU_CTRL_1 = _zz_decode_ALU_CTRL_2;
  assign _zz_decode_SRC2_CTRL_2 = _zz_decode_ENV_CTRL_2[9 : 8];
  assign _zz_decode_SRC2_CTRL_1 = _zz_decode_SRC2_CTRL_2;
  assign _zz_decode_ALU_BITWISE_CTRL_2 = _zz_decode_ENV_CTRL_2[19 : 18];
  assign _zz_decode_ALU_BITWISE_CTRL_1 = _zz_decode_ALU_BITWISE_CTRL_2;
  assign _zz_decode_SHIFT_CTRL_2 = _zz_decode_ENV_CTRL_2[22 : 21];
  assign _zz_decode_SHIFT_CTRL_1 = _zz_decode_SHIFT_CTRL_2;
  assign _zz_decode_BRANCH_CTRL_2 = _zz_decode_ENV_CTRL_2[28 : 27];
  assign _zz_decode_BRANCH_CTRL = _zz_decode_BRANCH_CTRL_2;
  assign _zz_decode_ENV_CTRL_8 = _zz_decode_ENV_CTRL_2[30 : 30];
  assign _zz_decode_ENV_CTRL_1 = _zz_decode_ENV_CTRL_8;
  assign decodeExceptionPort_valid = (decode_arbitration_isValid && (! decode_LEGAL_INSTRUCTION));
  assign decodeExceptionPort_payload_code = 4'b0010;
  assign decodeExceptionPort_payload_badAddr = decode_INSTRUCTION;
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
      AluBitwiseCtrlEnum_AND_1 : begin
        execute_IntAluPlugin_bitwise = (execute_SRC1 & execute_SRC2);
      end
      AluBitwiseCtrlEnum_OR_1 : begin
        execute_IntAluPlugin_bitwise = (execute_SRC1 | execute_SRC2);
      end
      default : begin
        execute_IntAluPlugin_bitwise = (execute_SRC1 ^ execute_SRC2);
      end
    endcase
  end

  always @(*) begin
    case(execute_ALU_CTRL)
      AluCtrlEnum_BITWISE : begin
        _zz_execute_REGFILE_WRITE_DATA = execute_IntAluPlugin_bitwise;
      end
      AluCtrlEnum_SLT_SLTU : begin
        _zz_execute_REGFILE_WRITE_DATA = {31'd0, _zz__zz_execute_REGFILE_WRITE_DATA};
      end
      default : begin
        _zz_execute_REGFILE_WRITE_DATA = execute_SRC_ADD_SUB;
      end
    endcase
  end

  always @(*) begin
    case(execute_SRC1_CTRL)
      Src1CtrlEnum_RS : begin
        _zz_execute_SRC1 = execute_RS1;
      end
      Src1CtrlEnum_PC_INCREMENT : begin
        _zz_execute_SRC1 = {29'd0, _zz__zz_execute_SRC1};
      end
      Src1CtrlEnum_IMU : begin
        _zz_execute_SRC1 = {execute_INSTRUCTION[31 : 12],12'h0};
      end
      default : begin
        _zz_execute_SRC1 = {27'd0, _zz__zz_execute_SRC1_1};
      end
    endcase
  end

  assign _zz_execute_SRC2_1 = execute_INSTRUCTION[31];
  always @(*) begin
    _zz_execute_SRC2_2[19] = _zz_execute_SRC2_1;
    _zz_execute_SRC2_2[18] = _zz_execute_SRC2_1;
    _zz_execute_SRC2_2[17] = _zz_execute_SRC2_1;
    _zz_execute_SRC2_2[16] = _zz_execute_SRC2_1;
    _zz_execute_SRC2_2[15] = _zz_execute_SRC2_1;
    _zz_execute_SRC2_2[14] = _zz_execute_SRC2_1;
    _zz_execute_SRC2_2[13] = _zz_execute_SRC2_1;
    _zz_execute_SRC2_2[12] = _zz_execute_SRC2_1;
    _zz_execute_SRC2_2[11] = _zz_execute_SRC2_1;
    _zz_execute_SRC2_2[10] = _zz_execute_SRC2_1;
    _zz_execute_SRC2_2[9] = _zz_execute_SRC2_1;
    _zz_execute_SRC2_2[8] = _zz_execute_SRC2_1;
    _zz_execute_SRC2_2[7] = _zz_execute_SRC2_1;
    _zz_execute_SRC2_2[6] = _zz_execute_SRC2_1;
    _zz_execute_SRC2_2[5] = _zz_execute_SRC2_1;
    _zz_execute_SRC2_2[4] = _zz_execute_SRC2_1;
    _zz_execute_SRC2_2[3] = _zz_execute_SRC2_1;
    _zz_execute_SRC2_2[2] = _zz_execute_SRC2_1;
    _zz_execute_SRC2_2[1] = _zz_execute_SRC2_1;
    _zz_execute_SRC2_2[0] = _zz_execute_SRC2_1;
  end

  assign _zz_execute_SRC2_3 = _zz__zz_execute_SRC2_3[11];
  always @(*) begin
    _zz_execute_SRC2_4[19] = _zz_execute_SRC2_3;
    _zz_execute_SRC2_4[18] = _zz_execute_SRC2_3;
    _zz_execute_SRC2_4[17] = _zz_execute_SRC2_3;
    _zz_execute_SRC2_4[16] = _zz_execute_SRC2_3;
    _zz_execute_SRC2_4[15] = _zz_execute_SRC2_3;
    _zz_execute_SRC2_4[14] = _zz_execute_SRC2_3;
    _zz_execute_SRC2_4[13] = _zz_execute_SRC2_3;
    _zz_execute_SRC2_4[12] = _zz_execute_SRC2_3;
    _zz_execute_SRC2_4[11] = _zz_execute_SRC2_3;
    _zz_execute_SRC2_4[10] = _zz_execute_SRC2_3;
    _zz_execute_SRC2_4[9] = _zz_execute_SRC2_3;
    _zz_execute_SRC2_4[8] = _zz_execute_SRC2_3;
    _zz_execute_SRC2_4[7] = _zz_execute_SRC2_3;
    _zz_execute_SRC2_4[6] = _zz_execute_SRC2_3;
    _zz_execute_SRC2_4[5] = _zz_execute_SRC2_3;
    _zz_execute_SRC2_4[4] = _zz_execute_SRC2_3;
    _zz_execute_SRC2_4[3] = _zz_execute_SRC2_3;
    _zz_execute_SRC2_4[2] = _zz_execute_SRC2_3;
    _zz_execute_SRC2_4[1] = _zz_execute_SRC2_3;
    _zz_execute_SRC2_4[0] = _zz_execute_SRC2_3;
  end

  always @(*) begin
    case(execute_SRC2_CTRL)
      Src2CtrlEnum_RS : begin
        _zz_execute_SRC2_5 = execute_RS2;
      end
      Src2CtrlEnum_IMI : begin
        _zz_execute_SRC2_5 = {_zz_execute_SRC2_2,execute_INSTRUCTION[31 : 20]};
      end
      Src2CtrlEnum_IMS : begin
        _zz_execute_SRC2_5 = {_zz_execute_SRC2_4,{execute_INSTRUCTION[31 : 25],execute_INSTRUCTION[11 : 7]}};
      end
      default : begin
        _zz_execute_SRC2_5 = _zz_execute_SRC2;
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

  assign execute_FullBarrelShifterPlugin_reversed = ((execute_SHIFT_CTRL == ShiftCtrlEnum_SLL_1) ? _zz_execute_FullBarrelShifterPlugin_reversed : execute_SRC1);
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
  assign switch_Misc_l204_3 = execute_INSTRUCTION[14 : 12];
  always @(*) begin
    casez(switch_Misc_l204_3)
      3'b000 : begin
        _zz_execute_BRANCH_COND_RESULT = execute_BranchPlugin_eq;
      end
      3'b001 : begin
        _zz_execute_BRANCH_COND_RESULT = (! execute_BranchPlugin_eq);
      end
      3'b1?1 : begin
        _zz_execute_BRANCH_COND_RESULT = (! execute_SRC_LESS);
      end
      default : begin
        _zz_execute_BRANCH_COND_RESULT = execute_SRC_LESS;
      end
    endcase
  end

  always @(*) begin
    case(execute_BRANCH_CTRL)
      BranchCtrlEnum_INC : begin
        _zz_execute_BRANCH_COND_RESULT_1 = 1'b0;
      end
      BranchCtrlEnum_JAL : begin
        _zz_execute_BRANCH_COND_RESULT_1 = 1'b1;
      end
      BranchCtrlEnum_JALR : begin
        _zz_execute_BRANCH_COND_RESULT_1 = 1'b1;
      end
      default : begin
        _zz_execute_BRANCH_COND_RESULT_1 = _zz_execute_BRANCH_COND_RESULT;
      end
    endcase
  end

  assign execute_BranchPlugin_missAlignedTarget = 1'b0;
  always @(*) begin
    case(execute_BRANCH_CTRL)
      BranchCtrlEnum_JALR : begin
        execute_BranchPlugin_branch_src1 = execute_RS1;
      end
      default : begin
        execute_BranchPlugin_branch_src1 = execute_PC;
      end
    endcase
  end

  assign _zz_execute_BranchPlugin_branch_src2 = execute_INSTRUCTION[31];
  always @(*) begin
    _zz_execute_BranchPlugin_branch_src2_1[19] = _zz_execute_BranchPlugin_branch_src2;
    _zz_execute_BranchPlugin_branch_src2_1[18] = _zz_execute_BranchPlugin_branch_src2;
    _zz_execute_BranchPlugin_branch_src2_1[17] = _zz_execute_BranchPlugin_branch_src2;
    _zz_execute_BranchPlugin_branch_src2_1[16] = _zz_execute_BranchPlugin_branch_src2;
    _zz_execute_BranchPlugin_branch_src2_1[15] = _zz_execute_BranchPlugin_branch_src2;
    _zz_execute_BranchPlugin_branch_src2_1[14] = _zz_execute_BranchPlugin_branch_src2;
    _zz_execute_BranchPlugin_branch_src2_1[13] = _zz_execute_BranchPlugin_branch_src2;
    _zz_execute_BranchPlugin_branch_src2_1[12] = _zz_execute_BranchPlugin_branch_src2;
    _zz_execute_BranchPlugin_branch_src2_1[11] = _zz_execute_BranchPlugin_branch_src2;
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

  always @(*) begin
    case(execute_BRANCH_CTRL)
      BranchCtrlEnum_JALR : begin
        execute_BranchPlugin_branch_src2 = {_zz_execute_BranchPlugin_branch_src2_1,execute_INSTRUCTION[31 : 20]};
      end
      default : begin
        execute_BranchPlugin_branch_src2 = ((execute_BRANCH_CTRL == BranchCtrlEnum_JAL) ? {{_zz_execute_BranchPlugin_branch_src2_3,{{{_zz_execute_BranchPlugin_branch_src2_6,execute_INSTRUCTION[19 : 12]},execute_INSTRUCTION[20]},execute_INSTRUCTION[30 : 21]}},1'b0} : {{_zz_execute_BranchPlugin_branch_src2_5,{{{_zz_execute_BranchPlugin_branch_src2_7,_zz_execute_BranchPlugin_branch_src2_8},execute_INSTRUCTION[30 : 25]},execute_INSTRUCTION[11 : 8]}},1'b0});
        if(execute_PREDICTION_HAD_BRANCHED2) begin
          execute_BranchPlugin_branch_src2 = {29'd0, _zz_execute_BranchPlugin_branch_src2_9};
        end
      end
    endcase
  end

  assign _zz_execute_BranchPlugin_branch_src2_2 = _zz__zz_execute_BranchPlugin_branch_src2_2[19];
  always @(*) begin
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

  assign execute_BranchPlugin_branchAdder = (execute_BranchPlugin_branch_src1 + execute_BranchPlugin_branch_src2);
  assign BranchPlugin_jumpInterface_valid = ((memory_arbitration_isValid && memory_BRANCH_DO) && (! 1'b0));
  assign BranchPlugin_jumpInterface_payload = memory_BRANCH_CALC;
  assign IBusCachedPlugin_decodePrediction_rsp_wasWrong = BranchPlugin_jumpInterface_valid;
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
  assign CsrPlugin_exceptionPortCtrl_exceptionTargetPrivilegeUncapped = 2'b11;
  assign CsrPlugin_exceptionPortCtrl_exceptionTargetPrivilege = ((CsrPlugin_privilege < CsrPlugin_exceptionPortCtrl_exceptionTargetPrivilegeUncapped) ? CsrPlugin_exceptionPortCtrl_exceptionTargetPrivilegeUncapped : CsrPlugin_privilege);
  assign _zz_CsrPlugin_exceptionPortCtrl_exceptionContext_code = {decodeExceptionPort_valid,IBusCachedPlugin_decodeExceptionPort_valid};
  assign _zz_CsrPlugin_exceptionPortCtrl_exceptionContext_code_1 = _zz__zz_CsrPlugin_exceptionPortCtrl_exceptionContext_code_1[0];
  always @(*) begin
    CsrPlugin_exceptionPortCtrl_exceptionValids_decode = CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_decode;
    if(_zz_when) begin
      CsrPlugin_exceptionPortCtrl_exceptionValids_decode = 1'b1;
    end
    if(decode_arbitration_isFlushed) begin
      CsrPlugin_exceptionPortCtrl_exceptionValids_decode = 1'b0;
    end
  end

  always @(*) begin
    CsrPlugin_exceptionPortCtrl_exceptionValids_execute = CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_execute;
    if(execute_arbitration_isFlushed) begin
      CsrPlugin_exceptionPortCtrl_exceptionValids_execute = 1'b0;
    end
  end

  always @(*) begin
    CsrPlugin_exceptionPortCtrl_exceptionValids_memory = CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_memory;
    if(memory_arbitration_isFlushed) begin
      CsrPlugin_exceptionPortCtrl_exceptionValids_memory = 1'b0;
    end
  end

  always @(*) begin
    CsrPlugin_exceptionPortCtrl_exceptionValids_writeBack = CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_writeBack;
    if(DBusCachedPlugin_exceptionBus_valid) begin
      CsrPlugin_exceptionPortCtrl_exceptionValids_writeBack = 1'b1;
    end
    if(writeBack_arbitration_isFlushed) begin
      CsrPlugin_exceptionPortCtrl_exceptionValids_writeBack = 1'b0;
    end
  end

  assign when_CsrPlugin_l909 = (! decode_arbitration_isStuck);
  assign when_CsrPlugin_l909_1 = (! execute_arbitration_isStuck);
  assign when_CsrPlugin_l909_2 = (! memory_arbitration_isStuck);
  assign when_CsrPlugin_l909_3 = (! writeBack_arbitration_isStuck);
  assign when_CsrPlugin_l922 = ({CsrPlugin_exceptionPortCtrl_exceptionValids_writeBack,{CsrPlugin_exceptionPortCtrl_exceptionValids_memory,{CsrPlugin_exceptionPortCtrl_exceptionValids_execute,CsrPlugin_exceptionPortCtrl_exceptionValids_decode}}} != 4'b0000);
  assign CsrPlugin_exceptionPendings_0 = CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_decode;
  assign CsrPlugin_exceptionPendings_1 = CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_execute;
  assign CsrPlugin_exceptionPendings_2 = CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_memory;
  assign CsrPlugin_exceptionPendings_3 = CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_writeBack;
  assign when_CsrPlugin_l946 = (CsrPlugin_mstatus_MIE || (CsrPlugin_privilege < 2'b11));
  assign when_CsrPlugin_l952 = ((_zz_when_CsrPlugin_l952 && 1'b1) && (! 1'b0));
  assign when_CsrPlugin_l952_1 = ((_zz_when_CsrPlugin_l952_1 && 1'b1) && (! 1'b0));
  assign when_CsrPlugin_l952_2 = ((_zz_when_CsrPlugin_l952_2 && 1'b1) && (! 1'b0));
  assign CsrPlugin_exception = (CsrPlugin_exceptionPortCtrl_exceptionValids_writeBack && CsrPlugin_allowException);
  assign CsrPlugin_lastStageWasWfi = 1'b0;
  assign CsrPlugin_pipelineLiberator_active = ((CsrPlugin_interrupt_valid && CsrPlugin_allowInterrupts) && decode_arbitration_isValid);
  assign when_CsrPlugin_l980 = (! execute_arbitration_isStuck);
  assign when_CsrPlugin_l980_1 = (! memory_arbitration_isStuck);
  assign when_CsrPlugin_l980_2 = (! writeBack_arbitration_isStuck);
  assign when_CsrPlugin_l985 = ((! CsrPlugin_pipelineLiberator_active) || decode_arbitration_removeIt);
  always @(*) begin
    CsrPlugin_pipelineLiberator_done = CsrPlugin_pipelineLiberator_pcValids_2;
    if(when_CsrPlugin_l991) begin
      CsrPlugin_pipelineLiberator_done = 1'b0;
    end
    if(CsrPlugin_hadException) begin
      CsrPlugin_pipelineLiberator_done = 1'b0;
    end
  end

  assign when_CsrPlugin_l991 = ({CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_writeBack,{CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_memory,CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_execute}} != 3'b000);
  assign CsrPlugin_interruptJump = ((CsrPlugin_interrupt_valid && CsrPlugin_pipelineLiberator_done) && CsrPlugin_allowInterrupts);
  always @(*) begin
    CsrPlugin_targetPrivilege = CsrPlugin_interrupt_targetPrivilege;
    if(CsrPlugin_hadException) begin
      CsrPlugin_targetPrivilege = CsrPlugin_exceptionPortCtrl_exceptionTargetPrivilege;
    end
  end

  always @(*) begin
    CsrPlugin_trapCause = CsrPlugin_interrupt_code;
    if(CsrPlugin_hadException) begin
      CsrPlugin_trapCause = CsrPlugin_exceptionPortCtrl_exceptionContext_code;
    end
  end

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
  assign when_CsrPlugin_l1064 = (writeBack_arbitration_isValid && (writeBack_ENV_CTRL == EnvCtrlEnum_XRET));
  assign switch_CsrPlugin_l1068 = writeBack_INSTRUCTION[29 : 28];
  assign contextSwitching = CsrPlugin_jumpInterface_valid;
  assign when_CsrPlugin_l1116 = (|{(writeBack_arbitration_isValid && (writeBack_ENV_CTRL == EnvCtrlEnum_XRET)),{(memory_arbitration_isValid && (memory_ENV_CTRL == EnvCtrlEnum_XRET)),(execute_arbitration_isValid && (execute_ENV_CTRL == EnvCtrlEnum_XRET))}});
  assign execute_CsrPlugin_blockedBySideEffects = ((|{writeBack_arbitration_isValid,memory_arbitration_isValid}) || 1'b0);
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
      execute_CsrPlugin_illegalAccess = 1'b0;
    end
    if(execute_CsrPlugin_csr_833) begin
      execute_CsrPlugin_illegalAccess = 1'b0;
    end
    if(execute_CsrPlugin_csr_834) begin
      if(execute_CSR_READ_OPCODE) begin
        execute_CsrPlugin_illegalAccess = 1'b0;
      end
    end
    if(execute_CsrPlugin_csr_835) begin
      if(execute_CSR_READ_OPCODE) begin
        execute_CsrPlugin_illegalAccess = 1'b0;
      end
    end
    if(execute_CsrPlugin_csr_2816) begin
      if(execute_CSR_READ_OPCODE) begin
        execute_CsrPlugin_illegalAccess = 1'b0;
      end
    end
    if(execute_CsrPlugin_csr_2944) begin
      if(execute_CSR_READ_OPCODE) begin
        execute_CsrPlugin_illegalAccess = 1'b0;
      end
    end
    if(execute_CsrPlugin_csr_2818) begin
      if(execute_CSR_READ_OPCODE) begin
        execute_CsrPlugin_illegalAccess = 1'b0;
      end
    end
    if(execute_CsrPlugin_csr_2946) begin
      if(execute_CSR_READ_OPCODE) begin
        execute_CsrPlugin_illegalAccess = 1'b0;
      end
    end
    if(execute_CsrPlugin_csr_3072) begin
      if(execute_CSR_READ_OPCODE) begin
        execute_CsrPlugin_illegalAccess = 1'b0;
      end
    end
    if(execute_CsrPlugin_csr_3200) begin
      if(execute_CSR_READ_OPCODE) begin
        execute_CsrPlugin_illegalAccess = 1'b0;
      end
    end
    if(execute_CsrPlugin_csr_3074) begin
      if(execute_CSR_READ_OPCODE) begin
        execute_CsrPlugin_illegalAccess = 1'b0;
      end
    end
    if(execute_CsrPlugin_csr_3202) begin
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

  assign when_CsrPlugin_l1136 = (execute_arbitration_isValid && (execute_ENV_CTRL == EnvCtrlEnum_XRET));
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
  assign switch_Misc_l204_4 = execute_INSTRUCTION[13];
  always @(*) begin
    case(switch_Misc_l204_4)
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
  assign when_DebugPlugin_l225 = (DebugPlugin_haltIt && (! DebugPlugin_isPipBusy));
  assign DebugPlugin_allowEBreak = (DebugPlugin_debugUsed && (! DebugPlugin_disableEbreak));
  always @(*) begin
    debug_bus_cmd_ready = 1'b1;
    if(debug_bus_cmd_valid) begin
      case(switch_DebugPlugin_l267)
        6'h01 : begin
          if(debug_bus_cmd_payload_wr) begin
            debug_bus_cmd_ready = IBusCachedPlugin_injectionPort_ready;
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
    IBusCachedPlugin_injectionPort_valid = 1'b0;
    if(debug_bus_cmd_valid) begin
      case(switch_DebugPlugin_l267)
        6'h01 : begin
          if(debug_bus_cmd_payload_wr) begin
            IBusCachedPlugin_injectionPort_valid = 1'b1;
          end
        end
        default : begin
        end
      endcase
    end
  end

  assign IBusCachedPlugin_injectionPort_payload = debug_bus_cmd_payload_data;
  assign switch_DebugPlugin_l267 = debug_bus_cmd_payload_address[7 : 2];
  assign when_DebugPlugin_l271 = debug_bus_cmd_payload_data[16];
  assign when_DebugPlugin_l271_1 = debug_bus_cmd_payload_data[24];
  assign when_DebugPlugin_l272 = debug_bus_cmd_payload_data[17];
  assign when_DebugPlugin_l272_1 = debug_bus_cmd_payload_data[25];
  assign when_DebugPlugin_l273 = debug_bus_cmd_payload_data[25];
  assign when_DebugPlugin_l274 = debug_bus_cmd_payload_data[25];
  assign when_DebugPlugin_l275 = debug_bus_cmd_payload_data[18];
  assign when_DebugPlugin_l275_1 = debug_bus_cmd_payload_data[26];
  assign when_DebugPlugin_l295 = (execute_arbitration_isValid && execute_DO_EBREAK);
  assign when_DebugPlugin_l298 = (({writeBack_arbitration_isValid,memory_arbitration_isValid} != 2'b00) == 1'b0);
  assign when_DebugPlugin_l311 = (DebugPlugin_stepIt && IBusCachedPlugin_incomingInstruction);
  assign debug_resetOut = DebugPlugin_resetIt_regNext;
  assign when_DebugPlugin_l327 = (DebugPlugin_haltIt || DebugPlugin_stepIt);
  assign when_Pipeline_l124 = (! execute_arbitration_isStuck);
  assign when_Pipeline_l124_1 = (! memory_arbitration_isStuck);
  assign when_Pipeline_l124_2 = ((! writeBack_arbitration_isStuck) && (! CsrPlugin_exceptionPortCtrl_exceptionValids_writeBack));
  assign when_Pipeline_l124_3 = (! execute_arbitration_isStuck);
  assign when_Pipeline_l124_4 = (! memory_arbitration_isStuck);
  assign when_Pipeline_l124_5 = (! writeBack_arbitration_isStuck);
  assign when_Pipeline_l124_6 = (! execute_arbitration_isStuck);
  assign when_Pipeline_l124_7 = (! execute_arbitration_isStuck);
  assign when_Pipeline_l124_8 = (! memory_arbitration_isStuck);
  assign when_Pipeline_l124_9 = (! writeBack_arbitration_isStuck);
  assign when_Pipeline_l124_10 = (! execute_arbitration_isStuck);
  assign _zz_decode_to_execute_SRC1_CTRL_1 = decode_SRC1_CTRL;
  assign _zz_decode_SRC1_CTRL = _zz_decode_SRC1_CTRL_1;
  assign when_Pipeline_l124_11 = (! execute_arbitration_isStuck);
  assign _zz_execute_SRC1_CTRL = decode_to_execute_SRC1_CTRL;
  assign when_Pipeline_l124_12 = (! execute_arbitration_isStuck);
  assign when_Pipeline_l124_13 = (! execute_arbitration_isStuck);
  assign when_Pipeline_l124_14 = (! memory_arbitration_isStuck);
  assign when_Pipeline_l124_15 = (! writeBack_arbitration_isStuck);
  assign _zz_decode_to_execute_ALU_CTRL_1 = decode_ALU_CTRL;
  assign _zz_decode_ALU_CTRL = _zz_decode_ALU_CTRL_1;
  assign when_Pipeline_l124_16 = (! execute_arbitration_isStuck);
  assign _zz_execute_ALU_CTRL = decode_to_execute_ALU_CTRL;
  assign _zz_decode_to_execute_SRC2_CTRL_1 = decode_SRC2_CTRL;
  assign _zz_decode_SRC2_CTRL = _zz_decode_SRC2_CTRL_1;
  assign when_Pipeline_l124_17 = (! execute_arbitration_isStuck);
  assign _zz_execute_SRC2_CTRL = decode_to_execute_SRC2_CTRL;
  assign when_Pipeline_l124_18 = (! execute_arbitration_isStuck);
  assign when_Pipeline_l124_19 = (! memory_arbitration_isStuck);
  assign when_Pipeline_l124_20 = (! writeBack_arbitration_isStuck);
  assign when_Pipeline_l124_21 = (! execute_arbitration_isStuck);
  assign when_Pipeline_l124_22 = (! execute_arbitration_isStuck);
  assign when_Pipeline_l124_23 = (! memory_arbitration_isStuck);
  assign when_Pipeline_l124_24 = (! execute_arbitration_isStuck);
  assign when_Pipeline_l124_25 = (! memory_arbitration_isStuck);
  assign when_Pipeline_l124_26 = (! writeBack_arbitration_isStuck);
  assign when_Pipeline_l124_27 = (! execute_arbitration_isStuck);
  assign when_Pipeline_l124_28 = (! execute_arbitration_isStuck);
  assign _zz_decode_to_execute_ALU_BITWISE_CTRL_1 = decode_ALU_BITWISE_CTRL;
  assign _zz_decode_ALU_BITWISE_CTRL = _zz_decode_ALU_BITWISE_CTRL_1;
  assign when_Pipeline_l124_29 = (! execute_arbitration_isStuck);
  assign _zz_execute_ALU_BITWISE_CTRL = decode_to_execute_ALU_BITWISE_CTRL;
  assign _zz_decode_to_execute_SHIFT_CTRL_1 = decode_SHIFT_CTRL;
  assign _zz_execute_to_memory_SHIFT_CTRL_1 = execute_SHIFT_CTRL;
  assign _zz_decode_SHIFT_CTRL = _zz_decode_SHIFT_CTRL_1;
  assign when_Pipeline_l124_30 = (! execute_arbitration_isStuck);
  assign _zz_execute_SHIFT_CTRL = decode_to_execute_SHIFT_CTRL;
  assign when_Pipeline_l124_31 = (! memory_arbitration_isStuck);
  assign _zz_memory_SHIFT_CTRL = execute_to_memory_SHIFT_CTRL;
  assign when_Pipeline_l124_32 = (! execute_arbitration_isStuck);
  assign when_Pipeline_l124_33 = (! memory_arbitration_isStuck);
  assign when_Pipeline_l124_34 = (! writeBack_arbitration_isStuck);
  assign when_Pipeline_l124_35 = (! execute_arbitration_isStuck);
  assign when_Pipeline_l124_36 = (! memory_arbitration_isStuck);
  assign when_Pipeline_l124_37 = (! execute_arbitration_isStuck);
  assign when_Pipeline_l124_38 = (! execute_arbitration_isStuck);
  assign _zz_decode_to_execute_BRANCH_CTRL_1 = decode_BRANCH_CTRL;
  assign _zz_decode_BRANCH_CTRL_1 = _zz_decode_BRANCH_CTRL;
  assign when_Pipeline_l124_39 = (! execute_arbitration_isStuck);
  assign _zz_execute_BRANCH_CTRL = decode_to_execute_BRANCH_CTRL;
  assign when_Pipeline_l124_40 = (! execute_arbitration_isStuck);
  assign _zz_decode_to_execute_ENV_CTRL_1 = decode_ENV_CTRL;
  assign _zz_execute_to_memory_ENV_CTRL_1 = execute_ENV_CTRL;
  assign _zz_memory_to_writeBack_ENV_CTRL_1 = memory_ENV_CTRL;
  assign _zz_decode_ENV_CTRL = _zz_decode_ENV_CTRL_1;
  assign when_Pipeline_l124_41 = (! execute_arbitration_isStuck);
  assign _zz_execute_ENV_CTRL = decode_to_execute_ENV_CTRL;
  assign when_Pipeline_l124_42 = (! memory_arbitration_isStuck);
  assign _zz_memory_ENV_CTRL = execute_to_memory_ENV_CTRL;
  assign when_Pipeline_l124_43 = (! writeBack_arbitration_isStuck);
  assign _zz_writeBack_ENV_CTRL = memory_to_writeBack_ENV_CTRL;
  assign when_Pipeline_l124_44 = (! execute_arbitration_isStuck);
  assign when_Pipeline_l124_45 = (! execute_arbitration_isStuck);
  assign when_Pipeline_l124_46 = (! execute_arbitration_isStuck);
  assign when_Pipeline_l124_47 = (! execute_arbitration_isStuck);
  assign when_Pipeline_l124_48 = (! execute_arbitration_isStuck);
  assign when_Pipeline_l124_49 = (! execute_arbitration_isStuck);
  assign when_Pipeline_l124_50 = (! execute_arbitration_isStuck);
  assign when_Pipeline_l124_51 = (! memory_arbitration_isStuck);
  assign when_Pipeline_l124_52 = (! writeBack_arbitration_isStuck);
  assign when_Pipeline_l124_53 = (! memory_arbitration_isStuck);
  assign when_Pipeline_l124_54 = (! writeBack_arbitration_isStuck);
  assign when_Pipeline_l124_55 = (! memory_arbitration_isStuck);
  assign when_Pipeline_l124_56 = (! memory_arbitration_isStuck);
  assign when_Pipeline_l124_57 = (! memory_arbitration_isStuck);
  assign when_Pipeline_l124_58 = (! memory_arbitration_isStuck);
  assign when_Pipeline_l124_59 = (! memory_arbitration_isStuck);
  assign when_Pipeline_l124_60 = (! writeBack_arbitration_isStuck);
  assign when_Pipeline_l124_61 = (! memory_arbitration_isStuck);
  assign when_Pipeline_l124_62 = (! memory_arbitration_isStuck);
  assign when_Pipeline_l124_63 = (! writeBack_arbitration_isStuck);
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
    IBusCachedPlugin_injectionPort_ready = 1'b0;
    case(switch_Fetcher_l362)
      3'b100 : begin
        IBusCachedPlugin_injectionPort_ready = 1'b1;
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
  assign when_CsrPlugin_l1264_5 = (! execute_arbitration_isStuck);
  assign when_CsrPlugin_l1264_6 = (! execute_arbitration_isStuck);
  assign when_CsrPlugin_l1264_7 = (! execute_arbitration_isStuck);
  assign when_CsrPlugin_l1264_8 = (! execute_arbitration_isStuck);
  assign when_CsrPlugin_l1264_9 = (! execute_arbitration_isStuck);
  assign when_CsrPlugin_l1264_10 = (! execute_arbitration_isStuck);
  assign when_CsrPlugin_l1264_11 = (! execute_arbitration_isStuck);
  assign when_CsrPlugin_l1264_12 = (! execute_arbitration_isStuck);
  assign when_CsrPlugin_l1264_13 = (! execute_arbitration_isStuck);
  assign when_CsrPlugin_l1264_14 = (! execute_arbitration_isStuck);
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
    if(execute_CsrPlugin_csr_773) begin
      _zz_CsrPlugin_csrMapping_readDataInit_3[31 : 2] = CsrPlugin_mtvec_base;
      _zz_CsrPlugin_csrMapping_readDataInit_3[1 : 0] = CsrPlugin_mtvec_mode;
    end
  end

  always @(*) begin
    _zz_CsrPlugin_csrMapping_readDataInit_4 = 32'h0;
    if(execute_CsrPlugin_csr_833) begin
      _zz_CsrPlugin_csrMapping_readDataInit_4[31 : 0] = CsrPlugin_mepc;
    end
  end

  always @(*) begin
    _zz_CsrPlugin_csrMapping_readDataInit_5 = 32'h0;
    if(execute_CsrPlugin_csr_834) begin
      _zz_CsrPlugin_csrMapping_readDataInit_5[31 : 31] = CsrPlugin_mcause_interrupt;
      _zz_CsrPlugin_csrMapping_readDataInit_5[3 : 0] = CsrPlugin_mcause_exceptionCode;
    end
  end

  always @(*) begin
    _zz_CsrPlugin_csrMapping_readDataInit_6 = 32'h0;
    if(execute_CsrPlugin_csr_835) begin
      _zz_CsrPlugin_csrMapping_readDataInit_6[31 : 0] = CsrPlugin_mtval;
    end
  end

  always @(*) begin
    _zz_CsrPlugin_csrMapping_readDataInit_7 = 32'h0;
    if(execute_CsrPlugin_csr_2816) begin
      _zz_CsrPlugin_csrMapping_readDataInit_7[31 : 0] = CsrPlugin_mcycle[31 : 0];
    end
  end

  always @(*) begin
    _zz_CsrPlugin_csrMapping_readDataInit_8 = 32'h0;
    if(execute_CsrPlugin_csr_2944) begin
      _zz_CsrPlugin_csrMapping_readDataInit_8[31 : 0] = CsrPlugin_mcycle[63 : 32];
    end
  end

  always @(*) begin
    _zz_CsrPlugin_csrMapping_readDataInit_9 = 32'h0;
    if(execute_CsrPlugin_csr_2818) begin
      _zz_CsrPlugin_csrMapping_readDataInit_9[31 : 0] = CsrPlugin_minstret[31 : 0];
    end
  end

  always @(*) begin
    _zz_CsrPlugin_csrMapping_readDataInit_10 = 32'h0;
    if(execute_CsrPlugin_csr_2946) begin
      _zz_CsrPlugin_csrMapping_readDataInit_10[31 : 0] = CsrPlugin_minstret[63 : 32];
    end
  end

  always @(*) begin
    _zz_CsrPlugin_csrMapping_readDataInit_11 = 32'h0;
    if(execute_CsrPlugin_csr_3072) begin
      _zz_CsrPlugin_csrMapping_readDataInit_11[31 : 0] = CsrPlugin_mcycle[31 : 0];
    end
  end

  always @(*) begin
    _zz_CsrPlugin_csrMapping_readDataInit_12 = 32'h0;
    if(execute_CsrPlugin_csr_3200) begin
      _zz_CsrPlugin_csrMapping_readDataInit_12[31 : 0] = CsrPlugin_mcycle[63 : 32];
    end
  end

  always @(*) begin
    _zz_CsrPlugin_csrMapping_readDataInit_13 = 32'h0;
    if(execute_CsrPlugin_csr_3074) begin
      _zz_CsrPlugin_csrMapping_readDataInit_13[31 : 0] = CsrPlugin_minstret[31 : 0];
    end
  end

  always @(*) begin
    _zz_CsrPlugin_csrMapping_readDataInit_14 = 32'h0;
    if(execute_CsrPlugin_csr_3202) begin
      _zz_CsrPlugin_csrMapping_readDataInit_14[31 : 0] = CsrPlugin_minstret[63 : 32];
    end
  end

  assign CsrPlugin_csrMapping_readDataInit = ((((_zz_CsrPlugin_csrMapping_readDataInit | _zz_CsrPlugin_csrMapping_readDataInit_1) | (_zz_CsrPlugin_csrMapping_readDataInit_2 | _zz_CsrPlugin_csrMapping_readDataInit_3)) | ((_zz_CsrPlugin_csrMapping_readDataInit_4 | _zz_CsrPlugin_csrMapping_readDataInit_5) | (_zz_CsrPlugin_csrMapping_readDataInit_6 | _zz_CsrPlugin_csrMapping_readDataInit_7))) | (((_zz_CsrPlugin_csrMapping_readDataInit_8 | _zz_CsrPlugin_csrMapping_readDataInit_9) | (_zz_CsrPlugin_csrMapping_readDataInit_10 | _zz_CsrPlugin_csrMapping_readDataInit_11)) | ((_zz_CsrPlugin_csrMapping_readDataInit_12 | _zz_CsrPlugin_csrMapping_readDataInit_13) | _zz_CsrPlugin_csrMapping_readDataInit_14)));
  assign when_CsrPlugin_l1297 = (CsrPlugin_privilege < execute_CsrPlugin_csrAddress[9 : 8]);
  assign when_CsrPlugin_l1302 = ((! execute_arbitration_isValid) || (! execute_IS_CSR));
  always @(posedge axiClk or posedge resetCtrl_axiReset) begin
    if(resetCtrl_axiReset) begin
      IBusCachedPlugin_fetchPc_pcReg <= 32'h80000000;
      IBusCachedPlugin_fetchPc_correctionReg <= 1'b0;
      IBusCachedPlugin_fetchPc_booted <= 1'b0;
      IBusCachedPlugin_fetchPc_inc <= 1'b0;
      IBusCachedPlugin_decodePc_pcReg <= 32'h80000000;
      _zz_IBusCachedPlugin_iBusRsp_stages_0_output_ready_2 <= 1'b0;
      _zz_IBusCachedPlugin_iBusRsp_stages_1_output_m2sPipe_valid <= 1'b0;
      IBusCachedPlugin_decompressor_bufferValid <= 1'b0;
      IBusCachedPlugin_decompressor_throw2BytesReg <= 1'b0;
      _zz_IBusCachedPlugin_injector_decodeInput_valid <= 1'b0;
      IBusCachedPlugin_injector_nextPcCalc_valids_0 <= 1'b0;
      IBusCachedPlugin_injector_nextPcCalc_valids_1 <= 1'b0;
      IBusCachedPlugin_injector_nextPcCalc_valids_2 <= 1'b0;
      IBusCachedPlugin_injector_nextPcCalc_valids_3 <= 1'b0;
      IBusCachedPlugin_rspCounter <= _zz_IBusCachedPlugin_rspCounter;
      IBusCachedPlugin_rspCounter <= 32'h0;
      DBusCachedPlugin_rspCounter <= _zz_DBusCachedPlugin_rspCounter;
      DBusCachedPlugin_rspCounter <= 32'h0;
      _zz_2 <= 1'b1;
      memory_DivPlugin_div_counter_value <= 6'h0;
      HazardSimplePlugin_writeBackBuffer_valid <= 1'b0;
      CsrPlugin_mstatus_MIE <= 1'b0;
      CsrPlugin_mstatus_MPIE <= 1'b0;
      CsrPlugin_mstatus_MPP <= 2'b11;
      CsrPlugin_mie_MEIE <= 1'b0;
      CsrPlugin_mie_MTIE <= 1'b0;
      CsrPlugin_mie_MSIE <= 1'b0;
      CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_decode <= 1'b0;
      CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_execute <= 1'b0;
      CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_memory <= 1'b0;
      CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_writeBack <= 1'b0;
      CsrPlugin_interrupt_valid <= 1'b0;
      CsrPlugin_pipelineLiberator_pcValids_0 <= 1'b0;
      CsrPlugin_pipelineLiberator_pcValids_1 <= 1'b0;
      CsrPlugin_pipelineLiberator_pcValids_2 <= 1'b0;
      CsrPlugin_hadException <= 1'b0;
      execute_CsrPlugin_wfiWake <= 1'b0;
      execute_arbitration_isValid <= 1'b0;
      memory_arbitration_isValid <= 1'b0;
      writeBack_arbitration_isValid <= 1'b0;
      switch_Fetcher_l362 <= 3'b000;
    end else begin
      if(IBusCachedPlugin_fetchPc_correction) begin
        IBusCachedPlugin_fetchPc_correctionReg <= 1'b1;
      end
      if(IBusCachedPlugin_fetchPc_output_fire) begin
        IBusCachedPlugin_fetchPc_correctionReg <= 1'b0;
      end
      IBusCachedPlugin_fetchPc_booted <= 1'b1;
      if(when_Fetcher_l131) begin
        IBusCachedPlugin_fetchPc_inc <= 1'b0;
      end
      if(IBusCachedPlugin_fetchPc_output_fire_1) begin
        IBusCachedPlugin_fetchPc_inc <= 1'b1;
      end
      if(when_Fetcher_l131_1) begin
        IBusCachedPlugin_fetchPc_inc <= 1'b0;
      end
      if(when_Fetcher_l158) begin
        IBusCachedPlugin_fetchPc_pcReg <= IBusCachedPlugin_fetchPc_pc;
      end
      if(when_Fetcher_l180) begin
        IBusCachedPlugin_decodePc_pcReg <= IBusCachedPlugin_decodePc_pcPlus;
      end
      if(when_Fetcher_l192) begin
        IBusCachedPlugin_decodePc_pcReg <= IBusCachedPlugin_jump_pcLoad_payload;
      end
      if(IBusCachedPlugin_iBusRsp_flush) begin
        _zz_IBusCachedPlugin_iBusRsp_stages_0_output_ready_2 <= 1'b0;
      end
      if(_zz_IBusCachedPlugin_iBusRsp_stages_0_output_ready) begin
        _zz_IBusCachedPlugin_iBusRsp_stages_0_output_ready_2 <= (IBusCachedPlugin_iBusRsp_stages_0_output_valid && (! 1'b0));
      end
      if(IBusCachedPlugin_iBusRsp_flush) begin
        _zz_IBusCachedPlugin_iBusRsp_stages_1_output_m2sPipe_valid <= 1'b0;
      end
      if(IBusCachedPlugin_iBusRsp_stages_1_output_ready) begin
        _zz_IBusCachedPlugin_iBusRsp_stages_1_output_m2sPipe_valid <= (IBusCachedPlugin_iBusRsp_stages_1_output_valid && (! IBusCachedPlugin_iBusRsp_flush));
      end
      if(IBusCachedPlugin_decompressor_output_fire) begin
        IBusCachedPlugin_decompressor_throw2BytesReg <= ((((! IBusCachedPlugin_decompressor_unaligned) && IBusCachedPlugin_decompressor_isInputLowRvc) && IBusCachedPlugin_decompressor_isInputHighRvc) || (IBusCachedPlugin_decompressor_bufferValid && IBusCachedPlugin_decompressor_isInputHighRvc));
      end
      if(when_Fetcher_l283) begin
        IBusCachedPlugin_decompressor_bufferValid <= 1'b0;
      end
      if(when_Fetcher_l286) begin
        if(IBusCachedPlugin_decompressor_bufferFill) begin
          IBusCachedPlugin_decompressor_bufferValid <= 1'b1;
        end
      end
      if(when_Fetcher_l291) begin
        IBusCachedPlugin_decompressor_throw2BytesReg <= 1'b0;
        IBusCachedPlugin_decompressor_bufferValid <= 1'b0;
      end
      if(decode_arbitration_removeIt) begin
        _zz_IBusCachedPlugin_injector_decodeInput_valid <= 1'b0;
      end
      if(IBusCachedPlugin_decompressor_output_ready) begin
        _zz_IBusCachedPlugin_injector_decodeInput_valid <= (IBusCachedPlugin_decompressor_output_valid && (! IBusCachedPlugin_externalFlush));
      end
      if(when_Fetcher_l329) begin
        IBusCachedPlugin_injector_nextPcCalc_valids_0 <= 1'b1;
      end
      if(IBusCachedPlugin_decodePc_flushed) begin
        IBusCachedPlugin_injector_nextPcCalc_valids_0 <= 1'b0;
      end
      if(when_Fetcher_l329_1) begin
        IBusCachedPlugin_injector_nextPcCalc_valids_1 <= IBusCachedPlugin_injector_nextPcCalc_valids_0;
      end
      if(IBusCachedPlugin_decodePc_flushed) begin
        IBusCachedPlugin_injector_nextPcCalc_valids_1 <= 1'b0;
      end
      if(when_Fetcher_l329_2) begin
        IBusCachedPlugin_injector_nextPcCalc_valids_2 <= IBusCachedPlugin_injector_nextPcCalc_valids_1;
      end
      if(IBusCachedPlugin_decodePc_flushed) begin
        IBusCachedPlugin_injector_nextPcCalc_valids_2 <= 1'b0;
      end
      if(when_Fetcher_l329_3) begin
        IBusCachedPlugin_injector_nextPcCalc_valids_3 <= IBusCachedPlugin_injector_nextPcCalc_valids_2;
      end
      if(IBusCachedPlugin_decodePc_flushed) begin
        IBusCachedPlugin_injector_nextPcCalc_valids_3 <= 1'b0;
      end
      if(iBus_rsp_valid) begin
        IBusCachedPlugin_rspCounter <= (IBusCachedPlugin_rspCounter + 32'h00000001);
      end
      if(dBus_rsp_valid) begin
        DBusCachedPlugin_rspCounter <= (DBusCachedPlugin_rspCounter + 32'h00000001);
      end
      _zz_2 <= 1'b0;
      memory_DivPlugin_div_counter_value <= memory_DivPlugin_div_counter_valueNext;
      HazardSimplePlugin_writeBackBuffer_valid <= HazardSimplePlugin_writeBackWrites_valid;
      if(when_CsrPlugin_l909) begin
        CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_decode <= 1'b0;
      end else begin
        CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_decode <= CsrPlugin_exceptionPortCtrl_exceptionValids_decode;
      end
      if(when_CsrPlugin_l909_1) begin
        CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_execute <= (CsrPlugin_exceptionPortCtrl_exceptionValids_decode && (! decode_arbitration_isStuck));
      end else begin
        CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_execute <= CsrPlugin_exceptionPortCtrl_exceptionValids_execute;
      end
      if(when_CsrPlugin_l909_2) begin
        CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_memory <= (CsrPlugin_exceptionPortCtrl_exceptionValids_execute && (! execute_arbitration_isStuck));
      end else begin
        CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_memory <= CsrPlugin_exceptionPortCtrl_exceptionValids_memory;
      end
      if(when_CsrPlugin_l909_3) begin
        CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_writeBack <= (CsrPlugin_exceptionPortCtrl_exceptionValids_memory && (! memory_arbitration_isStuck));
      end else begin
        CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_writeBack <= 1'b0;
      end
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
          if(IBusCachedPlugin_injectionPort_valid) begin
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
    end
  end

  always @(posedge axiClk) begin
    if(IBusCachedPlugin_iBusRsp_stages_1_output_ready) begin
      _zz_IBusCachedPlugin_iBusRsp_stages_1_output_m2sPipe_payload <= IBusCachedPlugin_iBusRsp_stages_1_output_payload;
    end
    if(IBusCachedPlugin_decompressor_input_valid) begin
      IBusCachedPlugin_decompressor_bufferValidLatch <= IBusCachedPlugin_decompressor_bufferValid;
    end
    if(IBusCachedPlugin_decompressor_input_valid) begin
      IBusCachedPlugin_decompressor_throw2BytesLatch <= IBusCachedPlugin_decompressor_throw2Bytes;
    end
    if(when_Fetcher_l286) begin
      IBusCachedPlugin_decompressor_bufferData <= IBusCachedPlugin_decompressor_input_payload_rsp_inst[31 : 16];
    end
    if(IBusCachedPlugin_decompressor_output_ready) begin
      _zz_IBusCachedPlugin_injector_decodeInput_payload_pc <= IBusCachedPlugin_decompressor_output_payload_pc;
      _zz_IBusCachedPlugin_injector_decodeInput_payload_rsp_error <= IBusCachedPlugin_decompressor_output_payload_rsp_error;
      _zz_IBusCachedPlugin_injector_decodeInput_payload_rsp_inst <= IBusCachedPlugin_decompressor_output_payload_rsp_inst;
      _zz_IBusCachedPlugin_injector_decodeInput_payload_isRvc <= IBusCachedPlugin_decompressor_output_payload_isRvc;
    end
    if(IBusCachedPlugin_injector_decodeInput_ready) begin
      IBusCachedPlugin_injector_formal_rawInDecode <= IBusCachedPlugin_decompressor_raw;
    end
    if(IBusCachedPlugin_iBusRsp_stages_1_input_ready) begin
      IBusCachedPlugin_s1_tightlyCoupledHit <= IBusCachedPlugin_s0_tightlyCoupledHit;
    end
    if(IBusCachedPlugin_iBusRsp_stages_2_input_ready) begin
      IBusCachedPlugin_s2_tightlyCoupledHit <= IBusCachedPlugin_s1_tightlyCoupledHit;
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
    CsrPlugin_mip_MEIP <= externalInterrupt;
    CsrPlugin_mip_MTIP <= timerInterrupt;
    CsrPlugin_mip_MSIP <= softwareInterrupt;
    CsrPlugin_mcycle <= (CsrPlugin_mcycle + 64'h0000000000000001);
    if(writeBack_arbitration_isFiring) begin
      CsrPlugin_minstret <= (CsrPlugin_minstret + 64'h0000000000000001);
    end
    if(_zz_when) begin
      CsrPlugin_exceptionPortCtrl_exceptionContext_code <= (_zz_CsrPlugin_exceptionPortCtrl_exceptionContext_code_1 ? IBusCachedPlugin_decodeExceptionPort_payload_code : decodeExceptionPort_payload_code);
      CsrPlugin_exceptionPortCtrl_exceptionContext_badAddr <= (_zz_CsrPlugin_exceptionPortCtrl_exceptionContext_code_1 ? IBusCachedPlugin_decodeExceptionPort_payload_badAddr : decodeExceptionPort_payload_badAddr);
    end
    if(DBusCachedPlugin_exceptionBus_valid) begin
      CsrPlugin_exceptionPortCtrl_exceptionContext_code <= DBusCachedPlugin_exceptionBus_payload_code;
      CsrPlugin_exceptionPortCtrl_exceptionContext_badAddr <= DBusCachedPlugin_exceptionBus_payload_badAddr;
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
          CsrPlugin_mepc <= writeBack_PC;
          if(CsrPlugin_hadException) begin
            CsrPlugin_mtval <= CsrPlugin_exceptionPortCtrl_exceptionContext_badAddr;
          end
        end
        default : begin
        end
      endcase
    end
    if(when_Pipeline_l124) begin
      decode_to_execute_PC <= decode_PC;
    end
    if(when_Pipeline_l124_1) begin
      execute_to_memory_PC <= _zz_execute_SRC2;
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
      decode_to_execute_IS_RVC <= decode_IS_RVC;
    end
    if(when_Pipeline_l124_7) begin
      decode_to_execute_FORMAL_PC_NEXT <= _zz_decode_to_execute_FORMAL_PC_NEXT;
    end
    if(when_Pipeline_l124_8) begin
      execute_to_memory_FORMAL_PC_NEXT <= execute_FORMAL_PC_NEXT;
    end
    if(when_Pipeline_l124_9) begin
      memory_to_writeBack_FORMAL_PC_NEXT <= _zz_memory_to_writeBack_FORMAL_PC_NEXT;
    end
    if(when_Pipeline_l124_10) begin
      decode_to_execute_MEMORY_FORCE_CONSTISTENCY <= decode_MEMORY_FORCE_CONSTISTENCY;
    end
    if(when_Pipeline_l124_11) begin
      decode_to_execute_SRC1_CTRL <= _zz_decode_to_execute_SRC1_CTRL;
    end
    if(when_Pipeline_l124_12) begin
      decode_to_execute_SRC_USE_SUB_LESS <= decode_SRC_USE_SUB_LESS;
    end
    if(when_Pipeline_l124_13) begin
      decode_to_execute_MEMORY_ENABLE <= decode_MEMORY_ENABLE;
    end
    if(when_Pipeline_l124_14) begin
      execute_to_memory_MEMORY_ENABLE <= execute_MEMORY_ENABLE;
    end
    if(when_Pipeline_l124_15) begin
      memory_to_writeBack_MEMORY_ENABLE <= memory_MEMORY_ENABLE;
    end
    if(when_Pipeline_l124_16) begin
      decode_to_execute_ALU_CTRL <= _zz_decode_to_execute_ALU_CTRL;
    end
    if(when_Pipeline_l124_17) begin
      decode_to_execute_SRC2_CTRL <= _zz_decode_to_execute_SRC2_CTRL;
    end
    if(when_Pipeline_l124_18) begin
      decode_to_execute_REGFILE_WRITE_VALID <= decode_REGFILE_WRITE_VALID;
    end
    if(when_Pipeline_l124_19) begin
      execute_to_memory_REGFILE_WRITE_VALID <= execute_REGFILE_WRITE_VALID;
    end
    if(when_Pipeline_l124_20) begin
      memory_to_writeBack_REGFILE_WRITE_VALID <= memory_REGFILE_WRITE_VALID;
    end
    if(when_Pipeline_l124_21) begin
      decode_to_execute_BYPASSABLE_EXECUTE_STAGE <= decode_BYPASSABLE_EXECUTE_STAGE;
    end
    if(when_Pipeline_l124_22) begin
      decode_to_execute_BYPASSABLE_MEMORY_STAGE <= decode_BYPASSABLE_MEMORY_STAGE;
    end
    if(when_Pipeline_l124_23) begin
      execute_to_memory_BYPASSABLE_MEMORY_STAGE <= execute_BYPASSABLE_MEMORY_STAGE;
    end
    if(when_Pipeline_l124_24) begin
      decode_to_execute_MEMORY_WR <= decode_MEMORY_WR;
    end
    if(when_Pipeline_l124_25) begin
      execute_to_memory_MEMORY_WR <= execute_MEMORY_WR;
    end
    if(when_Pipeline_l124_26) begin
      memory_to_writeBack_MEMORY_WR <= memory_MEMORY_WR;
    end
    if(when_Pipeline_l124_27) begin
      decode_to_execute_MEMORY_MANAGMENT <= decode_MEMORY_MANAGMENT;
    end
    if(when_Pipeline_l124_28) begin
      decode_to_execute_SRC_LESS_UNSIGNED <= decode_SRC_LESS_UNSIGNED;
    end
    if(when_Pipeline_l124_29) begin
      decode_to_execute_ALU_BITWISE_CTRL <= _zz_decode_to_execute_ALU_BITWISE_CTRL;
    end
    if(when_Pipeline_l124_30) begin
      decode_to_execute_SHIFT_CTRL <= _zz_decode_to_execute_SHIFT_CTRL;
    end
    if(when_Pipeline_l124_31) begin
      execute_to_memory_SHIFT_CTRL <= _zz_execute_to_memory_SHIFT_CTRL;
    end
    if(when_Pipeline_l124_32) begin
      decode_to_execute_IS_MUL <= decode_IS_MUL;
    end
    if(when_Pipeline_l124_33) begin
      execute_to_memory_IS_MUL <= execute_IS_MUL;
    end
    if(when_Pipeline_l124_34) begin
      memory_to_writeBack_IS_MUL <= memory_IS_MUL;
    end
    if(when_Pipeline_l124_35) begin
      decode_to_execute_IS_DIV <= decode_IS_DIV;
    end
    if(when_Pipeline_l124_36) begin
      execute_to_memory_IS_DIV <= execute_IS_DIV;
    end
    if(when_Pipeline_l124_37) begin
      decode_to_execute_IS_RS1_SIGNED <= decode_IS_RS1_SIGNED;
    end
    if(when_Pipeline_l124_38) begin
      decode_to_execute_IS_RS2_SIGNED <= decode_IS_RS2_SIGNED;
    end
    if(when_Pipeline_l124_39) begin
      decode_to_execute_BRANCH_CTRL <= _zz_decode_to_execute_BRANCH_CTRL;
    end
    if(when_Pipeline_l124_40) begin
      decode_to_execute_IS_CSR <= decode_IS_CSR;
    end
    if(when_Pipeline_l124_41) begin
      decode_to_execute_ENV_CTRL <= _zz_decode_to_execute_ENV_CTRL;
    end
    if(when_Pipeline_l124_42) begin
      execute_to_memory_ENV_CTRL <= _zz_execute_to_memory_ENV_CTRL;
    end
    if(when_Pipeline_l124_43) begin
      memory_to_writeBack_ENV_CTRL <= _zz_memory_to_writeBack_ENV_CTRL;
    end
    if(when_Pipeline_l124_44) begin
      decode_to_execute_RS1 <= decode_RS1;
    end
    if(when_Pipeline_l124_45) begin
      decode_to_execute_RS2 <= decode_RS2;
    end
    if(when_Pipeline_l124_46) begin
      decode_to_execute_SRC2_FORCE_ZERO <= decode_SRC2_FORCE_ZERO;
    end
    if(when_Pipeline_l124_47) begin
      decode_to_execute_PREDICTION_HAD_BRANCHED2 <= decode_PREDICTION_HAD_BRANCHED2;
    end
    if(when_Pipeline_l124_48) begin
      decode_to_execute_CSR_WRITE_OPCODE <= decode_CSR_WRITE_OPCODE;
    end
    if(when_Pipeline_l124_49) begin
      decode_to_execute_CSR_READ_OPCODE <= decode_CSR_READ_OPCODE;
    end
    if(when_Pipeline_l124_50) begin
      decode_to_execute_DO_EBREAK <= decode_DO_EBREAK;
    end
    if(when_Pipeline_l124_51) begin
      execute_to_memory_MEMORY_STORE_DATA_RF <= execute_MEMORY_STORE_DATA_RF;
    end
    if(when_Pipeline_l124_52) begin
      memory_to_writeBack_MEMORY_STORE_DATA_RF <= memory_MEMORY_STORE_DATA_RF;
    end
    if(when_Pipeline_l124_53) begin
      execute_to_memory_REGFILE_WRITE_DATA <= _zz_decode_RS2;
    end
    if(when_Pipeline_l124_54) begin
      memory_to_writeBack_REGFILE_WRITE_DATA <= _zz_decode_RS2_1;
    end
    if(when_Pipeline_l124_55) begin
      execute_to_memory_SHIFT_RIGHT <= execute_SHIFT_RIGHT;
    end
    if(when_Pipeline_l124_56) begin
      execute_to_memory_MUL_LL <= execute_MUL_LL;
    end
    if(when_Pipeline_l124_57) begin
      execute_to_memory_MUL_LH <= execute_MUL_LH;
    end
    if(when_Pipeline_l124_58) begin
      execute_to_memory_MUL_HL <= execute_MUL_HL;
    end
    if(when_Pipeline_l124_59) begin
      execute_to_memory_MUL_HH <= execute_MUL_HH;
    end
    if(when_Pipeline_l124_60) begin
      memory_to_writeBack_MUL_HH <= memory_MUL_HH;
    end
    if(when_Pipeline_l124_61) begin
      execute_to_memory_BRANCH_DO <= execute_BRANCH_DO;
    end
    if(when_Pipeline_l124_62) begin
      execute_to_memory_BRANCH_CALC <= execute_BRANCH_CALC;
    end
    if(when_Pipeline_l124_63) begin
      memory_to_writeBack_MUL_LOW <= memory_MUL_LOW;
    end
    if(when_Fetcher_l398) begin
      _zz_IBusCachedPlugin_injector_decodeInput_payload_rsp_inst <= IBusCachedPlugin_injectionPort_payload;
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
      execute_CsrPlugin_csr_833 <= (decode_INSTRUCTION[31 : 20] == 12'h341);
    end
    if(when_CsrPlugin_l1264_5) begin
      execute_CsrPlugin_csr_834 <= (decode_INSTRUCTION[31 : 20] == 12'h342);
    end
    if(when_CsrPlugin_l1264_6) begin
      execute_CsrPlugin_csr_835 <= (decode_INSTRUCTION[31 : 20] == 12'h343);
    end
    if(when_CsrPlugin_l1264_7) begin
      execute_CsrPlugin_csr_2816 <= (decode_INSTRUCTION[31 : 20] == 12'hb00);
    end
    if(when_CsrPlugin_l1264_8) begin
      execute_CsrPlugin_csr_2944 <= (decode_INSTRUCTION[31 : 20] == 12'hb80);
    end
    if(when_CsrPlugin_l1264_9) begin
      execute_CsrPlugin_csr_2818 <= (decode_INSTRUCTION[31 : 20] == 12'hb02);
    end
    if(when_CsrPlugin_l1264_10) begin
      execute_CsrPlugin_csr_2946 <= (decode_INSTRUCTION[31 : 20] == 12'hb82);
    end
    if(when_CsrPlugin_l1264_11) begin
      execute_CsrPlugin_csr_3072 <= (decode_INSTRUCTION[31 : 20] == 12'hc00);
    end
    if(when_CsrPlugin_l1264_12) begin
      execute_CsrPlugin_csr_3200 <= (decode_INSTRUCTION[31 : 20] == 12'hc80);
    end
    if(when_CsrPlugin_l1264_13) begin
      execute_CsrPlugin_csr_3074 <= (decode_INSTRUCTION[31 : 20] == 12'hc02);
    end
    if(when_CsrPlugin_l1264_14) begin
      execute_CsrPlugin_csr_3202 <= (decode_INSTRUCTION[31 : 20] == 12'hc82);
    end
    if(execute_CsrPlugin_csr_836) begin
      if(execute_CsrPlugin_writeEnable) begin
        CsrPlugin_mip_MSIP <= CsrPlugin_csrMapping_writeDataSignal[3];
      end
    end
    if(execute_CsrPlugin_csr_773) begin
      if(execute_CsrPlugin_writeEnable) begin
        CsrPlugin_mtvec_base <= CsrPlugin_csrMapping_writeDataSignal[31 : 2];
        CsrPlugin_mtvec_mode <= CsrPlugin_csrMapping_writeDataSignal[1 : 0];
      end
    end
    if(execute_CsrPlugin_csr_833) begin
      if(execute_CsrPlugin_writeEnable) begin
        CsrPlugin_mepc <= CsrPlugin_csrMapping_writeDataSignal[31 : 0];
      end
    end
  end

  always @(posedge axiClk) begin
    DebugPlugin_firstCycle <= 1'b0;
    if(debug_bus_cmd_ready) begin
      DebugPlugin_firstCycle <= 1'b1;
    end
    DebugPlugin_secondCycle <= DebugPlugin_firstCycle;
    DebugPlugin_isPipBusy <= (({writeBack_arbitration_isValid,{memory_arbitration_isValid,{execute_arbitration_isValid,decode_arbitration_isValid}}} != 4'b0000) || IBusCachedPlugin_incomingInstruction);
    if(writeBack_arbitration_isValid) begin
      DebugPlugin_busReadDataReg <= _zz_decode_RS2_2;
    end
    _zz_when_DebugPlugin_l244 <= debug_bus_cmd_payload_address[2];
    if(when_DebugPlugin_l295) begin
      DebugPlugin_busReadDataReg <= execute_PC;
    end
    DebugPlugin_resetIt_regNext <= DebugPlugin_resetIt;
  end

  always @(posedge axiClk or posedge resetCtrl_systemReset) begin
    if(resetCtrl_systemReset) begin
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
        case(switch_DebugPlugin_l267)
          6'h0 : begin
            if(debug_bus_cmd_payload_wr) begin
              DebugPlugin_stepIt <= debug_bus_cmd_payload_data[4];
              if(when_DebugPlugin_l271) begin
                DebugPlugin_resetIt <= 1'b1;
              end
              if(when_DebugPlugin_l271_1) begin
                DebugPlugin_resetIt <= 1'b0;
              end
              if(when_DebugPlugin_l272) begin
                DebugPlugin_haltIt <= 1'b1;
              end
              if(when_DebugPlugin_l272_1) begin
                DebugPlugin_haltIt <= 1'b0;
              end
              if(when_DebugPlugin_l273) begin
                DebugPlugin_haltedByBreak <= 1'b0;
              end
              if(when_DebugPlugin_l274) begin
                DebugPlugin_godmode <= 1'b0;
              end
              if(when_DebugPlugin_l275) begin
                DebugPlugin_disableEbreak <= 1'b1;
              end
              if(when_DebugPlugin_l275_1) begin
                DebugPlugin_disableEbreak <= 1'b0;
              end
            end
          end
          default : begin
          end
        endcase
      end
      if(when_DebugPlugin_l295) begin
        if(when_DebugPlugin_l298) begin
          DebugPlugin_haltIt <= 1'b1;
          DebugPlugin_haltedByBreak <= 1'b1;
        end
      end
      if(when_DebugPlugin_l311) begin
        if(decode_arbitration_isValid) begin
          DebugPlugin_haltIt <= 1'b1;
        end
      end
      _zz_3 <= (DebugPlugin_stepIt && decode_arbitration_isFiring);
    end
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
  input               axiClk,
  input               resetCtrl_axiReset
);
  localparam SpiMasterCtrlCmdMode_DATA = 1'd0;
  localparam SpiMasterCtrlCmdMode_SS = 1'd1;

  reg                 spiCtrl_io_rsp_queueWithOccupancy_io_pop_ready;
  wire                spiCtrl_io_cmd_ready;
  wire                spiCtrl_io_rsp_valid;
  wire       [7:0]    spiCtrl_io_rsp_payload;
  wire                spiCtrl_io_spi_sclk;
  wire                spiCtrl_io_spi_mosi;
  wire       [0:0]    spiCtrl_io_spi_ss;
  wire                bridge_cmdLogic_streamUnbuffered_queueWithAvailability_io_push_ready;
  wire                bridge_cmdLogic_streamUnbuffered_queueWithAvailability_io_pop_valid;
  wire       [0:0]    bridge_cmdLogic_streamUnbuffered_queueWithAvailability_io_pop_payload_mode;
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
  wire       [0:0]    bridge_cmdLogic_streamUnbuffered_payload_mode;
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
  wire       [0:0]    _zz_bridge_cmdLogic_streamUnbuffered_payload_mode;
  wire       [1:0]    _zz_io_config_kind_cpol_1;
  `ifndef SYNTHESIS
  reg [31:0] bridge_cmdLogic_streamUnbuffered_payload_mode_string;
  reg [31:0] _zz_bridge_cmdLogic_streamUnbuffered_payload_mode_string;
  `endif


  assign _zz_bridge_cmdLogic_streamUnbuffered_payload_args = io_apb_PWDATA[24];
  SpiMasterCtrl spiCtrl (
    .io_config_kind_cpol        (_zz_io_config_kind_cpol                                                          ), //i
    .io_config_kind_cpha        (_zz_io_config_kind_cpha                                                          ), //i
    .io_config_sclkToogle       (_zz_io_config_sclkToogle[15:0]                                                   ), //i
    .io_config_ss_activeHigh    (_zz_io_config_ss_activeHigh                                                      ), //i
    .io_config_ss_setup         (_zz_io_config_ss_setup[15:0]                                                     ), //i
    .io_config_ss_hold          (_zz_io_config_ss_hold[15:0]                                                      ), //i
    .io_config_ss_disable       (_zz_io_config_ss_disable[15:0]                                                   ), //i
    .io_cmd_valid               (bridge_cmdLogic_streamUnbuffered_queueWithAvailability_io_pop_valid              ), //i
    .io_cmd_ready               (spiCtrl_io_cmd_ready                                                             ), //o
    .io_cmd_payload_mode        (bridge_cmdLogic_streamUnbuffered_queueWithAvailability_io_pop_payload_mode       ), //i
    .io_cmd_payload_args        (bridge_cmdLogic_streamUnbuffered_queueWithAvailability_io_pop_payload_args[8:0]  ), //i
    .io_rsp_valid               (spiCtrl_io_rsp_valid                                                             ), //o
    .io_rsp_payload             (spiCtrl_io_rsp_payload[7:0]                                                      ), //o
    .io_spi_ss                  (spiCtrl_io_spi_ss                                                                ), //o
    .io_spi_sclk                (spiCtrl_io_spi_sclk                                                              ), //o
    .io_spi_mosi                (spiCtrl_io_spi_mosi                                                              ), //o
    .io_spi_miso                (io_spi_miso                                                                      ), //i
    .axiClk                     (axiClk                                                                           ), //i
    .resetCtrl_axiReset         (resetCtrl_axiReset                                                               )  //i
  );
  StreamFifo_2 bridge_cmdLogic_streamUnbuffered_queueWithAvailability (
    .io_push_valid           (bridge_cmdLogic_streamUnbuffered_valid                                           ), //i
    .io_push_ready           (bridge_cmdLogic_streamUnbuffered_queueWithAvailability_io_push_ready             ), //o
    .io_push_payload_mode    (bridge_cmdLogic_streamUnbuffered_payload_mode                                    ), //i
    .io_push_payload_args    (bridge_cmdLogic_streamUnbuffered_payload_args[8:0]                               ), //i
    .io_pop_valid            (bridge_cmdLogic_streamUnbuffered_queueWithAvailability_io_pop_valid              ), //o
    .io_pop_ready            (spiCtrl_io_cmd_ready                                                             ), //i
    .io_pop_payload_mode     (bridge_cmdLogic_streamUnbuffered_queueWithAvailability_io_pop_payload_mode       ), //o
    .io_pop_payload_args     (bridge_cmdLogic_streamUnbuffered_queueWithAvailability_io_pop_payload_args[8:0]  ), //o
    .io_flush                (1'b0                                                                             ), //i
    .io_occupancy            (bridge_cmdLogic_streamUnbuffered_queueWithAvailability_io_occupancy[5:0]         ), //o
    .io_availability         (bridge_cmdLogic_streamUnbuffered_queueWithAvailability_io_availability[5:0]      ), //o
    .axiClk                  (axiClk                                                                           ), //i
    .resetCtrl_axiReset      (resetCtrl_axiReset                                                               )  //i
  );
  StreamFifo_3 spiCtrl_io_rsp_queueWithOccupancy (
    .io_push_valid         (spiCtrl_io_rsp_valid                                    ), //i
    .io_push_ready         (spiCtrl_io_rsp_queueWithOccupancy_io_push_ready         ), //o
    .io_push_payload       (spiCtrl_io_rsp_payload[7:0]                             ), //i
    .io_pop_valid          (spiCtrl_io_rsp_queueWithOccupancy_io_pop_valid          ), //o
    .io_pop_ready          (spiCtrl_io_rsp_queueWithOccupancy_io_pop_ready          ), //i
    .io_pop_payload        (spiCtrl_io_rsp_queueWithOccupancy_io_pop_payload[7:0]   ), //o
    .io_flush              (1'b0                                                    ), //i
    .io_occupancy          (spiCtrl_io_rsp_queueWithOccupancy_io_occupancy[5:0]     ), //o
    .io_availability       (spiCtrl_io_rsp_queueWithOccupancy_io_availability[5:0]  ), //o
    .axiClk                (axiClk                                                  ), //i
    .resetCtrl_axiReset    (resetCtrl_axiReset                                      )  //i
  );
  `ifndef SYNTHESIS
  always @(*) begin
    case(bridge_cmdLogic_streamUnbuffered_payload_mode)
      SpiMasterCtrlCmdMode_DATA : bridge_cmdLogic_streamUnbuffered_payload_mode_string = "DATA";
      SpiMasterCtrlCmdMode_SS : bridge_cmdLogic_streamUnbuffered_payload_mode_string = "SS  ";
      default : bridge_cmdLogic_streamUnbuffered_payload_mode_string = "????";
    endcase
  end
  always @(*) begin
    case(_zz_bridge_cmdLogic_streamUnbuffered_payload_mode)
      SpiMasterCtrlCmdMode_DATA : _zz_bridge_cmdLogic_streamUnbuffered_payload_mode_string = "DATA";
      SpiMasterCtrlCmdMode_SS : _zz_bridge_cmdLogic_streamUnbuffered_payload_mode_string = "SS  ";
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
      SpiMasterCtrlCmdMode_DATA : begin
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
  always @(posedge axiClk or posedge resetCtrl_axiReset) begin
    if(resetCtrl_axiReset) begin
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

  always @(posedge axiClk) begin
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
  input               axiClk,
  input               resetCtrl_axiReset
);
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
    .axiClk                            (axiClk                                   ), //i
    .resetCtrl_axiReset                (resetCtrl_axiReset                       )  //i
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

  assign bridge_isMasterMode = 1'b0;
  assign when_I2cCtrl_l504 = (bridge_wasntAck && (! bridge_isMasterMode));
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
  end

  assign when_I2cCtrl_l593 = (i2cCtrl_io_bus_cmd_kind == I2cSlaveCmdMode_START);
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
  assign when_I2cCtrl_l593_2 = (i2cCtrl_io_bus_cmd_kind == I2cSlaveCmdMode_RESTART);
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
  assign when_I2cCtrl_l593_4 = (i2cCtrl_io_bus_cmd_kind == I2cSlaveCmdMode_STOP);
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
  assign when_I2cCtrl_l593_6 = (i2cCtrl_io_bus_cmd_kind == I2cSlaveCmdMode_DROP);
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
  always @(posedge axiClk or posedge resetCtrl_axiReset) begin
    if(resetCtrl_axiReset) begin
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

  always @(posedge axiClk) begin
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
  input               axiClk,
  input               resetCtrl_axiReset
);
  localparam UartStopType_ONE = 1'd0;
  localparam UartStopType_TWO = 1'd1;
  localparam UartParityType_NONE = 2'd0;
  localparam UartParityType_EVEN = 2'd1;
  localparam UartParityType_ODD = 2'd2;

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
  wire       [19:0]   _zz_bridge_uartConfigReg_clockDivider;
  wire       [19:0]   _zz_bridge_uartConfigReg_clockDivider_1;
  wire                busCtrl_askWrite;
  wire                busCtrl_askRead;
  wire                busCtrl_doWrite;
  wire                busCtrl_doRead;
  reg        [2:0]    bridge_uartConfigReg_frame_dataLength;
  reg        [0:0]    bridge_uartConfigReg_frame_stop;
  reg        [1:0]    bridge_uartConfigReg_frame_parity;
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
  wire                when_UartCtrl_l155;
  reg                 when_BusSlaveFactory_l335_2;
  wire                when_BusSlaveFactory_l337_2;
  reg                 bridge_misc_doBreak;
  reg                 when_BusSlaveFactory_l366;
  wire                when_BusSlaveFactory_l368;
  reg                 when_BusSlaveFactory_l335_3;
  wire                when_BusSlaveFactory_l337_3;
  wire       [1:0]    _zz_bridge_uartConfigReg_frame_parity;
  wire       [0:0]    _zz_bridge_uartConfigReg_frame_stop;
  wire                when_Apb3SlaveFactory_l82;
  `ifndef SYNTHESIS
  reg [23:0] bridge_uartConfigReg_frame_stop_string;
  reg [31:0] bridge_uartConfigReg_frame_parity_string;
  reg [31:0] _zz_bridge_uartConfigReg_frame_parity_string;
  reg [23:0] _zz_bridge_uartConfigReg_frame_stop_string;
  `endif


  assign _zz_bridge_misc_readError = 1'b0;
  assign _zz_bridge_misc_readOverflowError = 1'b0;
  assign _zz_bridge_misc_breakDetected = 1'b0;
  assign _zz_bridge_misc_doBreak = 1'b1;
  assign _zz_bridge_misc_doBreak_1 = 1'b0;
  assign _zz_io_apb_PRDATA = (5'h10 - bridge_write_streamUnbuffered_queueWithOccupancy_io_occupancy);
  assign _zz_bridge_uartConfigReg_clockDivider_1 = io_apb_PWDATA[19 : 0];
  assign _zz_bridge_uartConfigReg_clockDivider = _zz_bridge_uartConfigReg_clockDivider_1;
  UartCtrl uartCtrl_1 (
    .io_config_frame_dataLength    (bridge_uartConfigReg_frame_dataLength[2:0]                            ), //i
    .io_config_frame_stop          (bridge_uartConfigReg_frame_stop                                       ), //i
    .io_config_frame_parity        (bridge_uartConfigReg_frame_parity[1:0]                                ), //i
    .io_config_clockDivider        (bridge_uartConfigReg_clockDivider[19:0]                               ), //i
    .io_write_valid                (bridge_write_streamUnbuffered_queueWithOccupancy_io_pop_valid         ), //i
    .io_write_ready                (uartCtrl_1_io_write_ready                                             ), //o
    .io_write_payload              (bridge_write_streamUnbuffered_queueWithOccupancy_io_pop_payload[7:0]  ), //i
    .io_read_valid                 (uartCtrl_1_io_read_valid                                              ), //o
    .io_read_ready                 (uartCtrl_1_io_read_queueWithOccupancy_io_push_ready                   ), //i
    .io_read_payload               (uartCtrl_1_io_read_payload[7:0]                                       ), //o
    .io_uart_txd                   (uartCtrl_1_io_uart_txd                                                ), //o
    .io_uart_rxd                   (io_uart_rxd                                                           ), //i
    .io_readError                  (uartCtrl_1_io_readError                                               ), //o
    .io_writeBreak                 (bridge_misc_doBreak                                                   ), //i
    .io_readBreak                  (uartCtrl_1_io_readBreak                                               ), //o
    .axiClk                        (axiClk                                                                ), //i
    .resetCtrl_axiReset            (resetCtrl_axiReset                                                    )  //i
  );
  StreamFifo bridge_write_streamUnbuffered_queueWithOccupancy (
    .io_push_valid         (bridge_write_streamUnbuffered_valid                                    ), //i
    .io_push_ready         (bridge_write_streamUnbuffered_queueWithOccupancy_io_push_ready         ), //o
    .io_push_payload       (bridge_write_streamUnbuffered_payload[7:0]                             ), //i
    .io_pop_valid          (bridge_write_streamUnbuffered_queueWithOccupancy_io_pop_valid          ), //o
    .io_pop_ready          (uartCtrl_1_io_write_ready                                              ), //i
    .io_pop_payload        (bridge_write_streamUnbuffered_queueWithOccupancy_io_pop_payload[7:0]   ), //o
    .io_flush              (1'b0                                                                   ), //i
    .io_occupancy          (bridge_write_streamUnbuffered_queueWithOccupancy_io_occupancy[4:0]     ), //o
    .io_availability       (bridge_write_streamUnbuffered_queueWithOccupancy_io_availability[4:0]  ), //o
    .axiClk                (axiClk                                                                 ), //i
    .resetCtrl_axiReset    (resetCtrl_axiReset                                                     )  //i
  );
  StreamFifo uartCtrl_1_io_read_queueWithOccupancy (
    .io_push_valid         (uartCtrl_1_io_read_valid                                    ), //i
    .io_push_ready         (uartCtrl_1_io_read_queueWithOccupancy_io_push_ready         ), //o
    .io_push_payload       (uartCtrl_1_io_read_payload[7:0]                             ), //i
    .io_pop_valid          (uartCtrl_1_io_read_queueWithOccupancy_io_pop_valid          ), //o
    .io_pop_ready          (uartCtrl_1_io_read_queueWithOccupancy_io_pop_ready          ), //i
    .io_pop_payload        (uartCtrl_1_io_read_queueWithOccupancy_io_pop_payload[7:0]   ), //o
    .io_flush              (1'b0                                                        ), //i
    .io_occupancy          (uartCtrl_1_io_read_queueWithOccupancy_io_occupancy[4:0]     ), //o
    .io_availability       (uartCtrl_1_io_read_queueWithOccupancy_io_availability[4:0]  ), //o
    .axiClk                (axiClk                                                      ), //i
    .resetCtrl_axiReset    (resetCtrl_axiReset                                          )  //i
  );
  `ifndef SYNTHESIS
  always @(*) begin
    case(bridge_uartConfigReg_frame_stop)
      UartStopType_ONE : bridge_uartConfigReg_frame_stop_string = "ONE";
      UartStopType_TWO : bridge_uartConfigReg_frame_stop_string = "TWO";
      default : bridge_uartConfigReg_frame_stop_string = "???";
    endcase
  end
  always @(*) begin
    case(bridge_uartConfigReg_frame_parity)
      UartParityType_NONE : bridge_uartConfigReg_frame_parity_string = "NONE";
      UartParityType_EVEN : bridge_uartConfigReg_frame_parity_string = "EVEN";
      UartParityType_ODD : bridge_uartConfigReg_frame_parity_string = "ODD ";
      default : bridge_uartConfigReg_frame_parity_string = "????";
    endcase
  end
  always @(*) begin
    case(_zz_bridge_uartConfigReg_frame_parity)
      UartParityType_NONE : _zz_bridge_uartConfigReg_frame_parity_string = "NONE";
      UartParityType_EVEN : _zz_bridge_uartConfigReg_frame_parity_string = "EVEN";
      UartParityType_ODD : _zz_bridge_uartConfigReg_frame_parity_string = "ODD ";
      default : _zz_bridge_uartConfigReg_frame_parity_string = "????";
    endcase
  end
  always @(*) begin
    case(_zz_bridge_uartConfigReg_frame_stop)
      UartStopType_ONE : _zz_bridge_uartConfigReg_frame_stop_string = "ONE";
      UartStopType_TWO : _zz_bridge_uartConfigReg_frame_stop_string = "TWO";
      default : _zz_bridge_uartConfigReg_frame_stop_string = "???";
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
  assign when_UartCtrl_l155 = (uartCtrl_1_io_readBreak && (! uartCtrl_1_io_readBreak_regNext));
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
  assign _zz_bridge_uartConfigReg_frame_parity = io_apb_PWDATA[9 : 8];
  assign _zz_bridge_uartConfigReg_frame_stop = io_apb_PWDATA[16 : 16];
  assign when_Apb3SlaveFactory_l82 = ((io_apb_PADDR & (~ 5'h03)) == 5'h08);
  always @(posedge axiClk or posedge resetCtrl_axiReset) begin
    if(resetCtrl_axiReset) begin
      bridge_uartConfigReg_clockDivider <= 20'h0;
      bridge_uartConfigReg_clockDivider <= 20'h00033;
      bridge_uartConfigReg_frame_dataLength <= 3'b111;
      bridge_uartConfigReg_frame_parity <= UartParityType_NONE;
      bridge_uartConfigReg_frame_stop <= UartStopType_ONE;
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
      if(when_UartCtrl_l155) begin
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
        5'h0c : begin
          if(busCtrl_doWrite) begin
            bridge_uartConfigReg_frame_dataLength <= io_apb_PWDATA[2 : 0];
            bridge_uartConfigReg_frame_parity <= _zz_bridge_uartConfigReg_frame_parity;
            bridge_uartConfigReg_frame_stop <= _zz_bridge_uartConfigReg_frame_stop;
          end
        end
        5'h04 : begin
          if(busCtrl_doWrite) begin
            bridge_interruptCtrl_writeIntEnable <= io_apb_PWDATA[0];
            bridge_interruptCtrl_readIntEnable <= io_apb_PWDATA[1];
          end
        end
        default : begin
        end
      endcase
      if(when_Apb3SlaveFactory_l82) begin
        if(busCtrl_doWrite) begin
          bridge_uartConfigReg_clockDivider[19 : 0] <= _zz_bridge_uartConfigReg_clockDivider;
        end
      end
    end
  end

  always @(posedge axiClk) begin
    uartCtrl_1_io_readBreak_regNext <= uartCtrl_1_io_readBreak;
  end


endmodule

module BrieyTimerCtrl (
  input      [7:0]    io_apb_PADDR,
  input      [0:0]    io_apb_PSEL,
  input               io_apb_PENABLE,
  output              io_apb_PREADY,
  input               io_apb_PWRITE,
  input      [31:0]   io_apb_PWDATA,
  output reg [31:0]   io_apb_PRDATA,
  output              io_apb_PSLVERROR,
  output              io_interrupt,
  input               axiClk,
  input               resetCtrl_axiReset
);

  wire                timerA_io_tick;
  wire                timerA_io_clear;
  wire                timerB_io_tick;
  wire                timerB_io_clear;
  wire                timerC_io_tick;
  wire                timerC_io_clear;
  wire                timerD_io_tick;
  wire                timerD_io_clear;
  reg        [3:0]    interruptCtrl_1_io_inputs;
  reg        [3:0]    interruptCtrl_1_io_clears;
  wire                prescaler_1_io_overflow;
  wire                timerA_io_full;
  wire       [31:0]   timerA_io_value;
  wire                timerB_io_full;
  wire       [31:0]   timerB_io_value;
  wire                timerC_io_full;
  wire       [31:0]   timerC_io_value;
  wire                timerD_io_full;
  wire       [31:0]   timerD_io_value;
  wire       [3:0]    interruptCtrl_1_io_pendings;
  wire                busCtrl_askWrite;
  wire                busCtrl_askRead;
  wire                busCtrl_doWrite;
  wire                busCtrl_doRead;
  reg        [15:0]   _zz_io_limit;
  reg                 _zz_io_clear;
  reg        [1:0]    timerABridge_ticksEnable;
  reg        [0:0]    timerABridge_clearsEnable;
  reg                 timerABridge_busClearing;
  reg        [31:0]   timerA_io_limit_driver;
  reg                 when_Timer_l40;
  reg                 when_Timer_l44;
  reg        [1:0]    timerBBridge_ticksEnable;
  reg        [0:0]    timerBBridge_clearsEnable;
  reg                 timerBBridge_busClearing;
  reg        [31:0]   timerB_io_limit_driver;
  reg                 when_Timer_l40_1;
  reg                 when_Timer_l44_1;
  reg        [1:0]    timerCBridge_ticksEnable;
  reg        [0:0]    timerCBridge_clearsEnable;
  reg                 timerCBridge_busClearing;
  reg        [31:0]   timerC_io_limit_driver;
  reg                 when_Timer_l40_2;
  reg                 when_Timer_l44_2;
  reg        [1:0]    timerDBridge_ticksEnable;
  reg        [0:0]    timerDBridge_clearsEnable;
  reg                 timerDBridge_busClearing;
  reg        [31:0]   timerD_io_limit_driver;
  reg                 when_Timer_l40_3;
  reg                 when_Timer_l44_3;
  reg        [3:0]    interruptCtrl_1_io_masks_driver;

  Prescaler prescaler_1 (
    .io_clear              (_zz_io_clear             ), //i
    .io_limit              (_zz_io_limit[15:0]       ), //i
    .io_overflow           (prescaler_1_io_overflow  ), //o
    .axiClk                (axiClk                   ), //i
    .resetCtrl_axiReset    (resetCtrl_axiReset       )  //i
  );
  Timer timerA (
    .io_tick               (timerA_io_tick                ), //i
    .io_clear              (timerA_io_clear               ), //i
    .io_limit              (timerA_io_limit_driver[31:0]  ), //i
    .io_full               (timerA_io_full                ), //o
    .io_value              (timerA_io_value[31:0]         ), //o
    .axiClk                (axiClk                        ), //i
    .resetCtrl_axiReset    (resetCtrl_axiReset            )  //i
  );
  Timer timerB (
    .io_tick               (timerB_io_tick                ), //i
    .io_clear              (timerB_io_clear               ), //i
    .io_limit              (timerB_io_limit_driver[31:0]  ), //i
    .io_full               (timerB_io_full                ), //o
    .io_value              (timerB_io_value[31:0]         ), //o
    .axiClk                (axiClk                        ), //i
    .resetCtrl_axiReset    (resetCtrl_axiReset            )  //i
  );
  Timer timerC (
    .io_tick               (timerC_io_tick                ), //i
    .io_clear              (timerC_io_clear               ), //i
    .io_limit              (timerC_io_limit_driver[31:0]  ), //i
    .io_full               (timerC_io_full                ), //o
    .io_value              (timerC_io_value[31:0]         ), //o
    .axiClk                (axiClk                        ), //i
    .resetCtrl_axiReset    (resetCtrl_axiReset            )  //i
  );
  Timer timerD (
    .io_tick               (timerD_io_tick                ), //i
    .io_clear              (timerD_io_clear               ), //i
    .io_limit              (timerD_io_limit_driver[31:0]  ), //i
    .io_full               (timerD_io_full                ), //o
    .io_value              (timerD_io_value[31:0]         ), //o
    .axiClk                (axiClk                        ), //i
    .resetCtrl_axiReset    (resetCtrl_axiReset            )  //i
  );
  InterruptCtrl interruptCtrl_1 (
    .io_inputs             (interruptCtrl_1_io_inputs[3:0]        ), //i
    .io_clears             (interruptCtrl_1_io_clears[3:0]        ), //i
    .io_masks              (interruptCtrl_1_io_masks_driver[3:0]  ), //i
    .io_pendings           (interruptCtrl_1_io_pendings[3:0]      ), //o
    .axiClk                (axiClk                                ), //i
    .resetCtrl_axiReset    (resetCtrl_axiReset                    )  //i
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
        io_apb_PRDATA[31 : 0] = timerA_io_limit_driver;
      end
      8'h48 : begin
        io_apb_PRDATA[31 : 0] = timerA_io_value;
      end
      8'h50 : begin
        io_apb_PRDATA[1 : 0] = timerBBridge_ticksEnable;
        io_apb_PRDATA[16 : 16] = timerBBridge_clearsEnable;
      end
      8'h54 : begin
        io_apb_PRDATA[31 : 0] = timerB_io_limit_driver;
      end
      8'h58 : begin
        io_apb_PRDATA[31 : 0] = timerB_io_value;
      end
      8'h60 : begin
        io_apb_PRDATA[1 : 0] = timerCBridge_ticksEnable;
        io_apb_PRDATA[16 : 16] = timerCBridge_clearsEnable;
      end
      8'h64 : begin
        io_apb_PRDATA[31 : 0] = timerC_io_limit_driver;
      end
      8'h68 : begin
        io_apb_PRDATA[31 : 0] = timerC_io_value;
      end
      8'h70 : begin
        io_apb_PRDATA[1 : 0] = timerDBridge_ticksEnable;
        io_apb_PRDATA[16 : 16] = timerDBridge_clearsEnable;
      end
      8'h74 : begin
        io_apb_PRDATA[31 : 0] = timerD_io_limit_driver;
      end
      8'h78 : begin
        io_apb_PRDATA[31 : 0] = timerD_io_value;
      end
      8'h10 : begin
        io_apb_PRDATA[3 : 0] = interruptCtrl_1_io_pendings;
      end
      8'h14 : begin
        io_apb_PRDATA[3 : 0] = interruptCtrl_1_io_masks_driver;
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

  assign timerA_io_clear = ((|(timerABridge_clearsEnable & timerA_io_full)) || timerABridge_busClearing);
  assign timerA_io_tick = (|(timerABridge_ticksEnable & {prescaler_1_io_overflow,1'b1}));
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

  assign timerB_io_clear = ((|(timerBBridge_clearsEnable & timerB_io_full)) || timerBBridge_busClearing);
  assign timerB_io_tick = (|(timerBBridge_ticksEnable & {prescaler_1_io_overflow,1'b1}));
  always @(*) begin
    timerCBridge_busClearing = 1'b0;
    if(when_Timer_l40_2) begin
      timerCBridge_busClearing = 1'b1;
    end
    if(when_Timer_l44_2) begin
      timerCBridge_busClearing = 1'b1;
    end
  end

  always @(*) begin
    when_Timer_l40_2 = 1'b0;
    case(io_apb_PADDR)
      8'h64 : begin
        if(busCtrl_doWrite) begin
          when_Timer_l40_2 = 1'b1;
        end
      end
      default : begin
      end
    endcase
  end

  always @(*) begin
    when_Timer_l44_2 = 1'b0;
    case(io_apb_PADDR)
      8'h68 : begin
        if(busCtrl_doWrite) begin
          when_Timer_l44_2 = 1'b1;
        end
      end
      default : begin
      end
    endcase
  end

  assign timerC_io_clear = ((|(timerCBridge_clearsEnable & timerC_io_full)) || timerCBridge_busClearing);
  assign timerC_io_tick = (|(timerCBridge_ticksEnable & {prescaler_1_io_overflow,1'b1}));
  always @(*) begin
    timerDBridge_busClearing = 1'b0;
    if(when_Timer_l40_3) begin
      timerDBridge_busClearing = 1'b1;
    end
    if(when_Timer_l44_3) begin
      timerDBridge_busClearing = 1'b1;
    end
  end

  always @(*) begin
    when_Timer_l40_3 = 1'b0;
    case(io_apb_PADDR)
      8'h74 : begin
        if(busCtrl_doWrite) begin
          when_Timer_l40_3 = 1'b1;
        end
      end
      default : begin
      end
    endcase
  end

  always @(*) begin
    when_Timer_l44_3 = 1'b0;
    case(io_apb_PADDR)
      8'h78 : begin
        if(busCtrl_doWrite) begin
          when_Timer_l44_3 = 1'b1;
        end
      end
      default : begin
      end
    endcase
  end

  assign timerD_io_clear = ((|(timerDBridge_clearsEnable & timerD_io_full)) || timerDBridge_busClearing);
  assign timerD_io_tick = (|(timerDBridge_ticksEnable & {prescaler_1_io_overflow,1'b1}));
  always @(*) begin
    interruptCtrl_1_io_clears = 4'b0000;
    case(io_apb_PADDR)
      8'h10 : begin
        if(busCtrl_doWrite) begin
          interruptCtrl_1_io_clears = io_apb_PWDATA[3 : 0];
        end
      end
      default : begin
      end
    endcase
  end

  always @(*) begin
    interruptCtrl_1_io_inputs[0] = timerA_io_full;
    interruptCtrl_1_io_inputs[1] = timerB_io_full;
    interruptCtrl_1_io_inputs[2] = timerC_io_full;
    interruptCtrl_1_io_inputs[3] = timerD_io_full;
  end

  assign io_interrupt = (|interruptCtrl_1_io_pendings);
  always @(posedge axiClk or posedge resetCtrl_axiReset) begin
    if(resetCtrl_axiReset) begin
      timerABridge_ticksEnable <= 2'b00;
      timerABridge_clearsEnable <= 1'b0;
      timerBBridge_ticksEnable <= 2'b00;
      timerBBridge_clearsEnable <= 1'b0;
      timerCBridge_ticksEnable <= 2'b00;
      timerCBridge_clearsEnable <= 1'b0;
      timerDBridge_ticksEnable <= 2'b00;
      timerDBridge_clearsEnable <= 1'b0;
      interruptCtrl_1_io_masks_driver <= 4'b0000;
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
        8'h60 : begin
          if(busCtrl_doWrite) begin
            timerCBridge_ticksEnable <= io_apb_PWDATA[1 : 0];
            timerCBridge_clearsEnable <= io_apb_PWDATA[16 : 16];
          end
        end
        8'h70 : begin
          if(busCtrl_doWrite) begin
            timerDBridge_ticksEnable <= io_apb_PWDATA[1 : 0];
            timerDBridge_clearsEnable <= io_apb_PWDATA[16 : 16];
          end
        end
        8'h14 : begin
          if(busCtrl_doWrite) begin
            interruptCtrl_1_io_masks_driver <= io_apb_PWDATA[3 : 0];
          end
        end
        default : begin
        end
      endcase
    end
  end

  always @(posedge axiClk) begin
    case(io_apb_PADDR)
      8'h0 : begin
        if(busCtrl_doWrite) begin
          _zz_io_limit <= io_apb_PWDATA[15 : 0];
        end
      end
      8'h44 : begin
        if(busCtrl_doWrite) begin
          timerA_io_limit_driver <= io_apb_PWDATA[31 : 0];
        end
      end
      8'h54 : begin
        if(busCtrl_doWrite) begin
          timerB_io_limit_driver <= io_apb_PWDATA[31 : 0];
        end
      end
      8'h64 : begin
        if(busCtrl_doWrite) begin
          timerC_io_limit_driver <= io_apb_PWDATA[31 : 0];
        end
      end
      8'h74 : begin
        if(busCtrl_doWrite) begin
          timerD_io_limit_driver <= io_apb_PWDATA[31 : 0];
        end
      end
      default : begin
      end
    endcase
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
  input               axiClk,
  input               resetCtrl_axiReset
);

  wire       [15:0]   io_gpio_read_buffercc_io_dataOut;
  wire                ctrl_askWrite;
  wire                ctrl_askRead;
  wire                ctrl_doWrite;
  wire                ctrl_doRead;
  reg        [15:0]   io_gpio_write_driver;
  reg        [15:0]   io_gpio_writeEnable_driver;

  BufferCC_9 io_gpio_read_buffercc (
    .io_dataIn             (io_gpio_read[15:0]                      ), //i
    .io_dataOut            (io_gpio_read_buffercc_io_dataOut[15:0]  ), //o
    .axiClk                (axiClk                                  ), //i
    .resetCtrl_axiReset    (resetCtrl_axiReset                      )  //i
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
  always @(posedge axiClk or posedge resetCtrl_axiReset) begin
    if(resetCtrl_axiReset) begin
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

  always @(posedge axiClk) begin
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

module Apb3LedsCtrl (
  input      [7:0]    io_apb_PADDR,
  input      [0:0]    io_apb_PSEL,
  input               io_apb_PENABLE,
  output              io_apb_PREADY,
  input               io_apb_PWRITE,
  input      [31:0]   io_apb_PWDATA,
  output reg [31:0]   io_apb_PRDATA,
  output              io_apb_PSLVERROR,
  output     [2:0]    io_leds,
  input               axiClk,
  input               resetCtrl_axiReset
);

  wire       [2:0]    ledsctrl_1_io_o_leds;
  wire                busctrl_askWrite;
  wire                busctrl_askRead;
  wire                busctrl_doWrite;
  wire                busctrl_doRead;
  reg        [2:0]    _zz_io_apb_PRDATA;
  reg        [0:0]    _zz_io_apb_PRDATA_1;

  LedsCtrl ledsctrl_1 (
    .io_value     (_zz_io_apb_PRDATA[2:0]     ), //i
    .io_ldir      (_zz_io_apb_PRDATA_1        ), //i
    .io_o_leds    (ledsctrl_1_io_o_leds[2:0]  )  //o
  );
  assign io_apb_PREADY = 1'b1;
  always @(*) begin
    io_apb_PRDATA = 32'h0;
    case(io_apb_PADDR)
      8'h0 : begin
        io_apb_PRDATA[2 : 0] = _zz_io_apb_PRDATA;
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
  always @(posedge axiClk or posedge resetCtrl_axiReset) begin
    if(resetCtrl_axiReset) begin
      _zz_io_apb_PRDATA <= 3'b000;
    end else begin
      case(io_apb_PADDR)
        8'h0 : begin
          if(busctrl_doWrite) begin
            _zz_io_apb_PRDATA <= io_apb_PWDATA[2 : 0];
          end
        end
        default : begin
        end
      endcase
    end
  end

  always @(posedge axiClk) begin
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

module Axi4SharedToApb3Bridge (
  input               io_axi_arw_valid,
  output reg          io_axi_arw_ready,
  input      [19:0]   io_axi_arw_payload_addr,
  input      [3:0]    io_axi_arw_payload_id,
  input      [7:0]    io_axi_arw_payload_len,
  input      [2:0]    io_axi_arw_payload_size,
  input      [1:0]    io_axi_arw_payload_burst,
  input               io_axi_arw_payload_write,
  input               io_axi_w_valid,
  output reg          io_axi_w_ready,
  input      [31:0]   io_axi_w_payload_data,
  input      [3:0]    io_axi_w_payload_strb,
  input               io_axi_w_payload_last,
  output reg          io_axi_b_valid,
  input               io_axi_b_ready,
  output     [3:0]    io_axi_b_payload_id,
  output     [1:0]    io_axi_b_payload_resp,
  output reg          io_axi_r_valid,
  input               io_axi_r_ready,
  output     [31:0]   io_axi_r_payload_data,
  output     [3:0]    io_axi_r_payload_id,
  output     [1:0]    io_axi_r_payload_resp,
  output              io_axi_r_payload_last,
  output     [19:0]   io_apb_PADDR,
  output reg [0:0]    io_apb_PSEL,
  output reg          io_apb_PENABLE,
  input               io_apb_PREADY,
  output              io_apb_PWRITE,
  output     [31:0]   io_apb_PWDATA,
  input      [31:0]   io_apb_PRDATA,
  input               io_apb_PSLVERROR,
  input               axiClk,
  input               resetCtrl_axiReset
);
  localparam Axi4ToApb3BridgePhase_SETUP = 2'd0;
  localparam Axi4ToApb3BridgePhase_ACCESS_1 = 2'd1;
  localparam Axi4ToApb3BridgePhase_RESPONSE = 2'd2;

  reg        [1:0]    phase;
  reg                 write;
  reg        [31:0]   readedData;
  reg        [3:0]    id;
  wire                when_Axi4SharedToApb3Bridge_l91;
  `ifndef SYNTHESIS
  reg [63:0] phase_string;
  `endif


  `ifndef SYNTHESIS
  always @(*) begin
    case(phase)
      Axi4ToApb3BridgePhase_SETUP : phase_string = "SETUP   ";
      Axi4ToApb3BridgePhase_ACCESS_1 : phase_string = "ACCESS_1";
      Axi4ToApb3BridgePhase_RESPONSE : phase_string = "RESPONSE";
      default : phase_string = "????????";
    endcase
  end
  `endif

  always @(*) begin
    io_axi_arw_ready = 1'b0;
    case(phase)
      Axi4ToApb3BridgePhase_SETUP : begin
      end
      Axi4ToApb3BridgePhase_ACCESS_1 : begin
        if(io_apb_PREADY) begin
          io_axi_arw_ready = 1'b1;
        end
      end
      default : begin
      end
    endcase
  end

  always @(*) begin
    io_axi_w_ready = 1'b0;
    case(phase)
      Axi4ToApb3BridgePhase_SETUP : begin
      end
      Axi4ToApb3BridgePhase_ACCESS_1 : begin
        if(io_apb_PREADY) begin
          io_axi_w_ready = write;
        end
      end
      default : begin
      end
    endcase
  end

  always @(*) begin
    io_axi_b_valid = 1'b0;
    case(phase)
      Axi4ToApb3BridgePhase_SETUP : begin
      end
      Axi4ToApb3BridgePhase_ACCESS_1 : begin
      end
      default : begin
        if(write) begin
          io_axi_b_valid = 1'b1;
        end
      end
    endcase
  end

  always @(*) begin
    io_axi_r_valid = 1'b0;
    case(phase)
      Axi4ToApb3BridgePhase_SETUP : begin
      end
      Axi4ToApb3BridgePhase_ACCESS_1 : begin
      end
      default : begin
        if(!write) begin
          io_axi_r_valid = 1'b1;
        end
      end
    endcase
  end

  always @(*) begin
    io_apb_PSEL[0] = 1'b0;
    case(phase)
      Axi4ToApb3BridgePhase_SETUP : begin
        if(when_Axi4SharedToApb3Bridge_l91) begin
          io_apb_PSEL[0] = 1'b1;
        end
      end
      Axi4ToApb3BridgePhase_ACCESS_1 : begin
        io_apb_PSEL[0] = 1'b1;
      end
      default : begin
      end
    endcase
  end

  always @(*) begin
    io_apb_PENABLE = 1'b0;
    case(phase)
      Axi4ToApb3BridgePhase_SETUP : begin
      end
      Axi4ToApb3BridgePhase_ACCESS_1 : begin
        io_apb_PENABLE = 1'b1;
      end
      default : begin
      end
    endcase
  end

  assign when_Axi4SharedToApb3Bridge_l91 = (io_axi_arw_valid && ((! io_axi_arw_payload_write) || io_axi_w_valid));
  assign io_apb_PADDR = io_axi_arw_payload_addr;
  assign io_apb_PWDATA = io_axi_w_payload_data;
  assign io_apb_PWRITE = io_axi_arw_payload_write;
  assign io_axi_r_payload_resp = {io_apb_PSLVERROR,1'b0};
  assign io_axi_b_payload_resp = {io_apb_PSLVERROR,1'b0};
  assign io_axi_r_payload_id = id;
  assign io_axi_b_payload_id = id;
  assign io_axi_r_payload_data = readedData;
  assign io_axi_r_payload_last = 1'b1;
  always @(posedge axiClk or posedge resetCtrl_axiReset) begin
    if(resetCtrl_axiReset) begin
      phase <= Axi4ToApb3BridgePhase_SETUP;
    end else begin
      case(phase)
        Axi4ToApb3BridgePhase_SETUP : begin
          if(when_Axi4SharedToApb3Bridge_l91) begin
            phase <= Axi4ToApb3BridgePhase_ACCESS_1;
          end
        end
        Axi4ToApb3BridgePhase_ACCESS_1 : begin
          if(io_apb_PREADY) begin
            phase <= Axi4ToApb3BridgePhase_RESPONSE;
          end
        end
        default : begin
          if(write) begin
            if(io_axi_b_ready) begin
              phase <= Axi4ToApb3BridgePhase_SETUP;
            end
          end else begin
            if(io_axi_r_ready) begin
              phase <= Axi4ToApb3BridgePhase_SETUP;
            end
          end
        end
      endcase
    end
  end

  always @(posedge axiClk) begin
    case(phase)
      Axi4ToApb3BridgePhase_SETUP : begin
        write <= io_axi_arw_payload_write;
        id <= io_axi_arw_payload_id;
      end
      Axi4ToApb3BridgePhase_ACCESS_1 : begin
        if(io_apb_PREADY) begin
          readedData <= io_apb_PRDATA;
        end
      end
      default : begin
      end
    endcase
  end


endmodule

module Axi4SharedOnChipRam (
  input               io_axi_arw_valid,
  output reg          io_axi_arw_ready,
  input      [14:0]   io_axi_arw_payload_addr,
  input      [3:0]    io_axi_arw_payload_id,
  input      [7:0]    io_axi_arw_payload_len,
  input      [2:0]    io_axi_arw_payload_size,
  input      [1:0]    io_axi_arw_payload_burst,
  input               io_axi_arw_payload_write,
  input               io_axi_w_valid,
  output              io_axi_w_ready,
  input      [31:0]   io_axi_w_payload_data,
  input      [3:0]    io_axi_w_payload_strb,
  input               io_axi_w_payload_last,
  output              io_axi_b_valid,
  input               io_axi_b_ready,
  output     [3:0]    io_axi_b_payload_id,
  output     [1:0]    io_axi_b_payload_resp,
  output              io_axi_r_valid,
  input               io_axi_r_ready,
  output     [31:0]   io_axi_r_payload_data,
  output     [3:0]    io_axi_r_payload_id,
  output     [1:0]    io_axi_r_payload_resp,
  output              io_axi_r_payload_last,
  input               axiClk,
  input               resetCtrl_axiReset
);

  reg        [31:0]   _zz_ram_port0;
  wire       [1:0]    _zz_Axi4Incr_alignMask;
  wire       [11:0]   _zz_Axi4Incr_base;
  wire       [11:0]   _zz_Axi4Incr_base_1;
  wire       [11:0]   _zz_Axi4Incr_baseIncr;
  wire       [2:0]    _zz_Axi4Incr_wrapCase_1;
  wire       [2:0]    _zz_Axi4Incr_wrapCase_2;
  reg        [11:0]   _zz_Axi4Incr_result;
  wire       [10:0]   _zz_Axi4Incr_result_1;
  wire       [0:0]    _zz_Axi4Incr_result_2;
  wire       [9:0]    _zz_Axi4Incr_result_3;
  wire       [1:0]    _zz_Axi4Incr_result_4;
  wire       [8:0]    _zz_Axi4Incr_result_5;
  wire       [2:0]    _zz_Axi4Incr_result_6;
  wire       [7:0]    _zz_Axi4Incr_result_7;
  wire       [3:0]    _zz_Axi4Incr_result_8;
  wire       [6:0]    _zz_Axi4Incr_result_9;
  wire       [4:0]    _zz_Axi4Incr_result_10;
  wire       [5:0]    _zz_Axi4Incr_result_11;
  wire       [5:0]    _zz_Axi4Incr_result_12;
  reg                 unburstify_result_valid;
  wire                unburstify_result_ready;
  reg                 unburstify_result_payload_last;
  reg        [14:0]   unburstify_result_payload_fragment_addr;
  reg        [3:0]    unburstify_result_payload_fragment_id;
  reg        [2:0]    unburstify_result_payload_fragment_size;
  reg        [1:0]    unburstify_result_payload_fragment_burst;
  reg                 unburstify_result_payload_fragment_write;
  wire                unburstify_doResult;
  reg                 unburstify_buffer_valid;
  reg        [7:0]    unburstify_buffer_len;
  reg        [7:0]    unburstify_buffer_beat;
  reg        [14:0]   unburstify_buffer_transaction_addr;
  reg        [3:0]    unburstify_buffer_transaction_id;
  reg        [2:0]    unburstify_buffer_transaction_size;
  reg        [1:0]    unburstify_buffer_transaction_burst;
  reg                 unburstify_buffer_transaction_write;
  wire                unburstify_buffer_last;
  wire       [1:0]    Axi4Incr_validSize;
  reg        [14:0]   Axi4Incr_result;
  wire       [2:0]    Axi4Incr_highCat;
  wire       [2:0]    Axi4Incr_sizeValue;
  wire       [11:0]   Axi4Incr_alignMask;
  wire       [11:0]   Axi4Incr_base;
  wire       [11:0]   Axi4Incr_baseIncr;
  reg        [1:0]    _zz_Axi4Incr_wrapCase;
  wire       [2:0]    Axi4Incr_wrapCase;
  wire                when_Axi4Channel_l181;
  wire                _zz_unburstify_result_ready;
  wire                stage0_valid;
  reg                 stage0_ready;
  wire                stage0_payload_last;
  wire       [14:0]   stage0_payload_fragment_addr;
  wire       [3:0]    stage0_payload_fragment_id;
  wire       [2:0]    stage0_payload_fragment_size;
  wire       [1:0]    stage0_payload_fragment_burst;
  wire                stage0_payload_fragment_write;
  wire       [12:0]   _zz_io_axi_r_payload_data;
  wire                stage0_fire;
  wire       [31:0]   _zz_io_axi_r_payload_data_1;
  wire                stage1_valid;
  wire                stage1_ready;
  wire                stage1_payload_last;
  wire       [14:0]   stage1_payload_fragment_addr;
  wire       [3:0]    stage1_payload_fragment_id;
  wire       [2:0]    stage1_payload_fragment_size;
  wire       [1:0]    stage1_payload_fragment_burst;
  wire                stage1_payload_fragment_write;
  reg                 stage0_rValid;
  reg                 stage0_rData_last;
  reg        [14:0]   stage0_rData_fragment_addr;
  reg        [3:0]    stage0_rData_fragment_id;
  reg        [2:0]    stage0_rData_fragment_size;
  reg        [1:0]    stage0_rData_fragment_burst;
  reg                 stage0_rData_fragment_write;
  wire                when_Stream_l342;
  reg [7:0] ram_symbol0 [0:8191];
  reg [7:0] ram_symbol1 [0:8191];
  reg [7:0] ram_symbol2 [0:8191];
  reg [7:0] ram_symbol3 [0:8191];
  reg [7:0] _zz_ramsymbol_read;
  reg [7:0] _zz_ramsymbol_read_1;
  reg [7:0] _zz_ramsymbol_read_2;
  reg [7:0] _zz_ramsymbol_read_3;

  assign _zz_Axi4Incr_alignMask = {(2'b01 < Axi4Incr_validSize),(2'b00 < Axi4Incr_validSize)};
  assign _zz_Axi4Incr_base_1 = unburstify_buffer_transaction_addr[11 : 0];
  assign _zz_Axi4Incr_base = _zz_Axi4Incr_base_1;
  assign _zz_Axi4Incr_baseIncr = {9'd0, Axi4Incr_sizeValue};
  assign _zz_Axi4Incr_wrapCase_1 = {1'd0, Axi4Incr_validSize};
  assign _zz_Axi4Incr_wrapCase_2 = {1'd0, _zz_Axi4Incr_wrapCase};
  assign _zz_Axi4Incr_result_1 = Axi4Incr_base[11 : 1];
  assign _zz_Axi4Incr_result_2 = Axi4Incr_baseIncr[0 : 0];
  assign _zz_Axi4Incr_result_3 = Axi4Incr_base[11 : 2];
  assign _zz_Axi4Incr_result_4 = Axi4Incr_baseIncr[1 : 0];
  assign _zz_Axi4Incr_result_5 = Axi4Incr_base[11 : 3];
  assign _zz_Axi4Incr_result_6 = Axi4Incr_baseIncr[2 : 0];
  assign _zz_Axi4Incr_result_7 = Axi4Incr_base[11 : 4];
  assign _zz_Axi4Incr_result_8 = Axi4Incr_baseIncr[3 : 0];
  assign _zz_Axi4Incr_result_9 = Axi4Incr_base[11 : 5];
  assign _zz_Axi4Incr_result_10 = Axi4Incr_baseIncr[4 : 0];
  assign _zz_Axi4Incr_result_11 = Axi4Incr_base[11 : 6];
  assign _zz_Axi4Incr_result_12 = Axi4Incr_baseIncr[5 : 0];
  initial begin
    $readmemb("TangPrimerBriey.v_toplevel_axi_ram_ram_symbol0.bin",ram_symbol0);
    $readmemb("TangPrimerBriey.v_toplevel_axi_ram_ram_symbol1.bin",ram_symbol1);
    $readmemb("TangPrimerBriey.v_toplevel_axi_ram_ram_symbol2.bin",ram_symbol2);
    $readmemb("TangPrimerBriey.v_toplevel_axi_ram_ram_symbol3.bin",ram_symbol3);
  end
  always @(*) begin
    _zz_ram_port0 = {_zz_ramsymbol_read_3, _zz_ramsymbol_read_2, _zz_ramsymbol_read_1, _zz_ramsymbol_read};
  end
  always @(posedge axiClk) begin
    if(stage0_fire) begin
      _zz_ramsymbol_read <= ram_symbol0[_zz_io_axi_r_payload_data];
      _zz_ramsymbol_read_1 <= ram_symbol1[_zz_io_axi_r_payload_data];
      _zz_ramsymbol_read_2 <= ram_symbol2[_zz_io_axi_r_payload_data];
      _zz_ramsymbol_read_3 <= ram_symbol3[_zz_io_axi_r_payload_data];
    end
  end

  always @(posedge axiClk) begin
    if(io_axi_w_payload_strb[0] && stage0_fire && stage0_payload_fragment_write ) begin
      ram_symbol0[_zz_io_axi_r_payload_data] <= _zz_io_axi_r_payload_data_1[7 : 0];
    end
    if(io_axi_w_payload_strb[1] && stage0_fire && stage0_payload_fragment_write ) begin
      ram_symbol1[_zz_io_axi_r_payload_data] <= _zz_io_axi_r_payload_data_1[15 : 8];
    end
    if(io_axi_w_payload_strb[2] && stage0_fire && stage0_payload_fragment_write ) begin
      ram_symbol2[_zz_io_axi_r_payload_data] <= _zz_io_axi_r_payload_data_1[23 : 16];
    end
    if(io_axi_w_payload_strb[3] && stage0_fire && stage0_payload_fragment_write ) begin
      ram_symbol3[_zz_io_axi_r_payload_data] <= _zz_io_axi_r_payload_data_1[31 : 24];
    end
  end

  always @(*) begin
    case(Axi4Incr_wrapCase)
      3'b000 : begin
        _zz_Axi4Incr_result = {_zz_Axi4Incr_result_1,_zz_Axi4Incr_result_2};
      end
      3'b001 : begin
        _zz_Axi4Incr_result = {_zz_Axi4Incr_result_3,_zz_Axi4Incr_result_4};
      end
      3'b010 : begin
        _zz_Axi4Incr_result = {_zz_Axi4Incr_result_5,_zz_Axi4Incr_result_6};
      end
      3'b011 : begin
        _zz_Axi4Incr_result = {_zz_Axi4Incr_result_7,_zz_Axi4Incr_result_8};
      end
      3'b100 : begin
        _zz_Axi4Incr_result = {_zz_Axi4Incr_result_9,_zz_Axi4Incr_result_10};
      end
      default : begin
        _zz_Axi4Incr_result = {_zz_Axi4Incr_result_11,_zz_Axi4Incr_result_12};
      end
    endcase
  end

  assign unburstify_buffer_last = (unburstify_buffer_beat == 8'h01);
  assign Axi4Incr_validSize = unburstify_buffer_transaction_size[1 : 0];
  assign Axi4Incr_highCat = unburstify_buffer_transaction_addr[14 : 12];
  assign Axi4Incr_sizeValue = {(2'b10 == Axi4Incr_validSize),{(2'b01 == Axi4Incr_validSize),(2'b00 == Axi4Incr_validSize)}};
  assign Axi4Incr_alignMask = {10'd0, _zz_Axi4Incr_alignMask};
  assign Axi4Incr_base = (_zz_Axi4Incr_base & (~ Axi4Incr_alignMask));
  assign Axi4Incr_baseIncr = (Axi4Incr_base + _zz_Axi4Incr_baseIncr);
  always @(*) begin
    casez(unburstify_buffer_len)
      8'b????1??? : begin
        _zz_Axi4Incr_wrapCase = 2'b11;
      end
      8'b????01?? : begin
        _zz_Axi4Incr_wrapCase = 2'b10;
      end
      8'b????001? : begin
        _zz_Axi4Incr_wrapCase = 2'b01;
      end
      default : begin
        _zz_Axi4Incr_wrapCase = 2'b00;
      end
    endcase
  end

  assign Axi4Incr_wrapCase = (_zz_Axi4Incr_wrapCase_1 + _zz_Axi4Incr_wrapCase_2);
  always @(*) begin
    case(unburstify_buffer_transaction_burst)
      2'b00 : begin
        Axi4Incr_result = unburstify_buffer_transaction_addr;
      end
      2'b10 : begin
        Axi4Incr_result = {Axi4Incr_highCat,_zz_Axi4Incr_result};
      end
      default : begin
        Axi4Incr_result = {Axi4Incr_highCat,Axi4Incr_baseIncr};
      end
    endcase
  end

  always @(*) begin
    io_axi_arw_ready = 1'b0;
    if(!unburstify_buffer_valid) begin
      io_axi_arw_ready = unburstify_result_ready;
    end
  end

  always @(*) begin
    if(unburstify_buffer_valid) begin
      unburstify_result_valid = 1'b1;
    end else begin
      unburstify_result_valid = io_axi_arw_valid;
    end
  end

  always @(*) begin
    if(unburstify_buffer_valid) begin
      unburstify_result_payload_last = unburstify_buffer_last;
    end else begin
      if(when_Axi4Channel_l181) begin
        unburstify_result_payload_last = 1'b1;
      end else begin
        unburstify_result_payload_last = 1'b0;
      end
    end
  end

  always @(*) begin
    if(unburstify_buffer_valid) begin
      unburstify_result_payload_fragment_id = unburstify_buffer_transaction_id;
    end else begin
      unburstify_result_payload_fragment_id = io_axi_arw_payload_id;
    end
  end

  always @(*) begin
    if(unburstify_buffer_valid) begin
      unburstify_result_payload_fragment_size = unburstify_buffer_transaction_size;
    end else begin
      unburstify_result_payload_fragment_size = io_axi_arw_payload_size;
    end
  end

  always @(*) begin
    if(unburstify_buffer_valid) begin
      unburstify_result_payload_fragment_burst = unburstify_buffer_transaction_burst;
    end else begin
      unburstify_result_payload_fragment_burst = io_axi_arw_payload_burst;
    end
  end

  always @(*) begin
    if(unburstify_buffer_valid) begin
      unburstify_result_payload_fragment_write = unburstify_buffer_transaction_write;
    end else begin
      unburstify_result_payload_fragment_write = io_axi_arw_payload_write;
    end
  end

  always @(*) begin
    if(unburstify_buffer_valid) begin
      unburstify_result_payload_fragment_addr = Axi4Incr_result;
    end else begin
      unburstify_result_payload_fragment_addr = io_axi_arw_payload_addr;
    end
  end

  assign when_Axi4Channel_l181 = (io_axi_arw_payload_len == 8'h0);
  assign _zz_unburstify_result_ready = (! (unburstify_result_payload_fragment_write && (! io_axi_w_valid)));
  assign stage0_valid = (unburstify_result_valid && _zz_unburstify_result_ready);
  assign unburstify_result_ready = (stage0_ready && _zz_unburstify_result_ready);
  assign stage0_payload_last = unburstify_result_payload_last;
  assign stage0_payload_fragment_addr = unburstify_result_payload_fragment_addr;
  assign stage0_payload_fragment_id = unburstify_result_payload_fragment_id;
  assign stage0_payload_fragment_size = unburstify_result_payload_fragment_size;
  assign stage0_payload_fragment_burst = unburstify_result_payload_fragment_burst;
  assign stage0_payload_fragment_write = unburstify_result_payload_fragment_write;
  assign _zz_io_axi_r_payload_data = stage0_payload_fragment_addr[14 : 2];
  assign stage0_fire = (stage0_valid && stage0_ready);
  assign _zz_io_axi_r_payload_data_1 = io_axi_w_payload_data;
  assign io_axi_r_payload_data = _zz_ram_port0;
  assign io_axi_w_ready = ((unburstify_result_valid && unburstify_result_payload_fragment_write) && stage0_ready);
  always @(*) begin
    stage0_ready = stage1_ready;
    if(when_Stream_l342) begin
      stage0_ready = 1'b1;
    end
  end

  assign when_Stream_l342 = (! stage1_valid);
  assign stage1_valid = stage0_rValid;
  assign stage1_payload_last = stage0_rData_last;
  assign stage1_payload_fragment_addr = stage0_rData_fragment_addr;
  assign stage1_payload_fragment_id = stage0_rData_fragment_id;
  assign stage1_payload_fragment_size = stage0_rData_fragment_size;
  assign stage1_payload_fragment_burst = stage0_rData_fragment_burst;
  assign stage1_payload_fragment_write = stage0_rData_fragment_write;
  assign stage1_ready = ((io_axi_r_ready && (! stage1_payload_fragment_write)) || ((io_axi_b_ready || (! stage1_payload_last)) && stage1_payload_fragment_write));
  assign io_axi_r_valid = (stage1_valid && (! stage1_payload_fragment_write));
  assign io_axi_r_payload_id = stage1_payload_fragment_id;
  assign io_axi_r_payload_last = stage1_payload_last;
  assign io_axi_r_payload_resp = 2'b00;
  assign io_axi_b_valid = ((stage1_valid && stage1_payload_fragment_write) && stage1_payload_last);
  assign io_axi_b_payload_resp = 2'b00;
  assign io_axi_b_payload_id = stage1_payload_fragment_id;
  always @(posedge axiClk or posedge resetCtrl_axiReset) begin
    if(resetCtrl_axiReset) begin
      unburstify_buffer_valid <= 1'b0;
      stage0_rValid <= 1'b0;
    end else begin
      if(unburstify_result_ready) begin
        if(unburstify_buffer_last) begin
          unburstify_buffer_valid <= 1'b0;
        end
      end
      if(!unburstify_buffer_valid) begin
        if(!when_Axi4Channel_l181) begin
          if(unburstify_result_ready) begin
            unburstify_buffer_valid <= io_axi_arw_valid;
          end
        end
      end
      if(stage0_ready) begin
        stage0_rValid <= stage0_valid;
      end
    end
  end

  always @(posedge axiClk) begin
    if(unburstify_result_ready) begin
      unburstify_buffer_beat <= (unburstify_buffer_beat - 8'h01);
      unburstify_buffer_transaction_addr[11 : 0] <= Axi4Incr_result[11 : 0];
    end
    if(!unburstify_buffer_valid) begin
      if(!when_Axi4Channel_l181) begin
        if(unburstify_result_ready) begin
          unburstify_buffer_transaction_addr <= io_axi_arw_payload_addr;
          unburstify_buffer_transaction_id <= io_axi_arw_payload_id;
          unburstify_buffer_transaction_size <= io_axi_arw_payload_size;
          unburstify_buffer_transaction_burst <= io_axi_arw_payload_burst;
          unburstify_buffer_transaction_write <= io_axi_arw_payload_write;
          unburstify_buffer_beat <= io_axi_arw_payload_len;
          unburstify_buffer_len <= io_axi_arw_payload_len;
        end
      end
    end
    if(stage0_ready) begin
      stage0_rData_last <= stage0_payload_last;
      stage0_rData_fragment_addr <= stage0_payload_fragment_addr;
      stage0_rData_fragment_id <= stage0_payload_fragment_id;
      stage0_rData_fragment_size <= stage0_payload_fragment_size;
      stage0_rData_fragment_burst <= stage0_payload_fragment_burst;
      stage0_rData_fragment_write <= stage0_payload_fragment_write;
    end
  end


endmodule

module Axi4VgaCtrl (
  output              io_axi_ar_valid,
  input               io_axi_ar_ready,
  output     [31:0]   io_axi_ar_payload_addr,
  output     [7:0]    io_axi_ar_payload_len,
  output     [2:0]    io_axi_ar_payload_size,
  output     [3:0]    io_axi_ar_payload_cache,
  output     [2:0]    io_axi_ar_payload_prot,
  input               io_axi_r_valid,
  output              io_axi_r_ready,
  input      [31:0]   io_axi_r_payload_data,
  input               io_axi_r_payload_last,
  input      [7:0]    io_apb_PADDR,
  input      [0:0]    io_apb_PSEL,
  input               io_apb_PENABLE,
  output              io_apb_PREADY,
  input               io_apb_PWRITE,
  input      [31:0]   io_apb_PWDATA,
  output reg [31:0]   io_apb_PRDATA,
  output              io_vga_vSync,
  output              io_vga_hSync,
  output              io_vga_colorEn,
  output     [4:0]    io_vga_color_r,
  output     [5:0]    io_vga_color_g,
  output     [4:0]    io_vga_color_b,
  input               vgaClk,
  input               resetCtrl_vgaReset
);

  wire                dma_io_start;
  reg                 dma_io_frame_ready;
  wire                vga_ctrl_io_softReset;
  wire                vga_ctrl_io_pixels_valid;
  wire                dma_io_busy;
  wire                dma_io_mem_cmd_valid;
  wire       [26:0]   dma_io_mem_cmd_payload;
  wire                dma_io_frame_valid;
  wire                dma_io_frame_payload_last;
  wire       [4:0]    dma_io_frame_payload_fragment_r;
  wire       [5:0]    dma_io_frame_payload_fragment_g;
  wire       [4:0]    dma_io_frame_payload_fragment_b;
  wire                run_buffercc_io_dataOut;
  wire                vga_ctrl_io_frameStart;
  wire                vga_ctrl_io_pixels_ready;
  wire                vga_ctrl_io_vga_vSync;
  wire                vga_ctrl_io_vga_hSync;
  wire                vga_ctrl_io_vga_colorEn;
  wire       [4:0]    vga_ctrl_io_vga_color_r;
  wire       [5:0]    vga_ctrl_io_vga_color_g;
  wire       [4:0]    vga_ctrl_io_vga_color_b;
  wire                vga_ctrl_io_error;
  wire                pulseCCByToggle_1_io_pulseOut;
  wire                apbCtrl_askWrite;
  wire                apbCtrl_askRead;
  wire                apbCtrl_doWrite;
  wire                apbCtrl_doRead;
  reg                 run;
  reg        [14:0]   _zz_io_size;
  reg        [26:0]   _zz_io_base;
  wire                vga_run;
  reg                 vga_run_regNext;
  reg                 when_Stream_l408;
  reg                 _zz_dma_io_frame_translated_thrown_ready;
  reg                 _zz_when_VgaCtrl_l230;
  wire                dma_io_frame_fire;
  wire                dma_io_frame_fire_1;
  reg                 dma_io_frame_payload_first;
  wire                when_VgaCtrl_l218;
  wire                dma_io_frame_translated_valid;
  reg                 dma_io_frame_translated_ready;
  wire       [4:0]    dma_io_frame_translated_payload_r;
  wire       [5:0]    dma_io_frame_translated_payload_g;
  wire       [4:0]    dma_io_frame_translated_payload_b;
  reg                 dma_io_frame_translated_thrown_valid;
  wire                dma_io_frame_translated_thrown_ready;
  wire       [4:0]    dma_io_frame_translated_thrown_payload_r;
  wire       [5:0]    dma_io_frame_translated_thrown_payload_g;
  wire       [4:0]    dma_io_frame_translated_thrown_payload_b;
  wire                _zz_dma_io_frame_translated_thrown_ready_1;
  wire                dma_io_frame_fire_2;
  wire                when_VgaCtrl_l225;
  wire                when_VgaCtrl_l229;
  wire                when_VgaCtrl_l230;
  wire                when_Axi4VgaCtrl_l69;
  reg        [11:0]   _zz_io_timings_h_syncStart;
  reg        [11:0]   _zz_io_timings_h_syncEnd;
  reg        [11:0]   _zz_io_timings_h_colorStart;
  reg        [11:0]   _zz_io_timings_h_colorEnd;
  reg        [11:0]   _zz_io_timings_v_syncStart;
  reg        [11:0]   _zz_io_timings_v_syncEnd;
  reg        [11:0]   _zz_io_timings_v_colorStart;
  reg        [11:0]   _zz_io_timings_v_colorEnd;
  reg                 _zz_io_timings_h_polarity;
  reg                 _zz_io_timings_v_polarity;

  VideoDma dma (
    .io_start                       (dma_io_start                          ), //i
    .io_busy                        (dma_io_busy                           ), //o
    .io_base                        (_zz_io_base[26:0]                     ), //i
    .io_size                        (_zz_io_size[14:0]                     ), //i
    .io_mem_cmd_valid               (dma_io_mem_cmd_valid                  ), //o
    .io_mem_cmd_ready               (io_axi_ar_ready                       ), //i
    .io_mem_cmd_payload             (dma_io_mem_cmd_payload[26:0]          ), //o
    .io_mem_rsp_valid               (io_axi_r_valid                        ), //i
    .io_mem_rsp_payload_last        (io_axi_r_payload_last                 ), //i
    .io_mem_rsp_payload_fragment    (io_axi_r_payload_data[31:0]           ), //i
    .io_frame_valid                 (dma_io_frame_valid                    ), //o
    .io_frame_ready                 (dma_io_frame_ready                    ), //i
    .io_frame_payload_last          (dma_io_frame_payload_last             ), //o
    .io_frame_payload_fragment_r    (dma_io_frame_payload_fragment_r[4:0]  ), //o
    .io_frame_payload_fragment_g    (dma_io_frame_payload_fragment_g[5:0]  ), //o
    .io_frame_payload_fragment_b    (dma_io_frame_payload_fragment_b[4:0]  ), //o
    .vgaClk                         (vgaClk                                ), //i
    .resetCtrl_vgaReset             (resetCtrl_vgaReset                    )  //i
  );
  BufferCC_8 run_buffercc (
    .io_dataIn             (run                      ), //i
    .io_dataOut            (run_buffercc_io_dataOut  ), //o
    .vgaClk                (vgaClk                   ), //i
    .resetCtrl_vgaReset    (resetCtrl_vgaReset       )  //i
  );
  VgaCtrl vga_ctrl (
    .io_softReset               (vga_ctrl_io_softReset                          ), //i
    .io_timings_h_syncStart     (_zz_io_timings_h_syncStart[11:0]               ), //i
    .io_timings_h_syncEnd       (_zz_io_timings_h_syncEnd[11:0]                 ), //i
    .io_timings_h_colorStart    (_zz_io_timings_h_colorStart[11:0]              ), //i
    .io_timings_h_colorEnd      (_zz_io_timings_h_colorEnd[11:0]                ), //i
    .io_timings_h_polarity      (_zz_io_timings_h_polarity                      ), //i
    .io_timings_v_syncStart     (_zz_io_timings_v_syncStart[11:0]               ), //i
    .io_timings_v_syncEnd       (_zz_io_timings_v_syncEnd[11:0]                 ), //i
    .io_timings_v_colorStart    (_zz_io_timings_v_colorStart[11:0]              ), //i
    .io_timings_v_colorEnd      (_zz_io_timings_v_colorEnd[11:0]                ), //i
    .io_timings_v_polarity      (_zz_io_timings_v_polarity                      ), //i
    .io_frameStart              (vga_ctrl_io_frameStart                         ), //o
    .io_pixels_valid            (vga_ctrl_io_pixels_valid                       ), //i
    .io_pixels_ready            (vga_ctrl_io_pixels_ready                       ), //o
    .io_pixels_payload_r        (dma_io_frame_translated_thrown_payload_r[4:0]  ), //i
    .io_pixels_payload_g        (dma_io_frame_translated_thrown_payload_g[5:0]  ), //i
    .io_pixels_payload_b        (dma_io_frame_translated_thrown_payload_b[4:0]  ), //i
    .io_vga_vSync               (vga_ctrl_io_vga_vSync                          ), //o
    .io_vga_hSync               (vga_ctrl_io_vga_hSync                          ), //o
    .io_vga_colorEn             (vga_ctrl_io_vga_colorEn                        ), //o
    .io_vga_color_r             (vga_ctrl_io_vga_color_r[4:0]                   ), //o
    .io_vga_color_g             (vga_ctrl_io_vga_color_g[5:0]                   ), //o
    .io_vga_color_b             (vga_ctrl_io_vga_color_b[4:0]                   ), //o
    .io_error                   (vga_ctrl_io_error                              ), //o
    .vgaClk                     (vgaClk                                         ), //i
    .resetCtrl_vgaReset         (resetCtrl_vgaReset                             )  //i
  );
  PulseCCByToggle pulseCCByToggle_1 (
    .io_pulseIn            (vga_ctrl_io_frameStart         ), //i
    .io_pulseOut           (pulseCCByToggle_1_io_pulseOut  ), //o
    .vgaClk                (vgaClk                         ), //i
    .resetCtrl_vgaReset    (resetCtrl_vgaReset             )  //i
  );
  assign io_apb_PREADY = 1'b1;
  always @(*) begin
    io_apb_PRDATA = 32'h0;
    case(io_apb_PADDR)
      8'h0 : begin
        io_apb_PRDATA[0 : 0] = run;
        io_apb_PRDATA[1 : 1] = dma_io_busy;
      end
      default : begin
      end
    endcase
  end

  assign apbCtrl_askWrite = ((io_apb_PSEL[0] && io_apb_PENABLE) && io_apb_PWRITE);
  assign apbCtrl_askRead = ((io_apb_PSEL[0] && io_apb_PENABLE) && (! io_apb_PWRITE));
  assign apbCtrl_doWrite = (((io_apb_PSEL[0] && io_apb_PENABLE) && io_apb_PREADY) && io_apb_PWRITE);
  assign apbCtrl_doRead = (((io_apb_PSEL[0] && io_apb_PENABLE) && io_apb_PREADY) && (! io_apb_PWRITE));
  assign io_axi_ar_valid = dma_io_mem_cmd_valid;
  assign io_axi_ar_payload_addr = ({5'd0,dma_io_mem_cmd_payload} <<< 5);
  assign io_axi_ar_payload_len = 8'h07;
  assign io_axi_ar_payload_size = 3'b010;
  assign io_axi_ar_payload_cache = 4'b1111;
  assign io_axi_ar_payload_prot = 3'b010;
  assign io_axi_r_ready = 1'b1;
  assign vga_run = run_buffercc_io_dataOut;
  assign dma_io_frame_fire = (dma_io_frame_valid && dma_io_frame_ready);
  assign dma_io_frame_fire_1 = (dma_io_frame_valid && dma_io_frame_ready);
  assign when_VgaCtrl_l218 = (dma_io_frame_fire && dma_io_frame_payload_first);
  assign dma_io_frame_translated_valid = dma_io_frame_valid;
  always @(*) begin
    dma_io_frame_ready = dma_io_frame_translated_ready;
    if(when_Axi4VgaCtrl_l69) begin
      dma_io_frame_ready = 1'b1;
    end
  end

  assign dma_io_frame_translated_payload_r = dma_io_frame_payload_fragment_r;
  assign dma_io_frame_translated_payload_g = dma_io_frame_payload_fragment_g;
  assign dma_io_frame_translated_payload_b = dma_io_frame_payload_fragment_b;
  always @(*) begin
    dma_io_frame_translated_thrown_valid = dma_io_frame_translated_valid;
    if(when_Stream_l408) begin
      dma_io_frame_translated_thrown_valid = 1'b0;
    end
  end

  always @(*) begin
    dma_io_frame_translated_ready = dma_io_frame_translated_thrown_ready;
    if(when_Stream_l408) begin
      dma_io_frame_translated_ready = 1'b1;
    end
  end

  assign dma_io_frame_translated_thrown_payload_r = dma_io_frame_translated_payload_r;
  assign dma_io_frame_translated_thrown_payload_g = dma_io_frame_translated_payload_g;
  assign dma_io_frame_translated_thrown_payload_b = dma_io_frame_translated_payload_b;
  assign _zz_dma_io_frame_translated_thrown_ready_1 = (! _zz_dma_io_frame_translated_thrown_ready);
  assign dma_io_frame_translated_thrown_ready = (vga_ctrl_io_pixels_ready && _zz_dma_io_frame_translated_thrown_ready_1);
  assign vga_ctrl_io_pixels_valid = (dma_io_frame_translated_thrown_valid && _zz_dma_io_frame_translated_thrown_ready_1);
  assign dma_io_frame_fire_2 = (dma_io_frame_valid && dma_io_frame_ready);
  assign when_VgaCtrl_l225 = (dma_io_frame_fire_2 && dma_io_frame_payload_last);
  assign when_VgaCtrl_l229 = ((! _zz_dma_io_frame_translated_thrown_ready) && (! when_Stream_l408));
  assign when_VgaCtrl_l230 = ((vga_ctrl_io_error || (vga_run && (! vga_run_regNext))) || ((_zz_when_VgaCtrl_l230 && dma_io_frame_valid) && (! dma_io_frame_payload_first)));
  assign when_Axi4VgaCtrl_l69 = (! vga_run);
  assign vga_ctrl_io_softReset = (! vga_run);
  assign io_vga_vSync = vga_ctrl_io_vga_vSync;
  assign io_vga_hSync = vga_ctrl_io_vga_hSync;
  assign io_vga_colorEn = vga_ctrl_io_vga_colorEn;
  assign io_vga_color_r = vga_ctrl_io_vga_color_r;
  assign io_vga_color_g = vga_ctrl_io_vga_color_g;
  assign io_vga_color_b = vga_ctrl_io_vga_color_b;
  assign dma_io_start = (pulseCCByToggle_1_io_pulseOut && run);
  always @(posedge vgaClk or posedge resetCtrl_vgaReset) begin
    if(resetCtrl_vgaReset) begin
      run <= 1'b0;
      when_Stream_l408 <= 1'b0;
      _zz_dma_io_frame_translated_thrown_ready <= 1'b0;
      dma_io_frame_payload_first <= 1'b1;
      _zz_io_timings_h_polarity <= 1'b0;
      _zz_io_timings_v_polarity <= 1'b0;
    end else begin
      if(dma_io_frame_fire_1) begin
        dma_io_frame_payload_first <= dma_io_frame_payload_last;
      end
      if(vga_ctrl_io_frameStart) begin
        _zz_dma_io_frame_translated_thrown_ready <= 1'b0;
      end
      if(when_VgaCtrl_l225) begin
        when_Stream_l408 <= 1'b0;
        _zz_dma_io_frame_translated_thrown_ready <= when_Stream_l408;
      end
      if(when_VgaCtrl_l229) begin
        if(when_VgaCtrl_l230) begin
          when_Stream_l408 <= 1'b1;
        end
      end
      case(io_apb_PADDR)
        8'h0 : begin
          if(apbCtrl_doWrite) begin
            run <= io_apb_PWDATA[0];
          end
        end
        8'h60 : begin
          if(apbCtrl_doWrite) begin
            _zz_io_timings_h_polarity <= io_apb_PWDATA[0];
            _zz_io_timings_v_polarity <= io_apb_PWDATA[1];
          end
        end
        default : begin
        end
      endcase
    end
  end

  always @(posedge vgaClk) begin
    vga_run_regNext <= vga_run;
    if(vga_ctrl_io_frameStart) begin
      _zz_when_VgaCtrl_l230 <= 1'b1;
    end
    if(when_VgaCtrl_l218) begin
      _zz_when_VgaCtrl_l230 <= 1'b0;
    end
    case(io_apb_PADDR)
      8'h04 : begin
        if(apbCtrl_doWrite) begin
          _zz_io_size <= io_apb_PWDATA[19 : 5];
        end
      end
      8'h08 : begin
        if(apbCtrl_doWrite) begin
          _zz_io_base <= io_apb_PWDATA[31 : 5];
        end
      end
      8'h40 : begin
        if(apbCtrl_doWrite) begin
          _zz_io_timings_h_syncStart <= io_apb_PWDATA[11 : 0];
        end
      end
      8'h44 : begin
        if(apbCtrl_doWrite) begin
          _zz_io_timings_h_syncEnd <= io_apb_PWDATA[11 : 0];
        end
      end
      8'h48 : begin
        if(apbCtrl_doWrite) begin
          _zz_io_timings_h_colorStart <= io_apb_PWDATA[11 : 0];
        end
      end
      8'h4c : begin
        if(apbCtrl_doWrite) begin
          _zz_io_timings_h_colorEnd <= io_apb_PWDATA[11 : 0];
        end
      end
      8'h50 : begin
        if(apbCtrl_doWrite) begin
          _zz_io_timings_v_syncStart <= io_apb_PWDATA[11 : 0];
        end
      end
      8'h54 : begin
        if(apbCtrl_doWrite) begin
          _zz_io_timings_v_syncEnd <= io_apb_PWDATA[11 : 0];
        end
      end
      8'h58 : begin
        if(apbCtrl_doWrite) begin
          _zz_io_timings_v_colorStart <= io_apb_PWDATA[11 : 0];
        end
      end
      8'h5c : begin
        if(apbCtrl_doWrite) begin
          _zz_io_timings_v_colorEnd <= io_apb_PWDATA[11 : 0];
        end
      end
      default : begin
      end
    endcase
  end


endmodule

module Axi4SharedSdramCtrl (
  input               io_axi_arw_valid,
  output reg          io_axi_arw_ready,
  input      [22:0]   io_axi_arw_payload_addr,
  input      [3:0]    io_axi_arw_payload_id,
  input      [7:0]    io_axi_arw_payload_len,
  input      [2:0]    io_axi_arw_payload_size,
  input      [1:0]    io_axi_arw_payload_burst,
  input               io_axi_arw_payload_write,
  input               io_axi_w_valid,
  output              io_axi_w_ready,
  input      [31:0]   io_axi_w_payload_data,
  input      [3:0]    io_axi_w_payload_strb,
  input               io_axi_w_payload_last,
  output              io_axi_b_valid,
  input               io_axi_b_ready,
  output     [3:0]    io_axi_b_payload_id,
  output     [1:0]    io_axi_b_payload_resp,
  output              io_axi_r_valid,
  input               io_axi_r_ready,
  output     [31:0]   io_axi_r_payload_data,
  output     [3:0]    io_axi_r_payload_id,
  output     [1:0]    io_axi_r_payload_resp,
  output              io_axi_r_payload_last,
  output     [10:0]   io_sdram_ADDR,
  output     [1:0]    io_sdram_BA,
  input      [31:0]   io_sdram_DQ_read,
  output     [31:0]   io_sdram_DQ_write,
  output     [31:0]   io_sdram_DQ_writeEnable,
  output     [3:0]    io_sdram_DQM,
  output              io_sdram_CASn,
  output              io_sdram_CKE,
  output              io_sdram_CSn,
  output              io_sdram_RASn,
  output              io_sdram_WEn,
  input               sdramCtrlClk,
  input               resetCtrl_sdramReset
);

  wire       [20:0]   ctrl_io_bus_cmd_payload_address;
  wire                ctrl_io_bus_cmd_ready;
  wire                ctrl_io_bus_rsp_valid;
  wire       [31:0]   ctrl_io_bus_rsp_payload_data;
  wire       [3:0]    ctrl_io_bus_rsp_payload_context_id;
  wire                ctrl_io_bus_rsp_payload_context_last;
  wire       [10:0]   ctrl_io_sdram_ADDR;
  wire       [1:0]    ctrl_io_sdram_BA;
  wire                ctrl_io_sdram_CASn;
  wire                ctrl_io_sdram_CKE;
  wire                ctrl_io_sdram_CSn;
  wire       [3:0]    ctrl_io_sdram_DQM;
  wire                ctrl_io_sdram_RASn;
  wire                ctrl_io_sdram_WEn;
  wire       [31:0]   ctrl_io_sdram_DQ_write;
  wire       [31:0]   ctrl_io_sdram_DQ_writeEnable;
  wire       [1:0]    _zz_Axi4Incr_alignMask;
  wire       [11:0]   _zz_Axi4Incr_base;
  wire       [11:0]   _zz_Axi4Incr_base_1;
  wire       [11:0]   _zz_Axi4Incr_baseIncr;
  wire       [2:0]    _zz_Axi4Incr_wrapCase_1;
  wire       [2:0]    _zz_Axi4Incr_wrapCase_2;
  reg        [11:0]   _zz_Axi4Incr_result;
  wire       [10:0]   _zz_Axi4Incr_result_1;
  wire       [0:0]    _zz_Axi4Incr_result_2;
  wire       [9:0]    _zz_Axi4Incr_result_3;
  wire       [1:0]    _zz_Axi4Incr_result_4;
  wire       [8:0]    _zz_Axi4Incr_result_5;
  wire       [2:0]    _zz_Axi4Incr_result_6;
  wire       [7:0]    _zz_Axi4Incr_result_7;
  wire       [3:0]    _zz_Axi4Incr_result_8;
  wire       [6:0]    _zz_Axi4Incr_result_9;
  wire       [4:0]    _zz_Axi4Incr_result_10;
  wire       [5:0]    _zz_Axi4Incr_result_11;
  wire       [5:0]    _zz_Axi4Incr_result_12;
  reg                 unburstify_result_valid;
  wire                unburstify_result_ready;
  reg                 unburstify_result_payload_last;
  reg        [22:0]   unburstify_result_payload_fragment_addr;
  reg        [3:0]    unburstify_result_payload_fragment_id;
  reg        [2:0]    unburstify_result_payload_fragment_size;
  reg        [1:0]    unburstify_result_payload_fragment_burst;
  reg                 unburstify_result_payload_fragment_write;
  wire                unburstify_doResult;
  reg                 unburstify_buffer_valid;
  reg        [7:0]    unburstify_buffer_len;
  reg        [7:0]    unburstify_buffer_beat;
  reg        [22:0]   unburstify_buffer_transaction_addr;
  reg        [3:0]    unburstify_buffer_transaction_id;
  reg        [2:0]    unburstify_buffer_transaction_size;
  reg        [1:0]    unburstify_buffer_transaction_burst;
  reg                 unburstify_buffer_transaction_write;
  wire                unburstify_buffer_last;
  wire       [1:0]    Axi4Incr_validSize;
  reg        [22:0]   Axi4Incr_result;
  wire       [10:0]   Axi4Incr_highCat;
  wire       [2:0]    Axi4Incr_sizeValue;
  wire       [11:0]   Axi4Incr_alignMask;
  wire       [11:0]   Axi4Incr_base;
  wire       [11:0]   Axi4Incr_baseIncr;
  reg        [1:0]    _zz_Axi4Incr_wrapCase;
  wire       [2:0]    Axi4Incr_wrapCase;
  wire                when_Axi4Channel_l181;
  wire                _zz_unburstify_result_ready;
  wire                bridge_axiCmd_valid;
  wire                bridge_axiCmd_ready;
  wire                bridge_axiCmd_payload_last;
  wire       [22:0]   bridge_axiCmd_payload_fragment_addr;
  wire       [3:0]    bridge_axiCmd_payload_fragment_id;
  wire       [2:0]    bridge_axiCmd_payload_fragment_size;
  wire       [1:0]    bridge_axiCmd_payload_fragment_burst;
  wire                bridge_axiCmd_payload_fragment_write;
  wire                bridge_writeRsp_valid;
  reg                 bridge_writeRsp_ready;
  wire       [3:0]    bridge_writeRsp_payload_id;
  wire       [1:0]    bridge_writeRsp_payload_resp;
  wire                bridge_axiCmd_fire;
  wire                bridge_writeRsp_m2sPipe_valid;
  wire                bridge_writeRsp_m2sPipe_ready;
  wire       [3:0]    bridge_writeRsp_m2sPipe_payload_id;
  wire       [1:0]    bridge_writeRsp_m2sPipe_payload_resp;
  reg                 bridge_writeRsp_rValid;
  reg        [3:0]    bridge_writeRsp_rData_id;
  reg        [1:0]    bridge_writeRsp_rData_resp;
  wire                when_Stream_l342;

  assign _zz_Axi4Incr_alignMask = {(2'b01 < Axi4Incr_validSize),(2'b00 < Axi4Incr_validSize)};
  assign _zz_Axi4Incr_base_1 = unburstify_buffer_transaction_addr[11 : 0];
  assign _zz_Axi4Incr_base = _zz_Axi4Incr_base_1;
  assign _zz_Axi4Incr_baseIncr = {9'd0, Axi4Incr_sizeValue};
  assign _zz_Axi4Incr_wrapCase_1 = {1'd0, Axi4Incr_validSize};
  assign _zz_Axi4Incr_wrapCase_2 = {1'd0, _zz_Axi4Incr_wrapCase};
  assign _zz_Axi4Incr_result_1 = Axi4Incr_base[11 : 1];
  assign _zz_Axi4Incr_result_2 = Axi4Incr_baseIncr[0 : 0];
  assign _zz_Axi4Incr_result_3 = Axi4Incr_base[11 : 2];
  assign _zz_Axi4Incr_result_4 = Axi4Incr_baseIncr[1 : 0];
  assign _zz_Axi4Incr_result_5 = Axi4Incr_base[11 : 3];
  assign _zz_Axi4Incr_result_6 = Axi4Incr_baseIncr[2 : 0];
  assign _zz_Axi4Incr_result_7 = Axi4Incr_base[11 : 4];
  assign _zz_Axi4Incr_result_8 = Axi4Incr_baseIncr[3 : 0];
  assign _zz_Axi4Incr_result_9 = Axi4Incr_base[11 : 5];
  assign _zz_Axi4Incr_result_10 = Axi4Incr_baseIncr[4 : 0];
  assign _zz_Axi4Incr_result_11 = Axi4Incr_base[11 : 6];
  assign _zz_Axi4Incr_result_12 = Axi4Incr_baseIncr[5 : 0];
  SdramCtrl ctrl (
    .io_bus_cmd_valid                   (bridge_axiCmd_valid                      ), //i
    .io_bus_cmd_ready                   (ctrl_io_bus_cmd_ready                    ), //o
    .io_bus_cmd_payload_address         (ctrl_io_bus_cmd_payload_address[20:0]    ), //i
    .io_bus_cmd_payload_write           (bridge_axiCmd_payload_fragment_write     ), //i
    .io_bus_cmd_payload_data            (io_axi_w_payload_data[31:0]              ), //i
    .io_bus_cmd_payload_mask            (io_axi_w_payload_strb[3:0]               ), //i
    .io_bus_cmd_payload_context_id      (bridge_axiCmd_payload_fragment_id[3:0]   ), //i
    .io_bus_cmd_payload_context_last    (bridge_axiCmd_payload_last               ), //i
    .io_bus_rsp_valid                   (ctrl_io_bus_rsp_valid                    ), //o
    .io_bus_rsp_ready                   (io_axi_r_ready                           ), //i
    .io_bus_rsp_payload_data            (ctrl_io_bus_rsp_payload_data[31:0]       ), //o
    .io_bus_rsp_payload_context_id      (ctrl_io_bus_rsp_payload_context_id[3:0]  ), //o
    .io_bus_rsp_payload_context_last    (ctrl_io_bus_rsp_payload_context_last     ), //o
    .io_sdram_ADDR                      (ctrl_io_sdram_ADDR[10:0]                 ), //o
    .io_sdram_BA                        (ctrl_io_sdram_BA[1:0]                    ), //o
    .io_sdram_DQ_read                   (io_sdram_DQ_read[31:0]                   ), //i
    .io_sdram_DQ_write                  (ctrl_io_sdram_DQ_write[31:0]             ), //o
    .io_sdram_DQ_writeEnable            (ctrl_io_sdram_DQ_writeEnable[31:0]       ), //o
    .io_sdram_DQM                       (ctrl_io_sdram_DQM[3:0]                   ), //o
    .io_sdram_CASn                      (ctrl_io_sdram_CASn                       ), //o
    .io_sdram_CKE                       (ctrl_io_sdram_CKE                        ), //o
    .io_sdram_CSn                       (ctrl_io_sdram_CSn                        ), //o
    .io_sdram_RASn                      (ctrl_io_sdram_RASn                       ), //o
    .io_sdram_WEn                       (ctrl_io_sdram_WEn                        ), //o
    .sdramCtrlClk                       (sdramCtrlClk                             ), //i
    .resetCtrl_sdramReset               (resetCtrl_sdramReset                     )  //i
  );
  always @(*) begin
    case(Axi4Incr_wrapCase)
      3'b000 : begin
        _zz_Axi4Incr_result = {_zz_Axi4Incr_result_1,_zz_Axi4Incr_result_2};
      end
      3'b001 : begin
        _zz_Axi4Incr_result = {_zz_Axi4Incr_result_3,_zz_Axi4Incr_result_4};
      end
      3'b010 : begin
        _zz_Axi4Incr_result = {_zz_Axi4Incr_result_5,_zz_Axi4Incr_result_6};
      end
      3'b011 : begin
        _zz_Axi4Incr_result = {_zz_Axi4Incr_result_7,_zz_Axi4Incr_result_8};
      end
      3'b100 : begin
        _zz_Axi4Incr_result = {_zz_Axi4Incr_result_9,_zz_Axi4Incr_result_10};
      end
      default : begin
        _zz_Axi4Incr_result = {_zz_Axi4Incr_result_11,_zz_Axi4Incr_result_12};
      end
    endcase
  end

  assign unburstify_buffer_last = (unburstify_buffer_beat == 8'h01);
  assign Axi4Incr_validSize = unburstify_buffer_transaction_size[1 : 0];
  assign Axi4Incr_highCat = unburstify_buffer_transaction_addr[22 : 12];
  assign Axi4Incr_sizeValue = {(2'b10 == Axi4Incr_validSize),{(2'b01 == Axi4Incr_validSize),(2'b00 == Axi4Incr_validSize)}};
  assign Axi4Incr_alignMask = {10'd0, _zz_Axi4Incr_alignMask};
  assign Axi4Incr_base = (_zz_Axi4Incr_base & (~ Axi4Incr_alignMask));
  assign Axi4Incr_baseIncr = (Axi4Incr_base + _zz_Axi4Incr_baseIncr);
  always @(*) begin
    casez(unburstify_buffer_len)
      8'b????1??? : begin
        _zz_Axi4Incr_wrapCase = 2'b11;
      end
      8'b????01?? : begin
        _zz_Axi4Incr_wrapCase = 2'b10;
      end
      8'b????001? : begin
        _zz_Axi4Incr_wrapCase = 2'b01;
      end
      default : begin
        _zz_Axi4Incr_wrapCase = 2'b00;
      end
    endcase
  end

  assign Axi4Incr_wrapCase = (_zz_Axi4Incr_wrapCase_1 + _zz_Axi4Incr_wrapCase_2);
  always @(*) begin
    case(unburstify_buffer_transaction_burst)
      2'b00 : begin
        Axi4Incr_result = unburstify_buffer_transaction_addr;
      end
      2'b10 : begin
        Axi4Incr_result = {Axi4Incr_highCat,_zz_Axi4Incr_result};
      end
      default : begin
        Axi4Incr_result = {Axi4Incr_highCat,Axi4Incr_baseIncr};
      end
    endcase
  end

  always @(*) begin
    io_axi_arw_ready = 1'b0;
    if(!unburstify_buffer_valid) begin
      io_axi_arw_ready = unburstify_result_ready;
    end
  end

  always @(*) begin
    if(unburstify_buffer_valid) begin
      unburstify_result_valid = 1'b1;
    end else begin
      unburstify_result_valid = io_axi_arw_valid;
    end
  end

  always @(*) begin
    if(unburstify_buffer_valid) begin
      unburstify_result_payload_last = unburstify_buffer_last;
    end else begin
      if(when_Axi4Channel_l181) begin
        unburstify_result_payload_last = 1'b1;
      end else begin
        unburstify_result_payload_last = 1'b0;
      end
    end
  end

  always @(*) begin
    if(unburstify_buffer_valid) begin
      unburstify_result_payload_fragment_id = unburstify_buffer_transaction_id;
    end else begin
      unburstify_result_payload_fragment_id = io_axi_arw_payload_id;
    end
  end

  always @(*) begin
    if(unburstify_buffer_valid) begin
      unburstify_result_payload_fragment_size = unburstify_buffer_transaction_size;
    end else begin
      unburstify_result_payload_fragment_size = io_axi_arw_payload_size;
    end
  end

  always @(*) begin
    if(unburstify_buffer_valid) begin
      unburstify_result_payload_fragment_burst = unburstify_buffer_transaction_burst;
    end else begin
      unburstify_result_payload_fragment_burst = io_axi_arw_payload_burst;
    end
  end

  always @(*) begin
    if(unburstify_buffer_valid) begin
      unburstify_result_payload_fragment_write = unburstify_buffer_transaction_write;
    end else begin
      unburstify_result_payload_fragment_write = io_axi_arw_payload_write;
    end
  end

  always @(*) begin
    if(unburstify_buffer_valid) begin
      unburstify_result_payload_fragment_addr = Axi4Incr_result;
    end else begin
      unburstify_result_payload_fragment_addr = io_axi_arw_payload_addr;
    end
  end

  assign when_Axi4Channel_l181 = (io_axi_arw_payload_len == 8'h0);
  assign _zz_unburstify_result_ready = (! (unburstify_result_payload_fragment_write && (! io_axi_w_valid)));
  assign bridge_axiCmd_valid = (unburstify_result_valid && _zz_unburstify_result_ready);
  assign unburstify_result_ready = (bridge_axiCmd_ready && _zz_unburstify_result_ready);
  assign bridge_axiCmd_payload_last = unburstify_result_payload_last;
  assign bridge_axiCmd_payload_fragment_addr = unburstify_result_payload_fragment_addr;
  assign bridge_axiCmd_payload_fragment_id = unburstify_result_payload_fragment_id;
  assign bridge_axiCmd_payload_fragment_size = unburstify_result_payload_fragment_size;
  assign bridge_axiCmd_payload_fragment_burst = unburstify_result_payload_fragment_burst;
  assign bridge_axiCmd_payload_fragment_write = unburstify_result_payload_fragment_write;
  assign ctrl_io_bus_cmd_payload_address = bridge_axiCmd_payload_fragment_addr[22 : 2];
  assign bridge_axiCmd_fire = (bridge_axiCmd_valid && bridge_axiCmd_ready);
  assign bridge_writeRsp_valid = ((bridge_axiCmd_fire && bridge_axiCmd_payload_fragment_write) && bridge_axiCmd_payload_last);
  assign bridge_writeRsp_payload_resp = 2'b00;
  assign bridge_writeRsp_payload_id = bridge_axiCmd_payload_fragment_id;
  always @(*) begin
    bridge_writeRsp_ready = bridge_writeRsp_m2sPipe_ready;
    if(when_Stream_l342) begin
      bridge_writeRsp_ready = 1'b1;
    end
  end

  assign when_Stream_l342 = (! bridge_writeRsp_m2sPipe_valid);
  assign bridge_writeRsp_m2sPipe_valid = bridge_writeRsp_rValid;
  assign bridge_writeRsp_m2sPipe_payload_id = bridge_writeRsp_rData_id;
  assign bridge_writeRsp_m2sPipe_payload_resp = bridge_writeRsp_rData_resp;
  assign io_axi_b_valid = bridge_writeRsp_m2sPipe_valid;
  assign bridge_writeRsp_m2sPipe_ready = io_axi_b_ready;
  assign io_axi_b_payload_id = bridge_writeRsp_m2sPipe_payload_id;
  assign io_axi_b_payload_resp = bridge_writeRsp_m2sPipe_payload_resp;
  assign io_axi_r_valid = ctrl_io_bus_rsp_valid;
  assign io_axi_r_payload_id = ctrl_io_bus_rsp_payload_context_id;
  assign io_axi_r_payload_data = ctrl_io_bus_rsp_payload_data;
  assign io_axi_r_payload_last = ctrl_io_bus_rsp_payload_context_last;
  assign io_axi_r_payload_resp = 2'b00;
  assign io_axi_w_ready = ((unburstify_result_valid && unburstify_result_payload_fragment_write) && bridge_axiCmd_ready);
  assign bridge_axiCmd_ready = (ctrl_io_bus_cmd_ready && (! (bridge_axiCmd_payload_fragment_write && (! bridge_writeRsp_ready))));
  assign io_sdram_ADDR = ctrl_io_sdram_ADDR;
  assign io_sdram_BA = ctrl_io_sdram_BA;
  assign io_sdram_DQ_write = ctrl_io_sdram_DQ_write;
  assign io_sdram_DQ_writeEnable = ctrl_io_sdram_DQ_writeEnable;
  assign io_sdram_DQM = ctrl_io_sdram_DQM;
  assign io_sdram_CASn = ctrl_io_sdram_CASn;
  assign io_sdram_CKE = ctrl_io_sdram_CKE;
  assign io_sdram_CSn = ctrl_io_sdram_CSn;
  assign io_sdram_RASn = ctrl_io_sdram_RASn;
  assign io_sdram_WEn = ctrl_io_sdram_WEn;
  always @(posedge sdramCtrlClk or posedge resetCtrl_sdramReset) begin
    if(resetCtrl_sdramReset) begin
      unburstify_buffer_valid <= 1'b0;
      bridge_writeRsp_rValid <= 1'b0;
    end else begin
      if(unburstify_result_ready) begin
        if(unburstify_buffer_last) begin
          unburstify_buffer_valid <= 1'b0;
        end
      end
      if(!unburstify_buffer_valid) begin
        if(!when_Axi4Channel_l181) begin
          if(unburstify_result_ready) begin
            unburstify_buffer_valid <= io_axi_arw_valid;
          end
        end
      end
      if(bridge_writeRsp_ready) begin
        bridge_writeRsp_rValid <= bridge_writeRsp_valid;
      end
    end
  end

  always @(posedge sdramCtrlClk) begin
    if(unburstify_result_ready) begin
      unburstify_buffer_beat <= (unburstify_buffer_beat - 8'h01);
      unburstify_buffer_transaction_addr[11 : 0] <= Axi4Incr_result[11 : 0];
    end
    if(!unburstify_buffer_valid) begin
      if(!when_Axi4Channel_l181) begin
        if(unburstify_result_ready) begin
          unburstify_buffer_transaction_addr <= io_axi_arw_payload_addr;
          unburstify_buffer_transaction_id <= io_axi_arw_payload_id;
          unburstify_buffer_transaction_size <= io_axi_arw_payload_size;
          unburstify_buffer_transaction_burst <= io_axi_arw_payload_burst;
          unburstify_buffer_transaction_write <= io_axi_arw_payload_write;
          unburstify_buffer_beat <= io_axi_arw_payload_len;
          unburstify_buffer_len <= io_axi_arw_payload_len;
        end
      end
    end
    if(bridge_writeRsp_ready) begin
      bridge_writeRsp_rData_id <= bridge_writeRsp_payload_id;
      bridge_writeRsp_rData_resp <= bridge_writeRsp_payload_resp;
    end
  end


endmodule

//BufferCC_11 replaced by BufferCC_11

//BufferCC_11 replaced by BufferCC_11

//BufferCC_11 replaced by BufferCC_11

//BufferCC_11 replaced by BufferCC_11

module BufferCC_11 (
  input               io_dataIn,
  output              io_dataOut,
  input               i_clk,
  input               asyncReset
);

  (* async_reg = "true" *) reg                 buffers_0;
  (* async_reg = "true" *) reg                 buffers_1;

  assign io_dataOut = buffers_1;
  always @(posedge i_clk) begin
    buffers_0 <= io_dataIn;
    buffers_1 <= buffers_0;
  end


endmodule

module BufferCC_10 (
  input               io_dataIn,
  output              io_dataOut,
  input               clk,
  input               reset
);

  (* async_reg = "true" *) reg                 buffers_0;
  (* async_reg = "true" *) reg                 buffers_1;

  assign io_dataOut = buffers_1;
  always @(posedge clk) begin
    buffers_0 <= io_dataIn;
    buffers_1 <= buffers_0;
  end


endmodule

//StreamFifoLowLatency_1 replaced by StreamFifoLowLatency_1

module StreamFork_2 (
  input               io_input_valid,
  output reg          io_input_ready,
  input      [19:0]   io_input_payload_addr,
  input      [3:0]    io_input_payload_id,
  input      [7:0]    io_input_payload_len,
  input      [2:0]    io_input_payload_size,
  input      [1:0]    io_input_payload_burst,
  input               io_input_payload_write,
  output              io_outputs_0_valid,
  input               io_outputs_0_ready,
  output     [19:0]   io_outputs_0_payload_addr,
  output     [3:0]    io_outputs_0_payload_id,
  output     [7:0]    io_outputs_0_payload_len,
  output     [2:0]    io_outputs_0_payload_size,
  output     [1:0]    io_outputs_0_payload_burst,
  output              io_outputs_0_payload_write,
  output              io_outputs_1_valid,
  input               io_outputs_1_ready,
  output     [19:0]   io_outputs_1_payload_addr,
  output     [3:0]    io_outputs_1_payload_id,
  output     [7:0]    io_outputs_1_payload_len,
  output     [2:0]    io_outputs_1_payload_size,
  output     [1:0]    io_outputs_1_payload_burst,
  output              io_outputs_1_payload_write,
  input               axiClk,
  input               resetCtrl_axiReset
);

  reg                 _zz_io_outputs_0_valid;
  reg                 _zz_io_outputs_1_valid;
  wire                when_Stream_l817;
  wire                when_Stream_l817_1;
  wire                io_outputs_0_fire;
  wire                io_outputs_1_fire;

  always @(*) begin
    io_input_ready = 1'b1;
    if(when_Stream_l817) begin
      io_input_ready = 1'b0;
    end
    if(when_Stream_l817_1) begin
      io_input_ready = 1'b0;
    end
  end

  assign when_Stream_l817 = ((! io_outputs_0_ready) && _zz_io_outputs_0_valid);
  assign when_Stream_l817_1 = ((! io_outputs_1_ready) && _zz_io_outputs_1_valid);
  assign io_outputs_0_valid = (io_input_valid && _zz_io_outputs_0_valid);
  assign io_outputs_0_payload_addr = io_input_payload_addr;
  assign io_outputs_0_payload_id = io_input_payload_id;
  assign io_outputs_0_payload_len = io_input_payload_len;
  assign io_outputs_0_payload_size = io_input_payload_size;
  assign io_outputs_0_payload_burst = io_input_payload_burst;
  assign io_outputs_0_payload_write = io_input_payload_write;
  assign io_outputs_0_fire = (io_outputs_0_valid && io_outputs_0_ready);
  assign io_outputs_1_valid = (io_input_valid && _zz_io_outputs_1_valid);
  assign io_outputs_1_payload_addr = io_input_payload_addr;
  assign io_outputs_1_payload_id = io_input_payload_id;
  assign io_outputs_1_payload_len = io_input_payload_len;
  assign io_outputs_1_payload_size = io_input_payload_size;
  assign io_outputs_1_payload_burst = io_input_payload_burst;
  assign io_outputs_1_payload_write = io_input_payload_write;
  assign io_outputs_1_fire = (io_outputs_1_valid && io_outputs_1_ready);
  always @(posedge axiClk or posedge resetCtrl_axiReset) begin
    if(resetCtrl_axiReset) begin
      _zz_io_outputs_0_valid <= 1'b1;
      _zz_io_outputs_1_valid <= 1'b1;
    end else begin
      if(io_outputs_0_fire) begin
        _zz_io_outputs_0_valid <= 1'b0;
      end
      if(io_outputs_1_fire) begin
        _zz_io_outputs_1_valid <= 1'b0;
      end
      if(io_input_ready) begin
        _zz_io_outputs_0_valid <= 1'b1;
        _zz_io_outputs_1_valid <= 1'b1;
      end
    end
  end


endmodule

module StreamArbiter_2 (
  input               io_inputs_0_valid,
  output              io_inputs_0_ready,
  input      [19:0]   io_inputs_0_payload_addr,
  input      [3:0]    io_inputs_0_payload_id,
  input      [7:0]    io_inputs_0_payload_len,
  input      [2:0]    io_inputs_0_payload_size,
  input      [1:0]    io_inputs_0_payload_burst,
  input               io_inputs_0_payload_write,
  output              io_output_valid,
  input               io_output_ready,
  output     [19:0]   io_output_payload_addr,
  output     [3:0]    io_output_payload_id,
  output     [7:0]    io_output_payload_len,
  output     [2:0]    io_output_payload_size,
  output     [1:0]    io_output_payload_burst,
  output              io_output_payload_write,
  output     [0:0]    io_chosenOH,
  input               axiClk,
  input               resetCtrl_axiReset
);

  wire       [1:0]    _zz__zz_maskProposal_0_2;
  wire       [1:0]    _zz__zz_maskProposal_0_2_1;
  wire       [0:0]    _zz__zz_maskProposal_0_2_2;
  wire       [0:0]    _zz_maskProposal_0_3;
  reg                 locked;
  wire                maskProposal_0;
  reg                 maskLocked_0;
  wire                maskRouted_0;
  wire       [0:0]    _zz_maskProposal_0;
  wire       [1:0]    _zz_maskProposal_0_1;
  wire       [1:0]    _zz_maskProposal_0_2;
  wire                io_output_fire;

  assign _zz__zz_maskProposal_0_2 = (_zz_maskProposal_0_1 - _zz__zz_maskProposal_0_2_1);
  assign _zz__zz_maskProposal_0_2_2 = maskLocked_0;
  assign _zz__zz_maskProposal_0_2_1 = {1'd0, _zz__zz_maskProposal_0_2_2};
  assign _zz_maskProposal_0_3 = (_zz_maskProposal_0_2[1 : 1] | _zz_maskProposal_0_2[0 : 0]);
  assign maskRouted_0 = (locked ? maskLocked_0 : maskProposal_0);
  assign _zz_maskProposal_0 = io_inputs_0_valid;
  assign _zz_maskProposal_0_1 = {_zz_maskProposal_0,_zz_maskProposal_0};
  assign _zz_maskProposal_0_2 = (_zz_maskProposal_0_1 & (~ _zz__zz_maskProposal_0_2));
  assign maskProposal_0 = _zz_maskProposal_0_3[0];
  assign io_output_fire = (io_output_valid && io_output_ready);
  assign io_output_valid = (io_inputs_0_valid && maskRouted_0);
  assign io_output_payload_addr = io_inputs_0_payload_addr;
  assign io_output_payload_id = io_inputs_0_payload_id;
  assign io_output_payload_len = io_inputs_0_payload_len;
  assign io_output_payload_size = io_inputs_0_payload_size;
  assign io_output_payload_burst = io_inputs_0_payload_burst;
  assign io_output_payload_write = io_inputs_0_payload_write;
  assign io_inputs_0_ready = (maskRouted_0 && io_output_ready);
  assign io_chosenOH = maskRouted_0;
  always @(posedge axiClk or posedge resetCtrl_axiReset) begin
    if(resetCtrl_axiReset) begin
      locked <= 1'b0;
      maskLocked_0 <= 1'b1;
    end else begin
      if(io_output_valid) begin
        maskLocked_0 <= maskRouted_0;
      end
      if(io_output_valid) begin
        locked <= 1'b1;
      end
      if(io_output_fire) begin
        locked <= 1'b0;
      end
    end
  end


endmodule

//StreamFifoLowLatency_1 replaced by StreamFifoLowLatency_1

module StreamFork_1 (
  input               io_input_valid,
  output reg          io_input_ready,
  input      [14:0]   io_input_payload_addr,
  input      [2:0]    io_input_payload_id,
  input      [7:0]    io_input_payload_len,
  input      [2:0]    io_input_payload_size,
  input      [1:0]    io_input_payload_burst,
  input               io_input_payload_write,
  output              io_outputs_0_valid,
  input               io_outputs_0_ready,
  output     [14:0]   io_outputs_0_payload_addr,
  output     [2:0]    io_outputs_0_payload_id,
  output     [7:0]    io_outputs_0_payload_len,
  output     [2:0]    io_outputs_0_payload_size,
  output     [1:0]    io_outputs_0_payload_burst,
  output              io_outputs_0_payload_write,
  output              io_outputs_1_valid,
  input               io_outputs_1_ready,
  output     [14:0]   io_outputs_1_payload_addr,
  output     [2:0]    io_outputs_1_payload_id,
  output     [7:0]    io_outputs_1_payload_len,
  output     [2:0]    io_outputs_1_payload_size,
  output     [1:0]    io_outputs_1_payload_burst,
  output              io_outputs_1_payload_write,
  input               axiClk,
  input               resetCtrl_axiReset
);

  reg                 _zz_io_outputs_0_valid;
  reg                 _zz_io_outputs_1_valid;
  wire                when_Stream_l817;
  wire                when_Stream_l817_1;
  wire                io_outputs_0_fire;
  wire                io_outputs_1_fire;

  always @(*) begin
    io_input_ready = 1'b1;
    if(when_Stream_l817) begin
      io_input_ready = 1'b0;
    end
    if(when_Stream_l817_1) begin
      io_input_ready = 1'b0;
    end
  end

  assign when_Stream_l817 = ((! io_outputs_0_ready) && _zz_io_outputs_0_valid);
  assign when_Stream_l817_1 = ((! io_outputs_1_ready) && _zz_io_outputs_1_valid);
  assign io_outputs_0_valid = (io_input_valid && _zz_io_outputs_0_valid);
  assign io_outputs_0_payload_addr = io_input_payload_addr;
  assign io_outputs_0_payload_id = io_input_payload_id;
  assign io_outputs_0_payload_len = io_input_payload_len;
  assign io_outputs_0_payload_size = io_input_payload_size;
  assign io_outputs_0_payload_burst = io_input_payload_burst;
  assign io_outputs_0_payload_write = io_input_payload_write;
  assign io_outputs_0_fire = (io_outputs_0_valid && io_outputs_0_ready);
  assign io_outputs_1_valid = (io_input_valid && _zz_io_outputs_1_valid);
  assign io_outputs_1_payload_addr = io_input_payload_addr;
  assign io_outputs_1_payload_id = io_input_payload_id;
  assign io_outputs_1_payload_len = io_input_payload_len;
  assign io_outputs_1_payload_size = io_input_payload_size;
  assign io_outputs_1_payload_burst = io_input_payload_burst;
  assign io_outputs_1_payload_write = io_input_payload_write;
  assign io_outputs_1_fire = (io_outputs_1_valid && io_outputs_1_ready);
  always @(posedge axiClk or posedge resetCtrl_axiReset) begin
    if(resetCtrl_axiReset) begin
      _zz_io_outputs_0_valid <= 1'b1;
      _zz_io_outputs_1_valid <= 1'b1;
    end else begin
      if(io_outputs_0_fire) begin
        _zz_io_outputs_0_valid <= 1'b0;
      end
      if(io_outputs_1_fire) begin
        _zz_io_outputs_1_valid <= 1'b0;
      end
      if(io_input_ready) begin
        _zz_io_outputs_0_valid <= 1'b1;
        _zz_io_outputs_1_valid <= 1'b1;
      end
    end
  end


endmodule

module StreamArbiter_1 (
  input               io_inputs_0_valid,
  output              io_inputs_0_ready,
  input      [14:0]   io_inputs_0_payload_addr,
  input      [2:0]    io_inputs_0_payload_id,
  input      [7:0]    io_inputs_0_payload_len,
  input      [2:0]    io_inputs_0_payload_size,
  input      [1:0]    io_inputs_0_payload_burst,
  input               io_inputs_0_payload_write,
  input               io_inputs_1_valid,
  output              io_inputs_1_ready,
  input      [14:0]   io_inputs_1_payload_addr,
  input      [2:0]    io_inputs_1_payload_id,
  input      [7:0]    io_inputs_1_payload_len,
  input      [2:0]    io_inputs_1_payload_size,
  input      [1:0]    io_inputs_1_payload_burst,
  input               io_inputs_1_payload_write,
  output              io_output_valid,
  input               io_output_ready,
  output     [14:0]   io_output_payload_addr,
  output     [2:0]    io_output_payload_id,
  output     [7:0]    io_output_payload_len,
  output     [2:0]    io_output_payload_size,
  output     [1:0]    io_output_payload_burst,
  output              io_output_payload_write,
  output     [0:0]    io_chosen,
  output     [1:0]    io_chosenOH,
  input               axiClk,
  input               resetCtrl_axiReset
);

  wire       [3:0]    _zz__zz_maskProposal_0_2;
  wire       [3:0]    _zz__zz_maskProposal_0_2_1;
  wire       [1:0]    _zz__zz_maskProposal_0_2_2;
  reg                 locked;
  wire                maskProposal_0;
  wire                maskProposal_1;
  reg                 maskLocked_0;
  reg                 maskLocked_1;
  wire                maskRouted_0;
  wire                maskRouted_1;
  wire       [1:0]    _zz_maskProposal_0;
  wire       [3:0]    _zz_maskProposal_0_1;
  wire       [3:0]    _zz_maskProposal_0_2;
  wire       [1:0]    _zz_maskProposal_0_3;
  wire                io_output_fire;
  wire                _zz_io_chosen;

  assign _zz__zz_maskProposal_0_2 = (_zz_maskProposal_0_1 - _zz__zz_maskProposal_0_2_1);
  assign _zz__zz_maskProposal_0_2_2 = {maskLocked_0,maskLocked_1};
  assign _zz__zz_maskProposal_0_2_1 = {2'd0, _zz__zz_maskProposal_0_2_2};
  assign maskRouted_0 = (locked ? maskLocked_0 : maskProposal_0);
  assign maskRouted_1 = (locked ? maskLocked_1 : maskProposal_1);
  assign _zz_maskProposal_0 = {io_inputs_1_valid,io_inputs_0_valid};
  assign _zz_maskProposal_0_1 = {_zz_maskProposal_0,_zz_maskProposal_0};
  assign _zz_maskProposal_0_2 = (_zz_maskProposal_0_1 & (~ _zz__zz_maskProposal_0_2));
  assign _zz_maskProposal_0_3 = (_zz_maskProposal_0_2[3 : 2] | _zz_maskProposal_0_2[1 : 0]);
  assign maskProposal_0 = _zz_maskProposal_0_3[0];
  assign maskProposal_1 = _zz_maskProposal_0_3[1];
  assign io_output_fire = (io_output_valid && io_output_ready);
  assign io_output_valid = ((io_inputs_0_valid && maskRouted_0) || (io_inputs_1_valid && maskRouted_1));
  assign io_output_payload_addr = (maskRouted_0 ? io_inputs_0_payload_addr : io_inputs_1_payload_addr);
  assign io_output_payload_id = (maskRouted_0 ? io_inputs_0_payload_id : io_inputs_1_payload_id);
  assign io_output_payload_len = (maskRouted_0 ? io_inputs_0_payload_len : io_inputs_1_payload_len);
  assign io_output_payload_size = (maskRouted_0 ? io_inputs_0_payload_size : io_inputs_1_payload_size);
  assign io_output_payload_burst = (maskRouted_0 ? io_inputs_0_payload_burst : io_inputs_1_payload_burst);
  assign io_output_payload_write = (maskRouted_0 ? io_inputs_0_payload_write : io_inputs_1_payload_write);
  assign io_inputs_0_ready = (maskRouted_0 && io_output_ready);
  assign io_inputs_1_ready = (maskRouted_1 && io_output_ready);
  assign io_chosenOH = {maskRouted_1,maskRouted_0};
  assign _zz_io_chosen = io_chosenOH[1];
  assign io_chosen = _zz_io_chosen;
  always @(posedge axiClk or posedge resetCtrl_axiReset) begin
    if(resetCtrl_axiReset) begin
      locked <= 1'b0;
      maskLocked_0 <= 1'b0;
      maskLocked_1 <= 1'b1;
    end else begin
      if(io_output_valid) begin
        maskLocked_0 <= maskRouted_0;
        maskLocked_1 <= maskRouted_1;
      end
      if(io_output_valid) begin
        locked <= 1'b1;
      end
      if(io_output_fire) begin
        locked <= 1'b0;
      end
    end
  end


endmodule

module StreamFifoLowLatency_1 (
  input               io_push_valid,
  output              io_push_ready,
  output reg          io_pop_valid,
  input               io_pop_ready,
  input               io_flush,
  output     [2:0]    io_occupancy,
  input               axiClk,
  input               resetCtrl_axiReset
);

  wire       [1:0]    _zz_pushPtr_valueNext;
  wire       [0:0]    _zz_pushPtr_valueNext_1;
  wire       [1:0]    _zz_popPtr_valueNext;
  wire       [0:0]    _zz_popPtr_valueNext_1;
  reg                 pushPtr_willIncrement;
  reg                 pushPtr_willClear;
  reg        [1:0]    pushPtr_valueNext;
  reg        [1:0]    pushPtr_value;
  wire                pushPtr_willOverflowIfInc;
  wire                pushPtr_willOverflow;
  reg                 popPtr_willIncrement;
  reg                 popPtr_willClear;
  reg        [1:0]    popPtr_valueNext;
  reg        [1:0]    popPtr_value;
  wire                popPtr_willOverflowIfInc;
  wire                popPtr_willOverflow;
  wire                ptrMatch;
  reg                 risingOccupancy;
  wire                empty;
  wire                full;
  wire                pushing;
  wire                popping;
  wire                when_Stream_l1011;
  wire                when_Stream_l1024;
  wire       [1:0]    ptrDif;

  assign _zz_pushPtr_valueNext_1 = pushPtr_willIncrement;
  assign _zz_pushPtr_valueNext = {1'd0, _zz_pushPtr_valueNext_1};
  assign _zz_popPtr_valueNext_1 = popPtr_willIncrement;
  assign _zz_popPtr_valueNext = {1'd0, _zz_popPtr_valueNext_1};
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

  assign pushPtr_willOverflowIfInc = (pushPtr_value == 2'b11);
  assign pushPtr_willOverflow = (pushPtr_willOverflowIfInc && pushPtr_willIncrement);
  always @(*) begin
    pushPtr_valueNext = (pushPtr_value + _zz_pushPtr_valueNext);
    if(pushPtr_willClear) begin
      pushPtr_valueNext = 2'b00;
    end
  end

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

  assign popPtr_willOverflowIfInc = (popPtr_value == 2'b11);
  assign popPtr_willOverflow = (popPtr_willOverflowIfInc && popPtr_willIncrement);
  always @(*) begin
    popPtr_valueNext = (popPtr_value + _zz_popPtr_valueNext);
    if(popPtr_willClear) begin
      popPtr_valueNext = 2'b00;
    end
  end

  assign ptrMatch = (pushPtr_value == popPtr_value);
  assign empty = (ptrMatch && (! risingOccupancy));
  assign full = (ptrMatch && risingOccupancy);
  assign pushing = (io_push_valid && io_push_ready);
  assign popping = (io_pop_valid && io_pop_ready);
  assign io_push_ready = (! full);
  assign when_Stream_l1011 = (! empty);
  always @(*) begin
    if(when_Stream_l1011) begin
      io_pop_valid = 1'b1;
    end else begin
      io_pop_valid = io_push_valid;
    end
  end

  assign when_Stream_l1024 = (pushing != popping);
  assign ptrDif = (pushPtr_value - popPtr_value);
  assign io_occupancy = {(risingOccupancy && ptrMatch),ptrDif};
  always @(posedge axiClk or posedge resetCtrl_axiReset) begin
    if(resetCtrl_axiReset) begin
      pushPtr_value <= 2'b00;
      popPtr_value <= 2'b00;
      risingOccupancy <= 1'b0;
    end else begin
      pushPtr_value <= pushPtr_valueNext;
      popPtr_value <= popPtr_valueNext;
      if(when_Stream_l1024) begin
        risingOccupancy <= pushing;
      end
      if(io_flush) begin
        risingOccupancy <= 1'b0;
      end
    end
  end


endmodule

module StreamFork (
  input               io_input_valid,
  output reg          io_input_ready,
  input      [22:0]   io_input_payload_addr,
  input      [1:0]    io_input_payload_id,
  input      [7:0]    io_input_payload_len,
  input      [2:0]    io_input_payload_size,
  input      [1:0]    io_input_payload_burst,
  input               io_input_payload_write,
  output              io_outputs_0_valid,
  input               io_outputs_0_ready,
  output     [22:0]   io_outputs_0_payload_addr,
  output     [1:0]    io_outputs_0_payload_id,
  output     [7:0]    io_outputs_0_payload_len,
  output     [2:0]    io_outputs_0_payload_size,
  output     [1:0]    io_outputs_0_payload_burst,
  output              io_outputs_0_payload_write,
  output              io_outputs_1_valid,
  input               io_outputs_1_ready,
  output     [22:0]   io_outputs_1_payload_addr,
  output     [1:0]    io_outputs_1_payload_id,
  output     [7:0]    io_outputs_1_payload_len,
  output     [2:0]    io_outputs_1_payload_size,
  output     [1:0]    io_outputs_1_payload_burst,
  output              io_outputs_1_payload_write,
  input               axiClk,
  input               resetCtrl_axiReset
);

  reg                 _zz_io_outputs_0_valid;
  reg                 _zz_io_outputs_1_valid;
  wire                when_Stream_l817;
  wire                when_Stream_l817_1;
  wire                io_outputs_0_fire;
  wire                io_outputs_1_fire;

  always @(*) begin
    io_input_ready = 1'b1;
    if(when_Stream_l817) begin
      io_input_ready = 1'b0;
    end
    if(when_Stream_l817_1) begin
      io_input_ready = 1'b0;
    end
  end

  assign when_Stream_l817 = ((! io_outputs_0_ready) && _zz_io_outputs_0_valid);
  assign when_Stream_l817_1 = ((! io_outputs_1_ready) && _zz_io_outputs_1_valid);
  assign io_outputs_0_valid = (io_input_valid && _zz_io_outputs_0_valid);
  assign io_outputs_0_payload_addr = io_input_payload_addr;
  assign io_outputs_0_payload_id = io_input_payload_id;
  assign io_outputs_0_payload_len = io_input_payload_len;
  assign io_outputs_0_payload_size = io_input_payload_size;
  assign io_outputs_0_payload_burst = io_input_payload_burst;
  assign io_outputs_0_payload_write = io_input_payload_write;
  assign io_outputs_0_fire = (io_outputs_0_valid && io_outputs_0_ready);
  assign io_outputs_1_valid = (io_input_valid && _zz_io_outputs_1_valid);
  assign io_outputs_1_payload_addr = io_input_payload_addr;
  assign io_outputs_1_payload_id = io_input_payload_id;
  assign io_outputs_1_payload_len = io_input_payload_len;
  assign io_outputs_1_payload_size = io_input_payload_size;
  assign io_outputs_1_payload_burst = io_input_payload_burst;
  assign io_outputs_1_payload_write = io_input_payload_write;
  assign io_outputs_1_fire = (io_outputs_1_valid && io_outputs_1_ready);
  always @(posedge axiClk or posedge resetCtrl_axiReset) begin
    if(resetCtrl_axiReset) begin
      _zz_io_outputs_0_valid <= 1'b1;
      _zz_io_outputs_1_valid <= 1'b1;
    end else begin
      if(io_outputs_0_fire) begin
        _zz_io_outputs_0_valid <= 1'b0;
      end
      if(io_outputs_1_fire) begin
        _zz_io_outputs_1_valid <= 1'b0;
      end
      if(io_input_ready) begin
        _zz_io_outputs_0_valid <= 1'b1;
        _zz_io_outputs_1_valid <= 1'b1;
      end
    end
  end


endmodule

module StreamArbiter (
  input               io_inputs_0_valid,
  output              io_inputs_0_ready,
  input      [22:0]   io_inputs_0_payload_addr,
  input      [1:0]    io_inputs_0_payload_id,
  input      [7:0]    io_inputs_0_payload_len,
  input      [2:0]    io_inputs_0_payload_size,
  input      [1:0]    io_inputs_0_payload_burst,
  input               io_inputs_0_payload_write,
  input               io_inputs_1_valid,
  output              io_inputs_1_ready,
  input      [22:0]   io_inputs_1_payload_addr,
  input      [1:0]    io_inputs_1_payload_id,
  input      [7:0]    io_inputs_1_payload_len,
  input      [2:0]    io_inputs_1_payload_size,
  input      [1:0]    io_inputs_1_payload_burst,
  input               io_inputs_1_payload_write,
  input               io_inputs_2_valid,
  output              io_inputs_2_ready,
  input      [22:0]   io_inputs_2_payload_addr,
  input      [1:0]    io_inputs_2_payload_id,
  input      [7:0]    io_inputs_2_payload_len,
  input      [2:0]    io_inputs_2_payload_size,
  input      [1:0]    io_inputs_2_payload_burst,
  input               io_inputs_2_payload_write,
  output              io_output_valid,
  input               io_output_ready,
  output     [22:0]   io_output_payload_addr,
  output     [1:0]    io_output_payload_id,
  output     [7:0]    io_output_payload_len,
  output     [2:0]    io_output_payload_size,
  output     [1:0]    io_output_payload_burst,
  output              io_output_payload_write,
  output     [1:0]    io_chosen,
  output     [2:0]    io_chosenOH,
  input               axiClk,
  input               resetCtrl_axiReset
);

  wire       [5:0]    _zz__zz_maskProposal_0_2;
  wire       [5:0]    _zz__zz_maskProposal_0_2_1;
  wire       [2:0]    _zz__zz_maskProposal_0_2_2;
  reg        [22:0]   _zz_io_output_payload_addr_1;
  reg        [1:0]    _zz_io_output_payload_id;
  reg        [7:0]    _zz_io_output_payload_len;
  reg        [2:0]    _zz_io_output_payload_size;
  reg        [1:0]    _zz_io_output_payload_burst;
  reg                 _zz_io_output_payload_write;
  reg                 locked;
  wire                maskProposal_0;
  wire                maskProposal_1;
  wire                maskProposal_2;
  reg                 maskLocked_0;
  reg                 maskLocked_1;
  reg                 maskLocked_2;
  wire                maskRouted_0;
  wire                maskRouted_1;
  wire                maskRouted_2;
  wire       [2:0]    _zz_maskProposal_0;
  wire       [5:0]    _zz_maskProposal_0_1;
  wire       [5:0]    _zz_maskProposal_0_2;
  wire       [2:0]    _zz_maskProposal_0_3;
  wire                io_output_fire;
  wire       [1:0]    _zz_io_output_payload_addr;
  wire                _zz_io_chosen;
  wire                _zz_io_chosen_1;

  assign _zz__zz_maskProposal_0_2 = (_zz_maskProposal_0_1 - _zz__zz_maskProposal_0_2_1);
  assign _zz__zz_maskProposal_0_2_2 = {maskLocked_1,{maskLocked_0,maskLocked_2}};
  assign _zz__zz_maskProposal_0_2_1 = {3'd0, _zz__zz_maskProposal_0_2_2};
  always @(*) begin
    case(_zz_io_output_payload_addr)
      2'b00 : begin
        _zz_io_output_payload_addr_1 = io_inputs_0_payload_addr;
        _zz_io_output_payload_id = io_inputs_0_payload_id;
        _zz_io_output_payload_len = io_inputs_0_payload_len;
        _zz_io_output_payload_size = io_inputs_0_payload_size;
        _zz_io_output_payload_burst = io_inputs_0_payload_burst;
        _zz_io_output_payload_write = io_inputs_0_payload_write;
      end
      2'b01 : begin
        _zz_io_output_payload_addr_1 = io_inputs_1_payload_addr;
        _zz_io_output_payload_id = io_inputs_1_payload_id;
        _zz_io_output_payload_len = io_inputs_1_payload_len;
        _zz_io_output_payload_size = io_inputs_1_payload_size;
        _zz_io_output_payload_burst = io_inputs_1_payload_burst;
        _zz_io_output_payload_write = io_inputs_1_payload_write;
      end
      default : begin
        _zz_io_output_payload_addr_1 = io_inputs_2_payload_addr;
        _zz_io_output_payload_id = io_inputs_2_payload_id;
        _zz_io_output_payload_len = io_inputs_2_payload_len;
        _zz_io_output_payload_size = io_inputs_2_payload_size;
        _zz_io_output_payload_burst = io_inputs_2_payload_burst;
        _zz_io_output_payload_write = io_inputs_2_payload_write;
      end
    endcase
  end

  assign maskRouted_0 = (locked ? maskLocked_0 : maskProposal_0);
  assign maskRouted_1 = (locked ? maskLocked_1 : maskProposal_1);
  assign maskRouted_2 = (locked ? maskLocked_2 : maskProposal_2);
  assign _zz_maskProposal_0 = {io_inputs_2_valid,{io_inputs_1_valid,io_inputs_0_valid}};
  assign _zz_maskProposal_0_1 = {_zz_maskProposal_0,_zz_maskProposal_0};
  assign _zz_maskProposal_0_2 = (_zz_maskProposal_0_1 & (~ _zz__zz_maskProposal_0_2));
  assign _zz_maskProposal_0_3 = (_zz_maskProposal_0_2[5 : 3] | _zz_maskProposal_0_2[2 : 0]);
  assign maskProposal_0 = _zz_maskProposal_0_3[0];
  assign maskProposal_1 = _zz_maskProposal_0_3[1];
  assign maskProposal_2 = _zz_maskProposal_0_3[2];
  assign io_output_fire = (io_output_valid && io_output_ready);
  assign io_output_valid = (((io_inputs_0_valid && maskRouted_0) || (io_inputs_1_valid && maskRouted_1)) || (io_inputs_2_valid && maskRouted_2));
  assign _zz_io_output_payload_addr = {maskRouted_2,maskRouted_1};
  assign io_output_payload_addr = _zz_io_output_payload_addr_1;
  assign io_output_payload_id = _zz_io_output_payload_id;
  assign io_output_payload_len = _zz_io_output_payload_len;
  assign io_output_payload_size = _zz_io_output_payload_size;
  assign io_output_payload_burst = _zz_io_output_payload_burst;
  assign io_output_payload_write = _zz_io_output_payload_write;
  assign io_inputs_0_ready = (maskRouted_0 && io_output_ready);
  assign io_inputs_1_ready = (maskRouted_1 && io_output_ready);
  assign io_inputs_2_ready = (maskRouted_2 && io_output_ready);
  assign io_chosenOH = {maskRouted_2,{maskRouted_1,maskRouted_0}};
  assign _zz_io_chosen = io_chosenOH[1];
  assign _zz_io_chosen_1 = io_chosenOH[2];
  assign io_chosen = {_zz_io_chosen_1,_zz_io_chosen};
  always @(posedge axiClk or posedge resetCtrl_axiReset) begin
    if(resetCtrl_axiReset) begin
      locked <= 1'b0;
      maskLocked_0 <= 1'b0;
      maskLocked_1 <= 1'b0;
      maskLocked_2 <= 1'b1;
    end else begin
      if(io_output_valid) begin
        maskLocked_0 <= maskRouted_0;
        maskLocked_1 <= maskRouted_1;
        maskLocked_2 <= maskRouted_2;
      end
      if(io_output_valid) begin
        locked <= 1'b1;
      end
      if(io_output_fire) begin
        locked <= 1'b0;
      end
    end
  end


endmodule

module Axi4ReadOnlyErrorSlave_1 (
  input               io_axi_ar_valid,
  output              io_axi_ar_ready,
  input      [31:0]   io_axi_ar_payload_addr,
  input      [7:0]    io_axi_ar_payload_len,
  input      [2:0]    io_axi_ar_payload_size,
  input      [3:0]    io_axi_ar_payload_cache,
  input      [2:0]    io_axi_ar_payload_prot,
  output              io_axi_r_valid,
  input               io_axi_r_ready,
  output     [31:0]   io_axi_r_payload_data,
  output              io_axi_r_payload_last,
  input               axiClk,
  input               resetCtrl_axiReset
);

  reg                 sendRsp;
  reg        [7:0]    remaining;
  wire                remainingZero;
  wire                io_axi_ar_fire;

  assign remainingZero = (remaining == 8'h0);
  assign io_axi_ar_ready = (! sendRsp);
  assign io_axi_ar_fire = (io_axi_ar_valid && io_axi_ar_ready);
  assign io_axi_r_valid = sendRsp;
  assign io_axi_r_payload_last = remainingZero;
  always @(posedge axiClk or posedge resetCtrl_axiReset) begin
    if(resetCtrl_axiReset) begin
      sendRsp <= 1'b0;
    end else begin
      if(io_axi_ar_fire) begin
        sendRsp <= 1'b1;
      end
      if(sendRsp) begin
        if(io_axi_r_ready) begin
          if(remainingZero) begin
            sendRsp <= 1'b0;
          end
        end
      end
    end
  end

  always @(posedge axiClk) begin
    if(io_axi_ar_fire) begin
      remaining <= io_axi_ar_payload_len;
    end
    if(sendRsp) begin
      if(io_axi_r_ready) begin
        remaining <= (remaining - 8'h01);
      end
    end
  end


endmodule

module Axi4SharedErrorSlave (
  input               io_axi_arw_valid,
  output              io_axi_arw_ready,
  input      [31:0]   io_axi_arw_payload_addr,
  input      [7:0]    io_axi_arw_payload_len,
  input      [2:0]    io_axi_arw_payload_size,
  input      [3:0]    io_axi_arw_payload_cache,
  input      [2:0]    io_axi_arw_payload_prot,
  input               io_axi_arw_payload_write,
  input               io_axi_w_valid,
  output              io_axi_w_ready,
  input      [31:0]   io_axi_w_payload_data,
  input      [3:0]    io_axi_w_payload_strb,
  input               io_axi_w_payload_last,
  output              io_axi_b_valid,
  input               io_axi_b_ready,
  output     [1:0]    io_axi_b_payload_resp,
  output              io_axi_r_valid,
  input               io_axi_r_ready,
  output     [31:0]   io_axi_r_payload_data,
  output     [1:0]    io_axi_r_payload_resp,
  output              io_axi_r_payload_last,
  input               axiClk,
  input               resetCtrl_axiReset
);

  reg                 consumeData;
  reg                 sendReadRsp;
  reg                 sendWriteRsp;
  reg        [7:0]    remaining;
  wire                remainingZero;
  wire                io_axi_arw_fire;
  wire                io_axi_w_fire;
  wire                when_Axi4ErrorSlave_l92;
  wire                io_axi_b_fire;

  assign remainingZero = (remaining == 8'h0);
  assign io_axi_arw_ready = (! ((consumeData || sendWriteRsp) || sendReadRsp));
  assign io_axi_arw_fire = (io_axi_arw_valid && io_axi_arw_ready);
  assign io_axi_w_ready = consumeData;
  assign io_axi_w_fire = (io_axi_w_valid && io_axi_w_ready);
  assign when_Axi4ErrorSlave_l92 = (io_axi_w_fire && io_axi_w_payload_last);
  assign io_axi_b_valid = sendWriteRsp;
  assign io_axi_b_payload_resp = 2'b11;
  assign io_axi_b_fire = (io_axi_b_valid && io_axi_b_ready);
  assign io_axi_r_valid = sendReadRsp;
  assign io_axi_r_payload_resp = 2'b11;
  assign io_axi_r_payload_last = remainingZero;
  always @(posedge axiClk or posedge resetCtrl_axiReset) begin
    if(resetCtrl_axiReset) begin
      consumeData <= 1'b0;
      sendReadRsp <= 1'b0;
      sendWriteRsp <= 1'b0;
    end else begin
      if(io_axi_arw_fire) begin
        consumeData <= io_axi_arw_payload_write;
        sendReadRsp <= (! io_axi_arw_payload_write);
      end
      if(when_Axi4ErrorSlave_l92) begin
        consumeData <= 1'b0;
        sendWriteRsp <= 1'b1;
      end
      if(io_axi_b_fire) begin
        sendWriteRsp <= 1'b0;
      end
      if(sendReadRsp) begin
        if(io_axi_r_ready) begin
          if(remainingZero) begin
            sendReadRsp <= 1'b0;
          end
        end
      end
    end
  end

  always @(posedge axiClk) begin
    if(io_axi_arw_fire) begin
      remaining <= io_axi_arw_payload_len;
    end
    if(sendReadRsp) begin
      if(io_axi_r_ready) begin
        remaining <= (remaining - 8'h01);
      end
    end
  end


endmodule

module Axi4ReadOnlyErrorSlave (
  input               io_axi_ar_valid,
  output              io_axi_ar_ready,
  input      [31:0]   io_axi_ar_payload_addr,
  input      [7:0]    io_axi_ar_payload_len,
  input      [1:0]    io_axi_ar_payload_burst,
  input      [3:0]    io_axi_ar_payload_cache,
  input      [2:0]    io_axi_ar_payload_prot,
  output              io_axi_r_valid,
  input               io_axi_r_ready,
  output     [31:0]   io_axi_r_payload_data,
  output     [1:0]    io_axi_r_payload_resp,
  output              io_axi_r_payload_last,
  input               axiClk,
  input               resetCtrl_axiReset
);

  reg                 sendRsp;
  reg        [7:0]    remaining;
  wire                remainingZero;
  wire                io_axi_ar_fire;

  assign remainingZero = (remaining == 8'h0);
  assign io_axi_ar_ready = (! sendRsp);
  assign io_axi_ar_fire = (io_axi_ar_valid && io_axi_ar_ready);
  assign io_axi_r_valid = sendRsp;
  assign io_axi_r_payload_resp = 2'b11;
  assign io_axi_r_payload_last = remainingZero;
  always @(posedge axiClk or posedge resetCtrl_axiReset) begin
    if(resetCtrl_axiReset) begin
      sendRsp <= 1'b0;
    end else begin
      if(io_axi_ar_fire) begin
        sendRsp <= 1'b1;
      end
      if(sendRsp) begin
        if(io_axi_r_ready) begin
          if(remainingZero) begin
            sendRsp <= 1'b0;
          end
        end
      end
    end
  end

  always @(posedge axiClk) begin
    if(io_axi_ar_fire) begin
      remaining <= io_axi_ar_payload_len;
    end
    if(sendRsp) begin
      if(io_axi_r_ready) begin
        remaining <= (remaining - 8'h01);
      end
    end
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
  input               axiClk,
  input               resetCtrl_systemReset
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

  BufferCC_7 inputArea_target_buffercc (
    .io_dataIn                (inputArea_target                      ), //i
    .io_dataOut               (inputArea_target_buffercc_io_dataOut  ), //o
    .axiClk                   (axiClk                                ), //i
    .resetCtrl_systemReset    (resetCtrl_systemReset                 )  //i
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

  always @(posedge axiClk) begin
    outputArea_hit <= outputArea_target;
    if(outputArea_flow_valid) begin
      outputArea_flow_m2sPipe_payload_last <= outputArea_flow_payload_last;
      outputArea_flow_m2sPipe_payload_fragment <= outputArea_flow_payload_fragment;
    end
  end

  always @(posedge axiClk or posedge resetCtrl_systemReset) begin
    if(resetCtrl_systemReset) begin
      outputArea_flow_m2sPipe_valid <= 1'b0;
    end else begin
      outputArea_flow_m2sPipe_valid <= outputArea_flow_valid;
    end
  end


endmodule

module DataCache (
  input               io_cpu_execute_isValid,
  input      [31:0]   io_cpu_execute_address,
  output reg          io_cpu_execute_haltIt,
  input               io_cpu_execute_args_wr,
  input      [1:0]    io_cpu_execute_args_size,
  input               io_cpu_execute_args_totalyConsistent,
  output              io_cpu_execute_refilling,
  input               io_cpu_memory_isValid,
  input               io_cpu_memory_isStuck,
  output              io_cpu_memory_isWrite,
  input      [31:0]   io_cpu_memory_address,
  input      [31:0]   io_cpu_memory_mmuRsp_physicalAddress,
  input               io_cpu_memory_mmuRsp_isIoAccess,
  input               io_cpu_memory_mmuRsp_isPaging,
  input               io_cpu_memory_mmuRsp_allowRead,
  input               io_cpu_memory_mmuRsp_allowWrite,
  input               io_cpu_memory_mmuRsp_allowExecute,
  input               io_cpu_memory_mmuRsp_exception,
  input               io_cpu_memory_mmuRsp_refilling,
  input               io_cpu_memory_mmuRsp_bypassTranslation,
  input               io_cpu_writeBack_isValid,
  input               io_cpu_writeBack_isStuck,
  input               io_cpu_writeBack_isUser,
  output reg          io_cpu_writeBack_haltIt,
  output              io_cpu_writeBack_isWrite,
  input      [31:0]   io_cpu_writeBack_storeData,
  output reg [31:0]   io_cpu_writeBack_data,
  input      [31:0]   io_cpu_writeBack_address,
  output              io_cpu_writeBack_mmuException,
  output              io_cpu_writeBack_unalignedAccess,
  output reg          io_cpu_writeBack_accessError,
  output              io_cpu_writeBack_keepMemRspData,
  input               io_cpu_writeBack_fence_SW,
  input               io_cpu_writeBack_fence_SR,
  input               io_cpu_writeBack_fence_SO,
  input               io_cpu_writeBack_fence_SI,
  input               io_cpu_writeBack_fence_PW,
  input               io_cpu_writeBack_fence_PR,
  input               io_cpu_writeBack_fence_PO,
  input               io_cpu_writeBack_fence_PI,
  input      [3:0]    io_cpu_writeBack_fence_FM,
  output              io_cpu_writeBack_exclusiveOk,
  output reg          io_cpu_redo,
  input               io_cpu_flush_valid,
  output              io_cpu_flush_ready,
  output reg          io_mem_cmd_valid,
  input               io_mem_cmd_ready,
  output reg          io_mem_cmd_payload_wr,
  output              io_mem_cmd_payload_uncached,
  output reg [31:0]   io_mem_cmd_payload_address,
  output     [31:0]   io_mem_cmd_payload_data,
  output     [3:0]    io_mem_cmd_payload_mask,
  output reg [2:0]    io_mem_cmd_payload_size,
  output              io_mem_cmd_payload_last,
  input               io_mem_rsp_valid,
  input               io_mem_rsp_payload_last,
  input      [31:0]   io_mem_rsp_payload_data,
  input               io_mem_rsp_payload_error,
  input               axiClk,
  input               resetCtrl_axiReset
);

  reg        [21:0]   _zz_ways_0_tags_port0;
  reg        [31:0]   _zz_ways_0_data_port0;
  wire       [21:0]   _zz_ways_0_tags_port;
  wire       [9:0]    _zz_stage0_dataColisions;
  wire       [9:0]    _zz__zz_stageA_dataColisions;
  wire       [0:0]    _zz_when;
  wire       [2:0]    _zz_loader_counter_valueNext;
  wire       [0:0]    _zz_loader_counter_valueNext_1;
  wire       [1:0]    _zz_loader_waysAllocator;
  reg                 _zz_1;
  reg                 _zz_2;
  wire                haltCpu;
  reg                 tagsReadCmd_valid;
  reg        [6:0]    tagsReadCmd_payload;
  reg                 tagsWriteCmd_valid;
  reg        [0:0]    tagsWriteCmd_payload_way;
  reg        [6:0]    tagsWriteCmd_payload_address;
  reg                 tagsWriteCmd_payload_data_valid;
  reg                 tagsWriteCmd_payload_data_error;
  reg        [19:0]   tagsWriteCmd_payload_data_address;
  reg                 tagsWriteLastCmd_valid;
  reg        [0:0]    tagsWriteLastCmd_payload_way;
  reg        [6:0]    tagsWriteLastCmd_payload_address;
  reg                 tagsWriteLastCmd_payload_data_valid;
  reg                 tagsWriteLastCmd_payload_data_error;
  reg        [19:0]   tagsWriteLastCmd_payload_data_address;
  reg                 dataReadCmd_valid;
  reg        [9:0]    dataReadCmd_payload;
  reg                 dataWriteCmd_valid;
  reg        [0:0]    dataWriteCmd_payload_way;
  reg        [9:0]    dataWriteCmd_payload_address;
  reg        [31:0]   dataWriteCmd_payload_data;
  reg        [3:0]    dataWriteCmd_payload_mask;
  wire                _zz_ways_0_tagsReadRsp_valid;
  wire                ways_0_tagsReadRsp_valid;
  wire                ways_0_tagsReadRsp_error;
  wire       [19:0]   ways_0_tagsReadRsp_address;
  wire       [21:0]   _zz_ways_0_tagsReadRsp_valid_1;
  wire                _zz_ways_0_dataReadRspMem;
  wire       [31:0]   ways_0_dataReadRspMem;
  wire       [31:0]   ways_0_dataReadRsp;
  wire                when_DataCache_l635;
  wire                when_DataCache_l638;
  wire                when_DataCache_l657;
  wire                rspSync;
  wire                rspLast;
  reg                 memCmdSent;
  wire                io_mem_cmd_fire;
  wire                when_DataCache_l679;
  reg        [3:0]    _zz_stage0_mask;
  wire       [3:0]    stage0_mask;
  wire       [0:0]    stage0_dataColisions;
  wire       [0:0]    stage0_wayInvalidate;
  wire                stage0_isAmo;
  wire                when_DataCache_l764;
  reg                 stageA_request_wr;
  reg        [1:0]    stageA_request_size;
  reg                 stageA_request_totalyConsistent;
  wire                when_DataCache_l764_1;
  reg        [3:0]    stageA_mask;
  wire                stageA_isAmo;
  wire                stageA_isLrsc;
  wire       [0:0]    stageA_wayHits;
  wire                when_DataCache_l764_2;
  reg        [0:0]    stageA_wayInvalidate;
  wire                when_DataCache_l764_3;
  reg        [0:0]    stage0_dataColisions_regNextWhen;
  wire       [0:0]    _zz_stageA_dataColisions;
  wire       [0:0]    stageA_dataColisions;
  wire                when_DataCache_l815;
  reg                 stageB_request_wr;
  reg        [1:0]    stageB_request_size;
  reg                 stageB_request_totalyConsistent;
  reg                 stageB_mmuRspFreeze;
  wire                when_DataCache_l817;
  reg        [31:0]   stageB_mmuRsp_physicalAddress;
  reg                 stageB_mmuRsp_isIoAccess;
  reg                 stageB_mmuRsp_isPaging;
  reg                 stageB_mmuRsp_allowRead;
  reg                 stageB_mmuRsp_allowWrite;
  reg                 stageB_mmuRsp_allowExecute;
  reg                 stageB_mmuRsp_exception;
  reg                 stageB_mmuRsp_refilling;
  reg                 stageB_mmuRsp_bypassTranslation;
  wire                when_DataCache_l814;
  reg                 stageB_tagsReadRsp_0_valid;
  reg                 stageB_tagsReadRsp_0_error;
  reg        [19:0]   stageB_tagsReadRsp_0_address;
  wire                when_DataCache_l814_1;
  reg        [31:0]   stageB_dataReadRsp_0;
  wire                when_DataCache_l813;
  reg        [0:0]    stageB_wayInvalidate;
  wire                stageB_consistancyHazard;
  wire                when_DataCache_l813_1;
  reg        [0:0]    stageB_dataColisions;
  wire                when_DataCache_l813_2;
  reg                 stageB_unaligned;
  wire                when_DataCache_l813_3;
  reg        [0:0]    stageB_waysHitsBeforeInvalidate;
  wire       [0:0]    stageB_waysHits;
  wire                stageB_waysHit;
  wire       [31:0]   stageB_dataMux;
  wire                when_DataCache_l813_4;
  reg        [3:0]    stageB_mask;
  reg                 stageB_loaderValid;
  wire       [31:0]   stageB_ioMemRspMuxed;
  reg                 stageB_flusher_waitDone;
  wire                stageB_flusher_hold;
  reg        [7:0]    stageB_flusher_counter;
  wire                when_DataCache_l843;
  wire                when_DataCache_l849;
  reg                 stageB_flusher_start;
  wire                stageB_isAmo;
  wire                stageB_isAmoCached;
  wire                stageB_isExternalLsrc;
  wire                stageB_isExternalAmo;
  wire       [31:0]   stageB_requestDataBypass;
  reg                 stageB_cpuWriteToCache;
  wire                when_DataCache_l912;
  wire                stageB_badPermissions;
  wire                stageB_loadStoreFault;
  wire                stageB_bypassCache;
  wire                when_DataCache_l981;
  wire                when_DataCache_l990;
  wire                when_DataCache_l995;
  wire                when_DataCache_l1006;
  wire                when_DataCache_l1018;
  wire                when_DataCache_l977;
  wire                when_DataCache_l1052;
  wire                when_DataCache_l1061;
  reg                 loader_valid;
  reg                 loader_counter_willIncrement;
  wire                loader_counter_willClear;
  reg        [2:0]    loader_counter_valueNext;
  reg        [2:0]    loader_counter_value;
  wire                loader_counter_willOverflowIfInc;
  wire                loader_counter_willOverflow;
  reg        [0:0]    loader_waysAllocator;
  reg                 loader_error;
  wire                loader_kill;
  reg                 loader_killReg;
  wire                when_DataCache_l1076;
  wire                loader_done;
  wire                when_DataCache_l1104;
  reg                 loader_valid_regNext;
  wire                when_DataCache_l1108;
  wire                when_DataCache_l1111;
  reg [21:0] ways_0_tags [0:127];
  reg [7:0] ways_0_data_symbol0 [0:1023];
  reg [7:0] ways_0_data_symbol1 [0:1023];
  reg [7:0] ways_0_data_symbol2 [0:1023];
  reg [7:0] ways_0_data_symbol3 [0:1023];
  reg [7:0] _zz_ways_0_datasymbol_read;
  reg [7:0] _zz_ways_0_datasymbol_read_1;
  reg [7:0] _zz_ways_0_datasymbol_read_2;
  reg [7:0] _zz_ways_0_datasymbol_read_3;

  assign _zz_stage0_dataColisions = (io_cpu_execute_address[11 : 2] >>> 0);
  assign _zz__zz_stageA_dataColisions = (io_cpu_memory_address[11 : 2] >>> 0);
  assign _zz_when = 1'b1;
  assign _zz_loader_counter_valueNext_1 = loader_counter_willIncrement;
  assign _zz_loader_counter_valueNext = {2'd0, _zz_loader_counter_valueNext_1};
  assign _zz_loader_waysAllocator = {loader_waysAllocator,loader_waysAllocator[0]};
  assign _zz_ways_0_tags_port = {tagsWriteCmd_payload_data_address,{tagsWriteCmd_payload_data_error,tagsWriteCmd_payload_data_valid}};
  always @(posedge axiClk) begin
    if(_zz_ways_0_tagsReadRsp_valid) begin
      _zz_ways_0_tags_port0 <= ways_0_tags[tagsReadCmd_payload];
    end
  end

  always @(posedge axiClk) begin
    if(_zz_2) begin
      ways_0_tags[tagsWriteCmd_payload_address] <= _zz_ways_0_tags_port;
    end
  end

  always @(*) begin
    _zz_ways_0_data_port0 = {_zz_ways_0_datasymbol_read_3, _zz_ways_0_datasymbol_read_2, _zz_ways_0_datasymbol_read_1, _zz_ways_0_datasymbol_read};
  end
  always @(posedge axiClk) begin
    if(_zz_ways_0_dataReadRspMem) begin
      _zz_ways_0_datasymbol_read <= ways_0_data_symbol0[dataReadCmd_payload];
      _zz_ways_0_datasymbol_read_1 <= ways_0_data_symbol1[dataReadCmd_payload];
      _zz_ways_0_datasymbol_read_2 <= ways_0_data_symbol2[dataReadCmd_payload];
      _zz_ways_0_datasymbol_read_3 <= ways_0_data_symbol3[dataReadCmd_payload];
    end
  end

  always @(posedge axiClk) begin
    if(dataWriteCmd_payload_mask[0] && _zz_1) begin
      ways_0_data_symbol0[dataWriteCmd_payload_address] <= dataWriteCmd_payload_data[7 : 0];
    end
    if(dataWriteCmd_payload_mask[1] && _zz_1) begin
      ways_0_data_symbol1[dataWriteCmd_payload_address] <= dataWriteCmd_payload_data[15 : 8];
    end
    if(dataWriteCmd_payload_mask[2] && _zz_1) begin
      ways_0_data_symbol2[dataWriteCmd_payload_address] <= dataWriteCmd_payload_data[23 : 16];
    end
    if(dataWriteCmd_payload_mask[3] && _zz_1) begin
      ways_0_data_symbol3[dataWriteCmd_payload_address] <= dataWriteCmd_payload_data[31 : 24];
    end
  end

  always @(*) begin
    _zz_1 = 1'b0;
    if(when_DataCache_l638) begin
      _zz_1 = 1'b1;
    end
  end

  always @(*) begin
    _zz_2 = 1'b0;
    if(when_DataCache_l635) begin
      _zz_2 = 1'b1;
    end
  end

  assign haltCpu = 1'b0;
  assign _zz_ways_0_tagsReadRsp_valid = (tagsReadCmd_valid && (! io_cpu_memory_isStuck));
  assign _zz_ways_0_tagsReadRsp_valid_1 = _zz_ways_0_tags_port0;
  assign ways_0_tagsReadRsp_valid = _zz_ways_0_tagsReadRsp_valid_1[0];
  assign ways_0_tagsReadRsp_error = _zz_ways_0_tagsReadRsp_valid_1[1];
  assign ways_0_tagsReadRsp_address = _zz_ways_0_tagsReadRsp_valid_1[21 : 2];
  assign _zz_ways_0_dataReadRspMem = (dataReadCmd_valid && (! io_cpu_memory_isStuck));
  assign ways_0_dataReadRspMem = _zz_ways_0_data_port0;
  assign ways_0_dataReadRsp = ways_0_dataReadRspMem[31 : 0];
  assign when_DataCache_l635 = (tagsWriteCmd_valid && tagsWriteCmd_payload_way[0]);
  assign when_DataCache_l638 = (dataWriteCmd_valid && dataWriteCmd_payload_way[0]);
  always @(*) begin
    tagsReadCmd_valid = 1'b0;
    if(when_DataCache_l657) begin
      tagsReadCmd_valid = 1'b1;
    end
  end

  always @(*) begin
    tagsReadCmd_payload = 7'bxxxxxxx;
    if(when_DataCache_l657) begin
      tagsReadCmd_payload = io_cpu_execute_address[11 : 5];
    end
  end

  always @(*) begin
    dataReadCmd_valid = 1'b0;
    if(when_DataCache_l657) begin
      dataReadCmd_valid = 1'b1;
    end
  end

  always @(*) begin
    dataReadCmd_payload = 10'bxxxxxxxxxx;
    if(when_DataCache_l657) begin
      dataReadCmd_payload = io_cpu_execute_address[11 : 2];
    end
  end

  always @(*) begin
    tagsWriteCmd_valid = 1'b0;
    if(when_DataCache_l843) begin
      tagsWriteCmd_valid = 1'b1;
    end
    if(when_DataCache_l1052) begin
      tagsWriteCmd_valid = 1'b0;
    end
    if(loader_done) begin
      tagsWriteCmd_valid = 1'b1;
    end
  end

  always @(*) begin
    tagsWriteCmd_payload_way = 1'bx;
    if(when_DataCache_l843) begin
      tagsWriteCmd_payload_way = 1'b1;
    end
    if(loader_done) begin
      tagsWriteCmd_payload_way = loader_waysAllocator;
    end
  end

  always @(*) begin
    tagsWriteCmd_payload_address = 7'bxxxxxxx;
    if(when_DataCache_l843) begin
      tagsWriteCmd_payload_address = stageB_flusher_counter[6:0];
    end
    if(loader_done) begin
      tagsWriteCmd_payload_address = stageB_mmuRsp_physicalAddress[11 : 5];
    end
  end

  always @(*) begin
    tagsWriteCmd_payload_data_valid = 1'bx;
    if(when_DataCache_l843) begin
      tagsWriteCmd_payload_data_valid = 1'b0;
    end
    if(loader_done) begin
      tagsWriteCmd_payload_data_valid = (! (loader_kill || loader_killReg));
    end
  end

  always @(*) begin
    tagsWriteCmd_payload_data_error = 1'bx;
    if(loader_done) begin
      tagsWriteCmd_payload_data_error = (loader_error || (io_mem_rsp_valid && io_mem_rsp_payload_error));
    end
  end

  always @(*) begin
    tagsWriteCmd_payload_data_address = 20'bxxxxxxxxxxxxxxxxxxxx;
    if(loader_done) begin
      tagsWriteCmd_payload_data_address = stageB_mmuRsp_physicalAddress[31 : 12];
    end
  end

  always @(*) begin
    dataWriteCmd_valid = 1'b0;
    if(stageB_cpuWriteToCache) begin
      if(when_DataCache_l912) begin
        dataWriteCmd_valid = 1'b1;
      end
    end
    if(when_DataCache_l1052) begin
      dataWriteCmd_valid = 1'b0;
    end
    if(when_DataCache_l1076) begin
      dataWriteCmd_valid = 1'b1;
    end
  end

  always @(*) begin
    dataWriteCmd_payload_way = 1'bx;
    if(stageB_cpuWriteToCache) begin
      dataWriteCmd_payload_way = stageB_waysHits;
    end
    if(when_DataCache_l1076) begin
      dataWriteCmd_payload_way = loader_waysAllocator;
    end
  end

  always @(*) begin
    dataWriteCmd_payload_address = 10'bxxxxxxxxxx;
    if(stageB_cpuWriteToCache) begin
      dataWriteCmd_payload_address = stageB_mmuRsp_physicalAddress[11 : 2];
    end
    if(when_DataCache_l1076) begin
      dataWriteCmd_payload_address = {stageB_mmuRsp_physicalAddress[11 : 5],loader_counter_value};
    end
  end

  always @(*) begin
    dataWriteCmd_payload_data = 32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
    if(stageB_cpuWriteToCache) begin
      dataWriteCmd_payload_data[31 : 0] = stageB_requestDataBypass;
    end
    if(when_DataCache_l1076) begin
      dataWriteCmd_payload_data = io_mem_rsp_payload_data;
    end
  end

  always @(*) begin
    dataWriteCmd_payload_mask = 4'bxxxx;
    if(stageB_cpuWriteToCache) begin
      dataWriteCmd_payload_mask = 4'b0000;
      if(_zz_when[0]) begin
        dataWriteCmd_payload_mask[3 : 0] = stageB_mask;
      end
    end
    if(when_DataCache_l1076) begin
      dataWriteCmd_payload_mask = 4'b1111;
    end
  end

  assign when_DataCache_l657 = (io_cpu_execute_isValid && (! io_cpu_memory_isStuck));
  always @(*) begin
    io_cpu_execute_haltIt = 1'b0;
    if(when_DataCache_l843) begin
      io_cpu_execute_haltIt = 1'b1;
    end
  end

  assign rspSync = 1'b1;
  assign rspLast = 1'b1;
  assign io_mem_cmd_fire = (io_mem_cmd_valid && io_mem_cmd_ready);
  assign when_DataCache_l679 = (! io_cpu_writeBack_isStuck);
  always @(*) begin
    _zz_stage0_mask = 4'bxxxx;
    case(io_cpu_execute_args_size)
      2'b00 : begin
        _zz_stage0_mask = 4'b0001;
      end
      2'b01 : begin
        _zz_stage0_mask = 4'b0011;
      end
      2'b10 : begin
        _zz_stage0_mask = 4'b1111;
      end
      default : begin
      end
    endcase
  end

  assign stage0_mask = (_zz_stage0_mask <<< io_cpu_execute_address[1 : 0]);
  assign stage0_dataColisions[0] = (((dataWriteCmd_valid && dataWriteCmd_payload_way[0]) && (dataWriteCmd_payload_address == _zz_stage0_dataColisions)) && ((stage0_mask & dataWriteCmd_payload_mask[3 : 0]) != 4'b0000));
  assign stage0_wayInvalidate = 1'b0;
  assign stage0_isAmo = 1'b0;
  assign when_DataCache_l764 = (! io_cpu_memory_isStuck);
  assign when_DataCache_l764_1 = (! io_cpu_memory_isStuck);
  assign io_cpu_memory_isWrite = stageA_request_wr;
  assign stageA_isAmo = 1'b0;
  assign stageA_isLrsc = 1'b0;
  assign stageA_wayHits = ((io_cpu_memory_mmuRsp_physicalAddress[31 : 12] == ways_0_tagsReadRsp_address) && ways_0_tagsReadRsp_valid);
  assign when_DataCache_l764_2 = (! io_cpu_memory_isStuck);
  assign when_DataCache_l764_3 = (! io_cpu_memory_isStuck);
  assign _zz_stageA_dataColisions[0] = (((dataWriteCmd_valid && dataWriteCmd_payload_way[0]) && (dataWriteCmd_payload_address == _zz__zz_stageA_dataColisions)) && ((stageA_mask & dataWriteCmd_payload_mask[3 : 0]) != 4'b0000));
  assign stageA_dataColisions = (stage0_dataColisions_regNextWhen | _zz_stageA_dataColisions);
  assign when_DataCache_l815 = (! io_cpu_writeBack_isStuck);
  always @(*) begin
    stageB_mmuRspFreeze = 1'b0;
    if(when_DataCache_l1111) begin
      stageB_mmuRspFreeze = 1'b1;
    end
  end

  assign when_DataCache_l817 = ((! io_cpu_writeBack_isStuck) && (! stageB_mmuRspFreeze));
  assign when_DataCache_l814 = (! io_cpu_writeBack_isStuck);
  assign when_DataCache_l814_1 = (! io_cpu_writeBack_isStuck);
  assign when_DataCache_l813 = (! io_cpu_writeBack_isStuck);
  assign stageB_consistancyHazard = 1'b0;
  assign when_DataCache_l813_1 = (! io_cpu_writeBack_isStuck);
  assign when_DataCache_l813_2 = (! io_cpu_writeBack_isStuck);
  assign when_DataCache_l813_3 = (! io_cpu_writeBack_isStuck);
  assign stageB_waysHits = (stageB_waysHitsBeforeInvalidate & (~ stageB_wayInvalidate));
  assign stageB_waysHit = (|stageB_waysHits);
  assign stageB_dataMux = stageB_dataReadRsp_0;
  assign when_DataCache_l813_4 = (! io_cpu_writeBack_isStuck);
  always @(*) begin
    stageB_loaderValid = 1'b0;
    if(io_cpu_writeBack_isValid) begin
      if(!stageB_isExternalAmo) begin
        if(!when_DataCache_l977) begin
          if(!when_DataCache_l990) begin
            if(io_mem_cmd_ready) begin
              stageB_loaderValid = 1'b1;
            end
          end
        end
      end
    end
    if(when_DataCache_l1052) begin
      stageB_loaderValid = 1'b0;
    end
  end

  assign stageB_ioMemRspMuxed = io_mem_rsp_payload_data[31 : 0];
  always @(*) begin
    io_cpu_writeBack_haltIt = 1'b1;
    if(io_cpu_writeBack_isValid) begin
      if(!stageB_isExternalAmo) begin
        if(when_DataCache_l977) begin
          if(when_DataCache_l981) begin
            io_cpu_writeBack_haltIt = 1'b0;
          end
        end else begin
          if(when_DataCache_l990) begin
            if(when_DataCache_l995) begin
              io_cpu_writeBack_haltIt = 1'b0;
            end
          end
        end
      end
    end
    if(when_DataCache_l1052) begin
      io_cpu_writeBack_haltIt = 1'b0;
    end
  end

  assign stageB_flusher_hold = 1'b0;
  assign when_DataCache_l843 = (! stageB_flusher_counter[7]);
  assign when_DataCache_l849 = (! stageB_flusher_hold);
  assign io_cpu_flush_ready = (stageB_flusher_waitDone && stageB_flusher_counter[7]);
  assign stageB_isAmo = 1'b0;
  assign stageB_isAmoCached = 1'b0;
  assign stageB_isExternalLsrc = 1'b0;
  assign stageB_isExternalAmo = 1'b0;
  assign stageB_requestDataBypass = io_cpu_writeBack_storeData;
  always @(*) begin
    stageB_cpuWriteToCache = 1'b0;
    if(io_cpu_writeBack_isValid) begin
      if(!stageB_isExternalAmo) begin
        if(!when_DataCache_l977) begin
          if(when_DataCache_l990) begin
            stageB_cpuWriteToCache = 1'b1;
          end
        end
      end
    end
  end

  assign when_DataCache_l912 = (stageB_request_wr && stageB_waysHit);
  assign stageB_badPermissions = (((! stageB_mmuRsp_allowWrite) && stageB_request_wr) || ((! stageB_mmuRsp_allowRead) && ((! stageB_request_wr) || stageB_isAmo)));
  assign stageB_loadStoreFault = (io_cpu_writeBack_isValid && (stageB_mmuRsp_exception || stageB_badPermissions));
  always @(*) begin
    io_cpu_redo = 1'b0;
    if(io_cpu_writeBack_isValid) begin
      if(!stageB_isExternalAmo) begin
        if(!when_DataCache_l977) begin
          if(when_DataCache_l990) begin
            if(when_DataCache_l1006) begin
              io_cpu_redo = 1'b1;
            end
          end
        end
      end
    end
    if(when_DataCache_l1061) begin
      io_cpu_redo = 1'b1;
    end
    if(when_DataCache_l1108) begin
      io_cpu_redo = 1'b1;
    end
  end

  always @(*) begin
    io_cpu_writeBack_accessError = 1'b0;
    if(stageB_bypassCache) begin
      io_cpu_writeBack_accessError = ((((! stageB_request_wr) && 1'b1) && io_mem_rsp_valid) && io_mem_rsp_payload_error);
    end else begin
      io_cpu_writeBack_accessError = (((stageB_waysHits & stageB_tagsReadRsp_0_error) != 1'b0) || (stageB_loadStoreFault && (! stageB_mmuRsp_isPaging)));
    end
  end

  assign io_cpu_writeBack_mmuException = (stageB_loadStoreFault && stageB_mmuRsp_isPaging);
  assign io_cpu_writeBack_unalignedAccess = (io_cpu_writeBack_isValid && stageB_unaligned);
  assign io_cpu_writeBack_isWrite = stageB_request_wr;
  always @(*) begin
    io_mem_cmd_valid = 1'b0;
    if(io_cpu_writeBack_isValid) begin
      if(!stageB_isExternalAmo) begin
        if(when_DataCache_l977) begin
          io_mem_cmd_valid = (! memCmdSent);
        end else begin
          if(when_DataCache_l990) begin
            if(stageB_request_wr) begin
              io_mem_cmd_valid = 1'b1;
            end
          end else begin
            if(when_DataCache_l1018) begin
              io_mem_cmd_valid = 1'b1;
            end
          end
        end
      end
    end
    if(when_DataCache_l1052) begin
      io_mem_cmd_valid = 1'b0;
    end
  end

  always @(*) begin
    io_mem_cmd_payload_address = stageB_mmuRsp_physicalAddress;
    if(io_cpu_writeBack_isValid) begin
      if(!stageB_isExternalAmo) begin
        if(!when_DataCache_l977) begin
          if(!when_DataCache_l990) begin
            io_mem_cmd_payload_address[4 : 0] = 5'h0;
          end
        end
      end
    end
  end

  assign io_mem_cmd_payload_last = 1'b1;
  always @(*) begin
    io_mem_cmd_payload_wr = stageB_request_wr;
    if(io_cpu_writeBack_isValid) begin
      if(!stageB_isExternalAmo) begin
        if(!when_DataCache_l977) begin
          if(!when_DataCache_l990) begin
            io_mem_cmd_payload_wr = 1'b0;
          end
        end
      end
    end
  end

  assign io_mem_cmd_payload_mask = stageB_mask;
  assign io_mem_cmd_payload_data = stageB_requestDataBypass;
  assign io_mem_cmd_payload_uncached = stageB_mmuRsp_isIoAccess;
  always @(*) begin
    io_mem_cmd_payload_size = {1'd0, stageB_request_size};
    if(io_cpu_writeBack_isValid) begin
      if(!stageB_isExternalAmo) begin
        if(!when_DataCache_l977) begin
          if(!when_DataCache_l990) begin
            io_mem_cmd_payload_size = 3'b101;
          end
        end
      end
    end
  end

  assign stageB_bypassCache = ((stageB_mmuRsp_isIoAccess || stageB_isExternalLsrc) || stageB_isExternalAmo);
  assign io_cpu_writeBack_keepMemRspData = 1'b0;
  assign when_DataCache_l981 = ((! stageB_request_wr) ? (io_mem_rsp_valid && rspSync) : io_mem_cmd_ready);
  assign when_DataCache_l990 = (stageB_waysHit || (stageB_request_wr && (! stageB_isAmoCached)));
  assign when_DataCache_l995 = ((! stageB_request_wr) || io_mem_cmd_ready);
  assign when_DataCache_l1006 = (((! stageB_request_wr) || stageB_isAmoCached) && ((stageB_dataColisions & stageB_waysHits) != 1'b0));
  assign when_DataCache_l1018 = (! memCmdSent);
  assign when_DataCache_l977 = (stageB_mmuRsp_isIoAccess || stageB_isExternalLsrc);
  always @(*) begin
    if(stageB_bypassCache) begin
      io_cpu_writeBack_data = stageB_ioMemRspMuxed;
    end else begin
      io_cpu_writeBack_data = stageB_dataMux;
    end
  end

  assign when_DataCache_l1052 = ((((stageB_consistancyHazard || stageB_mmuRsp_refilling) || io_cpu_writeBack_accessError) || io_cpu_writeBack_mmuException) || io_cpu_writeBack_unalignedAccess);
  assign when_DataCache_l1061 = (io_cpu_writeBack_isValid && (stageB_mmuRsp_refilling || stageB_consistancyHazard));
  always @(*) begin
    loader_counter_willIncrement = 1'b0;
    if(when_DataCache_l1076) begin
      loader_counter_willIncrement = 1'b1;
    end
  end

  assign loader_counter_willClear = 1'b0;
  assign loader_counter_willOverflowIfInc = (loader_counter_value == 3'b111);
  assign loader_counter_willOverflow = (loader_counter_willOverflowIfInc && loader_counter_willIncrement);
  always @(*) begin
    loader_counter_valueNext = (loader_counter_value + _zz_loader_counter_valueNext);
    if(loader_counter_willClear) begin
      loader_counter_valueNext = 3'b000;
    end
  end

  assign loader_kill = 1'b0;
  assign when_DataCache_l1076 = ((loader_valid && io_mem_rsp_valid) && rspLast);
  assign loader_done = loader_counter_willOverflow;
  assign when_DataCache_l1104 = (! loader_valid);
  assign when_DataCache_l1108 = (loader_valid && (! loader_valid_regNext));
  assign io_cpu_execute_refilling = loader_valid;
  assign when_DataCache_l1111 = (stageB_loaderValid || loader_valid);
  always @(posedge axiClk) begin
    tagsWriteLastCmd_valid <= tagsWriteCmd_valid;
    tagsWriteLastCmd_payload_way <= tagsWriteCmd_payload_way;
    tagsWriteLastCmd_payload_address <= tagsWriteCmd_payload_address;
    tagsWriteLastCmd_payload_data_valid <= tagsWriteCmd_payload_data_valid;
    tagsWriteLastCmd_payload_data_error <= tagsWriteCmd_payload_data_error;
    tagsWriteLastCmd_payload_data_address <= tagsWriteCmd_payload_data_address;
    if(when_DataCache_l764) begin
      stageA_request_wr <= io_cpu_execute_args_wr;
      stageA_request_size <= io_cpu_execute_args_size;
      stageA_request_totalyConsistent <= io_cpu_execute_args_totalyConsistent;
    end
    if(when_DataCache_l764_1) begin
      stageA_mask <= stage0_mask;
    end
    if(when_DataCache_l764_2) begin
      stageA_wayInvalidate <= stage0_wayInvalidate;
    end
    if(when_DataCache_l764_3) begin
      stage0_dataColisions_regNextWhen <= stage0_dataColisions;
    end
    if(when_DataCache_l815) begin
      stageB_request_wr <= stageA_request_wr;
      stageB_request_size <= stageA_request_size;
      stageB_request_totalyConsistent <= stageA_request_totalyConsistent;
    end
    if(when_DataCache_l817) begin
      stageB_mmuRsp_physicalAddress <= io_cpu_memory_mmuRsp_physicalAddress;
      stageB_mmuRsp_isIoAccess <= io_cpu_memory_mmuRsp_isIoAccess;
      stageB_mmuRsp_isPaging <= io_cpu_memory_mmuRsp_isPaging;
      stageB_mmuRsp_allowRead <= io_cpu_memory_mmuRsp_allowRead;
      stageB_mmuRsp_allowWrite <= io_cpu_memory_mmuRsp_allowWrite;
      stageB_mmuRsp_allowExecute <= io_cpu_memory_mmuRsp_allowExecute;
      stageB_mmuRsp_exception <= io_cpu_memory_mmuRsp_exception;
      stageB_mmuRsp_refilling <= io_cpu_memory_mmuRsp_refilling;
      stageB_mmuRsp_bypassTranslation <= io_cpu_memory_mmuRsp_bypassTranslation;
    end
    if(when_DataCache_l814) begin
      stageB_tagsReadRsp_0_valid <= ways_0_tagsReadRsp_valid;
      stageB_tagsReadRsp_0_error <= ways_0_tagsReadRsp_error;
      stageB_tagsReadRsp_0_address <= ways_0_tagsReadRsp_address;
    end
    if(when_DataCache_l814_1) begin
      stageB_dataReadRsp_0 <= ways_0_dataReadRsp;
    end
    if(when_DataCache_l813) begin
      stageB_wayInvalidate <= stageA_wayInvalidate;
    end
    if(when_DataCache_l813_1) begin
      stageB_dataColisions <= stageA_dataColisions;
    end
    if(when_DataCache_l813_2) begin
      stageB_unaligned <= ({((stageA_request_size == 2'b10) && (io_cpu_memory_address[1 : 0] != 2'b00)),((stageA_request_size == 2'b01) && (io_cpu_memory_address[0 : 0] != 1'b0))} != 2'b00);
    end
    if(when_DataCache_l813_3) begin
      stageB_waysHitsBeforeInvalidate <= stageA_wayHits;
    end
    if(when_DataCache_l813_4) begin
      stageB_mask <= stageA_mask;
    end
    loader_valid_regNext <= loader_valid;
  end

  always @(posedge axiClk or posedge resetCtrl_axiReset) begin
    if(resetCtrl_axiReset) begin
      memCmdSent <= 1'b0;
      stageB_flusher_waitDone <= 1'b0;
      stageB_flusher_counter <= 8'h0;
      stageB_flusher_start <= 1'b1;
      loader_valid <= 1'b0;
      loader_counter_value <= 3'b000;
      loader_waysAllocator <= 1'b1;
      loader_error <= 1'b0;
      loader_killReg <= 1'b0;
    end else begin
      if(io_mem_cmd_fire) begin
        memCmdSent <= 1'b1;
      end
      if(when_DataCache_l679) begin
        memCmdSent <= 1'b0;
      end
      if(io_cpu_flush_ready) begin
        stageB_flusher_waitDone <= 1'b0;
      end
      if(when_DataCache_l843) begin
        if(when_DataCache_l849) begin
          stageB_flusher_counter <= (stageB_flusher_counter + 8'h01);
        end
      end
      stageB_flusher_start <= (((((((! stageB_flusher_waitDone) && (! stageB_flusher_start)) && io_cpu_flush_valid) && (! io_cpu_execute_isValid)) && (! io_cpu_memory_isValid)) && (! io_cpu_writeBack_isValid)) && (! io_cpu_redo));
      if(stageB_flusher_start) begin
        stageB_flusher_waitDone <= 1'b1;
        stageB_flusher_counter <= 8'h0;
      end
      `ifndef SYNTHESIS
        `ifdef FORMAL
          assert((! ((io_cpu_writeBack_isValid && (! io_cpu_writeBack_haltIt)) && io_cpu_writeBack_isStuck)));
        `else
          if(!(! ((io_cpu_writeBack_isValid && (! io_cpu_writeBack_haltIt)) && io_cpu_writeBack_isStuck))) begin
            $display("ERROR writeBack stuck by another plugin is not allowed");
          end
        `endif
      `endif
      if(stageB_loaderValid) begin
        loader_valid <= 1'b1;
      end
      loader_counter_value <= loader_counter_valueNext;
      if(loader_kill) begin
        loader_killReg <= 1'b1;
      end
      if(when_DataCache_l1076) begin
        loader_error <= (loader_error || io_mem_rsp_payload_error);
      end
      if(loader_done) begin
        loader_valid <= 1'b0;
        loader_error <= 1'b0;
        loader_killReg <= 1'b0;
      end
      if(when_DataCache_l1104) begin
        loader_waysAllocator <= _zz_loader_waysAllocator[0:0];
      end
    end
  end


endmodule

module InstructionCache (
  input               io_flush,
  input               io_cpu_prefetch_isValid,
  output reg          io_cpu_prefetch_haltIt,
  input      [31:0]   io_cpu_prefetch_pc,
  input               io_cpu_fetch_isValid,
  input               io_cpu_fetch_isStuck,
  input               io_cpu_fetch_isRemoved,
  input      [31:0]   io_cpu_fetch_pc,
  output     [31:0]   io_cpu_fetch_data,
  input      [31:0]   io_cpu_fetch_mmuRsp_physicalAddress,
  input               io_cpu_fetch_mmuRsp_isIoAccess,
  input               io_cpu_fetch_mmuRsp_isPaging,
  input               io_cpu_fetch_mmuRsp_allowRead,
  input               io_cpu_fetch_mmuRsp_allowWrite,
  input               io_cpu_fetch_mmuRsp_allowExecute,
  input               io_cpu_fetch_mmuRsp_exception,
  input               io_cpu_fetch_mmuRsp_refilling,
  input               io_cpu_fetch_mmuRsp_bypassTranslation,
  output     [31:0]   io_cpu_fetch_physicalAddress,
  input               io_cpu_decode_isValid,
  input               io_cpu_decode_isStuck,
  input      [31:0]   io_cpu_decode_pc,
  output     [31:0]   io_cpu_decode_physicalAddress,
  output     [31:0]   io_cpu_decode_data,
  output              io_cpu_decode_cacheMiss,
  output              io_cpu_decode_error,
  output              io_cpu_decode_mmuRefilling,
  output              io_cpu_decode_mmuException,
  input               io_cpu_decode_isUser,
  input               io_cpu_fill_valid,
  input      [31:0]   io_cpu_fill_payload,
  output              io_mem_cmd_valid,
  input               io_mem_cmd_ready,
  output     [31:0]   io_mem_cmd_payload_address,
  output     [2:0]    io_mem_cmd_payload_size,
  input               io_mem_rsp_valid,
  input      [31:0]   io_mem_rsp_payload_data,
  input               io_mem_rsp_payload_error,
  input               axiClk,
  input               resetCtrl_axiReset
);

  reg        [31:0]   _zz_banks_0_port1;
  reg        [21:0]   _zz_ways_0_tags_port1;
  wire       [21:0]   _zz_ways_0_tags_port;
  reg                 _zz_1;
  reg                 _zz_2;
  reg                 lineLoader_fire;
  reg                 lineLoader_valid;
  (* keep , syn_keep *) reg        [31:0]   lineLoader_address /* synthesis syn_keep = 1 */ ;
  reg                 lineLoader_hadError;
  reg                 lineLoader_flushPending;
  reg        [7:0]    lineLoader_flushCounter;
  wire                when_InstructionCache_l338;
  reg                 _zz_when_InstructionCache_l342;
  wire                when_InstructionCache_l342;
  wire                when_InstructionCache_l351;
  reg                 lineLoader_cmdSent;
  wire                io_mem_cmd_fire;
  wire                when_Utils_l485;
  reg                 lineLoader_wayToAllocate_willIncrement;
  wire                lineLoader_wayToAllocate_willClear;
  wire                lineLoader_wayToAllocate_willOverflowIfInc;
  wire                lineLoader_wayToAllocate_willOverflow;
  (* keep , syn_keep *) reg        [2:0]    lineLoader_wordIndex /* synthesis syn_keep = 1 */ ;
  wire                lineLoader_write_tag_0_valid;
  wire       [6:0]    lineLoader_write_tag_0_payload_address;
  wire                lineLoader_write_tag_0_payload_data_valid;
  wire                lineLoader_write_tag_0_payload_data_error;
  wire       [19:0]   lineLoader_write_tag_0_payload_data_address;
  wire                lineLoader_write_data_0_valid;
  wire       [9:0]    lineLoader_write_data_0_payload_address;
  wire       [31:0]   lineLoader_write_data_0_payload_data;
  wire                when_InstructionCache_l401;
  wire       [9:0]    _zz_fetchStage_read_banksValue_0_dataMem;
  wire                _zz_fetchStage_read_banksValue_0_dataMem_1;
  wire       [31:0]   fetchStage_read_banksValue_0_dataMem;
  wire       [31:0]   fetchStage_read_banksValue_0_data;
  wire       [6:0]    _zz_fetchStage_read_waysValues_0_tag_valid;
  wire                _zz_fetchStage_read_waysValues_0_tag_valid_1;
  wire                fetchStage_read_waysValues_0_tag_valid;
  wire                fetchStage_read_waysValues_0_tag_error;
  wire       [19:0]   fetchStage_read_waysValues_0_tag_address;
  wire       [21:0]   _zz_fetchStage_read_waysValues_0_tag_valid_2;
  wire                when_InstructionCache_l459;
  reg        [31:0]   decodeStage_mmuRsp_physicalAddress;
  reg                 decodeStage_mmuRsp_isIoAccess;
  reg                 decodeStage_mmuRsp_isPaging;
  reg                 decodeStage_mmuRsp_allowRead;
  reg                 decodeStage_mmuRsp_allowWrite;
  reg                 decodeStage_mmuRsp_allowExecute;
  reg                 decodeStage_mmuRsp_exception;
  reg                 decodeStage_mmuRsp_refilling;
  reg                 decodeStage_mmuRsp_bypassTranslation;
  wire                when_InstructionCache_l459_1;
  reg                 decodeStage_hit_tags_0_valid;
  reg                 decodeStage_hit_tags_0_error;
  reg        [19:0]   decodeStage_hit_tags_0_address;
  wire                decodeStage_hit_hits_0;
  wire                decodeStage_hit_valid;
  wire                when_InstructionCache_l459_2;
  reg        [31:0]   _zz_decodeStage_hit_data;
  wire       [31:0]   decodeStage_hit_data;
  reg [31:0] banks_0 [0:1023];
  reg [21:0] ways_0_tags [0:127];

  assign _zz_ways_0_tags_port = {lineLoader_write_tag_0_payload_data_address,{lineLoader_write_tag_0_payload_data_error,lineLoader_write_tag_0_payload_data_valid}};
  always @(posedge axiClk) begin
    if(_zz_1) begin
      banks_0[lineLoader_write_data_0_payload_address] <= lineLoader_write_data_0_payload_data;
    end
  end

  always @(posedge axiClk) begin
    if(_zz_fetchStage_read_banksValue_0_dataMem_1) begin
      _zz_banks_0_port1 <= banks_0[_zz_fetchStage_read_banksValue_0_dataMem];
    end
  end

  always @(posedge axiClk) begin
    if(_zz_2) begin
      ways_0_tags[lineLoader_write_tag_0_payload_address] <= _zz_ways_0_tags_port;
    end
  end

  always @(posedge axiClk) begin
    if(_zz_fetchStage_read_waysValues_0_tag_valid_1) begin
      _zz_ways_0_tags_port1 <= ways_0_tags[_zz_fetchStage_read_waysValues_0_tag_valid];
    end
  end

  always @(*) begin
    _zz_1 = 1'b0;
    if(lineLoader_write_data_0_valid) begin
      _zz_1 = 1'b1;
    end
  end

  always @(*) begin
    _zz_2 = 1'b0;
    if(lineLoader_write_tag_0_valid) begin
      _zz_2 = 1'b1;
    end
  end

  always @(*) begin
    lineLoader_fire = 1'b0;
    if(io_mem_rsp_valid) begin
      if(when_InstructionCache_l401) begin
        lineLoader_fire = 1'b1;
      end
    end
  end

  always @(*) begin
    io_cpu_prefetch_haltIt = (lineLoader_valid || lineLoader_flushPending);
    if(when_InstructionCache_l338) begin
      io_cpu_prefetch_haltIt = 1'b1;
    end
    if(when_InstructionCache_l342) begin
      io_cpu_prefetch_haltIt = 1'b1;
    end
    if(io_flush) begin
      io_cpu_prefetch_haltIt = 1'b1;
    end
  end

  assign when_InstructionCache_l338 = (! lineLoader_flushCounter[7]);
  assign when_InstructionCache_l342 = (! _zz_when_InstructionCache_l342);
  assign when_InstructionCache_l351 = (lineLoader_flushPending && (! (lineLoader_valid || io_cpu_fetch_isValid)));
  assign io_mem_cmd_fire = (io_mem_cmd_valid && io_mem_cmd_ready);
  assign io_mem_cmd_valid = (lineLoader_valid && (! lineLoader_cmdSent));
  assign io_mem_cmd_payload_address = {lineLoader_address[31 : 5],5'h0};
  assign io_mem_cmd_payload_size = 3'b101;
  assign when_Utils_l485 = (! lineLoader_valid);
  always @(*) begin
    lineLoader_wayToAllocate_willIncrement = 1'b0;
    if(when_Utils_l485) begin
      lineLoader_wayToAllocate_willIncrement = 1'b1;
    end
  end

  assign lineLoader_wayToAllocate_willClear = 1'b0;
  assign lineLoader_wayToAllocate_willOverflowIfInc = 1'b1;
  assign lineLoader_wayToAllocate_willOverflow = (lineLoader_wayToAllocate_willOverflowIfInc && lineLoader_wayToAllocate_willIncrement);
  assign lineLoader_write_tag_0_valid = ((1'b1 && lineLoader_fire) || (! lineLoader_flushCounter[7]));
  assign lineLoader_write_tag_0_payload_address = (lineLoader_flushCounter[7] ? lineLoader_address[11 : 5] : lineLoader_flushCounter[6 : 0]);
  assign lineLoader_write_tag_0_payload_data_valid = lineLoader_flushCounter[7];
  assign lineLoader_write_tag_0_payload_data_error = (lineLoader_hadError || io_mem_rsp_payload_error);
  assign lineLoader_write_tag_0_payload_data_address = lineLoader_address[31 : 12];
  assign lineLoader_write_data_0_valid = (io_mem_rsp_valid && 1'b1);
  assign lineLoader_write_data_0_payload_address = {lineLoader_address[11 : 5],lineLoader_wordIndex};
  assign lineLoader_write_data_0_payload_data = io_mem_rsp_payload_data;
  assign when_InstructionCache_l401 = (lineLoader_wordIndex == 3'b111);
  assign _zz_fetchStage_read_banksValue_0_dataMem = io_cpu_prefetch_pc[11 : 2];
  assign _zz_fetchStage_read_banksValue_0_dataMem_1 = (! io_cpu_fetch_isStuck);
  assign fetchStage_read_banksValue_0_dataMem = _zz_banks_0_port1;
  assign fetchStage_read_banksValue_0_data = fetchStage_read_banksValue_0_dataMem[31 : 0];
  assign _zz_fetchStage_read_waysValues_0_tag_valid = io_cpu_prefetch_pc[11 : 5];
  assign _zz_fetchStage_read_waysValues_0_tag_valid_1 = (! io_cpu_fetch_isStuck);
  assign _zz_fetchStage_read_waysValues_0_tag_valid_2 = _zz_ways_0_tags_port1;
  assign fetchStage_read_waysValues_0_tag_valid = _zz_fetchStage_read_waysValues_0_tag_valid_2[0];
  assign fetchStage_read_waysValues_0_tag_error = _zz_fetchStage_read_waysValues_0_tag_valid_2[1];
  assign fetchStage_read_waysValues_0_tag_address = _zz_fetchStage_read_waysValues_0_tag_valid_2[21 : 2];
  assign io_cpu_fetch_data = fetchStage_read_banksValue_0_data;
  assign io_cpu_fetch_physicalAddress = io_cpu_fetch_mmuRsp_physicalAddress;
  assign when_InstructionCache_l459 = (! io_cpu_decode_isStuck);
  assign when_InstructionCache_l459_1 = (! io_cpu_decode_isStuck);
  assign decodeStage_hit_hits_0 = (decodeStage_hit_tags_0_valid && (decodeStage_hit_tags_0_address == decodeStage_mmuRsp_physicalAddress[31 : 12]));
  assign decodeStage_hit_valid = (|decodeStage_hit_hits_0);
  assign when_InstructionCache_l459_2 = (! io_cpu_decode_isStuck);
  assign decodeStage_hit_data = _zz_decodeStage_hit_data;
  assign io_cpu_decode_data = decodeStage_hit_data;
  assign io_cpu_decode_cacheMiss = (! decodeStage_hit_valid);
  assign io_cpu_decode_error = (decodeStage_hit_tags_0_error || ((! decodeStage_mmuRsp_isPaging) && (decodeStage_mmuRsp_exception || (! decodeStage_mmuRsp_allowExecute))));
  assign io_cpu_decode_mmuRefilling = decodeStage_mmuRsp_refilling;
  assign io_cpu_decode_mmuException = (((! decodeStage_mmuRsp_refilling) && decodeStage_mmuRsp_isPaging) && (decodeStage_mmuRsp_exception || (! decodeStage_mmuRsp_allowExecute)));
  assign io_cpu_decode_physicalAddress = decodeStage_mmuRsp_physicalAddress;
  always @(posedge axiClk or posedge resetCtrl_axiReset) begin
    if(resetCtrl_axiReset) begin
      lineLoader_valid <= 1'b0;
      lineLoader_hadError <= 1'b0;
      lineLoader_flushPending <= 1'b1;
      lineLoader_cmdSent <= 1'b0;
      lineLoader_wordIndex <= 3'b000;
    end else begin
      if(lineLoader_fire) begin
        lineLoader_valid <= 1'b0;
      end
      if(lineLoader_fire) begin
        lineLoader_hadError <= 1'b0;
      end
      if(io_cpu_fill_valid) begin
        lineLoader_valid <= 1'b1;
      end
      if(io_flush) begin
        lineLoader_flushPending <= 1'b1;
      end
      if(when_InstructionCache_l351) begin
        lineLoader_flushPending <= 1'b0;
      end
      if(io_mem_cmd_fire) begin
        lineLoader_cmdSent <= 1'b1;
      end
      if(lineLoader_fire) begin
        lineLoader_cmdSent <= 1'b0;
      end
      if(io_mem_rsp_valid) begin
        lineLoader_wordIndex <= (lineLoader_wordIndex + 3'b001);
        if(io_mem_rsp_payload_error) begin
          lineLoader_hadError <= 1'b1;
        end
      end
    end
  end

  always @(posedge axiClk) begin
    if(io_cpu_fill_valid) begin
      lineLoader_address <= io_cpu_fill_payload;
    end
    if(when_InstructionCache_l338) begin
      lineLoader_flushCounter <= (lineLoader_flushCounter + 8'h01);
    end
    _zz_when_InstructionCache_l342 <= lineLoader_flushCounter[7];
    if(when_InstructionCache_l351) begin
      lineLoader_flushCounter <= 8'h0;
    end
    if(when_InstructionCache_l459) begin
      decodeStage_mmuRsp_physicalAddress <= io_cpu_fetch_mmuRsp_physicalAddress;
      decodeStage_mmuRsp_isIoAccess <= io_cpu_fetch_mmuRsp_isIoAccess;
      decodeStage_mmuRsp_isPaging <= io_cpu_fetch_mmuRsp_isPaging;
      decodeStage_mmuRsp_allowRead <= io_cpu_fetch_mmuRsp_allowRead;
      decodeStage_mmuRsp_allowWrite <= io_cpu_fetch_mmuRsp_allowWrite;
      decodeStage_mmuRsp_allowExecute <= io_cpu_fetch_mmuRsp_allowExecute;
      decodeStage_mmuRsp_exception <= io_cpu_fetch_mmuRsp_exception;
      decodeStage_mmuRsp_refilling <= io_cpu_fetch_mmuRsp_refilling;
      decodeStage_mmuRsp_bypassTranslation <= io_cpu_fetch_mmuRsp_bypassTranslation;
    end
    if(when_InstructionCache_l459_1) begin
      decodeStage_hit_tags_0_valid <= fetchStage_read_waysValues_0_tag_valid;
      decodeStage_hit_tags_0_error <= fetchStage_read_waysValues_0_tag_error;
      decodeStage_hit_tags_0_address <= fetchStage_read_waysValues_0_tag_address;
    end
    if(when_InstructionCache_l459_2) begin
      _zz_decodeStage_hit_data <= fetchStage_read_banksValue_0_data;
    end
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
  input               axiClk,
  input               resetCtrl_axiReset
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
  wire                when_Stream_l946;
  wire       [4:0]    logic_ptrDif;
  reg [7:0] logic_ram [0:31];

  assign _zz_logic_pushPtr_valueNext_1 = logic_pushPtr_willIncrement;
  assign _zz_logic_pushPtr_valueNext = {4'd0, _zz_logic_pushPtr_valueNext_1};
  assign _zz_logic_popPtr_valueNext_1 = logic_popPtr_willIncrement;
  assign _zz_logic_popPtr_valueNext = {4'd0, _zz_logic_popPtr_valueNext_1};
  assign _zz_io_availability = (logic_popPtr_value - logic_pushPtr_value);
  assign _zz_io_pop_payload = 1'b1;
  always @(posedge axiClk) begin
    if(_zz_io_pop_payload) begin
      _zz_logic_ram_port0 <= logic_ram[logic_popPtr_valueNext];
    end
  end

  always @(posedge axiClk) begin
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
  assign when_Stream_l946 = (logic_pushing != logic_popping);
  assign logic_ptrDif = (logic_pushPtr_value - logic_popPtr_value);
  assign io_occupancy = {(logic_risingOccupancy && logic_ptrMatch),logic_ptrDif};
  assign io_availability = {((! logic_risingOccupancy) && logic_ptrMatch),_zz_io_availability};
  always @(posedge axiClk or posedge resetCtrl_axiReset) begin
    if(resetCtrl_axiReset) begin
      logic_pushPtr_value <= 5'h0;
      logic_popPtr_value <= 5'h0;
      logic_risingOccupancy <= 1'b0;
      _zz_io_pop_valid <= 1'b0;
    end else begin
      logic_pushPtr_value <= logic_pushPtr_valueNext;
      logic_popPtr_value <= logic_popPtr_valueNext;
      _zz_io_pop_valid <= (logic_popPtr_valueNext == logic_pushPtr_value);
      if(when_Stream_l946) begin
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
  input      [0:0]    io_push_payload_mode,
  input      [8:0]    io_push_payload_args,
  output              io_pop_valid,
  input               io_pop_ready,
  output     [0:0]    io_pop_payload_mode,
  output     [8:0]    io_pop_payload_args,
  input               io_flush,
  output     [5:0]    io_occupancy,
  output     [5:0]    io_availability,
  input               axiClk,
  input               resetCtrl_axiReset
);
  localparam SpiMasterCtrlCmdMode_DATA = 1'd0;
  localparam SpiMasterCtrlCmdMode_SS = 1'd1;

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
  wire       [0:0]    _zz_io_pop_payload_mode;
  wire       [9:0]    _zz_io_pop_payload_mode_1;
  wire       [0:0]    _zz_io_pop_payload_mode_2;
  wire                when_Stream_l946;
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
  always @(posedge axiClk) begin
    if(_zz__zz_io_pop_payload_mode_1) begin
      _zz_logic_ram_port0 <= logic_ram[logic_popPtr_valueNext];
    end
  end

  always @(posedge axiClk) begin
    if(_zz_1) begin
      logic_ram[logic_pushPtr_value] <= _zz_logic_ram_port_1;
    end
  end

  `ifndef SYNTHESIS
  always @(*) begin
    case(io_push_payload_mode)
      SpiMasterCtrlCmdMode_DATA : io_push_payload_mode_string = "DATA";
      SpiMasterCtrlCmdMode_SS : io_push_payload_mode_string = "SS  ";
      default : io_push_payload_mode_string = "????";
    endcase
  end
  always @(*) begin
    case(io_pop_payload_mode)
      SpiMasterCtrlCmdMode_DATA : io_pop_payload_mode_string = "DATA";
      SpiMasterCtrlCmdMode_SS : io_pop_payload_mode_string = "SS  ";
      default : io_pop_payload_mode_string = "????";
    endcase
  end
  always @(*) begin
    case(_zz_io_pop_payload_mode)
      SpiMasterCtrlCmdMode_DATA : _zz_io_pop_payload_mode_string = "DATA";
      SpiMasterCtrlCmdMode_SS : _zz_io_pop_payload_mode_string = "SS  ";
      default : _zz_io_pop_payload_mode_string = "????";
    endcase
  end
  always @(*) begin
    case(_zz_io_pop_payload_mode_2)
      SpiMasterCtrlCmdMode_DATA : _zz_io_pop_payload_mode_2_string = "DATA";
      SpiMasterCtrlCmdMode_SS : _zz_io_pop_payload_mode_2_string = "SS  ";
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
  assign when_Stream_l946 = (logic_pushing != logic_popping);
  assign logic_ptrDif = (logic_pushPtr_value - logic_popPtr_value);
  assign io_occupancy = {(logic_risingOccupancy && logic_ptrMatch),logic_ptrDif};
  assign io_availability = {((! logic_risingOccupancy) && logic_ptrMatch),_zz_io_availability};
  always @(posedge axiClk or posedge resetCtrl_axiReset) begin
    if(resetCtrl_axiReset) begin
      logic_pushPtr_value <= 5'h0;
      logic_popPtr_value <= 5'h0;
      logic_risingOccupancy <= 1'b0;
      _zz_io_pop_valid <= 1'b0;
    end else begin
      logic_pushPtr_value <= logic_pushPtr_valueNext;
      logic_popPtr_value <= logic_popPtr_valueNext;
      _zz_io_pop_valid <= (logic_popPtr_valueNext == logic_pushPtr_value);
      if(when_Stream_l946) begin
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
  input      [0:0]    io_cmd_payload_mode,
  input      [8:0]    io_cmd_payload_args,
  output              io_rsp_valid,
  output     [7:0]    io_rsp_payload,
  output     [0:0]    io_spi_ss,
  output              io_spi_sclk,
  output              io_spi_mosi,
  input               io_spi_miso,
  input               axiClk,
  input               resetCtrl_axiReset
);
  localparam SpiMasterCtrlCmdMode_DATA = 1'd0;
  localparam SpiMasterCtrlCmdMode_SS = 1'd1;

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
      SpiMasterCtrlCmdMode_DATA : io_cmd_payload_mode_string = "DATA";
      SpiMasterCtrlCmdMode_SS : io_cmd_payload_mode_string = "SS  ";
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

  assign when_SpiMasterCtrl_l194 = (io_cmd_payload_mode == SpiMasterCtrlCmdMode_DATA);
  assign when_SpiMasterCtrl_l199 = fsm_counter_value[0];
  assign when_SpiMasterCtrl_l211 = (! fsm_counter_value[0]);
  assign io_cmd_fire = (io_cmd_valid && io_cmd_ready);
  assign io_rsp_valid = _zz_io_rsp_valid;
  assign io_rsp_payload = fsm_buffer;
  assign when_SpiMasterCtrl_l232 = ((! io_cmd_valid) || io_cmd_ready);
  assign io_spi_ss = (fsm_ss ^ io_config_ss_activeHigh);
  assign io_spi_sclk = _zz_io_spi_sclk;
  assign io_spi_mosi = _zz_io_spi_mosi;
  always @(posedge axiClk) begin
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
    _zz_io_spi_sclk <= (((io_cmd_valid && (io_cmd_payload_mode == SpiMasterCtrlCmdMode_DATA)) && (fsm_counter_value[0] ^ io_config_kind_cpha)) ^ io_config_kind_cpol);
    _zz_io_spi_mosi <= _zz__zz_io_spi_mosi[_zz__zz_io_spi_mosi_1];
  end

  always @(posedge axiClk or posedge resetCtrl_axiReset) begin
    if(resetCtrl_axiReset) begin
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
      _zz_io_rsp_valid <= ((io_cmd_fire && (io_cmd_payload_mode == SpiMasterCtrlCmdMode_DATA)) && io_cmd_payload_args[8]);
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
  output reg [2:0]    io_bus_cmd_kind,
  output              io_bus_cmd_data,
  input               io_bus_rsp_valid,
  input               io_bus_rsp_enable,
  input               io_bus_rsp_data,
  output              io_internals_inFrame,
  output              io_internals_sdaRead,
  output              io_internals_sclRead,
  input               axiClk,
  input               resetCtrl_axiReset
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


  BufferCC_5 io_i2c_scl_read_buffercc (
    .io_dataIn             (io_i2c_scl_read                      ), //i
    .io_dataOut            (io_i2c_scl_read_buffercc_io_dataOut  ), //o
    .axiClk                (axiClk                               ), //i
    .resetCtrl_axiReset    (resetCtrl_axiReset                   )  //i
  );
  BufferCC_5 io_i2c_sda_read_buffercc (
    .io_dataIn             (io_i2c_sda_read                      ), //i
    .io_dataOut            (io_i2c_sda_read_buffercc_io_dataOut  ), //o
    .axiClk                (axiClk                               ), //i
    .resetCtrl_axiReset    (resetCtrl_axiReset                   )  //i
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
  always @(posedge axiClk or posedge resetCtrl_axiReset) begin
    if(resetCtrl_axiReset) begin
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

  always @(posedge axiClk) begin
    if(ctrl_rspBufferIn_ready) begin
      ctrl_rspBufferIn_rData_enable <= ctrl_rspBufferIn_payload_enable;
      ctrl_rspBufferIn_rData_data <= ctrl_rspBufferIn_payload_data;
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
  input               axiClk,
  input               resetCtrl_axiReset
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
  wire                when_Stream_l946;
  wire       [3:0]    logic_ptrDif;
  reg [7:0] logic_ram [0:15];

  assign _zz_logic_pushPtr_valueNext_1 = logic_pushPtr_willIncrement;
  assign _zz_logic_pushPtr_valueNext = {3'd0, _zz_logic_pushPtr_valueNext_1};
  assign _zz_logic_popPtr_valueNext_1 = logic_popPtr_willIncrement;
  assign _zz_logic_popPtr_valueNext = {3'd0, _zz_logic_popPtr_valueNext_1};
  assign _zz_io_availability = (logic_popPtr_value - logic_pushPtr_value);
  assign _zz_io_pop_payload = 1'b1;
  always @(posedge axiClk) begin
    if(_zz_io_pop_payload) begin
      _zz_logic_ram_port0 <= logic_ram[logic_popPtr_valueNext];
    end
  end

  always @(posedge axiClk) begin
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
  assign when_Stream_l946 = (logic_pushing != logic_popping);
  assign logic_ptrDif = (logic_pushPtr_value - logic_popPtr_value);
  assign io_occupancy = {(logic_risingOccupancy && logic_ptrMatch),logic_ptrDif};
  assign io_availability = {((! logic_risingOccupancy) && logic_ptrMatch),_zz_io_availability};
  always @(posedge axiClk or posedge resetCtrl_axiReset) begin
    if(resetCtrl_axiReset) begin
      logic_pushPtr_value <= 4'b0000;
      logic_popPtr_value <= 4'b0000;
      logic_risingOccupancy <= 1'b0;
      _zz_io_pop_valid <= 1'b0;
    end else begin
      logic_pushPtr_value <= logic_pushPtr_valueNext;
      logic_popPtr_value <= logic_popPtr_valueNext;
      _zz_io_pop_valid <= (logic_popPtr_valueNext == logic_pushPtr_value);
      if(when_Stream_l946) begin
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
  input      [0:0]    io_config_frame_stop,
  input      [1:0]    io_config_frame_parity,
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
  input               axiClk,
  input               resetCtrl_axiReset
);
  localparam UartStopType_ONE = 1'd0;
  localparam UartStopType_TWO = 1'd1;
  localparam UartParityType_NONE = 2'd0;
  localparam UartParityType_EVEN = 2'd1;
  localparam UartParityType_ODD = 2'd2;

  wire                tx_io_write_ready;
  wire                tx_io_txd;
  wire                rx_io_read_valid;
  wire       [7:0]    rx_io_read_payload;
  wire                rx_io_rts;
  wire                rx_io_error;
  wire                rx_io_break;
  reg        [19:0]   clockDivider_counter;
  wire                clockDivider_tick;
  reg                 clockDivider_tickReg;
  reg                 io_write_thrown_valid;
  wire                io_write_thrown_ready;
  wire       [7:0]    io_write_thrown_payload;
  `ifndef SYNTHESIS
  reg [23:0] io_config_frame_stop_string;
  reg [31:0] io_config_frame_parity_string;
  `endif


  UartCtrlTx tx (
    .io_configFrame_dataLength    (io_config_frame_dataLength[2:0]  ), //i
    .io_configFrame_stop          (io_config_frame_stop             ), //i
    .io_configFrame_parity        (io_config_frame_parity[1:0]      ), //i
    .io_samplingTick              (clockDivider_tickReg             ), //i
    .io_write_valid               (io_write_thrown_valid            ), //i
    .io_write_ready               (tx_io_write_ready                ), //o
    .io_write_payload             (io_write_thrown_payload[7:0]     ), //i
    .io_cts                       (1'b0                             ), //i
    .io_txd                       (tx_io_txd                        ), //o
    .io_break                     (io_writeBreak                    ), //i
    .axiClk                       (axiClk                           ), //i
    .resetCtrl_axiReset           (resetCtrl_axiReset               )  //i
  );
  UartCtrlRx rx (
    .io_configFrame_dataLength    (io_config_frame_dataLength[2:0]  ), //i
    .io_configFrame_stop          (io_config_frame_stop             ), //i
    .io_configFrame_parity        (io_config_frame_parity[1:0]      ), //i
    .io_samplingTick              (clockDivider_tickReg             ), //i
    .io_read_valid                (rx_io_read_valid                 ), //o
    .io_read_ready                (io_read_ready                    ), //i
    .io_read_payload              (rx_io_read_payload[7:0]          ), //o
    .io_rxd                       (io_uart_rxd                      ), //i
    .io_rts                       (rx_io_rts                        ), //o
    .io_error                     (rx_io_error                      ), //o
    .io_break                     (rx_io_break                      ), //o
    .axiClk                       (axiClk                           ), //i
    .resetCtrl_axiReset           (resetCtrl_axiReset               )  //i
  );
  `ifndef SYNTHESIS
  always @(*) begin
    case(io_config_frame_stop)
      UartStopType_ONE : io_config_frame_stop_string = "ONE";
      UartStopType_TWO : io_config_frame_stop_string = "TWO";
      default : io_config_frame_stop_string = "???";
    endcase
  end
  always @(*) begin
    case(io_config_frame_parity)
      UartParityType_NONE : io_config_frame_parity_string = "NONE";
      UartParityType_EVEN : io_config_frame_parity_string = "EVEN";
      UartParityType_ODD : io_config_frame_parity_string = "ODD ";
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
  always @(posedge axiClk or posedge resetCtrl_axiReset) begin
    if(resetCtrl_axiReset) begin
      clockDivider_counter <= 20'h0;
      clockDivider_tickReg <= 1'b0;
    end else begin
      clockDivider_tickReg <= clockDivider_tick;
      clockDivider_counter <= (clockDivider_counter - 20'h00001);
      if(clockDivider_tick) begin
        clockDivider_counter <= io_config_clockDivider;
      end
    end
  end


endmodule

module InterruptCtrl (
  input      [3:0]    io_inputs,
  input      [3:0]    io_clears,
  input      [3:0]    io_masks,
  output     [3:0]    io_pendings,
  input               axiClk,
  input               resetCtrl_axiReset
);

  reg        [3:0]    pendings;

  assign io_pendings = (pendings & io_masks);
  always @(posedge axiClk or posedge resetCtrl_axiReset) begin
    if(resetCtrl_axiReset) begin
      pendings <= 4'b0000;
    end else begin
      pendings <= ((pendings & (~ io_clears)) | io_inputs);
    end
  end


endmodule

//Timer replaced by Timer

//Timer replaced by Timer

//Timer replaced by Timer

module Timer (
  input               io_tick,
  input               io_clear,
  input      [31:0]   io_limit,
  output              io_full,
  output     [31:0]   io_value,
  input               axiClk,
  input               resetCtrl_axiReset
);

  wire       [31:0]   _zz_counter;
  wire       [0:0]    _zz_counter_1;
  reg        [31:0]   counter;
  wire                limitHit;
  reg                 inhibitFull;

  assign _zz_counter_1 = (! limitHit);
  assign _zz_counter = {31'd0, _zz_counter_1};
  assign limitHit = (counter == io_limit);
  assign io_full = ((limitHit && io_tick) && (! inhibitFull));
  assign io_value = counter;
  always @(posedge axiClk or posedge resetCtrl_axiReset) begin
    if(resetCtrl_axiReset) begin
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

  always @(posedge axiClk) begin
    if(io_tick) begin
      counter <= (counter + _zz_counter);
    end
    if(io_clear) begin
      counter <= 32'h0;
    end
  end


endmodule

module Prescaler (
  input               io_clear,
  input      [15:0]   io_limit,
  output              io_overflow,
  input               axiClk,
  input               resetCtrl_axiReset
);

  reg        [15:0]   counter;
  wire                when_Prescaler_l17;

  assign when_Prescaler_l17 = (io_clear || io_overflow);
  assign io_overflow = (counter == io_limit);
  always @(posedge axiClk) begin
    counter <= (counter + 16'h0001);
    if(when_Prescaler_l17) begin
      counter <= 16'h0;
    end
  end


endmodule

module BufferCC_9 (
  input      [15:0]   io_dataIn,
  output     [15:0]   io_dataOut,
  input               axiClk,
  input               resetCtrl_axiReset
);

  (* async_reg = "true" *) reg        [15:0]   buffers_0;
  (* async_reg = "true" *) reg        [15:0]   buffers_1;

  assign io_dataOut = buffers_1;
  always @(posedge axiClk) begin
    buffers_0 <= io_dataIn;
    buffers_1 <= buffers_0;
  end


endmodule

module LedsCtrl (
  input      [2:0]    io_value,
  input      [0:0]    io_ldir,
  output reg [2:0]    io_o_leds
);

  wire                when_LedsCtrl_l33;
  reg        [2:0]    _zz_io_o_leds;

  assign when_LedsCtrl_l33 = (io_ldir == 1'b0);
  always @(*) begin
    if(when_LedsCtrl_l33) begin
      io_o_leds = io_value;
    end else begin
      io_o_leds = _zz_io_o_leds;
    end
  end

  always @(*) begin
    _zz_io_o_leds[0] = io_value[2];
    _zz_io_o_leds[1] = io_value[1];
    _zz_io_o_leds[2] = io_value[0];
  end


endmodule

module PulseCCByToggle (
  input               io_pulseIn,
  output              io_pulseOut,
  input               vgaClk,
  input               resetCtrl_vgaReset
);

  wire                inArea_target_buffercc_io_dataOut;
  reg                 inArea_target;
  wire                outArea_target;
  reg                 outArea_target_regNext;

  BufferCC_4 inArea_target_buffercc (
    .io_dataIn             (inArea_target                      ), //i
    .io_dataOut            (inArea_target_buffercc_io_dataOut  ), //o
    .vgaClk                (vgaClk                             ), //i
    .resetCtrl_vgaReset    (resetCtrl_vgaReset                 )  //i
  );
  assign outArea_target = inArea_target_buffercc_io_dataOut;
  assign io_pulseOut = (outArea_target ^ outArea_target_regNext);
  always @(posedge vgaClk or posedge resetCtrl_vgaReset) begin
    if(resetCtrl_vgaReset) begin
      inArea_target <= 1'b0;
      outArea_target_regNext <= 1'b0;
    end else begin
      if(io_pulseIn) begin
        inArea_target <= (! inArea_target);
      end
      outArea_target_regNext <= outArea_target;
    end
  end


endmodule

module VgaCtrl (
  input               io_softReset,
  input      [11:0]   io_timings_h_syncStart,
  input      [11:0]   io_timings_h_syncEnd,
  input      [11:0]   io_timings_h_colorStart,
  input      [11:0]   io_timings_h_colorEnd,
  input               io_timings_h_polarity,
  input      [11:0]   io_timings_v_syncStart,
  input      [11:0]   io_timings_v_syncEnd,
  input      [11:0]   io_timings_v_colorStart,
  input      [11:0]   io_timings_v_colorEnd,
  input               io_timings_v_polarity,
  output              io_frameStart /* verilator public */ ,
  input               io_pixels_valid,
  output              io_pixels_ready,
  input      [4:0]    io_pixels_payload_r,
  input      [5:0]    io_pixels_payload_g,
  input      [4:0]    io_pixels_payload_b,
  output              io_vga_vSync,
  output              io_vga_hSync,
  output              io_vga_colorEn,
  output     [4:0]    io_vga_color_r,
  output     [5:0]    io_vga_color_g,
  output     [4:0]    io_vga_color_b,
  output              io_error /* verilator public */ ,
  input               vgaClk,
  input               resetCtrl_vgaReset
);

  wire                when_VgaCtrl_l183;
  reg        [11:0]   h_counter;
  wire                h_syncStart;
  wire                h_syncEnd;
  wire                h_colorStart;
  wire                h_colorEnd;
  reg                 h_sync;
  reg                 h_colorEn;
  reg        [11:0]   v_counter;
  wire                v_syncStart;
  wire                v_syncEnd;
  wire                v_colorStart;
  wire                v_colorEnd;
  reg                 v_sync;
  reg                 v_colorEn;
  wire                colorEn;

  assign when_VgaCtrl_l183 = 1'b1;
  assign h_syncStart = (h_counter == io_timings_h_syncStart);
  assign h_syncEnd = (h_counter == io_timings_h_syncEnd);
  assign h_colorStart = (h_counter == io_timings_h_colorStart);
  assign h_colorEnd = (h_counter == io_timings_h_colorEnd);
  assign v_syncStart = (v_counter == io_timings_v_syncStart);
  assign v_syncEnd = (v_counter == io_timings_v_syncEnd);
  assign v_colorStart = (v_counter == io_timings_v_colorStart);
  assign v_colorEnd = (v_counter == io_timings_v_colorEnd);
  assign colorEn = (h_colorEn && v_colorEn);
  assign io_pixels_ready = colorEn;
  assign io_error = (colorEn && (! io_pixels_valid));
  assign io_frameStart = (v_syncStart && h_syncStart);
  assign io_vga_hSync = (h_sync ^ io_timings_h_polarity);
  assign io_vga_vSync = (v_sync ^ io_timings_v_polarity);
  assign io_vga_colorEn = colorEn;
  assign io_vga_color_r = io_pixels_payload_r;
  assign io_vga_color_g = io_pixels_payload_g;
  assign io_vga_color_b = io_pixels_payload_b;
  always @(posedge vgaClk or posedge resetCtrl_vgaReset) begin
    if(resetCtrl_vgaReset) begin
      h_counter <= 12'h0;
      h_sync <= 1'b0;
      h_colorEn <= 1'b0;
      v_counter <= 12'h0;
      v_sync <= 1'b0;
      v_colorEn <= 1'b0;
    end else begin
      if(when_VgaCtrl_l183) begin
        h_counter <= (h_counter + 12'h001);
        if(h_syncEnd) begin
          h_counter <= 12'h0;
        end
      end
      if(h_syncStart) begin
        h_sync <= 1'b1;
      end
      if(h_syncEnd) begin
        h_sync <= 1'b0;
      end
      if(h_colorStart) begin
        h_colorEn <= 1'b1;
      end
      if(h_colorEnd) begin
        h_colorEn <= 1'b0;
      end
      if(io_softReset) begin
        h_counter <= 12'h0;
        h_sync <= 1'b0;
        h_colorEn <= 1'b0;
      end
      if(h_syncEnd) begin
        v_counter <= (v_counter + 12'h001);
        if(v_syncEnd) begin
          v_counter <= 12'h0;
        end
      end
      if(v_syncStart) begin
        v_sync <= 1'b1;
      end
      if(v_syncEnd) begin
        v_sync <= 1'b0;
      end
      if(v_colorStart) begin
        v_colorEn <= 1'b1;
      end
      if(v_colorEnd) begin
        v_colorEn <= 1'b0;
      end
      if(io_softReset) begin
        v_counter <= 12'h0;
        v_sync <= 1'b0;
        v_colorEn <= 1'b0;
      end
    end
  end


endmodule

module BufferCC_8 (
  input               io_dataIn,
  output              io_dataOut,
  input               vgaClk,
  input               resetCtrl_vgaReset
);

  (* async_reg = "true" *) reg                 buffers_0;
  (* async_reg = "true" *) reg                 buffers_1;

  assign io_dataOut = buffers_1;
  always @(posedge vgaClk) begin
    buffers_0 <= io_dataIn;
    buffers_1 <= buffers_0;
  end


endmodule

module VideoDma (
  input               io_start,
  output              io_busy,
  input      [26:0]   io_base,
  input      [14:0]   io_size,
  output reg          io_mem_cmd_valid,
  input               io_mem_cmd_ready,
  output     [26:0]   io_mem_cmd_payload,
  input               io_mem_rsp_valid,
  input               io_mem_rsp_payload_last,
  input      [31:0]   io_mem_rsp_payload_fragment,
  output              io_frame_valid,
  input               io_frame_ready,
  output              io_frame_payload_last,
  output     [4:0]    io_frame_payload_fragment_r,
  output     [5:0]    io_frame_payload_fragment_g,
  output     [4:0]    io_frame_payload_fragment_b,
  input               vgaClk,
  input               resetCtrl_vgaReset
);

  wire                rspArea_fifo_io_push_ready;
  wire                rspArea_fifo_io_pop_valid;
  wire                rspArea_fifo_io_pop_payload_last;
  wire       [31:0]   rspArea_fifo_io_pop_payload_fragment;
  wire       [9:0]    rspArea_fifo_io_pushOccupancy;
  wire       [9:0]    rspArea_fifo_io_popOccupancy;
  wire       [6:0]    rspArea_frameClockArea_popCmdGray_buffercc_io_dataOut;
  wire       [26:0]   _zz_io_mem_cmd_payload;
  wire       [2:0]    _zz_rspArea_frameClockArea_popBeatCounter_valueNext;
  wire       [0:0]    _zz_rspArea_frameClockArea_popBeatCounter_valueNext_1;
  reg        [15:0]   _zz__zz_io_frame_payload_fragment_r_1;
  reg        [5:0]    _zz_pendingMemRsp;
  reg        [5:0]    _zz_pendingMemRsp_1;
  wire                io_mem_cmd_fire;
  wire                when_Utils_l597;
  reg                 pendingMemCmd_incrementIt;
  reg                 pendingMemCmd_decrementIt;
  wire       [2:0]    pendingMemCmd_valueNext;
  reg        [2:0]    pendingMemCmd_value;
  wire                pendingMemCmd_willOverflowIfInc;
  wire                pendingMemCmd_willOverflow;
  reg        [2:0]    pendingMemCmd_finalIncrement;
  wire                when_Utils_l622;
  wire                when_Utils_l624;
  wire                io_mem_cmd_fire_1;
  reg        [5:0]    pendingMemRsp;
  wire       [5:0]    _zz_pendingMemRsp_2;
  wire                toManyPendingCmd;
  wire                toManyPendingRsp;
  reg                 isActive;
  reg                 cmdActive;
  reg        [14:0]   memCmdCounter;
  wire                memCmdLast;
  wire                when_VideoDma_l94;
  wire                when_VideoDma_l102;
  wire                when_VideoDma_l104;
  wire                when_VideoDma_l108;
  wire                io_mem_cmd_fire_2;
  wire                memRsp_valid;
  wire                memRsp_payload_last;
  wire       [31:0]   memRsp_payload_fragment;
  wire                fifoPop_valid;
  wire                fifoPop_ready;
  wire                fifoPop_payload_last;
  wire       [31:0]   fifoPop_payload_fragment;
  reg                 rspArea_frameClockArea_popBeatCounter_willIncrement;
  wire                rspArea_frameClockArea_popBeatCounter_willClear;
  reg        [2:0]    rspArea_frameClockArea_popBeatCounter_valueNext;
  reg        [2:0]    rspArea_frameClockArea_popBeatCounter_value;
  wire                rspArea_frameClockArea_popBeatCounter_willOverflowIfInc;
  wire                rspArea_frameClockArea_popBeatCounter_willOverflow;
  wire                rspArea_fifo_io_pop_fire;
  reg        [6:0]    rspArea_frameClockArea_popCmdGray;
  reg                 _zz_when_Utils_l367;
  wire       [6:0]    _zz_when_Utils_l367_1;
  reg                 _zz_when_Utils_l367_2;
  reg                 _zz_when_Utils_l367_3;
  reg                 _zz_when_Utils_l367_4;
  reg                 _zz_when_Utils_l367_5;
  reg                 _zz_when_Utils_l367_6;
  reg                 _zz_when_Utils_l367_7;
  wire                when_Utils_l367;
  wire                when_Utils_l367_1;
  wire                when_Utils_l367_2;
  wire                when_Utils_l367_3;
  wire                when_Utils_l367_4;
  wire                when_Utils_l367_5;
  wire                when_Utils_l367_6;
  wire       [6:0]    rspArea_popCmdGray;
  wire                io_mem_cmd_fire_3;
  reg        [6:0]    rspArea_pushCmdGray;
  reg                 _zz_when_Utils_l367_8;
  wire       [6:0]    _zz_when_Utils_l367_9;
  reg                 _zz_when_Utils_l367_10;
  reg                 _zz_when_Utils_l367_11;
  reg                 _zz_when_Utils_l367_12;
  reg                 _zz_when_Utils_l367_13;
  reg                 _zz_when_Utils_l367_14;
  reg                 _zz_when_Utils_l367_15;
  wire                when_Utils_l367_7;
  wire                when_Utils_l367_8;
  wire                when_Utils_l367_9;
  wire                when_Utils_l367_10;
  wire                when_Utils_l367_11;
  wire                when_Utils_l367_12;
  wire                when_Utils_l367_13;
  wire                io_frame_fire;
  reg                 _zz_io_frame_payload_last;
  reg        [0:0]    _zz_io_frame_payload_last_1;
  reg        [0:0]    _zz_io_frame_payload_last_2;
  wire                _zz_io_frame_payload_last_3;
  wire       [31:0]   _zz_io_frame_payload_fragment_r;
  wire       [15:0]   _zz_io_frame_payload_fragment_r_1;

  assign _zz_io_mem_cmd_payload = {12'd0, memCmdCounter};
  assign _zz_rspArea_frameClockArea_popBeatCounter_valueNext_1 = rspArea_frameClockArea_popBeatCounter_willIncrement;
  assign _zz_rspArea_frameClockArea_popBeatCounter_valueNext = {2'd0, _zz_rspArea_frameClockArea_popBeatCounter_valueNext_1};
  StreamFifoCC rspArea_fifo (
    .io_push_valid               (memRsp_valid                                ), //i
    .io_push_ready               (rspArea_fifo_io_push_ready                  ), //o
    .io_push_payload_last        (memRsp_payload_last                         ), //i
    .io_push_payload_fragment    (memRsp_payload_fragment[31:0]               ), //i
    .io_pop_valid                (rspArea_fifo_io_pop_valid                   ), //o
    .io_pop_ready                (fifoPop_ready                               ), //i
    .io_pop_payload_last         (rspArea_fifo_io_pop_payload_last            ), //o
    .io_pop_payload_fragment     (rspArea_fifo_io_pop_payload_fragment[31:0]  ), //o
    .io_pushOccupancy            (rspArea_fifo_io_pushOccupancy[9:0]          ), //o
    .io_popOccupancy             (rspArea_fifo_io_popOccupancy[9:0]           ), //o
    .vgaClk                      (vgaClk                                      ), //i
    .resetCtrl_vgaReset          (resetCtrl_vgaReset                          )  //i
  );
  BufferCC_3 rspArea_frameClockArea_popCmdGray_buffercc (
    .io_dataIn             (rspArea_frameClockArea_popCmdGray[6:0]                      ), //i
    .io_dataOut            (rspArea_frameClockArea_popCmdGray_buffercc_io_dataOut[6:0]  ), //o
    .vgaClk                (vgaClk                                                      ), //i
    .resetCtrl_vgaReset    (resetCtrl_vgaReset                                          )  //i
  );
  always @(*) begin
    case(_zz_io_frame_payload_last_2)
      1'b0 : begin
        _zz__zz_io_frame_payload_fragment_r_1 = _zz_io_frame_payload_fragment_r[15 : 0];
      end
      default : begin
        _zz__zz_io_frame_payload_fragment_r_1 = _zz_io_frame_payload_fragment_r[31 : 16];
      end
    endcase
  end

  always @(*) begin
    _zz_pendingMemRsp = _zz_pendingMemRsp_1;
    if(io_mem_rsp_valid) begin
      _zz_pendingMemRsp = (_zz_pendingMemRsp_1 - 6'h01);
    end
  end

  always @(*) begin
    _zz_pendingMemRsp_1 = _zz_pendingMemRsp_2;
    if(io_mem_cmd_fire_1) begin
      _zz_pendingMemRsp_1 = (_zz_pendingMemRsp_2 + 6'h08);
    end
  end

  assign io_mem_cmd_fire = (io_mem_cmd_valid && io_mem_cmd_ready);
  assign when_Utils_l597 = (io_mem_rsp_valid && io_mem_rsp_payload_last);
  always @(*) begin
    pendingMemCmd_incrementIt = 1'b0;
    if(io_mem_cmd_fire) begin
      pendingMemCmd_incrementIt = 1'b1;
    end
  end

  always @(*) begin
    pendingMemCmd_decrementIt = 1'b0;
    if(when_Utils_l597) begin
      pendingMemCmd_decrementIt = 1'b1;
    end
  end

  assign pendingMemCmd_willOverflowIfInc = ((pendingMemCmd_value == 3'b111) && (! pendingMemCmd_decrementIt));
  assign pendingMemCmd_willOverflow = (pendingMemCmd_willOverflowIfInc && pendingMemCmd_incrementIt);
  assign when_Utils_l622 = (pendingMemCmd_incrementIt && (! pendingMemCmd_decrementIt));
  always @(*) begin
    if(when_Utils_l622) begin
      pendingMemCmd_finalIncrement = 3'b001;
    end else begin
      if(when_Utils_l624) begin
        pendingMemCmd_finalIncrement = 3'b111;
      end else begin
        pendingMemCmd_finalIncrement = 3'b000;
      end
    end
  end

  assign when_Utils_l624 = ((! pendingMemCmd_incrementIt) && pendingMemCmd_decrementIt);
  assign pendingMemCmd_valueNext = (pendingMemCmd_value + pendingMemCmd_finalIncrement);
  assign io_mem_cmd_fire_1 = (io_mem_cmd_valid && io_mem_cmd_ready);
  assign _zz_pendingMemRsp_2 = pendingMemRsp;
  assign toManyPendingCmd = (3'b110 < pendingMemCmd_value);
  assign io_busy = isActive;
  assign memCmdLast = (memCmdCounter == io_size);
  always @(*) begin
    io_mem_cmd_valid = 1'b0;
    if(!when_VideoDma_l94) begin
      if(cmdActive) begin
        if(when_VideoDma_l102) begin
          io_mem_cmd_valid = 1'b1;
        end
      end
    end
  end

  assign io_mem_cmd_payload = (io_base + _zz_io_mem_cmd_payload);
  assign when_VideoDma_l94 = (! isActive);
  assign when_VideoDma_l102 = ((! toManyPendingCmd) && (! toManyPendingRsp));
  assign when_VideoDma_l104 = (memCmdLast && io_mem_cmd_ready);
  assign when_VideoDma_l108 = (pendingMemRsp == 6'h0);
  assign io_mem_cmd_fire_2 = (io_mem_cmd_valid && io_mem_cmd_ready);
  assign memRsp_valid = io_mem_rsp_valid;
  assign memRsp_payload_last = ((! cmdActive) && (pendingMemRsp == 6'h01));
  assign memRsp_payload_fragment = io_mem_rsp_payload_fragment;
  assign fifoPop_valid = rspArea_fifo_io_pop_valid;
  assign fifoPop_payload_last = rspArea_fifo_io_pop_payload_last;
  assign fifoPop_payload_fragment = rspArea_fifo_io_pop_payload_fragment;
  always @(*) begin
    rspArea_frameClockArea_popBeatCounter_willIncrement = 1'b0;
    if(rspArea_fifo_io_pop_fire) begin
      rspArea_frameClockArea_popBeatCounter_willIncrement = 1'b1;
    end
  end

  assign rspArea_frameClockArea_popBeatCounter_willClear = 1'b0;
  assign rspArea_frameClockArea_popBeatCounter_willOverflowIfInc = (rspArea_frameClockArea_popBeatCounter_value == 3'b111);
  assign rspArea_frameClockArea_popBeatCounter_willOverflow = (rspArea_frameClockArea_popBeatCounter_willOverflowIfInc && rspArea_frameClockArea_popBeatCounter_willIncrement);
  always @(*) begin
    rspArea_frameClockArea_popBeatCounter_valueNext = (rspArea_frameClockArea_popBeatCounter_value + _zz_rspArea_frameClockArea_popBeatCounter_valueNext);
    if(rspArea_frameClockArea_popBeatCounter_willClear) begin
      rspArea_frameClockArea_popBeatCounter_valueNext = 3'b000;
    end
  end

  assign rspArea_fifo_io_pop_fire = (rspArea_fifo_io_pop_valid && fifoPop_ready);
  assign _zz_when_Utils_l367_1 = {1'b1,{rspArea_frameClockArea_popCmdGray[4 : 0],_zz_when_Utils_l367}};
  always @(*) begin
    _zz_when_Utils_l367_2 = _zz_when_Utils_l367_3;
    if(when_Utils_l367_5) begin
      _zz_when_Utils_l367_2 = 1'b1;
    end
  end

  always @(*) begin
    _zz_when_Utils_l367_3 = _zz_when_Utils_l367_4;
    if(when_Utils_l367_4) begin
      _zz_when_Utils_l367_3 = 1'b1;
    end
  end

  always @(*) begin
    _zz_when_Utils_l367_4 = _zz_when_Utils_l367_5;
    if(when_Utils_l367_3) begin
      _zz_when_Utils_l367_4 = 1'b1;
    end
  end

  always @(*) begin
    _zz_when_Utils_l367_5 = _zz_when_Utils_l367_6;
    if(when_Utils_l367_2) begin
      _zz_when_Utils_l367_5 = 1'b1;
    end
  end

  always @(*) begin
    _zz_when_Utils_l367_6 = _zz_when_Utils_l367_7;
    if(when_Utils_l367_1) begin
      _zz_when_Utils_l367_6 = 1'b1;
    end
  end

  always @(*) begin
    _zz_when_Utils_l367_7 = 1'b0;
    if(when_Utils_l367) begin
      _zz_when_Utils_l367_7 = 1'b1;
    end
  end

  assign when_Utils_l367 = (_zz_when_Utils_l367_1[0] && (! 1'b0));
  assign when_Utils_l367_1 = (_zz_when_Utils_l367_1[1] && (! _zz_when_Utils_l367_7));
  assign when_Utils_l367_2 = (_zz_when_Utils_l367_1[2] && (! _zz_when_Utils_l367_6));
  assign when_Utils_l367_3 = (_zz_when_Utils_l367_1[3] && (! _zz_when_Utils_l367_5));
  assign when_Utils_l367_4 = (_zz_when_Utils_l367_1[4] && (! _zz_when_Utils_l367_4));
  assign when_Utils_l367_5 = (_zz_when_Utils_l367_1[5] && (! _zz_when_Utils_l367_3));
  assign when_Utils_l367_6 = (_zz_when_Utils_l367_1[6] && (! _zz_when_Utils_l367_2));
  assign rspArea_popCmdGray = rspArea_frameClockArea_popCmdGray_buffercc_io_dataOut;
  assign io_mem_cmd_fire_3 = (io_mem_cmd_valid && io_mem_cmd_ready);
  assign _zz_when_Utils_l367_9 = {1'b1,{rspArea_pushCmdGray[4 : 0],_zz_when_Utils_l367_8}};
  always @(*) begin
    _zz_when_Utils_l367_10 = _zz_when_Utils_l367_11;
    if(when_Utils_l367_12) begin
      _zz_when_Utils_l367_10 = 1'b1;
    end
  end

  always @(*) begin
    _zz_when_Utils_l367_11 = _zz_when_Utils_l367_12;
    if(when_Utils_l367_11) begin
      _zz_when_Utils_l367_11 = 1'b1;
    end
  end

  always @(*) begin
    _zz_when_Utils_l367_12 = _zz_when_Utils_l367_13;
    if(when_Utils_l367_10) begin
      _zz_when_Utils_l367_12 = 1'b1;
    end
  end

  always @(*) begin
    _zz_when_Utils_l367_13 = _zz_when_Utils_l367_14;
    if(when_Utils_l367_9) begin
      _zz_when_Utils_l367_13 = 1'b1;
    end
  end

  always @(*) begin
    _zz_when_Utils_l367_14 = _zz_when_Utils_l367_15;
    if(when_Utils_l367_8) begin
      _zz_when_Utils_l367_14 = 1'b1;
    end
  end

  always @(*) begin
    _zz_when_Utils_l367_15 = 1'b0;
    if(when_Utils_l367_7) begin
      _zz_when_Utils_l367_15 = 1'b1;
    end
  end

  assign when_Utils_l367_7 = (_zz_when_Utils_l367_9[0] && (! 1'b0));
  assign when_Utils_l367_8 = (_zz_when_Utils_l367_9[1] && (! _zz_when_Utils_l367_15));
  assign when_Utils_l367_9 = (_zz_when_Utils_l367_9[2] && (! _zz_when_Utils_l367_14));
  assign when_Utils_l367_10 = (_zz_when_Utils_l367_9[3] && (! _zz_when_Utils_l367_13));
  assign when_Utils_l367_11 = (_zz_when_Utils_l367_9[4] && (! _zz_when_Utils_l367_12));
  assign when_Utils_l367_12 = (_zz_when_Utils_l367_9[5] && (! _zz_when_Utils_l367_11));
  assign when_Utils_l367_13 = (_zz_when_Utils_l367_9[6] && (! _zz_when_Utils_l367_10));
  assign toManyPendingRsp = ((rspArea_pushCmdGray[6 : 5] == (~ rspArea_popCmdGray[6 : 5])) && (rspArea_pushCmdGray[4 : 0] == rspArea_popCmdGray[4 : 0]));
  assign io_frame_fire = (io_frame_valid && io_frame_ready);
  always @(*) begin
    _zz_io_frame_payload_last = 1'b0;
    if(io_frame_fire) begin
      _zz_io_frame_payload_last = 1'b1;
    end
  end

  assign _zz_io_frame_payload_last_3 = (_zz_io_frame_payload_last_2 == 1'b1);
  always @(*) begin
    _zz_io_frame_payload_last_1 = (_zz_io_frame_payload_last_2 + _zz_io_frame_payload_last);
    if(1'b0) begin
      _zz_io_frame_payload_last_1 = 1'b0;
    end
  end

  assign io_frame_valid = fifoPop_valid;
  assign _zz_io_frame_payload_fragment_r = fifoPop_payload_fragment;
  assign _zz_io_frame_payload_fragment_r_1 = _zz__zz_io_frame_payload_fragment_r_1;
  assign io_frame_payload_fragment_r = _zz_io_frame_payload_fragment_r_1[4 : 0];
  assign io_frame_payload_fragment_g = _zz_io_frame_payload_fragment_r_1[10 : 5];
  assign io_frame_payload_fragment_b = _zz_io_frame_payload_fragment_r_1[15 : 11];
  assign io_frame_payload_last = (fifoPop_payload_last && _zz_io_frame_payload_last_3);
  assign fifoPop_ready = (io_frame_ready && _zz_io_frame_payload_last_3);
  always @(posedge vgaClk or posedge resetCtrl_vgaReset) begin
    if(resetCtrl_vgaReset) begin
      pendingMemCmd_value <= 3'b000;
      pendingMemRsp <= 6'h0;
      isActive <= 1'b0;
      cmdActive <= 1'b0;
      rspArea_frameClockArea_popBeatCounter_value <= 3'b000;
      rspArea_frameClockArea_popCmdGray <= 7'h0;
      _zz_when_Utils_l367 <= 1'b1;
      rspArea_pushCmdGray <= 7'h0;
      _zz_when_Utils_l367_8 <= 1'b1;
      _zz_io_frame_payload_last_2 <= 1'b0;
    end else begin
      pendingMemCmd_value <= pendingMemCmd_valueNext;
      pendingMemRsp <= _zz_pendingMemRsp;
      if(when_VideoDma_l94) begin
        if(io_start) begin
          isActive <= 1'b1;
          cmdActive <= 1'b1;
        end
      end else begin
        if(cmdActive) begin
          if(when_VideoDma_l102) begin
            if(when_VideoDma_l104) begin
              cmdActive <= 1'b0;
            end
          end
        end else begin
          if(when_VideoDma_l108) begin
            isActive <= 1'b0;
          end
        end
      end
      rspArea_frameClockArea_popBeatCounter_value <= rspArea_frameClockArea_popBeatCounter_valueNext;
      if(rspArea_frameClockArea_popBeatCounter_willOverflow) begin
        if(when_Utils_l367) begin
          rspArea_frameClockArea_popCmdGray[0] <= (! rspArea_frameClockArea_popCmdGray[0]);
        end
        if(when_Utils_l367_1) begin
          rspArea_frameClockArea_popCmdGray[1] <= (! rspArea_frameClockArea_popCmdGray[1]);
        end
        if(when_Utils_l367_2) begin
          rspArea_frameClockArea_popCmdGray[2] <= (! rspArea_frameClockArea_popCmdGray[2]);
        end
        if(when_Utils_l367_3) begin
          rspArea_frameClockArea_popCmdGray[3] <= (! rspArea_frameClockArea_popCmdGray[3]);
        end
        if(when_Utils_l367_4) begin
          rspArea_frameClockArea_popCmdGray[4] <= (! rspArea_frameClockArea_popCmdGray[4]);
        end
        if(when_Utils_l367_5) begin
          rspArea_frameClockArea_popCmdGray[5] <= (! rspArea_frameClockArea_popCmdGray[5]);
        end
        if(when_Utils_l367_6) begin
          rspArea_frameClockArea_popCmdGray[6] <= (! rspArea_frameClockArea_popCmdGray[6]);
        end
        _zz_when_Utils_l367 <= (! _zz_when_Utils_l367);
      end
      if(io_mem_cmd_fire_3) begin
        if(when_Utils_l367_7) begin
          rspArea_pushCmdGray[0] <= (! rspArea_pushCmdGray[0]);
        end
        if(when_Utils_l367_8) begin
          rspArea_pushCmdGray[1] <= (! rspArea_pushCmdGray[1]);
        end
        if(when_Utils_l367_9) begin
          rspArea_pushCmdGray[2] <= (! rspArea_pushCmdGray[2]);
        end
        if(when_Utils_l367_10) begin
          rspArea_pushCmdGray[3] <= (! rspArea_pushCmdGray[3]);
        end
        if(when_Utils_l367_11) begin
          rspArea_pushCmdGray[4] <= (! rspArea_pushCmdGray[4]);
        end
        if(when_Utils_l367_12) begin
          rspArea_pushCmdGray[5] <= (! rspArea_pushCmdGray[5]);
        end
        if(when_Utils_l367_13) begin
          rspArea_pushCmdGray[6] <= (! rspArea_pushCmdGray[6]);
        end
        _zz_when_Utils_l367_8 <= (! _zz_when_Utils_l367_8);
      end
      _zz_io_frame_payload_last_2 <= _zz_io_frame_payload_last_1;
    end
  end

  always @(posedge vgaClk) begin
    if(when_VideoDma_l94) begin
      if(io_start) begin
        memCmdCounter <= 15'h0;
      end
    end
    if(io_mem_cmd_fire_2) begin
      memCmdCounter <= (memCmdCounter + 15'h0001);
    end
  end


endmodule

module SdramCtrl (
  input               io_bus_cmd_valid,
  output reg          io_bus_cmd_ready,
  input      [20:0]   io_bus_cmd_payload_address,
  input               io_bus_cmd_payload_write,
  input      [31:0]   io_bus_cmd_payload_data,
  input      [3:0]    io_bus_cmd_payload_mask,
  input      [3:0]    io_bus_cmd_payload_context_id,
  input               io_bus_cmd_payload_context_last,
  output              io_bus_rsp_valid,
  input               io_bus_rsp_ready,
  output     [31:0]   io_bus_rsp_payload_data,
  output     [3:0]    io_bus_rsp_payload_context_id,
  output              io_bus_rsp_payload_context_last,
  output     [10:0]   io_sdram_ADDR,
  output     [1:0]    io_sdram_BA,
  input      [31:0]   io_sdram_DQ_read,
  output     [31:0]   io_sdram_DQ_write,
  output     [31:0]   io_sdram_DQ_writeEnable,
  output     [3:0]    io_sdram_DQM,
  output              io_sdram_CASn,
  output              io_sdram_CKE,
  output              io_sdram_CSn,
  output              io_sdram_RASn,
  output              io_sdram_WEn,
  input               sdramCtrlClk,
  input               resetCtrl_sdramReset
);
  localparam SdramCtrlBackendTask_MODE = 3'd0;
  localparam SdramCtrlBackendTask_PRECHARGE_ALL = 3'd1;
  localparam SdramCtrlBackendTask_PRECHARGE_SINGLE = 3'd2;
  localparam SdramCtrlBackendTask_REFRESH = 3'd3;
  localparam SdramCtrlBackendTask_ACTIVE = 3'd4;
  localparam SdramCtrlBackendTask_READ = 3'd5;
  localparam SdramCtrlBackendTask_WRITE = 3'd6;
  localparam SdramCtrlFrontendState_BOOT_PRECHARGE = 2'd0;
  localparam SdramCtrlFrontendState_BOOT_REFRESH = 2'd1;
  localparam SdramCtrlFrontendState_BOOT_MODE = 2'd2;
  localparam SdramCtrlFrontendState_RUN = 2'd3;

  wire                chip_backupIn_fifo_io_push_ready;
  wire                chip_backupIn_fifo_io_pop_valid;
  wire       [31:0]   chip_backupIn_fifo_io_pop_payload_data;
  wire       [3:0]    chip_backupIn_fifo_io_pop_payload_context_id;
  wire                chip_backupIn_fifo_io_pop_payload_context_last;
  wire       [1:0]    chip_backupIn_fifo_io_occupancy;
  wire       [8:0]    _zz_refresh_counter_valueNext;
  wire       [0:0]    _zz_refresh_counter_valueNext_1;
  wire       [2:0]    _zz_frontend_bootRefreshCounter_valueNext;
  wire       [0:0]    _zz_frontend_bootRefreshCounter_valueNext_1;
  reg                 _zz__zz_when_SdramCtrl_l224;
  reg        [10:0]   _zz_when_SdramCtrl_l224_1;
  reg                 _zz_bubbleInserter_insertBubble;
  reg                 _zz_bubbleInserter_insertBubble_1;
  wire                refresh_counter_willIncrement;
  wire                refresh_counter_willClear;
  reg        [8:0]    refresh_counter_valueNext;
  reg        [8:0]    refresh_counter_value;
  wire                refresh_counter_willOverflowIfInc;
  wire                refresh_counter_willOverflow;
  reg                 refresh_pending;
  reg        [13:0]   powerup_counter;
  reg                 powerup_done;
  wire                when_SdramCtrl_l146;
  wire       [13:0]   _zz_when_SdramCtrl_l148;
  wire                when_SdramCtrl_l148;
  reg                 frontend_banks_0_active;
  reg        [10:0]   frontend_banks_0_row;
  reg                 frontend_banks_1_active;
  reg        [10:0]   frontend_banks_1_row;
  reg                 frontend_banks_2_active;
  reg        [10:0]   frontend_banks_2_row;
  reg                 frontend_banks_3_active;
  reg        [10:0]   frontend_banks_3_row;
  wire       [7:0]    frontend_address_column;
  wire       [1:0]    frontend_address_bank;
  wire       [10:0]   frontend_address_row;
  wire       [20:0]   _zz_frontend_address_column;
  reg                 frontend_rsp_valid;
  reg                 frontend_rsp_ready;
  reg        [2:0]    frontend_rsp_payload_task;
  wire       [1:0]    frontend_rsp_payload_bank;
  reg        [10:0]   frontend_rsp_payload_rowColumn;
  wire       [31:0]   frontend_rsp_payload_data;
  wire       [3:0]    frontend_rsp_payload_mask;
  wire       [3:0]    frontend_rsp_payload_context_id;
  wire                frontend_rsp_payload_context_last;
  reg        [1:0]    frontend_state;
  reg                 frontend_bootRefreshCounter_willIncrement;
  wire                frontend_bootRefreshCounter_willClear;
  reg        [2:0]    frontend_bootRefreshCounter_valueNext;
  reg        [2:0]    frontend_bootRefreshCounter_value;
  wire                frontend_bootRefreshCounter_willOverflowIfInc;
  wire                frontend_bootRefreshCounter_willOverflow;
  wire                when_SdramCtrl_l210;
  wire                _zz_when_SdramCtrl_l224;
  wire       [3:0]    _zz_1;
  wire                _zz_2;
  wire                _zz_3;
  wire                _zz_4;
  wire                _zz_5;
  wire                when_SdramCtrl_l224;
  wire                when_SdramCtrl_l229;
  wire                frontend_rsp_cmd_valid;
  wire                frontend_rsp_cmd_ready;
  wire       [2:0]    frontend_rsp_cmd_payload_task;
  wire       [1:0]    frontend_rsp_cmd_payload_bank;
  wire       [10:0]   frontend_rsp_cmd_payload_rowColumn;
  wire       [31:0]   frontend_rsp_cmd_payload_data;
  wire       [3:0]    frontend_rsp_cmd_payload_mask;
  wire       [3:0]    frontend_rsp_cmd_payload_context_id;
  wire                frontend_rsp_cmd_payload_context_last;
  reg                 frontend_rsp_rValid;
  reg        [2:0]    frontend_rsp_rData_task;
  reg        [1:0]    frontend_rsp_rData_bank;
  reg        [10:0]   frontend_rsp_rData_rowColumn;
  reg        [31:0]   frontend_rsp_rData_data;
  reg        [3:0]    frontend_rsp_rData_mask;
  reg        [3:0]    frontend_rsp_rData_context_id;
  reg                 frontend_rsp_rData_context_last;
  wire                when_Stream_l342;
  wire                bubbleInserter_rsp_valid;
  wire                bubbleInserter_rsp_ready;
  wire       [2:0]    bubbleInserter_rsp_payload_task;
  wire       [1:0]    bubbleInserter_rsp_payload_bank;
  wire       [10:0]   bubbleInserter_rsp_payload_rowColumn;
  wire       [31:0]   bubbleInserter_rsp_payload_data;
  wire       [3:0]    bubbleInserter_rsp_payload_mask;
  wire       [3:0]    bubbleInserter_rsp_payload_context_id;
  wire                bubbleInserter_rsp_payload_context_last;
  reg                 bubbleInserter_insertBubble;
  wire                _zz_frontend_rsp_cmd_ready;
  wire       [2:0]    _zz_bubbleInserter_rsp_payload_task;
  reg        [0:0]    bubbleInserter_timings_read_counter;
  wire                bubbleInserter_timings_read_busy;
  wire                when_SdramCtrl_l256;
  reg        [2:0]    bubbleInserter_timings_write_counter;
  wire                bubbleInserter_timings_write_busy;
  wire                when_SdramCtrl_l256_1;
  reg        [3:0]    bubbleInserter_timings_banks_0_precharge_counter;
  wire                bubbleInserter_timings_banks_0_precharge_busy;
  wire                when_SdramCtrl_l256_2;
  reg        [2:0]    bubbleInserter_timings_banks_0_active_counter;
  wire                bubbleInserter_timings_banks_0_active_busy;
  wire                when_SdramCtrl_l256_3;
  reg        [3:0]    bubbleInserter_timings_banks_1_precharge_counter;
  wire                bubbleInserter_timings_banks_1_precharge_busy;
  wire                when_SdramCtrl_l256_4;
  reg        [2:0]    bubbleInserter_timings_banks_1_active_counter;
  wire                bubbleInserter_timings_banks_1_active_busy;
  wire                when_SdramCtrl_l256_5;
  reg        [3:0]    bubbleInserter_timings_banks_2_precharge_counter;
  wire                bubbleInserter_timings_banks_2_precharge_busy;
  wire                when_SdramCtrl_l256_6;
  reg        [2:0]    bubbleInserter_timings_banks_2_active_counter;
  wire                bubbleInserter_timings_banks_2_active_busy;
  wire                when_SdramCtrl_l256_7;
  reg        [3:0]    bubbleInserter_timings_banks_3_precharge_counter;
  wire                bubbleInserter_timings_banks_3_precharge_busy;
  wire                when_SdramCtrl_l256_8;
  reg        [2:0]    bubbleInserter_timings_banks_3_active_counter;
  wire                bubbleInserter_timings_banks_3_active_busy;
  wire                when_SdramCtrl_l256_9;
  wire                when_SdramCtrl_l265;
  wire                when_SdramCtrl_l265_1;
  wire                when_SdramCtrl_l265_2;
  wire                when_SdramCtrl_l265_3;
  wire                when_SdramCtrl_l265_4;
  wire                when_Utils_l895;
  wire                when_SdramCtrl_l265_5;
  wire                when_Utils_l895_1;
  wire                when_SdramCtrl_l265_6;
  wire                when_Utils_l895_2;
  wire                when_SdramCtrl_l265_7;
  wire                when_Utils_l895_3;
  wire                when_SdramCtrl_l265_8;
  wire                when_SdramCtrl_l265_9;
  wire                when_SdramCtrl_l265_10;
  wire                when_SdramCtrl_l265_11;
  wire                when_SdramCtrl_l265_12;
  wire                when_SdramCtrl_l265_13;
  wire                when_Utils_l895_4;
  wire                when_SdramCtrl_l265_14;
  wire                when_Utils_l895_5;
  wire                when_SdramCtrl_l265_15;
  wire                when_Utils_l895_6;
  wire                when_SdramCtrl_l265_16;
  wire                when_Utils_l895_7;
  wire                when_SdramCtrl_l265_17;
  wire                when_Utils_l895_8;
  wire                when_SdramCtrl_l265_18;
  wire                when_Utils_l895_9;
  wire                when_SdramCtrl_l265_19;
  wire                when_Utils_l895_10;
  wire                when_SdramCtrl_l265_20;
  wire                when_Utils_l895_11;
  wire                when_SdramCtrl_l265_21;
  wire                when_SdramCtrl_l265_22;
  wire                when_Utils_l895_12;
  wire                when_SdramCtrl_l265_23;
  wire                when_Utils_l895_13;
  wire                when_SdramCtrl_l265_24;
  wire                when_Utils_l895_14;
  wire                when_SdramCtrl_l265_25;
  wire                when_Utils_l895_15;
  wire                when_SdramCtrl_l265_26;
  wire                chip_cmd_valid;
  wire                chip_cmd_ready;
  wire       [2:0]    chip_cmd_payload_task;
  wire       [1:0]    chip_cmd_payload_bank;
  wire       [10:0]   chip_cmd_payload_rowColumn;
  wire       [31:0]   chip_cmd_payload_data;
  wire       [3:0]    chip_cmd_payload_mask;
  wire       [3:0]    chip_cmd_payload_context_id;
  wire                chip_cmd_payload_context_last;
  reg        [10:0]   chip_sdram_ADDR;
  reg        [1:0]    chip_sdram_BA;
  reg        [31:0]   chip_sdram_DQ_read;
  reg        [31:0]   chip_sdram_DQ_write;
  reg        [31:0]   chip_sdram_DQ_writeEnable;
  reg        [3:0]    chip_sdram_DQM;
  reg                 chip_sdram_CASn;
  reg                 chip_sdram_CKE;
  reg                 chip_sdram_CSn;
  reg                 chip_sdram_RASn;
  reg                 chip_sdram_WEn;
  wire                chip_remoteCke;
  wire                chip_readHistory_0;
  wire                chip_readHistory_1;
  wire                chip_readHistory_2;
  wire                chip_readHistory_3;
  wire                chip_readHistory_4;
  wire                chip_readHistory_5;
  wire                _zz_chip_readHistory_0;
  reg                 _zz_chip_readHistory_1;
  reg                 _zz_chip_readHistory_2;
  reg                 _zz_chip_readHistory_3;
  reg                 _zz_chip_readHistory_4;
  reg                 _zz_chip_readHistory_5;
  reg        [3:0]    chip_cmd_payload_context_delay_1_id;
  reg                 chip_cmd_payload_context_delay_1_last;
  reg        [3:0]    chip_cmd_payload_context_delay_2_id;
  reg                 chip_cmd_payload_context_delay_2_last;
  reg        [3:0]    chip_cmd_payload_context_delay_3_id;
  reg                 chip_cmd_payload_context_delay_3_last;
  reg        [3:0]    chip_cmd_payload_context_delay_4_id;
  reg                 chip_cmd_payload_context_delay_4_last;
  reg        [3:0]    chip_contextDelayed_id;
  reg                 chip_contextDelayed_last;
  wire                chip_sdramCkeNext;
  reg                 chip_sdramCkeInternal;
  reg                 chip_sdramCkeInternal_regNext;
  wire                _zz_chip_sdram_DQM;
  wire                chip_backupIn_valid;
  wire                chip_backupIn_ready;
  wire       [31:0]   chip_backupIn_payload_data;
  wire       [3:0]    chip_backupIn_payload_context_id;
  wire                chip_backupIn_payload_context_last;
  `ifndef SYNTHESIS
  reg [127:0] frontend_rsp_payload_task_string;
  reg [111:0] frontend_state_string;
  reg [127:0] frontend_rsp_cmd_payload_task_string;
  reg [127:0] frontend_rsp_rData_task_string;
  reg [127:0] bubbleInserter_rsp_payload_task_string;
  reg [127:0] _zz_bubbleInserter_rsp_payload_task_string;
  reg [127:0] chip_cmd_payload_task_string;
  `endif


  assign _zz_refresh_counter_valueNext_1 = refresh_counter_willIncrement;
  assign _zz_refresh_counter_valueNext = {8'd0, _zz_refresh_counter_valueNext_1};
  assign _zz_frontend_bootRefreshCounter_valueNext_1 = frontend_bootRefreshCounter_willIncrement;
  assign _zz_frontend_bootRefreshCounter_valueNext = {2'd0, _zz_frontend_bootRefreshCounter_valueNext_1};
  StreamFifoLowLatency chip_backupIn_fifo (
    .io_push_valid                   (chip_backupIn_valid                                ), //i
    .io_push_ready                   (chip_backupIn_fifo_io_push_ready                   ), //o
    .io_push_payload_data            (chip_backupIn_payload_data[31:0]                   ), //i
    .io_push_payload_context_id      (chip_backupIn_payload_context_id[3:0]              ), //i
    .io_push_payload_context_last    (chip_backupIn_payload_context_last                 ), //i
    .io_pop_valid                    (chip_backupIn_fifo_io_pop_valid                    ), //o
    .io_pop_ready                    (io_bus_rsp_ready                                   ), //i
    .io_pop_payload_data             (chip_backupIn_fifo_io_pop_payload_data[31:0]       ), //o
    .io_pop_payload_context_id       (chip_backupIn_fifo_io_pop_payload_context_id[3:0]  ), //o
    .io_pop_payload_context_last     (chip_backupIn_fifo_io_pop_payload_context_last     ), //o
    .io_flush                        (1'b0                                               ), //i
    .io_occupancy                    (chip_backupIn_fifo_io_occupancy[1:0]               ), //o
    .sdramCtrlClk                    (sdramCtrlClk                                       ), //i
    .resetCtrl_sdramReset            (resetCtrl_sdramReset                               )  //i
  );
  always @(*) begin
    case(frontend_address_bank)
      2'b00 : begin
        _zz__zz_when_SdramCtrl_l224 = frontend_banks_0_active;
        _zz_when_SdramCtrl_l224_1 = frontend_banks_0_row;
      end
      2'b01 : begin
        _zz__zz_when_SdramCtrl_l224 = frontend_banks_1_active;
        _zz_when_SdramCtrl_l224_1 = frontend_banks_1_row;
      end
      2'b10 : begin
        _zz__zz_when_SdramCtrl_l224 = frontend_banks_2_active;
        _zz_when_SdramCtrl_l224_1 = frontend_banks_2_row;
      end
      default : begin
        _zz__zz_when_SdramCtrl_l224 = frontend_banks_3_active;
        _zz_when_SdramCtrl_l224_1 = frontend_banks_3_row;
      end
    endcase
  end

  always @(*) begin
    case(frontend_rsp_cmd_payload_bank)
      2'b00 : begin
        _zz_bubbleInserter_insertBubble = bubbleInserter_timings_banks_0_precharge_busy;
        _zz_bubbleInserter_insertBubble_1 = bubbleInserter_timings_banks_0_active_busy;
      end
      2'b01 : begin
        _zz_bubbleInserter_insertBubble = bubbleInserter_timings_banks_1_precharge_busy;
        _zz_bubbleInserter_insertBubble_1 = bubbleInserter_timings_banks_1_active_busy;
      end
      2'b10 : begin
        _zz_bubbleInserter_insertBubble = bubbleInserter_timings_banks_2_precharge_busy;
        _zz_bubbleInserter_insertBubble_1 = bubbleInserter_timings_banks_2_active_busy;
      end
      default : begin
        _zz_bubbleInserter_insertBubble = bubbleInserter_timings_banks_3_precharge_busy;
        _zz_bubbleInserter_insertBubble_1 = bubbleInserter_timings_banks_3_active_busy;
      end
    endcase
  end

  `ifndef SYNTHESIS
  always @(*) begin
    case(frontend_rsp_payload_task)
      SdramCtrlBackendTask_MODE : frontend_rsp_payload_task_string = "MODE            ";
      SdramCtrlBackendTask_PRECHARGE_ALL : frontend_rsp_payload_task_string = "PRECHARGE_ALL   ";
      SdramCtrlBackendTask_PRECHARGE_SINGLE : frontend_rsp_payload_task_string = "PRECHARGE_SINGLE";
      SdramCtrlBackendTask_REFRESH : frontend_rsp_payload_task_string = "REFRESH         ";
      SdramCtrlBackendTask_ACTIVE : frontend_rsp_payload_task_string = "ACTIVE          ";
      SdramCtrlBackendTask_READ : frontend_rsp_payload_task_string = "READ            ";
      SdramCtrlBackendTask_WRITE : frontend_rsp_payload_task_string = "WRITE           ";
      default : frontend_rsp_payload_task_string = "????????????????";
    endcase
  end
  always @(*) begin
    case(frontend_state)
      SdramCtrlFrontendState_BOOT_PRECHARGE : frontend_state_string = "BOOT_PRECHARGE";
      SdramCtrlFrontendState_BOOT_REFRESH : frontend_state_string = "BOOT_REFRESH  ";
      SdramCtrlFrontendState_BOOT_MODE : frontend_state_string = "BOOT_MODE     ";
      SdramCtrlFrontendState_RUN : frontend_state_string = "RUN           ";
      default : frontend_state_string = "??????????????";
    endcase
  end
  always @(*) begin
    case(frontend_rsp_cmd_payload_task)
      SdramCtrlBackendTask_MODE : frontend_rsp_cmd_payload_task_string = "MODE            ";
      SdramCtrlBackendTask_PRECHARGE_ALL : frontend_rsp_cmd_payload_task_string = "PRECHARGE_ALL   ";
      SdramCtrlBackendTask_PRECHARGE_SINGLE : frontend_rsp_cmd_payload_task_string = "PRECHARGE_SINGLE";
      SdramCtrlBackendTask_REFRESH : frontend_rsp_cmd_payload_task_string = "REFRESH         ";
      SdramCtrlBackendTask_ACTIVE : frontend_rsp_cmd_payload_task_string = "ACTIVE          ";
      SdramCtrlBackendTask_READ : frontend_rsp_cmd_payload_task_string = "READ            ";
      SdramCtrlBackendTask_WRITE : frontend_rsp_cmd_payload_task_string = "WRITE           ";
      default : frontend_rsp_cmd_payload_task_string = "????????????????";
    endcase
  end
  always @(*) begin
    case(frontend_rsp_rData_task)
      SdramCtrlBackendTask_MODE : frontend_rsp_rData_task_string = "MODE            ";
      SdramCtrlBackendTask_PRECHARGE_ALL : frontend_rsp_rData_task_string = "PRECHARGE_ALL   ";
      SdramCtrlBackendTask_PRECHARGE_SINGLE : frontend_rsp_rData_task_string = "PRECHARGE_SINGLE";
      SdramCtrlBackendTask_REFRESH : frontend_rsp_rData_task_string = "REFRESH         ";
      SdramCtrlBackendTask_ACTIVE : frontend_rsp_rData_task_string = "ACTIVE          ";
      SdramCtrlBackendTask_READ : frontend_rsp_rData_task_string = "READ            ";
      SdramCtrlBackendTask_WRITE : frontend_rsp_rData_task_string = "WRITE           ";
      default : frontend_rsp_rData_task_string = "????????????????";
    endcase
  end
  always @(*) begin
    case(bubbleInserter_rsp_payload_task)
      SdramCtrlBackendTask_MODE : bubbleInserter_rsp_payload_task_string = "MODE            ";
      SdramCtrlBackendTask_PRECHARGE_ALL : bubbleInserter_rsp_payload_task_string = "PRECHARGE_ALL   ";
      SdramCtrlBackendTask_PRECHARGE_SINGLE : bubbleInserter_rsp_payload_task_string = "PRECHARGE_SINGLE";
      SdramCtrlBackendTask_REFRESH : bubbleInserter_rsp_payload_task_string = "REFRESH         ";
      SdramCtrlBackendTask_ACTIVE : bubbleInserter_rsp_payload_task_string = "ACTIVE          ";
      SdramCtrlBackendTask_READ : bubbleInserter_rsp_payload_task_string = "READ            ";
      SdramCtrlBackendTask_WRITE : bubbleInserter_rsp_payload_task_string = "WRITE           ";
      default : bubbleInserter_rsp_payload_task_string = "????????????????";
    endcase
  end
  always @(*) begin
    case(_zz_bubbleInserter_rsp_payload_task)
      SdramCtrlBackendTask_MODE : _zz_bubbleInserter_rsp_payload_task_string = "MODE            ";
      SdramCtrlBackendTask_PRECHARGE_ALL : _zz_bubbleInserter_rsp_payload_task_string = "PRECHARGE_ALL   ";
      SdramCtrlBackendTask_PRECHARGE_SINGLE : _zz_bubbleInserter_rsp_payload_task_string = "PRECHARGE_SINGLE";
      SdramCtrlBackendTask_REFRESH : _zz_bubbleInserter_rsp_payload_task_string = "REFRESH         ";
      SdramCtrlBackendTask_ACTIVE : _zz_bubbleInserter_rsp_payload_task_string = "ACTIVE          ";
      SdramCtrlBackendTask_READ : _zz_bubbleInserter_rsp_payload_task_string = "READ            ";
      SdramCtrlBackendTask_WRITE : _zz_bubbleInserter_rsp_payload_task_string = "WRITE           ";
      default : _zz_bubbleInserter_rsp_payload_task_string = "????????????????";
    endcase
  end
  always @(*) begin
    case(chip_cmd_payload_task)
      SdramCtrlBackendTask_MODE : chip_cmd_payload_task_string = "MODE            ";
      SdramCtrlBackendTask_PRECHARGE_ALL : chip_cmd_payload_task_string = "PRECHARGE_ALL   ";
      SdramCtrlBackendTask_PRECHARGE_SINGLE : chip_cmd_payload_task_string = "PRECHARGE_SINGLE";
      SdramCtrlBackendTask_REFRESH : chip_cmd_payload_task_string = "REFRESH         ";
      SdramCtrlBackendTask_ACTIVE : chip_cmd_payload_task_string = "ACTIVE          ";
      SdramCtrlBackendTask_READ : chip_cmd_payload_task_string = "READ            ";
      SdramCtrlBackendTask_WRITE : chip_cmd_payload_task_string = "WRITE           ";
      default : chip_cmd_payload_task_string = "????????????????";
    endcase
  end
  `endif

  assign refresh_counter_willClear = 1'b0;
  assign refresh_counter_willOverflowIfInc = (refresh_counter_value == 9'h176);
  assign refresh_counter_willOverflow = (refresh_counter_willOverflowIfInc && refresh_counter_willIncrement);
  always @(*) begin
    if(refresh_counter_willOverflow) begin
      refresh_counter_valueNext = 9'h0;
    end else begin
      refresh_counter_valueNext = (refresh_counter_value + _zz_refresh_counter_valueNext);
    end
    if(refresh_counter_willClear) begin
      refresh_counter_valueNext = 9'h0;
    end
  end

  assign refresh_counter_willIncrement = 1'b1;
  assign when_SdramCtrl_l146 = (! powerup_done);
  assign _zz_when_SdramCtrl_l148[13 : 0] = 14'h3fff;
  assign when_SdramCtrl_l148 = (powerup_counter == _zz_when_SdramCtrl_l148);
  assign _zz_frontend_address_column = io_bus_cmd_payload_address;
  assign frontend_address_column = _zz_frontend_address_column[7 : 0];
  assign frontend_address_bank = _zz_frontend_address_column[9 : 8];
  assign frontend_address_row = _zz_frontend_address_column[20 : 10];
  always @(*) begin
    frontend_rsp_valid = 1'b0;
    case(frontend_state)
      SdramCtrlFrontendState_BOOT_PRECHARGE : begin
        if(powerup_done) begin
          frontend_rsp_valid = 1'b1;
        end
      end
      SdramCtrlFrontendState_BOOT_REFRESH : begin
        frontend_rsp_valid = 1'b1;
      end
      SdramCtrlFrontendState_BOOT_MODE : begin
        frontend_rsp_valid = 1'b1;
      end
      default : begin
        if(refresh_pending) begin
          frontend_rsp_valid = 1'b1;
        end else begin
          if(io_bus_cmd_valid) begin
            frontend_rsp_valid = 1'b1;
          end
        end
      end
    endcase
  end

  always @(*) begin
    frontend_rsp_payload_task = SdramCtrlBackendTask_REFRESH;
    case(frontend_state)
      SdramCtrlFrontendState_BOOT_PRECHARGE : begin
        frontend_rsp_payload_task = SdramCtrlBackendTask_PRECHARGE_ALL;
      end
      SdramCtrlFrontendState_BOOT_REFRESH : begin
        frontend_rsp_payload_task = SdramCtrlBackendTask_REFRESH;
      end
      SdramCtrlFrontendState_BOOT_MODE : begin
        frontend_rsp_payload_task = SdramCtrlBackendTask_MODE;
      end
      default : begin
        if(refresh_pending) begin
          if(when_SdramCtrl_l210) begin
            frontend_rsp_payload_task = SdramCtrlBackendTask_PRECHARGE_ALL;
          end else begin
            frontend_rsp_payload_task = SdramCtrlBackendTask_REFRESH;
          end
        end else begin
          if(io_bus_cmd_valid) begin
            if(when_SdramCtrl_l224) begin
              frontend_rsp_payload_task = SdramCtrlBackendTask_PRECHARGE_SINGLE;
            end else begin
              if(when_SdramCtrl_l229) begin
                frontend_rsp_payload_task = SdramCtrlBackendTask_ACTIVE;
              end else begin
                frontend_rsp_payload_task = (io_bus_cmd_payload_write ? SdramCtrlBackendTask_WRITE : SdramCtrlBackendTask_READ);
              end
            end
          end
        end
      end
    endcase
  end

  assign frontend_rsp_payload_bank = frontend_address_bank;
  always @(*) begin
    frontend_rsp_payload_rowColumn = frontend_address_row;
    case(frontend_state)
      SdramCtrlFrontendState_BOOT_PRECHARGE : begin
      end
      SdramCtrlFrontendState_BOOT_REFRESH : begin
      end
      SdramCtrlFrontendState_BOOT_MODE : begin
      end
      default : begin
        if(!refresh_pending) begin
          if(io_bus_cmd_valid) begin
            if(!when_SdramCtrl_l224) begin
              if(!when_SdramCtrl_l229) begin
                frontend_rsp_payload_rowColumn = {3'd0, frontend_address_column};
              end
            end
          end
        end
      end
    endcase
  end

  assign frontend_rsp_payload_data = io_bus_cmd_payload_data;
  assign frontend_rsp_payload_mask = io_bus_cmd_payload_mask;
  assign frontend_rsp_payload_context_id = io_bus_cmd_payload_context_id;
  assign frontend_rsp_payload_context_last = io_bus_cmd_payload_context_last;
  always @(*) begin
    io_bus_cmd_ready = 1'b0;
    case(frontend_state)
      SdramCtrlFrontendState_BOOT_PRECHARGE : begin
      end
      SdramCtrlFrontendState_BOOT_REFRESH : begin
      end
      SdramCtrlFrontendState_BOOT_MODE : begin
      end
      default : begin
        if(!refresh_pending) begin
          if(io_bus_cmd_valid) begin
            if(!when_SdramCtrl_l224) begin
              if(!when_SdramCtrl_l229) begin
                io_bus_cmd_ready = frontend_rsp_ready;
              end
            end
          end
        end
      end
    endcase
  end

  always @(*) begin
    frontend_bootRefreshCounter_willIncrement = 1'b0;
    case(frontend_state)
      SdramCtrlFrontendState_BOOT_PRECHARGE : begin
      end
      SdramCtrlFrontendState_BOOT_REFRESH : begin
        if(frontend_rsp_ready) begin
          frontend_bootRefreshCounter_willIncrement = 1'b1;
        end
      end
      SdramCtrlFrontendState_BOOT_MODE : begin
      end
      default : begin
      end
    endcase
  end

  assign frontend_bootRefreshCounter_willClear = 1'b0;
  assign frontend_bootRefreshCounter_willOverflowIfInc = (frontend_bootRefreshCounter_value == 3'b111);
  assign frontend_bootRefreshCounter_willOverflow = (frontend_bootRefreshCounter_willOverflowIfInc && frontend_bootRefreshCounter_willIncrement);
  always @(*) begin
    frontend_bootRefreshCounter_valueNext = (frontend_bootRefreshCounter_value + _zz_frontend_bootRefreshCounter_valueNext);
    if(frontend_bootRefreshCounter_willClear) begin
      frontend_bootRefreshCounter_valueNext = 3'b000;
    end
  end

  assign when_SdramCtrl_l210 = (((frontend_banks_0_active || frontend_banks_1_active) || frontend_banks_2_active) || frontend_banks_3_active);
  assign _zz_when_SdramCtrl_l224 = _zz__zz_when_SdramCtrl_l224;
  assign _zz_1 = ({3'd0,1'b1} <<< frontend_address_bank);
  assign _zz_2 = _zz_1[0];
  assign _zz_3 = _zz_1[1];
  assign _zz_4 = _zz_1[2];
  assign _zz_5 = _zz_1[3];
  assign when_SdramCtrl_l224 = (_zz_when_SdramCtrl_l224 && (_zz_when_SdramCtrl_l224_1 != frontend_address_row));
  assign when_SdramCtrl_l229 = (! _zz_when_SdramCtrl_l224);
  always @(*) begin
    frontend_rsp_ready = frontend_rsp_cmd_ready;
    if(when_Stream_l342) begin
      frontend_rsp_ready = 1'b1;
    end
  end

  assign when_Stream_l342 = (! frontend_rsp_cmd_valid);
  assign frontend_rsp_cmd_valid = frontend_rsp_rValid;
  assign frontend_rsp_cmd_payload_task = frontend_rsp_rData_task;
  assign frontend_rsp_cmd_payload_bank = frontend_rsp_rData_bank;
  assign frontend_rsp_cmd_payload_rowColumn = frontend_rsp_rData_rowColumn;
  assign frontend_rsp_cmd_payload_data = frontend_rsp_rData_data;
  assign frontend_rsp_cmd_payload_mask = frontend_rsp_rData_mask;
  assign frontend_rsp_cmd_payload_context_id = frontend_rsp_rData_context_id;
  assign frontend_rsp_cmd_payload_context_last = frontend_rsp_rData_context_last;
  always @(*) begin
    bubbleInserter_insertBubble = 1'b0;
    if(frontend_rsp_cmd_valid) begin
      case(frontend_rsp_cmd_payload_task)
        SdramCtrlBackendTask_MODE : begin
          bubbleInserter_insertBubble = bubbleInserter_timings_banks_0_active_busy;
        end
        SdramCtrlBackendTask_PRECHARGE_ALL : begin
          bubbleInserter_insertBubble = ({bubbleInserter_timings_banks_3_precharge_busy,{bubbleInserter_timings_banks_2_precharge_busy,{bubbleInserter_timings_banks_1_precharge_busy,bubbleInserter_timings_banks_0_precharge_busy}}} != 4'b0000);
        end
        SdramCtrlBackendTask_PRECHARGE_SINGLE : begin
          bubbleInserter_insertBubble = _zz_bubbleInserter_insertBubble;
        end
        SdramCtrlBackendTask_REFRESH : begin
          bubbleInserter_insertBubble = ({bubbleInserter_timings_banks_3_active_busy,{bubbleInserter_timings_banks_2_active_busy,{bubbleInserter_timings_banks_1_active_busy,bubbleInserter_timings_banks_0_active_busy}}} != 4'b0000);
        end
        SdramCtrlBackendTask_ACTIVE : begin
          bubbleInserter_insertBubble = _zz_bubbleInserter_insertBubble_1;
        end
        SdramCtrlBackendTask_READ : begin
          bubbleInserter_insertBubble = bubbleInserter_timings_read_busy;
        end
        default : begin
          bubbleInserter_insertBubble = bubbleInserter_timings_write_busy;
        end
      endcase
    end
  end

  assign _zz_frontend_rsp_cmd_ready = (! bubbleInserter_insertBubble);
  assign frontend_rsp_cmd_ready = (bubbleInserter_rsp_ready && _zz_frontend_rsp_cmd_ready);
  assign _zz_bubbleInserter_rsp_payload_task = frontend_rsp_cmd_payload_task;
  assign bubbleInserter_rsp_valid = (frontend_rsp_cmd_valid && _zz_frontend_rsp_cmd_ready);
  assign bubbleInserter_rsp_payload_task = _zz_bubbleInserter_rsp_payload_task;
  assign bubbleInserter_rsp_payload_bank = frontend_rsp_cmd_payload_bank;
  assign bubbleInserter_rsp_payload_rowColumn = frontend_rsp_cmd_payload_rowColumn;
  assign bubbleInserter_rsp_payload_data = frontend_rsp_cmd_payload_data;
  assign bubbleInserter_rsp_payload_mask = frontend_rsp_cmd_payload_mask;
  assign bubbleInserter_rsp_payload_context_id = frontend_rsp_cmd_payload_context_id;
  assign bubbleInserter_rsp_payload_context_last = frontend_rsp_cmd_payload_context_last;
  assign bubbleInserter_timings_read_busy = (bubbleInserter_timings_read_counter != 1'b0);
  assign when_SdramCtrl_l256 = (bubbleInserter_timings_read_busy && bubbleInserter_rsp_ready);
  assign bubbleInserter_timings_write_busy = (bubbleInserter_timings_write_counter != 3'b000);
  assign when_SdramCtrl_l256_1 = (bubbleInserter_timings_write_busy && bubbleInserter_rsp_ready);
  assign bubbleInserter_timings_banks_0_precharge_busy = (bubbleInserter_timings_banks_0_precharge_counter != 4'b0000);
  assign when_SdramCtrl_l256_2 = (bubbleInserter_timings_banks_0_precharge_busy && bubbleInserter_rsp_ready);
  assign bubbleInserter_timings_banks_0_active_busy = (bubbleInserter_timings_banks_0_active_counter != 3'b000);
  assign when_SdramCtrl_l256_3 = (bubbleInserter_timings_banks_0_active_busy && bubbleInserter_rsp_ready);
  assign bubbleInserter_timings_banks_1_precharge_busy = (bubbleInserter_timings_banks_1_precharge_counter != 4'b0000);
  assign when_SdramCtrl_l256_4 = (bubbleInserter_timings_banks_1_precharge_busy && bubbleInserter_rsp_ready);
  assign bubbleInserter_timings_banks_1_active_busy = (bubbleInserter_timings_banks_1_active_counter != 3'b000);
  assign when_SdramCtrl_l256_5 = (bubbleInserter_timings_banks_1_active_busy && bubbleInserter_rsp_ready);
  assign bubbleInserter_timings_banks_2_precharge_busy = (bubbleInserter_timings_banks_2_precharge_counter != 4'b0000);
  assign when_SdramCtrl_l256_6 = (bubbleInserter_timings_banks_2_precharge_busy && bubbleInserter_rsp_ready);
  assign bubbleInserter_timings_banks_2_active_busy = (bubbleInserter_timings_banks_2_active_counter != 3'b000);
  assign when_SdramCtrl_l256_7 = (bubbleInserter_timings_banks_2_active_busy && bubbleInserter_rsp_ready);
  assign bubbleInserter_timings_banks_3_precharge_busy = (bubbleInserter_timings_banks_3_precharge_counter != 4'b0000);
  assign when_SdramCtrl_l256_8 = (bubbleInserter_timings_banks_3_precharge_busy && bubbleInserter_rsp_ready);
  assign bubbleInserter_timings_banks_3_active_busy = (bubbleInserter_timings_banks_3_active_counter != 3'b000);
  assign when_SdramCtrl_l256_9 = (bubbleInserter_timings_banks_3_active_busy && bubbleInserter_rsp_ready);
  assign when_SdramCtrl_l265 = (bubbleInserter_timings_banks_0_active_counter <= 3'b111);
  assign when_SdramCtrl_l265_1 = (bubbleInserter_timings_banks_1_active_counter <= 3'b111);
  assign when_SdramCtrl_l265_2 = (bubbleInserter_timings_banks_2_active_counter <= 3'b111);
  assign when_SdramCtrl_l265_3 = (bubbleInserter_timings_banks_3_active_counter <= 3'b111);
  assign when_SdramCtrl_l265_4 = (bubbleInserter_timings_banks_0_active_counter <= 3'b001);
  assign when_Utils_l895 = (frontend_rsp_cmd_payload_bank == 2'b00);
  assign when_SdramCtrl_l265_5 = (bubbleInserter_timings_banks_0_active_counter <= 3'b001);
  assign when_Utils_l895_1 = (frontend_rsp_cmd_payload_bank == 2'b01);
  assign when_SdramCtrl_l265_6 = (bubbleInserter_timings_banks_1_active_counter <= 3'b001);
  assign when_Utils_l895_2 = (frontend_rsp_cmd_payload_bank == 2'b10);
  assign when_SdramCtrl_l265_7 = (bubbleInserter_timings_banks_2_active_counter <= 3'b001);
  assign when_Utils_l895_3 = (frontend_rsp_cmd_payload_bank == 2'b11);
  assign when_SdramCtrl_l265_8 = (bubbleInserter_timings_banks_3_active_counter <= 3'b001);
  assign when_SdramCtrl_l265_9 = (bubbleInserter_timings_banks_0_active_counter <= 3'b011);
  assign when_SdramCtrl_l265_10 = (bubbleInserter_timings_banks_1_active_counter <= 3'b011);
  assign when_SdramCtrl_l265_11 = (bubbleInserter_timings_banks_2_active_counter <= 3'b011);
  assign when_SdramCtrl_l265_12 = (bubbleInserter_timings_banks_3_active_counter <= 3'b011);
  assign when_SdramCtrl_l265_13 = (bubbleInserter_timings_write_counter <= 3'b001);
  assign when_Utils_l895_4 = (frontend_rsp_cmd_payload_bank == 2'b00);
  assign when_SdramCtrl_l265_14 = (bubbleInserter_timings_banks_0_precharge_counter <= 4'b0010);
  assign when_Utils_l895_5 = (frontend_rsp_cmd_payload_bank == 2'b01);
  assign when_SdramCtrl_l265_15 = (bubbleInserter_timings_banks_1_precharge_counter <= 4'b0010);
  assign when_Utils_l895_6 = (frontend_rsp_cmd_payload_bank == 2'b10);
  assign when_SdramCtrl_l265_16 = (bubbleInserter_timings_banks_2_precharge_counter <= 4'b0010);
  assign when_Utils_l895_7 = (frontend_rsp_cmd_payload_bank == 2'b11);
  assign when_SdramCtrl_l265_17 = (bubbleInserter_timings_banks_3_precharge_counter <= 4'b0010);
  assign when_Utils_l895_8 = (frontend_rsp_cmd_payload_bank == 2'b00);
  assign when_SdramCtrl_l265_18 = (bubbleInserter_timings_banks_0_active_counter <= 3'b011);
  assign when_Utils_l895_9 = (frontend_rsp_cmd_payload_bank == 2'b01);
  assign when_SdramCtrl_l265_19 = (bubbleInserter_timings_banks_1_active_counter <= 3'b011);
  assign when_Utils_l895_10 = (frontend_rsp_cmd_payload_bank == 2'b10);
  assign when_SdramCtrl_l265_20 = (bubbleInserter_timings_banks_2_active_counter <= 3'b011);
  assign when_Utils_l895_11 = (frontend_rsp_cmd_payload_bank == 2'b11);
  assign when_SdramCtrl_l265_21 = (bubbleInserter_timings_banks_3_active_counter <= 3'b011);
  assign when_SdramCtrl_l265_22 = (bubbleInserter_timings_write_counter <= 3'b100);
  assign when_Utils_l895_12 = (frontend_rsp_cmd_payload_bank == 2'b00);
  assign when_SdramCtrl_l265_23 = (bubbleInserter_timings_banks_0_precharge_counter <= 4'b1000);
  assign when_Utils_l895_13 = (frontend_rsp_cmd_payload_bank == 2'b01);
  assign when_SdramCtrl_l265_24 = (bubbleInserter_timings_banks_1_precharge_counter <= 4'b1000);
  assign when_Utils_l895_14 = (frontend_rsp_cmd_payload_bank == 2'b10);
  assign when_SdramCtrl_l265_25 = (bubbleInserter_timings_banks_2_precharge_counter <= 4'b1000);
  assign when_Utils_l895_15 = (frontend_rsp_cmd_payload_bank == 2'b11);
  assign when_SdramCtrl_l265_26 = (bubbleInserter_timings_banks_3_precharge_counter <= 4'b1000);
  assign chip_cmd_valid = bubbleInserter_rsp_valid;
  assign bubbleInserter_rsp_ready = chip_cmd_ready;
  assign chip_cmd_payload_task = bubbleInserter_rsp_payload_task;
  assign chip_cmd_payload_bank = bubbleInserter_rsp_payload_bank;
  assign chip_cmd_payload_rowColumn = bubbleInserter_rsp_payload_rowColumn;
  assign chip_cmd_payload_data = bubbleInserter_rsp_payload_data;
  assign chip_cmd_payload_mask = bubbleInserter_rsp_payload_mask;
  assign chip_cmd_payload_context_id = bubbleInserter_rsp_payload_context_id;
  assign chip_cmd_payload_context_last = bubbleInserter_rsp_payload_context_last;
  assign io_sdram_ADDR = chip_sdram_ADDR;
  assign io_sdram_BA = chip_sdram_BA;
  assign io_sdram_DQ_write = chip_sdram_DQ_write;
  assign io_sdram_DQ_writeEnable = chip_sdram_DQ_writeEnable;
  assign io_sdram_DQM = chip_sdram_DQM;
  assign io_sdram_CASn = chip_sdram_CASn;
  assign io_sdram_CKE = chip_sdram_CKE;
  assign io_sdram_CSn = chip_sdram_CSn;
  assign io_sdram_RASn = chip_sdram_RASn;
  assign io_sdram_WEn = chip_sdram_WEn;
  assign _zz_chip_readHistory_0 = (chip_cmd_valid && ((chip_cmd_payload_task == SdramCtrlBackendTask_READ) || 1'b0));
  assign chip_readHistory_0 = _zz_chip_readHistory_0;
  assign chip_readHistory_1 = _zz_chip_readHistory_1;
  assign chip_readHistory_2 = _zz_chip_readHistory_2;
  assign chip_readHistory_3 = _zz_chip_readHistory_3;
  assign chip_readHistory_4 = _zz_chip_readHistory_4;
  assign chip_readHistory_5 = _zz_chip_readHistory_5;
  assign chip_sdramCkeNext = (! (({chip_readHistory_5,{chip_readHistory_4,{chip_readHistory_3,{chip_readHistory_2,{chip_readHistory_1,chip_readHistory_0}}}}} != 6'h0) && (! io_bus_rsp_ready)));
  assign chip_remoteCke = chip_sdramCkeInternal_regNext;
  assign _zz_chip_sdram_DQM = (! chip_readHistory_1);
  assign chip_backupIn_valid = (chip_readHistory_5 && chip_remoteCke);
  assign chip_backupIn_payload_data = chip_sdram_DQ_read;
  assign chip_backupIn_payload_context_id = chip_contextDelayed_id;
  assign chip_backupIn_payload_context_last = chip_contextDelayed_last;
  assign chip_backupIn_ready = chip_backupIn_fifo_io_push_ready;
  assign io_bus_rsp_valid = chip_backupIn_fifo_io_pop_valid;
  assign io_bus_rsp_payload_data = chip_backupIn_fifo_io_pop_payload_data;
  assign io_bus_rsp_payload_context_id = chip_backupIn_fifo_io_pop_payload_context_id;
  assign io_bus_rsp_payload_context_last = chip_backupIn_fifo_io_pop_payload_context_last;
  assign chip_cmd_ready = chip_remoteCke;
  always @(posedge sdramCtrlClk or posedge resetCtrl_sdramReset) begin
    if(resetCtrl_sdramReset) begin
      refresh_counter_value <= 9'h0;
      refresh_pending <= 1'b0;
      powerup_counter <= 14'h0;
      powerup_done <= 1'b0;
      frontend_banks_0_active <= 1'b0;
      frontend_banks_1_active <= 1'b0;
      frontend_banks_2_active <= 1'b0;
      frontend_banks_3_active <= 1'b0;
      frontend_state <= SdramCtrlFrontendState_BOOT_PRECHARGE;
      frontend_bootRefreshCounter_value <= 3'b000;
      frontend_rsp_rValid <= 1'b0;
      bubbleInserter_timings_read_counter <= 1'b0;
      bubbleInserter_timings_write_counter <= 3'b000;
      bubbleInserter_timings_banks_0_precharge_counter <= 4'b0000;
      bubbleInserter_timings_banks_0_active_counter <= 3'b000;
      bubbleInserter_timings_banks_1_precharge_counter <= 4'b0000;
      bubbleInserter_timings_banks_1_active_counter <= 3'b000;
      bubbleInserter_timings_banks_2_precharge_counter <= 4'b0000;
      bubbleInserter_timings_banks_2_active_counter <= 3'b000;
      bubbleInserter_timings_banks_3_precharge_counter <= 4'b0000;
      bubbleInserter_timings_banks_3_active_counter <= 3'b000;
      _zz_chip_readHistory_1 <= 1'b0;
      _zz_chip_readHistory_2 <= 1'b0;
      _zz_chip_readHistory_3 <= 1'b0;
      _zz_chip_readHistory_4 <= 1'b0;
      _zz_chip_readHistory_5 <= 1'b0;
      chip_sdramCkeInternal <= 1'b1;
      chip_sdramCkeInternal_regNext <= 1'b1;
    end else begin
      refresh_counter_value <= refresh_counter_valueNext;
      if(refresh_counter_willOverflow) begin
        refresh_pending <= 1'b1;
      end
      if(when_SdramCtrl_l146) begin
        powerup_counter <= (powerup_counter + 14'h0001);
        if(when_SdramCtrl_l148) begin
          powerup_done <= 1'b1;
        end
      end
      frontend_bootRefreshCounter_value <= frontend_bootRefreshCounter_valueNext;
      case(frontend_state)
        SdramCtrlFrontendState_BOOT_PRECHARGE : begin
          if(powerup_done) begin
            if(frontend_rsp_ready) begin
              frontend_state <= SdramCtrlFrontendState_BOOT_REFRESH;
            end
          end
        end
        SdramCtrlFrontendState_BOOT_REFRESH : begin
          if(frontend_rsp_ready) begin
            if(frontend_bootRefreshCounter_willOverflowIfInc) begin
              frontend_state <= SdramCtrlFrontendState_BOOT_MODE;
            end
          end
        end
        SdramCtrlFrontendState_BOOT_MODE : begin
          if(frontend_rsp_ready) begin
            frontend_state <= SdramCtrlFrontendState_RUN;
          end
        end
        default : begin
          if(refresh_pending) begin
            if(when_SdramCtrl_l210) begin
              if(frontend_rsp_ready) begin
                frontend_banks_0_active <= 1'b0;
                frontend_banks_1_active <= 1'b0;
                frontend_banks_2_active <= 1'b0;
                frontend_banks_3_active <= 1'b0;
              end
            end else begin
              if(frontend_rsp_ready) begin
                refresh_pending <= 1'b0;
              end
            end
          end else begin
            if(io_bus_cmd_valid) begin
              if(when_SdramCtrl_l224) begin
                if(frontend_rsp_ready) begin
                  if(_zz_2) begin
                    frontend_banks_0_active <= 1'b0;
                  end
                  if(_zz_3) begin
                    frontend_banks_1_active <= 1'b0;
                  end
                  if(_zz_4) begin
                    frontend_banks_2_active <= 1'b0;
                  end
                  if(_zz_5) begin
                    frontend_banks_3_active <= 1'b0;
                  end
                end
              end else begin
                if(when_SdramCtrl_l229) begin
                  if(frontend_rsp_ready) begin
                    if(_zz_2) begin
                      frontend_banks_0_active <= 1'b1;
                    end
                    if(_zz_3) begin
                      frontend_banks_1_active <= 1'b1;
                    end
                    if(_zz_4) begin
                      frontend_banks_2_active <= 1'b1;
                    end
                    if(_zz_5) begin
                      frontend_banks_3_active <= 1'b1;
                    end
                  end
                end
              end
            end
          end
        end
      endcase
      if(frontend_rsp_ready) begin
        frontend_rsp_rValid <= frontend_rsp_valid;
      end
      if(when_SdramCtrl_l256) begin
        bubbleInserter_timings_read_counter <= (bubbleInserter_timings_read_counter - 1'b1);
      end
      if(when_SdramCtrl_l256_1) begin
        bubbleInserter_timings_write_counter <= (bubbleInserter_timings_write_counter - 3'b001);
      end
      if(when_SdramCtrl_l256_2) begin
        bubbleInserter_timings_banks_0_precharge_counter <= (bubbleInserter_timings_banks_0_precharge_counter - 4'b0001);
      end
      if(when_SdramCtrl_l256_3) begin
        bubbleInserter_timings_banks_0_active_counter <= (bubbleInserter_timings_banks_0_active_counter - 3'b001);
      end
      if(when_SdramCtrl_l256_4) begin
        bubbleInserter_timings_banks_1_precharge_counter <= (bubbleInserter_timings_banks_1_precharge_counter - 4'b0001);
      end
      if(when_SdramCtrl_l256_5) begin
        bubbleInserter_timings_banks_1_active_counter <= (bubbleInserter_timings_banks_1_active_counter - 3'b001);
      end
      if(when_SdramCtrl_l256_6) begin
        bubbleInserter_timings_banks_2_precharge_counter <= (bubbleInserter_timings_banks_2_precharge_counter - 4'b0001);
      end
      if(when_SdramCtrl_l256_7) begin
        bubbleInserter_timings_banks_2_active_counter <= (bubbleInserter_timings_banks_2_active_counter - 3'b001);
      end
      if(when_SdramCtrl_l256_8) begin
        bubbleInserter_timings_banks_3_precharge_counter <= (bubbleInserter_timings_banks_3_precharge_counter - 4'b0001);
      end
      if(when_SdramCtrl_l256_9) begin
        bubbleInserter_timings_banks_3_active_counter <= (bubbleInserter_timings_banks_3_active_counter - 3'b001);
      end
      if(frontend_rsp_cmd_valid) begin
        case(frontend_rsp_cmd_payload_task)
          SdramCtrlBackendTask_MODE : begin
            if(frontend_rsp_cmd_ready) begin
              if(when_SdramCtrl_l265) begin
                bubbleInserter_timings_banks_0_active_counter <= 3'b111;
              end
              if(when_SdramCtrl_l265_1) begin
                bubbleInserter_timings_banks_1_active_counter <= 3'b111;
              end
              if(when_SdramCtrl_l265_2) begin
                bubbleInserter_timings_banks_2_active_counter <= 3'b111;
              end
              if(when_SdramCtrl_l265_3) begin
                bubbleInserter_timings_banks_3_active_counter <= 3'b111;
              end
            end
          end
          SdramCtrlBackendTask_PRECHARGE_ALL : begin
            if(frontend_rsp_cmd_ready) begin
              if(when_SdramCtrl_l265_4) begin
                bubbleInserter_timings_banks_0_active_counter <= 3'b001;
              end
            end
          end
          SdramCtrlBackendTask_PRECHARGE_SINGLE : begin
            if(frontend_rsp_cmd_ready) begin
              if(when_Utils_l895) begin
                if(when_SdramCtrl_l265_5) begin
                  bubbleInserter_timings_banks_0_active_counter <= 3'b001;
                end
              end
              if(when_Utils_l895_1) begin
                if(when_SdramCtrl_l265_6) begin
                  bubbleInserter_timings_banks_1_active_counter <= 3'b001;
                end
              end
              if(when_Utils_l895_2) begin
                if(when_SdramCtrl_l265_7) begin
                  bubbleInserter_timings_banks_2_active_counter <= 3'b001;
                end
              end
              if(when_Utils_l895_3) begin
                if(when_SdramCtrl_l265_8) begin
                  bubbleInserter_timings_banks_3_active_counter <= 3'b001;
                end
              end
            end
          end
          SdramCtrlBackendTask_REFRESH : begin
            if(frontend_rsp_cmd_ready) begin
              if(when_SdramCtrl_l265_9) begin
                bubbleInserter_timings_banks_0_active_counter <= 3'b011;
              end
              if(when_SdramCtrl_l265_10) begin
                bubbleInserter_timings_banks_1_active_counter <= 3'b011;
              end
              if(when_SdramCtrl_l265_11) begin
                bubbleInserter_timings_banks_2_active_counter <= 3'b011;
              end
              if(when_SdramCtrl_l265_12) begin
                bubbleInserter_timings_banks_3_active_counter <= 3'b011;
              end
            end
          end
          SdramCtrlBackendTask_ACTIVE : begin
            if(frontend_rsp_cmd_ready) begin
              if(when_SdramCtrl_l265_13) begin
                bubbleInserter_timings_write_counter <= 3'b001;
              end
              bubbleInserter_timings_read_counter <= 1'b1;
              if(when_Utils_l895_4) begin
                if(when_SdramCtrl_l265_14) begin
                  bubbleInserter_timings_banks_0_precharge_counter <= 4'b0010;
                end
              end
              if(when_Utils_l895_5) begin
                if(when_SdramCtrl_l265_15) begin
                  bubbleInserter_timings_banks_1_precharge_counter <= 4'b0010;
                end
              end
              if(when_Utils_l895_6) begin
                if(when_SdramCtrl_l265_16) begin
                  bubbleInserter_timings_banks_2_precharge_counter <= 4'b0010;
                end
              end
              if(when_Utils_l895_7) begin
                if(when_SdramCtrl_l265_17) begin
                  bubbleInserter_timings_banks_3_precharge_counter <= 4'b0010;
                end
              end
              if(when_Utils_l895_8) begin
                if(when_SdramCtrl_l265_18) begin
                  bubbleInserter_timings_banks_0_active_counter <= 3'b011;
                end
              end
              if(when_Utils_l895_9) begin
                if(when_SdramCtrl_l265_19) begin
                  bubbleInserter_timings_banks_1_active_counter <= 3'b011;
                end
              end
              if(when_Utils_l895_10) begin
                if(when_SdramCtrl_l265_20) begin
                  bubbleInserter_timings_banks_2_active_counter <= 3'b011;
                end
              end
              if(when_Utils_l895_11) begin
                if(when_SdramCtrl_l265_21) begin
                  bubbleInserter_timings_banks_3_active_counter <= 3'b011;
                end
              end
            end
          end
          SdramCtrlBackendTask_READ : begin
            if(frontend_rsp_cmd_ready) begin
              if(when_SdramCtrl_l265_22) begin
                bubbleInserter_timings_write_counter <= 3'b100;
              end
            end
          end
          default : begin
            if(frontend_rsp_cmd_ready) begin
              if(when_Utils_l895_12) begin
                if(when_SdramCtrl_l265_23) begin
                  bubbleInserter_timings_banks_0_precharge_counter <= 4'b1000;
                end
              end
              if(when_Utils_l895_13) begin
                if(when_SdramCtrl_l265_24) begin
                  bubbleInserter_timings_banks_1_precharge_counter <= 4'b1000;
                end
              end
              if(when_Utils_l895_14) begin
                if(when_SdramCtrl_l265_25) begin
                  bubbleInserter_timings_banks_2_precharge_counter <= 4'b1000;
                end
              end
              if(when_Utils_l895_15) begin
                if(when_SdramCtrl_l265_26) begin
                  bubbleInserter_timings_banks_3_precharge_counter <= 4'b1000;
                end
              end
            end
          end
        endcase
      end
      if(chip_remoteCke) begin
        _zz_chip_readHistory_1 <= _zz_chip_readHistory_0;
      end
      if(chip_remoteCke) begin
        _zz_chip_readHistory_2 <= _zz_chip_readHistory_1;
      end
      if(chip_remoteCke) begin
        _zz_chip_readHistory_3 <= _zz_chip_readHistory_2;
      end
      if(chip_remoteCke) begin
        _zz_chip_readHistory_4 <= _zz_chip_readHistory_3;
      end
      if(chip_remoteCke) begin
        _zz_chip_readHistory_5 <= _zz_chip_readHistory_4;
      end
      chip_sdramCkeInternal <= chip_sdramCkeNext;
      chip_sdramCkeInternal_regNext <= chip_sdramCkeInternal;
    end
  end

  always @(posedge sdramCtrlClk) begin
    case(frontend_state)
      SdramCtrlFrontendState_BOOT_PRECHARGE : begin
      end
      SdramCtrlFrontendState_BOOT_REFRESH : begin
      end
      SdramCtrlFrontendState_BOOT_MODE : begin
      end
      default : begin
        if(!refresh_pending) begin
          if(io_bus_cmd_valid) begin
            if(!when_SdramCtrl_l224) begin
              if(when_SdramCtrl_l229) begin
                if(_zz_2) begin
                  frontend_banks_0_row <= frontend_address_row;
                end
                if(_zz_3) begin
                  frontend_banks_1_row <= frontend_address_row;
                end
                if(_zz_4) begin
                  frontend_banks_2_row <= frontend_address_row;
                end
                if(_zz_5) begin
                  frontend_banks_3_row <= frontend_address_row;
                end
              end
            end
          end
        end
      end
    endcase
    if(frontend_rsp_ready) begin
      frontend_rsp_rData_task <= frontend_rsp_payload_task;
      frontend_rsp_rData_bank <= frontend_rsp_payload_bank;
      frontend_rsp_rData_rowColumn <= frontend_rsp_payload_rowColumn;
      frontend_rsp_rData_data <= frontend_rsp_payload_data;
      frontend_rsp_rData_mask <= frontend_rsp_payload_mask;
      frontend_rsp_rData_context_id <= frontend_rsp_payload_context_id;
      frontend_rsp_rData_context_last <= frontend_rsp_payload_context_last;
    end
    if(chip_remoteCke) begin
      chip_cmd_payload_context_delay_1_id <= chip_cmd_payload_context_id;
      chip_cmd_payload_context_delay_1_last <= chip_cmd_payload_context_last;
    end
    if(chip_remoteCke) begin
      chip_cmd_payload_context_delay_2_id <= chip_cmd_payload_context_delay_1_id;
      chip_cmd_payload_context_delay_2_last <= chip_cmd_payload_context_delay_1_last;
    end
    if(chip_remoteCke) begin
      chip_cmd_payload_context_delay_3_id <= chip_cmd_payload_context_delay_2_id;
      chip_cmd_payload_context_delay_3_last <= chip_cmd_payload_context_delay_2_last;
    end
    if(chip_remoteCke) begin
      chip_cmd_payload_context_delay_4_id <= chip_cmd_payload_context_delay_3_id;
      chip_cmd_payload_context_delay_4_last <= chip_cmd_payload_context_delay_3_last;
    end
    if(chip_remoteCke) begin
      chip_contextDelayed_id <= chip_cmd_payload_context_delay_4_id;
      chip_contextDelayed_last <= chip_cmd_payload_context_delay_4_last;
    end
    chip_sdram_CKE <= chip_sdramCkeNext;
    if(chip_remoteCke) begin
      chip_sdram_DQ_read <= io_sdram_DQ_read;
      chip_sdram_CSn <= 1'b0;
      chip_sdram_RASn <= 1'b1;
      chip_sdram_CASn <= 1'b1;
      chip_sdram_WEn <= 1'b1;
      chip_sdram_DQ_write <= chip_cmd_payload_data;
      chip_sdram_DQ_writeEnable <= 32'h0;
      chip_sdram_DQM[0] <= _zz_chip_sdram_DQM;
      chip_sdram_DQM[1] <= _zz_chip_sdram_DQM;
      chip_sdram_DQM[2] <= _zz_chip_sdram_DQM;
      chip_sdram_DQM[3] <= _zz_chip_sdram_DQM;
      if(chip_cmd_valid) begin
        case(chip_cmd_payload_task)
          SdramCtrlBackendTask_PRECHARGE_ALL : begin
            chip_sdram_ADDR[10] <= 1'b1;
            chip_sdram_CSn <= 1'b0;
            chip_sdram_RASn <= 1'b0;
            chip_sdram_CASn <= 1'b1;
            chip_sdram_WEn <= 1'b0;
          end
          SdramCtrlBackendTask_REFRESH : begin
            chip_sdram_CSn <= 1'b0;
            chip_sdram_RASn <= 1'b0;
            chip_sdram_CASn <= 1'b0;
            chip_sdram_WEn <= 1'b1;
          end
          SdramCtrlBackendTask_MODE : begin
            chip_sdram_ADDR <= 11'h0;
            chip_sdram_ADDR[2 : 0] <= 3'b000;
            chip_sdram_ADDR[3] <= 1'b0;
            chip_sdram_ADDR[6 : 4] <= 3'b011;
            chip_sdram_ADDR[8 : 7] <= 2'b00;
            chip_sdram_ADDR[9] <= 1'b0;
            chip_sdram_BA <= 2'b00;
            chip_sdram_CSn <= 1'b0;
            chip_sdram_RASn <= 1'b0;
            chip_sdram_CASn <= 1'b0;
            chip_sdram_WEn <= 1'b0;
          end
          SdramCtrlBackendTask_ACTIVE : begin
            chip_sdram_ADDR <= chip_cmd_payload_rowColumn;
            chip_sdram_BA <= chip_cmd_payload_bank;
            chip_sdram_CSn <= 1'b0;
            chip_sdram_RASn <= 1'b0;
            chip_sdram_CASn <= 1'b1;
            chip_sdram_WEn <= 1'b1;
          end
          SdramCtrlBackendTask_WRITE : begin
            chip_sdram_ADDR <= chip_cmd_payload_rowColumn;
            chip_sdram_ADDR[10] <= 1'b0;
            chip_sdram_DQ_writeEnable <= 32'hffffffff;
            chip_sdram_DQ_write <= chip_cmd_payload_data;
            chip_sdram_DQM <= (~ chip_cmd_payload_mask);
            chip_sdram_BA <= chip_cmd_payload_bank;
            chip_sdram_CSn <= 1'b0;
            chip_sdram_RASn <= 1'b1;
            chip_sdram_CASn <= 1'b0;
            chip_sdram_WEn <= 1'b0;
          end
          SdramCtrlBackendTask_READ : begin
            chip_sdram_ADDR <= chip_cmd_payload_rowColumn;
            chip_sdram_ADDR[10] <= 1'b0;
            chip_sdram_BA <= chip_cmd_payload_bank;
            chip_sdram_CSn <= 1'b0;
            chip_sdram_RASn <= 1'b1;
            chip_sdram_CASn <= 1'b0;
            chip_sdram_WEn <= 1'b1;
          end
          default : begin
            chip_sdram_BA <= chip_cmd_payload_bank;
            chip_sdram_ADDR[10] <= 1'b0;
            chip_sdram_CSn <= 1'b0;
            chip_sdram_RASn <= 1'b0;
            chip_sdram_CASn <= 1'b1;
            chip_sdram_WEn <= 1'b0;
          end
        endcase
      end
    end
  end


endmodule

module BufferCC_7 (
  input               io_dataIn,
  output              io_dataOut,
  input               axiClk,
  input               resetCtrl_systemReset
);

  (* async_reg = "true" *) reg                 buffers_0;
  (* async_reg = "true" *) reg                 buffers_1;

  assign io_dataOut = buffers_1;
  always @(posedge axiClk) begin
    buffers_0 <= io_dataIn;
    buffers_1 <= buffers_0;
  end


endmodule

//BufferCC_5 replaced by BufferCC_5

module BufferCC_5 (
  input               io_dataIn,
  output              io_dataOut,
  input               axiClk,
  input               resetCtrl_axiReset
);

  (* async_reg = "true" *) reg                 buffers_0;
  (* async_reg = "true" *) reg                 buffers_1;

  assign io_dataOut = buffers_1;
  always @(posedge axiClk or posedge resetCtrl_axiReset) begin
    if(resetCtrl_axiReset) begin
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
  input      [0:0]    io_configFrame_stop,
  input      [1:0]    io_configFrame_parity,
  input               io_samplingTick,
  output              io_read_valid,
  input               io_read_ready,
  output     [7:0]    io_read_payload,
  input               io_rxd,
  output              io_rts,
  output reg          io_error,
  output              io_break,
  input               axiClk,
  input               resetCtrl_axiReset
);
  localparam UartStopType_ONE = 1'd0;
  localparam UartStopType_TWO = 1'd1;
  localparam UartParityType_NONE = 2'd0;
  localparam UartParityType_EVEN = 2'd1;
  localparam UartParityType_ODD = 2'd2;
  localparam UartCtrlRxState_IDLE = 3'd0;
  localparam UartCtrlRxState_START = 3'd1;
  localparam UartCtrlRxState_DATA = 3'd2;
  localparam UartCtrlRxState_PARITY = 3'd3;
  localparam UartCtrlRxState_STOP = 3'd4;

  wire                io_rxd_buffercc_io_dataOut;
  wire                _zz_sampler_value;
  wire                _zz_sampler_value_1;
  wire                _zz_sampler_value_2;
  wire                _zz_sampler_value_3;
  wire                _zz_sampler_value_4;
  wire                _zz_sampler_value_5;
  wire                _zz_sampler_value_6;
  wire       [2:0]    _zz_when_UartCtrlRx_l139;
  wire       [0:0]    _zz_when_UartCtrlRx_l139_1;
  reg                 _zz_io_rts;
  wire                sampler_synchroniser;
  wire                sampler_samples_0;
  reg                 sampler_samples_1;
  reg                 sampler_samples_2;
  reg                 sampler_samples_3;
  reg                 sampler_samples_4;
  reg                 sampler_value;
  reg                 sampler_tick;
  reg        [2:0]    bitTimer_counter;
  reg                 bitTimer_tick;
  wire                when_UartCtrlRx_l43;
  reg        [2:0]    bitCounter_value;
  reg        [6:0]    break_counter;
  wire                break_valid;
  wire                when_UartCtrlRx_l69;
  reg        [2:0]    stateMachine_state;
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


  assign _zz_when_UartCtrlRx_l139_1 = ((io_configFrame_stop == UartStopType_ONE) ? 1'b0 : 1'b1);
  assign _zz_when_UartCtrlRx_l139 = {2'd0, _zz_when_UartCtrlRx_l139_1};
  assign _zz_sampler_value = ((((1'b0 || ((_zz_sampler_value_1 && sampler_samples_1) && sampler_samples_2)) || (((_zz_sampler_value_2 && sampler_samples_0) && sampler_samples_1) && sampler_samples_3)) || (((1'b1 && sampler_samples_0) && sampler_samples_2) && sampler_samples_3)) || (((1'b1 && sampler_samples_1) && sampler_samples_2) && sampler_samples_3));
  assign _zz_sampler_value_3 = (((1'b1 && sampler_samples_0) && sampler_samples_1) && sampler_samples_4);
  assign _zz_sampler_value_4 = ((1'b1 && sampler_samples_0) && sampler_samples_2);
  assign _zz_sampler_value_5 = (1'b1 && sampler_samples_1);
  assign _zz_sampler_value_6 = 1'b1;
  assign _zz_sampler_value_1 = (1'b1 && sampler_samples_0);
  assign _zz_sampler_value_2 = 1'b1;
  BufferCC_2 io_rxd_buffercc (
    .io_dataIn             (io_rxd                      ), //i
    .io_dataOut            (io_rxd_buffercc_io_dataOut  ), //o
    .axiClk                (axiClk                      ), //i
    .resetCtrl_axiReset    (resetCtrl_axiReset          )  //i
  );
  `ifndef SYNTHESIS
  always @(*) begin
    case(io_configFrame_stop)
      UartStopType_ONE : io_configFrame_stop_string = "ONE";
      UartStopType_TWO : io_configFrame_stop_string = "TWO";
      default : io_configFrame_stop_string = "???";
    endcase
  end
  always @(*) begin
    case(io_configFrame_parity)
      UartParityType_NONE : io_configFrame_parity_string = "NONE";
      UartParityType_EVEN : io_configFrame_parity_string = "EVEN";
      UartParityType_ODD : io_configFrame_parity_string = "ODD ";
      default : io_configFrame_parity_string = "????";
    endcase
  end
  always @(*) begin
    case(stateMachine_state)
      UartCtrlRxState_IDLE : stateMachine_state_string = "IDLE  ";
      UartCtrlRxState_START : stateMachine_state_string = "START ";
      UartCtrlRxState_DATA : stateMachine_state_string = "DATA  ";
      UartCtrlRxState_PARITY : stateMachine_state_string = "PARITY";
      UartCtrlRxState_STOP : stateMachine_state_string = "STOP  ";
      default : stateMachine_state_string = "??????";
    endcase
  end
  `endif

  always @(*) begin
    io_error = 1'b0;
    case(stateMachine_state)
      UartCtrlRxState_IDLE : begin
      end
      UartCtrlRxState_START : begin
      end
      UartCtrlRxState_DATA : begin
      end
      UartCtrlRxState_PARITY : begin
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
  assign break_valid = (break_counter == 7'h68);
  assign when_UartCtrlRx_l69 = (io_samplingTick && (! break_valid));
  assign io_break = break_valid;
  assign io_read_valid = stateMachine_validReg;
  assign when_UartCtrlRx_l93 = ((sampler_tick && (! sampler_value)) && (! break_valid));
  assign when_UartCtrlRx_l103 = (sampler_value == 1'b1);
  assign when_UartCtrlRx_l111 = (bitCounter_value == io_configFrame_dataLength);
  assign when_UartCtrlRx_l113 = (io_configFrame_parity == UartParityType_NONE);
  assign when_UartCtrlRx_l125 = (stateMachine_parity == sampler_value);
  assign when_UartCtrlRx_l136 = (! sampler_value);
  assign when_UartCtrlRx_l139 = (bitCounter_value == _zz_when_UartCtrlRx_l139);
  assign io_read_payload = stateMachine_shifter;
  always @(posedge axiClk or posedge resetCtrl_axiReset) begin
    if(resetCtrl_axiReset) begin
      _zz_io_rts <= 1'b0;
      sampler_samples_1 <= 1'b1;
      sampler_samples_2 <= 1'b1;
      sampler_samples_3 <= 1'b1;
      sampler_samples_4 <= 1'b1;
      sampler_value <= 1'b1;
      sampler_tick <= 1'b0;
      break_counter <= 7'h0;
      stateMachine_state <= UartCtrlRxState_IDLE;
      stateMachine_validReg <= 1'b0;
    end else begin
      _zz_io_rts <= (! io_read_ready);
      if(io_samplingTick) begin
        sampler_samples_1 <= sampler_samples_0;
      end
      if(io_samplingTick) begin
        sampler_samples_2 <= sampler_samples_1;
      end
      if(io_samplingTick) begin
        sampler_samples_3 <= sampler_samples_2;
      end
      if(io_samplingTick) begin
        sampler_samples_4 <= sampler_samples_3;
      end
      sampler_value <= ((((((_zz_sampler_value || _zz_sampler_value_3) || (_zz_sampler_value_4 && sampler_samples_4)) || ((_zz_sampler_value_5 && sampler_samples_2) && sampler_samples_4)) || (((_zz_sampler_value_6 && sampler_samples_0) && sampler_samples_3) && sampler_samples_4)) || (((1'b1 && sampler_samples_1) && sampler_samples_3) && sampler_samples_4)) || (((1'b1 && sampler_samples_2) && sampler_samples_3) && sampler_samples_4));
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
        UartCtrlRxState_IDLE : begin
          if(when_UartCtrlRx_l93) begin
            stateMachine_state <= UartCtrlRxState_START;
          end
        end
        UartCtrlRxState_START : begin
          if(bitTimer_tick) begin
            stateMachine_state <= UartCtrlRxState_DATA;
            if(when_UartCtrlRx_l103) begin
              stateMachine_state <= UartCtrlRxState_IDLE;
            end
          end
        end
        UartCtrlRxState_DATA : begin
          if(bitTimer_tick) begin
            if(when_UartCtrlRx_l111) begin
              if(when_UartCtrlRx_l113) begin
                stateMachine_state <= UartCtrlRxState_STOP;
                stateMachine_validReg <= 1'b1;
              end else begin
                stateMachine_state <= UartCtrlRxState_PARITY;
              end
            end
          end
        end
        UartCtrlRxState_PARITY : begin
          if(bitTimer_tick) begin
            if(when_UartCtrlRx_l125) begin
              stateMachine_state <= UartCtrlRxState_STOP;
              stateMachine_validReg <= 1'b1;
            end else begin
              stateMachine_state <= UartCtrlRxState_IDLE;
            end
          end
        end
        default : begin
          if(bitTimer_tick) begin
            if(when_UartCtrlRx_l136) begin
              stateMachine_state <= UartCtrlRxState_IDLE;
            end else begin
              if(when_UartCtrlRx_l139) begin
                stateMachine_state <= UartCtrlRxState_IDLE;
              end
            end
          end
        end
      endcase
    end
  end

  always @(posedge axiClk) begin
    if(sampler_tick) begin
      bitTimer_counter <= (bitTimer_counter - 3'b001);
    end
    if(bitTimer_tick) begin
      bitCounter_value <= (bitCounter_value + 3'b001);
    end
    if(bitTimer_tick) begin
      stateMachine_parity <= (stateMachine_parity ^ sampler_value);
    end
    case(stateMachine_state)
      UartCtrlRxState_IDLE : begin
        if(when_UartCtrlRx_l93) begin
          bitTimer_counter <= 3'b010;
        end
      end
      UartCtrlRxState_START : begin
        if(bitTimer_tick) begin
          bitCounter_value <= 3'b000;
          stateMachine_parity <= (io_configFrame_parity == UartParityType_ODD);
        end
      end
      UartCtrlRxState_DATA : begin
        if(bitTimer_tick) begin
          stateMachine_shifter[bitCounter_value] <= sampler_value;
          if(when_UartCtrlRx_l111) begin
            bitCounter_value <= 3'b000;
          end
        end
      end
      UartCtrlRxState_PARITY : begin
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
  input      [0:0]    io_configFrame_stop,
  input      [1:0]    io_configFrame_parity,
  input               io_samplingTick,
  input               io_write_valid,
  output reg          io_write_ready,
  input      [7:0]    io_write_payload,
  input               io_cts,
  output              io_txd,
  input               io_break,
  input               axiClk,
  input               resetCtrl_axiReset
);
  localparam UartStopType_ONE = 1'd0;
  localparam UartStopType_TWO = 1'd1;
  localparam UartParityType_NONE = 2'd0;
  localparam UartParityType_EVEN = 2'd1;
  localparam UartParityType_ODD = 2'd2;
  localparam UartCtrlTxState_IDLE = 3'd0;
  localparam UartCtrlTxState_START = 3'd1;
  localparam UartCtrlTxState_DATA = 3'd2;
  localparam UartCtrlTxState_PARITY = 3'd3;
  localparam UartCtrlTxState_STOP = 3'd4;

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
  reg        [2:0]    stateMachine_state;
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
  assign _zz_when_UartCtrlTx_l93_1 = ((io_configFrame_stop == UartStopType_ONE) ? 1'b0 : 1'b1);
  assign _zz_when_UartCtrlTx_l93 = {2'd0, _zz_when_UartCtrlTx_l93_1};
  `ifndef SYNTHESIS
  always @(*) begin
    case(io_configFrame_stop)
      UartStopType_ONE : io_configFrame_stop_string = "ONE";
      UartStopType_TWO : io_configFrame_stop_string = "TWO";
      default : io_configFrame_stop_string = "???";
    endcase
  end
  always @(*) begin
    case(io_configFrame_parity)
      UartParityType_NONE : io_configFrame_parity_string = "NONE";
      UartParityType_EVEN : io_configFrame_parity_string = "EVEN";
      UartParityType_ODD : io_configFrame_parity_string = "ODD ";
      default : io_configFrame_parity_string = "????";
    endcase
  end
  always @(*) begin
    case(stateMachine_state)
      UartCtrlTxState_IDLE : stateMachine_state_string = "IDLE  ";
      UartCtrlTxState_START : stateMachine_state_string = "START ";
      UartCtrlTxState_DATA : stateMachine_state_string = "DATA  ";
      UartCtrlTxState_PARITY : stateMachine_state_string = "PARITY";
      UartCtrlTxState_STOP : stateMachine_state_string = "STOP  ";
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
  assign clockDivider_counter_willOverflowIfInc = (clockDivider_counter_value == 3'b111);
  assign clockDivider_counter_willOverflow = (clockDivider_counter_willOverflowIfInc && clockDivider_counter_willIncrement);
  always @(*) begin
    clockDivider_counter_valueNext = (clockDivider_counter_value + _zz_clockDivider_counter_valueNext);
    if(clockDivider_counter_willClear) begin
      clockDivider_counter_valueNext = 3'b000;
    end
  end

  always @(*) begin
    stateMachine_txd = 1'b1;
    case(stateMachine_state)
      UartCtrlTxState_IDLE : begin
      end
      UartCtrlTxState_START : begin
        stateMachine_txd = 1'b0;
      end
      UartCtrlTxState_DATA : begin
        stateMachine_txd = io_write_payload[tickCounter_value];
      end
      UartCtrlTxState_PARITY : begin
        stateMachine_txd = stateMachine_parity;
      end
      default : begin
      end
    endcase
  end

  always @(*) begin
    io_write_ready = io_break;
    case(stateMachine_state)
      UartCtrlTxState_IDLE : begin
      end
      UartCtrlTxState_START : begin
      end
      UartCtrlTxState_DATA : begin
        if(clockDivider_counter_willOverflow) begin
          if(when_UartCtrlTx_l73) begin
            io_write_ready = 1'b1;
          end
        end
      end
      UartCtrlTxState_PARITY : begin
      end
      default : begin
      end
    endcase
  end

  assign when_UartCtrlTx_l58 = ((io_write_valid && (! io_cts)) && clockDivider_counter_willOverflow);
  assign when_UartCtrlTx_l73 = (tickCounter_value == io_configFrame_dataLength);
  assign when_UartCtrlTx_l76 = (io_configFrame_parity == UartParityType_NONE);
  assign when_UartCtrlTx_l93 = (tickCounter_value == _zz_when_UartCtrlTx_l93);
  assign io_txd = _zz_io_txd;
  always @(posedge axiClk or posedge resetCtrl_axiReset) begin
    if(resetCtrl_axiReset) begin
      clockDivider_counter_value <= 3'b000;
      stateMachine_state <= UartCtrlTxState_IDLE;
      _zz_io_txd <= 1'b1;
    end else begin
      clockDivider_counter_value <= clockDivider_counter_valueNext;
      case(stateMachine_state)
        UartCtrlTxState_IDLE : begin
          if(when_UartCtrlTx_l58) begin
            stateMachine_state <= UartCtrlTxState_START;
          end
        end
        UartCtrlTxState_START : begin
          if(clockDivider_counter_willOverflow) begin
            stateMachine_state <= UartCtrlTxState_DATA;
          end
        end
        UartCtrlTxState_DATA : begin
          if(clockDivider_counter_willOverflow) begin
            if(when_UartCtrlTx_l73) begin
              if(when_UartCtrlTx_l76) begin
                stateMachine_state <= UartCtrlTxState_STOP;
              end else begin
                stateMachine_state <= UartCtrlTxState_PARITY;
              end
            end
          end
        end
        UartCtrlTxState_PARITY : begin
          if(clockDivider_counter_willOverflow) begin
            stateMachine_state <= UartCtrlTxState_STOP;
          end
        end
        default : begin
          if(clockDivider_counter_willOverflow) begin
            if(when_UartCtrlTx_l93) begin
              stateMachine_state <= (io_write_valid ? UartCtrlTxState_START : UartCtrlTxState_IDLE);
            end
          end
        end
      endcase
      _zz_io_txd <= (stateMachine_txd && (! io_break));
    end
  end

  always @(posedge axiClk) begin
    if(clockDivider_counter_willOverflow) begin
      tickCounter_value <= (tickCounter_value + 3'b001);
    end
    if(clockDivider_counter_willOverflow) begin
      stateMachine_parity <= (stateMachine_parity ^ stateMachine_txd);
    end
    case(stateMachine_state)
      UartCtrlTxState_IDLE : begin
      end
      UartCtrlTxState_START : begin
        if(clockDivider_counter_willOverflow) begin
          stateMachine_parity <= (io_configFrame_parity == UartParityType_ODD);
          tickCounter_value <= 3'b000;
        end
      end
      UartCtrlTxState_DATA : begin
        if(clockDivider_counter_willOverflow) begin
          if(when_UartCtrlTx_l73) begin
            tickCounter_value <= 3'b000;
          end
        end
      end
      UartCtrlTxState_PARITY : begin
        if(clockDivider_counter_willOverflow) begin
          tickCounter_value <= 3'b000;
        end
      end
      default : begin
      end
    endcase
  end


endmodule

module BufferCC_4 (
  input               io_dataIn,
  output              io_dataOut,
  input               vgaClk,
  input               resetCtrl_vgaReset
);

  (* async_reg = "true" *) reg                 buffers_0;
  (* async_reg = "true" *) reg                 buffers_1;

  assign io_dataOut = buffers_1;
  always @(posedge vgaClk or posedge resetCtrl_vgaReset) begin
    if(resetCtrl_vgaReset) begin
      buffers_0 <= 1'b0;
      buffers_1 <= 1'b0;
    end else begin
      buffers_0 <= io_dataIn;
      buffers_1 <= buffers_0;
    end
  end


endmodule

module BufferCC_3 (
  input      [6:0]    io_dataIn,
  output     [6:0]    io_dataOut,
  input               vgaClk,
  input               resetCtrl_vgaReset
);

  (* async_reg = "true" *) reg        [6:0]    buffers_0;
  (* async_reg = "true" *) reg        [6:0]    buffers_1;

  assign io_dataOut = buffers_1;
  always @(posedge vgaClk) begin
    buffers_0 <= io_dataIn;
    buffers_1 <= buffers_0;
  end


endmodule

module StreamFifoCC (
  input               io_push_valid,
  output              io_push_ready,
  input               io_push_payload_last,
  input      [31:0]   io_push_payload_fragment,
  output              io_pop_valid,
  input               io_pop_ready,
  output              io_pop_payload_last,
  output     [31:0]   io_pop_payload_fragment,
  output     [9:0]    io_pushOccupancy,
  output     [9:0]    io_popOccupancy,
  input               vgaClk,
  input               resetCtrl_vgaReset
);

  reg        [32:0]   _zz_ram_port1;
  wire       [9:0]    popToPushGray_buffercc_io_dataOut;
  wire       [9:0]    pushToPopGray_buffercc_io_dataOut;
  wire       [9:0]    _zz_pushCC_pushPtrGray;
  wire       [8:0]    _zz_ram_port;
  wire       [32:0]   _zz_ram_port_1;
  wire                _zz_io_pushOccupancy_9;
  wire       [9:0]    _zz_popCC_popPtrGray;
  wire       [8:0]    _zz_ram_port_2;
  wire                _zz_ram_port_3;
  wire       [8:0]    _zz__zz_io_pop_payload_last_1;
  wire                _zz__zz_io_pop_payload_last_1_1;
  wire                _zz_io_popOccupancy_9;
  reg                 _zz_1;
  wire       [9:0]    popToPushGray;
  wire       [9:0]    pushToPopGray;
  reg        [9:0]    pushCC_pushPtr;
  wire       [9:0]    pushCC_pushPtrPlus;
  wire                io_push_fire;
  reg        [9:0]    pushCC_pushPtrGray;
  wire       [9:0]    pushCC_popPtrGray;
  wire                pushCC_full;
  wire                io_push_fire_1;
  wire                _zz_io_pushOccupancy;
  wire                _zz_io_pushOccupancy_1;
  wire                _zz_io_pushOccupancy_2;
  wire                _zz_io_pushOccupancy_3;
  wire                _zz_io_pushOccupancy_4;
  wire                _zz_io_pushOccupancy_5;
  wire                _zz_io_pushOccupancy_6;
  wire                _zz_io_pushOccupancy_7;
  wire                _zz_io_pushOccupancy_8;
  reg        [9:0]    popCC_popPtr;
  wire       [9:0]    popCC_popPtrPlus;
  wire                io_pop_fire;
  reg        [9:0]    popCC_popPtrGray;
  wire       [9:0]    popCC_pushPtrGray;
  wire                popCC_empty;
  wire                io_pop_fire_1;
  wire       [9:0]    _zz_io_pop_payload_last;
  wire       [32:0]   _zz_io_pop_payload_last_1;
  wire                io_pop_fire_2;
  wire                _zz_io_popOccupancy;
  wire                _zz_io_popOccupancy_1;
  wire                _zz_io_popOccupancy_2;
  wire                _zz_io_popOccupancy_3;
  wire                _zz_io_popOccupancy_4;
  wire                _zz_io_popOccupancy_5;
  wire                _zz_io_popOccupancy_6;
  wire                _zz_io_popOccupancy_7;
  wire                _zz_io_popOccupancy_8;
  reg [32:0] ram [0:511];

  assign _zz_pushCC_pushPtrGray = (pushCC_pushPtrPlus >>> 1'b1);
  assign _zz_ram_port = pushCC_pushPtr[8:0];
  assign _zz_popCC_popPtrGray = (popCC_popPtrPlus >>> 1'b1);
  assign _zz__zz_io_pop_payload_last_1 = _zz_io_pop_payload_last[8:0];
  assign _zz_ram_port_1 = {io_push_payload_fragment,io_push_payload_last};
  assign _zz__zz_io_pop_payload_last_1_1 = 1'b1;
  assign _zz_io_pushOccupancy_9 = pushCC_popPtrGray[0];
  assign _zz_io_popOccupancy_9 = (popCC_pushPtrGray[0] ^ _zz_io_popOccupancy);
  always @(posedge vgaClk) begin
    if(_zz_1) begin
      ram[_zz_ram_port] <= _zz_ram_port_1;
    end
  end

  always @(posedge vgaClk) begin
    if(_zz__zz_io_pop_payload_last_1_1) begin
      _zz_ram_port1 <= ram[_zz__zz_io_pop_payload_last_1];
    end
  end

  BufferCC popToPushGray_buffercc (
    .io_dataIn             (popToPushGray[9:0]                      ), //i
    .io_dataOut            (popToPushGray_buffercc_io_dataOut[9:0]  ), //o
    .vgaClk                (vgaClk                                  ), //i
    .resetCtrl_vgaReset    (resetCtrl_vgaReset                      )  //i
  );
  BufferCC pushToPopGray_buffercc (
    .io_dataIn             (pushToPopGray[9:0]                      ), //i
    .io_dataOut            (pushToPopGray_buffercc_io_dataOut[9:0]  ), //o
    .vgaClk                (vgaClk                                  ), //i
    .resetCtrl_vgaReset    (resetCtrl_vgaReset                      )  //i
  );
  always @(*) begin
    _zz_1 = 1'b0;
    if(io_push_fire_1) begin
      _zz_1 = 1'b1;
    end
  end

  assign pushCC_pushPtrPlus = (pushCC_pushPtr + 10'h001);
  assign io_push_fire = (io_push_valid && io_push_ready);
  assign pushCC_popPtrGray = popToPushGray_buffercc_io_dataOut;
  assign pushCC_full = ((pushCC_pushPtrGray[9 : 8] == (~ pushCC_popPtrGray[9 : 8])) && (pushCC_pushPtrGray[7 : 0] == pushCC_popPtrGray[7 : 0]));
  assign io_push_ready = (! pushCC_full);
  assign io_push_fire_1 = (io_push_valid && io_push_ready);
  assign _zz_io_pushOccupancy = (pushCC_popPtrGray[1] ^ _zz_io_pushOccupancy_1);
  assign _zz_io_pushOccupancy_1 = (pushCC_popPtrGray[2] ^ _zz_io_pushOccupancy_2);
  assign _zz_io_pushOccupancy_2 = (pushCC_popPtrGray[3] ^ _zz_io_pushOccupancy_3);
  assign _zz_io_pushOccupancy_3 = (pushCC_popPtrGray[4] ^ _zz_io_pushOccupancy_4);
  assign _zz_io_pushOccupancy_4 = (pushCC_popPtrGray[5] ^ _zz_io_pushOccupancy_5);
  assign _zz_io_pushOccupancy_5 = (pushCC_popPtrGray[6] ^ _zz_io_pushOccupancy_6);
  assign _zz_io_pushOccupancy_6 = (pushCC_popPtrGray[7] ^ _zz_io_pushOccupancy_7);
  assign _zz_io_pushOccupancy_7 = (pushCC_popPtrGray[8] ^ _zz_io_pushOccupancy_8);
  assign _zz_io_pushOccupancy_8 = pushCC_popPtrGray[9];
  assign io_pushOccupancy = (pushCC_pushPtr - {_zz_io_pushOccupancy_8,{_zz_io_pushOccupancy_7,{_zz_io_pushOccupancy_6,{_zz_io_pushOccupancy_5,{_zz_io_pushOccupancy_4,{_zz_io_pushOccupancy_3,{_zz_io_pushOccupancy_2,{_zz_io_pushOccupancy_1,{_zz_io_pushOccupancy,(_zz_io_pushOccupancy_9 ^ _zz_io_pushOccupancy)}}}}}}}}});
  assign popCC_popPtrPlus = (popCC_popPtr + 10'h001);
  assign io_pop_fire = (io_pop_valid && io_pop_ready);
  assign popCC_pushPtrGray = pushToPopGray_buffercc_io_dataOut;
  assign popCC_empty = (popCC_popPtrGray == popCC_pushPtrGray);
  assign io_pop_valid = (! popCC_empty);
  assign io_pop_fire_1 = (io_pop_valid && io_pop_ready);
  assign _zz_io_pop_payload_last = (io_pop_fire_1 ? popCC_popPtrPlus : popCC_popPtr);
  assign _zz_io_pop_payload_last_1 = _zz_ram_port1;
  assign io_pop_payload_last = _zz_io_pop_payload_last_1[0];
  assign io_pop_payload_fragment = _zz_io_pop_payload_last_1[32 : 1];
  assign io_pop_fire_2 = (io_pop_valid && io_pop_ready);
  assign _zz_io_popOccupancy = (popCC_pushPtrGray[1] ^ _zz_io_popOccupancy_1);
  assign _zz_io_popOccupancy_1 = (popCC_pushPtrGray[2] ^ _zz_io_popOccupancy_2);
  assign _zz_io_popOccupancy_2 = (popCC_pushPtrGray[3] ^ _zz_io_popOccupancy_3);
  assign _zz_io_popOccupancy_3 = (popCC_pushPtrGray[4] ^ _zz_io_popOccupancy_4);
  assign _zz_io_popOccupancy_4 = (popCC_pushPtrGray[5] ^ _zz_io_popOccupancy_5);
  assign _zz_io_popOccupancy_5 = (popCC_pushPtrGray[6] ^ _zz_io_popOccupancy_6);
  assign _zz_io_popOccupancy_6 = (popCC_pushPtrGray[7] ^ _zz_io_popOccupancy_7);
  assign _zz_io_popOccupancy_7 = (popCC_pushPtrGray[8] ^ _zz_io_popOccupancy_8);
  assign _zz_io_popOccupancy_8 = popCC_pushPtrGray[9];
  assign io_popOccupancy = ({_zz_io_popOccupancy_8,{_zz_io_popOccupancy_7,{_zz_io_popOccupancy_6,{_zz_io_popOccupancy_5,{_zz_io_popOccupancy_4,{_zz_io_popOccupancy_3,{_zz_io_popOccupancy_2,{_zz_io_popOccupancy_1,{_zz_io_popOccupancy,_zz_io_popOccupancy_9}}}}}}}}} - popCC_popPtr);
  assign pushToPopGray = pushCC_pushPtrGray;
  assign popToPushGray = popCC_popPtrGray;
  always @(posedge vgaClk or posedge resetCtrl_vgaReset) begin
    if(resetCtrl_vgaReset) begin
      pushCC_pushPtr <= 10'h0;
      pushCC_pushPtrGray <= 10'h0;
      popCC_popPtr <= 10'h0;
      popCC_popPtrGray <= 10'h0;
    end else begin
      if(io_push_fire) begin
        pushCC_pushPtrGray <= (_zz_pushCC_pushPtrGray ^ pushCC_pushPtrPlus);
      end
      if(io_push_fire_1) begin
        pushCC_pushPtr <= pushCC_pushPtrPlus;
      end
      if(io_pop_fire) begin
        popCC_popPtrGray <= (_zz_popCC_popPtrGray ^ popCC_popPtrPlus);
      end
      if(io_pop_fire_2) begin
        popCC_popPtr <= popCC_popPtrPlus;
      end
    end
  end


endmodule

module StreamFifoLowLatency (
  input               io_push_valid,
  output              io_push_ready,
  input      [31:0]   io_push_payload_data,
  input      [3:0]    io_push_payload_context_id,
  input               io_push_payload_context_last,
  output reg          io_pop_valid,
  input               io_pop_ready,
  output reg [31:0]   io_pop_payload_data,
  output reg [3:0]    io_pop_payload_context_id,
  output reg          io_pop_payload_context_last,
  input               io_flush,
  output     [1:0]    io_occupancy,
  input               sdramCtrlClk,
  input               resetCtrl_sdramReset
);

  wire       [36:0]   _zz_ram_port0;
  wire       [36:0]   _zz_ram_port;
  reg                 _zz_1;
  reg                 pushPtr_willIncrement;
  reg                 pushPtr_willClear;
  reg        [0:0]    pushPtr_valueNext;
  reg        [0:0]    pushPtr_value;
  wire                pushPtr_willOverflowIfInc;
  wire                pushPtr_willOverflow;
  reg                 popPtr_willIncrement;
  reg                 popPtr_willClear;
  reg        [0:0]    popPtr_valueNext;
  reg        [0:0]    popPtr_value;
  wire                popPtr_willOverflowIfInc;
  wire                popPtr_willOverflow;
  wire                ptrMatch;
  reg                 risingOccupancy;
  wire                empty;
  wire                full;
  wire                pushing;
  wire                popping;
  wire       [31:0]   readed_data;
  wire       [3:0]    readed_context_id;
  wire                readed_context_last;
  wire       [36:0]   _zz_readed_data;
  wire       [4:0]    _zz_readed_context_id;
  wire                when_Stream_l1011;
  wire                when_Stream_l1024;
  wire       [0:0]    ptrDif;
  (* ram_style = "distributed" *) reg [36:0] ram [0:1];

  assign _zz_ram_port = {{io_push_payload_context_last,io_push_payload_context_id},io_push_payload_data};
  assign _zz_ram_port0 = ram[popPtr_value];
  always @(posedge sdramCtrlClk) begin
    if(_zz_1) begin
      ram[pushPtr_value] <= _zz_ram_port;
    end
  end

  always @(*) begin
    _zz_1 = 1'b0;
    if(pushing) begin
      _zz_1 = 1'b1;
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

  assign pushPtr_willOverflowIfInc = (pushPtr_value == 1'b1);
  assign pushPtr_willOverflow = (pushPtr_willOverflowIfInc && pushPtr_willIncrement);
  always @(*) begin
    pushPtr_valueNext = (pushPtr_value + pushPtr_willIncrement);
    if(pushPtr_willClear) begin
      pushPtr_valueNext = 1'b0;
    end
  end

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

  assign popPtr_willOverflowIfInc = (popPtr_value == 1'b1);
  assign popPtr_willOverflow = (popPtr_willOverflowIfInc && popPtr_willIncrement);
  always @(*) begin
    popPtr_valueNext = (popPtr_value + popPtr_willIncrement);
    if(popPtr_willClear) begin
      popPtr_valueNext = 1'b0;
    end
  end

  assign ptrMatch = (pushPtr_value == popPtr_value);
  assign empty = (ptrMatch && (! risingOccupancy));
  assign full = (ptrMatch && risingOccupancy);
  assign pushing = (io_push_valid && io_push_ready);
  assign popping = (io_pop_valid && io_pop_ready);
  assign io_push_ready = (! full);
  assign _zz_readed_data = _zz_ram_port0;
  assign readed_data = _zz_readed_data[31 : 0];
  assign _zz_readed_context_id = _zz_readed_data[36 : 32];
  assign readed_context_id = _zz_readed_context_id[3 : 0];
  assign readed_context_last = _zz_readed_context_id[4];
  assign when_Stream_l1011 = (! empty);
  always @(*) begin
    if(when_Stream_l1011) begin
      io_pop_valid = 1'b1;
    end else begin
      io_pop_valid = io_push_valid;
    end
  end

  always @(*) begin
    if(when_Stream_l1011) begin
      io_pop_payload_data = readed_data;
    end else begin
      io_pop_payload_data = io_push_payload_data;
    end
  end

  always @(*) begin
    if(when_Stream_l1011) begin
      io_pop_payload_context_id = readed_context_id;
    end else begin
      io_pop_payload_context_id = io_push_payload_context_id;
    end
  end

  always @(*) begin
    if(when_Stream_l1011) begin
      io_pop_payload_context_last = readed_context_last;
    end else begin
      io_pop_payload_context_last = io_push_payload_context_last;
    end
  end

  assign when_Stream_l1024 = (pushing != popping);
  assign ptrDif = (pushPtr_value - popPtr_value);
  assign io_occupancy = {(risingOccupancy && ptrMatch),ptrDif};
  always @(posedge sdramCtrlClk or posedge resetCtrl_sdramReset) begin
    if(resetCtrl_sdramReset) begin
      pushPtr_value <= 1'b0;
      popPtr_value <= 1'b0;
      risingOccupancy <= 1'b0;
    end else begin
      pushPtr_value <= pushPtr_valueNext;
      popPtr_value <= popPtr_valueNext;
      if(when_Stream_l1024) begin
        risingOccupancy <= pushing;
      end
      if(io_flush) begin
        risingOccupancy <= 1'b0;
      end
    end
  end


endmodule

module BufferCC_2 (
  input               io_dataIn,
  output              io_dataOut,
  input               axiClk,
  input               resetCtrl_axiReset
);

  (* async_reg = "true" *) reg                 buffers_0;
  (* async_reg = "true" *) reg                 buffers_1;

  assign io_dataOut = buffers_1;
  always @(posedge axiClk or posedge resetCtrl_axiReset) begin
    if(resetCtrl_axiReset) begin
      buffers_0 <= 1'b0;
      buffers_1 <= 1'b0;
    end else begin
      buffers_0 <= io_dataIn;
      buffers_1 <= buffers_0;
    end
  end


endmodule

//BufferCC replaced by BufferCC

module BufferCC (
  input      [9:0]    io_dataIn,
  output     [9:0]    io_dataOut,
  input               vgaClk,
  input               resetCtrl_vgaReset
);

  (* async_reg = "true" *) reg        [9:0]    buffers_0;
  (* async_reg = "true" *) reg        [9:0]    buffers_1;

  assign io_dataOut = buffers_1;
  always @(posedge vgaClk or posedge resetCtrl_vgaReset) begin
    if(resetCtrl_vgaReset) begin
      buffers_0 <= 10'h0;
      buffers_1 <= 10'h0;
    end else begin
      buffers_0 <= io_dataIn;
      buffers_1 <= buffers_0;
    end
  end


endmodule
