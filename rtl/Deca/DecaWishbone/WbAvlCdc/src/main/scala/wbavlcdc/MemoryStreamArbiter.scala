package memory_arbiter

import spinal.core._
import spinal.lib._
import spinal.lib.fsm._

import wbavlcdc.{BusResponse,BusRequest}


class MemoryStreamArbiter(portCount : Int ) extends Component
{

  val io = new Bundle{
       val input_request = Vec(slave(Stream(BusRequest(26))),portCount)
       val output_request = master(Stream(BusRequest(26)))

       val input_response = slave(Stream(BusResponse()))
       val output_response = Vec(master(Stream(BusResponse())),portCount)
  //     val choosen = out UInt( log2Up(portCount) bits)
  //   val inputs = Vec( slave(Stream (AvlBus(26)),portCount))
  //   val output = Stream ( master(AvlBus(26)) )

  }
  noIoPrefix()


  val arbiter_factory = new  StreamArbiterFactory
  arbiter_factory.lowerFirst
  arbiter_factory.transactionLock
  val arbiter = arbiter_factory.build(BusRequest(26),portCount)


  val arbiter_fifo = StreamFifo(
     dataType = BusRequest(26),
    depth=8)
  val arbiter_stream_output = Stream(BusRequest(26))

  //Put output of the arbiter in a fifo
  //NOTE: depth of the fifo should be deep enough to handle all inputs 
  val arbiter_chosen_fifo = StreamFifo(
    dataType = UInt( log2Up(portCount) bits  ),
    depth = 8)
  val arbiter_chosen_input = Stream(UInt( log2Up(portCount) bits))
  arbiter_chosen_input.valid := False
  val arbiter_chosen_output = Stream(UInt( log2Up(portCount) bits))
  arbiter_chosen_output.ready := False

  val inputs_valid = Bits(portCount bits)

  arbiter_chosen_fifo.io.push << arbiter_chosen_input
  arbiter_chosen_fifo.io.pop >> arbiter_chosen_output

  for(i <- 0 until portCount)
  {
    inputs_valid(i) := io.input_request(i).valid
  }

  // Store chosen input in fifo, need this for read request to route read data from memory
  arbiter_chosen_input.payload := arbiter.io.chosen
  when(inputs_valid.orR)
  {
    arbiter_chosen_input.valid := True
  }


  arbiter_fifo.io.push << arbiter.io.output
  arbiter_fifo.io.pop >> arbiter_stream_output
  arbiter.io.inputs <> io.input_request


  io.output_request.valid := False
  arbiter_stream_output.ready := io.output_request.ready
  io.output_request.payload.we := arbiter_stream_output.payload.we
  io.output_request.payload.adr := arbiter_stream_output.payload.adr
  io.output_request.payload.dat := arbiter_stream_output.payload.dat
  io.output_request.payload.sel := arbiter_stream_output.payload.sel
  io.output_request.payload.burstbegin := arbiter_stream_output.burstbegin
  io.output_request.payload.size :=  arbiter_stream_output.size


  io.input_response.ready := False
  //Set output_response signals
   for(i <- 0 until portCount)
   {
   //  io.input_request(i).ready := False
     io.output_response(i).payload.rdt := io.input_response.payload.rdt
     io.output_response(i).valid := False  //False
   }


  val fsm = new StateMachine{

   val Init = new State with EntryPoint
   val Idle = new State
   val Read = new State


  Init.whenIsActive{
    goto(Idle)
  }

  Idle.whenIsActive{
    when(arbiter_stream_output.valid)
    {
      io.output_request.valid := True
      arbiter_chosen_output.ready := True
      when(!arbiter_stream_output.payload.we)
      {
       goto(Read)
      }

    }

  }

  Read.whenIsActive{

   when(io.input_response.valid)
   {
     arbiter_chosen_output.ready := True
     arbiter_stream_output.ready := True
     io.input_response.ready := True
     io.output_response(arbiter_chosen_output.payload).valid := True

     goto(Idle)
   }

  }



  }


}

object MemoryStreamArbiterVerilog {
  def main(args: Array[String]) {
     SpinalConfig().withPrivateNamespace.generateVerilog(new MemoryStreamArbiter(2)).printPruned
  //  SpinalVerilog(new WbAvlCdc( WbAvlCdcConfig.default))
  }
}
