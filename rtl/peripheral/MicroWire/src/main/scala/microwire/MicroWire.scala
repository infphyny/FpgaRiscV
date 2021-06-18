/*
 * infphyny
 * 
 * TODO: check Send state machine maybe an extra bit is sent.
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

package microwire

import spinal.core._
import spinal.lib._
import spinal.lib.fsm._


//Hardware definition
class MicroWire extends Component {
  val io = new Bundle {
    
    //val divider = in UInt(32 bits)
    
    val we = in Bool()
    val adr = in UInt(2 bits)
    val i_data = in Bits(8 bits)
    val o_data = out Bits(8 bits)

   // val ack = out Bool()

  //  val stb = in Bool
    
    //val cs = in Bool

    //val sr = in Bool  //Send or receive 
    val si = in Bool  // Serial in
    val so = out Bool //Serial out
    val soe = out Bool //Serial output enable
    val sc = out Bool   //Serial clock 
    val cs_n = out Bool //chip select

  }
   noIoPrefix()
   //Status   
   // bit 0 : 0 = recv data  1 : send data  
   // bit 1 : Busy flag 
   // bit 2 : Data ready receive, or end of transmission
   // bit 3 : Chip select
   // bit 4 : Activate transmission or reception

   val data = Reg(Bits(8 bits)) init(0)
   val status = Reg(Bits(8 bits)) init(0)
 
   
   //val ack = Reg(Bool) init(False)
   //ack := False
   //io.ack :=  ack
   

       
     
  // io.send_rdy := send_rdy
   val prev_stb = Reg(Bool) init(False)
   prev_stb :=  status(4)//io.stb

    
   val divider = Reg(UInt(16 bits)) init(0) 
   val divider_counter = Reg(UInt(16 bits)) init(0)

   val clock_counter = Reg(UInt(1 bits)) init(0) 
   io.sc := clock_counter.asBool
   
   io.soe := status(0)
   
   val bit_counter = Reg(UInt( log2Up(8) bits )) init(0)
   
   //val sc = Reg(Bool) init(True)
   

  // val cs = Reg(Bool) init(True) //Chip select
   io.cs_n := ~status(3)  
   //cs := ~status(3)  //cs
   //io.cs_n := cs;
   val so = Reg(Bool) init(False) // Serial out
   io.so := so

   
   // Get or Set data register, status register, divider 
   
    when(io.we === True)
    {

      switch(io.adr)
      {
        is(0){data := io.i_data }
        is(1){status := io.i_data &0xFD} //Don't overwrite the busy flag
        is(2){divider(7 downto 0) := io.i_data.asUInt}
        is(3){divider(15 downto 8) := io.i_data.asUInt}
      }

    }

    switch(io.adr)
    {
      is(0){io.o_data := data}
      is(1){io.o_data := status}
      is(2){io.o_data := divider(7 downto 0).asBits}
      is(3){io.o_data := divider(15 downto 8).asBits}
    }




   ///Send receive state machine

   val fsm = new StateMachine{
    
    val Idle = new State with EntryPoint
    val Send = new State
    val SendFinish = new State
    val RecvFinish =  new State
    //val trans = new State
    val Recv = new State
  

    //cs := io.cs
    

    Idle.whenIsActive
    {
      divider_counter := 0
    
      bit_counter := 0
      clock_counter := 0
      
       when((status(4) === True && prev_stb === False) && status(2) === False)
       {
         status(1) := True //Set busy flag
         
        when(status(0) === True)//Write
        {
        // cs := False
          
           so := data(7-bit_counter)
           
           goto(Send)
        //}
        }.elsewhen(status(0) === False)//Read
        {
        //  soe := False 
         //  clock_counter := clock_counter + 1;
          // when (clock_counter === 1)
          // {
            // data(7-bit_counter) := io.si
             goto(Recv)
         
          // }
        }
       }
      
    }

    Send.whenIsActive
    {
      status(1) := True //set busy flag
      //cs := False
     
     
     
      divider_counter := divider_counter + 1
      when(divider_counter >= divider)
      {
        clock_counter := clock_counter + 1
        divider_counter := 0
       // when(status(0) === True)
       // {
         so := data(7-bit_counter)
       // }

      when(clock_counter === 0)
      {  
        bit_counter := bit_counter + 1
     
        when(bit_counter === 7 )
        {
          goto(SendFinish)
        }
      }
      }
      
    } 


   SendFinish.whenIsActive{
     
    // ack := True
     
     
     divider_counter := divider_counter + 1
      when(divider_counter >= divider)
      {
       
       // clock_counter := clock_counter + 1
        divider_counter := 0
     
       // when(clock_counter === 1)
        //{
      //   when(status(0) === True)
       // {
         //soe := True
         so := data(7-bit_counter)
       // }
            
         clock_counter := 0
        status(2) := True // Set data send/receive flag  
        status(1) := False // Unset busy flag
      //  }
        goto(Idle)
      }
   }

    
    Recv.whenIsActive
    {
    status(1) := True //set busy flag
      //cs := False
     
      divider_counter := divider_counter + 1
      when(divider_counter >= divider)
      {
        clock_counter := clock_counter + 1
        divider_counter := 0
         
        
      when(clock_counter === 0)
      {  
        data(7-bit_counter) := io.si
        bit_counter := bit_counter + 1
        
        when(bit_counter === 7 )
        {
          //clock_counter := 0;
          goto(RecvFinish)
        }
      }
      }
    }

   RecvFinish.whenIsActive{
     
     divider_counter := divider_counter + 1
      when(divider_counter >= divider)
      {   
        divider_counter := 0;
        clock_counter := clock_counter + 1
        
         when(clock_counter === 0)
         {  
             clock_counter := 0;
               status(2) := True // Set data send/receive flag  
               status(1) := False // Unset busy flag
            // data(0) := io.si  
             goto(Idle);  
         } 

      }  
   }

   }



}

//Generate the MyTopLevel's Verilog
object MicroWireVerilog {
  def main(args: Array[String]) {
    SpinalVerilog(new MicroWire)
  }
}

//Generate the MyTopLevel's VHDL
/*
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