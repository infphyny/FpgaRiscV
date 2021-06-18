/*
 * SpinalHDL
 * Copyright (c) Dolu, All rights reserved.
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

package wbuart

import spinal.core._
import spinal.lib._
import spinal.lib.bus.wishbone.{Wishbone,WishboneConfig, WishboneSlaveFactory}
import spinal.lib.com.uart._

//import scala.util.Random


/*
object WbUart {
  def main(args: Array[String]) {
    SpinalVerilog(new )
  }
}
*/


//val  ucmmc: UartCtrlMemoryMappedConfig =  UartCtrlMemoryMappedConfig()



//Hardware definition
/*
class WbUart extends Component {
  val io = new Bundle {
    val bus =  slave(Wishbone(WishboneUartCtrl.getWishboneConfig))
     val uart = master(Uart())
     val interrupt = out Bool
  }
noIoPrefix()

 val wbUart = new WishboneUartCtrl(config = UartCtrlMemoryMappedConfig)

   io.uart <> wbUart.uartCtrl.io.uart
   val busCtrl = WishboneSlaveFactory(io.bus)
  val bridge = uartCtrl.driveFrom32(busCtrl,config)
   io.interrupt := bridge.interruptCtrl.interrupt
}

*/
/*
object WishboneUartCtrl2{
  def getWishboneConfig = WishboneConfig(addressWidth = 6,dataWidth = 8)
}
*/



class WishboneUartCtrl(config : UartCtrlMemoryMappedConfig) extends Component{
  val io = new Bundle{
    val bus =  slave(Wishbone(WishboneUartCtrl.getWishboneConfig))
    val uart = master(Uart())
    val interrupt = out Bool
  }

  val uartCtrl = new UartCtrl(config.uartCtrlConfig)
  io.uart <> uartCtrl.io.uart

  val busCtrl = WishboneSlaveFactory(io.bus)
  val bridge = uartCtrl.driveFrom32(busCtrl,config)
  io.interrupt := bridge.interruptCtrl.interrupt
}


//Generate the MyTopLevel's Verilog
object MyTopLevelVerilog {
  def main(args: Array[String]) {

    SpinalConfig(
      mode = Verilog,
      defaultClockDomainFrequency=FixedFrequency(75 MHz)).generate(
        new  WishboneUartCtrl(config = UartCtrlMemoryMappedConfig(baudrate = 115200,
          txFifoDepth = 16,
          rxFifoDepth = 16
        )
      )
    )


  }
}

/*
//Generate the MyTopLevel's VHDL
object MyTopLevelVhdl {
  def main(args: Array[String]) {
    SpinalVhdl(new MyTopLevel)
  }
}
*/
/*

//Define a custom SpinalHDL configuration with synchronous reset instead of the default asynchronous one. This configuration can be resued everywhere
object MySpinalConfig extends SpinalConfig(defaultConfigForClockDomains = ClockDomainConfig(resetKind = SYNC))

//Generate the MyTopLevel's Verilog using the above custom configuration.
object MyTopLevelVerilogWithCustomConfig {
  def main(args: Array[String]) {
    MySpinalConfig.generateVerilog(new MyTopLevel)
  }
}
*/
