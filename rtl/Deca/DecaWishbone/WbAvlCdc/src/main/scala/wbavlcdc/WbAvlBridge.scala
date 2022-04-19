package wbavlcdc
import spinal.core._
import spinal.lib._


case class WbAvlBridge(config : WbAvlCdcConfig ) extends Component
{

  val io = new Bundle{
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
 noIoPrefix()


   val wb_stream = WbAvlCdc( WbAvlCdcConfig.default)

   val avl_stream_adapter = AvlStreamAdapter(WbAvlCdcConfig.default)



  io.i_wb_clock <> wb_stream.io.i_wb_clock
  io.i_wb_reset <> wb_stream.io.i_wb_reset
  io.i_avl_clock <> wb_stream.io.i_avl_clock
  io.i_avl_reset <> wb_stream.io.i_avl_reset
  io.i_wb_adr <> wb_stream.io.i_wb_adr
  io.i_wb_sel <> wb_stream.io.i_wb_sel
  io.o_wb_rdt <> wb_stream.io.o_wb_rdt
  io.i_wb_we <> wb_stream.io.i_wb_we
  io.i_wb_cyc <> wb_stream.io.i_wb_cyc
  io.i_wb_stb <> wb_stream.io.i_wb_stb
  io.o_wb_ack <> wb_stream.io.o_wb_ack
  io.i_wb_dat <> wb_stream.io.i_wb_dat
  io.o_wb_err <> wb_stream.io.o_wb_err
  io.o_wb_rty <> wb_stream.io.o_wb_rty

  io.i_avl_clock <> avl_stream_adapter.io.i_avl_clock
  io.i_avl_reset <> avl_stream_adapter.io.i_avl_reset


  wb_stream.io.o_stream >> avl_stream_adapter.io.i_stream
  wb_stream.io.i_stream << avl_stream_adapter.io.o_stream


  io.o_avl_burstbegin <> avl_stream_adapter.io.o_avl_burstbegin
  io.o_avl_be <> avl_stream_adapter.io.o_avl_be
  io.o_avl_adr <> avl_stream_adapter.io.o_avl_adr
  io.o_avl_dat <> avl_stream_adapter.io.o_avl_dat
  io.o_avl_wr_req <> avl_stream_adapter.io.o_avl_wr_req
  io.o_avl_rdt_req <> avl_stream_adapter.io.o_avl_rdt_req
  io.o_avl_size <> avl_stream_adapter.io.o_avl_size
  io.i_avl_rdt <> avl_stream_adapter.io.i_avl_rdt
  io.i_avl_ready <> avl_stream_adapter.io.i_avl_ready
  io.i_avl_rdt_valid <> avl_stream_adapter.io.i_avl_rdt_valid

}


object WbAvlBridgeVerilog {
  def main(args: Array[String]) {
     SpinalConfig().withPrivateNamespace.generateVerilog( WbAvlBridge( WbAvlCdcConfig.default)).printPruned
  //  SpinalVerilog(new WbAvlCdc( WbAvlCdcConfig.default))
  }
}
