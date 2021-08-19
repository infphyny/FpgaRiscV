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
  }
 
  noIoPrefix
val ram = Mem(Bits(64 bits),WORDS_COUNT)
 val rdata_valid = Reg(Bool()) init False
 //val rdata = Reg(Bits(64 bits)) init 0
// val wdata = RegNext(io.avl_wdata) init 0
// io.avl_rdata := rdata
 io.avl_rdata_valid := rdata_valid
 rdata_valid := False

 io.avl_ready := True

 //io.avl_rdata_valid := False

 //readAsync, since is only for simulation this is okay, otherwise not inferred as bram on fpga
 //need to check timing of signals with wb_avl_bridge
 //io.avl_rdata := ram.readAsync(io.avl_addr) 
  io.avl_rdata := ram.readSync(io.avl_addr,io.avl_read_req)
  when(io.avl_write_req === True)
  {
    ram(io.avl_addr) := io.avl_wdata
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