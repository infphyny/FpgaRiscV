// Generator : SpinalHDL v1.4.3    git head : adf552d8f500e7419fff395b7049228e4bc5de26
// Component : MicroWireWishbone
// Git hash  : e03a66e8f94607b5b85df824187b35e3c8c2028f


`define fsm_enumDefinition_binary_sequential_type [2:0]
`define fsm_enumDefinition_binary_sequential_fsm_BOOT 3'b000
`define fsm_enumDefinition_binary_sequential_fsm_Idle 3'b001
`define fsm_enumDefinition_binary_sequential_fsm_Send 3'b010
`define fsm_enumDefinition_binary_sequential_fsm_SendFinish 3'b011
`define fsm_enumDefinition_binary_sequential_fsm_RecvFinish 3'b100
`define fsm_enumDefinition_binary_sequential_fsm_Recv 3'b101


module MicroWireWishbone (
  input      [1:0]    wb_adr,
  input      [7:0]    wb_data_i,
  output     [7:0]    wb_data_o,
  input               wb_we,
  input               wb_stb,
  input               wb_cyc,
  output              wb_ack,
  output              wb_err,
  output              wb_rty,
  input               si,
  output              so,
  output              soe,
  output              sc,
  output              cs_n,
  input               clk,
  input               reset
);
  reg                 _zz_1;
  wire       [7:0]    mw_o_data;
  wire                mw_so;
  wire                mw_soe;
  wire                mw_sc;
  wire                mw_cs_n;
  wire                _zz_2;
  reg                 ack;

  assign _zz_2 = ((wb_cyc == 1'b1) && (wb_stb == 1'b1));
  MicroWire mw (
    .we        (_zz_1           ), //i
    .adr       (wb_adr[1:0]     ), //i
    .i_data    (wb_data_i[7:0]  ), //i
    .o_data    (mw_o_data[7:0]  ), //o
    .si        (si              ), //i
    .so        (mw_so           ), //o
    .soe       (mw_soe          ), //o
    .sc        (mw_sc           ), //o
    .cs_n      (mw_cs_n         ), //o
    .clk       (clk             ), //i
    .reset     (reset           )  //i
  );
  assign wb_err = 1'b0;
  assign wb_rty = 1'b0;
  assign so = mw_so;
  assign soe = mw_soe;
  assign sc = mw_sc;
  assign cs_n = mw_cs_n;
  assign wb_ack = ack;
  assign wb_data_o = mw_o_data;
  always @ (*) begin
    _zz_1 = 1'b0;
    if(_zz_2)begin
      if((wb_we == 1'b1))begin
        _zz_1 = wb_we;
      end
    end
  end

  always @ (posedge clk or posedge reset) begin
    if (reset) begin
      ack <= 1'b0;
    end else begin
      ack <= 1'b0;
      if(_zz_2)begin
        ack <= 1'b1;
      end
    end
  end


endmodule

module MicroWire (
  input               we,
  input      [1:0]    adr,
  input      [7:0]    i_data,
  output reg [7:0]    o_data,
  input               si,
  output              so,
  output              soe,
  output              sc,
  output              cs_n,
  input               clk,
  input               reset
);
  wire                _zz_1;
  wire                _zz_2;
  wire                _zz_3;
  wire                _zz_4;
  wire                _zz_5;
  wire                _zz_6;
  wire                _zz_7;
  wire                _zz_8;
  wire                _zz_9;
  wire       [2:0]    _zz_10;
  wire       [2:0]    _zz_11;
  wire       [2:0]    _zz_12;
  wire       [2:0]    _zz_13;
  wire       [2:0]    _zz_14;
  reg        [7:0]    data;
  reg        [7:0]    status;
  reg                 prev_stb;
  reg        [15:0]   divider;
  reg        [15:0]   divider_counter;
  reg        [0:0]    clock_counter;
  reg        [2:0]    bit_counter;
  wire                cs;
  reg                 so_1;
  wire                fsm_wantExit;
  reg                 fsm_wantStart;
  reg        `fsm_enumDefinition_binary_sequential_type fsm_stateReg;
  reg        `fsm_enumDefinition_binary_sequential_type fsm_stateNext;
  `ifndef SYNTHESIS
  reg [111:0] fsm_stateReg_string;
  reg [111:0] fsm_stateNext_string;
  `endif


  assign _zz_1 = (((status[4] == 1'b1) && (prev_stb == 1'b0)) && (status[2] == 1'b0));
  assign _zz_2 = (status[0] == 1'b1);
  assign _zz_3 = (divider <= divider_counter);
  assign _zz_4 = (clock_counter == 1'b0);
  assign _zz_5 = (divider <= divider_counter);
  assign _zz_6 = (divider <= divider_counter);
  assign _zz_7 = (clock_counter == 1'b0);
  assign _zz_8 = (divider <= divider_counter);
  assign _zz_9 = (clock_counter == 1'b0);
  assign _zz_10 = (3'b111 - bit_counter);
  assign _zz_11 = (3'b111 - bit_counter);
  assign _zz_12 = (3'b111 - bit_counter);
  assign _zz_13 = (3'b111 - bit_counter);
  assign _zz_14 = (3'b111 - bit_counter);
  `ifndef SYNTHESIS
  always @(*) begin
    case(fsm_stateReg)
      `fsm_enumDefinition_binary_sequential_fsm_BOOT : fsm_stateReg_string = "fsm_BOOT      ";
      `fsm_enumDefinition_binary_sequential_fsm_Idle : fsm_stateReg_string = "fsm_Idle      ";
      `fsm_enumDefinition_binary_sequential_fsm_Send : fsm_stateReg_string = "fsm_Send      ";
      `fsm_enumDefinition_binary_sequential_fsm_SendFinish : fsm_stateReg_string = "fsm_SendFinish";
      `fsm_enumDefinition_binary_sequential_fsm_RecvFinish : fsm_stateReg_string = "fsm_RecvFinish";
      `fsm_enumDefinition_binary_sequential_fsm_Recv : fsm_stateReg_string = "fsm_Recv      ";
      default : fsm_stateReg_string = "??????????????";
    endcase
  end
  always @(*) begin
    case(fsm_stateNext)
      `fsm_enumDefinition_binary_sequential_fsm_BOOT : fsm_stateNext_string = "fsm_BOOT      ";
      `fsm_enumDefinition_binary_sequential_fsm_Idle : fsm_stateNext_string = "fsm_Idle      ";
      `fsm_enumDefinition_binary_sequential_fsm_Send : fsm_stateNext_string = "fsm_Send      ";
      `fsm_enumDefinition_binary_sequential_fsm_SendFinish : fsm_stateNext_string = "fsm_SendFinish";
      `fsm_enumDefinition_binary_sequential_fsm_RecvFinish : fsm_stateNext_string = "fsm_RecvFinish";
      `fsm_enumDefinition_binary_sequential_fsm_Recv : fsm_stateNext_string = "fsm_Recv      ";
      default : fsm_stateNext_string = "??????????????";
    endcase
  end
  `endif

  assign sc = clock_counter[0];
  assign soe = status[0];
  assign cs = 1'b1;
  assign cs_n = (! status[3]);
  assign so = so_1;
  always @ (*) begin
    case(adr)
      2'b00 : begin
        o_data = data;
      end
      2'b01 : begin
        o_data = status;
      end
      2'b10 : begin
        o_data = divider[7 : 0];
      end
      default : begin
        o_data = divider[15 : 8];
      end
    endcase
  end

  assign fsm_wantExit = 1'b0;
  always @ (*) begin
    fsm_wantStart = 1'b0;
    case(fsm_stateReg)
      `fsm_enumDefinition_binary_sequential_fsm_Idle : begin
      end
      `fsm_enumDefinition_binary_sequential_fsm_Send : begin
      end
      `fsm_enumDefinition_binary_sequential_fsm_SendFinish : begin
      end
      `fsm_enumDefinition_binary_sequential_fsm_RecvFinish : begin
      end
      `fsm_enumDefinition_binary_sequential_fsm_Recv : begin
      end
      default : begin
        fsm_wantStart = 1'b1;
      end
    endcase
  end

  always @ (*) begin
    fsm_stateNext = fsm_stateReg;
    case(fsm_stateReg)
      `fsm_enumDefinition_binary_sequential_fsm_Idle : begin
        if(_zz_1)begin
          if(_zz_2)begin
            fsm_stateNext = `fsm_enumDefinition_binary_sequential_fsm_Send;
          end else begin
            if((status[0] == 1'b0))begin
              fsm_stateNext = `fsm_enumDefinition_binary_sequential_fsm_Recv;
            end
          end
        end
      end
      `fsm_enumDefinition_binary_sequential_fsm_Send : begin
        if(_zz_3)begin
          if(_zz_4)begin
            if((bit_counter == 3'b111))begin
              fsm_stateNext = `fsm_enumDefinition_binary_sequential_fsm_SendFinish;
            end
          end
        end
      end
      `fsm_enumDefinition_binary_sequential_fsm_SendFinish : begin
        if(_zz_5)begin
          fsm_stateNext = `fsm_enumDefinition_binary_sequential_fsm_Idle;
        end
      end
      `fsm_enumDefinition_binary_sequential_fsm_RecvFinish : begin
        if(_zz_6)begin
          if(_zz_7)begin
            fsm_stateNext = `fsm_enumDefinition_binary_sequential_fsm_Idle;
          end
        end
      end
      `fsm_enumDefinition_binary_sequential_fsm_Recv : begin
        if(_zz_8)begin
          if(_zz_9)begin
            if((bit_counter == 3'b111))begin
              fsm_stateNext = `fsm_enumDefinition_binary_sequential_fsm_RecvFinish;
            end
          end
        end
      end
      default : begin
      end
    endcase
    if(fsm_wantStart)begin
      fsm_stateNext = `fsm_enumDefinition_binary_sequential_fsm_Idle;
    end
  end

  always @ (posedge clk or posedge reset) begin
    if (reset) begin
      data <= 8'h0;
      status <= 8'h0;
      prev_stb <= 1'b0;
      divider <= 16'h0;
      divider_counter <= 16'h0;
      clock_counter <= 1'b0;
      bit_counter <= 3'b000;
      so_1 <= 1'b0;
      fsm_stateReg <= `fsm_enumDefinition_binary_sequential_fsm_BOOT;
    end else begin
      prev_stb <= status[4];
      if((we == 1'b1))begin
        case(adr)
          2'b00 : begin
            data <= i_data;
          end
          2'b01 : begin
            status <= (i_data & 8'hfd);
          end
          2'b10 : begin
            divider[7 : 0] <= i_data;
          end
          default : begin
            divider[15 : 8] <= i_data;
          end
        endcase
      end
      fsm_stateReg <= fsm_stateNext;
      case(fsm_stateReg)
        `fsm_enumDefinition_binary_sequential_fsm_Idle : begin
          divider_counter <= 16'h0;
          bit_counter <= 3'b000;
          clock_counter <= 1'b0;
          if(_zz_1)begin
            status[1] <= 1'b1;
            if(_zz_2)begin
              so_1 <= data[_zz_10];
            end
          end
        end
        `fsm_enumDefinition_binary_sequential_fsm_Send : begin
          status[1] <= 1'b1;
          divider_counter <= (divider_counter + 16'h0001);
          if(_zz_3)begin
            clock_counter <= (clock_counter + 1'b1);
            divider_counter <= 16'h0;
            if((status[0] == 1'b1))begin
              so_1 <= data[_zz_11];
            end
            if(_zz_4)begin
              bit_counter <= (bit_counter + 3'b001);
              if((status[0] == 1'b0))begin
                data[_zz_12] <= si;
              end
            end
          end
        end
        `fsm_enumDefinition_binary_sequential_fsm_SendFinish : begin
          divider_counter <= (divider_counter + 16'h0001);
          if(_zz_5)begin
            divider_counter <= 16'h0;
            if((status[0] == 1'b1))begin
              so_1 <= data[_zz_13];
            end
            clock_counter <= 1'b0;
            status[2] <= 1'b1;
            status[1] <= 1'b0;
          end
        end
        `fsm_enumDefinition_binary_sequential_fsm_RecvFinish : begin
          divider_counter <= (divider_counter + 16'h0001);
          if(_zz_6)begin
            divider_counter <= 16'h0;
            clock_counter <= (clock_counter + 1'b1);
            if(_zz_7)begin
              clock_counter <= 1'b0;
              status[2] <= 1'b1;
              status[1] <= 1'b0;
            end
          end
        end
        `fsm_enumDefinition_binary_sequential_fsm_Recv : begin
          status[1] <= 1'b1;
          divider_counter <= (divider_counter + 16'h0001);
          if(_zz_8)begin
            clock_counter <= (clock_counter + 1'b1);
            divider_counter <= 16'h0;
            if(_zz_9)begin
              data[_zz_14] <= si;
              bit_counter <= (bit_counter + 3'b001);
            end
          end
        end
        default : begin
        end
      endcase
    end
  end


endmodule
