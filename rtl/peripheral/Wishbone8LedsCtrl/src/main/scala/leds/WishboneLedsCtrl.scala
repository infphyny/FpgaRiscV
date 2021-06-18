package leds

import spinal.core._
import spinal.lib._


class WishboneLedsCtrl extends Component
{

  val io = new Bundle{


    val wb_adr_i = in UInt(1 bits)
    val wb_dat_i = in Bits(8 bits)
    val wb_we_i = in Bool
    val wb_cyc_i = in Bool
    val wb_stb_i = in Bool
//    val wb_cti_i = in UInt(3 bits)
//    val wb_bte_i = in UInt(2 bits)
    val wb_dat_o = out Bits(8 bits)
    val wb_ack_o = out Bool
    val wb_err_o = out Bool
    val wb_rty_o = out Bool


    val leds_o = out Bits(8 bits);

  }
  noIoPrefix

  val soc_leds = new leds.Leds()
  soc_leds.io.we := False
  soc_leds.io.write_data := 0
  io.leds_o := ~soc_leds.io.leds_o

  val ack = Reg(Bool) init(False)

  io.wb_ack_o := ack

  io.wb_err_o := False;
  io.wb_rty_o := False;

  io.wb_dat_o := 0;
  soc_leds.io.adr := io.wb_adr_i
  when( (io.wb_stb_i === True) && (io.wb_cyc_i === True) )
  {
    ack := True

    when(io.wb_we_i === True)
    {
      soc_leds.io.we := io.wb_we_i

      soc_leds.io.write_data := io.wb_dat_i

    }.otherwise
    {

      io.wb_dat_o := soc_leds.io.read_data;
    }

  }


  when(ack === True)
  {
    ack := False
  }

}


object WishboneLedsCtrlVerilog {
  def main(args: Array[String]) {
    SpinalVerilog(new WishboneLedsCtrl())
  }
}
