package wbavlcdc
import spinal.core._
import spinal.lib._


case class AvlStreamAdapter(config : WbAvlCdcConfig) extends Component
{

  val io = new Bundle
  {
    val i_avl_clock = in Bool()
    val i_avl_reset = in Bool()
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


    val o_stream = master(Stream(BusResponse()))
    val i_stream = slave(Stream(BusRequest(26)))


  }
  noIoPrefix()

  val avlClockDomain = ClockDomain(
    clock = io.i_avl_clock,
    reset = io.i_avl_reset,
    config = ClockDomainConfig(
      clockEdge = RISING,
      resetActiveLevel = HIGH,
      resetKind = ASYNC
    )
  )

  val avlClockArea = new ClockingArea(avlClockDomain)
  {

    //io.o_stream.ready := False
    io.i_stream.ready := False
    io.o_avl_burstbegin := io.i_stream.payload.burstbegin
    io.o_avl_be := io.i_stream.payload.sel
    io.o_avl_adr := io.i_stream.payload.adr
    io.o_avl_dat := io.i_stream.payload.dat
    io.o_avl_wr_req := False
    io.o_avl_rdt_req := False
    io.o_avl_size := io.i_stream.payload.size

    io.o_stream.valid := False
    io.o_stream.payload.rdt := io.i_avl_rdt


    when(io.i_avl_rdt_valid)
    {
      io.i_stream.ready := True
      io.o_stream.valid := True
    }


    when(io.i_stream.valid & io.i_avl_ready)
    {
      when(io.i_stream.payload.we)
      {
        io.i_stream.ready := True
      }
      io.o_avl_wr_req := io.i_stream.payload.we
      io.o_avl_rdt_req :=  !io.i_stream.payload.we
    }

  }

}


object AvlStreamAdapterVerilog {
  def main(args: Array[String]) {
    SpinalConfig().withPrivateNamespace.generateVerilog(AvlStreamAdapter(WbAvlCdcConfig.default)).printPruned
    //  SpinalVerilog(new WbAvlCdc( WbAvlCdcConfig.default))
  }
}
