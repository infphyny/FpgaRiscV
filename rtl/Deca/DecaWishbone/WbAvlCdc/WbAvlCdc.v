 // Generator : SpinalHDL v1.6.4    git head : 598c18959149eb18e5eee5b0aa3eef01ecaa41a1
// Component : WbAvlCdc
// Git hash  : 0d73750da08867d712ad142e7a44c2b5ab44ff1b

`timescale 1ns/1ps

module WbSCdc (
  input               i_wb_clock,
  input               i_wb_reset,
  input      [31:0]   i_wb_adr,
  input      [3:0]    i_wb_sel,
  input      [31:0]   i_wb_dat,
  output reg [31:0]   o_wb_rdt,
  input               i_wb_we,
  input               i_wb_cyc,
  input               i_wb_stb,
  output reg          o_wb_ack,
  output              o_wb_err,
  output              o_wb_rty,
  input               i_avl_clock,
  input               i_avl_reset,
  input               i_stream_valid,
  output reg          i_stream_ready,
  input      [63:0]   i_stream_payload_rdt,
  output reg          o_stream_valid,
  input               o_stream_ready,
  output              o_stream_payload_we,
  output     [25:0]   o_stream_payload_adr,
  output     [63:0]   o_stream_payload_dat,
  output     [7:0]    o_stream_payload_sel,
  output              o_stream_payload_burstbegin,
  output     [2:0]    o_stream_payload_size
);
  localparam wbClockArea_wbStateMachine_enumDef_BOOT = 2'd0;
  localparam wbClockArea_wbStateMachine_enumDef_Init = 2'd1;
  localparam wbClockArea_wbStateMachine_enumDef_Idle = 2'd2;
  localparam wbClockArea_wbStateMachine_enumDef_Read = 2'd3;
  localparam avlClockArea_avlStateMachine_enumDef_BOOT = 2'd0;
  localparam avlClockArea_avlStateMachine_enumDef_Init = 2'd1;
  localparam avlClockArea_avlStateMachine_enumDef_Idle = 2'd2;
  localparam avlClockArea_avlStateMachine_enumDef_Read = 2'd3;

  wire                fromWbStreamFifo_io_push_ready;
  wire                fromWbStreamFifo_io_pop_valid;
  wire                fromWbStreamFifo_io_pop_payload_we;
  wire       [25:0]   fromWbStreamFifo_io_pop_payload_adr;
  wire       [7:0]    fromWbStreamFifo_io_pop_payload_sel;
  wire       [63:0]   fromWbStreamFifo_io_pop_payload_dat;
  wire       [3:0]    fromWbStreamFifo_io_pushOccupancy;
  wire       [3:0]    fromWbStreamFifo_io_popOccupancy;
  wire                fromMemStreamFifoCC_io_push_ready;
  wire                fromMemStreamFifoCC_io_pop_valid;
  wire       [63:0]   fromMemStreamFifoCC_io_pop_payload_rdt;
  wire       [1:0]    fromMemStreamFifoCC_io_pushOccupancy;
  wire       [1:0]    fromMemStreamFifoCC_io_popOccupancy;
  reg        [7:0]    sel;
  reg                 fromWbToCdcStream_valid;
  wire                fromWbToCdcStream_ready;
  wire                fromWbToCdcStream_payload_we;
  wire       [25:0]   fromWbToCdcStream_payload_adr;
  wire       [7:0]    fromWbToCdcStream_payload_sel;
  wire       [63:0]   fromWbToCdcStream_payload_dat;
  wire                fromCdcToMemStream_valid;
  reg                 fromCdcToMemStream_ready;
  wire                fromCdcToMemStream_payload_we;
  wire       [25:0]   fromCdcToMemStream_payload_adr;
  wire       [7:0]    fromCdcToMemStream_payload_sel;
  wire       [63:0]   fromCdcToMemStream_payload_dat;
  reg                 fromMemToCdcStream_valid;
  wire                fromMemToCdcStream_ready;
  wire       [63:0]   fromMemToCdcStream_payload_rdt;
  wire                fromCdcToWbStream_valid;
  reg                 fromCdcToWbStream_ready;
  wire       [63:0]   fromCdcToWbStream_payload_rdt;
  wire                switch_WbAvlCdc_l184;
  wire                wbClockArea_wbStateMachine_wantExit;
  reg                 wbClockArea_wbStateMachine_wantStart;
  wire                wbClockArea_wbStateMachine_wantKill;
  wire                avlClockArea_avlStateMachine_wantExit;
  reg                 avlClockArea_avlStateMachine_wantStart;
  wire                avlClockArea_avlStateMachine_wantKill;
  reg        [1:0]    wbClockArea_wbStateMachine_stateReg;
  reg        [1:0]    wbClockArea_wbStateMachine_stateNext;
  wire                when_WbAvlCdc_l214;
  wire                when_WbAvlCdc_l217;
  reg        [1:0]    avlClockArea_avlStateMachine_stateReg;
  reg        [1:0]    avlClockArea_avlStateMachine_stateNext;
  `ifndef SYNTHESIS
  reg [31:0] wbClockArea_wbStateMachine_stateReg_string;
  reg [31:0] wbClockArea_wbStateMachine_stateNext_string;
  reg [31:0] avlClockArea_avlStateMachine_stateReg_string;
  reg [31:0] avlClockArea_avlStateMachine_stateNext_string;
  `endif


  WbAvlCdc_StreamFifoCC fromWbStreamFifo (
    .io_push_valid          (fromWbToCdcStream_valid                    ), //i
    .io_push_ready          (fromWbStreamFifo_io_push_ready             ), //o
    .io_push_payload_we     (fromWbToCdcStream_payload_we               ), //i
    .io_push_payload_adr    (fromWbToCdcStream_payload_adr[25:0]        ), //i
    .io_push_payload_sel    (fromWbToCdcStream_payload_sel[7:0]         ), //i
    .io_push_payload_dat    (fromWbToCdcStream_payload_dat[63:0]        ), //i
    .io_pop_valid           (fromWbStreamFifo_io_pop_valid              ), //o
    .io_pop_ready           (fromCdcToMemStream_ready                   ), //i
    .io_pop_payload_we      (fromWbStreamFifo_io_pop_payload_we         ), //o
    .io_pop_payload_adr     (fromWbStreamFifo_io_pop_payload_adr[25:0]  ), //o
    .io_pop_payload_sel     (fromWbStreamFifo_io_pop_payload_sel[7:0]   ), //o
    .io_pop_payload_dat     (fromWbStreamFifo_io_pop_payload_dat[63:0]  ), //o
    .io_pushOccupancy       (fromWbStreamFifo_io_pushOccupancy[3:0]     ), //o
    .io_popOccupancy        (fromWbStreamFifo_io_popOccupancy[3:0]      ), //o
    .i_wb_clock             (i_wb_clock                                 ), //i
    .i_wb_reset             (i_wb_reset                                 ), //i
    .i_avl_clock            (i_avl_clock                                )  //i
  );
  WbAvlCdc_StreamFifoCC_1 fromMemStreamFifoCC (
    .io_push_valid          (fromMemToCdcStream_valid                      ), //i
    .io_push_ready          (fromMemStreamFifoCC_io_push_ready             ), //o
    .io_push_payload_rdt    (fromMemToCdcStream_payload_rdt[63:0]          ), //i
    .io_pop_valid           (fromMemStreamFifoCC_io_pop_valid              ), //o
    .io_pop_ready           (fromCdcToWbStream_ready                       ), //i
    .io_pop_payload_rdt     (fromMemStreamFifoCC_io_pop_payload_rdt[63:0]  ), //o
    .io_pushOccupancy       (fromMemStreamFifoCC_io_pushOccupancy[1:0]     ), //o
    .io_popOccupancy        (fromMemStreamFifoCC_io_popOccupancy[1:0]      ), //o
    .i_avl_clock            (i_avl_clock                                   ), //i
    .i_avl_reset            (i_avl_reset                                   ), //i
    .i_wb_clock             (i_wb_clock                                    )  //i
  );
  `ifndef SYNTHESIS
  always @(*) begin
    case(wbClockArea_wbStateMachine_stateReg)
      wbClockArea_wbStateMachine_enumDef_BOOT : wbClockArea_wbStateMachine_stateReg_string = "BOOT";
      wbClockArea_wbStateMachine_enumDef_Init : wbClockArea_wbStateMachine_stateReg_string = "Init";
      wbClockArea_wbStateMachine_enumDef_Idle : wbClockArea_wbStateMachine_stateReg_string = "Idle";
      wbClockArea_wbStateMachine_enumDef_Read : wbClockArea_wbStateMachine_stateReg_string = "Read";
      default : wbClockArea_wbStateMachine_stateReg_string = "????";
    endcase
  end
  always @(*) begin
    case(wbClockArea_wbStateMachine_stateNext)
      wbClockArea_wbStateMachine_enumDef_BOOT : wbClockArea_wbStateMachine_stateNext_string = "BOOT";
      wbClockArea_wbStateMachine_enumDef_Init : wbClockArea_wbStateMachine_stateNext_string = "Init";
      wbClockArea_wbStateMachine_enumDef_Idle : wbClockArea_wbStateMachine_stateNext_string = "Idle";
      wbClockArea_wbStateMachine_enumDef_Read : wbClockArea_wbStateMachine_stateNext_string = "Read";
      default : wbClockArea_wbStateMachine_stateNext_string = "????";
    endcase
  end
  always @(*) begin
    case(avlClockArea_avlStateMachine_stateReg)
      avlClockArea_avlStateMachine_enumDef_BOOT : avlClockArea_avlStateMachine_stateReg_string = "BOOT";
      avlClockArea_avlStateMachine_enumDef_Init : avlClockArea_avlStateMachine_stateReg_string = "Init";
      avlClockArea_avlStateMachine_enumDef_Idle : avlClockArea_avlStateMachine_stateReg_string = "Idle";
      avlClockArea_avlStateMachine_enumDef_Read : avlClockArea_avlStateMachine_stateReg_string = "Read";
      default : avlClockArea_avlStateMachine_stateReg_string = "????";
    endcase
  end
  always @(*) begin
    case(avlClockArea_avlStateMachine_stateNext)
      avlClockArea_avlStateMachine_enumDef_BOOT : avlClockArea_avlStateMachine_stateNext_string = "BOOT";
      avlClockArea_avlStateMachine_enumDef_Init : avlClockArea_avlStateMachine_stateNext_string = "Init";
      avlClockArea_avlStateMachine_enumDef_Idle : avlClockArea_avlStateMachine_stateNext_string = "Idle";
      avlClockArea_avlStateMachine_enumDef_Read : avlClockArea_avlStateMachine_stateNext_string = "Read";
      default : avlClockArea_avlStateMachine_stateNext_string = "????";
    endcase
  end
  `endif

  assign o_wb_err = 1'b0;
  assign o_wb_rty = 1'b0;
  always @(*) begin
    fromWbToCdcStream_valid = 1'b0;
    case(wbClockArea_wbStateMachine_stateReg)
      wbClockArea_wbStateMachine_enumDef_Init : begin
      end
      wbClockArea_wbStateMachine_enumDef_Idle : begin
        if(when_WbAvlCdc_l214) begin
          fromWbToCdcStream_valid = 1'b1;
        end
      end
      wbClockArea_wbStateMachine_enumDef_Read : begin
      end
      default : begin
      end
    endcase
  end

  assign fromWbToCdcStream_payload_adr = i_wb_adr[25 : 0];
  assign fromWbToCdcStream_payload_dat = {i_wb_dat,i_wb_dat};
  assign fromWbToCdcStream_payload_we = i_wb_we;
  assign fromWbToCdcStream_payload_sel = sel;
  always @(*) begin
    fromCdcToMemStream_ready = 1'b0;
    case(avlClockArea_avlStateMachine_stateReg)
      avlClockArea_avlStateMachine_enumDef_Init : begin
      end
      avlClockArea_avlStateMachine_enumDef_Idle : begin
        if(fromCdcToMemStream_valid) begin
          if(fromCdcToMemStream_payload_we) begin
            fromCdcToMemStream_ready = 1'b1;
          end
        end
      end
      avlClockArea_avlStateMachine_enumDef_Read : begin
        if(i_stream_valid) begin
          fromCdcToMemStream_ready = 1'b1;
        end
      end
      default : begin
      end
    endcase
  end

  assign fromWbToCdcStream_ready = fromWbStreamFifo_io_push_ready;
  assign fromCdcToMemStream_valid = fromWbStreamFifo_io_pop_valid;
  assign fromCdcToMemStream_payload_we = fromWbStreamFifo_io_pop_payload_we;
  assign fromCdcToMemStream_payload_adr = fromWbStreamFifo_io_pop_payload_adr;
  assign fromCdcToMemStream_payload_sel = fromWbStreamFifo_io_pop_payload_sel;
  assign fromCdcToMemStream_payload_dat = fromWbStreamFifo_io_pop_payload_dat;
  always @(*) begin
    fromMemToCdcStream_valid = 1'b0;
    case(avlClockArea_avlStateMachine_stateReg)
      avlClockArea_avlStateMachine_enumDef_Init : begin
      end
      avlClockArea_avlStateMachine_enumDef_Idle : begin
      end
      avlClockArea_avlStateMachine_enumDef_Read : begin
        if(i_stream_valid) begin
          fromMemToCdcStream_valid = 1'b1;
        end
      end
      default : begin
      end
    endcase
  end

  always @(*) begin
    fromCdcToWbStream_ready = 1'b0;
    case(wbClockArea_wbStateMachine_stateReg)
      wbClockArea_wbStateMachine_enumDef_Init : begin
      end
      wbClockArea_wbStateMachine_enumDef_Idle : begin
      end
      wbClockArea_wbStateMachine_enumDef_Read : begin
        if(fromCdcToWbStream_valid) begin
          fromCdcToWbStream_ready = 1'b1;
        end
      end
      default : begin
      end
    endcase
  end

  assign fromMemToCdcStream_ready = fromMemStreamFifoCC_io_push_ready;
  assign fromCdcToWbStream_valid = fromMemStreamFifoCC_io_pop_valid;
  assign fromCdcToWbStream_payload_rdt = fromMemStreamFifoCC_io_pop_payload_rdt;
  assign switch_WbAvlCdc_l184 = i_wb_adr[2];
  always @(*) begin
    case(switch_WbAvlCdc_l184)
      1'b0 : begin
        sel = {4'b0000,i_wb_sel};
      end
      default : begin
        sel = {i_wb_sel,4'b0000};
      end
    endcase
  end

  always @(*) begin
    case(switch_WbAvlCdc_l184)
      1'b0 : begin
        o_wb_rdt = fromCdcToWbStream_payload_rdt[31 : 0];
      end
      default : begin
        o_wb_rdt = fromCdcToWbStream_payload_rdt[63 : 32];
      end
    endcase
  end

  always @(*) begin
    o_wb_ack = 1'b0;
    case(wbClockArea_wbStateMachine_stateReg)
      wbClockArea_wbStateMachine_enumDef_Init : begin
      end
      wbClockArea_wbStateMachine_enumDef_Idle : begin
        if(when_WbAvlCdc_l214) begin
          if(when_WbAvlCdc_l217) begin
            o_wb_ack = 1'b1;
          end
        end
      end
      wbClockArea_wbStateMachine_enumDef_Read : begin
        if(fromCdcToWbStream_valid) begin
          o_wb_ack = 1'b1;
        end
      end
      default : begin
      end
    endcase
  end

  assign wbClockArea_wbStateMachine_wantExit = 1'b0;
  always @(*) begin
    wbClockArea_wbStateMachine_wantStart = 1'b0;
    case(wbClockArea_wbStateMachine_stateReg)
      wbClockArea_wbStateMachine_enumDef_Init : begin
      end
      wbClockArea_wbStateMachine_enumDef_Idle : begin
      end
      wbClockArea_wbStateMachine_enumDef_Read : begin
      end
      default : begin
        wbClockArea_wbStateMachine_wantStart = 1'b1;
      end
    endcase
  end

  assign wbClockArea_wbStateMachine_wantKill = 1'b0;
  always @(*) begin
    i_stream_ready = 1'b0;
    case(avlClockArea_avlStateMachine_stateReg)
      avlClockArea_avlStateMachine_enumDef_Init : begin
      end
      avlClockArea_avlStateMachine_enumDef_Idle : begin
      end
      avlClockArea_avlStateMachine_enumDef_Read : begin
        if(i_stream_valid) begin
          i_stream_ready = 1'b1;
        end
      end
      default : begin
      end
    endcase
  end

  always @(*) begin
    o_stream_valid = 1'b0;
    case(avlClockArea_avlStateMachine_stateReg)
      avlClockArea_avlStateMachine_enumDef_Init : begin
      end
      avlClockArea_avlStateMachine_enumDef_Idle : begin
        if(fromCdcToMemStream_valid) begin
          o_stream_valid = 1'b1;
        end
      end
      avlClockArea_avlStateMachine_enumDef_Read : begin
      end
      default : begin
      end
    endcase
  end

  assign o_stream_payload_sel = fromCdcToMemStream_payload_sel;
  assign o_stream_payload_dat = fromCdcToMemStream_payload_dat;
  assign o_stream_payload_burstbegin = 1'b0;
  assign o_stream_payload_size = 3'b001;
  assign o_stream_payload_we = fromCdcToMemStream_payload_we;
  assign o_stream_payload_adr = fromCdcToMemStream_payload_adr;
  assign fromMemToCdcStream_payload_rdt = i_stream_payload_rdt;
  assign avlClockArea_avlStateMachine_wantExit = 1'b0;
  always @(*) begin
    avlClockArea_avlStateMachine_wantStart = 1'b0;
    case(avlClockArea_avlStateMachine_stateReg)
      avlClockArea_avlStateMachine_enumDef_Init : begin
      end
      avlClockArea_avlStateMachine_enumDef_Idle : begin
      end
      avlClockArea_avlStateMachine_enumDef_Read : begin
      end
      default : begin
        avlClockArea_avlStateMachine_wantStart = 1'b1;
      end
    endcase
  end

  assign avlClockArea_avlStateMachine_wantKill = 1'b0;
  always @(*) begin
    wbClockArea_wbStateMachine_stateNext = wbClockArea_wbStateMachine_stateReg;
    case(wbClockArea_wbStateMachine_stateReg)
      wbClockArea_wbStateMachine_enumDef_Init : begin
        wbClockArea_wbStateMachine_stateNext = wbClockArea_wbStateMachine_enumDef_Idle;
      end
      wbClockArea_wbStateMachine_enumDef_Idle : begin
        if(when_WbAvlCdc_l214) begin
          if(when_WbAvlCdc_l217) begin
            wbClockArea_wbStateMachine_stateNext = wbClockArea_wbStateMachine_enumDef_Idle;
          end else begin
            wbClockArea_wbStateMachine_stateNext = wbClockArea_wbStateMachine_enumDef_Read;
          end
        end
      end
      wbClockArea_wbStateMachine_enumDef_Read : begin
        if(fromCdcToWbStream_valid) begin
          wbClockArea_wbStateMachine_stateNext = wbClockArea_wbStateMachine_enumDef_Idle;
        end
      end
      default : begin
      end
    endcase
    if(wbClockArea_wbStateMachine_wantStart) begin
      wbClockArea_wbStateMachine_stateNext = wbClockArea_wbStateMachine_enumDef_Init;
    end
    if(wbClockArea_wbStateMachine_wantKill) begin
      wbClockArea_wbStateMachine_stateNext = wbClockArea_wbStateMachine_enumDef_BOOT;
    end
  end

  assign when_WbAvlCdc_l214 = ((i_wb_cyc && i_wb_stb) && (fromWbStreamFifo_io_pushOccupancy < 4'b0111));
  assign when_WbAvlCdc_l217 = (i_wb_we == 1'b1);
  always @(*) begin
    avlClockArea_avlStateMachine_stateNext = avlClockArea_avlStateMachine_stateReg;
    case(avlClockArea_avlStateMachine_stateReg)
      avlClockArea_avlStateMachine_enumDef_Init : begin
        avlClockArea_avlStateMachine_stateNext = avlClockArea_avlStateMachine_enumDef_Idle;
      end
      avlClockArea_avlStateMachine_enumDef_Idle : begin
        avlClockArea_avlStateMachine_stateNext = avlClockArea_avlStateMachine_enumDef_Idle;
        if(fromCdcToMemStream_valid) begin
          if(!fromCdcToMemStream_payload_we) begin
            avlClockArea_avlStateMachine_stateNext = avlClockArea_avlStateMachine_enumDef_Read;
          end
        end
      end
      avlClockArea_avlStateMachine_enumDef_Read : begin
        if(i_stream_valid) begin
          avlClockArea_avlStateMachine_stateNext = avlClockArea_avlStateMachine_enumDef_Idle;
        end
      end
      default : begin
      end
    endcase
    if(avlClockArea_avlStateMachine_wantStart) begin
      avlClockArea_avlStateMachine_stateNext = avlClockArea_avlStateMachine_enumDef_Init;
    end
    if(avlClockArea_avlStateMachine_wantKill) begin
      avlClockArea_avlStateMachine_stateNext = avlClockArea_avlStateMachine_enumDef_BOOT;
    end
  end

  always @(posedge i_wb_clock or posedge i_wb_reset) begin
    if(i_wb_reset) begin
      wbClockArea_wbStateMachine_stateReg <= wbClockArea_wbStateMachine_enumDef_BOOT;
    end else begin
      wbClockArea_wbStateMachine_stateReg <= wbClockArea_wbStateMachine_stateNext;
    end
  end

  always @(posedge i_avl_clock or posedge i_avl_reset) begin
    if(i_avl_reset) begin
      avlClockArea_avlStateMachine_stateReg <= avlClockArea_avlStateMachine_enumDef_BOOT;
    end else begin
      avlClockArea_avlStateMachine_stateReg <= avlClockArea_avlStateMachine_stateNext;
    end
  end


endmodule

module WbAvlCdc_StreamFifoCC_1 (
  input               io_push_valid,
  output              io_push_ready,
  input      [63:0]   io_push_payload_rdt,
  output              io_pop_valid,
  input               io_pop_ready,
  output     [63:0]   io_pop_payload_rdt,
  output     [1:0]    io_pushOccupancy,
  output     [1:0]    io_popOccupancy,
  input               i_avl_clock,
  input               i_avl_reset,
  input               i_wb_clock
);

  reg        [63:0]   _zz_ram_port1;
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
  wire                toplevel_i_avl_reset_syncronized;
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
  reg [63:0] ram [0:1];

  assign _zz_pushCC_pushPtrGray = (pushCC_pushPtrPlus >>> 1'b1);
  assign _zz_ram_port = pushCC_pushPtr[0:0];
  assign _zz_popCC_popPtrGray = (popCC_popPtrPlus >>> 1'b1);
  assign _zz_io_pop_payload_rdt_1 = _zz_io_pop_payload_rdt[0:0];
  assign _zz_io_pop_payload_rdt_2 = 1'b1;
  always @(posedge i_avl_clock) begin
    if(_zz_1) begin
      ram[_zz_ram_port] <= io_push_payload_rdt;
    end
  end

  always @(posedge i_wb_clock) begin
    if(_zz_io_pop_payload_rdt_2) begin
      _zz_ram_port1 <= ram[_zz_io_pop_payload_rdt_1];
    end
  end

  WbAvlCdc_BufferCC_3 popToPushGray_buffercc (
    .io_dataIn      (popToPushGray[1:0]                      ), //i
    .io_dataOut     (popToPushGray_buffercc_io_dataOut[1:0]  ), //o
    .i_avl_clock    (i_avl_clock                             ), //i
    .i_avl_reset    (i_avl_reset                             )  //i
  );
  WbAvlCdc_BufferCC_4 bufferCC (
    .io_dataIn      (1'b0                 ), //i
    .io_dataOut     (bufferCC_io_dataOut  ), //o
    .i_wb_clock     (i_wb_clock           ), //i
    .i_avl_reset    (i_avl_reset          )  //i
  );
  WbAvlCdc_BufferCC_5 pushToPopGray_buffercc (
    .io_dataIn                           (pushToPopGray[1:0]                      ), //i
    .io_dataOut                          (pushToPopGray_buffercc_io_dataOut[1:0]  ), //o
    .i_wb_clock                          (i_wb_clock                              ), //i
    .toplevel_i_avl_reset_syncronized    (toplevel_i_avl_reset_syncronized        )  //i
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
  assign toplevel_i_avl_reset_syncronized = bufferCC_io_dataOut;
  assign popCC_popPtrPlus = (popCC_popPtr + 2'b01);
  assign io_pop_fire = (io_pop_valid && io_pop_ready);
  assign popCC_pushPtrGray = pushToPopGray_buffercc_io_dataOut;
  assign popCC_empty = (popCC_popPtrGray == popCC_pushPtrGray);
  assign io_pop_valid = (! popCC_empty);
  assign io_pop_fire_1 = (io_pop_valid && io_pop_ready);
  assign _zz_io_pop_payload_rdt = (io_pop_fire_1 ? popCC_popPtrPlus : popCC_popPtr);
  assign io_pop_payload_rdt = _zz_ram_port1[63 : 0];
  assign io_pop_fire_2 = (io_pop_valid && io_pop_ready);
  assign _zz_io_popOccupancy = popCC_pushPtrGray[1];
  assign io_popOccupancy = ({_zz_io_popOccupancy,(popCC_pushPtrGray[0] ^ _zz_io_popOccupancy)} - popCC_popPtr);
  assign pushToPopGray = pushCC_pushPtrGray;
  assign popToPushGray = popCC_popPtrGray;
  always @(posedge i_avl_clock or posedge i_avl_reset) begin
    if(i_avl_reset) begin
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

  always @(posedge i_wb_clock or posedge toplevel_i_avl_reset_syncronized) begin
    if(toplevel_i_avl_reset_syncronized) begin
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

module WbAvlCdc_StreamFifoCC (
  input               io_push_valid,
  output              io_push_ready,
  input               io_push_payload_we,
  input      [25:0]   io_push_payload_adr,
  input      [7:0]    io_push_payload_sel,
  input      [63:0]   io_push_payload_dat,
  output              io_pop_valid,
  input               io_pop_ready,
  output              io_pop_payload_we,
  output     [25:0]   io_pop_payload_adr,
  output     [7:0]    io_pop_payload_sel,
  output     [63:0]   io_pop_payload_dat,
  output     [3:0]    io_pushOccupancy,
  output     [3:0]    io_popOccupancy,
  input               i_wb_clock,
  input               i_wb_reset,
  input               i_avl_clock
);

  reg        [98:0]   _zz_ram_port1;
  wire       [3:0]    popToPushGray_buffercc_io_dataOut;
  wire                bufferCC_io_dataOut;
  wire       [3:0]    pushToPopGray_buffercc_io_dataOut;
  wire       [3:0]    _zz_pushCC_pushPtrGray;
  wire       [2:0]    _zz_ram_port;
  wire       [98:0]   _zz_ram_port_1;
  wire       [3:0]    _zz_popCC_popPtrGray;
  wire       [2:0]    _zz_ram_port_2;
  wire                _zz_ram_port_3;
  wire       [2:0]    _zz__zz_io_pop_payload_we_1;
  wire                _zz__zz_io_pop_payload_we_1_1;
  reg                 _zz_1;
  wire       [3:0]    popToPushGray;
  wire       [3:0]    pushToPopGray;
  reg        [3:0]    pushCC_pushPtr;
  wire       [3:0]    pushCC_pushPtrPlus;
  wire                io_push_fire;
  reg        [3:0]    pushCC_pushPtrGray;
  wire       [3:0]    pushCC_popPtrGray;
  wire                pushCC_full;
  wire                io_push_fire_1;
  wire                _zz_io_pushOccupancy;
  wire                _zz_io_pushOccupancy_1;
  wire                _zz_io_pushOccupancy_2;
  wire                toplevel_i_wb_reset_syncronized;
  reg        [3:0]    popCC_popPtr;
  wire       [3:0]    popCC_popPtrPlus;
  wire                io_pop_fire;
  reg        [3:0]    popCC_popPtrGray;
  wire       [3:0]    popCC_pushPtrGray;
  wire                popCC_empty;
  wire                io_pop_fire_1;
  wire       [3:0]    _zz_io_pop_payload_we;
  wire       [98:0]   _zz_io_pop_payload_we_1;
  wire                io_pop_fire_2;
  wire                _zz_io_popOccupancy;
  wire                _zz_io_popOccupancy_1;
  wire                _zz_io_popOccupancy_2;
  reg [98:0] ram [0:7];

  assign _zz_pushCC_pushPtrGray = (pushCC_pushPtrPlus >>> 1'b1);
  assign _zz_ram_port = pushCC_pushPtr[2:0];
  assign _zz_popCC_popPtrGray = (popCC_popPtrPlus >>> 1'b1);
  assign _zz__zz_io_pop_payload_we_1 = _zz_io_pop_payload_we[2:0];
  assign _zz_ram_port_1 = {io_push_payload_dat,{io_push_payload_sel,{io_push_payload_adr,io_push_payload_we}}};
  assign _zz__zz_io_pop_payload_we_1_1 = 1'b1;
  always @(posedge i_wb_clock) begin
    if(_zz_1) begin
      ram[_zz_ram_port] <= _zz_ram_port_1;
    end
  end

  always @(posedge i_avl_clock) begin
    if(_zz__zz_io_pop_payload_we_1_1) begin
      _zz_ram_port1 <= ram[_zz__zz_io_pop_payload_we_1];
    end
  end

  WbAvlCdc_BufferCC popToPushGray_buffercc (
    .io_dataIn     (popToPushGray[3:0]                      ), //i
    .io_dataOut    (popToPushGray_buffercc_io_dataOut[3:0]  ), //o
    .i_wb_clock    (i_wb_clock                              ), //i
    .i_wb_reset    (i_wb_reset                              )  //i
  );
  WbAvlCdc_BufferCC_1 bufferCC (
    .io_dataIn      (1'b0                 ), //i
    .io_dataOut     (bufferCC_io_dataOut  ), //o
    .i_avl_clock    (i_avl_clock          ), //i
    .i_wb_reset     (i_wb_reset           )  //i
  );
  WbAvlCdc_BufferCC_2 pushToPopGray_buffercc (
    .io_dataIn                          (pushToPopGray[3:0]                      ), //i
    .io_dataOut                         (pushToPopGray_buffercc_io_dataOut[3:0]  ), //o
    .i_avl_clock                        (i_avl_clock                             ), //i
    .toplevel_i_wb_reset_syncronized    (toplevel_i_wb_reset_syncronized         )  //i
  );
  always @(*) begin
    _zz_1 = 1'b0;
    if(io_push_fire_1) begin
      _zz_1 = 1'b1;
    end
  end

  assign pushCC_pushPtrPlus = (pushCC_pushPtr + 4'b0001);
  assign io_push_fire = (io_push_valid && io_push_ready);
  assign pushCC_popPtrGray = popToPushGray_buffercc_io_dataOut;
  assign pushCC_full = ((pushCC_pushPtrGray[3 : 2] == (~ pushCC_popPtrGray[3 : 2])) && (pushCC_pushPtrGray[1 : 0] == pushCC_popPtrGray[1 : 0]));
  assign io_push_ready = (! pushCC_full);
  assign io_push_fire_1 = (io_push_valid && io_push_ready);
  assign _zz_io_pushOccupancy = (pushCC_popPtrGray[1] ^ _zz_io_pushOccupancy_1);
  assign _zz_io_pushOccupancy_1 = (pushCC_popPtrGray[2] ^ _zz_io_pushOccupancy_2);
  assign _zz_io_pushOccupancy_2 = pushCC_popPtrGray[3];
  assign io_pushOccupancy = (pushCC_pushPtr - {_zz_io_pushOccupancy_2,{_zz_io_pushOccupancy_1,{_zz_io_pushOccupancy,(pushCC_popPtrGray[0] ^ _zz_io_pushOccupancy)}}});
  assign toplevel_i_wb_reset_syncronized = bufferCC_io_dataOut;
  assign popCC_popPtrPlus = (popCC_popPtr + 4'b0001);
  assign io_pop_fire = (io_pop_valid && io_pop_ready);
  assign popCC_pushPtrGray = pushToPopGray_buffercc_io_dataOut;
  assign popCC_empty = (popCC_popPtrGray == popCC_pushPtrGray);
  assign io_pop_valid = (! popCC_empty);
  assign io_pop_fire_1 = (io_pop_valid && io_pop_ready);
  assign _zz_io_pop_payload_we = (io_pop_fire_1 ? popCC_popPtrPlus : popCC_popPtr);
  assign _zz_io_pop_payload_we_1 = _zz_ram_port1;
  assign io_pop_payload_we = _zz_io_pop_payload_we_1[0];
  assign io_pop_payload_adr = _zz_io_pop_payload_we_1[26 : 1];
  assign io_pop_payload_sel = _zz_io_pop_payload_we_1[34 : 27];
  assign io_pop_payload_dat = _zz_io_pop_payload_we_1[98 : 35];
  assign io_pop_fire_2 = (io_pop_valid && io_pop_ready);
  assign _zz_io_popOccupancy = (popCC_pushPtrGray[1] ^ _zz_io_popOccupancy_1);
  assign _zz_io_popOccupancy_1 = (popCC_pushPtrGray[2] ^ _zz_io_popOccupancy_2);
  assign _zz_io_popOccupancy_2 = popCC_pushPtrGray[3];
  assign io_popOccupancy = ({_zz_io_popOccupancy_2,{_zz_io_popOccupancy_1,{_zz_io_popOccupancy,(popCC_pushPtrGray[0] ^ _zz_io_popOccupancy)}}} - popCC_popPtr);
  assign pushToPopGray = pushCC_pushPtrGray;
  assign popToPushGray = popCC_popPtrGray;
  always @(posedge i_wb_clock or posedge i_wb_reset) begin
    if(i_wb_reset) begin
      pushCC_pushPtr <= 4'b0000;
      pushCC_pushPtrGray <= 4'b0000;
    end else begin
      if(io_push_fire) begin
        pushCC_pushPtrGray <= (_zz_pushCC_pushPtrGray ^ pushCC_pushPtrPlus);
      end
      if(io_push_fire_1) begin
        pushCC_pushPtr <= pushCC_pushPtrPlus;
      end
    end
  end

  always @(posedge i_avl_clock or posedge toplevel_i_wb_reset_syncronized) begin
    if(toplevel_i_wb_reset_syncronized) begin
      popCC_popPtr <= 4'b0000;
      popCC_popPtrGray <= 4'b0000;
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

module WbAvlCdc_BufferCC_5 (
  input      [1:0]    io_dataIn,
  output     [1:0]    io_dataOut,
  input               i_wb_clock,
  input               toplevel_i_avl_reset_syncronized
);

  (* async_reg = "true" *) reg        [1:0]    buffers_0;
  (* async_reg = "true" *) reg        [1:0]    buffers_1;

  assign io_dataOut = buffers_1;
  always @(posedge i_wb_clock or posedge toplevel_i_avl_reset_syncronized) begin
    if(toplevel_i_avl_reset_syncronized) begin
      buffers_0 <= 2'b00;
      buffers_1 <= 2'b00;
    end else begin
      buffers_0 <= io_dataIn;
      buffers_1 <= buffers_0;
    end
  end


endmodule

module WbAvlCdc_BufferCC_4 (
  input               io_dataIn,
  output              io_dataOut,
  input               i_wb_clock,
  input               i_avl_reset
);

  (* async_reg = "true" *) reg                 buffers_0;
  (* async_reg = "true" *) reg                 buffers_1;

  assign io_dataOut = buffers_1;
  always @(posedge i_wb_clock or posedge i_avl_reset) begin
    if(i_avl_reset) begin
      buffers_0 <= 1'b1;
      buffers_1 <= 1'b1;
    end else begin
      buffers_0 <= io_dataIn;
      buffers_1 <= buffers_0;
    end
  end


endmodule

module WbAvlCdc_BufferCC_3 (
  input      [1:0]    io_dataIn,
  output     [1:0]    io_dataOut,
  input               i_avl_clock,
  input               i_avl_reset
);

  (* async_reg = "true" *) reg        [1:0]    buffers_0;
  (* async_reg = "true" *) reg        [1:0]    buffers_1;

  assign io_dataOut = buffers_1;
  always @(posedge i_avl_clock or posedge i_avl_reset) begin
    if(i_avl_reset) begin
      buffers_0 <= 2'b00;
      buffers_1 <= 2'b00;
    end else begin
      buffers_0 <= io_dataIn;
      buffers_1 <= buffers_0;
    end
  end


endmodule

module WbAvlCdc_BufferCC_2 (
  input      [3:0]    io_dataIn,
  output     [3:0]    io_dataOut,
  input               i_avl_clock,
  input               toplevel_i_wb_reset_syncronized
);

  (* async_reg = "true" *) reg        [3:0]    buffers_0;
  (* async_reg = "true" *) reg        [3:0]    buffers_1;

  assign io_dataOut = buffers_1;
  always @(posedge i_avl_clock or posedge toplevel_i_wb_reset_syncronized) begin
    if(toplevel_i_wb_reset_syncronized) begin
      buffers_0 <= 4'b0000;
      buffers_1 <= 4'b0000;
    end else begin
      buffers_0 <= io_dataIn;
      buffers_1 <= buffers_0;
    end
  end


endmodule

module WbAvlCdc_BufferCC_1 (
  input               io_dataIn,
  output              io_dataOut,
  input               i_avl_clock,
  input               i_wb_reset
);

  (* async_reg = "true" *) reg                 buffers_0;
  (* async_reg = "true" *) reg                 buffers_1;

  assign io_dataOut = buffers_1;
  always @(posedge i_avl_clock or posedge i_wb_reset) begin
    if(i_wb_reset) begin
      buffers_0 <= 1'b1;
      buffers_1 <= 1'b1;
    end else begin
      buffers_0 <= io_dataIn;
      buffers_1 <= buffers_0;
    end
  end


endmodule

module WbAvlCdc_BufferCC (
  input      [3:0]    io_dataIn,
  output     [3:0]    io_dataOut,
  input               i_wb_clock,
  input               i_wb_reset
);

  (* async_reg = "true" *) reg        [3:0]    buffers_0;
  (* async_reg = "true" *) reg        [3:0]    buffers_1;

  assign io_dataOut = buffers_1;
  always @(posedge i_wb_clock or posedge i_wb_reset) begin
    if(i_wb_reset) begin
      buffers_0 <= 4'b0000;
      buffers_1 <= 4'b0000;
    end else begin
      buffers_0 <= io_dataIn;
      buffers_1 <= buffers_0;
    end
  end


endmodule
