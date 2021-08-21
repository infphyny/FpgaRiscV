/*
  Avalon clock crossing bridge similar to altera_avalon_mm_clock_crossing_bridge module. 


  when input slave Stream 
  when output master Stream

*/

package avalon_clock_crossing_bridge

import spinal.core._
import spinal.lib._


//import scala.util.Random

//Hardware definition
class AvalonClockDomainCrossingBridge extends Component {
  
  val DATA_WIDTH = 64
  val BURSTCOUNT_WIDTH = 8
  val HDL_ADDR_WIDTH = 26
  val BYTE_ENABLE_WIDTH = 8 

  val io = new Bundle {
    val s0_clock = in  Bool()
    val s0_reset = in  Bool()
    val m0_clock = in  Bool()
    val m0_reset = in  Bool()
    
    val s0_waitrequest = master Stream(Bool())
    
  

    val s0_readdata = master  Stream(Bits( DATA_WIDTH bits))
    
    val s0_readdatavalid = master Stream (Bool())
    
    val s0_burstbegin = slave Stream(Bool())
    val s0_burstcount = slave Stream(UInt(BURSTCOUNT_WIDTH bits))
     
    val s0_writedata = slave Stream(Bits(DATA_WIDTH bits))

    val s0_address = slave Stream(UInt(HDL_ADDR_WIDTH bits))
    
    val s0_read = slave Stream(Bool()) 

    val s0_write = slave Stream (Bool())

    val s0_byteenable = slave Stream(Bits(BYTE_ENABLE_WIDTH bits) )
    
    val m0_waitrequest = slave Stream(Bool())
    
    val m0_readdata = slave Stream(Bits(DATA_WIDTH bits))
    
    val m0_readdatavalid = slave Stream(Bool())
    
    val m0_burstbegin = master Stream(Bool())
    val m0_burstcount = master Stream(UInt(BURSTCOUNT_WIDTH bits))
    
    val m0_writedata = master Stream(Bits(DATA_WIDTH bits))
    val m0_address = master Stream(UInt(HDL_ADDR_WIDTH bits))
    
    val m0_read = master Stream(Bool())
    val m0_write =  master Stream (Bool())

    val m0_byteenable = master Stream(Bits(BYTE_ENABLE_WIDTH bits))
   
  }
 
 noIoPrefix()

  

  val slave_clock = ClockDomain(io.s0_clock,io.s0_reset)

  val master_clock = ClockDomain(io.m0_clock,io.m0_reset)



  

  val m2s_waitrequest =  StreamFifoCC(
      dataType = Bool(),
      depth = 2,
      pushClock = master_clock,
      popClock = slave_clock )


      m2s_waitrequest.io.push << io.m0_waitrequest
      m2s_waitrequest.io.pop >> io.s0_waitrequest



  val m2s_readdata = StreamFifoCC(
    dataType = Bits(DATA_WIDTH bits),
    depth = 2,
    pushClock = master_clock ,
    popClock = slave_clock)
  

  m2s_readdata.io.push << io.m0_readdata
  m2s_readdata.io.pop >> io.s0_readdata 

 
  val m2s_readdatavalid = StreamFifoCC(
    dataType = Bool(),
    depth = 2,
    pushClock = master_clock,
    popClock = slave_clock
  ) 

  m2s_readdatavalid.io.push << io.m0_readdatavalid
  m2s_readdatavalid.io.pop >> io.s0_readdatavalid


  val s2m_burstbegin = StreamFifoCC(
    dataType = Bool(),
    depth = 2,
    pushClock = slave_clock,
    popClock = master_clock
  )

  s2m_burstbegin.io.push << io.s0_burstbegin
  s2m_burstbegin.io.pop >> io.m0_burstbegin

  val s2m_burstcount = StreamFifoCC(
    dataType = UInt(BURSTCOUNT_WIDTH bits),
    depth = 2,
    pushClock = slave_clock,
    popClock = master_clock
  )
  
  s2m_burstcount.io.push << io.s0_burstcount
  s2m_burstcount.io.pop >> io.m0_burstcount

  val s2m_writedata = StreamFifoCC(
    dataType = Bits(DATA_WIDTH bits),
    depth = 2,
    pushClock = slave_clock,
    popClock = master_clock
  )
  
  s2m_writedata.io.push << io.s0_writedata
  s2m_writedata.io.pop >> io.m0_writedata

  
  val s2m_address = StreamFifoCC(
    dataType =  UInt(HDL_ADDR_WIDTH bits),
    depth = 2,
    pushClock = slave_clock,
    popClock = master_clock
  )
  
  s2m_address.io.push << io.s0_address
  s2m_address.io.pop >> io.m0_address

 
  val s2m_read = StreamFifoCC(
    dataType = Bool(),
    depth = 2,
    pushClock = slave_clock,
    popClock = master_clock
  )

  s2m_read.io.push << io.s0_read
  s2m_read.io.pop >> io.m0_read

  val s2m_write = StreamFifoCC(
    dataType = Bool(),
    depth = 2,
    pushClock = slave_clock,
    popClock = master_clock
  )

  s2m_write.io.push << io.s0_write
  s2m_write.io.pop >>  io.m0_write

  
 val s2m_byteenable = StreamFifoCC(
   dataType = Bits(BYTE_ENABLE_WIDTH bits),
   depth = 2,
   pushClock = slave_clock,
   popClock = master_clock
 ) 
  
  s2m_byteenable.io.push << io.s0_byteenable
  s2m_byteenable.io.pop >> io.m0_byteenable


 /*
 val s2m_
  
  s2m_read = StreamFifoCC(
    dataType = Bool(),
    pushClock = slave_clock,
    popClock = master_clock
  )

  s2m_byteenable = StreamFifoCC(
    dataType = Bool(),
    pushClock = slave_clock,
    popClock = master_clock
  )
*/





}



//Generate the MyTopLevel's Verilog
object AvalonClockDomainCrossingBridgeVerilog {
  def main(args: Array[String]) {
    SpinalConfig().withPrivateNamespace.generateVerilog(new AvalonClockDomainCrossingBridge).printPruned()
 //   SpinalVerilog(new AvalonClockDomainCrossingBridge).printPruned()
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
}
*/