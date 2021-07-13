package switch

import spinal.core._
import spinal.lib._

class WishboneSwitch extends Component
{

   val io = new Bundle{
   val i_wb_stb = in Bool
   val i_wb_cyc = in Bool
   val i_wb_we = in Bool
   val i_wb_dat = in Bits(8 bits)
   val o_wb_dat = out Bits(8 bits)

   val o_wb_ack = out Bool
   val o_wb_rty = out Bool
   val o_wb_err = out Bool

   val i_switch = in Bool
   val o_int = out Bool
  }
noIoPrefix

 val sw = new Switch
 sw.io.i_switch := io.i_switch
 sw.io.i_status_we := False
 sw.io.i_status := io.i_wb_dat
 io.o_wb_dat := sw.io.o_status
 io.o_int := sw.io.o_int
 val ack = Reg(Bool) init(False)
 io.o_wb_ack := ack
 val cs = io.i_wb_cyc & io.i_wb_stb

 io.o_wb_rty := False
 io.o_wb_err := False


when(ack === True)
{
  ack := False
}

when(cs === True)
{
  ack := True
  when(io.i_wb_we === True)
  {
    sw.io.i_status_we := io.i_wb_we
    sw.io.i_status := io.i_wb_dat
  }
}

}


object WishboneSwitchVerilog {
  def main(args: Array[String]) {
    SpinalVerilog(new WishboneSwitch)
  }
}
