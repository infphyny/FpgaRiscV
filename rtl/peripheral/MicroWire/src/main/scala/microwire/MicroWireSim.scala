package microwire

import spinal.core._
import spinal.sim._
import spinal.core.sim._

import scala.util.Random


//MyTopLevel's testbench
object MicroWireSim {

  def main(args: Array[String]) {
    SimConfig.withWave.doSim(new MicroWire){dut =>
      //Fork a process to generate the reset and the clock on the dut
      dut.clockDomain.forkStimulus(period = 10)

      var send_data = 0xA5;
      var status = 0; //B"8'x00"

     def set_begin_transaction(stb : Boolean) : Unit = 
     {
        var l_status = 0; 

        if(stb == true)
        {
          dut.io.adr #= 1;
          dut.io.we #= false;
          dut.clockDomain.waitRisingEdge();
          dut.io.we #= true;
          l_status = dut.io.o_data.toInt;
          dut.io.i_data #= l_status | 0x10;
          dut.clockDomain.waitRisingEdge();
          dut.io.we #= false;
        }
        else
        {
          dut.io.adr #= 1;
          dut.io.we #= false;
          dut.clockDomain.waitRisingEdge();
          dut.io.we #= true;
          l_status = dut.io.o_data.toInt;
          dut.io.i_data #= l_status & ~0x10;
          dut.clockDomain.waitRisingEdge();
          dut.io.we #= false;
        }
     }


     def set_chip_select(cs : Boolean) : Unit = 
     {
        var l_status = 0; 

        if(cs == true)
        {
          dut.io.adr #= 1;
          dut.io.we #= false;
          dut.clockDomain.waitRisingEdge();
          dut.io.we #= true;
          l_status = dut.io.o_data.toInt;
          dut.io.i_data #= l_status | 0x08;
          dut.clockDomain.waitRisingEdge();
          dut.io.we #= false;
        }
        else
        {
          dut.io.adr #= 1;
          dut.io.we #= false;
          dut.clockDomain.waitRisingEdge();
          dut.io.we #= true;
          l_status = dut.io.o_data.toInt;
          dut.io.i_data #= l_status & ~0x08;
          dut.clockDomain.waitRisingEdge();
          dut.io.we #= false;
        }

     }


     def set_output_enable(oe : Boolean) : Unit = 
     {
       var l_status = 0; 
       if(oe == true) 
       {
        dut.io.adr #= 1;
        dut.io.we #= false;
        dut.clockDomain.waitRisingEdge();
        dut.io.we #= true;
        l_status = dut.io.o_data.toInt;
        dut.io.i_data #= l_status | 0x01;
        dut.clockDomain.waitRisingEdge();
         dut.io.we #= false;
       }else
       {
        dut.io.adr #= 1;
        dut.io.we #= false;
        dut.clockDomain.waitRisingEdge();
        dut.io.we #= true;
        l_status = dut.io.o_data.toInt;
        dut.io.i_data #= l_status & ~0x01;
        dut.clockDomain.waitRisingEdge();
         dut.io.we #= false;
       } 

     }

     def set_send_data(data : Int) : Unit =
    {
       dut.io.adr #= 0
       dut.io.we #= true 
       dut.io.i_data #= data 
       dut.clockDomain.waitRisingEdge()
       dut.io.we #= false
    }

     def reset_status_flag() : Unit = {
       dut.io.adr #= 1
       dut.io.we #= false 
       dut.clockDomain.waitRisingEdge()
       status = dut.io.o_data.toInt
       dut.io.we #= true
       dut.io.adr #= 1
       status = (status & ~0x04).toInt  
       dut.io.i_data #= status
       dut.clockDomain.waitRisingEdge()
       
     }

     def set_divider_low(divider : Int) : Unit = {

       dut.io.adr #=2
       dut.io.we #= true
       dut.io.i_data  #= divider
       dut.clockDomain.waitRisingEdge()
       dut.io.we #= false
     }
     
     def set_divider_high(divider : Int) : Unit = {
       dut.io.adr #=3
       dut.io.we #= true
       dut.io.i_data  #= divider
       dut.clockDomain.waitRisingEdge()
       dut.io.we #= false
     }



           
    //Initialize 
     for(idx <- 0 to 100)
     {
         dut.io.we #= false
      //  dut.io.sr #= false
        set_begin_transaction(false)
        dut.clockDomain.waitRisingEdge()
     }
     
        set_divider_low(4)
        set_output_enable(true)
        set_chip_select(true)
         set_begin_transaction(false) 
         dut.clockDomain.waitRisingEdge()
     //Prepare first byte to send
       dut.io.adr #= 0
        dut.io.we #= true
      //  dut.io.stb #= false
        dut.io.i_data #= send_data
          dut.clockDomain.waitRisingEdge()
           dut.io.we #= false
          
      for(idx <- 0 to 100)
      { 

      
        
        dut.clockDomain.waitRisingEdge()
     
      }
 
      set_begin_transaction(true)
     //Send first byte
      for(idx <- 0 to 100)
      {
      //  dut.io.cs #= false
       
      
       // dut.io.sr #= false
/*
         if(idx > 10 )
         {
          
         //  dut.io.stb #= false
         }
         */
         dut.clockDomain.waitRisingEdge()
         

      }
       //Prepare second byte to send 
       set_begin_transaction(false)
       set_send_data(0x00)
       reset_status_flag()
     
       dut.clockDomain.waitRisingEdge()
       set_chip_select(true)
       set_begin_transaction(true)
  
       //Send second byte
      for(idx <- 0 to 100 )
      {
        // dut.io.send_data #= send_data
       
        //dut.io.cs #= false
      
    //    dut.io.sr #= false
    /*
         if(idx > 10 )
          {
           
          }
*/
         dut.clockDomain.waitRisingEdge()


      }

       set_begin_transaction(false)
      set_output_enable(false) 
      reset_status_flag()
      set_begin_transaction(true)
  
     //Simulate reception of data
     var counter = 0
     var recv_data = 0x99 
     var previous_clk = dut.io.sc.toBoolean
     dut.io.si #= (((recv_data>>counter)&0x01) == 0x01)
     for(idx <- 0 to 99)
     {
        dut.io.si #= (((recv_data>>(7-counter))&0x01) == 0x01)
      //println("Clock tick")
        println("previous clock: " + previous_clk)
        println("current clock: " + dut.io.sc.toBoolean )
       if( (previous_clk == false)  &&  (dut.io.sc.toBoolean == true) )
       {
         println(counter)
        
         counter = counter+1
          
       }
        
      previous_clk = dut.io.sc.toBoolean
        dut.clockDomain.waitRisingEdge()
        set_begin_transaction(false)
        //dut.io.stb #= false
     }


     // dut.io.cs #= false
      set_chip_select(false)
      dut.clockDomain.waitRisingEdge()

      for(idx <- 0 to 99)
      {
          dut.clockDomain.waitRisingEdge()
      } 

      //for(idx <- 0 to 99){
        //Drive the dut inputs with random values
      //  dut.io.cond0 #= Random.nextBoolean()
      //  dut.io.cond1 #= Random.nextBoolean()

        //Wait a rising edge on the clock
       // dut.clockDomain.waitRisingEdge()

        //Check that the dut values match with the reference model ones
     //   val modelFlag = modelState == 0 || dut.io.cond1.toBoolean
      //  assert(dut.io.state.toInt == modelState)
      //  assert(dut.io.flag.toBoolean == modelFlag)

        //Update the reference model value
       // if(dut.io.cond0.toBoolean) {
        //  modelState = (modelState + 1) & 0xFF
       // }
      //}
    }
  }
}
