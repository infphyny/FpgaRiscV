
package spinal.lib.com.i2c
import spinal.core._
import spinal.lib._
import spinal.lib.io.{InOutWrapper}
import spinal.lib.bus.wishbone.{Wishbone,WishboneConfig, WishboneSlaveFactory}

object WishboneI2cCtrl{
  def getWishboneConfig = WishboneConfig(addressWidth = 8,dataWidth = 32)

def main(args: Array[String]) {


  SpinalConfig().withPrivateNamespace.generateVerilog(

          InOutWrapper(new  WishboneI2cCtrl(
            I2cSlaveMemoryMappedGenerics(
              ctrlGenerics = I2cSlaveGenerics(
                samplingWindowSize = 3,
                samplingClockDividerWidth = 10 bits,
                timeoutWidth = 20 bits
              ),
              addressFilterCount = 4,
              masterGenerics = I2cMasterMemoryMappedGenerics(
                timerWidth = 12
              )
            )

          ).setDefinitionName("WishboneI2cCtrl")
        )
      ).toplevel.busCtrl.printDataModel()

    }

  }


case class WishboneI2cCtrl(generics : I2cSlaveMemoryMappedGenerics) extends Component{
  val io = new Bundle{
    val bus =  slave(Wishbone(WishboneI2cCtrl.getWishboneConfig))
    val i2c = master( I2c())
    val interrupt = out Bool()
  }

 val i2cCtrl = new I2cSlave(generics.ctrlGenerics)
  val busCtrl = WishboneSlaveFactory(io.bus)
  val bridge = i2cCtrl.io.driveFrom(busCtrl,0)(generics)

  //io.i2c <> i2cCtrl.io.i2c

  //Phy
  io.i2c.scl.write := RegNext(bridge.i2cBuffer.scl.write) init(True)
  io.i2c.sda.write := RegNext(bridge.i2cBuffer.sda.write) init(True)
  bridge.i2cBuffer.scl.read := io.i2c.scl.read
  bridge.i2cBuffer.sda.read := io.i2c.sda.read



  io.interrupt := bridge.interruptCtrl.interrupt
}
