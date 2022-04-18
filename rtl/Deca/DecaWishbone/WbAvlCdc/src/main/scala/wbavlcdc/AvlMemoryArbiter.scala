package memory_arbiter

import spinal.core._
import spinal.lib._



case class AvlBusRequest(addressWidth : Int) extends Bundle with IMasterSlave
{

  val we = Bool()
  val adr =  UInt(addressWidth bits)
  val dat =  Bits(64 bits)
  val sel =  Bits(8 bits)
  val burstbegin =  Bool()
  val size =  UInt(3 bits)

  //
  override def asSlave() : Unit =
  {

    in(we)
    in(adr)
    in(dat)
    in(sel)
    in(burstbegin)
    in(size)
  }

  override def asMaster() : Unit =
  {

    out(we)
    out(adr)
    out(dat)
    out(sel)
    out(burstbegin)
    out(size)
  }

}


case class AvlBusResponse() extends Bundle with IMasterSlave
{
  val rdt = Bits(64 bits)
  val ready = Bool()


  override def asSlave() : Unit = {
     in(rdt)
     in(ready)
  }

  override def asMaster() : Unit = {
    out(rdt)
    out(ready)
  }

}


class AvlMemoryArbiter(portCount : Int ) extends Component
{

  val io = new Bundle{
       val input_request = Vec(slave(Stream(AvlBusRequest(26))),portCount)
       val output_request = master(Stream(AvlBusRequest(26)))

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
  val arbiter = arbiter_factory.build(AvlBusRequest(26),2)

  arbiter.io.inputs <> io.input_request
  arbiter.io.output <> io.output_request

}

object AvlMemoryArbiterVerilog {
  def main(args: Array[String]) {
     SpinalConfig().withPrivateNamespace.generateVerilog(new AvlMemoryArbiter(2)).printPruned
  //  SpinalVerilog(new WbAvlCdc( WbAvlCdcConfig.default))
  }
}
