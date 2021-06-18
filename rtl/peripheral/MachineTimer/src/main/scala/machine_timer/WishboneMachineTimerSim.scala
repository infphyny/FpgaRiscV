package machine_timer

import spinal.core._
import spinal.sim._
import spinal.core.sim._

import scala.util.Random


object WishboneMachineTimerSim {
  def main(args:Array[String]){
    SimConfig.withWave.doSim(new WishboneMachineTimer){ dut =>
      dut.clockDomain.forkStimulus(period = 10)


      dut.io.wb_adr_i #= 0
      dut.io.wb_dat_i #= 0
      dut.io.wb_we_i #= true
      dut.io.wb_cyc_i #= true
      dut.io.wb_stb_i #= true

      dut.clockDomain.waitRisingEdge()
      dut.io.wb_we_i #= false
      dut.io.wb_cyc_i #= false
      dut.io.wb_stb_i #= false

        dut.clockDomain.waitRisingEdge()
       dut.clockDomain.waitRisingEdge()



      dut.io.wb_adr_i #= 4
      dut.io.wb_dat_i #= 0
      dut.io.wb_we_i #= true
      dut.io.wb_cyc_i #= true
      dut.io.wb_stb_i #= true

      dut.clockDomain.waitRisingEdge()
      dut.io.wb_we_i #= false
      dut.io.wb_cyc_i #= false
      dut.io.wb_stb_i #= false

        dut.clockDomain.waitRisingEdge()
       dut.clockDomain.waitRisingEdge()

      dut.io.wb_adr_i #= 8
      dut.io.wb_dat_i #= 10
      dut.io.wb_we_i #= true
      dut.io.wb_cyc_i #= true
      dut.io.wb_stb_i #= true

      dut.clockDomain.waitRisingEdge()
      dut.io.wb_we_i #= false
      dut.io.wb_cyc_i #= false
      dut.io.wb_stb_i #= false



      dut.clockDomain.waitRisingEdge()
      dut.clockDomain.waitRisingEdge()

      dut.io.wb_adr_i #= 16
      dut.io.wb_dat_i #= 0x02
      dut.io.wb_we_i #= true
      dut.io.wb_cyc_i #= true
      dut.io.wb_stb_i #= true

      dut.clockDomain.waitRisingEdge()
      dut.io.wb_we_i #= false
      dut.io.wb_cyc_i #= false
      dut.io.wb_stb_i #= false

      for(i <- 0 until 100)
      {
        dut.clockDomain.waitRisingEdge()
      }

    }
  }
}
