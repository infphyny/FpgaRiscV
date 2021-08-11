package avalon_clock_crossing_bridge

import spinal.core._
import spinal.sim._
import spinal.core.sim._

import scala.util.Random

//MyTopLevel's testbench

object MyTopLevelSim {
  def main(args: Array[String]) {

    
    SimConfig.withWave.doSim(new AvalonClockDomainCrossingBridge){
     
  
      dut =>
     
    val slaveClockThread = fork{
       //Fork a process to generate the reset and the clock on the dut
      dut.slave_clock.forkStimulus(20)
    //val clock = ClockDomain(dut.io.s0_clock, dut.io.s0_reset).forkStimulus(10)
     
      for(idx <- 0 to 99){
        //Drive the dut inputs with random values
       // dut.io.cond0 #= Random.nextBoolean()
       // dut.io.cond1 #= Random.nextBoolean()
      //  s0_read.valid := True
      //  s0_read.io.payload := True   
       // dut.io.s0_read := True
        dut.io.s0_read.valid #= true
        dut.io.s0_read.payload #= true  
        //Wait a rising edge on the clock
        dut.slave_clock.waitRisingEdge()
        
        dut.io.s0_read.valid #= true
        dut.io.s0_read.payload #= true  
        dut.slave_clock.waitRisingEdge()

                
      //  dut.ClockDomain.waitRisingEdge()

        //Check that the dut values match with the reference model ones
       // val modelFlag = modelState == 0 || dut.io.cond1.toBoolean
       // assert(dut.io.state.toInt == modelState)
       // assert(dut.io.flag.toBoolean == modelFlag)

        //Update the reference model value
       // if(dut.io.cond0.toBoolean) {
        //  modelState = (modelState + 1) & 0xFF
       // }
      }

    }
     

     val masterClockThread = fork{
    
      dut.master_clock.forkStimulus(7)

      for(idx <- 0 to 99)
      {
        dut.master_clock.waitRisingEdge()
      }
     

   }
   slaveClockThread.join()
   masterClockThread.join()

  }


   
     

    
  }
}
