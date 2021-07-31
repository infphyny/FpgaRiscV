/*
 * Copyright (c) infphyny, All rights reserved.
 *
 *
 */


/*
   Description:
     Status flags:
     status(0) : usb_dir
     status(1) : usb_fault_n  
     status(2) : usb_nxt  
     status(3) : usb_rst_n
     status(4) : usb_cs
     status(7) : ulpi state machine error


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

    val i_cpu_we = in Bool
   
    val i_cpu_adr = in UInt(2 bits)
     
    val i_cpu_dat = in Bits(8 bits) //input from cpu
    val o_cpu_dat = out Bits(8 bits) //output to cpu

    val i_usb_clk = in Bool

    val i_ulpi_dat = in Bits(8 bits) //input from phy
    val o_ulpi_dat = out Bits(8 bits) //output to phy
    
    val i_ulpi_dir = in Bool
    val i_usb_fault_n = in Bool
    val i_ulpi_nxt = in Bool
    
    val o_ulpi_reset_n = out Bool
    val o_ulpi_stp = out Bool
    val o_ulpi_cs = out Bool
     
   // val reg_data_o = out Bits(8 bits)

  }
    
    
    //val rcv_wire = Bits(8 bits)
    val read_payload_wire = Bits(8 bits)
    val read_payload_valid_wire = Bool
    val write_payload_wire = Bits(8 bits)
    val write_payload_we_wire = Bool
    val write_payload_ack_wire = Bool
    //val cpu_send_cmd_wire = Bool
    val ulpi_error_wire = Bits(8 bits)


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
    val read_payload_cc_1 = RegNext(read_payload_wire) init(0) addTag(crossClockDomain)  
    val read_payload_cc_2 = RegNext(read_payload_cc_1) init(0) 
    val read_payload_valid_cc_1 = RegNext(read_payload_valid_wire) init(False) addTag(crossClockDomain)
    val read_payload_valid_cc_2 = RegNext(read_payload_valid_cc_1) init(False) 
    
    val write_payload = Reg(Bits(8 bits)) init(0)
    write_payload := write_payload
    write_payload_wire := write_payload
    val write_payload_we = Reg(Bool) init(False)
    write_payload_we := write_payload_we
    write_payload_we_wire := write_payload_we
    val write_payload_ack_cc_1 = RegNext(write_payload_ack_wire) init(False) addTag(crossClockDomain)
    val write_payload_ack_cc_2 = RegNext(write_payload_ack_cc_1) init(False)
    
    val ulpi_error_cc_1 = RegNext(ulpi_error_wire) init(0) addTag(crossClockDomain)
    val ulpi_error_cc_2 = RegNext(ulpi_error_cc_1) init(0) 

    val status = Reg(Bits(8 bits)) init(0) 
    //val error = Reg(Bits(8 bits)) init(0)
    
    
   // val send_cmd = Reg(Bool) init(False)
   // cpu_send_cmd_wire := send_cmd
   // val send_cmd_rst_counter = Reg(UInt(4 bits)) init(0)
    //send_cmd := False
    
   
   // status(7) :=   usb_ulpi_error_cc_2 


   // val rcv  = Reg(Bits(8 bits)) init(0)
    

    //val rcv_cc_1 = RegNext(rcv_wire) init(0) addTag(crossClockDomain)
    //val rcv_cc_2 = RegNext(rcv_cc_1) init(0)
   // rcv := rcv_cc_2
    //val status_rw = Reg(Bits(8 bits)) init(0)

    val ulpi_dir_cc_1 = RegNext(io.i_ulpi_dir) init(False)  addTag(crossClockDomain)
    val ulpi_dir_cc_2 = RegNext(ulpi_dir_cc_1) init(False)

    val usb_fault_n_cc_1 = RegNext(io.i_usb_fault_n) init(True)  addTag(crossClockDomain)
    val usb_fault_n_cc_2 = RegNext(usb_fault_n_cc_1) init(True)
    
    val ulpi_nxt_cc_1 = RegNext(io.i_ulpi_nxt) init(False)  addTag(crossClockDomain)
    val ulpi_nxt_cc_2 = RegNext(ulpi_nxt_cc_1) init(False)

    status(0) := ulpi_dir_cc_2
    status(1) := usb_fault_n_cc_2
    status(2) := ulpi_nxt_cc_2
    status(4 downto 3) := status(4 downto 3)
    status(6 downto 5) := B"2'b00" 

    io.o_ulpi_reset_n := status(3)
    io.o_ulpi_cs      := status(4)
    
   // io.usb_cs_o      := status(5)

    // 
   
   
  // rcv := io.usb_dat_i

 // when(send_cmd === True)
 // {
  //  send_cmd_rst_counter := send_cmd_rst_counter + 1
  //  when(send_cmd_rst_counter === U"4'b0100")
  //  {
   //   send_cmd := False
   // }
 // }//.otherwise
 // {
 //    send_cmd_rst_counter := 0
 // }

 
  when(write_payload_ack_cc_2 === True)
  {
    write_payload_we := False
  }


  when(io.i_cpu_we === True)
  {
    switch(io.i_cpu_adr)
    {
      is(0){ 
        write_payload := io.i_cpu_dat
        write_payload_we := True
        //send_cmd := True 
        }
      is(1){ status(4 downto 3) := io.i_cpu_dat(4 downto 3)   }
      default{
        write_payload_we := False
      } 
    }
  }

   switch(io.i_cpu_adr)
   {
     is(0){io.o_cpu_dat := read_payload_cc_2}
     is(1){io.o_cpu_dat := status}
     is(2){io.o_cpu_dat := ulpi_error_cc_2}
     default{
       io.o_cpu_dat := read_payload_cc_2
     }
    // default{io.cpu_dat_o := rcv}
   }


   }

   val usbClockDomain = ClockDomain(
     clock = io.i_usb_clk,
     reset = io.reset,
     config = ClockDomainConfig(
       clockEdge = RISING,
       resetKind = ASYNC,
       resetActiveLevel = HIGH
     )
   )

   val usbClockDomainArea = new ClockingArea(usbClockDomain)
   {
    
    val ulpi_ctrl = new UlpiCtrl
    read_payload_wire := ulpi_ctrl.io.o_read_payload
    read_payload_valid_wire := ulpi_ctrl.io.o_read_payload_valid
    ulpi_error_wire := ulpi_ctrl.io.o_error
    ulpi_ctrl.io.i_write_payload := write_payload_wire
    ulpi_ctrl.io.i_write_payload_we := write_payload_we_wire
    write_payload_ack_wire := ulpi_ctrl.io.o_write_payload_ack
    ulpi_ctrl.io.i_ulpi_dat := io.i_ulpi_dat
    io.o_ulpi_dat := ulpi_ctrl.io.o_ulpi_dat
    ulpi_ctrl.io.i_ulpi_dir := io.i_ulpi_dir
    ulpi_ctrl.io.i_ulpi_nxt := io.i_ulpi_nxt
    io.o_ulpi_stp := ulpi_ctrl.io.o_ulpi_stp
  
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