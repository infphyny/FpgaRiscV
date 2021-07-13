package switch

import spinal.core._
import spinal.lib._
import spinal.core.sim._

object SwitchSim{
  def main(args : Array[String]){
    SimConfig.withWave.doSim(new Switch){ dut =>
      dut.clockDomain.forkStimulus(period = 10)

     dut.io.i_status_we #= false
     dut.io.i_status #= 0x00
     dut.io.i_switch #= false
     dut.clockDomain.waitRisingEdge()
     dut.io.i_status_we #= true
     dut.io.i_status #= 0x01 << 1 //Rising edge interrupt
     dut.io.i_switch #= false
     dut.clockDomain.waitRisingEdge()
      dut.io.i_status_we #= false
      dut.clockDomain.waitRisingEdge()
     dut.io.i_switch #= true

     for(i <- 0 until 10)
     {
       dut.clockDomain.waitRisingEdge()
     }
      dut.io.i_status_we #= true
      dut.io.i_status #= (0x03 << 1) | 0x10
      dut.clockDomain.waitRisingEdge()
      dut.clockDomain.waitRisingEdge()
      dut.clockDomain.waitRisingEdge()
      dut.io.i_status #= (0x03 << 1)
      dut.clockDomain.waitRisingEdge()
      dut.io.i_status_we #= false
      dut.io.i_switch #= false
     for(i <- 0 until 10)
     {
       dut.clockDomain.waitRisingEdge()
     }
    }
  }
}
