
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
    val wb_stb_i = in Bool
    val wb_cyc_i = in Bool

    val wb_we_i = in Bool
    val wb_ack_o = out Bool
   
    val wb_adr_i = in UInt(1 bits)
     
    val wb_dat_i = in Bits(8 bits) //input from cpu
    val wb_dat_o = out Bits(8 bits) //output to cpu

    val usb_clk_i = in Bool

    val usb_dat_i = in Bits(8 bits) //input from phy
    val usb_dat_o = out Bits(8 bits) //output to phy
    
    val usb_dir_i = in Bool
    val usb_fault_n_i = in Bool
    val usb_nxt_i = in Bool
    
    val usb_reset_n_o = out Bool
    val usb_stp_o = out Bool
    val usb_cs_o = out Bool
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
   io.wb_ack_o := ack

   when(ack === True)
   {
     ack := False
   }


   val tusb1210 = new TUSB1210
   
   tusb1210.io.clk   := ClockDomain.current.clock
   tusb1210.io.reset := ClockDomain.current.reset
    
   tusb1210.io.cpu_we_i  := False
   tusb1210.io.cpu_adr_i := io.wb_adr_i
   tusb1210.io.cpu_dat_i := io.wb_dat_i
  // tusb1210.io.cpu_stb_i := io.wb_stb_i
   //tusb1210.io.cpu_cyc_i := io.wb_cyc_i

   io.wb_dat_o           := tusb1210.io.cpu_dat_o
  
   tusb1210.io.usb_clk_i := io.usb_clk_i
   tusb1210.io.usb_dat_i := io.usb_dat_i

   tusb1210.io.usb_dir_i := io.usb_dir_i
   tusb1210.io.usb_fault_n_i := io.usb_fault_n_i
   tusb1210.io.usb_nxt_i := io.usb_nxt_i


   io.usb_dat_o     := tusb1210.io.usb_dat_o
   io.usb_reset_n_o := tusb1210.io.usb_reset_n_o
   io.usb_stp_o     := tusb1210.io.usb_reset_n_o
   io.usb_cs_o      := tusb1210.io.usb_cs_o



   when( (io.wb_stb_i === True) && (io.wb_cyc_i === True) && (ack === False) )
   {
       tusb1210.io.cpu_we_i  := io.wb_we_i
       ack := True
   } 


  }

}


object WishboneTUSB1210TopLevelVerilog {
  def main(args: Array[String]) {
    SpinalVerilog(new WishboneTUSB1210)
  }
}