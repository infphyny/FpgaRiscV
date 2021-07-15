/*
 *
 * https://github.com/SpinalHDL/SpinalHDL/blob/dev/lib/src/main/scala/spinal/lib/misc/MachineTimer.scala
 *
 *  infphyny
 *
 */

package machine_timer

import spinal.core._
import spinal.lib._
//import spinal.lib.misc.Timer

//Hardware definition
class MachineTimer extends Component {
  val io = new Bundle {


    val mtime_read_l = out UInt(32 bits)
    val mtime_read_h = out UInt(32 bits)

    val mtime_we_l = in Bool
    val mtime_we_h = in Bool
    val mtime_write_l = in UInt(32 bits)
    val mtime_write_h = in UInt(32 bits)

    val mtimecmp_read_l = out UInt(32 bits)
    val mtimecmp_read_h = out UInt(32 bits)

    val mtimecmp_we_l = in Bool
    val mtimecmp_we_h = in Bool
    val mtimecmp_write_l = in UInt(32 bits)
    val mtimecmp_write_h = in UInt(32 bits)
  //  val mTimeInterruptClear = in Bool
    val mTimeInterrupt = out Bool

    val status_we = in Bool
    val status_write = in Bits(8 bits)
    val status_read = out Bits(8 bits)

  }

  val mtime = Reg(UInt(64 bits)) init(0)
  val mtimecmp = Reg(UInt(64 bits)) init(0)
  val status = Reg(Bits(8 bits)) init(0)
  val interrupt = status(0) // Reg(Bool) init(False)
  val interrupt_enable = status(1)

  io.mTimeInterrupt := interrupt

  //val limitHit = mtime === mtimecmp

  interrupt := (interrupt || ((mtime === mtimecmp)&&(!interrupt)) ) && interrupt_enable
/*
 when(interrupt === True)
 {
   interrupt := False
 }
*/
when(interrupt_enable === True)
{
  when(mtime === mtimecmp)
  {
    mtime := 0 // Auto reload
    //interrupt := True
  }.otherwise
  {
    mtime := mtime + 1
  //  interupt := False
  }
}
  io.mtime_read_l := mtime(31 downto 0)
  io.mtime_read_h := mtime(63 downto 32)

  io.mtimecmp_read_l := mtimecmp(31 downto 0)
  io.mtimecmp_read_h := mtimecmp(63 downto 32)

  io.status_read := status

  when(io.mtime_we_l === True)
  {
   mtime(31 downto 0 ) := io.mtime_write_l
  }
  when(io.mtime_we_h === True)
  {
    mtime(63 downto 32 ) := io.mtime_write_h
  }

  when(io.mtimecmp_we_l === True)
  {
    mtimecmp(31 downto 0) := io.mtimecmp_write_l
  }
  when(io.mtimecmp_we_h === True)
  {
    mtimecmp(63 downto 32) := io.mtimecmp_write_h
  }


  when(io.status_we)
  {
    status :=  io.status_write
  }




  //val counter = Reg(UInt(8 bits)) init(0)
}

//Generate the MyTopLevel's Verilog
object MachineTimerVerilog {
  def main(args: Array[String]) {
    SpinalVerilog(new MachineTimer)
  }
}
