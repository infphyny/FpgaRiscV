package spinal.lib.graphic.vga

import spinal.core._
import spinal.lib._
import spinal.lib.bus.misc.{BusSlaveFactory, BusSlaveFactoryAddressWrapper}
import spinal.lib.experimental.bus.neutral.NeutralStreamDma
import spinal.lib.eda.altera.QSysify
import spinal.lib.graphic.{RgbConfig, Rgb}


case class VgaTimingsHV(timingsWidth: Int) extends Bundle {
  val syncStart = UInt(timingsWidth bit)
  val syncEnd = UInt(timingsWidth bit)
  val colorStart = UInt(timingsWidth bit)
  val colorEnd = UInt(timingsWidth bit)
  val polarity = Bool()
}

/*
 Add SoftReset settings to be controlled by cpu
*/
case class SoftResetSetting() extends Bundle{

 val soft_reset = Bool()

  def driveAndRead(busCtrl : BusSlaveFactory,baseAddress : Int) : Unit = {
    require(busCtrl.busDataWidth == 32)
  //  val busCtrlWithOffset = new BusSlaveFactoryAddressWrapper(busCtrl, baseAddress)

  //  busCtrlWithOffset.write(soft_reset, address = baseAddress + 32, bitOffset = 2)
  //  busCtrlWithOffset.read(soft_reset, address =baseAddress + 32, bitOffset = 2)
    busCtrl.driveAndRead(soft_reset,baseAddress + 32, 2) init(True)


  }
}




case class VgaTimings(timingsWidth: Int) extends Bundle {
  val h = VgaTimingsHV(timingsWidth)
  val v = VgaTimingsHV(timingsWidth)

  def setAs_h640_v480_r60: Unit = {
    h.syncStart := 95
    h.syncEnd := 799
    h.colorStart := 143
    h.colorEnd := 783
    v.syncStart := 1
    v.syncEnd := 524
    v.colorStart := 34
    v.colorEnd := 514
    h.polarity := False
    v.polarity := False
  }
  def setAs_h64_v64_r60: Unit = {
    h.syncStart := 96 - 1
    h.syncEnd := 800 - 1
    h.colorStart := 96 + 16 - 1 + 288
    h.colorEnd := 800 - 48 - 1 - 288
    v.syncStart := 2 - 1
    v.syncEnd := 525 - 1
    v.colorStart := 2 + 10 - 1 + 208
    v.colorEnd := 525 - 33 - 1 - 208
    h.polarity := False
    v.polarity := False
  }

  def setAs(hPixels : Int,
            hSync : Int,
            hFront : Int,
            hBack : Int,
            hPolarity : Boolean,
            vPixels : Int,
            vSync : Int,
            vFront : Int,
            vBack : Int,
            vPolarity : Boolean): Unit = {
    h.syncStart := hSync - 1
    h.colorStart := hSync + hBack - 1
    h.colorEnd := hSync + hBack + hPixels - 1
    h.syncEnd := hSync + hBack + hPixels + hFront - 1
    v.syncStart := vSync - 1
    v.colorStart := vSync + vBack - 1
    v.colorEnd := vSync + vBack + vPixels - 1
    v.syncEnd := vSync + vBack + vPixels + vFront - 1
    h.polarity := Bool(hPolarity)
    v.polarity := Bool(vPolarity)
  }


  def setAs_h1920_v1080_r60: Unit = setAs(
    hPixels    = 1920,
    hSync      = 44,
    hFront     = 88,
    hBack      = 148,
    hPolarity  = true,
    vPixels    = 1080,
    vSync      = 5,
    vFront     = 4,
    vBack      = 36,
    vPolarity  = true
  )

  def setAs_h800_v600_r60: Unit = setAs(
    hPixels    = 800,
    hSync      = 128,
    hFront     = 40,
    hBack      = 88,
    hPolarity  = true,
    vPixels    = 600,
    vSync      = 4,
    vFront     = 1,
    vBack      = 23,
    vPolarity  = true
  )


  def driveFrom(busCtrl : BusSlaveFactory,baseAddress : Int) : Unit = {
    require(busCtrl.busDataWidth == 32)

    busCtrl.driveAndRead(h.syncStart  ,baseAddress +  0)
    busCtrl.driveAndRead(h.syncEnd    ,baseAddress +  4)
    busCtrl.driveAndRead(h.colorStart ,baseAddress +  8)
    busCtrl.driveAndRead(h.colorEnd   ,baseAddress + 12)
    busCtrl.driveAndRead(v.syncStart  ,baseAddress + 16)
    busCtrl.driveAndRead(v.syncEnd    ,baseAddress + 20)
    busCtrl.driveAndRead(v.colorStart ,baseAddress + 24)
    busCtrl.driveAndRead(v.colorEnd   ,baseAddress + 28)
    busCtrl.driveAndRead(h.polarity   ,baseAddress + 32, 0) init(False)
    busCtrl.driveAndRead(v.polarity   ,baseAddress + 32, 1) init(False)
  }
}


