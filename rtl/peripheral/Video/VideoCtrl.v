// Generator : SpinalHDL v1.6.4    git head : 598c18959149eb18e5eee5b0aa3eef01ecaa41a1
// Component : VideoCtrl
// Git hash  : c09e4718988e88149d39e867a2ac8be7a7b37b58

`timescale 1ns/1ps 

module VideoCtrl (
  input               wb_clock,
  input               wb_reset,
  input               video_clock,
  input               video_reset,
  input               i_hdmi_tx_int,
  input               bus_CYC,
  input               bus_STB,
  output reg          bus_ACK,
  input               bus_WE,
  input      [4:0]    bus_ADR,
  output     [31:0]   bus_DAT_MISO,
  input      [31:0]   bus_DAT_MOSI,
  output              vga_vSync,
  output              vga_hSync,
  output              vga_colorEn,
  output     [4:0]    vga_color_r,
  output     [5:0]    vga_color_g,
  output     [4:0]    vga_color_b,
  output              frameStart,
  input               pixels_valid,
  output              pixels_ready,
  input      [4:0]    pixels_payload_r,
  input      [5:0]    pixels_payload_g,
  input      [4:0]    pixels_payload_b
);
  localparam wbArea_fsm_enumDef_BOOT = 3'd0;
  localparam wbArea_fsm_enumDef_Init = 3'd1;
  localparam wbArea_fsm_enumDef_Idle = 3'd2;
  localparam wbArea_fsm_enumDef_Write = 3'd3;
  localparam wbArea_fsm_enumDef_Read = 3'd4;
  localparam videoArea_fsm_enumDef_BOOT = 3'd0;
  localparam videoArea_fsm_enumDef_Init = 3'd1;
  localparam videoArea_fsm_enumDef_Idle = 3'd2;
  localparam videoArea_fsm_enumDef_Read = 3'd3;
  localparam videoArea_fsm_enumDef_Write = 3'd4;

  wire                fromWbStreamFifo_io_push_ready;
  wire                fromWbStreamFifo_io_pop_valid;
  wire                fromWbStreamFifo_io_pop_payload_we;
  wire       [4:0]    fromWbStreamFifo_io_pop_payload_adr;
  wire       [31:0]   fromWbStreamFifo_io_pop_payload_dat;
  wire       [1:0]    fromWbStreamFifo_io_pushOccupancy;
  wire       [1:0]    fromWbStreamFifo_io_popOccupancy;
  wire                fromVideoStreamFifo_io_push_ready;
  wire                fromVideoStreamFifo_io_pop_valid;
  wire       [31:0]   fromVideoStreamFifo_io_pop_payload_rdt;
  wire       [1:0]    fromVideoStreamFifo_io_pushOccupancy;
  wire       [1:0]    fromVideoStreamFifo_io_popOccupancy;
  wire                i_hdmi_tx_int_buffercc_io_dataOut;
  wire                videoArea_vgaCtrl_io_frameStart;
  wire                videoArea_vgaCtrl_io_pixels_ready;
  wire                videoArea_vgaCtrl_io_vga_vSync;
  wire                videoArea_vgaCtrl_io_vga_hSync;
  wire                videoArea_vgaCtrl_io_vga_colorEn;
  wire       [4:0]    videoArea_vgaCtrl_io_vga_color_r;
  wire       [5:0]    videoArea_vgaCtrl_io_vga_color_g;
  wire       [4:0]    videoArea_vgaCtrl_io_vga_color_b;
  wire                videoArea_vgaCtrl_io_error;
  reg                 fromWbToCdcStream_valid;
  wire                fromWbToCdcStream_ready;
  wire                fromWbToCdcStream_payload_we;
  wire       [4:0]    fromWbToCdcStream_payload_adr;
  wire       [31:0]   fromWbToCdcStream_payload_dat;
  wire                fromCdcToVideoStream_valid;
  reg                 fromCdcToVideoStream_ready;
  wire                fromCdcToVideoStream_payload_we;
  wire       [4:0]    fromCdcToVideoStream_payload_adr;
  wire       [31:0]   fromCdcToVideoStream_payload_dat;
  reg                 fromVideoToCdcStream_valid;
  wire                fromVideoToCdcStream_ready;
  wire       [31:0]   fromVideoToCdcStream_payload_rdt;
  wire                fromCdcToWbStream_valid;
  reg                 fromCdcToWbStream_ready;
  wire       [31:0]   fromCdcToWbStream_payload_rdt;
  wire                video_ready_wire;
  wire                wbArea_fsm_wantExit;
  reg                 wbArea_fsm_wantStart;
  wire                wbArea_fsm_wantKill;
  wire                videoArea_hdmi_tx_int;
  reg                 videoArea_wb_CYC;
  reg                 videoArea_wb_STB;
  wire                videoArea_wb_ACK;
  wire                videoArea_wb_WE;
  wire       [4:0]    videoArea_wb_ADR;
  reg        [31:0]   videoArea_wb_DAT_MISO;
  wire       [31:0]   videoArea_wb_DAT_MOSI;
  reg                 videoArea_video_ready;
  wire                videoArea_fsm_wantExit;
  reg                 videoArea_fsm_wantStart;
  wire                videoArea_fsm_wantKill;
  wire                videoArea_busCtrl_askWrite;
  wire                videoArea_busCtrl_askRead;
  wire                videoArea_busCtrl_doWrite;
  wire                videoArea_busCtrl_doRead;
  reg                 _zz_videoArea_wb_ACK;
  wire       [6:0]    videoArea_busCtrl_byteAddress;
  reg        [11:0]   videoArea_vgaCtrl_io_timings_h_syncStart_driver;
  reg        [11:0]   videoArea_vgaCtrl_io_timings_h_syncEnd_driver;
  reg        [11:0]   videoArea_vgaCtrl_io_timings_h_colorStart_driver;
  reg        [11:0]   videoArea_vgaCtrl_io_timings_h_colorEnd_driver;
  reg        [11:0]   videoArea_vgaCtrl_io_timings_v_syncStart_driver;
  reg        [11:0]   videoArea_vgaCtrl_io_timings_v_syncEnd_driver;
  reg        [11:0]   videoArea_vgaCtrl_io_timings_v_colorStart_driver;
  reg        [11:0]   videoArea_vgaCtrl_io_timings_v_colorEnd_driver;
  reg                 videoArea_vgaCtrl_io_timings_h_polarity_driver;
  reg                 videoArea_vgaCtrl_io_timings_v_polarity_driver;
  reg                 videoArea_vgaCtrl_io_softReset_soft_reset_driver;
  reg        [2:0]    wbArea_fsm_stateReg;
  reg        [2:0]    wbArea_fsm_stateNext;
  wire                when_Video_l146;
  reg        [2:0]    videoArea_fsm_stateReg;
  reg        [2:0]    videoArea_fsm_stateNext;
  `ifndef SYNTHESIS
  reg [39:0] wbArea_fsm_stateReg_string;
  reg [39:0] wbArea_fsm_stateNext_string;
  reg [39:0] videoArea_fsm_stateReg_string;
  reg [39:0] videoArea_fsm_stateNext_string;
  `endif


  VideoCtrl_StreamFifoCC fromWbStreamFifo (
    .io_push_valid          (fromWbToCdcStream_valid                    ), //i
    .io_push_ready          (fromWbStreamFifo_io_push_ready             ), //o
    .io_push_payload_we     (fromWbToCdcStream_payload_we               ), //i
    .io_push_payload_adr    (fromWbToCdcStream_payload_adr[4:0]         ), //i
    .io_push_payload_dat    (fromWbToCdcStream_payload_dat[31:0]        ), //i
    .io_pop_valid           (fromWbStreamFifo_io_pop_valid              ), //o
    .io_pop_ready           (fromCdcToVideoStream_ready                 ), //i
    .io_pop_payload_we      (fromWbStreamFifo_io_pop_payload_we         ), //o
    .io_pop_payload_adr     (fromWbStreamFifo_io_pop_payload_adr[4:0]   ), //o
    .io_pop_payload_dat     (fromWbStreamFifo_io_pop_payload_dat[31:0]  ), //o
    .io_pushOccupancy       (fromWbStreamFifo_io_pushOccupancy[1:0]     ), //o
    .io_popOccupancy        (fromWbStreamFifo_io_popOccupancy[1:0]      ), //o
    .wb_clock               (wb_clock                                   ), //i
    .wb_reset               (wb_reset                                   ), //i
    .video_clock            (video_clock                                )  //i
  );
  VideoCtrl_StreamFifoCC_1 fromVideoStreamFifo (
    .io_push_valid          (fromVideoToCdcStream_valid                    ), //i
    .io_push_ready          (fromVideoStreamFifo_io_push_ready             ), //o
    .io_push_payload_rdt    (fromVideoToCdcStream_payload_rdt[31:0]        ), //i
    .io_pop_valid           (fromVideoStreamFifo_io_pop_valid              ), //o
    .io_pop_ready           (fromCdcToWbStream_ready                       ), //i
    .io_pop_payload_rdt     (fromVideoStreamFifo_io_pop_payload_rdt[31:0]  ), //o
    .io_pushOccupancy       (fromVideoStreamFifo_io_pushOccupancy[1:0]     ), //o
    .io_popOccupancy        (fromVideoStreamFifo_io_popOccupancy[1:0]      ), //o
    .video_clock            (video_clock                                   ), //i
    .video_reset            (video_reset                                   ), //i
    .wb_clock               (wb_clock                                      )  //i
  );
  VideoCtrl_BufferCC_6 i_hdmi_tx_int_buffercc (
    .io_dataIn      (i_hdmi_tx_int                      ), //i
    .io_dataOut     (i_hdmi_tx_int_buffercc_io_dataOut  ), //o
    .video_clock    (video_clock                        ), //i
    .video_reset    (video_reset                        )  //i
  );
  VideoCtrl_VgaCtrl videoArea_vgaCtrl (
    .io_softReset_soft_reset    (videoArea_vgaCtrl_io_softReset_soft_reset_driver        ), //i
    .io_timings_h_syncStart     (videoArea_vgaCtrl_io_timings_h_syncStart_driver[11:0]   ), //i
    .io_timings_h_syncEnd       (videoArea_vgaCtrl_io_timings_h_syncEnd_driver[11:0]     ), //i
    .io_timings_h_colorStart    (videoArea_vgaCtrl_io_timings_h_colorStart_driver[11:0]  ), //i
    .io_timings_h_colorEnd      (videoArea_vgaCtrl_io_timings_h_colorEnd_driver[11:0]    ), //i
    .io_timings_h_polarity      (videoArea_vgaCtrl_io_timings_h_polarity_driver          ), //i
    .io_timings_v_syncStart     (videoArea_vgaCtrl_io_timings_v_syncStart_driver[11:0]   ), //i
    .io_timings_v_syncEnd       (videoArea_vgaCtrl_io_timings_v_syncEnd_driver[11:0]     ), //i
    .io_timings_v_colorStart    (videoArea_vgaCtrl_io_timings_v_colorStart_driver[11:0]  ), //i
    .io_timings_v_colorEnd      (videoArea_vgaCtrl_io_timings_v_colorEnd_driver[11:0]    ), //i
    .io_timings_v_polarity      (videoArea_vgaCtrl_io_timings_v_polarity_driver          ), //i
    .io_hdmi_tx_int             (videoArea_hdmi_tx_int                                   ), //i
    .io_frameStart              (videoArea_vgaCtrl_io_frameStart                         ), //o
    .io_pixels_valid            (pixels_valid                                            ), //i
    .io_pixels_ready            (videoArea_vgaCtrl_io_pixels_ready                       ), //o
    .io_pixels_payload_r        (pixels_payload_r[4:0]                                   ), //i
    .io_pixels_payload_g        (pixels_payload_g[5:0]                                   ), //i
    .io_pixels_payload_b        (pixels_payload_b[4:0]                                   ), //i
    .io_vga_vSync               (videoArea_vgaCtrl_io_vga_vSync                          ), //o
    .io_vga_hSync               (videoArea_vgaCtrl_io_vga_hSync                          ), //o
    .io_vga_colorEn             (videoArea_vgaCtrl_io_vga_colorEn                        ), //o
    .io_vga_color_r             (videoArea_vgaCtrl_io_vga_color_r[4:0]                   ), //o
    .io_vga_color_g             (videoArea_vgaCtrl_io_vga_color_g[5:0]                   ), //o
    .io_vga_color_b             (videoArea_vgaCtrl_io_vga_color_b[4:0]                   ), //o
    .io_error                   (videoArea_vgaCtrl_io_error                              ), //o
    .video_clock                (video_clock                                             ), //i
    .video_reset                (video_reset                                             )  //i
  );
  `ifndef SYNTHESIS
  always @(*) begin
    case(wbArea_fsm_stateReg)
      wbArea_fsm_enumDef_BOOT : wbArea_fsm_stateReg_string = "BOOT ";
      wbArea_fsm_enumDef_Init : wbArea_fsm_stateReg_string = "Init ";
      wbArea_fsm_enumDef_Idle : wbArea_fsm_stateReg_string = "Idle ";
      wbArea_fsm_enumDef_Write : wbArea_fsm_stateReg_string = "Write";
      wbArea_fsm_enumDef_Read : wbArea_fsm_stateReg_string = "Read ";
      default : wbArea_fsm_stateReg_string = "?????";
    endcase
  end
  always @(*) begin
    case(wbArea_fsm_stateNext)
      wbArea_fsm_enumDef_BOOT : wbArea_fsm_stateNext_string = "BOOT ";
      wbArea_fsm_enumDef_Init : wbArea_fsm_stateNext_string = "Init ";
      wbArea_fsm_enumDef_Idle : wbArea_fsm_stateNext_string = "Idle ";
      wbArea_fsm_enumDef_Write : wbArea_fsm_stateNext_string = "Write";
      wbArea_fsm_enumDef_Read : wbArea_fsm_stateNext_string = "Read ";
      default : wbArea_fsm_stateNext_string = "?????";
    endcase
  end
  always @(*) begin
    case(videoArea_fsm_stateReg)
      videoArea_fsm_enumDef_BOOT : videoArea_fsm_stateReg_string = "BOOT ";
      videoArea_fsm_enumDef_Init : videoArea_fsm_stateReg_string = "Init ";
      videoArea_fsm_enumDef_Idle : videoArea_fsm_stateReg_string = "Idle ";
      videoArea_fsm_enumDef_Read : videoArea_fsm_stateReg_string = "Read ";
      videoArea_fsm_enumDef_Write : videoArea_fsm_stateReg_string = "Write";
      default : videoArea_fsm_stateReg_string = "?????";
    endcase
  end
  always @(*) begin
    case(videoArea_fsm_stateNext)
      videoArea_fsm_enumDef_BOOT : videoArea_fsm_stateNext_string = "BOOT ";
      videoArea_fsm_enumDef_Init : videoArea_fsm_stateNext_string = "Init ";
      videoArea_fsm_enumDef_Idle : videoArea_fsm_stateNext_string = "Idle ";
      videoArea_fsm_enumDef_Read : videoArea_fsm_stateNext_string = "Read ";
      videoArea_fsm_enumDef_Write : videoArea_fsm_stateNext_string = "Write";
      default : videoArea_fsm_stateNext_string = "?????";
    endcase
  end
  `endif

  always @(*) begin
    fromWbToCdcStream_valid = 1'b0;
    case(wbArea_fsm_stateReg)
      wbArea_fsm_enumDef_Init : begin
      end
      wbArea_fsm_enumDef_Idle : begin
        if(when_Video_l146) begin
          fromWbToCdcStream_valid = 1'b1;
        end
      end
      wbArea_fsm_enumDef_Write : begin
      end
      wbArea_fsm_enumDef_Read : begin
      end
      default : begin
      end
    endcase
  end

  assign fromWbToCdcStream_payload_adr = bus_ADR;
  assign fromWbToCdcStream_payload_dat = bus_DAT_MOSI;
  assign fromWbToCdcStream_payload_we = bus_WE;
  always @(*) begin
    fromCdcToVideoStream_ready = 1'b0;
    case(videoArea_fsm_stateReg)
      videoArea_fsm_enumDef_Init : begin
      end
      videoArea_fsm_enumDef_Idle : begin
      end
      videoArea_fsm_enumDef_Read : begin
        if(videoArea_wb_ACK) begin
          fromCdcToVideoStream_ready = 1'b1;
        end
      end
      videoArea_fsm_enumDef_Write : begin
        if(videoArea_wb_ACK) begin
          fromCdcToVideoStream_ready = 1'b1;
        end
      end
      default : begin
      end
    endcase
  end

  assign fromWbToCdcStream_ready = fromWbStreamFifo_io_push_ready;
  assign fromCdcToVideoStream_valid = fromWbStreamFifo_io_pop_valid;
  assign fromCdcToVideoStream_payload_we = fromWbStreamFifo_io_pop_payload_we;
  assign fromCdcToVideoStream_payload_adr = fromWbStreamFifo_io_pop_payload_adr;
  assign fromCdcToVideoStream_payload_dat = fromWbStreamFifo_io_pop_payload_dat;
  always @(*) begin
    fromVideoToCdcStream_valid = 1'b0;
    case(videoArea_fsm_stateReg)
      videoArea_fsm_enumDef_Init : begin
      end
      videoArea_fsm_enumDef_Idle : begin
      end
      videoArea_fsm_enumDef_Read : begin
        if(videoArea_wb_ACK) begin
          fromVideoToCdcStream_valid = 1'b1;
        end
      end
      videoArea_fsm_enumDef_Write : begin
      end
      default : begin
      end
    endcase
  end

  always @(*) begin
    fromCdcToWbStream_ready = 1'b0;
    case(wbArea_fsm_stateReg)
      wbArea_fsm_enumDef_Init : begin
      end
      wbArea_fsm_enumDef_Idle : begin
      end
      wbArea_fsm_enumDef_Write : begin
      end
      wbArea_fsm_enumDef_Read : begin
        if(fromCdcToWbStream_valid) begin
          fromCdcToWbStream_ready = 1'b1;
        end
      end
      default : begin
      end
    endcase
  end

  assign bus_DAT_MISO = fromCdcToWbStream_payload_rdt;
  always @(*) begin
    bus_ACK = 1'b0;
    case(wbArea_fsm_stateReg)
      wbArea_fsm_enumDef_Init : begin
      end
      wbArea_fsm_enumDef_Idle : begin
        if(when_Video_l146) begin
          if(bus_WE) begin
            bus_ACK = 1'b1;
          end
        end
      end
      wbArea_fsm_enumDef_Write : begin
      end
      wbArea_fsm_enumDef_Read : begin
        if(fromCdcToWbStream_valid) begin
          bus_ACK = 1'b1;
        end
      end
      default : begin
      end
    endcase
  end

  assign fromVideoToCdcStream_ready = fromVideoStreamFifo_io_push_ready;
  assign fromCdcToWbStream_valid = fromVideoStreamFifo_io_pop_valid;
  assign fromCdcToWbStream_payload_rdt = fromVideoStreamFifo_io_pop_payload_rdt;
  assign wbArea_fsm_wantExit = 1'b0;
  always @(*) begin
    wbArea_fsm_wantStart = 1'b0;
    case(wbArea_fsm_stateReg)
      wbArea_fsm_enumDef_Init : begin
      end
      wbArea_fsm_enumDef_Idle : begin
      end
      wbArea_fsm_enumDef_Write : begin
      end
      wbArea_fsm_enumDef_Read : begin
      end
      default : begin
        wbArea_fsm_wantStart = 1'b1;
      end
    endcase
  end

  assign wbArea_fsm_wantKill = 1'b0;
  assign videoArea_hdmi_tx_int = i_hdmi_tx_int_buffercc_io_dataOut;
  assign video_ready_wire = videoArea_video_ready;
  always @(*) begin
    videoArea_wb_CYC = 1'b0;
    case(videoArea_fsm_stateReg)
      videoArea_fsm_enumDef_Init : begin
      end
      videoArea_fsm_enumDef_Idle : begin
        if(fromCdcToVideoStream_valid) begin
          videoArea_wb_CYC = 1'b1;
        end
      end
      videoArea_fsm_enumDef_Read : begin
        videoArea_wb_CYC = 1'b1;
      end
      videoArea_fsm_enumDef_Write : begin
        videoArea_wb_CYC = 1'b1;
      end
      default : begin
      end
    endcase
  end

  always @(*) begin
    videoArea_wb_STB = 1'b0;
    case(videoArea_fsm_stateReg)
      videoArea_fsm_enumDef_Init : begin
      end
      videoArea_fsm_enumDef_Idle : begin
        if(fromCdcToVideoStream_valid) begin
          videoArea_wb_STB = 1'b1;
        end
      end
      videoArea_fsm_enumDef_Read : begin
        videoArea_wb_STB = 1'b1;
      end
      videoArea_fsm_enumDef_Write : begin
        videoArea_wb_STB = 1'b1;
      end
      default : begin
      end
    endcase
  end

  assign videoArea_wb_WE = fromCdcToVideoStream_payload_we;
  assign videoArea_wb_DAT_MOSI = fromCdcToVideoStream_payload_dat;
  assign videoArea_wb_ADR = fromCdcToVideoStream_payload_adr;
  assign fromVideoToCdcStream_payload_rdt = videoArea_wb_DAT_MISO;
  assign videoArea_fsm_wantExit = 1'b0;
  always @(*) begin
    videoArea_fsm_wantStart = 1'b0;
    case(videoArea_fsm_stateReg)
      videoArea_fsm_enumDef_Init : begin
      end
      videoArea_fsm_enumDef_Idle : begin
      end
      videoArea_fsm_enumDef_Read : begin
      end
      videoArea_fsm_enumDef_Write : begin
      end
      default : begin
        videoArea_fsm_wantStart = 1'b1;
      end
    endcase
  end

  assign videoArea_fsm_wantKill = 1'b0;
  always @(*) begin
    videoArea_wb_DAT_MISO = 32'h0;
    case(videoArea_busCtrl_byteAddress)
      7'h20 : begin
        videoArea_wb_DAT_MISO[3 : 3] = videoArea_hdmi_tx_int;
        videoArea_wb_DAT_MISO[0 : 0] = videoArea_vgaCtrl_io_timings_h_polarity_driver;
        videoArea_wb_DAT_MISO[1 : 1] = videoArea_vgaCtrl_io_timings_v_polarity_driver;
        videoArea_wb_DAT_MISO[2 : 2] = videoArea_vgaCtrl_io_softReset_soft_reset_driver;
      end
      7'h0 : begin
        videoArea_wb_DAT_MISO[11 : 0] = videoArea_vgaCtrl_io_timings_h_syncStart_driver;
      end
      7'h04 : begin
        videoArea_wb_DAT_MISO[11 : 0] = videoArea_vgaCtrl_io_timings_h_syncEnd_driver;
      end
      7'h08 : begin
        videoArea_wb_DAT_MISO[11 : 0] = videoArea_vgaCtrl_io_timings_h_colorStart_driver;
      end
      7'h0c : begin
        videoArea_wb_DAT_MISO[11 : 0] = videoArea_vgaCtrl_io_timings_h_colorEnd_driver;
      end
      7'h10 : begin
        videoArea_wb_DAT_MISO[11 : 0] = videoArea_vgaCtrl_io_timings_v_syncStart_driver;
      end
      7'h14 : begin
        videoArea_wb_DAT_MISO[11 : 0] = videoArea_vgaCtrl_io_timings_v_syncEnd_driver;
      end
      7'h18 : begin
        videoArea_wb_DAT_MISO[11 : 0] = videoArea_vgaCtrl_io_timings_v_colorStart_driver;
      end
      7'h1c : begin
        videoArea_wb_DAT_MISO[11 : 0] = videoArea_vgaCtrl_io_timings_v_colorEnd_driver;
      end
      default : begin
      end
    endcase
  end

  assign videoArea_busCtrl_askWrite = ((videoArea_wb_CYC && videoArea_wb_STB) && videoArea_wb_WE);
  assign videoArea_busCtrl_askRead = ((videoArea_wb_CYC && videoArea_wb_STB) && (! videoArea_wb_WE));
  assign videoArea_busCtrl_doWrite = (((videoArea_wb_CYC && videoArea_wb_STB) && ((videoArea_wb_CYC && videoArea_wb_ACK) && videoArea_wb_STB)) && videoArea_wb_WE);
  assign videoArea_busCtrl_doRead = (((videoArea_wb_CYC && videoArea_wb_STB) && ((videoArea_wb_CYC && videoArea_wb_ACK) && videoArea_wb_STB)) && (! videoArea_wb_WE));
  assign videoArea_wb_ACK = (_zz_videoArea_wb_ACK && videoArea_wb_STB);
  assign videoArea_busCtrl_byteAddress = ({2'd0,videoArea_wb_ADR} <<< 2);
  assign vga_vSync = videoArea_vgaCtrl_io_vga_vSync;
  assign vga_hSync = videoArea_vgaCtrl_io_vga_hSync;
  assign vga_colorEn = videoArea_vgaCtrl_io_vga_colorEn;
  assign vga_color_r = videoArea_vgaCtrl_io_vga_color_r;
  assign vga_color_g = videoArea_vgaCtrl_io_vga_color_g;
  assign vga_color_b = videoArea_vgaCtrl_io_vga_color_b;
  assign frameStart = videoArea_vgaCtrl_io_frameStart;
  assign pixels_ready = videoArea_vgaCtrl_io_pixels_ready;
  always @(*) begin
    wbArea_fsm_stateNext = wbArea_fsm_stateReg;
    case(wbArea_fsm_stateReg)
      wbArea_fsm_enumDef_Init : begin
        wbArea_fsm_stateNext = wbArea_fsm_enumDef_Idle;
      end
      wbArea_fsm_enumDef_Idle : begin
        if(when_Video_l146) begin
          if(bus_WE) begin
            wbArea_fsm_stateNext = wbArea_fsm_enumDef_Idle;
          end else begin
            wbArea_fsm_stateNext = wbArea_fsm_enumDef_Read;
          end
        end
      end
      wbArea_fsm_enumDef_Write : begin
      end
      wbArea_fsm_enumDef_Read : begin
        if(fromCdcToWbStream_valid) begin
          wbArea_fsm_stateNext = wbArea_fsm_enumDef_Idle;
        end
      end
      default : begin
      end
    endcase
    if(wbArea_fsm_wantStart) begin
      wbArea_fsm_stateNext = wbArea_fsm_enumDef_Init;
    end
    if(wbArea_fsm_wantKill) begin
      wbArea_fsm_stateNext = wbArea_fsm_enumDef_BOOT;
    end
  end

  assign when_Video_l146 = ((bus_CYC && bus_STB) && (fromWbStreamFifo_io_pushOccupancy < 2'b10));
  always @(*) begin
    videoArea_fsm_stateNext = videoArea_fsm_stateReg;
    case(videoArea_fsm_stateReg)
      videoArea_fsm_enumDef_Init : begin
        videoArea_fsm_stateNext = videoArea_fsm_enumDef_Idle;
      end
      videoArea_fsm_enumDef_Idle : begin
        if(fromCdcToVideoStream_valid) begin
          if(fromCdcToVideoStream_payload_we) begin
            videoArea_fsm_stateNext = videoArea_fsm_enumDef_Write;
          end else begin
            videoArea_fsm_stateNext = videoArea_fsm_enumDef_Read;
          end
        end
      end
      videoArea_fsm_enumDef_Read : begin
        if(videoArea_wb_ACK) begin
          videoArea_fsm_stateNext = videoArea_fsm_enumDef_Idle;
        end
      end
      videoArea_fsm_enumDef_Write : begin
        if(videoArea_wb_ACK) begin
          videoArea_fsm_stateNext = videoArea_fsm_enumDef_Idle;
        end
      end
      default : begin
      end
    endcase
    if(videoArea_fsm_wantStart) begin
      videoArea_fsm_stateNext = videoArea_fsm_enumDef_Init;
    end
    if(videoArea_fsm_wantKill) begin
      videoArea_fsm_stateNext = videoArea_fsm_enumDef_BOOT;
    end
  end

  always @(posedge video_clock or posedge video_reset) begin
    if(video_reset) begin
      videoArea_video_ready <= 1'b0;
      _zz_videoArea_wb_ACK <= 1'b0;
      videoArea_vgaCtrl_io_timings_h_polarity_driver <= 1'b0;
      videoArea_vgaCtrl_io_timings_v_polarity_driver <= 1'b0;
      videoArea_vgaCtrl_io_softReset_soft_reset_driver <= 1'b1;
      videoArea_fsm_stateReg <= videoArea_fsm_enumDef_BOOT;
    end else begin
      videoArea_video_ready <= 1'b0;
      _zz_videoArea_wb_ACK <= (videoArea_wb_STB && videoArea_wb_CYC);
      videoArea_fsm_stateReg <= videoArea_fsm_stateNext;
      case(videoArea_busCtrl_byteAddress)
        7'h20 : begin
          if(videoArea_busCtrl_doWrite) begin
            videoArea_vgaCtrl_io_timings_h_polarity_driver <= videoArea_wb_DAT_MOSI[0];
            videoArea_vgaCtrl_io_timings_v_polarity_driver <= videoArea_wb_DAT_MOSI[1];
            videoArea_vgaCtrl_io_softReset_soft_reset_driver <= videoArea_wb_DAT_MOSI[2];
          end
        end
        default : begin
        end
      endcase
    end
  end

  always @(posedge wb_clock or posedge wb_reset) begin
    if(wb_reset) begin
      wbArea_fsm_stateReg <= wbArea_fsm_enumDef_BOOT;
    end else begin
      wbArea_fsm_stateReg <= wbArea_fsm_stateNext;
    end
  end

  always @(posedge video_clock) begin
    case(videoArea_busCtrl_byteAddress)
      7'h0 : begin
        if(videoArea_busCtrl_doWrite) begin
          videoArea_vgaCtrl_io_timings_h_syncStart_driver <= videoArea_wb_DAT_MOSI[11 : 0];
        end
      end
      7'h04 : begin
        if(videoArea_busCtrl_doWrite) begin
          videoArea_vgaCtrl_io_timings_h_syncEnd_driver <= videoArea_wb_DAT_MOSI[11 : 0];
        end
      end
      7'h08 : begin
        if(videoArea_busCtrl_doWrite) begin
          videoArea_vgaCtrl_io_timings_h_colorStart_driver <= videoArea_wb_DAT_MOSI[11 : 0];
        end
      end
      7'h0c : begin
        if(videoArea_busCtrl_doWrite) begin
          videoArea_vgaCtrl_io_timings_h_colorEnd_driver <= videoArea_wb_DAT_MOSI[11 : 0];
        end
      end
      7'h10 : begin
        if(videoArea_busCtrl_doWrite) begin
          videoArea_vgaCtrl_io_timings_v_syncStart_driver <= videoArea_wb_DAT_MOSI[11 : 0];
        end
      end
      7'h14 : begin
        if(videoArea_busCtrl_doWrite) begin
          videoArea_vgaCtrl_io_timings_v_syncEnd_driver <= videoArea_wb_DAT_MOSI[11 : 0];
        end
      end
      7'h18 : begin
        if(videoArea_busCtrl_doWrite) begin
          videoArea_vgaCtrl_io_timings_v_colorStart_driver <= videoArea_wb_DAT_MOSI[11 : 0];
        end
      end
      7'h1c : begin
        if(videoArea_busCtrl_doWrite) begin
          videoArea_vgaCtrl_io_timings_v_colorEnd_driver <= videoArea_wb_DAT_MOSI[11 : 0];
        end
      end
      default : begin
      end
    endcase
  end


endmodule

module VideoCtrl_VgaCtrl (
  input               io_softReset_soft_reset,
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
  input               io_hdmi_tx_int,
  output              io_frameStart,
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
  output              io_error,
  input               video_clock,
  input               video_reset
);

  wire                when_VgaCtrl_l207;
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

  assign when_VgaCtrl_l207 = 1'b1;
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
  always @(posedge video_clock or posedge video_reset) begin
    if(video_reset) begin
      h_counter <= 12'h0;
      h_sync <= 1'b0;
      h_colorEn <= 1'b0;
      v_counter <= 12'h0;
      v_sync <= 1'b0;
      v_colorEn <= 1'b0;
    end else begin
      if(when_VgaCtrl_l207) begin
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
      if(io_softReset_soft_reset) begin
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
      if(io_softReset_soft_reset) begin
        v_counter <= 12'h0;
        v_sync <= 1'b0;
        v_colorEn <= 1'b0;
      end
    end
  end


endmodule

module VideoCtrl_BufferCC_6 (
  input               io_dataIn,
  output              io_dataOut,
  input               video_clock,
  input               video_reset
);

  (* async_reg = "true" *) reg                 buffers_0;
  (* async_reg = "true" *) reg                 buffers_1;

  assign io_dataOut = buffers_1;
  always @(posedge video_clock) begin
    buffers_0 <= io_dataIn;
    buffers_1 <= buffers_0;
  end


endmodule

module VideoCtrl_StreamFifoCC_1 (
  input               io_push_valid,
  output              io_push_ready,
  input      [31:0]   io_push_payload_rdt,
  output              io_pop_valid,
  input               io_pop_ready,
  output     [31:0]   io_pop_payload_rdt,
  output     [1:0]    io_pushOccupancy,
  output     [1:0]    io_popOccupancy,
  input               video_clock,
  input               video_reset,
  input               wb_clock
);

  reg        [31:0]   _zz_ram_port1;
  wire       [1:0]    popToPushGray_buffercc_io_dataOut;
  wire                bufferCC_io_dataOut;
  wire       [1:0]    pushToPopGray_buffercc_io_dataOut;
  wire       [1:0]    _zz_pushCC_pushPtrGray;
  wire       [0:0]    _zz_ram_port;
  wire       [1:0]    _zz_popCC_popPtrGray;
  wire       [0:0]    _zz_ram_port_1;
  wire                _zz_ram_port_2;
  wire       [0:0]    _zz_io_pop_payload_rdt_1;
  wire                _zz_io_pop_payload_rdt_2;
  reg                 _zz_1;
  wire       [1:0]    popToPushGray;
  wire       [1:0]    pushToPopGray;
  reg        [1:0]    pushCC_pushPtr;
  wire       [1:0]    pushCC_pushPtrPlus;
  wire                io_push_fire;
  reg        [1:0]    pushCC_pushPtrGray;
  wire       [1:0]    pushCC_popPtrGray;
  wire                pushCC_full;
  wire                io_push_fire_1;
  wire                _zz_io_pushOccupancy;
  wire                toplevel_video_reset_syncronized;
  reg        [1:0]    popCC_popPtr;
  wire       [1:0]    popCC_popPtrPlus;
  wire                io_pop_fire;
  reg        [1:0]    popCC_popPtrGray;
  wire       [1:0]    popCC_pushPtrGray;
  wire                popCC_empty;
  wire                io_pop_fire_1;
  wire       [1:0]    _zz_io_pop_payload_rdt;
  wire                io_pop_fire_2;
  wire                _zz_io_popOccupancy;
  reg [31:0] ram [0:1];

  assign _zz_pushCC_pushPtrGray = (pushCC_pushPtrPlus >>> 1'b1);
  assign _zz_ram_port = pushCC_pushPtr[0:0];
  assign _zz_popCC_popPtrGray = (popCC_popPtrPlus >>> 1'b1);
  assign _zz_io_pop_payload_rdt_1 = _zz_io_pop_payload_rdt[0:0];
  assign _zz_io_pop_payload_rdt_2 = 1'b1;
  always @(posedge video_clock) begin
    if(_zz_1) begin
      ram[_zz_ram_port] <= io_push_payload_rdt;
    end
  end

  always @(posedge wb_clock) begin
    if(_zz_io_pop_payload_rdt_2) begin
      _zz_ram_port1 <= ram[_zz_io_pop_payload_rdt_1];
    end
  end

  VideoCtrl_BufferCC_3 popToPushGray_buffercc (
    .io_dataIn      (popToPushGray[1:0]                      ), //i
    .io_dataOut     (popToPushGray_buffercc_io_dataOut[1:0]  ), //o
    .video_clock    (video_clock                             ), //i
    .video_reset    (video_reset                             )  //i
  );
  VideoCtrl_BufferCC_4 bufferCC (
    .io_dataIn      (1'b0                 ), //i
    .io_dataOut     (bufferCC_io_dataOut  ), //o
    .wb_clock       (wb_clock             ), //i
    .video_reset    (video_reset          )  //i
  );
  VideoCtrl_BufferCC_5 pushToPopGray_buffercc (
    .io_dataIn                           (pushToPopGray[1:0]                      ), //i
    .io_dataOut                          (pushToPopGray_buffercc_io_dataOut[1:0]  ), //o
    .wb_clock                            (wb_clock                                ), //i
    .toplevel_video_reset_syncronized    (toplevel_video_reset_syncronized        )  //i
  );
  always @(*) begin
    _zz_1 = 1'b0;
    if(io_push_fire_1) begin
      _zz_1 = 1'b1;
    end
  end

  assign pushCC_pushPtrPlus = (pushCC_pushPtr + 2'b01);
  assign io_push_fire = (io_push_valid && io_push_ready);
  assign pushCC_popPtrGray = popToPushGray_buffercc_io_dataOut;
  assign pushCC_full = ((pushCC_pushPtrGray[1 : 0] == (~ pushCC_popPtrGray[1 : 0])) && 1'b1);
  assign io_push_ready = (! pushCC_full);
  assign io_push_fire_1 = (io_push_valid && io_push_ready);
  assign _zz_io_pushOccupancy = pushCC_popPtrGray[1];
  assign io_pushOccupancy = (pushCC_pushPtr - {_zz_io_pushOccupancy,(pushCC_popPtrGray[0] ^ _zz_io_pushOccupancy)});
  assign toplevel_video_reset_syncronized = bufferCC_io_dataOut;
  assign popCC_popPtrPlus = (popCC_popPtr + 2'b01);
  assign io_pop_fire = (io_pop_valid && io_pop_ready);
  assign popCC_pushPtrGray = pushToPopGray_buffercc_io_dataOut;
  assign popCC_empty = (popCC_popPtrGray == popCC_pushPtrGray);
  assign io_pop_valid = (! popCC_empty);
  assign io_pop_fire_1 = (io_pop_valid && io_pop_ready);
  assign _zz_io_pop_payload_rdt = (io_pop_fire_1 ? popCC_popPtrPlus : popCC_popPtr);
  assign io_pop_payload_rdt = _zz_ram_port1[31 : 0];
  assign io_pop_fire_2 = (io_pop_valid && io_pop_ready);
  assign _zz_io_popOccupancy = popCC_pushPtrGray[1];
  assign io_popOccupancy = ({_zz_io_popOccupancy,(popCC_pushPtrGray[0] ^ _zz_io_popOccupancy)} - popCC_popPtr);
  assign pushToPopGray = pushCC_pushPtrGray;
  assign popToPushGray = popCC_popPtrGray;
  always @(posedge video_clock or posedge video_reset) begin
    if(video_reset) begin
      pushCC_pushPtr <= 2'b00;
      pushCC_pushPtrGray <= 2'b00;
    end else begin
      if(io_push_fire) begin
        pushCC_pushPtrGray <= (_zz_pushCC_pushPtrGray ^ pushCC_pushPtrPlus);
      end
      if(io_push_fire_1) begin
        pushCC_pushPtr <= pushCC_pushPtrPlus;
      end
    end
  end

  always @(posedge wb_clock or posedge toplevel_video_reset_syncronized) begin
    if(toplevel_video_reset_syncronized) begin
      popCC_popPtr <= 2'b00;
      popCC_popPtrGray <= 2'b00;
    end else begin
      if(io_pop_fire) begin
        popCC_popPtrGray <= (_zz_popCC_popPtrGray ^ popCC_popPtrPlus);
      end
      if(io_pop_fire_2) begin
        popCC_popPtr <= popCC_popPtrPlus;
      end
    end
  end


endmodule

module VideoCtrl_StreamFifoCC (
  input               io_push_valid,
  output              io_push_ready,
  input               io_push_payload_we,
  input      [4:0]    io_push_payload_adr,
  input      [31:0]   io_push_payload_dat,
  output              io_pop_valid,
  input               io_pop_ready,
  output              io_pop_payload_we,
  output     [4:0]    io_pop_payload_adr,
  output     [31:0]   io_pop_payload_dat,
  output     [1:0]    io_pushOccupancy,
  output     [1:0]    io_popOccupancy,
  input               wb_clock,
  input               wb_reset,
  input               video_clock
);

  reg        [37:0]   _zz_ram_port1;
  wire       [1:0]    popToPushGray_buffercc_io_dataOut;
  wire                bufferCC_io_dataOut;
  wire       [1:0]    pushToPopGray_buffercc_io_dataOut;
  wire       [1:0]    _zz_pushCC_pushPtrGray;
  wire       [0:0]    _zz_ram_port;
  wire       [37:0]   _zz_ram_port_1;
  wire       [1:0]    _zz_popCC_popPtrGray;
  wire       [0:0]    _zz_ram_port_2;
  wire                _zz_ram_port_3;
  wire       [0:0]    _zz__zz_io_pop_payload_we_1;
  wire                _zz__zz_io_pop_payload_we_1_1;
  reg                 _zz_1;
  wire       [1:0]    popToPushGray;
  wire       [1:0]    pushToPopGray;
  reg        [1:0]    pushCC_pushPtr;
  wire       [1:0]    pushCC_pushPtrPlus;
  wire                io_push_fire;
  reg        [1:0]    pushCC_pushPtrGray;
  wire       [1:0]    pushCC_popPtrGray;
  wire                pushCC_full;
  wire                io_push_fire_1;
  wire                _zz_io_pushOccupancy;
  wire                toplevel_wb_reset_syncronized;
  reg        [1:0]    popCC_popPtr;
  wire       [1:0]    popCC_popPtrPlus;
  wire                io_pop_fire;
  reg        [1:0]    popCC_popPtrGray;
  wire       [1:0]    popCC_pushPtrGray;
  wire                popCC_empty;
  wire                io_pop_fire_1;
  wire       [1:0]    _zz_io_pop_payload_we;
  wire       [37:0]   _zz_io_pop_payload_we_1;
  wire                io_pop_fire_2;
  wire                _zz_io_popOccupancy;
  reg [37:0] ram [0:1];

  assign _zz_pushCC_pushPtrGray = (pushCC_pushPtrPlus >>> 1'b1);
  assign _zz_ram_port = pushCC_pushPtr[0:0];
  assign _zz_popCC_popPtrGray = (popCC_popPtrPlus >>> 1'b1);
  assign _zz__zz_io_pop_payload_we_1 = _zz_io_pop_payload_we[0:0];
  assign _zz_ram_port_1 = {io_push_payload_dat,{io_push_payload_adr,io_push_payload_we}};
  assign _zz__zz_io_pop_payload_we_1_1 = 1'b1;
  always @(posedge wb_clock) begin
    if(_zz_1) begin
      ram[_zz_ram_port] <= _zz_ram_port_1;
    end
  end

  always @(posedge video_clock) begin
    if(_zz__zz_io_pop_payload_we_1_1) begin
      _zz_ram_port1 <= ram[_zz__zz_io_pop_payload_we_1];
    end
  end

  VideoCtrl_BufferCC popToPushGray_buffercc (
    .io_dataIn     (popToPushGray[1:0]                      ), //i
    .io_dataOut    (popToPushGray_buffercc_io_dataOut[1:0]  ), //o
    .wb_clock      (wb_clock                                ), //i
    .wb_reset      (wb_reset                                )  //i
  );
  VideoCtrl_BufferCC_1 bufferCC (
    .io_dataIn      (1'b0                 ), //i
    .io_dataOut     (bufferCC_io_dataOut  ), //o
    .video_clock    (video_clock          ), //i
    .wb_reset       (wb_reset             )  //i
  );
  VideoCtrl_BufferCC_2 pushToPopGray_buffercc (
    .io_dataIn                        (pushToPopGray[1:0]                      ), //i
    .io_dataOut                       (pushToPopGray_buffercc_io_dataOut[1:0]  ), //o
    .video_clock                      (video_clock                             ), //i
    .toplevel_wb_reset_syncronized    (toplevel_wb_reset_syncronized           )  //i
  );
  always @(*) begin
    _zz_1 = 1'b0;
    if(io_push_fire_1) begin
      _zz_1 = 1'b1;
    end
  end

  assign pushCC_pushPtrPlus = (pushCC_pushPtr + 2'b01);
  assign io_push_fire = (io_push_valid && io_push_ready);
  assign pushCC_popPtrGray = popToPushGray_buffercc_io_dataOut;
  assign pushCC_full = ((pushCC_pushPtrGray[1 : 0] == (~ pushCC_popPtrGray[1 : 0])) && 1'b1);
  assign io_push_ready = (! pushCC_full);
  assign io_push_fire_1 = (io_push_valid && io_push_ready);
  assign _zz_io_pushOccupancy = pushCC_popPtrGray[1];
  assign io_pushOccupancy = (pushCC_pushPtr - {_zz_io_pushOccupancy,(pushCC_popPtrGray[0] ^ _zz_io_pushOccupancy)});
  assign toplevel_wb_reset_syncronized = bufferCC_io_dataOut;
  assign popCC_popPtrPlus = (popCC_popPtr + 2'b01);
  assign io_pop_fire = (io_pop_valid && io_pop_ready);
  assign popCC_pushPtrGray = pushToPopGray_buffercc_io_dataOut;
  assign popCC_empty = (popCC_popPtrGray == popCC_pushPtrGray);
  assign io_pop_valid = (! popCC_empty);
  assign io_pop_fire_1 = (io_pop_valid && io_pop_ready);
  assign _zz_io_pop_payload_we = (io_pop_fire_1 ? popCC_popPtrPlus : popCC_popPtr);
  assign _zz_io_pop_payload_we_1 = _zz_ram_port1;
  assign io_pop_payload_we = _zz_io_pop_payload_we_1[0];
  assign io_pop_payload_adr = _zz_io_pop_payload_we_1[5 : 1];
  assign io_pop_payload_dat = _zz_io_pop_payload_we_1[37 : 6];
  assign io_pop_fire_2 = (io_pop_valid && io_pop_ready);
  assign _zz_io_popOccupancy = popCC_pushPtrGray[1];
  assign io_popOccupancy = ({_zz_io_popOccupancy,(popCC_pushPtrGray[0] ^ _zz_io_popOccupancy)} - popCC_popPtr);
  assign pushToPopGray = pushCC_pushPtrGray;
  assign popToPushGray = popCC_popPtrGray;
  always @(posedge wb_clock or posedge wb_reset) begin
    if(wb_reset) begin
      pushCC_pushPtr <= 2'b00;
      pushCC_pushPtrGray <= 2'b00;
    end else begin
      if(io_push_fire) begin
        pushCC_pushPtrGray <= (_zz_pushCC_pushPtrGray ^ pushCC_pushPtrPlus);
      end
      if(io_push_fire_1) begin
        pushCC_pushPtr <= pushCC_pushPtrPlus;
      end
    end
  end

  always @(posedge video_clock or posedge toplevel_wb_reset_syncronized) begin
    if(toplevel_wb_reset_syncronized) begin
      popCC_popPtr <= 2'b00;
      popCC_popPtrGray <= 2'b00;
    end else begin
      if(io_pop_fire) begin
        popCC_popPtrGray <= (_zz_popCC_popPtrGray ^ popCC_popPtrPlus);
      end
      if(io_pop_fire_2) begin
        popCC_popPtr <= popCC_popPtrPlus;
      end
    end
  end


endmodule

module VideoCtrl_BufferCC_5 (
  input      [1:0]    io_dataIn,
  output     [1:0]    io_dataOut,
  input               wb_clock,
  input               toplevel_video_reset_syncronized
);

  (* async_reg = "true" *) reg        [1:0]    buffers_0;
  (* async_reg = "true" *) reg        [1:0]    buffers_1;

  assign io_dataOut = buffers_1;
  always @(posedge wb_clock or posedge toplevel_video_reset_syncronized) begin
    if(toplevel_video_reset_syncronized) begin
      buffers_0 <= 2'b00;
      buffers_1 <= 2'b00;
    end else begin
      buffers_0 <= io_dataIn;
      buffers_1 <= buffers_0;
    end
  end


endmodule

module VideoCtrl_BufferCC_4 (
  input               io_dataIn,
  output              io_dataOut,
  input               wb_clock,
  input               video_reset
);

  (* async_reg = "true" *) reg                 buffers_0;
  (* async_reg = "true" *) reg                 buffers_1;

  assign io_dataOut = buffers_1;
  always @(posedge wb_clock or posedge video_reset) begin
    if(video_reset) begin
      buffers_0 <= 1'b1;
      buffers_1 <= 1'b1;
    end else begin
      buffers_0 <= io_dataIn;
      buffers_1 <= buffers_0;
    end
  end


endmodule

module VideoCtrl_BufferCC_3 (
  input      [1:0]    io_dataIn,
  output     [1:0]    io_dataOut,
  input               video_clock,
  input               video_reset
);

  (* async_reg = "true" *) reg        [1:0]    buffers_0;
  (* async_reg = "true" *) reg        [1:0]    buffers_1;

  assign io_dataOut = buffers_1;
  always @(posedge video_clock or posedge video_reset) begin
    if(video_reset) begin
      buffers_0 <= 2'b00;
      buffers_1 <= 2'b00;
    end else begin
      buffers_0 <= io_dataIn;
      buffers_1 <= buffers_0;
    end
  end


endmodule

module VideoCtrl_BufferCC_2 (
  input      [1:0]    io_dataIn,
  output     [1:0]    io_dataOut,
  input               video_clock,
  input               toplevel_wb_reset_syncronized
);

  (* async_reg = "true" *) reg        [1:0]    buffers_0;
  (* async_reg = "true" *) reg        [1:0]    buffers_1;

  assign io_dataOut = buffers_1;
  always @(posedge video_clock or posedge toplevel_wb_reset_syncronized) begin
    if(toplevel_wb_reset_syncronized) begin
      buffers_0 <= 2'b00;
      buffers_1 <= 2'b00;
    end else begin
      buffers_0 <= io_dataIn;
      buffers_1 <= buffers_0;
    end
  end


endmodule

module VideoCtrl_BufferCC_1 (
  input               io_dataIn,
  output              io_dataOut,
  input               video_clock,
  input               wb_reset
);

  (* async_reg = "true" *) reg                 buffers_0;
  (* async_reg = "true" *) reg                 buffers_1;

  assign io_dataOut = buffers_1;
  always @(posedge video_clock or posedge wb_reset) begin
    if(wb_reset) begin
      buffers_0 <= 1'b1;
      buffers_1 <= 1'b1;
    end else begin
      buffers_0 <= io_dataIn;
      buffers_1 <= buffers_0;
    end
  end


endmodule

module VideoCtrl_BufferCC (
  input      [1:0]    io_dataIn,
  output     [1:0]    io_dataOut,
  input               wb_clock,
  input               wb_reset
);

  (* async_reg = "true" *) reg        [1:0]    buffers_0;
  (* async_reg = "true" *) reg        [1:0]    buffers_1;

  assign io_dataOut = buffers_1;
  always @(posedge wb_clock or posedge wb_reset) begin
    if(wb_reset) begin
      buffers_0 <= 2'b00;
      buffers_1 <= 2'b00;
    end else begin
      buffers_0 <= io_dataIn;
      buffers_1 <= buffers_0;
    end
  end


endmodule
