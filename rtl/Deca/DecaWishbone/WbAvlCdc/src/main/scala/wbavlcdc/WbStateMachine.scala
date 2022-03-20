package wbavlcdc

import spinal.core._
import spinal.lib._


  

class WbStateMachine(config : WbAvlCdcConfig ) extends Component
{
 //  val MEM_SIZE : BigInt // Memory size in bytes
 //  val WORD_SIZE : Int // Word Size in byte
    val io = new Bundle{
        val i_wb_clock = in Bool()
        val i_wb_reset = in Bool()
        val i_wb_adr = in UInt(32 bits)
        val i_wb_sel = in Bits(4 bits)
        val i_wb_dat = in Bits(32 bits)
        val o_wb_rdt = out Bits(32 bits)
        val i_wb_we = in  Bool()
        val i_wb_cyc = in Bool()
        val i_wb_std = in Bool()
        val o_wb_ack = out Bool()
        val o_wb_err = out Bool()
        val o_wb_rty = out Bool()

        // Signal from/to alv state machine 
        val o_avlsm_burstbegin = out Bool()
        val o_avlsm_be = out Bits(config.word_size bits)
        val o_alvsm_adr = out UInt( log2Up(config.mem_size/config.word_size) bits)
        val o_avlsm_dat = out Bits( 8*config.word_size bits )
        val o_avlsm_wr_req = out Bool()
        val o_avlsm_rdt_req = out Bool()
        val o_avlsm_size = out UInt(3 bits)
        val i_avlsm_rdt = in Bits(8*config.word_size bits)
        val i_avlsm_rdt_valid = Bool()

    }
}