package reset
import spinal.core._
import spinal.lib._


class ResetBufferCC extends Component
{
  val io = new Bundle  {
    val i_unstable_reset = in Bool()
    val o_stable_reset = out Bool()
  }
 noIoPrefix()

 val stable_reset = BufferCC(io.i_unstable_reset)
 io.o_stable_reset := stable_reset


}


object ResetBufferCCVerilog {
  def main(args: Array[String]) {
    SpinalConfig().withPrivateNamespace.generateVerilog(new ResetBufferCC)
  }
}
