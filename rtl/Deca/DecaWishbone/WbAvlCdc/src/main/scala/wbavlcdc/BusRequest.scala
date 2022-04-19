package wbavlcdc

import spinal.core._
import spinal.lib._

case class BusRequest(addressWidth : Int) extends Bundle with IMasterSlave
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


case class BusResponse() extends Bundle with IMasterSlave
{
  val rdt = Bits(64 bits)
//  val ready = Bool()


  override def asSlave() : Unit = {
     in(rdt)
//     in(ready)
  }

  override def asMaster() : Unit = {
    out(rdt)
//    out(ready)
  }

}
