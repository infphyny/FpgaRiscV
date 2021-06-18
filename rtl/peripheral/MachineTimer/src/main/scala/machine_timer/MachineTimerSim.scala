package machine_timer

import spinal.core._
import spinal.sim._
import spinal.core.sim._

import scala.util.Random


//MyTopLevel's testbench
object MAchineTimerSim {
  def main(args: Array[String]) {
    SimConfig.withWave.doSim(new MachineTimer){dut =>
      //Fork a process to generate the reset and the clock on the dut
      dut.clockDomain.forkStimulus(period = 10)

      dut.io.mtime_we_h #= false
      dut.io.mtime_we_l #= false

      dut.io.mtimecmp_we_l #= true
      dut.io.mtimecmp_we_h #= false
      dut.io.mtimecmp_write_l #= 10
      dut.io.status_we #= true
      dut.io.status_write #= Integer.parseInt("00000010", 2)
      //dut.io.mTimeInterruptClear #= true

      dut.clockDomain.waitRisingEdge()
        dut.io.mtimecmp_we_l #= false
          dut.io.status_we #= false
      //  dut.io.mTimeInterruptClear #= false
        dut.clockDomain.waitRisingEdge()
      for(i <- 0  to 40)
      {
      dut.clockDomain.waitRisingEdge()
      if(dut.io.mTimeInterrupt.toBoolean == true)
      {
        dut.io.status_we #= true
        dut.io.status_write #=Integer.parseInt("00000010", 2)
        //dut.io.mTimeInterruptClear #= true
      }
     else
       {
           dut.io.status_we #= false
      //   dut.io.mTimeInterruptClear #= false
       }

    }
    //  var modelState = 0
      for(idx <- 0 to 99){
        //Drive the dut inputs with random values
        //dut.io.cond0 #= Random.nextBoolean()
        //dut.io.cond1 #= Random.nextBoolean()

        //Wait a rising edge on the clock
        dut.clockDomain.waitRisingEdge()

        //Check that the dut values match with the reference model ones
      //  val modelFlag = modelState == 0 || dut.io.cond1.toBoolean
    //    assert(dut.io.state.toInt == modelState)
    //    assert(dut.io.flag.toBoolean == modelFlag)

        //Update the reference model value
    //    if(dut.io.cond0.toBoolean) {
    //      modelState = (modelState + 1) & 0xFF
    //    }
      }
    }
  }
}
