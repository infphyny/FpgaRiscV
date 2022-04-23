// Generator : SpinalHDL v1.6.4    git head : 598c18959149eb18e5eee5b0aa3eef01ecaa41a1
// Component : MemoryStreamArbiter
// Git hash  : 0d73750da08867d712ad142e7a44c2b5ab44ff1b

`timescale 1ns/1ps 

module MemoryStreamArbiter (
  input               input_request_0_valid,
  output              input_request_0_ready,
  input               input_request_0_payload_we,
  input      [25:0]   input_request_0_payload_adr,
  input      [63:0]   input_request_0_payload_dat,
  input      [7:0]    input_request_0_payload_sel,
  input               input_request_0_payload_burstbegin,
  input      [2:0]    input_request_0_payload_size,
  input               input_request_1_valid,
  output              input_request_1_ready,
  input               input_request_1_payload_we,
  input      [25:0]   input_request_1_payload_adr,
  input      [63:0]   input_request_1_payload_dat,
  input      [7:0]    input_request_1_payload_sel,
  input               input_request_1_payload_burstbegin,
  input      [2:0]    input_request_1_payload_size,
  output reg          output_request_valid,
  input               output_request_ready,
  output              output_request_payload_we,
  output     [25:0]   output_request_payload_adr,
  output     [63:0]   output_request_payload_dat,
  output     [7:0]    output_request_payload_sel,
  output              output_request_payload_burstbegin,
  output     [2:0]    output_request_payload_size,
  input               input_response_valid,
  output reg          input_response_ready,
  input      [63:0]   input_response_payload_rdt,
  output reg          output_response_0_valid,
  input               output_response_0_ready,
  output     [63:0]   output_response_0_payload_rdt,
  output reg          output_response_1_valid,
  input               output_response_1_ready,
  output     [63:0]   output_response_1_payload_rdt,
  input               clk,
  input               reset
);
  localparam fsm_enumDef_BOOT = 2'd0;
  localparam fsm_enumDef_Init = 2'd1;
  localparam fsm_enumDef_Idle = 2'd2;
  localparam fsm_enumDef_Read = 2'd3;

  wire                arbiter_io_inputs_0_ready;
  wire                arbiter_io_inputs_1_ready;
  wire                arbiter_io_output_valid;
  wire                arbiter_io_output_payload_we;
  wire       [25:0]   arbiter_io_output_payload_adr;
  wire       [63:0]   arbiter_io_output_payload_dat;
  wire       [7:0]    arbiter_io_output_payload_sel;
  wire                arbiter_io_output_payload_burstbegin;
  wire       [2:0]    arbiter_io_output_payload_size;
  wire       [0:0]    arbiter_io_chosen;
  wire       [1:0]    arbiter_io_chosenOH;
  wire                arbiter_fifo_io_push_ready;
  wire                arbiter_fifo_io_pop_valid;
  wire                arbiter_fifo_io_pop_payload_we;
  wire       [25:0]   arbiter_fifo_io_pop_payload_adr;
  wire       [63:0]   arbiter_fifo_io_pop_payload_dat;
  wire       [7:0]    arbiter_fifo_io_pop_payload_sel;
  wire                arbiter_fifo_io_pop_payload_burstbegin;
  wire       [2:0]    arbiter_fifo_io_pop_payload_size;
  wire       [3:0]    arbiter_fifo_io_occupancy;
  wire       [3:0]    arbiter_fifo_io_availability;
  wire                arbiter_chosen_fifo_io_push_ready;
  wire                arbiter_chosen_fifo_io_pop_valid;
  wire       [0:0]    arbiter_chosen_fifo_io_pop_payload;
  wire       [3:0]    arbiter_chosen_fifo_io_occupancy;
  wire       [3:0]    arbiter_chosen_fifo_io_availability;
  wire                arbiter_stream_output_valid;
  reg                 arbiter_stream_output_ready;
  wire                arbiter_stream_output_payload_we;
  wire       [25:0]   arbiter_stream_output_payload_adr;
  wire       [63:0]   arbiter_stream_output_payload_dat;
  wire       [7:0]    arbiter_stream_output_payload_sel;
  wire                arbiter_stream_output_payload_burstbegin;
  wire       [2:0]    arbiter_stream_output_payload_size;
  reg                 arbiter_chosen_input_valid;
  wire                arbiter_chosen_input_ready;
  wire       [0:0]    arbiter_chosen_input_payload;
  wire                arbiter_chosen_output_valid;
  reg                 arbiter_chosen_output_ready;
  wire       [0:0]    arbiter_chosen_output_payload;
  reg        [1:0]    inputs_valid;
  wire                when_MemoryStreamArbiter_l59;
  wire                fsm_wantExit;
  reg                 fsm_wantStart;
  wire                fsm_wantKill;
  reg        [1:0]    fsm_stateReg;
  reg        [1:0]    fsm_stateNext;
  wire       [1:0]    _zz_1;
  `ifndef SYNTHESIS
  reg [31:0] fsm_stateReg_string;
  reg [31:0] fsm_stateNext_string;
  `endif


  MemoryStreamArbiter_StreamArbiter arbiter (
    .io_inputs_0_valid                 (input_request_0_valid                 ), //i
    .io_inputs_0_ready                 (arbiter_io_inputs_0_ready             ), //o
    .io_inputs_0_payload_we            (input_request_0_payload_we            ), //i
    .io_inputs_0_payload_adr           (input_request_0_payload_adr[25:0]     ), //i
    .io_inputs_0_payload_dat           (input_request_0_payload_dat[63:0]     ), //i
    .io_inputs_0_payload_sel           (input_request_0_payload_sel[7:0]      ), //i
    .io_inputs_0_payload_burstbegin    (input_request_0_payload_burstbegin    ), //i
    .io_inputs_0_payload_size          (input_request_0_payload_size[2:0]     ), //i
    .io_inputs_1_valid                 (input_request_1_valid                 ), //i
    .io_inputs_1_ready                 (arbiter_io_inputs_1_ready             ), //o
    .io_inputs_1_payload_we            (input_request_1_payload_we            ), //i
    .io_inputs_1_payload_adr           (input_request_1_payload_adr[25:0]     ), //i
    .io_inputs_1_payload_dat           (input_request_1_payload_dat[63:0]     ), //i
    .io_inputs_1_payload_sel           (input_request_1_payload_sel[7:0]      ), //i
    .io_inputs_1_payload_burstbegin    (input_request_1_payload_burstbegin    ), //i
    .io_inputs_1_payload_size          (input_request_1_payload_size[2:0]     ), //i
    .io_output_valid                   (arbiter_io_output_valid               ), //o
    .io_output_ready                   (arbiter_fifo_io_push_ready            ), //i
    .io_output_payload_we              (arbiter_io_output_payload_we          ), //o
    .io_output_payload_adr             (arbiter_io_output_payload_adr[25:0]   ), //o
    .io_output_payload_dat             (arbiter_io_output_payload_dat[63:0]   ), //o
    .io_output_payload_sel             (arbiter_io_output_payload_sel[7:0]    ), //o
    .io_output_payload_burstbegin      (arbiter_io_output_payload_burstbegin  ), //o
    .io_output_payload_size            (arbiter_io_output_payload_size[2:0]   ), //o
    .io_chosen                         (arbiter_io_chosen                     ), //o
    .io_chosenOH                       (arbiter_io_chosenOH[1:0]              ), //o
    .clk                               (clk                                   ), //i
    .reset                             (reset                                 )  //i
  );
  MemoryStreamArbiter_StreamFifo arbiter_fifo (
    .io_push_valid                 (arbiter_io_output_valid                 ), //i
    .io_push_ready                 (arbiter_fifo_io_push_ready              ), //o
    .io_push_payload_we            (arbiter_io_output_payload_we            ), //i
    .io_push_payload_adr           (arbiter_io_output_payload_adr[25:0]     ), //i
    .io_push_payload_dat           (arbiter_io_output_payload_dat[63:0]     ), //i
    .io_push_payload_sel           (arbiter_io_output_payload_sel[7:0]      ), //i
    .io_push_payload_burstbegin    (arbiter_io_output_payload_burstbegin    ), //i
    .io_push_payload_size          (arbiter_io_output_payload_size[2:0]     ), //i
    .io_pop_valid                  (arbiter_fifo_io_pop_valid               ), //o
    .io_pop_ready                  (arbiter_stream_output_ready             ), //i
    .io_pop_payload_we             (arbiter_fifo_io_pop_payload_we          ), //o
    .io_pop_payload_adr            (arbiter_fifo_io_pop_payload_adr[25:0]   ), //o
    .io_pop_payload_dat            (arbiter_fifo_io_pop_payload_dat[63:0]   ), //o
    .io_pop_payload_sel            (arbiter_fifo_io_pop_payload_sel[7:0]    ), //o
    .io_pop_payload_burstbegin     (arbiter_fifo_io_pop_payload_burstbegin  ), //o
    .io_pop_payload_size           (arbiter_fifo_io_pop_payload_size[2:0]   ), //o
    .io_flush                      (1'b0                                    ), //i
    .io_occupancy                  (arbiter_fifo_io_occupancy[3:0]          ), //o
    .io_availability               (arbiter_fifo_io_availability[3:0]       ), //o
    .clk                           (clk                                     ), //i
    .reset                         (reset                                   )  //i
  );
  MemoryStreamArbiter_StreamFifo_1 arbiter_chosen_fifo (
    .io_push_valid      (arbiter_chosen_input_valid                ), //i
    .io_push_ready      (arbiter_chosen_fifo_io_push_ready         ), //o
    .io_push_payload    (arbiter_chosen_input_payload              ), //i
    .io_pop_valid       (arbiter_chosen_fifo_io_pop_valid          ), //o
    .io_pop_ready       (arbiter_chosen_output_ready               ), //i
    .io_pop_payload     (arbiter_chosen_fifo_io_pop_payload        ), //o
    .io_flush           (1'b0                                      ), //i
    .io_occupancy       (arbiter_chosen_fifo_io_occupancy[3:0]     ), //o
    .io_availability    (arbiter_chosen_fifo_io_availability[3:0]  ), //o
    .clk                (clk                                       ), //i
    .reset              (reset                                     )  //i
  );
  `ifndef SYNTHESIS
  always @(*) begin
    case(fsm_stateReg)
      fsm_enumDef_BOOT : fsm_stateReg_string = "BOOT";
      fsm_enumDef_Init : fsm_stateReg_string = "Init";
      fsm_enumDef_Idle : fsm_stateReg_string = "Idle";
      fsm_enumDef_Read : fsm_stateReg_string = "Read";
      default : fsm_stateReg_string = "????";
    endcase
  end
  always @(*) begin
    case(fsm_stateNext)
      fsm_enumDef_BOOT : fsm_stateNext_string = "BOOT";
      fsm_enumDef_Init : fsm_stateNext_string = "Init";
      fsm_enumDef_Idle : fsm_stateNext_string = "Idle";
      fsm_enumDef_Read : fsm_stateNext_string = "Read";
      default : fsm_stateNext_string = "????";
    endcase
  end
  `endif

  always @(*) begin
    arbiter_chosen_input_valid = 1'b0;
    if(when_MemoryStreamArbiter_l59) begin
      arbiter_chosen_input_valid = 1'b1;
    end
  end

  always @(*) begin
    arbiter_chosen_output_ready = 1'b0;
    case(fsm_stateReg)
      fsm_enumDef_Init : begin
      end
      fsm_enumDef_Idle : begin
        if(arbiter_stream_output_valid) begin
          if(arbiter_stream_output_payload_we) begin
            arbiter_chosen_output_ready = 1'b1;
          end
        end
      end
      fsm_enumDef_Read : begin
        if(input_response_valid) begin
          arbiter_chosen_output_ready = 1'b1;
        end
      end
      default : begin
      end
    endcase
  end

  assign arbiter_chosen_input_ready = arbiter_chosen_fifo_io_push_ready;
  assign arbiter_chosen_output_valid = arbiter_chosen_fifo_io_pop_valid;
  assign arbiter_chosen_output_payload = arbiter_chosen_fifo_io_pop_payload;
  always @(*) begin
    inputs_valid[0] = input_request_0_valid;
    inputs_valid[1] = input_request_1_valid;
  end

  assign arbiter_chosen_input_payload = arbiter_io_chosen;
  assign when_MemoryStreamArbiter_l59 = (|inputs_valid);
  assign arbiter_stream_output_valid = arbiter_fifo_io_pop_valid;
  assign arbiter_stream_output_payload_we = arbiter_fifo_io_pop_payload_we;
  assign arbiter_stream_output_payload_adr = arbiter_fifo_io_pop_payload_adr;
  assign arbiter_stream_output_payload_dat = arbiter_fifo_io_pop_payload_dat;
  assign arbiter_stream_output_payload_sel = arbiter_fifo_io_pop_payload_sel;
  assign arbiter_stream_output_payload_burstbegin = arbiter_fifo_io_pop_payload_burstbegin;
  assign arbiter_stream_output_payload_size = arbiter_fifo_io_pop_payload_size;
  assign input_request_0_ready = arbiter_io_inputs_0_ready;
  assign input_request_1_ready = arbiter_io_inputs_1_ready;
  always @(*) begin
    output_request_valid = 1'b0;
    case(fsm_stateReg)
      fsm_enumDef_Init : begin
      end
      fsm_enumDef_Idle : begin
        if(arbiter_stream_output_valid) begin
          output_request_valid = 1'b1;
        end
      end
      fsm_enumDef_Read : begin
      end
      default : begin
      end
    endcase
  end

  always @(*) begin
    arbiter_stream_output_ready = output_request_ready;
    case(fsm_stateReg)
      fsm_enumDef_Init : begin
      end
      fsm_enumDef_Idle : begin
      end
      fsm_enumDef_Read : begin
        if(input_response_valid) begin
          arbiter_stream_output_ready = 1'b1;
        end
      end
      default : begin
      end
    endcase
  end

  assign output_request_payload_we = arbiter_stream_output_payload_we;
  assign output_request_payload_adr = arbiter_stream_output_payload_adr;
  assign output_request_payload_dat = arbiter_stream_output_payload_dat;
  assign output_request_payload_sel = arbiter_stream_output_payload_sel;
  assign output_request_payload_burstbegin = arbiter_stream_output_payload_burstbegin;
  assign output_request_payload_size = arbiter_stream_output_payload_size;
  always @(*) begin
    input_response_ready = 1'b0;
    case(fsm_stateReg)
      fsm_enumDef_Init : begin
      end
      fsm_enumDef_Idle : begin
      end
      fsm_enumDef_Read : begin
        if(input_response_valid) begin
          input_response_ready = 1'b1;
        end
      end
      default : begin
      end
    endcase
  end

  assign output_response_0_payload_rdt = input_response_payload_rdt;
  always @(*) begin
    output_response_0_valid = 1'b0;
    case(fsm_stateReg)
      fsm_enumDef_Init : begin
      end
      fsm_enumDef_Idle : begin
      end
      fsm_enumDef_Read : begin
        if(input_response_valid) begin
          if(_zz_1[0]) begin
            output_response_0_valid = 1'b1;
          end
        end
      end
      default : begin
      end
    endcase
  end

  assign output_response_1_payload_rdt = input_response_payload_rdt;
  always @(*) begin
    output_response_1_valid = 1'b0;
    case(fsm_stateReg)
      fsm_enumDef_Init : begin
      end
      fsm_enumDef_Idle : begin
      end
      fsm_enumDef_Read : begin
        if(input_response_valid) begin
          if(_zz_1[1]) begin
            output_response_1_valid = 1'b1;
          end
        end
      end
      default : begin
      end
    endcase
  end

  assign fsm_wantExit = 1'b0;
  always @(*) begin
    fsm_wantStart = 1'b0;
    case(fsm_stateReg)
      fsm_enumDef_Init : begin
      end
      fsm_enumDef_Idle : begin
      end
      fsm_enumDef_Read : begin
      end
      default : begin
        fsm_wantStart = 1'b1;
      end
    endcase
  end

  assign fsm_wantKill = 1'b0;
  always @(*) begin
    fsm_stateNext = fsm_stateReg;
    case(fsm_stateReg)
      fsm_enumDef_Init : begin
        fsm_stateNext = fsm_enumDef_Idle;
      end
      fsm_enumDef_Idle : begin
        if(arbiter_stream_output_valid) begin
          if(!arbiter_stream_output_payload_we) begin
            fsm_stateNext = fsm_enumDef_Read;
          end
        end
      end
      fsm_enumDef_Read : begin
        if(input_response_valid) begin
          fsm_stateNext = fsm_enumDef_Idle;
        end
      end
      default : begin
      end
    endcase
    if(fsm_wantStart) begin
      fsm_stateNext = fsm_enumDef_Init;
    end
    if(fsm_wantKill) begin
      fsm_stateNext = fsm_enumDef_BOOT;
    end
  end

  assign _zz_1 = ({1'd0,1'b1} <<< arbiter_chosen_output_payload);
  always @(posedge clk or posedge reset) begin
    if(reset) begin
      fsm_stateReg <= fsm_enumDef_BOOT;
    end else begin
      fsm_stateReg <= fsm_stateNext;
    end
  end


endmodule

module MemoryStreamArbiter_StreamFifo_1 (
  input               io_push_valid,
  output              io_push_ready,
  input      [0:0]    io_push_payload,
  output              io_pop_valid,
  input               io_pop_ready,
  output     [0:0]    io_pop_payload,
  input               io_flush,
  output     [3:0]    io_occupancy,
  output     [3:0]    io_availability,
  input               clk,
  input               reset
);

  reg        [0:0]    _zz_logic_ram_port0;
  wire       [2:0]    _zz_logic_pushPtr_valueNext;
  wire       [0:0]    _zz_logic_pushPtr_valueNext_1;
  wire       [2:0]    _zz_logic_popPtr_valueNext;
  wire       [0:0]    _zz_logic_popPtr_valueNext_1;
  wire                _zz_logic_ram_port;
  wire                _zz_io_pop_payload;
  wire       [0:0]    _zz_logic_ram_port_1;
  wire       [2:0]    _zz_io_availability;
  reg                 _zz_1;
  reg                 logic_pushPtr_willIncrement;
  reg                 logic_pushPtr_willClear;
  reg        [2:0]    logic_pushPtr_valueNext;
  reg        [2:0]    logic_pushPtr_value;
  wire                logic_pushPtr_willOverflowIfInc;
  wire                logic_pushPtr_willOverflow;
  reg                 logic_popPtr_willIncrement;
  reg                 logic_popPtr_willClear;
  reg        [2:0]    logic_popPtr_valueNext;
  reg        [2:0]    logic_popPtr_value;
  wire                logic_popPtr_willOverflowIfInc;
  wire                logic_popPtr_willOverflow;
  wire                logic_ptrMatch;
  reg                 logic_risingOccupancy;
  wire                logic_pushing;
  wire                logic_popping;
  wire                logic_empty;
  wire                logic_full;
  reg                 _zz_io_pop_valid;
  wire                when_Stream_l954;
  wire       [2:0]    logic_ptrDif;
  reg [0:0] logic_ram [0:7];

  assign _zz_logic_pushPtr_valueNext_1 = logic_pushPtr_willIncrement;
  assign _zz_logic_pushPtr_valueNext = {2'd0, _zz_logic_pushPtr_valueNext_1};
  assign _zz_logic_popPtr_valueNext_1 = logic_popPtr_willIncrement;
  assign _zz_logic_popPtr_valueNext = {2'd0, _zz_logic_popPtr_valueNext_1};
  assign _zz_io_availability = (logic_popPtr_value - logic_pushPtr_value);
  assign _zz_io_pop_payload = 1'b1;
  assign _zz_logic_ram_port_1 = io_push_payload;
  always @(posedge clk) begin
    if(_zz_io_pop_payload) begin
      _zz_logic_ram_port0 <= logic_ram[logic_popPtr_valueNext];
    end
  end

  always @(posedge clk) begin
    if(_zz_1) begin
      logic_ram[logic_pushPtr_value] <= _zz_logic_ram_port_1;
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

  assign logic_pushPtr_willOverflowIfInc = (logic_pushPtr_value == 3'b111);
  assign logic_pushPtr_willOverflow = (logic_pushPtr_willOverflowIfInc && logic_pushPtr_willIncrement);
  always @(*) begin
    logic_pushPtr_valueNext = (logic_pushPtr_value + _zz_logic_pushPtr_valueNext);
    if(logic_pushPtr_willClear) begin
      logic_pushPtr_valueNext = 3'b000;
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

  assign logic_popPtr_willOverflowIfInc = (logic_popPtr_value == 3'b111);
  assign logic_popPtr_willOverflow = (logic_popPtr_willOverflowIfInc && logic_popPtr_willIncrement);
  always @(*) begin
    logic_popPtr_valueNext = (logic_popPtr_value + _zz_logic_popPtr_valueNext);
    if(logic_popPtr_willClear) begin
      logic_popPtr_valueNext = 3'b000;
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
  assign when_Stream_l954 = (logic_pushing != logic_popping);
  assign logic_ptrDif = (logic_pushPtr_value - logic_popPtr_value);
  assign io_occupancy = {(logic_risingOccupancy && logic_ptrMatch),logic_ptrDif};
  assign io_availability = {((! logic_risingOccupancy) && logic_ptrMatch),_zz_io_availability};
  always @(posedge clk or posedge reset) begin
    if(reset) begin
      logic_pushPtr_value <= 3'b000;
      logic_popPtr_value <= 3'b000;
      logic_risingOccupancy <= 1'b0;
      _zz_io_pop_valid <= 1'b0;
    end else begin
      logic_pushPtr_value <= logic_pushPtr_valueNext;
      logic_popPtr_value <= logic_popPtr_valueNext;
      _zz_io_pop_valid <= (logic_popPtr_valueNext == logic_pushPtr_value);
      if(when_Stream_l954) begin
        logic_risingOccupancy <= logic_pushing;
      end
      if(io_flush) begin
        logic_risingOccupancy <= 1'b0;
      end
    end
  end


endmodule

module MemoryStreamArbiter_StreamFifo (
  input               io_push_valid,
  output              io_push_ready,
  input               io_push_payload_we,
  input      [25:0]   io_push_payload_adr,
  input      [63:0]   io_push_payload_dat,
  input      [7:0]    io_push_payload_sel,
  input               io_push_payload_burstbegin,
  input      [2:0]    io_push_payload_size,
  output              io_pop_valid,
  input               io_pop_ready,
  output              io_pop_payload_we,
  output     [25:0]   io_pop_payload_adr,
  output     [63:0]   io_pop_payload_dat,
  output     [7:0]    io_pop_payload_sel,
  output              io_pop_payload_burstbegin,
  output     [2:0]    io_pop_payload_size,
  input               io_flush,
  output     [3:0]    io_occupancy,
  output     [3:0]    io_availability,
  input               clk,
  input               reset
);

  reg        [102:0]  _zz_logic_ram_port0;
  wire       [2:0]    _zz_logic_pushPtr_valueNext;
  wire       [0:0]    _zz_logic_pushPtr_valueNext_1;
  wire       [2:0]    _zz_logic_popPtr_valueNext;
  wire       [0:0]    _zz_logic_popPtr_valueNext_1;
  wire                _zz_logic_ram_port;
  wire                _zz__zz_io_pop_payload_we;
  wire       [102:0]  _zz_logic_ram_port_1;
  wire       [2:0]    _zz_io_availability;
  reg                 _zz_1;
  reg                 logic_pushPtr_willIncrement;
  reg                 logic_pushPtr_willClear;
  reg        [2:0]    logic_pushPtr_valueNext;
  reg        [2:0]    logic_pushPtr_value;
  wire                logic_pushPtr_willOverflowIfInc;
  wire                logic_pushPtr_willOverflow;
  reg                 logic_popPtr_willIncrement;
  reg                 logic_popPtr_willClear;
  reg        [2:0]    logic_popPtr_valueNext;
  reg        [2:0]    logic_popPtr_value;
  wire                logic_popPtr_willOverflowIfInc;
  wire                logic_popPtr_willOverflow;
  wire                logic_ptrMatch;
  reg                 logic_risingOccupancy;
  wire                logic_pushing;
  wire                logic_popping;
  wire                logic_empty;
  wire                logic_full;
  reg                 _zz_io_pop_valid;
  wire       [102:0]  _zz_io_pop_payload_we;
  wire                when_Stream_l954;
  wire       [2:0]    logic_ptrDif;
  reg [102:0] logic_ram [0:7];

  assign _zz_logic_pushPtr_valueNext_1 = logic_pushPtr_willIncrement;
  assign _zz_logic_pushPtr_valueNext = {2'd0, _zz_logic_pushPtr_valueNext_1};
  assign _zz_logic_popPtr_valueNext_1 = logic_popPtr_willIncrement;
  assign _zz_logic_popPtr_valueNext = {2'd0, _zz_logic_popPtr_valueNext_1};
  assign _zz_io_availability = (logic_popPtr_value - logic_pushPtr_value);
  assign _zz__zz_io_pop_payload_we = 1'b1;
  assign _zz_logic_ram_port_1 = {io_push_payload_size,{io_push_payload_burstbegin,{io_push_payload_sel,{io_push_payload_dat,{io_push_payload_adr,io_push_payload_we}}}}};
  always @(posedge clk) begin
    if(_zz__zz_io_pop_payload_we) begin
      _zz_logic_ram_port0 <= logic_ram[logic_popPtr_valueNext];
    end
  end

  always @(posedge clk) begin
    if(_zz_1) begin
      logic_ram[logic_pushPtr_value] <= _zz_logic_ram_port_1;
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

  assign logic_pushPtr_willOverflowIfInc = (logic_pushPtr_value == 3'b111);
  assign logic_pushPtr_willOverflow = (logic_pushPtr_willOverflowIfInc && logic_pushPtr_willIncrement);
  always @(*) begin
    logic_pushPtr_valueNext = (logic_pushPtr_value + _zz_logic_pushPtr_valueNext);
    if(logic_pushPtr_willClear) begin
      logic_pushPtr_valueNext = 3'b000;
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

  assign logic_popPtr_willOverflowIfInc = (logic_popPtr_value == 3'b111);
  assign logic_popPtr_willOverflow = (logic_popPtr_willOverflowIfInc && logic_popPtr_willIncrement);
  always @(*) begin
    logic_popPtr_valueNext = (logic_popPtr_value + _zz_logic_popPtr_valueNext);
    if(logic_popPtr_willClear) begin
      logic_popPtr_valueNext = 3'b000;
    end
  end

  assign logic_ptrMatch = (logic_pushPtr_value == logic_popPtr_value);
  assign logic_pushing = (io_push_valid && io_push_ready);
  assign logic_popping = (io_pop_valid && io_pop_ready);
  assign logic_empty = (logic_ptrMatch && (! logic_risingOccupancy));
  assign logic_full = (logic_ptrMatch && logic_risingOccupancy);
  assign io_push_ready = (! logic_full);
  assign io_pop_valid = ((! logic_empty) && (! (_zz_io_pop_valid && (! logic_full))));
  assign _zz_io_pop_payload_we = _zz_logic_ram_port0;
  assign io_pop_payload_we = _zz_io_pop_payload_we[0];
  assign io_pop_payload_adr = _zz_io_pop_payload_we[26 : 1];
  assign io_pop_payload_dat = _zz_io_pop_payload_we[90 : 27];
  assign io_pop_payload_sel = _zz_io_pop_payload_we[98 : 91];
  assign io_pop_payload_burstbegin = _zz_io_pop_payload_we[99];
  assign io_pop_payload_size = _zz_io_pop_payload_we[102 : 100];
  assign when_Stream_l954 = (logic_pushing != logic_popping);
  assign logic_ptrDif = (logic_pushPtr_value - logic_popPtr_value);
  assign io_occupancy = {(logic_risingOccupancy && logic_ptrMatch),logic_ptrDif};
  assign io_availability = {((! logic_risingOccupancy) && logic_ptrMatch),_zz_io_availability};
  always @(posedge clk or posedge reset) begin
    if(reset) begin
      logic_pushPtr_value <= 3'b000;
      logic_popPtr_value <= 3'b000;
      logic_risingOccupancy <= 1'b0;
      _zz_io_pop_valid <= 1'b0;
    end else begin
      logic_pushPtr_value <= logic_pushPtr_valueNext;
      logic_popPtr_value <= logic_popPtr_valueNext;
      _zz_io_pop_valid <= (logic_popPtr_valueNext == logic_pushPtr_value);
      if(when_Stream_l954) begin
        logic_risingOccupancy <= logic_pushing;
      end
      if(io_flush) begin
        logic_risingOccupancy <= 1'b0;
      end
    end
  end


endmodule

module MemoryStreamArbiter_StreamArbiter (
  input               io_inputs_0_valid,
  output              io_inputs_0_ready,
  input               io_inputs_0_payload_we,
  input      [25:0]   io_inputs_0_payload_adr,
  input      [63:0]   io_inputs_0_payload_dat,
  input      [7:0]    io_inputs_0_payload_sel,
  input               io_inputs_0_payload_burstbegin,
  input      [2:0]    io_inputs_0_payload_size,
  input               io_inputs_1_valid,
  output              io_inputs_1_ready,
  input               io_inputs_1_payload_we,
  input      [25:0]   io_inputs_1_payload_adr,
  input      [63:0]   io_inputs_1_payload_dat,
  input      [7:0]    io_inputs_1_payload_sel,
  input               io_inputs_1_payload_burstbegin,
  input      [2:0]    io_inputs_1_payload_size,
  output              io_output_valid,
  input               io_output_ready,
  output              io_output_payload_we,
  output     [25:0]   io_output_payload_adr,
  output     [63:0]   io_output_payload_dat,
  output     [7:0]    io_output_payload_sel,
  output              io_output_payload_burstbegin,
  output     [2:0]    io_output_payload_size,
  output     [0:0]    io_chosen,
  output     [1:0]    io_chosenOH,
  input               clk,
  input               reset
);

  wire       [1:0]    _zz_maskProposal_1_1;
  wire       [1:0]    _zz_maskProposal_1_2;
  reg                 locked;
  wire                maskProposal_0;
  wire                maskProposal_1;
  reg                 maskLocked_0;
  reg                 maskLocked_1;
  wire                maskRouted_0;
  wire                maskRouted_1;
  wire       [1:0]    _zz_maskProposal_1;
  wire                io_output_fire;
  wire                _zz_io_chosen;

  assign _zz_maskProposal_1_1 = (_zz_maskProposal_1 & (~ _zz_maskProposal_1_2));
  assign _zz_maskProposal_1_2 = (_zz_maskProposal_1 - 2'b01);
  assign maskRouted_0 = (locked ? maskLocked_0 : maskProposal_0);
  assign maskRouted_1 = (locked ? maskLocked_1 : maskProposal_1);
  assign _zz_maskProposal_1 = {io_inputs_1_valid,io_inputs_0_valid};
  assign maskProposal_0 = io_inputs_0_valid;
  assign maskProposal_1 = _zz_maskProposal_1_1[1];
  assign io_output_fire = (io_output_valid && io_output_ready);
  assign io_output_valid = ((io_inputs_0_valid && maskRouted_0) || (io_inputs_1_valid && maskRouted_1));
  assign io_output_payload_we = (maskRouted_0 ? io_inputs_0_payload_we : io_inputs_1_payload_we);
  assign io_output_payload_adr = (maskRouted_0 ? io_inputs_0_payload_adr : io_inputs_1_payload_adr);
  assign io_output_payload_dat = (maskRouted_0 ? io_inputs_0_payload_dat : io_inputs_1_payload_dat);
  assign io_output_payload_sel = (maskRouted_0 ? io_inputs_0_payload_sel : io_inputs_1_payload_sel);
  assign io_output_payload_burstbegin = (maskRouted_0 ? io_inputs_0_payload_burstbegin : io_inputs_1_payload_burstbegin);
  assign io_output_payload_size = (maskRouted_0 ? io_inputs_0_payload_size : io_inputs_1_payload_size);
  assign io_inputs_0_ready = (maskRouted_0 && io_output_ready);
  assign io_inputs_1_ready = (maskRouted_1 && io_output_ready);
  assign io_chosenOH = {maskRouted_1,maskRouted_0};
  assign _zz_io_chosen = io_chosenOH[1];
  assign io_chosen = _zz_io_chosen;
  always @(posedge clk or posedge reset) begin
    if(reset) begin
      locked <= 1'b0;
    end else begin
      if(io_output_valid) begin
        locked <= 1'b1;
      end
      if(io_output_fire) begin
        locked <= 1'b0;
      end
    end
  end

  always @(posedge clk) begin
    if(io_output_valid) begin
      maskLocked_0 <= maskRouted_0;
      maskLocked_1 <= maskRouted_1;
    end
  end


endmodule
