// Generator : SpinalHDL v1.4.3    git head : adf552d8f500e7419fff395b7049228e4bc5de26
// Component : Leds
// Git hash  : e03a66e8f94607b5b85df824187b35e3c8c2028f



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
