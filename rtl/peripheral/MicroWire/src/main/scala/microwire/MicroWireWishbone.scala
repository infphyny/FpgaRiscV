package microwire

import spinal.core._
import spinal.lib._


class MicroWireWishbone extends Component
{
  
  val io = new Bundle
  {
      val wb_adr = in UInt(2 bits)
      val wb_data_i = in Bits(8 bits)
      val wb_data_o = out Bits(8 bits)
      val wb_we = in Bool
      val wb_stb = in Bool
      val wb_cyc = in Bool
      val wb_ack = out Bool
      val wb_err = out Bool
      val wb_rty = out Bool 

      val si = in Bool
      val so = out Bool
      val soe = out Bool
      val sc = out Bool
      val cs_n = out Bool
  }
   noIoPrefix
   
   val mw = new MicroWire
   val ack = Reg(Bool) init(False) 
   ack := False
   io.wb_err := False
   io.wb_rty := False
   
   mw.io.si := io.si
   io.so := mw.io.so
   io.soe := mw.io.soe
   io.sc := mw.io.sc
   io.cs_n := mw.io.cs_n
   
   io.wb_ack := ack
   mw.io.adr := io.wb_adr 
   io.wb_data_o := mw.io.o_data
   mw.io.we := False
   mw.io.i_data := io.wb_data_i 
  // 

   when(io.wb_cyc === True && io.wb_stb === True)
   {
        
       ack := True 
       when(io.wb_we === True)
       { 
         mw.io.we := io.wb_we  
       }

   } 

  
}

object MicroWireWishboneVerilog {
  def main(args: Array[String]) {
    SpinalVerilog(new MicroWireWishbone)
  }
}

