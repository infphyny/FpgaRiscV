package memory_arbiter

import spinal.core._
import spinal.lib._

import wbavlcdc.{BusResponse,BusRequest}


class AvlMemoryArbiter(portCount : Int ) extends Component
{

  val io = new Bundle{
       val input_request = Vec(slave(Stream(BusRequest(26))),portCount)
       val output_request = master(Stream(BusRequest(26)))

    //   val input_response = slave(Stream(AvlBusResponse()))
  //     val output_response = Vec(master(Stream(AvlBusResponse())),portCount)
  //     val choosen = out UInt( log2Up(portCount) bits)
  //   val inputs = Vec( slave(Stream (AvlBus(26)),portCount))
  //   val output = Stream ( master(AvlBus(26)) )

  }
  noIoPrefix()

  val arbiter_factory = new  StreamArbiterFactory
  arbiter_factory.lowerFirst
  arbiter_factory.transactionLock
  val arbiter = arbiter_factory.build(BusRequest(26),2)

  arbiter.io.inputs <> io.input_request
  arbiter.io.output <> io.output_request

}

object AvlMemoryArbiterVerilog {
  def main(args: Array[String]) {
     SpinalConfig().withPrivateNamespace.generateVerilog(new AvlMemoryArbiter(2)).printPruned
  //  SpinalVerilog(new WbAvlCdc( WbAvlCdcConfig.default))
  }
}
