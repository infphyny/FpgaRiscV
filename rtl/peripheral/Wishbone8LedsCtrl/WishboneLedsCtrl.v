// Generator : SpinalHDL v1.4.3    git head : adf552d8f500e7419fff395b7049228e4bc5de26
// Component : WishboneLedsCtrl



module WishboneLedsCtrl (
  input      [0:0]    wb_adr_i,
  input      [7:0]    wb_dat_i,
  input               wb_we_i,
  input               wb_cyc_i,
  input               wb_stb_i,
  output reg [7:0]    wb_dat_o,
  output              wb_ack_o,
  output              wb_err_o,
  output              wb_rty_o,
  output     [7:0]    leds_o,
  input               clk,
  input               reset
);
  reg                 _zz_1;
  reg        [7:0]    _zz_2;
  wire       [7:0]    soc_leds_io_read_data;
  wire       [7:0]    soc_leds_io_leds_o;
  wire                _zz_3;
  wire                _zz_4;
  reg                 ack;

  assign _zz_3 = ((wb_stb_i == 1'b1) && (wb_cyc_i == 1'b1));
  assign _zz_4 = (wb_we_i == 1'b1);
  Leds soc_leds (
    .io_we            (_zz_1                       ), //i
    .io_adr           (wb_adr_i                    ), //i
    .io_write_data    (_zz_2[7:0]                  ), //i
    .io_read_data     (soc_leds_io_read_data[7:0]  ), //o
    .io_leds_o        (soc_leds_io_leds_o[7:0]     ), //o
    .clk              (clk                         ), //i
    .reset            (reset                       )  //i
  );
  always @ (*) begin
    _zz_1 = 1'b0;
    if(_zz_3)begin
      if(_zz_4)begin
        _zz_1 = wb_we_i;
      end
    end
  end

  always @ (*) begin
    _zz_2 = 8'h0;
    if(_zz_3)begin
      if(_zz_4)begin
        _zz_2 = wb_dat_i;
      end
    end
  end

  assign leds_o = (~ soc_leds_io_leds_o);
  assign wb_ack_o = ack;
  assign wb_err_o = 1'b0;
  assign wb_rty_o = 1'b0;
  always @ (*) begin
    wb_dat_o = 8'h0;
    if(_zz_3)begin
      if(! _zz_4) begin
        wb_dat_o = soc_leds_io_read_data;
      end
    end
  end

  always @ (posedge clk or posedge reset) begin
    if (reset) begin
      ack <= 1'b0;
    end else begin
      if(_zz_3)begin
        ack <= 1'b1;
      end
      if((ack == 1'b1))begin
        ack <= 1'b0;
      end
    end
  end


endmodule

module Leds (
  input               io_we,
  input      [0:0]    io_adr,
  input      [7:0]    io_write_data,
  output reg [7:0]    io_read_data,
  output reg [7:0]    io_leds_o,
  input               clk,
  input               reset
);
  reg        [7:0]    leds_1;
  reg        [0:0]    dir;
  reg        [7:0]    _zz_1;

  always @ (*) begin
    if((dir == 1'b0))begin
      io_leds_o = leds_1;
    end else begin
      io_leds_o = _zz_1;
    end
  end

  always @ (*) begin
    _zz_1[0] = leds_1[7];
    _zz_1[1] = leds_1[6];
    _zz_1[2] = leds_1[5];
    _zz_1[3] = leds_1[4];
    _zz_1[4] = leds_1[3];
    _zz_1[5] = leds_1[2];
    _zz_1[6] = leds_1[1];
    _zz_1[7] = leds_1[0];
  end

  always @ (*) begin
    case(io_adr)
      1'b0 : begin
        io_read_data = leds_1;
      end
      default : begin
        io_read_data = {7'h0,dir};
      end
    endcase
  end

  always @ (posedge clk or posedge reset) begin
    if (reset) begin
      leds_1 <= 8'h0;
      dir <= 1'b0;
    end else begin
      if((io_we == 1'b1))begin
        case(io_adr)
          1'b0 : begin
            leds_1 <= io_write_data;
          end
          default : begin
            dir <= io_write_data[0];
          end
        endcase
      end
    end
  end


endmodule
