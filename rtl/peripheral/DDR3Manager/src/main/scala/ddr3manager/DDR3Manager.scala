/*
 * SpinalHDL
 * Copyright (c) Dolu, All rights reserved.
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 3.0 of the License, or (at your option) any later version.
 *
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public
 * License along with this library.
 */

package ddr3manager

import spinal.core._
import spinal.lib._

class DDR3Manager extends Component  {
  
  val io = new Bundle{
    val i_status_we = in Bool()
    val i_status = in Bits(8 bits)
    val o_status = out Bits(8 bits)
    val i_init_success = in Bool()
    val i_cal_success = in Bool()
    val o_soft_reset_n = out Bool() 
    
  }

  val status = Reg(Bits(8 bits)) init(0);

  status(0) := io.i_init_success;
  status(1) := io.i_cal_success;
  
  io.o_status := status;
  
  io.o_soft_reset_n := status(2);

  when(io.i_status_we)
  { 
    status(7 downto 3) := 0;
    status(2) := io.i_status(2);
  }

}



//Hardware definition
class WishboneDDR3Manager extends Component {
  val io = new Bundle {

   val i_wb_stb = in Bool()
   val i_wb_cyc = in Bool()
   val i_wb_we = in Bool()
   val i_wb_dat = in Bits(8 bits)
   val o_wb_dat = out Bits(8 bits)

   val o_wb_ack = out Bool()
   val o_wb_rty = out Bool()
   val o_wb_err = out Bool()

   val i_init_success = in Bool()
   val i_cal_success = in Bool()

    val o_soft_reset_n = out Bool()
  }
  noIoPrefix
  val cs = io.i_wb_cyc & io.i_wb_stb
  val ack = Reg(Bool) init(False)
  io.o_wb_ack := ack;

  val manager = new DDR3Manager

   manager.io.i_status_we := False
   manager.io.i_status := io.i_wb_dat
   manager.io.i_cal_success := io.i_cal_success;
   manager.io.i_init_success := io.i_init_success;
   io.o_soft_reset_n := manager.io.o_soft_reset_n;
   io.o_wb_dat := manager.io.o_status
   io.o_wb_rty := False
   io.o_wb_err := False

  when(ack === True)
  {
    ack := False
  }

  when(cs === True)
  {
    ack := True
    when(io.i_wb_we === True)
    {
      manager.io.i_status_we := io.i_wb_we
      manager.io.i_status := io.i_wb_dat
    }
}


}

//Generate the MyTopLevel's Verilog
object MyTopLevelVerilog {
  def main(args: Array[String]) {
    SpinalVerilog(new WishboneDDR3Manager)
  }
}

/*
//Generate the MyTopLevel's VHDL
object MyTopLevelVhdl {
  def main(args: Array[String]) {
    SpinalVhdl(new DDR3Manager)
  }
}
*/

/*
//Define a custom SpinalHDL configuration with synchronous reset instead of the default asynchronous one. This configuration can be resued everywhere
object MySpinalConfig extends SpinalConfig(defaultConfigForClockDomains = ClockDomainConfig(resetKind = SYNC))

//Generate the MyTopLevel's Verilog using the above custom configuration.
object MyTopLevelVerilogWithCustomConfig {
  def main(args: Array[String]) {
    MySpinalConfig.generateVerilog(new MyTopLevel)
  }
}
*/