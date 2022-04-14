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
class ResetManager(sim : Boolean) extends Component {
  val io = new Bundle {
    val i_clock = in Bool()
    val i_reset_n = in Bool()
    val o_global_reset = out Bool()

  }
noIoPrefix()

val generic = new Generic {
 val is_sim = ResetManager.this.sim
}

val mainClockDomain = ClockDomain(
  clock = io.i_clock,
  reset = io.i_reset_n,
  config = ClockDomainConfig(
    clockEdge = RISING,
    resetActiveLevel = LOW,
    resetKind = ASYNC
  )
)






  val clockArea = new ClockingArea(mainClockDomain)
  {
    if(generic.is_sim == false)
    {
      val RESET_DELAY = 30000;

      val reset = BufferCC(!io.i_reset_n)
      val counter = Reg(UInt(log2Up(30000) bits) ) init(0)
      val global_reset = Reg(Bool()) init(False)
      io.o_global_reset := global_reset
        when(reset === False)
        {

          when(counter === RESET_DELAY -1)
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

      }else
      {
        io.o_global_reset := !io.i_reset_n
      }
  }


}

//Generate the MyTopLevel's Verilog
object MyTopLevelVerilog {
  def main(args: Array[String]) {
    SpinalVerilog(new ResetManager(sim = false))
  }
}
