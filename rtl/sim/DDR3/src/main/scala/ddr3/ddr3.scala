/*
  DDR3 avalon bus simulation code to replace UniPhy ddr3 memory when simulating with verilog

  TODO implement byte enable
 */

package ddr3_sim

import spinal.core._
import spinal.lib._



//Hardware definition
class DDR3Sim extends Component {
  val WORDS_COUNT = 67108864
  val io = new Bundle {
    val avl_ready = out Bool()
    val avl_burst_begin = in Bool()
    val avl_rdata_valid = out Bool()
    val avl_addr = in UInt(log2Up(WORDS_COUNT) bits)
    val avl_rdata = out Bits(64 bits)
    val avl_wdata = in Bits(64 bits)
    val avl_be = in Bits(8 bits)
    val avl_read_req = in Bool()
    val avl_write_req = in Bool()
    val avl_size = in UInt(3 bits) 
    val local_init_done = out Bool()
    val local_cal_success = out Bool()
  }
 
  noIoPrefix
 val ram0 = Mem(Bits(8 bits),WORDS_COUNT)
 val ram1 = Mem(Bits(8 bits),WORDS_COUNT)
 val ram2 = Mem(Bits(8 bits),WORDS_COUNT)
 val ram3 = Mem(Bits(8 bits),WORDS_COUNT)
 val ram4 = Mem(Bits(8 bits),WORDS_COUNT)
 val ram5 = Mem(Bits(8 bits),WORDS_COUNT)
 val ram6 = Mem(Bits(8 bits),WORDS_COUNT)
 val ram7 = Mem(Bits(8 bits),WORDS_COUNT)
 //val ram = Mem(Bits(64 bits),WORDS_COUNT)
 val rdata_valid = Reg(Bool()) init False
 //val rdata = Reg(Bits(64 bits)) init 0
// val wdata = RegNext(io.avl_wdata) init 0
// io.avl_rdata := rdata
 
 io.local_init_done := True;
 io.local_cal_success := True;

 io.avl_rdata_valid := rdata_valid
 //rdata_valid := False

 when(rdata_valid === True)
 {
   rdata_valid := False;
 }

 io.avl_ready := True

 //io.avl_rdata_valid := False

 //readAsync, since is only for simulation this is okay, otherwise not inferred as bram on fpga
 //need to check timing of signals with wb_avl_bridge
 //io.avl_rdata := ram.readAsync(io.avl_addr) 
  io.avl_rdata := ram7.readSync(io.avl_addr,io.avl_read_req) ## ram6.readSync(io.avl_addr,io.avl_read_req) ##
                  ram5.readSync(io.avl_addr,io.avl_read_req) ## ram4.readSync(io.avl_addr,io.avl_read_req) ##
                  ram3.readSync(io.avl_addr,io.avl_read_req) ## ram2.readSync(io.avl_addr,io.avl_read_req)  ##  
                  ram1.readSync(io.avl_addr,io.avl_read_req) ## ram0.readSync(io.avl_addr,io.avl_read_req)
  when(io.avl_write_req === True)
  {
    when(io.avl_be(0)){ram0(io.avl_addr) := io.avl_wdata(7 downto 0)}
    when(io.avl_be(1)){ram1(io.avl_addr) := io.avl_wdata(15 downto 8)}
    when(io.avl_be(2)){ram2(io.avl_addr) := io.avl_wdata(23 downto 16)}
    when(io.avl_be(3)){ram3(io.avl_addr) := io.avl_wdata(31 downto 24)}
    when(io.avl_be(4)){ram4(io.avl_addr) := io.avl_wdata(39 downto 32)}
    when(io.avl_be(5)){ram5(io.avl_addr) := io.avl_wdata(47 downto 40)}
    when(io.avl_be(6)){ram6(io.avl_addr) := io.avl_wdata(55 downto 48)}
    when(io.avl_be(7)){ram7(io.avl_addr) := io.avl_wdata(63 downto 56)}
  }
   
  when(io.avl_read_req === True)
  {
    rdata_valid := True
     //io.avl_rdata_valid := True
    //io.avl_rdata := ram.readAsync(io.avl_addr)
 //  rdata := ram.readSync(io.avl_addr,io.avl_read_req)
  }



}


//Generate the MyTopLevel's Verilog
object DDR3SimVerilog {
  def main(args: Array[String]) {
    SpinalConfig().withPrivateNamespace.generateVerilog(new DDR3Sim).printPruned()
 //   SpinalVerilog(new AvalonClockDomainCrossingBridge).printPruned()
  }
}