/*
 * SpinalHDL
 * Copyright (c) Dolu, All rights reserved.
 *
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

package rep

import spinal.core._
import spinal.lib._

//import scala.util.Random

//Hardware definition
class RisingEdgePulse extends Component {
  val io = new Bundle {
   val  i_signal = in Bool()
   val o_pulse = out Bool() 
  }
  noIoPrefix
  val previous_signal = RegNext(io.i_signal)
  val rep = Reg(Bool()) init(False) 
  rep := False
  io.o_pulse := rep

  when( (previous_signal === False) && io.i_signal === True)
  {
    rep := True
  }
  


}


//Generate the MyTopLevel's Verilog
object DDR3SimVerilog {
  def main(args: Array[String]) {
    SpinalConfig().withPrivateNamespace.generateVerilog(new RisingEdgePulse).printPruned()
 //   SpinalVerilog(new AvalonClockDomainCrossingBridge).printPruned()
  }
}