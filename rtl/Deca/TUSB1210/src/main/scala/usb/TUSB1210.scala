/*
 * Copyright (c) infphyny, All rights reserved.
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


/*
  ULPI interface 
  Documentation: ULPI_1v_1.pdf 
  Read register sequence p.38
*/


package usb

import spinal.core._
import spinal.lib._
import spinal.lib.fsm._



//Hardware definition
class TUSB1210 extends Component {
  val io = new Bundle {
    
    val clk = in Bool 
    val reset = in Bool

    val cpu_we_i = in Bool
   
    val cpu_adr_i = in UInt(1 bits)
     
    val cpu_dat_i = in Bits(8 bits) //input from cpu
    val cpu_dat_o = out Bits(8 bits) //output to cpu

    val usb_clk_i = in Bool

    val usb_dat_i = in Bits(8 bits) //input from phy
    val usb_dat_o = out Bits(8 bits) //output to phy
    
    val usb_dir_i = in Bool
    val usb_fault_n_i = in Bool
    val usb_nxt_i = in Bool
    
    val usb_reset_n_o = out Bool
    val usb_stp_o = out Bool
    val usb_cs_o = out Bool
     
   // val reg_data_o = out Bits(8 bits)

  }
   
    val usb_dir = Bool
    val usb_fault_n = Bool
    val usb_nxt = Bool

    val rcv_wire = Bits(8 bits)
    //rcv_wire := 0 


   val cpuClockDomain = ClockDomain(
     clock = io.clk,
     reset = io.reset,
     config = ClockDomainConfig(
       clockEdge = RISING,
       resetKind = ASYNC,
       resetActiveLevel = HIGH
     )
   )
   

   val cpuClockDomainArea = new ClockingArea(cpuClockDomain)
   {
    val send = Reg(Bits(8 bits)) init(0)
    val rcv  = Reg(Bits(8 bits)) init(0)
    val status = Reg(Bits(8 bits)) init(0)

    rcv := rcv_wire
    //val status_rw = Reg(Bits(8 bits)) init(0)

    status(0) := usb_dir
    status(1) := usb_fault_n
    status(2) := usb_nxt
    status(5 downto 3) := status(5 downto 3)
    status(7 downto 6) := B"2'b00" 

    io.usb_reset_n_o := status(3)
    io.usb_stp_o     := status(4)
    io.usb_cs_o      := status(5)

     io.usb_dat_o := 0
   
   
  // rcv := io.usb_dat_i

  when(io.cpu_we_i === True)
  {
    switch(io.cpu_adr_i)
    {
      is(0){ send := io.cpu_dat_i }
      is(1){ status(5 downto 3) := io.cpu_dat_i(5 downto 3)   }
    }
  }

   switch(io.cpu_adr_i)
   {
     is(0){io.cpu_dat_o := rcv}
     is(1){io.cpu_dat_o := status}
    // default{io.cpu_dat_o := rcv}
   }


   }

   val usbClockDomain = ClockDomain(
     clock = io.usb_clk_i,
     reset = io.reset,
     config = ClockDomainConfig(
       clockEdge = RISING,
       resetKind = ASYNC,
       resetActiveLevel = HIGH
     )
   )

   val usbClockDomainArea = new ClockingArea(usbClockDomain)
   {
     
     val rcv_cc = Reg(Bits(8 bits)).addTag(crossClockDomain) init(0)
     rcv_cc := rcv_cc
     rcv_wire := rcv_cc
     usb_dir := io.usb_dir_i
     usb_fault_n := io.usb_fault_n_i
     usb_nxt := io.usb_nxt_i

      def RegReadFsm() = new StateMachine
      {
         val SendCmd :  State = new State with EntryPoint
         {
           whenIsActive{
            when(io.usb_nxt_i === True)
            {
                goto(TurnAround_1)
            }
          }
         }


         val TurnAround_1:  State = new State{
           whenIsActive{
           goto(ReadData)
           } 
         }
         val ReadData: State =  new State{
           whenIsActive{
           rcv_cc := io.usb_dat_i  
           goto(TurnAround_2)
           } 
         }

         val TurnAround_2:  State = new State{

           whenIsActive{
           exit() 
           }
         }
           
      }


     val ulpi_fsm = new StateMachine{

       val Idle:  State = new State with EntryPoint
       {
         whenIsActive{


         goto(RegRead)
         } 
       }
       val RegRead :  State = new StateFsm(fsm = RegReadFsm())
       {
          whenCompleted(goto(Idle))
       }
       val RegWrite :  State = new State
       {

       }
       val UsbRx:  State = new State
       {

       }

       val UsbTx:  State = new State
       {

       }

     }
     
    
   }
   
   

   
  
   

 /*
   when((io.dir === False))//Can write to 
   {
   
     
     

   }.elsewhen(io.dir === True)
   {

   }
   
*/

}

//Generate the MyTopLevel's Verilog
object TUSB1210TopLevelVerilog {
  def main(args: Array[String]) {
    SpinalVerilog(new TUSB1210)
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
}*/