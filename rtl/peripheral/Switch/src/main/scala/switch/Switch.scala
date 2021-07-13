/*
 *
 * Copyright (c) infphyny, All rights reserved.
 * Need debounce
 *
   8 bits status register
   Bit 4 clear_interrupt  auto toggle off
   Bit 3 interrupt
   Bits 2-1  0 0 no interrupt
             0 1 rising edge
             1 0 falling edge
             1 1 rising and falling edge

 */

package switch

import spinal.core._
import spinal.lib._

//import scala.util.Random

//Hardware definition
class Switch extends Component {
  val io = new Bundle {
    val i_status_we = in Bool
    val i_status = in Bits(8 bits)
    val o_status = out Bits(8 bits)
    val i_switch = in Bool
    val o_int = out Bool
  }
  //val counter = Reg(UInt(8 bits)) init(0)
 val SLOW_CLOCK_COUNTER_MAX = 75000/2

 val slow_clock = Reg(Bool) init(False)
 val counter = Reg(UInt(log2Up(SLOW_CLOCK_COUNTER_MAX)bits)) init(0)

 counter := counter + 1

 when(counter === SLOW_CLOCK_COUNTER_MAX-1)
 {
   counter := 0 
   slow_clock := ~slow_clock
 }

 
 val status = Reg(Bits(8 bits)) init(0) addTag(crossClockDomain)
 //status(0) := io.i_switch
 //val switch_prev = status(0) //Buton value//Reg(Bool) init(switch)
 val int = status(3) // Reg(Bool) init(False)
 val clear_interrupt = status(4)
 val interrupt_select = status(2 downto 1)

 val cc_int = Bool
 val cc_switch_buf2 = Bool

 

 io.o_int := int
 io.o_status := status
 

 when(clear_interrupt === True)
 {
   clear_interrupt := False
 }

 when(io.i_status_we)
 {
   status(7 downto 5) := 0
   clear_interrupt := io.i_status(4)
   status(2 downto 1) :=  io.i_status(2 downto 1)
   //status(0) := io.i_status(0)
 }


 val slow_clock_domain = ClockDomain(
   clock = slow_clock,
   reset = ClockDomain.current.reset,
   config = ClockDomainConfig(
     clockEdge = RISING,
     resetKind = ASYNC,
     resetActiveLevel = HIGH
   )
 )

 val slow_clock_area = new ClockingArea(slow_clock_domain)
 {



   val s_switch_buf = RegNext(io.i_switch) init(False) addTag(crossClockDomain)
   val s_switch_buf2 = RegNext( s_switch_buf) init(False)
    cc_switch_buf2 := s_switch_buf2

  //val s_int_buf = RegNext(int) init(False).addTag(crossClockDomain)
  //val s_int_buf2 = RegNext(s_int_buf) init(False)

 // val s_clear_interrupt_buf = RegNext(clear_interrupt)  init(False) addTag(crossClockDomain)
 // val s_clear_interrupt_buf2 = RegNext(s_clear_interrupt_buf)  init(False)

  val o_int = Reg(Bool) init(False)
  cc_int := o_int
    switch(interrupt_select)
    {
      is(0)
      {
        o_int := False
      }
      is(1) //Interrupt on rising edge
      {
        o_int := ( !s_switch_buf2 & s_switch_buf /*& !s_int_buf2  | s_int_buf2*/) //& !s_clear_interrupt_buf2
      }
      is(2) //Interrupt on falling edge
      {
        o_int := ( s_switch_buf2 & !s_switch_buf /*& !s_int_buf2 | s_int_buf2*/) //& !s_clear_interrupt_buf2
      }
      is(3) //Interrupt on rising edge and falling edge
      {
        o_int :=  (!s_switch_buf2 & s_switch_buf /*& !s_int_buf2 |*/ | s_switch_buf2 & !s_switch_buf /*& !s_int_buf2 | s_int_buf2*/) //& !s_clear_interrupt_buf2
      }
      /*
      default
      {
        o_int := False
      }
*/
    }

   

  //  val  switch_status_buf = Reg(cc_switch_buf2) init(False).addTag(crossClockDomain)
  //  status(0) := switch_status_buf


   //val switch_cur_state = Reg(Bool) init(status(0))

   
   //val switch_cur_state = Reg()

 }
 
 val o_cc_switch_buf = RegNext(cc_switch_buf2) init(False) addTag(crossClockDomain)
 val o_cc_switch_buf2 = RegNext(o_cc_switch_buf) init(False)
    status(0) := o_cc_switch_buf2
 val o_cc_int_buf = RegNext(cc_int) init(False) addTag(crossClockDomain)
 val o_cc_int_buf2 = RegNext(o_cc_int_buf) init(False)
    int := o_cc_int_buf2

}

//Generate the MyTopLevel's Verilog
object SwitchVerilog {
  def main(args: Array[String]) {
    SpinalVerilog(new Switch).printPruned()
  }
}
//
// //Generate the MyTopLevel's VHDL
// object MyTopLevelVhdl {
//   def main(args: Array[String]) {
//     SpinalVhdl(new MyTopLevel)
//   }
// }
//
//
// //Define a custom SpinalHDL configuration with synchronous reset instead of the default asynchronous one. This configuration can be resued everywhere
// object MySpinalConfig extends SpinalConfig(defaultConfigForClockDomains = ClockDomainConfig(resetKind = SYNC))
//
// //Generate the MyTopLevel's Verilog using the above custom configuration.
// object MyTopLevelVerilogWithCustomConfig {
//   def main(args: Array[String]) {
//     MySpinalConfig.generateVerilog(new MyTopLevel)
//   }
// }
