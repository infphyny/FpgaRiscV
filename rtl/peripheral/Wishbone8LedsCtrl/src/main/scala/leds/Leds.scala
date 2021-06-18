/*
 * Register adr 0 : leds value
 *          adr 1 : leds direction 
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 3.0 of the License, or (at your option) any later version.
 *
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public
 * License along with this library.
 */

package leds

import spinal.core._
import spinal.lib._

//import scala.util.Random

//Hardware definition
class Leds extends Component {
  val io = new Bundle {
//    val clk = in Bool
//    val rst = in Bool
    val we = in Bool
    val adr = in UInt(1 bits)
    val write_data = in Bits(8 bits)
    val read_data = out Bits(8 bits)
    val leds_o = out Bits(8 bits)
  //  val read_dir = out UInt(1 bits)
  //  val write_dir = in UInt(1 bits)
  }
//  noIOPrefix()
  val leds = Reg(Bits(8 bits)) init(0)
  val dir = Reg(UInt(1 bits)) init(0)


  when(dir === 0 )
  {
  io.leds_o := leds
}.otherwise
{
  io.leds_o := Reverse(leds)
}
  when(io.we === True)
  {
    switch(io.adr)
    {

    is (0) {leds := io.write_data}
    is(1){ dir  := io.write_data(0).asUInt}
    }
  }

   switch(io.adr)
   {
    is(0) {io.read_data := leds}
    is(1) {io.read_data := B"7'b0000000" ## dir.asBits}
   }

}



//Generate the MyTopLevel's Verilog
object MyTopLevelVerilog {
  def main(args: Array[String]) {
    SpinalVerilog(new Leds())
  }
}

/*
//Generate the MyTopLevel's VHDL
object MyTopLevelVhdl {
  def main(args: Array[String]) {
    SpinalVhdl(new MyTopLevel)
  }
}


//Define a custom SpinalHDL configuration with synchronous reset instead of the default asynchronous one. This configuration can be resued everywhere
object MySpinalConfig extends SpinalConfig(defaultConfigForClockDomains = ClockDomainConfig(resetKind = SYNC))

//Generate the MyTopLevel's Verilog using the above custom configuration.
object MyTopLevelVerilogWithCustomConfig {
  def main(args: Array[String]) {
    MySpinalConfig.generateVerilog(new MyTopLevel)
  }
}
*/
