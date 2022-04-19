/*



*/


package wbavlcdc

import spinal.core._
import spinal.lib._
import spinal.lib.fsm._

//Hardware definition
//import wbavlcdc.{BusResponse,BusRequest}

case class FromWb(addressWidth : Int) extends Bundle
{
//  val stb = Bool()
  //val cyc_stb = Bool()
  val we  = Bool()
  val adr = UInt( addressWidth bits )
  val sel = Bits(8 bits)
  val dat = Bits(64 bits)
}

case class ToWb() extends Bundle
{
  //val ack = Bool()
  val rdt = Bits(64 bits)
}



case class AvlIo(config : WbAvlCdcConfig )
{
  val o_avl_burstbegin = out Bool()
  val o_avl_be = out Bits(8 bits)
  val o_avl_adr = out UInt( log2Up(config.mem_size/config.word_size) bits)
  val o_avl_dat = out Bits(config.word_size*8 bits)
  val o_avl_wr_req = out Bool()
  val o_avl_rdt_req = out Bool()
  val o_avl_size = out UInt(3 bits)
  val i_avl_rdt = in Bits(config.word_size*8 bits)
  val i_avl_ready = in Bool()
  val i_avl_rdt_valid = in Bool()
}


case class WbAvlCdc(config : WbAvlCdcConfig ) extends Component {

  val FROM_WB_STREAM_FIFO_DEPTH = 8
  val use_avl = true

//  if(use_avl = true)
//  {
  val io = new Bundle {

    val i_wb_clock = in  Bool()
    val i_wb_reset = in  Bool()
    val i_wb_adr = in UInt(32 bits)
    val i_wb_sel = in Bits(4 bits)
    val i_wb_dat = in Bits(32 bits)
    val o_wb_rdt = out Bits(32 bits)
    val i_wb_we = in Bool()
    val i_wb_cyc = in Bool()
    val i_wb_stb = in Bool()
    val o_wb_ack = out Bool()
    val o_wb_err = out Bool()
    val o_wb_rty = out Bool()


    val i_avl_clock  = in Bool()
    val i_avl_reset = in Bool()
    val i_stream = slave(Stream(BusResponse()))
    val o_stream =  master(Stream(BusRequest(26)))
  //

  //val avl = AvlIo(config)

  /*
    val o_avl_burstbegin = out Bool()
    val o_avl_be = out Bits(8 bits)
    val o_avl_adr = out UInt( log2Up(config.mem_size/config.word_size) bits)
    val o_avl_dat = out Bits(config.word_size*8 bits)
    val o_avl_wr_req = out Bool()
    val o_avl_rdt_req = out Bool()
    val o_avl_size = out UInt(3 bits)
    val i_avl_rdt = in Bits(config.word_size*8 bits)
    val i_avl_ready = in Bool()
    val i_avl_rdt_valid = in Bool()
    */
  }




//  }
//  else
//  {
//     val o_stream = Bool() // master(Stream())
//  }


  //}
  // else
  // {
  //   io = new Bundle{
  //     val t = out Bool()
  //   }
  // }
  noIoPrefix;
   val wbClockDomain = ClockDomain(
    clock = io.i_wb_clock,
    reset = io.i_wb_reset,
    config = ClockDomainConfig(
      clockEdge = RISING,
      resetKind = ASYNC,
      resetActiveLevel = HIGH
    )
  )
val avlClockDomain = ClockDomain(
    clock = io.i_avl_clock,
    reset = io.i_avl_reset,
    config = ClockDomainConfig(
      clockEdge = RISING,
      resetKind = ASYNC,
      resetActiveLevel = HIGH
    )
  )

  io.o_wb_err := False
  io.o_wb_rty := False

 val sel = Bits(8 bits)

 val fromWbToCdcStream = Stream(FromWb(addressWidth = log2Up(config.mem_size/config.word_size)))
 fromWbToCdcStream.valid := False
 fromWbToCdcStream.payload.adr := io.i_wb_adr( log2Up(config.mem_size/config.word_size)-1 downto 0)
 fromWbToCdcStream.payload.dat := io.i_wb_dat ## io.i_wb_dat
 fromWbToCdcStream.payload.we := io.i_wb_we
 fromWbToCdcStream.payload.sel := sel


 val fromCdcToMemStream = Stream(FromWb(addressWidth = log2Up(config.mem_size/config.word_size)))
 fromCdcToMemStream.ready := False


 val fromWbStreamFifo = StreamFifoCC(
   dataType = FromWb(addressWidth = log2Up(config.mem_size/config.word_size)),
   depth = FROM_WB_STREAM_FIFO_DEPTH,
   pushClock = wbClockDomain,
   popClock = avlClockDomain
 )
 fromWbStreamFifo.io.push  << fromWbToCdcStream
 fromWbStreamFifo.io.pop >> fromCdcToMemStream



val fromMemToCdcStream = Stream(ToWb())
fromMemToCdcStream.valid := False



val fromCdcToWbStream = Stream(ToWb())
fromCdcToWbStream.ready := False


val fromMemStreamFifoCC = StreamFifoCC(
  dataType = ToWb(),
  depth = 2,
  pushClock = avlClockDomain,
  popClock = wbClockDomain
)

fromMemStreamFifoCC.io.push << fromMemToCdcStream
fromMemStreamFifoCC.io.pop >> fromCdcToWbStream


  val wbClockArea = new ClockingArea(wbClockDomain)
  {

    switch(io.i_wb_adr(2)) //Generate byte enable for avl
     {
       is(False)
       {
           sel := U(0,4 bits) ## io.i_wb_sel
           io.o_wb_rdt :=  fromCdcToWbStream.payload.rdt(31 downto 0)
       }
       is(True)
       {

           sel := io.i_wb_sel ##  U(0,4 bits)
           io.o_wb_rdt :=  fromCdcToWbStream.payload.rdt(63 downto 32)
       }
     }

     io.o_wb_ack := False

    val wbStateMachine = new StateMachine{

      val Init = new State with EntryPoint
      val Idle = new State
      val Read = new State


      Init.whenIsActive{
        goto(Idle)
      }

      Idle.whenIsActive{

        when((io.i_wb_cyc & io.i_wb_stb)&(fromWbStreamFifo.io.pushOccupancy < (FROM_WB_STREAM_FIFO_DEPTH-1) ) )
        {
          fromWbToCdcStream.valid := True
          when(io.i_wb_we === True)
          {
            io.o_wb_ack := True
            goto(Idle)
          }.otherwise
          {
            goto(Read)
          }

        }

      }

      Read.whenIsActive{
        when(fromCdcToWbStream.valid)
        {
           fromCdcToWbStream.ready := True
           io.o_wb_ack := True
          goto(Idle)
        }
      }


    }

  }

  val avlClockArea = new ClockingArea(avlClockDomain)
  {

  io.i_stream.ready := False
  io.o_stream.valid := False
  io.o_stream.payload.sel := fromCdcToMemStream.payload.sel
  io.o_stream.payload.dat := fromCdcToMemStream.payload.dat
  io.o_stream.payload.burstbegin := False
  io.o_stream.payload.size := 1

  io.o_stream.payload.we := fromCdcToMemStream.payload.we
  io.o_stream.payload.adr := fromCdcToMemStream.payload.adr
//  io.avl.o_avl_be := fromCdcToMemStream.payload.sel
//  io.avl.o_avl_dat := fromCdcToMemStream.payload.dat
//  io.avl.o_avl_burstbegin := False
//  io.avl.o_avl_size := 1
//  io.avl.o_avl_wr_req := False
//  io.avl.o_avl_rdt_req := False


  //fromMemToCdcStream.payload.rdt := io.avl.i_avl_rdt
  fromMemToCdcStream.payload.rdt := io.i_stream.payload.rdt

   val avlStateMachine = new StateMachine{
       val Init = new State with EntryPoint
       val Idle = new State
       val Read = new State
       //  val write = new State

       Init.whenIsActive{
         goto(Idle)
       }

       Idle.whenIsActive{
         goto(Idle)

         // TO try waitfor avl ready at next state see https://www.youtube.com/watch?v=8GAqT3nzHeQ
         when(fromCdcToMemStream.valid /*& io.avl.i_avl_ready*/ )
         {
             io.o_stream.valid := True
            // io.o_avl_burstbegin := True
             when(fromCdcToMemStream.payload.we)
             {
               fromCdcToMemStream.ready := True
              // io.avl.o_avl_wr_req := True
             }.otherwise
             {
              // io.avl.o_avl_rdt_req := True
               goto(Read)
             }

         }

       }

      Read.whenIsActive{

        when(io.i_stream.valid/*io.avl.i_avl_rdt_valid*/ )
        {
          io.i_stream.ready := True
          fromCdcToMemStream.ready := True
          fromMemToCdcStream.valid := True
          goto(Idle)
        }

      }

     }

   }

}

//Generate the MyTopLevel's Verilog
object WbAvlCdcVerilog {
  def main(args: Array[String]) {
     SpinalConfig().withPrivateNamespace.generateVerilog( WbAvlCdc( WbAvlCdcConfig.default)).printPruned
  //  SpinalVerilog(new WbAvlCdc( WbAvlCdcConfig.default))
  }
}
