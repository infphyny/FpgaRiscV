package wbavlcdc

import spinal.core._
import spinal.lib._



case class WbAvlCdcConfig(
  mem_size : BigInt,
  word_size : BigInt
)


object WbAvlCdcConfig{
  
  def default = {
    val config = WbAvlCdcConfig(
      mem_size = 512 MB,
      word_size = 8
    )
    config
  }

}
