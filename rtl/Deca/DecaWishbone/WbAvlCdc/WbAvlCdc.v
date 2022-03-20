
// Generator : SpinalHDL v1.6.4    git head : 598c18959149eb18e5eee5b0aa3eef01ecaa41a1
// Component : WbAvlCdc
// Git hash  : 181684644c21cb687b259ffca78cbbc6782ca144

`timescale 1ns/1ps

module WbAvlCdc (
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
  output              o_avl_burstbegin,
  output     [7:0]    o_avl_be,
  output     [25:0]   o_avl_adr,
  output     [63:0]   o_avl_dat,
  output              o_avl_wr_req,
  output              o_avl_rdt_req,
  output     [2:0]    o_avl_size,
  input      [63:0]   i_avl_rdt,
  input               i_avl_ready,
  input               i_avl_rdt_valid
);
  localparam wbClockArea_wbStateMachine_enumDef_BOOT = 3'd0;
  localparam wbClockArea_wbStateMachine_enumDef_init = 3'd1;
  localparam wbClockArea_wbStateMachine_enumDef_ready = 3'd2;
  localparam wbClockArea_wbStateMachine_enumDef_read = 3'd3;
  localparam wbClockArea_wbStateMachine_enumDef_post_read = 3'd4;
  localparam wbClockArea_wbStateMachine_enumDef_write = 3'd5;
  localparam wbClockArea_wbStateMachine_enumDef_post_write = 3'd6;
  localparam avlClockArea_avlStateMachine_enumDef_BOOT = 3'd0;
  localparam avlClockArea_avlStateMachine_enumDef_init = 3'd1;
  localparam avlClockArea_avlStateMachine_enumDef_ready = 3'd2;
  localparam avlClockArea_avlStateMachine_enumDef_read = 3'd3;
  localparam avlClockArea_avlStateMachine_enumDef_write = 3'd4;

  wire                avl_burstbegin_io_push_ready;
  wire                avl_burstbegin_io_pop_valid;
  wire                avl_burstbegin_io_pop_payload;
  wire       [1:0]    avl_burstbegin_io_pushOccupancy;
  wire       [1:0]    avl_burstbegin_io_popOccupancy;
  wire                avl_burstbegin_toplevel_i_wb_reset_syncronized_1;
  wire                avl_be_io_push_ready;
  wire                avl_be_io_pop_valid;
  wire       [7:0]    avl_be_io_pop_payload;
  wire       [1:0]    avl_be_io_pushOccupancy;
  wire       [1:0]    avl_be_io_popOccupancy;
  wire                avl_adr_io_push_ready;
  wire                avl_adr_io_pop_valid;
  wire       [25:0]   avl_adr_io_pop_payload;
  wire       [1:0]    avl_adr_io_pushOccupancy;
  wire       [1:0]    avl_adr_io_popOccupancy;
  wire                avl_dat_io_push_ready;
  wire                avl_dat_io_pop_valid;
  wire       [63:0]   avl_dat_io_pop_payload;
  wire       [1:0]    avl_dat_io_pushOccupancy;
  wire       [1:0]    avl_dat_io_popOccupancy;
  wire                avl_wr_req_io_push_ready;
  wire                avl_wr_req_io_pop_valid;
  wire                avl_wr_req_io_pop_payload;
  wire       [1:0]    avl_wr_req_io_pushOccupancy;
  wire       [1:0]    avl_wr_req_io_popOccupancy;
  wire                avl_rdt_req_io_push_ready;
  wire                avl_rdt_req_io_pop_valid;
  wire                avl_rdt_req_io_pop_payload;
  wire       [1:0]    avl_rdt_req_io_pushOccupancy;
  wire       [1:0]    avl_rdt_req_io_popOccupancy;
  wire                avl_rdt_io_push_ready;
  wire                avl_rdt_io_pop_valid;
  wire       [63:0]   avl_rdt_io_pop_payload;
  wire       [1:0]    avl_rdt_io_pushOccupancy;
  wire       [1:0]    avl_rdt_io_popOccupancy;
  wire                avl_rdt_toplevel_i_avl_reset_syncronized_1;
  wire                avl_rdt_valid_io_push_ready;
  wire                avl_rdt_valid_io_pop_valid;
  wire                avl_rdt_valid_io_pop_payload;
  wire       [1:0]    avl_rdt_valid_io_pushOccupancy;
  wire       [1:0]    avl_rdt_valid_io_popOccupancy;
  wire                avl_size_io_push_ready;
  wire                avl_size_io_pop_valid;
  wire       [2:0]    avl_size_io_pop_payload;
  wire       [1:0]    avl_size_io_pushOccupancy;
  wire       [1:0]    avl_size_io_popOccupancy;
  wire                i_avl_ready_buffercc_io_dataOut;
  reg                 wb2cdc_burstbegin_valid;
  wire                wb2cdc_burstbegin_ready;
  reg                 wb2cdc_burstbegin_payload;
  wire                cdc2avl_burstbegin_valid;
  reg                 cdc2avl_burstbegin_ready;
  wire                cdc2avl_burstbegin_payload;
  reg        [7:0]    be_wire;
  reg                 wb2cdc_be_valid;
  wire                wb2cdc_be_ready;
  wire       [7:0]    wb2cdc_be_payload;
  wire                cdc2avl_be_valid;
  reg                 cdc2avl_be_ready;
  wire       [7:0]    cdc2avl_be_payload;
  reg                 wb2cdc_adr_valid;
  wire                wb2cdc_adr_ready;
  wire       [25:0]   wb2cdc_adr_payload;
  wire                cdc2avl_adr_valid;
  reg                 cdc2avl_adr_ready;
  wire       [25:0]   cdc2avl_adr_payload;
  reg                 wb2cdc_dat_valid;
  wire                wb2cdc_dat_ready;
  wire       [63:0]   wb2cdc_dat_payload;
  wire                cdc2avl_dat_valid;
  reg                 cdc2avl_dat_ready;
  wire       [63:0]   cdc2avl_dat_payload;
  reg                 wb2cdc_wr_req_valid;
  wire                wb2cdc_wr_req_ready;
  reg                 wb2cdc_wr_req_payload;
  wire                cdc2avl_wr_req_valid;
  reg                 cdc2avl_wr_req_ready;
  wire                cdc2avl_wr_req_payload;
  reg                 wb2cdc_rdt_req_valid;
  wire                wb2cdc_rdt_req_ready;
  reg                 wb2cdc_rdt_req_payload;
  wire                cdc2avl_rdt_req_valid;
  reg                 cdc2avl_rdt_req_ready;
  wire                cdc2avl_rdt_req_payload;
  reg                 avl2cdc_rdt_valid;
  wire                avl2cdc_rdt_ready;
  reg        [63:0]   avl2cdc_rdt_payload;
  wire                cdc2wb_rdt_valid;
  reg                 cdc2wb_rdt_ready;
  wire       [63:0]   cdc2wb_rdt_payload;
  reg                 avl2cdc_rdt_valid_valid;
  wire                avl2cdc_rdt_valid_ready;
  reg                 avl2cdc_rdt_valid_payload;
  wire                cdc2wb_rdt_valid_valid;
  reg                 cdc2wb_rdt_valid_ready;
  wire                cdc2wb_rdt_valid_payload;
  reg                 wb2cdc_size_valid;
  wire                wb2cdc_size_ready;
  reg        [2:0]    wb2cdc_size_payload;
  wire                cdc2avl_size_valid;
  reg                 cdc2avl_size_ready;
  wire       [2:0]    cdc2avl_size_payload;
  reg        [0:0]    wbClockArea_cycle;
  wire                wbClockArea_avl_ready;
  wire                wbClockArea_cyc_stb;
  wire                wbClockArea_wbStateMachine_wantExit;
  reg                 wbClockArea_wbStateMachine_wantStart;
  wire                wbClockArea_wbStateMachine_wantKill;
  reg        [0:0]    avlClockArea_cycle;
  reg                 avlClockArea_rdt_valid;
  reg                 avlClockArea_rdt_req;
  wire                avlClockArea_avlStateMachine_wantExit;
  reg                 avlClockArea_avlStateMachine_wantStart;
  wire                avlClockArea_avlStateMachine_wantKill;
  reg        [2:0]    wbClockArea_wbStateMachine_stateReg;
  reg        [2:0]    wbClockArea_wbStateMachine_stateNext;
  wire                when_WbAvlCdc_l273;
  wire                when_WbAvlCdc_l287;
  wire                when_WbAvlCdc_l280;
  wire                when_WbAvlCdc_l306;
  wire                when_WbAvlCdc_l308;
  wire                switch_WbAvlCdc_l313;
  wire                when_WbAvlCdc_l333;
  wire                when_WbAvlCdc_l346;
  wire                when_WbAvlCdc_l351;
  wire                when_WbAvlCdc_l363;
  wire                when_WbAvlCdc_l370;
  wire                when_WbAvlCdc_l360;
  wire                when_WbAvlCdc_l391;
  wire                switch_WbAvlCdc_l402;
  wire                when_WbAvlCdc_l422;
  wire                when_StateMachine_l222;
  wire                when_StateMachine_l222_1;
  reg        [2:0]    avlClockArea_avlStateMachine_stateReg;
  reg        [2:0]    avlClockArea_avlStateMachine_stateNext;
  wire                when_WbAvlCdc_l584;
  wire                when_WbAvlCdc_l595;
  wire                when_WbAvlCdc_l589;
  wire                when_WbAvlCdc_l611;
  wire                when_WbAvlCdc_l618;
  wire                when_WbAvlCdc_l636;
  wire                when_StateMachine_l222_2;
  wire                when_StateMachine_l222_3;
  `ifndef SYNTHESIS
  reg [79:0] wbClockArea_wbStateMachine_stateReg_string;
  reg [79:0] wbClockArea_wbStateMachine_stateNext_string;
  reg [39:0] avlClockArea_avlStateMachine_stateReg_string;
  reg [39:0] avlClockArea_avlStateMachine_stateNext_string;
  `endif


  WbAvlCdc_StreamFifoCC avl_burstbegin (
    .io_push_valid                        (wb2cdc_burstbegin_valid                           ), //i
    .io_push_ready                        (avl_burstbegin_io_push_ready                      ), //o
    .io_push_payload                      (wb2cdc_burstbegin_payload                         ), //i
    .io_pop_valid                         (avl_burstbegin_io_pop_valid                       ), //o
    .io_pop_ready                         (cdc2avl_burstbegin_ready                          ), //i
    .io_pop_payload                       (avl_burstbegin_io_pop_payload                     ), //o
    .io_pushOccupancy                     (avl_burstbegin_io_pushOccupancy[1:0]              ), //o
    .io_popOccupancy                      (avl_burstbegin_io_popOccupancy[1:0]               ), //o
    .i_wb_clock                           (i_wb_clock                                        ), //i
    .i_wb_reset                           (i_wb_reset                                        ), //i
    .i_avl_clock                          (i_avl_clock                                       ), //i
    .toplevel_i_wb_reset_syncronized_1    (avl_burstbegin_toplevel_i_wb_reset_syncronized_1  )  //o
  );
  WbAvlCdc_StreamFifoCC_1 avl_be (
    .io_push_valid                      (wb2cdc_be_valid                                   ), //i
    .io_push_ready                      (avl_be_io_push_ready                              ), //o
    .io_push_payload                    (wb2cdc_be_payload[7:0]                            ), //i
    .io_pop_valid                       (avl_be_io_pop_valid                               ), //o
    .io_pop_ready                       (cdc2avl_be_ready                                  ), //i
    .io_pop_payload                     (avl_be_io_pop_payload[7:0]                        ), //o
    .io_pushOccupancy                   (avl_be_io_pushOccupancy[1:0]                      ), //o
    .io_popOccupancy                    (avl_be_io_popOccupancy[1:0]                       ), //o
    .i_wb_clock                         (i_wb_clock                                        ), //i
    .i_wb_reset                         (i_wb_reset                                        ), //i
    .i_avl_clock                        (i_avl_clock                                       ), //i
    .toplevel_i_wb_reset_syncronized    (avl_burstbegin_toplevel_i_wb_reset_syncronized_1  )  //i
  );
  WbAvlCdc_StreamFifoCC_2 avl_adr (
    .io_push_valid                      (wb2cdc_adr_valid                                  ), //i
    .io_push_ready                      (avl_adr_io_push_ready                             ), //o
    .io_push_payload                    (wb2cdc_adr_payload[25:0]                          ), //i
    .io_pop_valid                       (avl_adr_io_pop_valid                              ), //o
    .io_pop_ready                       (cdc2avl_adr_ready                                 ), //i
    .io_pop_payload                     (avl_adr_io_pop_payload[25:0]                      ), //o
    .io_pushOccupancy                   (avl_adr_io_pushOccupancy[1:0]                     ), //o
    .io_popOccupancy                    (avl_adr_io_popOccupancy[1:0]                      ), //o
    .i_wb_clock                         (i_wb_clock                                        ), //i
    .i_wb_reset                         (i_wb_reset                                        ), //i
    .i_avl_clock                        (i_avl_clock                                       ), //i
    .toplevel_i_wb_reset_syncronized    (avl_burstbegin_toplevel_i_wb_reset_syncronized_1  )  //i
  );
  WbAvlCdc_StreamFifoCC_3 avl_dat (
    .io_push_valid                      (wb2cdc_dat_valid                                  ), //i
    .io_push_ready                      (avl_dat_io_push_ready                             ), //o
    .io_push_payload                    (wb2cdc_dat_payload[63:0]                          ), //i
    .io_pop_valid                       (avl_dat_io_pop_valid                              ), //o
    .io_pop_ready                       (cdc2avl_dat_ready                                 ), //i
    .io_pop_payload                     (avl_dat_io_pop_payload[63:0]                      ), //o
    .io_pushOccupancy                   (avl_dat_io_pushOccupancy[1:0]                     ), //o
    .io_popOccupancy                    (avl_dat_io_popOccupancy[1:0]                      ), //o
    .i_wb_clock                         (i_wb_clock                                        ), //i
    .i_wb_reset                         (i_wb_reset                                        ), //i
    .i_avl_clock                        (i_avl_clock                                       ), //i
    .toplevel_i_wb_reset_syncronized    (avl_burstbegin_toplevel_i_wb_reset_syncronized_1  )  //i
  );
  WbAvlCdc_StreamFifoCC_4 avl_wr_req (
    .io_push_valid                      (wb2cdc_wr_req_valid                               ), //i
    .io_push_ready                      (avl_wr_req_io_push_ready                          ), //o
    .io_push_payload                    (wb2cdc_wr_req_payload                             ), //i
    .io_pop_valid                       (avl_wr_req_io_pop_valid                           ), //o
    .io_pop_ready                       (cdc2avl_wr_req_ready                              ), //i
    .io_pop_payload                     (avl_wr_req_io_pop_payload                         ), //o
    .io_pushOccupancy                   (avl_wr_req_io_pushOccupancy[1:0]                  ), //o
    .io_popOccupancy                    (avl_wr_req_io_popOccupancy[1:0]                   ), //o
    .i_wb_clock                         (i_wb_clock                                        ), //i
    .i_wb_reset                         (i_wb_reset                                        ), //i
    .i_avl_clock                        (i_avl_clock                                       ), //i
    .toplevel_i_wb_reset_syncronized    (avl_burstbegin_toplevel_i_wb_reset_syncronized_1  )  //i
  );
  WbAvlCdc_StreamFifoCC_4 avl_rdt_req (
    .io_push_valid                      (wb2cdc_rdt_req_valid                              ), //i
    .io_push_ready                      (avl_rdt_req_io_push_ready                         ), //o
    .io_push_payload                    (wb2cdc_rdt_req_payload                            ), //i
    .io_pop_valid                       (avl_rdt_req_io_pop_valid                          ), //o
    .io_pop_ready                       (cdc2avl_rdt_req_ready                             ), //i
    .io_pop_payload                     (avl_rdt_req_io_pop_payload                        ), //o
    .io_pushOccupancy                   (avl_rdt_req_io_pushOccupancy[1:0]                 ), //o
    .io_popOccupancy                    (avl_rdt_req_io_popOccupancy[1:0]                  ), //o
    .i_wb_clock                         (i_wb_clock                                        ), //i
    .i_wb_reset                         (i_wb_reset                                        ), //i
    .i_avl_clock                        (i_avl_clock                                       ), //i
    .toplevel_i_wb_reset_syncronized    (avl_burstbegin_toplevel_i_wb_reset_syncronized_1  )  //i
  );
  WbAvlCdc_StreamFifoCC_6 avl_rdt (
    .io_push_valid                         (avl2cdc_rdt_valid                           ), //i
    .io_push_ready                         (avl_rdt_io_push_ready                       ), //o
    .io_push_payload                       (avl2cdc_rdt_payload[63:0]                   ), //i
    .io_pop_valid                          (avl_rdt_io_pop_valid                        ), //o
    .io_pop_ready                          (cdc2wb_rdt_ready                            ), //i
    .io_pop_payload                        (avl_rdt_io_pop_payload[63:0]                ), //o
    .io_pushOccupancy                      (avl_rdt_io_pushOccupancy[1:0]               ), //o
    .io_popOccupancy                       (avl_rdt_io_popOccupancy[1:0]                ), //o
    .i_avl_clock                           (i_avl_clock                                 ), //i
    .i_avl_reset                           (i_avl_reset                                 ), //i
    .i_wb_clock                            (i_wb_clock                                  ), //i
    .toplevel_i_avl_reset_syncronized_1    (avl_rdt_toplevel_i_avl_reset_syncronized_1  )  //o
  );
  WbAvlCdc_StreamFifoCC_7 avl_rdt_valid (
    .io_push_valid                       (avl2cdc_rdt_valid_valid                     ), //i
    .io_push_ready                       (avl_rdt_valid_io_push_ready                 ), //o
    .io_push_payload                     (avl2cdc_rdt_valid_payload                   ), //i
    .io_pop_valid                        (avl_rdt_valid_io_pop_valid                  ), //o
    .io_pop_ready                        (cdc2wb_rdt_valid_ready                      ), //i
    .io_pop_payload                      (avl_rdt_valid_io_pop_payload                ), //o
    .io_pushOccupancy                    (avl_rdt_valid_io_pushOccupancy[1:0]         ), //o
    .io_popOccupancy                     (avl_rdt_valid_io_popOccupancy[1:0]          ), //o
    .i_avl_clock                         (i_avl_clock                                 ), //i
    .i_avl_reset                         (i_avl_reset                                 ), //i
    .i_wb_clock                          (i_wb_clock                                  ), //i
    .toplevel_i_avl_reset_syncronized    (avl_rdt_toplevel_i_avl_reset_syncronized_1  )  //i
  );
  WbAvlCdc_StreamFifoCC_8 avl_size (
    .io_push_valid                      (wb2cdc_size_valid                                 ), //i
    .io_push_ready                      (avl_size_io_push_ready                            ), //o
    .io_push_payload                    (wb2cdc_size_payload[2:0]                          ), //i
    .io_pop_valid                       (avl_size_io_pop_valid                             ), //o
    .io_pop_ready                       (cdc2avl_size_ready                                ), //i
    .io_pop_payload                     (avl_size_io_pop_payload[2:0]                      ), //o
    .io_pushOccupancy                   (avl_size_io_pushOccupancy[1:0]                    ), //o
    .io_popOccupancy                    (avl_size_io_popOccupancy[1:0]                     ), //o
    .i_wb_clock                         (i_wb_clock                                        ), //i
    .i_wb_reset                         (i_wb_reset                                        ), //i
    .i_avl_clock                        (i_avl_clock                                       ), //i
    .toplevel_i_wb_reset_syncronized    (avl_burstbegin_toplevel_i_wb_reset_syncronized_1  )  //i
  );
  WbAvlCdc_BufferCC_20 i_avl_ready_buffercc (
    .io_dataIn     (i_avl_ready                      ), //i
    .io_dataOut    (i_avl_ready_buffercc_io_dataOut  ), //o
    .i_wb_clock    (i_wb_clock                       ), //i
    .i_wb_reset    (i_wb_reset                       )  //i
  );
  `ifndef SYNTHESIS
  always @(*) begin
    case(wbClockArea_wbStateMachine_stateReg)
      wbClockArea_wbStateMachine_enumDef_BOOT : wbClockArea_wbStateMachine_stateReg_string = "BOOT      ";
      wbClockArea_wbStateMachine_enumDef_init : wbClockArea_wbStateMachine_stateReg_string = "init      ";
      wbClockArea_wbStateMachine_enumDef_ready : wbClockArea_wbStateMachine_stateReg_string = "ready     ";
      wbClockArea_wbStateMachine_enumDef_read : wbClockArea_wbStateMachine_stateReg_string = "read      ";
      wbClockArea_wbStateMachine_enumDef_post_read : wbClockArea_wbStateMachine_stateReg_string = "post_read ";
      wbClockArea_wbStateMachine_enumDef_write : wbClockArea_wbStateMachine_stateReg_string = "write     ";
      wbClockArea_wbStateMachine_enumDef_post_write : wbClockArea_wbStateMachine_stateReg_string = "post_write";
      default : wbClockArea_wbStateMachine_stateReg_string = "??????????";
    endcase
  end
  always @(*) begin
    case(wbClockArea_wbStateMachine_stateNext)
      wbClockArea_wbStateMachine_enumDef_BOOT : wbClockArea_wbStateMachine_stateNext_string = "BOOT      ";
      wbClockArea_wbStateMachine_enumDef_init : wbClockArea_wbStateMachine_stateNext_string = "init      ";
      wbClockArea_wbStateMachine_enumDef_ready : wbClockArea_wbStateMachine_stateNext_string = "ready     ";
      wbClockArea_wbStateMachine_enumDef_read : wbClockArea_wbStateMachine_stateNext_string = "read      ";
      wbClockArea_wbStateMachine_enumDef_post_read : wbClockArea_wbStateMachine_stateNext_string = "post_read ";
      wbClockArea_wbStateMachine_enumDef_write : wbClockArea_wbStateMachine_stateNext_string = "write     ";
      wbClockArea_wbStateMachine_enumDef_post_write : wbClockArea_wbStateMachine_stateNext_string = "post_write";
      default : wbClockArea_wbStateMachine_stateNext_string = "??????????";
    endcase
  end
  always @(*) begin
    case(avlClockArea_avlStateMachine_stateReg)
      avlClockArea_avlStateMachine_enumDef_BOOT : avlClockArea_avlStateMachine_stateReg_string = "BOOT ";
      avlClockArea_avlStateMachine_enumDef_init : avlClockArea_avlStateMachine_stateReg_string = "init ";
      avlClockArea_avlStateMachine_enumDef_ready : avlClockArea_avlStateMachine_stateReg_string = "ready";
      avlClockArea_avlStateMachine_enumDef_read : avlClockArea_avlStateMachine_stateReg_string = "read ";
      avlClockArea_avlStateMachine_enumDef_write : avlClockArea_avlStateMachine_stateReg_string = "write";
      default : avlClockArea_avlStateMachine_stateReg_string = "?????";
    endcase
  end
  always @(*) begin
    case(avlClockArea_avlStateMachine_stateNext)
      avlClockArea_avlStateMachine_enumDef_BOOT : avlClockArea_avlStateMachine_stateNext_string = "BOOT ";
      avlClockArea_avlStateMachine_enumDef_init : avlClockArea_avlStateMachine_stateNext_string = "init ";
      avlClockArea_avlStateMachine_enumDef_ready : avlClockArea_avlStateMachine_stateNext_string = "ready";
      avlClockArea_avlStateMachine_enumDef_read : avlClockArea_avlStateMachine_stateNext_string = "read ";
      avlClockArea_avlStateMachine_enumDef_write : avlClockArea_avlStateMachine_stateNext_string = "write";
      default : avlClockArea_avlStateMachine_stateNext_string = "?????";
    endcase
  end
  `endif

  assign o_wb_err = 1'b0;
  assign o_wb_rty = 1'b0;
  always @(*) begin
    wb2cdc_burstbegin_payload = 1'b0;
    case(wbClockArea_wbStateMachine_stateReg)
      wbClockArea_wbStateMachine_enumDef_init : begin
      end
      wbClockArea_wbStateMachine_enumDef_ready : begin
        if(when_WbAvlCdc_l306) begin
          if(when_WbAvlCdc_l308) begin
            wb2cdc_burstbegin_payload = 1'b1;
          end else begin
            if(when_WbAvlCdc_l333) begin
              wb2cdc_burstbegin_payload = 1'b0;
            end
          end
        end
      end
      wbClockArea_wbStateMachine_enumDef_read : begin
      end
      wbClockArea_wbStateMachine_enumDef_post_read : begin
      end
      wbClockArea_wbStateMachine_enumDef_write : begin
      end
      wbClockArea_wbStateMachine_enumDef_post_write : begin
      end
      default : begin
      end
    endcase
  end

  always @(*) begin
    wb2cdc_burstbegin_valid = 1'b0;
    case(wbClockArea_wbStateMachine_stateReg)
      wbClockArea_wbStateMachine_enumDef_init : begin
      end
      wbClockArea_wbStateMachine_enumDef_ready : begin
        if(when_WbAvlCdc_l306) begin
          if(when_WbAvlCdc_l308) begin
            wb2cdc_burstbegin_valid = 1'b1;
          end else begin
            if(when_WbAvlCdc_l333) begin
              wb2cdc_burstbegin_valid = 1'b1;
            end
          end
        end
      end
      wbClockArea_wbStateMachine_enumDef_read : begin
      end
      wbClockArea_wbStateMachine_enumDef_post_read : begin
      end
      wbClockArea_wbStateMachine_enumDef_write : begin
      end
      wbClockArea_wbStateMachine_enumDef_post_write : begin
      end
      default : begin
      end
    endcase
  end

  assign o_avl_burstbegin = (cdc2avl_burstbegin_payload && cdc2avl_burstbegin_valid);
  always @(*) begin
    cdc2avl_burstbegin_ready = 1'b0;
    case(avlClockArea_avlStateMachine_stateReg)
      avlClockArea_avlStateMachine_enumDef_init : begin
      end
      avlClockArea_avlStateMachine_enumDef_ready : begin
        if(when_WbAvlCdc_l611) begin
          cdc2avl_burstbegin_ready = 1'b1;
        end else begin
          if(when_WbAvlCdc_l618) begin
            cdc2avl_burstbegin_ready = 1'b1;
          end
        end
      end
      avlClockArea_avlStateMachine_enumDef_read : begin
        if(avlClockArea_rdt_valid) begin
          cdc2avl_burstbegin_ready = 1'b1;
        end
      end
      avlClockArea_avlStateMachine_enumDef_write : begin
        if(when_WbAvlCdc_l636) begin
          cdc2avl_burstbegin_ready = 1'b1;
        end
      end
      default : begin
      end
    endcase
  end

  assign wb2cdc_burstbegin_ready = avl_burstbegin_io_push_ready;
  assign cdc2avl_burstbegin_valid = avl_burstbegin_io_pop_valid;
  assign cdc2avl_burstbegin_payload = avl_burstbegin_io_pop_payload;
  always @(*) begin
    be_wire = 8'h0;
    case(wbClockArea_wbStateMachine_stateReg)
      wbClockArea_wbStateMachine_enumDef_init : begin
      end
      wbClockArea_wbStateMachine_enumDef_ready : begin
        if(when_WbAvlCdc_l306) begin
          if(when_WbAvlCdc_l308) begin
            case(switch_WbAvlCdc_l313)
              1'b0 : begin
                be_wire = {4'b0000,i_wb_sel};
              end
              default : begin
                be_wire = {i_wb_sel,4'b0000};
              end
            endcase
          end
        end
      end
      wbClockArea_wbStateMachine_enumDef_read : begin
      end
      wbClockArea_wbStateMachine_enumDef_post_read : begin
      end
      wbClockArea_wbStateMachine_enumDef_write : begin
      end
      wbClockArea_wbStateMachine_enumDef_post_write : begin
      end
      default : begin
      end
    endcase
  end

  assign wb2cdc_be_payload = be_wire;
  always @(*) begin
    wb2cdc_be_valid = 1'b0;
    case(wbClockArea_wbStateMachine_stateReg)
      wbClockArea_wbStateMachine_enumDef_init : begin
      end
      wbClockArea_wbStateMachine_enumDef_ready : begin
        if(when_WbAvlCdc_l306) begin
          if(when_WbAvlCdc_l308) begin
            wb2cdc_be_valid = 1'b1;
          end else begin
            if(when_WbAvlCdc_l333) begin
              wb2cdc_be_valid = 1'b0;
            end
          end
        end
      end
      wbClockArea_wbStateMachine_enumDef_read : begin
      end
      wbClockArea_wbStateMachine_enumDef_post_read : begin
      end
      wbClockArea_wbStateMachine_enumDef_write : begin
      end
      wbClockArea_wbStateMachine_enumDef_post_write : begin
      end
      default : begin
      end
    endcase
  end

  assign o_avl_be = cdc2avl_be_payload;
  always @(*) begin
    cdc2avl_be_ready = 1'b0;
    case(avlClockArea_avlStateMachine_stateReg)
      avlClockArea_avlStateMachine_enumDef_init : begin
      end
      avlClockArea_avlStateMachine_enumDef_ready : begin
        if(!when_WbAvlCdc_l611) begin
          if(when_WbAvlCdc_l618) begin
            cdc2avl_be_ready = 1'b1;
          end
        end
      end
      avlClockArea_avlStateMachine_enumDef_read : begin
        if(avlClockArea_rdt_valid) begin
          cdc2avl_be_ready = 1'b1;
        end
      end
      avlClockArea_avlStateMachine_enumDef_write : begin
        if(when_WbAvlCdc_l636) begin
          cdc2avl_be_ready = 1'b1;
        end
      end
      default : begin
      end
    endcase
  end

  assign wb2cdc_be_ready = avl_be_io_push_ready;
  assign cdc2avl_be_valid = avl_be_io_pop_valid;
  assign cdc2avl_be_payload = avl_be_io_pop_payload;
  assign wb2cdc_adr_payload = i_wb_adr[28 : 3];
  always @(*) begin
    wb2cdc_adr_valid = 1'b0;
    case(wbClockArea_wbStateMachine_stateReg)
      wbClockArea_wbStateMachine_enumDef_init : begin
      end
      wbClockArea_wbStateMachine_enumDef_ready : begin
        wb2cdc_adr_valid = 1'b0;
        if(when_WbAvlCdc_l306) begin
          if(when_WbAvlCdc_l308) begin
            wb2cdc_adr_valid = 1'b1;
          end else begin
            if(when_WbAvlCdc_l333) begin
              wb2cdc_adr_valid = 1'b0;
            end
          end
        end
      end
      wbClockArea_wbStateMachine_enumDef_read : begin
      end
      wbClockArea_wbStateMachine_enumDef_post_read : begin
      end
      wbClockArea_wbStateMachine_enumDef_write : begin
      end
      wbClockArea_wbStateMachine_enumDef_post_write : begin
      end
      default : begin
      end
    endcase
  end

  assign o_avl_adr = cdc2avl_adr_payload;
  always @(*) begin
    cdc2avl_adr_ready = 1'b0;
    case(avlClockArea_avlStateMachine_stateReg)
      avlClockArea_avlStateMachine_enumDef_init : begin
      end
      avlClockArea_avlStateMachine_enumDef_ready : begin
      end
      avlClockArea_avlStateMachine_enumDef_read : begin
        if(avlClockArea_rdt_valid) begin
          cdc2avl_adr_ready = 1'b1;
        end
      end
      avlClockArea_avlStateMachine_enumDef_write : begin
        if(when_WbAvlCdc_l636) begin
          cdc2avl_adr_ready = 1'b1;
        end
      end
      default : begin
      end
    endcase
  end

  assign wb2cdc_adr_ready = avl_adr_io_push_ready;
  assign cdc2avl_adr_valid = avl_adr_io_pop_valid;
  assign cdc2avl_adr_payload = avl_adr_io_pop_payload;
  assign wb2cdc_dat_payload = {i_wb_dat,i_wb_dat};
  always @(*) begin
    wb2cdc_dat_valid = 1'b0;
    case(wbClockArea_wbStateMachine_stateReg)
      wbClockArea_wbStateMachine_enumDef_init : begin
      end
      wbClockArea_wbStateMachine_enumDef_ready : begin
        if(when_WbAvlCdc_l306) begin
          if(i_wb_we) begin
            if(when_WbAvlCdc_l346) begin
              wb2cdc_dat_valid = 1'b1;
            end else begin
              if(when_WbAvlCdc_l351) begin
                wb2cdc_dat_valid = 1'b0;
              end
            end
          end
        end
      end
      wbClockArea_wbStateMachine_enumDef_read : begin
      end
      wbClockArea_wbStateMachine_enumDef_post_read : begin
      end
      wbClockArea_wbStateMachine_enumDef_write : begin
      end
      wbClockArea_wbStateMachine_enumDef_post_write : begin
      end
      default : begin
      end
    endcase
  end

  assign o_avl_dat = cdc2avl_dat_payload;
  always @(*) begin
    cdc2avl_dat_ready = 1'b0;
    case(avlClockArea_avlStateMachine_stateReg)
      avlClockArea_avlStateMachine_enumDef_init : begin
      end
      avlClockArea_avlStateMachine_enumDef_ready : begin
      end
      avlClockArea_avlStateMachine_enumDef_read : begin
      end
      avlClockArea_avlStateMachine_enumDef_write : begin
        if(when_WbAvlCdc_l636) begin
          cdc2avl_dat_ready = 1'b1;
        end
      end
      default : begin
      end
    endcase
  end

  assign wb2cdc_dat_ready = avl_dat_io_push_ready;
  assign cdc2avl_dat_valid = avl_dat_io_pop_valid;
  assign cdc2avl_dat_payload = avl_dat_io_pop_payload;
  always @(*) begin
    wb2cdc_wr_req_payload = 1'b0;
    case(wbClockArea_wbStateMachine_stateReg)
      wbClockArea_wbStateMachine_enumDef_init : begin
        if(when_WbAvlCdc_l273) begin
          wb2cdc_wr_req_payload = 1'b0;
        end else begin
          if(when_WbAvlCdc_l280) begin
            wb2cdc_wr_req_payload = 1'b0;
          end
        end
      end
      wbClockArea_wbStateMachine_enumDef_ready : begin
        if(when_WbAvlCdc_l306) begin
          if(i_wb_we) begin
            if(when_WbAvlCdc_l346) begin
              wb2cdc_wr_req_payload = 1'b1;
            end else begin
              if(when_WbAvlCdc_l351) begin
                wb2cdc_wr_req_payload = 1'b0;
              end
            end
          end
        end
      end
      wbClockArea_wbStateMachine_enumDef_read : begin
      end
      wbClockArea_wbStateMachine_enumDef_post_read : begin
      end
      wbClockArea_wbStateMachine_enumDef_write : begin
      end
      wbClockArea_wbStateMachine_enumDef_post_write : begin
      end
      default : begin
      end
    endcase
  end

  always @(*) begin
    wb2cdc_wr_req_valid = 1'b0;
    case(wbClockArea_wbStateMachine_stateReg)
      wbClockArea_wbStateMachine_enumDef_init : begin
        if(when_WbAvlCdc_l273) begin
          wb2cdc_wr_req_valid = 1'b1;
        end else begin
          if(when_WbAvlCdc_l280) begin
            wb2cdc_wr_req_valid = 1'b0;
          end
        end
      end
      wbClockArea_wbStateMachine_enumDef_ready : begin
        if(when_WbAvlCdc_l306) begin
          if(i_wb_we) begin
            if(when_WbAvlCdc_l346) begin
              wb2cdc_wr_req_valid = 1'b1;
            end else begin
              if(when_WbAvlCdc_l351) begin
                wb2cdc_wr_req_valid = 1'b1;
              end
            end
          end
        end
      end
      wbClockArea_wbStateMachine_enumDef_read : begin
      end
      wbClockArea_wbStateMachine_enumDef_post_read : begin
      end
      wbClockArea_wbStateMachine_enumDef_write : begin
      end
      wbClockArea_wbStateMachine_enumDef_post_write : begin
      end
      default : begin
      end
    endcase
  end

  assign o_avl_wr_req = (cdc2avl_wr_req_payload && cdc2avl_wr_req_valid);
  always @(*) begin
    cdc2avl_wr_req_ready = 1'b0;
    case(avlClockArea_avlStateMachine_stateReg)
      avlClockArea_avlStateMachine_enumDef_init : begin
        if(!when_WbAvlCdc_l584) begin
          if(when_WbAvlCdc_l589) begin
            if(when_WbAvlCdc_l595) begin
              cdc2avl_wr_req_ready = 1'b1;
            end
          end
        end
      end
      avlClockArea_avlStateMachine_enumDef_ready : begin
        if(when_WbAvlCdc_l611) begin
          cdc2avl_wr_req_ready = 1'b1;
        end
      end
      avlClockArea_avlStateMachine_enumDef_read : begin
      end
      avlClockArea_avlStateMachine_enumDef_write : begin
        if(when_WbAvlCdc_l636) begin
          cdc2avl_wr_req_ready = 1'b1;
        end
      end
      default : begin
      end
    endcase
  end

  assign wb2cdc_wr_req_ready = avl_wr_req_io_push_ready;
  assign cdc2avl_wr_req_valid = avl_wr_req_io_pop_valid;
  assign cdc2avl_wr_req_payload = avl_wr_req_io_pop_payload;
  always @(*) begin
    wb2cdc_rdt_req_payload = 1'b0;
    case(wbClockArea_wbStateMachine_stateReg)
      wbClockArea_wbStateMachine_enumDef_init : begin
        if(when_WbAvlCdc_l273) begin
          wb2cdc_rdt_req_payload = 1'b0;
        end else begin
          if(when_WbAvlCdc_l280) begin
            wb2cdc_rdt_req_payload = 1'b0;
          end
        end
      end
      wbClockArea_wbStateMachine_enumDef_ready : begin
        if(when_WbAvlCdc_l306) begin
          if(!i_wb_we) begin
            if(when_WbAvlCdc_l360) begin
              if(when_WbAvlCdc_l363) begin
                wb2cdc_rdt_req_payload = 1'b1;
              end else begin
                if(when_WbAvlCdc_l370) begin
                  wb2cdc_rdt_req_payload = 1'b0;
                end
              end
            end
          end
        end
      end
      wbClockArea_wbStateMachine_enumDef_read : begin
      end
      wbClockArea_wbStateMachine_enumDef_post_read : begin
      end
      wbClockArea_wbStateMachine_enumDef_write : begin
      end
      wbClockArea_wbStateMachine_enumDef_post_write : begin
      end
      default : begin
      end
    endcase
  end

  always @(*) begin
    wb2cdc_rdt_req_valid = 1'b0;
    case(wbClockArea_wbStateMachine_stateReg)
      wbClockArea_wbStateMachine_enumDef_init : begin
        if(when_WbAvlCdc_l273) begin
          wb2cdc_rdt_req_valid = 1'b1;
        end else begin
          if(when_WbAvlCdc_l280) begin
            wb2cdc_rdt_req_valid = 1'b0;
          end
        end
      end
      wbClockArea_wbStateMachine_enumDef_ready : begin
        if(when_WbAvlCdc_l306) begin
          if(!i_wb_we) begin
            if(when_WbAvlCdc_l360) begin
              if(when_WbAvlCdc_l363) begin
                wb2cdc_rdt_req_valid = 1'b1;
              end else begin
                if(when_WbAvlCdc_l370) begin
                  wb2cdc_rdt_req_valid = 1'b1;
                end
              end
            end
          end
        end
      end
      wbClockArea_wbStateMachine_enumDef_read : begin
      end
      wbClockArea_wbStateMachine_enumDef_post_read : begin
      end
      wbClockArea_wbStateMachine_enumDef_write : begin
      end
      wbClockArea_wbStateMachine_enumDef_post_write : begin
      end
      default : begin
      end
    endcase
  end

  always @(*) begin
    cdc2avl_rdt_req_ready = 1'b0;
    case(avlClockArea_avlStateMachine_stateReg)
      avlClockArea_avlStateMachine_enumDef_init : begin
        if(!when_WbAvlCdc_l584) begin
          if(when_WbAvlCdc_l589) begin
            if(when_WbAvlCdc_l595) begin
              cdc2avl_rdt_req_ready = 1'b1;
            end
          end
        end
      end
      avlClockArea_avlStateMachine_enumDef_ready : begin
        if(!when_WbAvlCdc_l611) begin
          if(when_WbAvlCdc_l618) begin
            cdc2avl_rdt_req_ready = 1'b1;
          end
        end
      end
      avlClockArea_avlStateMachine_enumDef_read : begin
        if(avlClockArea_rdt_valid) begin
          cdc2avl_rdt_req_ready = 1'b1;
        end
      end
      avlClockArea_avlStateMachine_enumDef_write : begin
      end
      default : begin
      end
    endcase
  end

  assign o_avl_rdt_req = (cdc2avl_rdt_req_payload && cdc2avl_rdt_req_valid);
  assign wb2cdc_rdt_req_ready = avl_rdt_req_io_push_ready;
  assign cdc2avl_rdt_req_valid = avl_rdt_req_io_pop_valid;
  assign cdc2avl_rdt_req_payload = avl_rdt_req_io_pop_payload;
  always @(*) begin
    avl2cdc_rdt_payload = i_avl_rdt;
    case(avlClockArea_avlStateMachine_stateReg)
      avlClockArea_avlStateMachine_enumDef_init : begin
      end
      avlClockArea_avlStateMachine_enumDef_ready : begin
      end
      avlClockArea_avlStateMachine_enumDef_read : begin
        if(i_avl_rdt_valid) begin
          avl2cdc_rdt_payload = i_avl_rdt;
        end
      end
      avlClockArea_avlStateMachine_enumDef_write : begin
      end
      default : begin
      end
    endcase
  end

  always @(*) begin
    avl2cdc_rdt_valid = 1'b0;
    case(avlClockArea_avlStateMachine_stateReg)
      avlClockArea_avlStateMachine_enumDef_init : begin
      end
      avlClockArea_avlStateMachine_enumDef_ready : begin
      end
      avlClockArea_avlStateMachine_enumDef_read : begin
        if(i_avl_rdt_valid) begin
          avl2cdc_rdt_valid = 1'b1;
        end
      end
      avlClockArea_avlStateMachine_enumDef_write : begin
      end
      default : begin
      end
    endcase
  end

  always @(*) begin
    cdc2wb_rdt_ready = 1'b0;
    case(wbClockArea_wbStateMachine_stateReg)
      wbClockArea_wbStateMachine_enumDef_init : begin
      end
      wbClockArea_wbStateMachine_enumDef_ready : begin
      end
      wbClockArea_wbStateMachine_enumDef_read : begin
        if(when_WbAvlCdc_l391) begin
          cdc2wb_rdt_ready = 1'b1;
        end
      end
      wbClockArea_wbStateMachine_enumDef_post_read : begin
      end
      wbClockArea_wbStateMachine_enumDef_write : begin
      end
      wbClockArea_wbStateMachine_enumDef_post_write : begin
      end
      default : begin
      end
    endcase
  end

  always @(*) begin
    o_wb_rdt = cdc2wb_rdt_payload[31 : 0];
    case(wbClockArea_wbStateMachine_stateReg)
      wbClockArea_wbStateMachine_enumDef_init : begin
      end
      wbClockArea_wbStateMachine_enumDef_ready : begin
      end
      wbClockArea_wbStateMachine_enumDef_read : begin
        if(when_WbAvlCdc_l391) begin
          case(switch_WbAvlCdc_l402)
            1'b0 : begin
              o_wb_rdt = cdc2wb_rdt_payload[31 : 0];
            end
            default : begin
              o_wb_rdt = cdc2wb_rdt_payload[63 : 32];
            end
          endcase
        end
      end
      wbClockArea_wbStateMachine_enumDef_post_read : begin
      end
      wbClockArea_wbStateMachine_enumDef_write : begin
      end
      wbClockArea_wbStateMachine_enumDef_post_write : begin
      end
      default : begin
      end
    endcase
  end

  assign avl2cdc_rdt_ready = avl_rdt_io_push_ready;
  assign cdc2wb_rdt_valid = avl_rdt_io_pop_valid;
  assign cdc2wb_rdt_payload = avl_rdt_io_pop_payload;
  always @(*) begin
    avl2cdc_rdt_valid_payload = i_avl_rdt_valid;
    case(avlClockArea_avlStateMachine_stateReg)
      avlClockArea_avlStateMachine_enumDef_init : begin
        if(when_WbAvlCdc_l584) begin
          avl2cdc_rdt_valid_payload = 1'b0;
        end else begin
          if(when_WbAvlCdc_l589) begin
            avl2cdc_rdt_valid_payload = 1'b0;
          end
        end
      end
      avlClockArea_avlStateMachine_enumDef_ready : begin
      end
      avlClockArea_avlStateMachine_enumDef_read : begin
        if(i_avl_rdt_valid) begin
          avl2cdc_rdt_valid_payload = 1'b1;
        end
      end
      avlClockArea_avlStateMachine_enumDef_write : begin
      end
      default : begin
      end
    endcase
  end

  always @(*) begin
    avl2cdc_rdt_valid_valid = 1'b0;
    case(avlClockArea_avlStateMachine_stateReg)
      avlClockArea_avlStateMachine_enumDef_init : begin
        if(when_WbAvlCdc_l584) begin
          avl2cdc_rdt_valid_valid = 1'b1;
        end else begin
          if(when_WbAvlCdc_l589) begin
            avl2cdc_rdt_valid_valid = 1'b0;
          end
        end
      end
      avlClockArea_avlStateMachine_enumDef_ready : begin
      end
      avlClockArea_avlStateMachine_enumDef_read : begin
        if(i_avl_rdt_valid) begin
          avl2cdc_rdt_valid_valid = 1'b1;
        end
      end
      avlClockArea_avlStateMachine_enumDef_write : begin
      end
      default : begin
      end
    endcase
  end

  always @(*) begin
    cdc2wb_rdt_valid_ready = 1'b0;
    case(wbClockArea_wbStateMachine_stateReg)
      wbClockArea_wbStateMachine_enumDef_init : begin
        if(!when_WbAvlCdc_l273) begin
          if(when_WbAvlCdc_l280) begin
            if(when_WbAvlCdc_l287) begin
              cdc2wb_rdt_valid_ready = 1'b1;
            end
          end
        end
      end
      wbClockArea_wbStateMachine_enumDef_ready : begin
      end
      wbClockArea_wbStateMachine_enumDef_read : begin
        if(when_WbAvlCdc_l391) begin
          cdc2wb_rdt_valid_ready = 1'b1;
        end
      end
      wbClockArea_wbStateMachine_enumDef_post_read : begin
      end
      wbClockArea_wbStateMachine_enumDef_write : begin
      end
      wbClockArea_wbStateMachine_enumDef_post_write : begin
      end
      default : begin
      end
    endcase
  end

  assign avl2cdc_rdt_valid_ready = avl_rdt_valid_io_push_ready;
  assign cdc2wb_rdt_valid_valid = avl_rdt_valid_io_pop_valid;
  assign cdc2wb_rdt_valid_payload = avl_rdt_valid_io_pop_payload;
  always @(*) begin
    wb2cdc_size_payload = 3'b000;
    case(wbClockArea_wbStateMachine_stateReg)
      wbClockArea_wbStateMachine_enumDef_init : begin
      end
      wbClockArea_wbStateMachine_enumDef_ready : begin
        if(when_WbAvlCdc_l306) begin
          if(when_WbAvlCdc_l308) begin
            wb2cdc_size_payload = 3'b001;
          end else begin
            if(when_WbAvlCdc_l333) begin
              wb2cdc_size_payload = 3'b000;
            end
          end
        end
      end
      wbClockArea_wbStateMachine_enumDef_read : begin
      end
      wbClockArea_wbStateMachine_enumDef_post_read : begin
      end
      wbClockArea_wbStateMachine_enumDef_write : begin
      end
      wbClockArea_wbStateMachine_enumDef_post_write : begin
      end
      default : begin
      end
    endcase
  end

  always @(*) begin
    wb2cdc_size_valid = 1'b0;
    case(wbClockArea_wbStateMachine_stateReg)
      wbClockArea_wbStateMachine_enumDef_init : begin
      end
      wbClockArea_wbStateMachine_enumDef_ready : begin
        if(when_WbAvlCdc_l306) begin
          if(when_WbAvlCdc_l308) begin
            wb2cdc_size_valid = 1'b1;
          end else begin
            if(when_WbAvlCdc_l333) begin
              wb2cdc_size_valid = 1'b1;
            end
          end
        end
      end
      wbClockArea_wbStateMachine_enumDef_read : begin
      end
      wbClockArea_wbStateMachine_enumDef_post_read : begin
      end
      wbClockArea_wbStateMachine_enumDef_write : begin
      end
      wbClockArea_wbStateMachine_enumDef_post_write : begin
      end
      default : begin
      end
    endcase
  end

  always @(*) begin
    cdc2avl_size_ready = 1'b0;
    case(avlClockArea_avlStateMachine_stateReg)
      avlClockArea_avlStateMachine_enumDef_init : begin
      end
      avlClockArea_avlStateMachine_enumDef_ready : begin
        if(when_WbAvlCdc_l611) begin
          cdc2avl_size_ready = 1'b1;
        end else begin
          if(when_WbAvlCdc_l618) begin
            cdc2avl_size_ready = 1'b1;
          end
        end
      end
      avlClockArea_avlStateMachine_enumDef_read : begin
        if(avlClockArea_rdt_valid) begin
          cdc2avl_size_ready = 1'b1;
        end
      end
      avlClockArea_avlStateMachine_enumDef_write : begin
        if(when_WbAvlCdc_l636) begin
          cdc2avl_size_ready = 1'b1;
        end
      end
      default : begin
      end
    endcase
  end

  assign o_avl_size = cdc2avl_size_payload;
  assign wb2cdc_size_ready = avl_size_io_push_ready;
  assign cdc2avl_size_valid = avl_size_io_pop_valid;
  assign cdc2avl_size_payload = avl_size_io_pop_payload;
  always @(*) begin
    o_wb_ack = 1'b0;
    case(wbClockArea_wbStateMachine_stateReg)
      wbClockArea_wbStateMachine_enumDef_init : begin
      end
      wbClockArea_wbStateMachine_enumDef_ready : begin
      end
      wbClockArea_wbStateMachine_enumDef_read : begin
        if(when_WbAvlCdc_l391) begin
          o_wb_ack = 1'b1;
        end
      end
      wbClockArea_wbStateMachine_enumDef_post_read : begin
      end
      wbClockArea_wbStateMachine_enumDef_write : begin
        if(when_WbAvlCdc_l422) begin
          o_wb_ack = 1'b1;
        end
      end
      wbClockArea_wbStateMachine_enumDef_post_write : begin
      end
      default : begin
      end
    endcase
  end

  assign wbClockArea_avl_ready = i_avl_ready_buffercc_io_dataOut;
  assign wbClockArea_cyc_stb = (i_wb_cyc && i_wb_stb);
  assign wbClockArea_wbStateMachine_wantExit = 1'b0;
  always @(*) begin
    wbClockArea_wbStateMachine_wantStart = 1'b0;
    case(wbClockArea_wbStateMachine_stateReg)
      wbClockArea_wbStateMachine_enumDef_init : begin
      end
      wbClockArea_wbStateMachine_enumDef_ready : begin
      end
      wbClockArea_wbStateMachine_enumDef_read : begin
      end
      wbClockArea_wbStateMachine_enumDef_post_read : begin
      end
      wbClockArea_wbStateMachine_enumDef_write : begin
      end
      wbClockArea_wbStateMachine_enumDef_post_write : begin
      end
      default : begin
        wbClockArea_wbStateMachine_wantStart = 1'b1;
      end
    endcase
  end

  assign wbClockArea_wbStateMachine_wantKill = 1'b0;
  assign avlClockArea_avlStateMachine_wantExit = 1'b0;
  always @(*) begin
    avlClockArea_avlStateMachine_wantStart = 1'b0;
    case(avlClockArea_avlStateMachine_stateReg)
      avlClockArea_avlStateMachine_enumDef_init : begin
      end
      avlClockArea_avlStateMachine_enumDef_ready : begin
      end
      avlClockArea_avlStateMachine_enumDef_read : begin
      end
      avlClockArea_avlStateMachine_enumDef_write : begin
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
      wbClockArea_wbStateMachine_enumDef_init : begin
        if(!when_WbAvlCdc_l273) begin
          if(when_WbAvlCdc_l280) begin
            if(when_WbAvlCdc_l287) begin
              wbClockArea_wbStateMachine_stateNext = wbClockArea_wbStateMachine_enumDef_ready;
            end
          end
        end
      end
      wbClockArea_wbStateMachine_enumDef_ready : begin
        if(when_WbAvlCdc_l306) begin
          if(i_wb_we) begin
            if(!when_WbAvlCdc_l346) begin
              if(when_WbAvlCdc_l351) begin
                wbClockArea_wbStateMachine_stateNext = wbClockArea_wbStateMachine_enumDef_write;
              end
            end
          end else begin
            if(when_WbAvlCdc_l360) begin
              if(!when_WbAvlCdc_l363) begin
                if(when_WbAvlCdc_l370) begin
                  wbClockArea_wbStateMachine_stateNext = wbClockArea_wbStateMachine_enumDef_read;
                end
              end
            end
          end
        end
      end
      wbClockArea_wbStateMachine_enumDef_read : begin
        if(when_WbAvlCdc_l391) begin
          wbClockArea_wbStateMachine_stateNext = wbClockArea_wbStateMachine_enumDef_ready;
        end
      end
      wbClockArea_wbStateMachine_enumDef_post_read : begin
      end
      wbClockArea_wbStateMachine_enumDef_write : begin
        if(when_WbAvlCdc_l422) begin
          wbClockArea_wbStateMachine_stateNext = wbClockArea_wbStateMachine_enumDef_ready;
        end
      end
      wbClockArea_wbStateMachine_enumDef_post_write : begin
      end
      default : begin
      end
    endcase
    if(wbClockArea_wbStateMachine_wantStart) begin
      wbClockArea_wbStateMachine_stateNext = wbClockArea_wbStateMachine_enumDef_init;
    end
    if(wbClockArea_wbStateMachine_wantKill) begin
      wbClockArea_wbStateMachine_stateNext = wbClockArea_wbStateMachine_enumDef_BOOT;
    end
  end

  assign when_WbAvlCdc_l273 = (wbClockArea_cycle == 1'b0);
  assign when_WbAvlCdc_l287 = (avl_rdt_valid_io_popOccupancy == 2'b01);
  assign when_WbAvlCdc_l280 = (wbClockArea_cycle == 1'b1);
  assign when_WbAvlCdc_l306 = (wbClockArea_cyc_stb && wbClockArea_avl_ready);
  assign when_WbAvlCdc_l308 = (wbClockArea_cycle == 1'b0);
  assign switch_WbAvlCdc_l313 = i_wb_adr[2];
  assign when_WbAvlCdc_l333 = (wbClockArea_cycle == 1'b1);
  assign when_WbAvlCdc_l346 = (wbClockArea_cycle == 1'b0);
  assign when_WbAvlCdc_l351 = (wbClockArea_cycle == 1'b1);
  assign when_WbAvlCdc_l363 = (wbClockArea_cycle == 1'b0);
  assign when_WbAvlCdc_l370 = (wbClockArea_cycle == 1'b1);
  assign when_WbAvlCdc_l360 = (! i_wb_we);
  assign when_WbAvlCdc_l391 = (cdc2wb_rdt_valid_payload && cdc2wb_rdt_valid_valid);
  assign switch_WbAvlCdc_l402 = i_wb_adr[2];
  assign when_WbAvlCdc_l422 = (avl_wr_req_io_pushOccupancy == 2'b00);
  assign when_StateMachine_l222 = ((wbClockArea_wbStateMachine_stateReg == wbClockArea_wbStateMachine_enumDef_init) && (! (wbClockArea_wbStateMachine_stateNext == wbClockArea_wbStateMachine_enumDef_init)));
  assign when_StateMachine_l222_1 = ((wbClockArea_wbStateMachine_stateReg == wbClockArea_wbStateMachine_enumDef_ready) && (! (wbClockArea_wbStateMachine_stateNext == wbClockArea_wbStateMachine_enumDef_ready)));
  always @(*) begin
    avlClockArea_avlStateMachine_stateNext = avlClockArea_avlStateMachine_stateReg;
    case(avlClockArea_avlStateMachine_stateReg)
      avlClockArea_avlStateMachine_enumDef_init : begin
        if(!when_WbAvlCdc_l584) begin
          if(when_WbAvlCdc_l589) begin
            if(when_WbAvlCdc_l595) begin
              avlClockArea_avlStateMachine_stateNext = avlClockArea_avlStateMachine_enumDef_ready;
            end
          end
        end
      end
      avlClockArea_avlStateMachine_enumDef_ready : begin
        if(when_WbAvlCdc_l611) begin
          avlClockArea_avlStateMachine_stateNext = avlClockArea_avlStateMachine_enumDef_write;
        end else begin
          if(when_WbAvlCdc_l618) begin
            avlClockArea_avlStateMachine_stateNext = avlClockArea_avlStateMachine_enumDef_read;
          end
        end
      end
      avlClockArea_avlStateMachine_enumDef_read : begin
        if(avlClockArea_rdt_valid) begin
          avlClockArea_avlStateMachine_stateNext = avlClockArea_avlStateMachine_enumDef_ready;
        end
      end
      avlClockArea_avlStateMachine_enumDef_write : begin
        if(when_WbAvlCdc_l636) begin
          avlClockArea_avlStateMachine_stateNext = avlClockArea_avlStateMachine_enumDef_ready;
        end
      end
      default : begin
      end
    endcase
    if(avlClockArea_avlStateMachine_wantStart) begin
      avlClockArea_avlStateMachine_stateNext = avlClockArea_avlStateMachine_enumDef_init;
    end
    if(avlClockArea_avlStateMachine_wantKill) begin
      avlClockArea_avlStateMachine_stateNext = avlClockArea_avlStateMachine_enumDef_BOOT;
    end
  end

  assign when_WbAvlCdc_l584 = (avlClockArea_cycle == 1'b0);
  assign when_WbAvlCdc_l595 = (avl_rdt_req_io_popOccupancy == 2'b01);
  assign when_WbAvlCdc_l589 = (avlClockArea_cycle == 1'b1);
  assign when_WbAvlCdc_l611 = (cdc2avl_wr_req_valid && cdc2avl_wr_req_payload);
  assign when_WbAvlCdc_l618 = (cdc2avl_rdt_req_valid && cdc2avl_rdt_req_payload);
  assign when_WbAvlCdc_l636 = (cdc2avl_wr_req_valid && (! cdc2avl_wr_req_payload));
  assign when_StateMachine_l222_2 = ((avlClockArea_avlStateMachine_stateReg == avlClockArea_avlStateMachine_enumDef_init) && (! (avlClockArea_avlStateMachine_stateNext == avlClockArea_avlStateMachine_enumDef_init)));
  assign when_StateMachine_l222_3 = ((avlClockArea_avlStateMachine_stateReg == avlClockArea_avlStateMachine_enumDef_read) && (! (avlClockArea_avlStateMachine_stateNext == avlClockArea_avlStateMachine_enumDef_read)));
  always @(posedge i_wb_clock or posedge i_wb_reset) begin
    if(i_wb_reset) begin
      wbClockArea_cycle <= 1'b0;
      wbClockArea_wbStateMachine_stateReg <= wbClockArea_wbStateMachine_enumDef_BOOT;
    end else begin
      wbClockArea_wbStateMachine_stateReg <= wbClockArea_wbStateMachine_stateNext;
      case(wbClockArea_wbStateMachine_stateReg)
        wbClockArea_wbStateMachine_enumDef_init : begin
          if(when_WbAvlCdc_l273) begin
            wbClockArea_cycle <= 1'b1;
          end
        end
        wbClockArea_wbStateMachine_enumDef_ready : begin
          if(when_WbAvlCdc_l306) begin
            if(when_WbAvlCdc_l308) begin
              wbClockArea_cycle <= 1'b1;
            end
          end
        end
        wbClockArea_wbStateMachine_enumDef_read : begin
        end
        wbClockArea_wbStateMachine_enumDef_post_read : begin
        end
        wbClockArea_wbStateMachine_enumDef_write : begin
        end
        wbClockArea_wbStateMachine_enumDef_post_write : begin
        end
        default : begin
        end
      endcase
      if(when_StateMachine_l222) begin
        wbClockArea_cycle <= 1'b0;
      end
      if(when_StateMachine_l222_1) begin
        wbClockArea_cycle <= 1'b0;
      end
    end
  end

  always @(posedge i_avl_clock or posedge i_avl_reset) begin
    if(i_avl_reset) begin
      avlClockArea_cycle <= 1'b0;
      avlClockArea_rdt_valid <= 1'b0;
      avlClockArea_rdt_req <= 1'b0;
      avlClockArea_avlStateMachine_stateReg <= avlClockArea_avlStateMachine_enumDef_BOOT;
    end else begin
      avlClockArea_avlStateMachine_stateReg <= avlClockArea_avlStateMachine_stateNext;
      case(avlClockArea_avlStateMachine_stateReg)
        avlClockArea_avlStateMachine_enumDef_init : begin
          if(when_WbAvlCdc_l584) begin
            avlClockArea_cycle <= 1'b1;
          end
        end
        avlClockArea_avlStateMachine_enumDef_ready : begin
        end
        avlClockArea_avlStateMachine_enumDef_read : begin
          if(i_avl_rdt_valid) begin
            avlClockArea_rdt_valid <= 1'b1;
          end
        end
        avlClockArea_avlStateMachine_enumDef_write : begin
        end
        default : begin
        end
      endcase
      if(when_StateMachine_l222_2) begin
        avlClockArea_cycle <= 1'b0;
      end
      if(when_StateMachine_l222_3) begin
        avlClockArea_rdt_valid <= 1'b0;
        avlClockArea_rdt_req <= 1'b0;
        avlClockArea_cycle <= 1'b0;
      end
    end
  end


endmodule

module WbAvlCdc_BufferCC_20 (
  input               io_dataIn,
  output              io_dataOut,
  input               i_wb_clock,
  input               i_wb_reset
);

  (* async_reg = "true" *) reg                 buffers_0;
  (* async_reg = "true" *) reg                 buffers_1;

  assign io_dataOut = buffers_1;
  always @(posedge i_wb_clock) begin
    buffers_0 <= io_dataIn;
    buffers_1 <= buffers_0;
  end


endmodule

module WbAvlCdc_StreamFifoCC_8 (
  input               io_push_valid,
  output              io_push_ready,
  input      [2:0]    io_push_payload,
  output              io_pop_valid,
  input               io_pop_ready,
  output     [2:0]    io_pop_payload,
  output     [1:0]    io_pushOccupancy,
  output     [1:0]    io_popOccupancy,
  input               i_wb_clock,
  input               i_wb_reset,
  input               i_avl_clock,
  input               toplevel_i_wb_reset_syncronized
);

  reg        [2:0]    _zz_ram_port1;
  wire       [1:0]    popToPushGray_buffercc_io_dataOut;
  wire       [1:0]    pushToPopGray_buffercc_io_dataOut;
  wire       [1:0]    _zz_pushCC_pushPtrGray;
  wire       [0:0]    _zz_ram_port;
  wire       [2:0]    _zz_ram_port_1;
  wire       [1:0]    _zz_popCC_popPtrGray;
  wire       [0:0]    _zz_ram_port_2;
  wire                _zz_ram_port_3;
  wire       [0:0]    _zz_io_pop_payload_1;
  wire                _zz_io_pop_payload_2;
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
  reg        [1:0]    popCC_popPtr;
  wire       [1:0]    popCC_popPtrPlus;
  wire                io_pop_fire;
  reg        [1:0]    popCC_popPtrGray;
  wire       [1:0]    popCC_pushPtrGray;
  wire                popCC_empty;
  wire                io_pop_fire_1;
  wire       [1:0]    _zz_io_pop_payload;
  wire                io_pop_fire_2;
  wire                _zz_io_popOccupancy;
  reg [2:0] ram [0:1];

  assign _zz_pushCC_pushPtrGray = (pushCC_pushPtrPlus >>> 1'b1);
  assign _zz_ram_port = pushCC_pushPtr[0:0];
  assign _zz_popCC_popPtrGray = (popCC_popPtrPlus >>> 1'b1);
  assign _zz_io_pop_payload_1 = _zz_io_pop_payload[0:0];
  assign _zz_ram_port_1 = io_push_payload;
  assign _zz_io_pop_payload_2 = 1'b1;
  always @(posedge i_wb_clock) begin
    if(_zz_1) begin
      ram[_zz_ram_port] <= _zz_ram_port_1;
    end
  end

  always @(posedge i_avl_clock) begin
    if(_zz_io_pop_payload_2) begin
      _zz_ram_port1 <= ram[_zz_io_pop_payload_1];
    end
  end

  WbAvlCdc_BufferCC popToPushGray_buffercc (
    .io_dataIn     (popToPushGray[1:0]                      ), //i
    .io_dataOut    (popToPushGray_buffercc_io_dataOut[1:0]  ), //o
    .i_wb_clock    (i_wb_clock                              ), //i
    .i_wb_reset    (i_wb_reset                              )  //i
  );
  WbAvlCdc_BufferCC_2 pushToPopGray_buffercc (
    .io_dataIn                          (pushToPopGray[1:0]                      ), //i
    .io_dataOut                         (pushToPopGray_buffercc_io_dataOut[1:0]  ), //o
    .i_avl_clock                        (i_avl_clock                             ), //i
    .toplevel_i_wb_reset_syncronized    (toplevel_i_wb_reset_syncronized         )  //i
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
  assign popCC_popPtrPlus = (popCC_popPtr + 2'b01);
  assign io_pop_fire = (io_pop_valid && io_pop_ready);
  assign popCC_pushPtrGray = pushToPopGray_buffercc_io_dataOut;
  assign popCC_empty = (popCC_popPtrGray == popCC_pushPtrGray);
  assign io_pop_valid = (! popCC_empty);
  assign io_pop_fire_1 = (io_pop_valid && io_pop_ready);
  assign _zz_io_pop_payload = (io_pop_fire_1 ? popCC_popPtrPlus : popCC_popPtr);
  assign io_pop_payload = _zz_ram_port1;
  assign io_pop_fire_2 = (io_pop_valid && io_pop_ready);
  assign _zz_io_popOccupancy = popCC_pushPtrGray[1];
  assign io_popOccupancy = ({_zz_io_popOccupancy,(popCC_pushPtrGray[0] ^ _zz_io_popOccupancy)} - popCC_popPtr);
  assign pushToPopGray = pushCC_pushPtrGray;
  assign popToPushGray = popCC_popPtrGray;
  always @(posedge i_wb_clock or posedge i_wb_reset) begin
    if(i_wb_reset) begin
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

  always @(posedge i_avl_clock or posedge toplevel_i_wb_reset_syncronized) begin
    if(toplevel_i_wb_reset_syncronized) begin
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

module WbAvlCdc_StreamFifoCC_7 (
  input               io_push_valid,
  output              io_push_ready,
  input               io_push_payload,
  output              io_pop_valid,
  input               io_pop_ready,
  output              io_pop_payload,
  output     [1:0]    io_pushOccupancy,
  output     [1:0]    io_popOccupancy,
  input               i_avl_clock,
  input               i_avl_reset,
  input               i_wb_clock,
  input               toplevel_i_avl_reset_syncronized
);

  reg        [0:0]    _zz_ram_port1;
  wire       [1:0]    popToPushGray_buffercc_io_dataOut;
  wire       [1:0]    pushToPopGray_buffercc_io_dataOut;
  wire       [1:0]    _zz_pushCC_pushPtrGray;
  wire       [0:0]    _zz_ram_port;
  wire       [0:0]    _zz_ram_port_1;
  wire       [1:0]    _zz_popCC_popPtrGray;
  wire       [0:0]    _zz_ram_port_2;
  wire                _zz_ram_port_3;
  wire       [0:0]    _zz_io_pop_payload_1;
  wire                _zz_io_pop_payload_2;
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
  reg        [1:0]    popCC_popPtr;
  wire       [1:0]    popCC_popPtrPlus;
  wire                io_pop_fire;
  reg        [1:0]    popCC_popPtrGray;
  wire       [1:0]    popCC_pushPtrGray;
  wire                popCC_empty;
  wire                io_pop_fire_1;
  wire       [1:0]    _zz_io_pop_payload;
  wire                io_pop_fire_2;
  wire                _zz_io_popOccupancy;
  reg [0:0] ram [0:1];

  assign _zz_pushCC_pushPtrGray = (pushCC_pushPtrPlus >>> 1'b1);
  assign _zz_ram_port = pushCC_pushPtr[0:0];
  assign _zz_popCC_popPtrGray = (popCC_popPtrPlus >>> 1'b1);
  assign _zz_io_pop_payload_1 = _zz_io_pop_payload[0:0];
  assign _zz_ram_port_1 = io_push_payload;
  assign _zz_io_pop_payload_2 = 1'b1;
  always @(posedge i_avl_clock) begin
    if(_zz_1) begin
      ram[_zz_ram_port] <= _zz_ram_port_1;
    end
  end

  always @(posedge i_wb_clock) begin
    if(_zz_io_pop_payload_2) begin
      _zz_ram_port1 <= ram[_zz_io_pop_payload_1];
    end
  end

  WbAvlCdc_BufferCC_13 popToPushGray_buffercc (
    .io_dataIn      (popToPushGray[1:0]                      ), //i
    .io_dataOut     (popToPushGray_buffercc_io_dataOut[1:0]  ), //o
    .i_avl_clock    (i_avl_clock                             ), //i
    .i_avl_reset    (i_avl_reset                             )  //i
  );
  WbAvlCdc_BufferCC_15 pushToPopGray_buffercc (
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
  assign popCC_popPtrPlus = (popCC_popPtr + 2'b01);
  assign io_pop_fire = (io_pop_valid && io_pop_ready);
  assign popCC_pushPtrGray = pushToPopGray_buffercc_io_dataOut;
  assign popCC_empty = (popCC_popPtrGray == popCC_pushPtrGray);
  assign io_pop_valid = (! popCC_empty);
  assign io_pop_fire_1 = (io_pop_valid && io_pop_ready);
  assign _zz_io_pop_payload = (io_pop_fire_1 ? popCC_popPtrPlus : popCC_popPtr);
  assign io_pop_payload = _zz_ram_port1[0];
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

module WbAvlCdc_StreamFifoCC_6 (
  input               io_push_valid,
  output              io_push_ready,
  input      [63:0]   io_push_payload,
  output              io_pop_valid,
  input               io_pop_ready,
  output     [63:0]   io_pop_payload,
  output     [1:0]    io_pushOccupancy,
  output     [1:0]    io_popOccupancy,
  input               i_avl_clock,
  input               i_avl_reset,
  input               i_wb_clock,
  output              toplevel_i_avl_reset_syncronized_1
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
  wire       [0:0]    _zz_io_pop_payload_1;
  wire                _zz_io_pop_payload_2;
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
  wire       [1:0]    _zz_io_pop_payload;
  wire                io_pop_fire_2;
  wire                _zz_io_popOccupancy;
  reg [63:0] ram [0:1];

  assign _zz_pushCC_pushPtrGray = (pushCC_pushPtrPlus >>> 1'b1);
  assign _zz_ram_port = pushCC_pushPtr[0:0];
  assign _zz_popCC_popPtrGray = (popCC_popPtrPlus >>> 1'b1);
  assign _zz_io_pop_payload_1 = _zz_io_pop_payload[0:0];
  assign _zz_io_pop_payload_2 = 1'b1;
  always @(posedge i_avl_clock) begin
    if(_zz_1) begin
      ram[_zz_ram_port] <= io_push_payload;
    end
  end

  always @(posedge i_wb_clock) begin
    if(_zz_io_pop_payload_2) begin
      _zz_ram_port1 <= ram[_zz_io_pop_payload_1];
    end
  end

  WbAvlCdc_BufferCC_13 popToPushGray_buffercc (
    .io_dataIn      (popToPushGray[1:0]                      ), //i
    .io_dataOut     (popToPushGray_buffercc_io_dataOut[1:0]  ), //o
    .i_avl_clock    (i_avl_clock                             ), //i
    .i_avl_reset    (i_avl_reset                             )  //i
  );
  WbAvlCdc_BufferCC_14 bufferCC (
    .io_dataIn      (1'b0                 ), //i
    .io_dataOut     (bufferCC_io_dataOut  ), //o
    .i_wb_clock     (i_wb_clock           ), //i
    .i_avl_reset    (i_avl_reset          )  //i
  );
  WbAvlCdc_BufferCC_15 pushToPopGray_buffercc (
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
  assign _zz_io_pop_payload = (io_pop_fire_1 ? popCC_popPtrPlus : popCC_popPtr);
  assign io_pop_payload = _zz_ram_port1;
  assign io_pop_fire_2 = (io_pop_valid && io_pop_ready);
  assign _zz_io_popOccupancy = popCC_pushPtrGray[1];
  assign io_popOccupancy = ({_zz_io_popOccupancy,(popCC_pushPtrGray[0] ^ _zz_io_popOccupancy)} - popCC_popPtr);
  assign pushToPopGray = pushCC_pushPtrGray;
  assign popToPushGray = popCC_popPtrGray;
  assign toplevel_i_avl_reset_syncronized_1 = toplevel_i_avl_reset_syncronized;
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

//WbAvlCdc_StreamFifoCC_4 replaced by WbAvlCdc_StreamFifoCC_4

module WbAvlCdc_StreamFifoCC_4 (
  input               io_push_valid,
  output              io_push_ready,
  input               io_push_payload,
  output              io_pop_valid,
  input               io_pop_ready,
  output              io_pop_payload,
  output     [1:0]    io_pushOccupancy,
  output     [1:0]    io_popOccupancy,
  input               i_wb_clock,
  input               i_wb_reset,
  input               i_avl_clock,
  input               toplevel_i_wb_reset_syncronized
);

  reg        [0:0]    _zz_ram_port1;
  wire       [1:0]    popToPushGray_buffercc_io_dataOut;
  wire       [1:0]    pushToPopGray_buffercc_io_dataOut;
  wire       [1:0]    _zz_pushCC_pushPtrGray;
  wire       [0:0]    _zz_ram_port;
  wire       [0:0]    _zz_ram_port_1;
  wire       [1:0]    _zz_popCC_popPtrGray;
  wire       [0:0]    _zz_ram_port_2;
  wire                _zz_ram_port_3;
  wire       [0:0]    _zz_io_pop_payload_1;
  wire                _zz_io_pop_payload_2;
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
  reg        [1:0]    popCC_popPtr;
  wire       [1:0]    popCC_popPtrPlus;
  wire                io_pop_fire;
  reg        [1:0]    popCC_popPtrGray;
  wire       [1:0]    popCC_pushPtrGray;
  wire                popCC_empty;
  wire                io_pop_fire_1;
  wire       [1:0]    _zz_io_pop_payload;
  wire                io_pop_fire_2;
  wire                _zz_io_popOccupancy;
  reg [0:0] ram [0:1];

  assign _zz_pushCC_pushPtrGray = (pushCC_pushPtrPlus >>> 1'b1);
  assign _zz_ram_port = pushCC_pushPtr[0:0];
  assign _zz_popCC_popPtrGray = (popCC_popPtrPlus >>> 1'b1);
  assign _zz_io_pop_payload_1 = _zz_io_pop_payload[0:0];
  assign _zz_ram_port_1 = io_push_payload;
  assign _zz_io_pop_payload_2 = 1'b1;
  always @(posedge i_wb_clock) begin
    if(_zz_1) begin
      ram[_zz_ram_port] <= _zz_ram_port_1;
    end
  end

  always @(posedge i_avl_clock) begin
    if(_zz_io_pop_payload_2) begin
      _zz_ram_port1 <= ram[_zz_io_pop_payload_1];
    end
  end

  WbAvlCdc_BufferCC popToPushGray_buffercc (
    .io_dataIn     (popToPushGray[1:0]                      ), //i
    .io_dataOut    (popToPushGray_buffercc_io_dataOut[1:0]  ), //o
    .i_wb_clock    (i_wb_clock                              ), //i
    .i_wb_reset    (i_wb_reset                              )  //i
  );
  WbAvlCdc_BufferCC_2 pushToPopGray_buffercc (
    .io_dataIn                          (pushToPopGray[1:0]                      ), //i
    .io_dataOut                         (pushToPopGray_buffercc_io_dataOut[1:0]  ), //o
    .i_avl_clock                        (i_avl_clock                             ), //i
    .toplevel_i_wb_reset_syncronized    (toplevel_i_wb_reset_syncronized         )  //i
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
  assign popCC_popPtrPlus = (popCC_popPtr + 2'b01);
  assign io_pop_fire = (io_pop_valid && io_pop_ready);
  assign popCC_pushPtrGray = pushToPopGray_buffercc_io_dataOut;
  assign popCC_empty = (popCC_popPtrGray == popCC_pushPtrGray);
  assign io_pop_valid = (! popCC_empty);
  assign io_pop_fire_1 = (io_pop_valid && io_pop_ready);
  assign _zz_io_pop_payload = (io_pop_fire_1 ? popCC_popPtrPlus : popCC_popPtr);
  assign io_pop_payload = _zz_ram_port1[0];
  assign io_pop_fire_2 = (io_pop_valid && io_pop_ready);
  assign _zz_io_popOccupancy = popCC_pushPtrGray[1];
  assign io_popOccupancy = ({_zz_io_popOccupancy,(popCC_pushPtrGray[0] ^ _zz_io_popOccupancy)} - popCC_popPtr);
  assign pushToPopGray = pushCC_pushPtrGray;
  assign popToPushGray = popCC_popPtrGray;
  always @(posedge i_wb_clock or posedge i_wb_reset) begin
    if(i_wb_reset) begin
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

  always @(posedge i_avl_clock or posedge toplevel_i_wb_reset_syncronized) begin
    if(toplevel_i_wb_reset_syncronized) begin
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

module WbAvlCdc_StreamFifoCC_3 (
  input               io_push_valid,
  output              io_push_ready,
  input      [63:0]   io_push_payload,
  output              io_pop_valid,
  input               io_pop_ready,
  output     [63:0]   io_pop_payload,
  output     [1:0]    io_pushOccupancy,
  output     [1:0]    io_popOccupancy,
  input               i_wb_clock,
  input               i_wb_reset,
  input               i_avl_clock,
  input               toplevel_i_wb_reset_syncronized
);

  reg        [63:0]   _zz_ram_port1;
  wire       [1:0]    popToPushGray_buffercc_io_dataOut;
  wire       [1:0]    pushToPopGray_buffercc_io_dataOut;
  wire       [1:0]    _zz_pushCC_pushPtrGray;
  wire       [0:0]    _zz_ram_port;
  wire       [1:0]    _zz_popCC_popPtrGray;
  wire       [0:0]    _zz_ram_port_1;
  wire                _zz_ram_port_2;
  wire       [0:0]    _zz_io_pop_payload_1;
  wire                _zz_io_pop_payload_2;
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
  reg        [1:0]    popCC_popPtr;
  wire       [1:0]    popCC_popPtrPlus;
  wire                io_pop_fire;
  reg        [1:0]    popCC_popPtrGray;
  wire       [1:0]    popCC_pushPtrGray;
  wire                popCC_empty;
  wire                io_pop_fire_1;
  wire       [1:0]    _zz_io_pop_payload;
  wire                io_pop_fire_2;
  wire                _zz_io_popOccupancy;
  reg [63:0] ram [0:1];

  assign _zz_pushCC_pushPtrGray = (pushCC_pushPtrPlus >>> 1'b1);
  assign _zz_ram_port = pushCC_pushPtr[0:0];
  assign _zz_popCC_popPtrGray = (popCC_popPtrPlus >>> 1'b1);
  assign _zz_io_pop_payload_1 = _zz_io_pop_payload[0:0];
  assign _zz_io_pop_payload_2 = 1'b1;
  always @(posedge i_wb_clock) begin
    if(_zz_1) begin
      ram[_zz_ram_port] <= io_push_payload;
    end
  end

  always @(posedge i_avl_clock) begin
    if(_zz_io_pop_payload_2) begin
      _zz_ram_port1 <= ram[_zz_io_pop_payload_1];
    end
  end

  WbAvlCdc_BufferCC popToPushGray_buffercc (
    .io_dataIn     (popToPushGray[1:0]                      ), //i
    .io_dataOut    (popToPushGray_buffercc_io_dataOut[1:0]  ), //o
    .i_wb_clock    (i_wb_clock                              ), //i
    .i_wb_reset    (i_wb_reset                              )  //i
  );
  WbAvlCdc_BufferCC_2 pushToPopGray_buffercc (
    .io_dataIn                          (pushToPopGray[1:0]                      ), //i
    .io_dataOut                         (pushToPopGray_buffercc_io_dataOut[1:0]  ), //o
    .i_avl_clock                        (i_avl_clock                             ), //i
    .toplevel_i_wb_reset_syncronized    (toplevel_i_wb_reset_syncronized         )  //i
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
  assign popCC_popPtrPlus = (popCC_popPtr + 2'b01);
  assign io_pop_fire = (io_pop_valid && io_pop_ready);
  assign popCC_pushPtrGray = pushToPopGray_buffercc_io_dataOut;
  assign popCC_empty = (popCC_popPtrGray == popCC_pushPtrGray);
  assign io_pop_valid = (! popCC_empty);
  assign io_pop_fire_1 = (io_pop_valid && io_pop_ready);
  assign _zz_io_pop_payload = (io_pop_fire_1 ? popCC_popPtrPlus : popCC_popPtr);
  assign io_pop_payload = _zz_ram_port1;
  assign io_pop_fire_2 = (io_pop_valid && io_pop_ready);
  assign _zz_io_popOccupancy = popCC_pushPtrGray[1];
  assign io_popOccupancy = ({_zz_io_popOccupancy,(popCC_pushPtrGray[0] ^ _zz_io_popOccupancy)} - popCC_popPtr);
  assign pushToPopGray = pushCC_pushPtrGray;
  assign popToPushGray = popCC_popPtrGray;
  always @(posedge i_wb_clock or posedge i_wb_reset) begin
    if(i_wb_reset) begin
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

  always @(posedge i_avl_clock or posedge toplevel_i_wb_reset_syncronized) begin
    if(toplevel_i_wb_reset_syncronized) begin
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

module WbAvlCdc_StreamFifoCC_2 (
  input               io_push_valid,
  output              io_push_ready,
  input      [25:0]   io_push_payload,
  output              io_pop_valid,
  input               io_pop_ready,
  output     [25:0]   io_pop_payload,
  output     [1:0]    io_pushOccupancy,
  output     [1:0]    io_popOccupancy,
  input               i_wb_clock,
  input               i_wb_reset,
  input               i_avl_clock,
  input               toplevel_i_wb_reset_syncronized
);

  reg        [25:0]   _zz_ram_port1;
  wire       [1:0]    popToPushGray_buffercc_io_dataOut;
  wire       [1:0]    pushToPopGray_buffercc_io_dataOut;
  wire       [1:0]    _zz_pushCC_pushPtrGray;
  wire       [0:0]    _zz_ram_port;
  wire       [25:0]   _zz_ram_port_1;
  wire       [1:0]    _zz_popCC_popPtrGray;
  wire       [0:0]    _zz_ram_port_2;
  wire                _zz_ram_port_3;
  wire       [0:0]    _zz_io_pop_payload_1;
  wire                _zz_io_pop_payload_2;
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
  reg        [1:0]    popCC_popPtr;
  wire       [1:0]    popCC_popPtrPlus;
  wire                io_pop_fire;
  reg        [1:0]    popCC_popPtrGray;
  wire       [1:0]    popCC_pushPtrGray;
  wire                popCC_empty;
  wire                io_pop_fire_1;
  wire       [1:0]    _zz_io_pop_payload;
  wire                io_pop_fire_2;
  wire                _zz_io_popOccupancy;
  reg [25:0] ram [0:1];

  assign _zz_pushCC_pushPtrGray = (pushCC_pushPtrPlus >>> 1'b1);
  assign _zz_ram_port = pushCC_pushPtr[0:0];
  assign _zz_popCC_popPtrGray = (popCC_popPtrPlus >>> 1'b1);
  assign _zz_io_pop_payload_1 = _zz_io_pop_payload[0:0];
  assign _zz_ram_port_1 = io_push_payload;
  assign _zz_io_pop_payload_2 = 1'b1;
  always @(posedge i_wb_clock) begin
    if(_zz_1) begin
      ram[_zz_ram_port] <= _zz_ram_port_1;
    end
  end

  always @(posedge i_avl_clock) begin
    if(_zz_io_pop_payload_2) begin
      _zz_ram_port1 <= ram[_zz_io_pop_payload_1];
    end
  end

  WbAvlCdc_BufferCC popToPushGray_buffercc (
    .io_dataIn     (popToPushGray[1:0]                      ), //i
    .io_dataOut    (popToPushGray_buffercc_io_dataOut[1:0]  ), //o
    .i_wb_clock    (i_wb_clock                              ), //i
    .i_wb_reset    (i_wb_reset                              )  //i
  );
  WbAvlCdc_BufferCC_2 pushToPopGray_buffercc (
    .io_dataIn                          (pushToPopGray[1:0]                      ), //i
    .io_dataOut                         (pushToPopGray_buffercc_io_dataOut[1:0]  ), //o
    .i_avl_clock                        (i_avl_clock                             ), //i
    .toplevel_i_wb_reset_syncronized    (toplevel_i_wb_reset_syncronized         )  //i
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
  assign popCC_popPtrPlus = (popCC_popPtr + 2'b01);
  assign io_pop_fire = (io_pop_valid && io_pop_ready);
  assign popCC_pushPtrGray = pushToPopGray_buffercc_io_dataOut;
  assign popCC_empty = (popCC_popPtrGray == popCC_pushPtrGray);
  assign io_pop_valid = (! popCC_empty);
  assign io_pop_fire_1 = (io_pop_valid && io_pop_ready);
  assign _zz_io_pop_payload = (io_pop_fire_1 ? popCC_popPtrPlus : popCC_popPtr);
  assign io_pop_payload = _zz_ram_port1;
  assign io_pop_fire_2 = (io_pop_valid && io_pop_ready);
  assign _zz_io_popOccupancy = popCC_pushPtrGray[1];
  assign io_popOccupancy = ({_zz_io_popOccupancy,(popCC_pushPtrGray[0] ^ _zz_io_popOccupancy)} - popCC_popPtr);
  assign pushToPopGray = pushCC_pushPtrGray;
  assign popToPushGray = popCC_popPtrGray;
  always @(posedge i_wb_clock or posedge i_wb_reset) begin
    if(i_wb_reset) begin
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

  always @(posedge i_avl_clock or posedge toplevel_i_wb_reset_syncronized) begin
    if(toplevel_i_wb_reset_syncronized) begin
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

module WbAvlCdc_StreamFifoCC_1 (
  input               io_push_valid,
  output              io_push_ready,
  input      [7:0]    io_push_payload,
  output              io_pop_valid,
  input               io_pop_ready,
  output     [7:0]    io_pop_payload,
  output     [1:0]    io_pushOccupancy,
  output     [1:0]    io_popOccupancy,
  input               i_wb_clock,
  input               i_wb_reset,
  input               i_avl_clock,
  input               toplevel_i_wb_reset_syncronized
);

  reg        [7:0]    _zz_ram_port1;
  wire       [1:0]    popToPushGray_buffercc_io_dataOut;
  wire       [1:0]    pushToPopGray_buffercc_io_dataOut;
  wire       [1:0]    _zz_pushCC_pushPtrGray;
  wire       [0:0]    _zz_ram_port;
  wire       [1:0]    _zz_popCC_popPtrGray;
  wire       [0:0]    _zz_ram_port_1;
  wire                _zz_ram_port_2;
  wire       [0:0]    _zz_io_pop_payload_1;
  wire                _zz_io_pop_payload_2;
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
  reg        [1:0]    popCC_popPtr;
  wire       [1:0]    popCC_popPtrPlus;
  wire                io_pop_fire;
  reg        [1:0]    popCC_popPtrGray;
  wire       [1:0]    popCC_pushPtrGray;
  wire                popCC_empty;
  wire                io_pop_fire_1;
  wire       [1:0]    _zz_io_pop_payload;
  wire                io_pop_fire_2;
  wire                _zz_io_popOccupancy;
  reg [7:0] ram [0:1];

  assign _zz_pushCC_pushPtrGray = (pushCC_pushPtrPlus >>> 1'b1);
  assign _zz_ram_port = pushCC_pushPtr[0:0];
  assign _zz_popCC_popPtrGray = (popCC_popPtrPlus >>> 1'b1);
  assign _zz_io_pop_payload_1 = _zz_io_pop_payload[0:0];
  assign _zz_io_pop_payload_2 = 1'b1;
  always @(posedge i_wb_clock) begin
    if(_zz_1) begin
      ram[_zz_ram_port] <= io_push_payload;
    end
  end

  always @(posedge i_avl_clock) begin
    if(_zz_io_pop_payload_2) begin
      _zz_ram_port1 <= ram[_zz_io_pop_payload_1];
    end
  end

  WbAvlCdc_BufferCC popToPushGray_buffercc (
    .io_dataIn     (popToPushGray[1:0]                      ), //i
    .io_dataOut    (popToPushGray_buffercc_io_dataOut[1:0]  ), //o
    .i_wb_clock    (i_wb_clock                              ), //i
    .i_wb_reset    (i_wb_reset                              )  //i
  );
  WbAvlCdc_BufferCC_2 pushToPopGray_buffercc (
    .io_dataIn                          (pushToPopGray[1:0]                      ), //i
    .io_dataOut                         (pushToPopGray_buffercc_io_dataOut[1:0]  ), //o
    .i_avl_clock                        (i_avl_clock                             ), //i
    .toplevel_i_wb_reset_syncronized    (toplevel_i_wb_reset_syncronized         )  //i
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
  assign popCC_popPtrPlus = (popCC_popPtr + 2'b01);
  assign io_pop_fire = (io_pop_valid && io_pop_ready);
  assign popCC_pushPtrGray = pushToPopGray_buffercc_io_dataOut;
  assign popCC_empty = (popCC_popPtrGray == popCC_pushPtrGray);
  assign io_pop_valid = (! popCC_empty);
  assign io_pop_fire_1 = (io_pop_valid && io_pop_ready);
  assign _zz_io_pop_payload = (io_pop_fire_1 ? popCC_popPtrPlus : popCC_popPtr);
  assign io_pop_payload = _zz_ram_port1;
  assign io_pop_fire_2 = (io_pop_valid && io_pop_ready);
  assign _zz_io_popOccupancy = popCC_pushPtrGray[1];
  assign io_popOccupancy = ({_zz_io_popOccupancy,(popCC_pushPtrGray[0] ^ _zz_io_popOccupancy)} - popCC_popPtr);
  assign pushToPopGray = pushCC_pushPtrGray;
  assign popToPushGray = popCC_popPtrGray;
  always @(posedge i_wb_clock or posedge i_wb_reset) begin
    if(i_wb_reset) begin
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

  always @(posedge i_avl_clock or posedge toplevel_i_wb_reset_syncronized) begin
    if(toplevel_i_wb_reset_syncronized) begin
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
  input               io_push_payload,
  output              io_pop_valid,
  input               io_pop_ready,
  output              io_pop_payload,
  output     [1:0]    io_pushOccupancy,
  output     [1:0]    io_popOccupancy,
  input               i_wb_clock,
  input               i_wb_reset,
  input               i_avl_clock,
  output              toplevel_i_wb_reset_syncronized_1
);

  reg        [0:0]    _zz_ram_port1;
  wire       [1:0]    popToPushGray_buffercc_io_dataOut;
  wire                bufferCC_io_dataOut;
  wire       [1:0]    pushToPopGray_buffercc_io_dataOut;
  wire       [1:0]    _zz_pushCC_pushPtrGray;
  wire       [0:0]    _zz_ram_port;
  wire       [0:0]    _zz_ram_port_1;
  wire       [1:0]    _zz_popCC_popPtrGray;
  wire       [0:0]    _zz_ram_port_2;
  wire                _zz_ram_port_3;
  wire       [0:0]    _zz_io_pop_payload_1;
  wire                _zz_io_pop_payload_2;
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
  wire                toplevel_i_wb_reset_syncronized;
  reg        [1:0]    popCC_popPtr;
  wire       [1:0]    popCC_popPtrPlus;
  wire                io_pop_fire;
  reg        [1:0]    popCC_popPtrGray;
  wire       [1:0]    popCC_pushPtrGray;
  wire                popCC_empty;
  wire                io_pop_fire_1;
  wire       [1:0]    _zz_io_pop_payload;
  wire                io_pop_fire_2;
  wire                _zz_io_popOccupancy;
  reg [0:0] ram [0:1];

  assign _zz_pushCC_pushPtrGray = (pushCC_pushPtrPlus >>> 1'b1);
  assign _zz_ram_port = pushCC_pushPtr[0:0];
  assign _zz_popCC_popPtrGray = (popCC_popPtrPlus >>> 1'b1);
  assign _zz_io_pop_payload_1 = _zz_io_pop_payload[0:0];
  assign _zz_ram_port_1 = io_push_payload;
  assign _zz_io_pop_payload_2 = 1'b1;
  always @(posedge i_wb_clock) begin
    if(_zz_1) begin
      ram[_zz_ram_port] <= _zz_ram_port_1;
    end
  end

  always @(posedge i_avl_clock) begin
    if(_zz_io_pop_payload_2) begin
      _zz_ram_port1 <= ram[_zz_io_pop_payload_1];
    end
  end

  WbAvlCdc_BufferCC popToPushGray_buffercc (
    .io_dataIn     (popToPushGray[1:0]                      ), //i
    .io_dataOut    (popToPushGray_buffercc_io_dataOut[1:0]  ), //o
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
    .io_dataIn                          (pushToPopGray[1:0]                      ), //i
    .io_dataOut                         (pushToPopGray_buffercc_io_dataOut[1:0]  ), //o
    .i_avl_clock                        (i_avl_clock                             ), //i
    .toplevel_i_wb_reset_syncronized    (toplevel_i_wb_reset_syncronized         )  //i
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
  assign toplevel_i_wb_reset_syncronized = bufferCC_io_dataOut;
  assign popCC_popPtrPlus = (popCC_popPtr + 2'b01);
  assign io_pop_fire = (io_pop_valid && io_pop_ready);
  assign popCC_pushPtrGray = pushToPopGray_buffercc_io_dataOut;
  assign popCC_empty = (popCC_popPtrGray == popCC_pushPtrGray);
  assign io_pop_valid = (! popCC_empty);
  assign io_pop_fire_1 = (io_pop_valid && io_pop_ready);
  assign _zz_io_pop_payload = (io_pop_fire_1 ? popCC_popPtrPlus : popCC_popPtr);
  assign io_pop_payload = _zz_ram_port1[0];
  assign io_pop_fire_2 = (io_pop_valid && io_pop_ready);
  assign _zz_io_popOccupancy = popCC_pushPtrGray[1];
  assign io_popOccupancy = ({_zz_io_popOccupancy,(popCC_pushPtrGray[0] ^ _zz_io_popOccupancy)} - popCC_popPtr);
  assign pushToPopGray = pushCC_pushPtrGray;
  assign popToPushGray = popCC_popPtrGray;
  assign toplevel_i_wb_reset_syncronized_1 = toplevel_i_wb_reset_syncronized;
  always @(posedge i_wb_clock or posedge i_wb_reset) begin
    if(i_wb_reset) begin
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

  always @(posedge i_avl_clock or posedge toplevel_i_wb_reset_syncronized) begin
    if(toplevel_i_wb_reset_syncronized) begin
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

//WbAvlCdc_BufferCC_2 replaced by WbAvlCdc_BufferCC_2

//WbAvlCdc_BufferCC replaced by WbAvlCdc_BufferCC

//WbAvlCdc_BufferCC_15 replaced by WbAvlCdc_BufferCC_15

//WbAvlCdc_BufferCC_13 replaced by WbAvlCdc_BufferCC_13

module WbAvlCdc_BufferCC_15 (
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

module WbAvlCdc_BufferCC_14 (
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

module WbAvlCdc_BufferCC_13 (
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

//WbAvlCdc_BufferCC_2 replaced by WbAvlCdc_BufferCC_2

//WbAvlCdc_BufferCC replaced by WbAvlCdc_BufferCC

//WbAvlCdc_BufferCC_2 replaced by WbAvlCdc_BufferCC_2

//WbAvlCdc_BufferCC replaced by WbAvlCdc_BufferCC

//WbAvlCdc_BufferCC_2 replaced by WbAvlCdc_BufferCC_2

//WbAvlCdc_BufferCC replaced by WbAvlCdc_BufferCC

//WbAvlCdc_BufferCC_2 replaced by WbAvlCdc_BufferCC_2

//WbAvlCdc_BufferCC replaced by WbAvlCdc_BufferCC

//WbAvlCdc_BufferCC_2 replaced by WbAvlCdc_BufferCC_2

//WbAvlCdc_BufferCC replaced by WbAvlCdc_BufferCC

module WbAvlCdc_BufferCC_2 (
  input      [1:0]    io_dataIn,
  output     [1:0]    io_dataOut,
  input               i_avl_clock,
  input               toplevel_i_wb_reset_syncronized
);

  (* async_reg = "true" *) reg        [1:0]    buffers_0;
  (* async_reg = "true" *) reg        [1:0]    buffers_1;

  assign io_dataOut = buffers_1;
  always @(posedge i_avl_clock or posedge toplevel_i_wb_reset_syncronized) begin
    if(toplevel_i_wb_reset_syncronized) begin
      buffers_0 <= 2'b00;
      buffers_1 <= 2'b00;
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
  input      [1:0]    io_dataIn,
  output     [1:0]    io_dataOut,
  input               i_wb_clock,
  input               i_wb_reset
);

  (* async_reg = "true" *) reg        [1:0]    buffers_0;
  (* async_reg = "true" *) reg        [1:0]    buffers_1;

  assign io_dataOut = buffers_1;
  always @(posedge i_wb_clock or posedge i_wb_reset) begin
    if(i_wb_reset) begin
      buffers_0 <= 2'b00;
      buffers_1 <= 2'b00;
    end else begin
      buffers_0 <= io_dataIn;
      buffers_1 <= buffers_0;
    end
  end


endmodule