object VgaTimingPrint extends App{
  def show( hPixels : Int,
            hSync : Int,
            hFront : Int,
            hBack : Int,
            hPolarity : Boolean,
            vPixels : Int,
            vSync : Int,
            vFront : Int,
            vBack : Int,
            vPolarity : Boolean): Unit = {
    val h_syncStart = hSync - 1
    val h_colorStart = hSync + hBack - 1
    val h_colorEnd = hSync + hBack + hPixels - 1
    val h_syncEnd = hSync + hBack + hPixels + hFront - 1
    val v_syncStart = vSync - 1
    val v_colorStart = vSync + vBack - 1
    val v_colorEnd = vSync + vBack + vPixels - 1
    val v_syncEnd = vSync + vBack + vPixels + vFront - 1

    println(
      s"""    .hSyncStart  = $h_syncStart,
         |    .hSyncEnd    = $h_syncEnd,
         |    .hColorStart = $h_colorStart,
         |    .hColorEnd   = $h_colorEnd,
         |    .vSyncStart  = $v_syncStart,
         |    .vSyncEnd 	 = $v_syncEnd,
         |    .vColorStart = $v_colorStart,
         |    .vColorEnd 	 = $v_colorEnd,
         |    .polarities  = ${(if(hPolarity) 1 else 0) | (if(vPolarity) 2 else 0)},
         |""".stripMargin)
  }

  show(
    hPixels    = 640,
    hSync      = 96,
    hFront     = 16,
    hBack      = 48,
    hPolarity  = false,
    vPixels    = 480,
    vSync      = 2,
    vFront     = 10,
    vBack      = 33,
    vPolarity  = false
  )
}

case class VgaCtrl(rgbConfig: RgbConfig, timingsWidth: Int = 12) extends Component {
  val io = new Bundle {
    //val softReset = in Bool() default(False)
    val softReset = in(SoftResetSetting())
    val timings   = in(VgaTimings(timingsWidth))
    val hdmi_tx_int = in Bool()
  //  val hdmi_tx_int = in(HdmiTxInt())
    val frameStart = out Bool()
    val pixels     = slave Stream (Rgb(rgbConfig))
    val vga        = master(Vga(rgbConfig))

    val error      = out Bool()
  }

  case class HVArea(timingsHV: VgaTimingsHV, enable: Bool) extends Area {
    val counter = Reg(UInt(timingsWidth bit)) init(0)

    val syncStart = counter === timingsHV.syncStart
    val syncEnd = counter === timingsHV.syncEnd
    val colorStart = counter === timingsHV.colorStart
    val colorEnd = counter === timingsHV.colorEnd
    val polarity = timingsHV.polarity

    when(enable) {
      counter := counter + 1
      when(syncEnd) {
        counter := 0
      }
    }

    val sync    = RegInit(False) setWhen(syncStart) clearWhen(syncEnd)
    val colorEn = RegInit(False) setWhen(colorStart) clearWhen(colorEnd)

    when(io.softReset.soft_reset) {
      counter := 0
      sync := False
      colorEn := False
    }
  }

  val h = HVArea(io.timings.h, True)
  val v = HVArea(io.timings.v, h.syncEnd) // h.colorEnd
  val colorEn = h.colorEn && v.colorEn
  io.pixels.ready := colorEn
  io.error := colorEn && !io.pixels.valid

  io.frameStart := v.syncStart && h.syncStart

  io.vga.hSync := h.sync ^ h.polarity
  io.vga.vSync := v.sync ^ v.polarity
  io.vga.colorEn := colorEn
  io.vga.color := io.pixels.payload


  def readFrom(busCtrl : BusSlaveFactory,baseAddress : Int) : Unit = {
    require(busCtrl.busDataWidth == 32)

      busCtrl.read(io.hdmi_tx_int,baseAddress + 32, 3)

  }

  //Can be called by parent component to make the VgaCtrl autonom by using a Stream of fragment to feed it.
  def feedWith(that : Stream[Fragment[Rgb]], resync : Bool = False): Unit ={
    val error = RegInit(False)
    val waitStartOfFrame = RegInit(False)
    val firstPixel = Reg(Bool) setWhen(io.frameStart) clearWhen(that.firstFire)

    io.pixels << that.toStreamOfFragment.throwWhen(error).haltWhen(waitStartOfFrame)

    when(io.frameStart){
      waitStartOfFrame := False
    }
    when(that.fire && that.last){
      error := False
      waitStartOfFrame := error
    }
    when(!waitStartOfFrame && !error) {
      when(io.error || resync || firstPixel && that.valid && !that.first) {
        error := True
      }
    }
  }
}


object VgaCtrl {
  def main(args: Array[String]) {
    SpinalVhdl(new VgaCtrl(RgbConfig(8, 8, 8)))
  }
}

//TODO add to doc example
class BlinkingVgaCtrl(rgbConfig: RgbConfig) extends Component{
  val io = new Bundle{
    val vga = master(Vga(rgbConfig))
  }

  val counter = Reg(UInt(rgbConfig.gWidth bits))
  val ctrl = new VgaCtrl(rgbConfig)
  ctrl.io.softReset.soft_reset := False
  ctrl.io.timings.setAs_h640_v480_r60
  ctrl.io.pixels.valid := True
  ctrl.io.pixels.r := 0
  ctrl.io.pixels.g := counter
  ctrl.io.pixels.b := 0
  ctrl.io.vga <> io.vga

  when(ctrl.io.frameStart){
    counter := counter + 1
  }
}

object BlinkingVgaCtrl {
  def main(args: Array[String]) {
    SpinalVhdl(new BlinkingVgaCtrl(RgbConfig(8, 8, 8))).toplevel
  }
}
