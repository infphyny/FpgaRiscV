package wbavlcdc

import spinal.core._
import spinal.lib._



class AvlStateMachine(config : WbAvlCdcConfig) extends Component
{
    val io = new Bundle{
        val i_avl_clock = in Bool()
        val i_avl_reset = in Bool()

        val i_avlsm_burstbegin = in Bool()
        val i_avlsm_be = in Bits(config.word_size bits)
        val i_avlsm_adr = in UInt(log2Up(config.mem_size/config.word_size) bits)
        val i_avlsm_dat = in Bits(config.word_size*8 bits)
        val i_avlsm_wr_req = in Bool()
        val i_avlsm_rdt_req = in Bool()
        val i_avlsm_size = in UInt(3 bits)
        val o_avlsm_rdt = out Bits(8*config.word_size bits)
        

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
}