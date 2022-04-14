package video

import spinal.core._
import spinal.lib._
import spinal.lib.fsm._
import spinal.lib.graphic.vga._
import spinal.lib.graphic.{RgbConfig, Rgb}
import spinal.lib.bus.wishbone.{Wishbone,WishboneConfig, WishboneSlaveFactory}

object WishboneVideoCtrl{
 def getWishboneConfig = WishboneConfig(addressWidth = 5, dataWidth = 32)
 val BUILD_WITH_CDC = false


   def main(args: Array[String]) {

    SpinalConfig().withPrivateNamespace.generateVerilog(
      new VideoCtrl(rgbConfig = RgbConfig(5,6,5), withColorEn = true, build_with_cdc = true)
    ).toplevel.videoArea.busCtrl.printDataModel()

  }
//.printPruned
  }


case class FromWb(addressWidth : Int) extends Bundle
{
//  val stb = Bool()
  //val cyc_stb = Bool()
  val we  = Bool()
  val adr = UInt( addressWidth bits )
  //val sel = Bits(4 bits)
  val dat = Bits(32 bits)
}

case class ToWb() extends Bundle
{
  //val ack = Bool()
  val rdt = Bits(32 bits)
}


case class VideoCtrl(rgbConfig: RgbConfig, withColorEn : Boolean = true, build_with_cdc : Boolean = true) extends Component
{
  val io = new Bundle{
    val wb_clock = in Bool()
    val wb_reset = in Bool()
    val video_clock = in Bool()
    val video_reset = in Bool()
    val i_hdmi_tx_int = in Bool()
    val bus = slave(Wishbone(WishboneVideoCtrl.getWishboneConfig))
    val vga = master(Vga(rgbConfig,withColorEn))
    val frameStart = out Bool()
    val pixels = slave(Stream(Rgb(rgbConfig)))
  }
  noIoPrefix





 val wbClockDomain = ClockDomain(
   clock = io.wb_clock,
   reset = io.wb_reset,
   config = ClockDomainConfig(
     clockEdge = RISING,
     resetKind = ASYNC,
     resetActiveLevel = HIGH
   )
 )

val videoClockDomain = ClockDomain(
  clock = io.video_clock,
  reset = io.video_reset,
  config = ClockDomainConfig(
    clockEdge = RISING,
    resetKind = ASYNC,
    resetActiveLevel = HIGH
  )
)


 val fromWbToCdcStream = Stream(FromWb(addressWidth = WishboneVideoCtrl.getWishboneConfig.addressWidth))
 fromWbToCdcStream.valid := False
 fromWbToCdcStream.payload.adr := io.bus.ADR
 fromWbToCdcStream.payload.dat := io.bus.DAT_MOSI
 fromWbToCdcStream.payload.we := io.bus.WE

 val fromCdcToVideoStream = Stream(FromWb(addressWidth = WishboneVideoCtrl.getWishboneConfig.addressWidth))
 fromCdcToVideoStream.ready := False

 val fromWbStreamFifo = StreamFifoCC(
   dataType = FromWb(addressWidth = WishboneVideoCtrl.getWishboneConfig.addressWidth),
   depth = 2,
   pushClock = wbClockDomain,
   popClock = videoClockDomain
 )
 fromWbStreamFifo.io.push  << fromWbToCdcStream
 fromWbStreamFifo.io.pop >> fromCdcToVideoStream



 val fromVideoToCdcStream = Stream(ToWb())
  fromVideoToCdcStream.valid := False

 val fromCdcToWbStream = Stream(ToWb())
  fromCdcToWbStream.ready := False

  io.bus.DAT_MISO := fromCdcToWbStream.payload.rdt
  io.bus.ACK := False

 val fromVideoStreamFifo = StreamFifoCC(
   dataType = ToWb(),
   depth = 2,
   pushClock = videoClockDomain,
   popClock = wbClockDomain
 )

 fromVideoStreamFifo.io.push << fromVideoToCdcStream
 fromVideoStreamFifo.io.pop >> fromCdcToWbStream


 val video_ready_wire = Bool()


 val wbArea = new ClockingArea(wbClockDomain)
 {
  //val video_ready = BufferCC(video_ready_wire)
   //val prevCycStb = RegNext(io.bus.CYC & io.bus.STB)

   val fsm = new StateMachine{

     val Init = new State with EntryPoint
     val Idle = new State
     val Write = new State
     val Read = new State


     Init.whenIsActive{
       goto(Idle)
     }

     Idle.whenIsActive{

      when((io.bus.CYC & io.bus.STB)&(fromWbStreamFifo.io.pushOccupancy <2 ) )
      {
        fromWbToCdcStream.valid := True
        when(io.bus.WE)
        {
          io.bus.ACK := True
          goto(Idle)
        //  goto(Write)
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
          io.bus.ACK := True
         goto(Idle)
       }

     }
/*
     Write.whenIsActive{

       io.bus.ACK := True
       goto(Idle)
     }
*/

   }


/*
   when( ((io.bus.CYC & io.bus.STB)) & (prevCycStb === False)  )
   {
     fromWbToCdcStream.valid := True
   }
   .otherwise
   {
     fromWbToCdcStream.valid := False
   }

   io.bus.DAT_MISO := fromCdcToWbStream.payload.rdt
   when( fromCdcToWbStream.valid === True )
   {
     io.bus.ACK := True
     fromCdcToWbStream.ready := True
   }.otherwise
   {
     io.bus.ACK := False
     fromCdcToWbStream.ready := False
   }
 */


 }

 val videoArea = new ClockingArea(videoClockDomain)
 {
   val hdmi_tx_int = BufferCC(io.i_hdmi_tx_int)
   val wb = Wishbone(WishboneVideoCtrl.getWishboneConfig)
   val video_ready = Reg(Bool()) init(False)
   video_ready := False
   video_ready_wire := video_ready

    wb.CYC := False
    wb.STB := False
    wb.WE := fromCdcToVideoStream.payload.we
    wb.DAT_MOSI := fromCdcToVideoStream.payload.dat
    wb.ADR := fromCdcToVideoStream.payload.adr
    fromVideoToCdcStream.payload.rdt := wb.DAT_MISO



/*
   val cyc_stb = Reg(Bool()) init(False)
   wb.CYC := cyc_stb
   wb.STB := cyc_stb
*/

   val fsm = new StateMachine{

    val Init =  new State with EntryPoint
    val Idle = new State
    val Read = new State
    val Write = new State

    Init.whenIsActive{

      goto(Idle)
    }

    Idle.whenIsActive{

     when(fromCdcToVideoStream.valid )
     {

       wb.CYC := True
       wb.STB := True
       when(fromCdcToVideoStream.payload.we)
       {
         goto(Write)
       }.otherwise
       {
         goto(Read)
       }
     }

    }


    Read.whenIsActive{
      wb.CYC := True
      wb.STB := True
      when(wb.ACK)
      {
    //    video_ready := True
        fromCdcToVideoStream.ready := True
        fromVideoToCdcStream.valid := True
        goto(Idle)
      }

    }


    Write.whenIsActive{
      wb.CYC := True
      wb.STB := True
      when(wb.ACK)
      {
        fromCdcToVideoStream.ready := True

        goto(Idle)
      }
    }





   }



/*
   val we = Reg(Bool()) init(False)
   wb.WE := we
   val fromCdcToVideoStreamValid = Reg(Bool()) init(false)
   fromCdcToVideoStreamValid := fromCdcToVideoStream.valid

   val dat_mosi = Reg(Bits(32 bits)) init(0)
   dat_mosi := fromCdcToVideoStream.payload.dat

   fromCdcToVideoStream.ready := False
   fromVideoToCdcStream.valid := False

   wb.ADR := fromCdcToVideoStream.payload.adr
   wb.DAT_MOSI := dat_mosi
   //we := fromCdcToVideoStream.payload.we & fromCdcToVideoStreamValid

   fromVideoToCdcStream.ack := wb.ACK
   fromVideoToCdcStream.rdt := wb.DAT_MISO
   */
/*
   when(fromCdcToVideoStream.valid )
   {
      fromCdcToVideoStream.ready := True
      wb.CYC := True
      wb.STB := True

   }.otherwise
   {
      wb.CYC := False
      wb.STB := False
      fromCdcToVideoStream.ready := False
   }
*/

/*
   when(wb.ACK === True)
   {
    fromVideoToCdcStream.valid := True
   }.otherwise
   {

   }
*/

   //
   // val fsm = new StateMachine
   // {
   //
   //   val Init = new State with EntryPoint
   //   val StbCycLow = new State
   //   val StbCycHigh = new State
   //
   //  Init.whenIsActive{
   //
   //    cyc_stb := False
   //    we := False
   //
   //    goto(StbCycLow)
   //  }
   //
   //  StbCycLow.whenIsActive
   //  {
   //    cyc_stb := False
   //    we := False
   //    when(/*fromCdcToVideoStream.valid*/ fromCdcToVideoStreamValid  === True)
   //    {
   //      fromCdcToVideoStream.ready := True
   //      cyc_stb := True
   //      we := fromCdcToVideoStream.payload.we
   //      goto(StbCycHigh)
   //    }
   //
   //  }
   //
   //  StbCycHigh.whenIsActive
   //  {
   //    cyc_stb := True
   //    we := fromCdcToVideoStream.payload.we
   //     when(wb.ACK === True)
   //     {
   //       fromVideoToCdcStream.valid := True
   //       cyc_stb := False
   //       we := False
   //       goto(StbCycLow)
   //     }
   //  }
   //
   //
   // }

    val busCtrl = WishboneSlaveFactory(wb);
    val vgaCtrl = new VgaCtrl(rgbConfig,12)


    //TODO not convenient to call 3 functions to glue data we want to read and/or write from Wishbone bus.
    // Only one function call needed. Also calculation of address offset inside VgaCtrl can lead to error if another wishbone accessible data is added.
    vgaCtrl.readFrom(busCtrl,0);
    val bridge = vgaCtrl.io.timings.driveFrom(busCtrl,0);
    val bridge_soft_reset = vgaCtrl.io.softReset.driveAndRead(busCtrl,0)


    io.vga <> vgaCtrl.io.vga
    io.frameStart := vgaCtrl.io.frameStart
    vgaCtrl.io.pixels <> io.pixels
    vgaCtrl.io.hdmi_tx_int <> hdmi_tx_int

 }


  //
  // No clock domain crossing
  // val busCtrl = WishboneSlaveFactory(io.bus);
  // val vgaCtrl = new VgaCtrl(rgbConfig,12)
  //
  // val bridge = vgaCtrl.io.timings.driveFrom(busCtrl,0)
  // val bridge_soft_reset = vgaCtrl.io.softReset.driveFrom(busCtrl,0)
  //
  //
  // io.vga <> vgaCtrl.io.vga //  bridge.vgaBuffer
  // io.frameStart := vgaCtrl.io.frameStart
  // vgaCtrl.io.pixels <> io.pixels

}
