
/*
 Wishbone bus interface to TUSB1210 module


*/



package usb

import spinal.core._
import spinal.lib._


class WishboneTUSB1210 extends Component
{
    val io = new Bundle
    {
    
    val clk = in Bool
    val reset = in Bool
    val i_wb_stb = in Bool
    val i_wb_cyc = in Bool

    val i_wb_we = in Bool
    val o_wb_ack = out Bool
   
    val i_wb_adr = in UInt(2 bits)
     
    val i_wb_dat = in Bits(8 bits) //input from cpu
    val o_wb_dat = out Bits(8 bits) //output to cpu

    val i_usb_clk = in Bool

    val i_ulpi_dat = in Bits(8 bits) //input from phy
    val o_ulpi_dat = out Bits(8 bits) //output to phy
    
    val i_ulpi_dir = in Bool
    val i_usb_fault_n = in Bool
    val i_ulpi_nxt = in Bool
    
    val o_ulpi_reset_n = out Bool
    val o_ulpi_stp = out Bool
    val o_ulpi_cs = out Bool
    }

  noIoPrefix

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

   val ack = Reg(Bool) init(False)
   io.o_wb_ack := ack

   when(ack === True)
   {
     ack := False
   }


   val tusb1210 = new TUSB1210
   
   tusb1210.io.clk   := ClockDomain.current.clock
   tusb1210.io.reset := ClockDomain.current.reset
    
   tusb1210.io.i_cpu_we  := False
   tusb1210.io.i_cpu_adr := io.i_wb_adr
   tusb1210.io.i_cpu_dat := io.i_wb_dat
  // tusb1210.io.cpu_stb_i := io.wb_stb_i
   //tusb1210.io.cpu_cyc_i := io.wb_cyc_i

   io.o_wb_dat           := tusb1210.io.o_cpu_dat
  
   tusb1210.io.i_usb_clk := io.i_usb_clk
   tusb1210.io.i_ulpi_dat := io.i_ulpi_dat

   tusb1210.io.i_ulpi_dir := io.i_ulpi_dir
   tusb1210.io.i_usb_fault_n := io.i_usb_fault_n
   tusb1210.io.i_ulpi_nxt := io.i_ulpi_nxt


   io.o_ulpi_dat     := tusb1210.io.o_ulpi_dat
   io.o_ulpi_reset_n := tusb1210.io.o_ulpi_reset_n
   io.o_ulpi_stp     := tusb1210.io.o_ulpi_stp
   io.o_ulpi_cs      := tusb1210.io.o_ulpi_cs



   when( (io.i_wb_stb === True) && (io.i_wb_cyc === True) && (ack === False) )
   {
       tusb1210.io.i_cpu_we  := io.i_wb_we
       ack := True 
   } 


  }

}


object WishboneTUSB1210TopLevelVerilog {
  def main(args: Array[String]) {
    SpinalVerilog(new WishboneTUSB1210).printPruned()
  }
}