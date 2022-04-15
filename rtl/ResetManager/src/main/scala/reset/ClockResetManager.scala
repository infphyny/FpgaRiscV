/*
 * FpgaRiscV
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

package reset

import spinal.core._
import spinal.lib._


//Hardware definition
class ResetManager(cycle_delay_count : Int = 10000) extends Component {


  val io = new Bundle {
    val i_clock = in Bool()
    val i_reset = in Bool()
//    val i_cycle_delay = in UInt(cycle_delay_size bits) //Value must not change
    val o_global_reset = out Bool()

  }
noIoPrefix()



val mainClockDomain = ClockDomain(
  clock = io.i_clock,
  reset = io.i_reset,
  config = ClockDomainConfig(
    clockEdge = RISING,
    resetActiveLevel = HIGH,
    resetKind = ASYNC
  )
)


  val clockArea = new ClockingArea(mainClockDomain)
  {



      val reset = BufferCC(io.i_reset)
      val counter = Reg(UInt( log2Up(cycle_delay_count) bits) ) init(0)
      val global_reset = Reg(Bool()) init(False)
      io.o_global_reset := global_reset
        when(reset === False)
        {

          when(counter === cycle_delay_count-1)
          {
            global_reset := False
          }.otherwise
          {
            global_reset := True
            counter := counter + 1;
          }
        }.otherwise
        {
          counter := 0
          global_reset := True

        }

    }



}

//Generate the MyTopLevel's Verilog
object ResetManagerVerilog {
  def main(args: Array[String]) {
    SpinalConfig().withPrivateNamespace.generateVerilog(new ResetManager(cycle_delay_count = 10000))
  }
}
