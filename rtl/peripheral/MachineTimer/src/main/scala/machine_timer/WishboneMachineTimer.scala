/*
infphyny 2021

 Not comformant to spec see section 3.1.10 Volume II: RISC-V Privileged Architectures V20190608-Priv-MSU-Ratified
*/

package machine_timer

import spinal.core._
import spinal.lib._


class WishboneMachineTimer extends Component
{
  val io = new Bundle
  {
    val wb_adr_i = in UInt(5 bits)
    val wb_dat_i = in Bits(32 bits)
    val wb_we_i = in Bool
    val wb_dat_o = out Bits(32 bits)
    val wb_cyc_i = in Bool
    val wb_stb_i = in Bool
    val wb_ack_o = out Bool
    val wb_err_o = out Bool
    val wb_rty_o = out Bool
    val irq = out Bool
  }

noIoPrefix

val mtimer = new MachineTimer
//val status = Reg(Bits(8 bits)) init(0)

//mtimer.io.mTimeInterruptClear := status(0)

mtimer.io.mtime_we_l := False
mtimer.io.mtime_we_h := False
mtimer.io.mtimecmp_we_l := False
mtimer.io.mtimecmp_we_h := False
mtimer.io.status_we := False

mtimer.io.mtime_write_l := io.wb_dat_i.asUInt
mtimer.io.mtime_write_h := io.wb_dat_i.asUInt
mtimer.io.mtimecmp_write_l := io.wb_dat_i.asUInt
mtimer.io.mtimecmp_write_h := io.wb_dat_i.asUInt
mtimer.io.status_write := io.wb_dat_i(7 downto 0)

io.irq := mtimer.io.mTimeInterrupt

val ack = Reg(Bool) init(False)
ack := False

when(ack === True)
{
  ack := False
}
io.wb_ack_o := ack

io.wb_rty_o := False
io.wb_err_o := False


val sel = io.wb_cyc_i & io.wb_stb_i & !ack;



when(sel === True)
{
  ack := True
  when(io.wb_we_i === True)
  {

    switch(io.wb_adr_i)
    {
      is(U"5'b00000") //mtime (31:0)
      {
         mtimer.io.mtime_we_l := True
      }
      is(U"5'b00100") //mtime(63:32)
      {
        mtimer.io.mtime_we_h := True
      }
      is(U"5'b01000") //mtimecmp(31:0)
      {
        mtimer.io.mtimecmp_we_l := True
      }
      is(U"5'b01100") //mtimecmp(63:32)
      {
       mtimer.io.mtimecmp_we_h := True
      }
      is(U"5'b10000") //Status
      {
        mtimer.io.status_we := True
        //status := io.wb_dat_i(7 downto 0)
      }

    }


  }


 }

 switch(io.wb_adr_i)
 {
   is(U"5'b00000")
   {
     io.wb_dat_o := mtimer.io.mtime_read_l.asBits
   }
   is(U"5'b00100")
   {
     io.wb_dat_o := mtimer.io.mtime_read_h.asBits
   }
   is(U"5'b01000")
   {
     io.wb_dat_o := mtimer.io.mtimecmp_read_l.asBits
   }
   is(U"5'b01100")
   {
     io.wb_dat_o := mtimer.io.mtimecmp_read_h.asBits
   }
   is(U"5'b10000")
   {
     io.wb_dat_o := B"24'x000000" ## mtimer.io.status_read
   }
   default
  {
     io.wb_dat_o := B"32'x00000000"
  }

 }


}
object WishboneMachineTimerVerilog {
  def main(args: Array[String]) {
    SpinalVerilog(new WishboneMachineTimer)
  }
}
