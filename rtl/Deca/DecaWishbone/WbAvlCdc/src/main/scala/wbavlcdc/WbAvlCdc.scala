/*


 



*/




package wbavlcdc

import spinal.core._
import spinal.lib._
import spinal.lib.fsm._

//Hardware definition
class WbAvlCdc(config : WbAvlCdcConfig ) extends Component {

  val io = new Bundle {
    val i_wb_clock = in  Bool()
    val i_wb_reset = in  Bool()
    val i_wb_adr = in UInt(32 bits)
    val i_wb_sel = in Bits(4 bits)
    val i_wb_dat = in Bits(32 bits)
    val o_wb_rdt = out Bits(32 bits)
    val i_wb_we = in Bool()
    val i_wb_cyc = in Bool()
    val i_wb_stb = in Bool()
    val o_wb_ack = out Bool()
    val o_wb_err = out Bool()
    val o_wb_rty = out Bool()
    
    val i_avl_clock  = in Bool()
    val i_avl_reset = in Bool()
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
  noIoPrefix;
   val wbClockDomain = ClockDomain(
    clock = io.i_wb_clock,
    reset = io.i_wb_reset,
    config = ClockDomainConfig(
      clockEdge = RISING,
      resetKind = ASYNC,
      resetActiveLevel = HIGH
    )
  )
val avlClockDomain = ClockDomain(
    clock = io.i_avl_clock,
    reset = io.i_avl_reset,
    config = ClockDomainConfig(
      clockEdge = RISING,
      resetKind = ASYNC,
      resetActiveLevel = HIGH
    )
  )

  io.o_wb_err := False
  io.o_wb_rty := False


//----------- cdc avl_burstbegin -----------------------------
 
 
 val wb2cdc_burstbegin = Stream(Bool())
 wb2cdc_burstbegin.payload := False
 wb2cdc_burstbegin.valid := False
 val cdc2avl_burstbegin = Stream(Bool())
io.o_avl_burstbegin := cdc2avl_burstbegin.payload & cdc2avl_burstbegin.valid
 cdc2avl_burstbegin.ready := False
 val avl_burstbegin = StreamFifoCC(
    dataType = Bool,
    depth = 2,
    pushClock = wbClockDomain, 
    popClock = avlClockDomain
 )

 avl_burstbegin.io.push << wb2cdc_burstbegin
 avl_burstbegin.io.pop >> cdc2avl_burstbegin
 
//----------- cdc avl_be -------------------------------------  
val be_wire = Bits(config.word_size bits) 
 be_wire := 0
val wb2cdc_be = Stream(Bits(config.word_size bits))
wb2cdc_be.payload := be_wire
wb2cdc_be.valid := False

val cdc2avl_be = Stream(Bits(config.word_size bits))
io.o_avl_be := cdc2avl_be.payload
cdc2avl_be.ready := False

val avl_be = StreamFifoCC(
    dataType = Bits(config.word_size bits),
    depth = 2,
    pushClock = wbClockDomain, 
    popClock = avlClockDomain
 )
 avl_be.io.push << wb2cdc_be
 avl_be.io.pop >> cdc2avl_be



//--------- cdc avl_adr -----------------------------------

val wb2cdc_adr = Stream( UInt( log2Up(config.mem_size/config.word_size) bits) )
 wb2cdc_adr.payload := io.i_wb_adr( log2Up(config.mem_size/config.word_size)+log2Up(config.word_size)-1 downto log2Up(config.word_size) ) 
 wb2cdc_adr.valid := False

val cdc2avl_adr = Stream(UInt( log2Up(config.mem_size/config.word_size) bits)) 
io.o_avl_adr := cdc2avl_adr.payload
cdc2avl_adr.ready := False

val avl_adr = StreamFifoCC(
    dataType =UInt( log2Up(config.mem_size/config.word_size) bits),
    depth = 2,
    pushClock = wbClockDomain, 
    popClock = avlClockDomain
 )

avl_adr.io.push << wb2cdc_adr
avl_adr.io.pop >> cdc2avl_adr

//-------- cdc avl_dat --------------------------------

   val wb2cdc_dat = Stream(Bits(config.word_size*8 bits))
      wb2cdc_dat.payload := io.i_wb_dat ## io.i_wb_dat
      wb2cdc_dat.valid := False
  val cdc2avl_dat = Stream(Bits(config.word_size*8 bits))
     io.o_avl_dat := cdc2avl_dat.payload 
     cdc2avl_dat.ready := False

  val avl_dat =  StreamFifoCC(
     dataType = Bits(config.word_size*8 bits),
     depth = 2,
     pushClock = wbClockDomain,
     popClock = avlClockDomain
  )
  
   avl_dat.io.push << wb2cdc_dat
   avl_dat.io.pop >> cdc2avl_dat

//--------- cdc avl_wr_req signal ------------------------- 
  val wb2cdc_wr_req = Stream(Bool())
   wb2cdc_wr_req.payload := False //io.i_wb_cyc & io.i_wb_stb & io.i_wb_we
  wb2cdc_wr_req.valid := False
  val cdc2avl_wr_req = Stream(Bool())
  io.o_avl_wr_req := cdc2avl_wr_req.payload & cdc2avl_wr_req.valid
  cdc2avl_wr_req.ready := False

  val avl_wr_req =  StreamFifoCC(
     dataType = Bool,
     depth = 2,
     pushClock = wbClockDomain,
     popClock = avlClockDomain
  )

   avl_wr_req.io.push << wb2cdc_wr_req
   avl_wr_req.io.pop >> cdc2avl_wr_req




//--------- cdc avl_rdt_req -------------------------------

 val wb2cdc_rdt_req = Stream(Bool())
 wb2cdc_rdt_req.payload := False
 wb2cdc_rdt_req.valid := False
 val cdc2avl_rdt_req = Stream(Bool())
 cdc2avl_rdt_req.ready := False
 io.o_avl_rdt_req := cdc2avl_rdt_req.payload & cdc2avl_rdt_req.valid
  val avl_rdt_req  =  StreamFifoCC(
      dataType = Bool,
        depth = 2,
        pushClock = wbClockDomain,
        popClock = avlClockDomain
  )

  avl_rdt_req.io.push << wb2cdc_rdt_req
  avl_rdt_req.io.pop >> cdc2avl_rdt_req

//------------ cdc avl_rdt -----------------------------------
 //val wb_rdt_wire = (Bits(32 bits)) 

 val avl2cdc_rdt = Stream(Bits(config.word_size*8 bits))
    avl2cdc_rdt.payload := io.i_avl_rdt
    avl2cdc_rdt.valid := False
  val cdc2wb_rdt = Stream(Bits(config.word_size*8 bits))
  cdc2wb_rdt.ready := False
  //TODO choose the right data from memory address default to lower 32 bits of 64 bits
  io.o_wb_rdt := /*wb_rdt_wire*/ cdc2wb_rdt.payload(31 downto 0) 
  
  val avl_rdt = new StreamFifoCC(
    dataType = Bits(config.word_size*8 bits),
    depth = 2,
    pushClock = avlClockDomain,
    popClock = wbClockDomain
  )

  avl_rdt.io.push << avl2cdc_rdt
  avl_rdt.io.pop >> cdc2wb_rdt
  

// -------- cdc avl_rdt_valid -------------------------------
val avl2cdc_rdt_valid = Stream(Bool())
avl2cdc_rdt_valid.payload := io.i_avl_rdt_valid
avl2cdc_rdt_valid.valid := False

val cdc2wb_rdt_valid = Stream(Bool())
cdc2wb_rdt_valid.ready := False

val avl_rdt_valid =  new StreamFifoCC(
    dataType = Bool(),
    depth = 2,
    pushClock = avlClockDomain,
    popClock = wbClockDomain
  )

avl_rdt_valid.io.push << avl2cdc_rdt_valid
avl_rdt_valid.io.pop >> cdc2wb_rdt_valid

// --------- cdc avl_size ------------------------------------
val wb2cdc_size = Stream(UInt(3 bits))
wb2cdc_size.payload := 0
wb2cdc_size.valid := False

val cdc2avl_size = Stream(UInt(3 bits))
cdc2avl_size.ready := False
io.o_avl_size := cdc2avl_size.payload

val avl_size = new StreamFifoCC(
   dataType = UInt(3 bits),
        depth = 2,
        pushClock = wbClockDomain,
        popClock = avlClockDomain
)

 avl_size.io.push << wb2cdc_size
 avl_size.io.pop >> cdc2avl_size


  val wbClockArea = new ClockingArea(wbClockDomain)
  {
    val cycle = Reg(UInt(1 bits)) init(0)
   // val transaction_done = Reg(Bool) init(False)
     
    io.o_wb_ack := False
    val avl_ready = BufferCC(io.i_avl_ready)
    val cyc_stb = io.i_wb_cyc & io.i_wb_stb


     val wbStateMachine = new StateMachine{
         val init = new State with EntryPoint
         val ready = new State
         val read = new State
         val post_read = new State
         val write = new State
         val post_write = new State  
         init
         .whenIsActive
         {
           when(cycle === 0)
           {
            cycle := 1 
            wb2cdc_wr_req.payload := False
            wb2cdc_wr_req.valid := True 
            wb2cdc_rdt_req.payload := False
            wb2cdc_rdt_req.valid := True
           }.elsewhen(cycle === 1)
           {
             wb2cdc_wr_req.payload := False
             wb2cdc_wr_req.valid := False 
             wb2cdc_rdt_req.payload := False
             wb2cdc_rdt_req.valid := False
             
             when(avl_rdt_valid.io.popOccupancy === 1)
             {
               cdc2wb_rdt_valid.ready := True
               goto(ready)  
             }

           }

         }
         .onExit
         {
           cycle := 0
         }   

        ready.whenIsActive{
              
               wb2cdc_adr.valid := False
              

              when(cyc_stb && avl_ready)
              {
                when(cycle === 0)
                {
                  wb2cdc_adr.valid := True
                  wb2cdc_be.valid := True
                  
                  switch(io.i_wb_adr(2)) //Generate byte enable for avl
                    {
                      is(False)
                      {
                          be_wire := U(0,4 bits) ## io.i_wb_sel
                      }
                      is(True)
                      {
                          
                          be_wire := io.i_wb_sel ##  U(0,4 bits)
                      }
                    }

                  wb2cdc_burstbegin.valid := True
                  wb2cdc_burstbegin.payload := True
                  
                  wb2cdc_size.payload := 1
                  wb2cdc_size.valid := True

                  cycle := 1
                }.elsewhen(cycle === 1)
                {
                   wb2cdc_adr.valid := False
                   wb2cdc_be.valid := False
                   wb2cdc_burstbegin.valid := True
                   wb2cdc_burstbegin.payload := False
                   wb2cdc_size.payload := 0
                   wb2cdc_size.valid := True
                   
                }

                 when(io.i_wb_we)
                 { 
                   when(cycle === 0)
                   { 
                    wb2cdc_dat.valid := True
                    wb2cdc_wr_req.payload := True
                    wb2cdc_wr_req.valid := True
                   }.elsewhen(cycle === 1)
                   {
                    wb2cdc_dat.valid := False
                    wb2cdc_wr_req.payload := False
                    wb2cdc_wr_req.valid := True
                //    wb2cdc_burstbegin.payload := False
                 //   wb2cdc_burstbegin.valid := True
                    goto(write)
                   } 
                 }.elsewhen(!io.i_wb_we)
                 {

                   when(cycle === 0)
                   {
                    wb2cdc_rdt_req.payload := True
                    wb2cdc_rdt_req.valid := True



                   }.elsewhen(cycle === 1)
                   {
                      wb2cdc_rdt_req.payload := False
                      wb2cdc_rdt_req.valid := True
                      goto(read)  
                   }
                   
                 } 

              }
             
           }.onExit
           {
             cycle := 0
            // wb2cdc_adr.valid := False
            // wb2cdc_dat.valid := False
            // wb2cdc_burstbegin.valid := False
           }

       read.whenIsActive{
  
          when( cdc2wb_rdt_valid.payload & cdc2wb_rdt_valid.valid /*(avl_wr_req.io.pushOccupancy === 0)*/ )
          {
              
            /*
            wb2cdc_burstbegin.payload := False
            wb2cdc_burstbegin.valid := True

            wb2cdc_rdt_req.payload := False
            wb2cdc_rdt_req.valid := True
            */
            
            switch(io.i_wb_adr(2)) //Generate byte enable for avl
            {
              is(False)
              {
                  io.o_wb_rdt/*wb_rdt*/ := cdc2wb_rdt.payload(31 downto 0)
              }
              is(True)
              {
                  io.o_wb_rdt :=  cdc2wb_rdt.payload(63 downto 32)
              }
            }
            cdc2wb_rdt.ready := True
            cdc2wb_rdt_valid.ready := True  
            io.o_wb_ack := True
            goto(ready)
          }
       }

       write.whenIsActive{
            
             when((avl_wr_req.io.pushOccupancy === 0))
             {
               io.o_wb_ack := True
               goto(ready)
             }

       }    

     } 


   //  val wb_rdt = Reg(Bits(32 bits)) init(0)
    // wb_rdt_wire := wb_rdt
    /*
     val ack = Reg(Bool()) init(False)
     ack := False
     io.o_wb_ack := ack
     */
     

/*
    when(avl_wr_req.io.pushOccupancy === 0)
    {
      wb2cdc_wr_req.valid := True
       wb2cdc_wr_req.payload := False
    } 
*/

    // when(cyc_stb & avl_ready)
    //  {
    //    wb2cdc_burstbegin.payload := True
    //    wb2cdc_burstbegin.valid := True

    //    wb2cdc_size.payload := U(1,3 bits)
    //    wb2cdc_size.valid := True
      
    //   when(avl_be.io.pushOccupancy === 0)
    //   {
    //     wb2cdc_be.valid := True
    //   }  


    //    switch(io.i_wb_adr(2)) //Generate byte enable for avl
    //    {
    //      is(False)
    //      {
    //         be_wire := U(0,4 bits) ## io.i_wb_sel
    //      }
    //      is(True)
    //      {
            
    //         be_wire := io.i_wb_sel ##  U(0,4 bits)
    //      }
    //    }


     
    //  when(io.i_wb_we & (avl_dat.io.pushOccupancy === 0) & (avl_wr_req.io.pushOccupancy === 0) )
    //  {
    //    io.o_wb_ack := True
      
    //    wb2cdc_wr_req.valid := True
    //    wb2cdc_wr_req.payload := True
    //    wb2cdc_dat.valid := True

    //   when(avl_adr.io.pushOccupancy === 0)
    //   {
    //     wb2cdc_adr.valid := True
    //   }



    //  }/*.elsewhen(avl_dat.io.pushOccupancy === 0)
    //  {
    //     wb2cdc_wr_req.valid := True
    //    wb2cdc_wr_req.payload := False
    //  }*/

    //  when(!io.i_wb_we & ( avl_rdt_req.io.pushOccupancy === 0 )   )
    //  {
    //    //ack := True
    //    wb2cdc_rdt_req.valid := True
    //    wb2cdc_rdt_req.payload := True
      
    //    when(avl_adr.io.pushOccupancy === 0)
    //     {
    //       wb2cdc_adr.valid := True
    //     }


    //  }/*.elsewhen(avl_rdt_req.io.pushOccupancy === 0)
    //  {
    //     wb2cdc_rdt_req.valid := True
    //    wb2cdc_rdt_req.payload := False
    //  }*/

    //  when( (!io.i_wb_we & /*cdc2wb_rdt_valid.payload & cdc2wb_rdt.valid*/avl_rdt.io.popOccupancy =/= 0) & (transaction_done === False)  )     
    //   {
    //     transaction_done := True
    //     cdc2wb_rdt.ready := True
    //     cdc2wb_rdt_valid.ready := True
    //     //cdc2wb_rdt_ready.ready := True
    //     io.o_wb_ack := True
        
    //     switch(io.i_wb_adr(2)) //Generate byte enable for avl
    //     {
    //       is(False)
    //       {
    //           io.o_wb_rdt/*wb_rdt*/ := cdc2wb_rdt.payload(31 downto 0)
    //       }
    //       is(True)
    //       {
    //           io.o_wb_rdt :=  cdc2wb_rdt.payload(63 downto 32)
    //       }
    //     }

    //   }
    //  }
     
    //  .otherwise
    //  {
    //    transaction_done := False 
    //   /*
    //    when(avl_wr_req.io.pushOccupancy === 0)
    //    {
    //     wb2cdc_wr_req.valid := True
    //     wb2cdc_wr_req.payload := False
    //    }

    //    when(avl_rdt_req.io.pushOccupancy === 0)
    //    {
    //      wb2cdc_rdt_req.valid := True
    //      wb2cdc_rdt_req.payload := False
    //    }

    //    when(avl_rdt_valid.io.popOccupancy =/= 0)
    //    {
    //      cdc2wb_rdt_valid.ready := True 
    //    }
    //   */ 
    //  }

     
  }

  
  val avlClockArea = new ClockingArea(avlClockDomain)
  {
    
    val cycle = Reg(UInt(1 bits)) init(0)
    val rdt_valid = Reg(Bool()) init(False)
    val rdt_req = Reg(Bool()) init(False)

    val avlStateMachine = new StateMachine{

     val init = new State with EntryPoint
     val ready = new State  
     val read = new State
     val write = new State

     init.whenIsActive{

       when(cycle === 0)
       {
         avl2cdc_rdt_valid.payload := False
         avl2cdc_rdt_valid.valid := True
         cycle := 1
       }.elsewhen(cycle === 1)
       {
         avl2cdc_rdt_valid.payload := False
         avl2cdc_rdt_valid.valid := False
         

         when(avl_rdt_req.io.popOccupancy === 1)
         {
           cdc2avl_rdt_req.ready := True
           cdc2avl_wr_req.ready := True
           goto(ready)
         }
         
       }

     }
     .onExit{
       cycle := 0
     }

     ready.whenIsActive{
      
      when(cdc2avl_wr_req.valid && cdc2avl_wr_req.payload)
      {
        cdc2avl_wr_req.ready := True
       
        cdc2avl_burstbegin.ready := True     
        cdc2avl_size.ready := True
        goto(write)
      }.elsewhen(cdc2avl_rdt_req.valid && cdc2avl_rdt_req.payload)
      {

         cdc2avl_rdt_req.ready := True
        
        // cdc2avl_adr.ready := True
        
         cdc2avl_be.ready := True
         cdc2avl_burstbegin.ready := True
         cdc2avl_size.ready := True
         
         goto(read)
      }

     } 

     write.whenIsActive{

       when(cdc2avl_wr_req.valid && !cdc2avl_wr_req.payload)
       {

        cdc2avl_adr.ready := True 
        cdc2avl_dat.ready := True
        cdc2avl_be.ready := True

         cdc2avl_wr_req.ready := True
         cdc2avl_burstbegin.ready := True
         cdc2avl_size.ready := True  
        
         goto(ready)
       }   

     }
    read.whenIsActive{

         // when(cdc2avl_rdt_req.valid && ! cdc2avl_rdt_req.payload)
         // {
            /*
            cdc2avl_rdt_req.ready := True
            cdc2avl_burstbegin.ready := True
            cdc2avl_size.ready := True
            cdc2avl_be.ready := True
            //goto(ready)
            rdt_req := True
            */
           // cycle := cycle + 1
         // }

          when(io.i_avl_rdt_valid)
          {
            
      
            avl2cdc_rdt_valid.payload := True
            avl2cdc_rdt_valid.valid := True
            avl2cdc_rdt.payload := io.i_avl_rdt
            avl2cdc_rdt.valid := True
            rdt_valid := True
            //cycle := cycle + 1
            
          }

          when(rdt_valid /*&& rdt_req*/)
          {
            cdc2avl_adr.ready := True
            cdc2avl_be.ready := True
           
            //cdc2avl_size.ready := True

            cdc2avl_rdt_req.ready := True
            cdc2avl_burstbegin.ready := True
            cdc2avl_size.ready := True
         
  
            goto(ready)  
          }

        }
        .onExit
        {
          rdt_valid := False
          rdt_req := False
          cycle := 0
        }
        
    } 

   
    /*
    val avl_adr = Reg(UInt(log2Up(config.mem_size/config.word_size) bits)) init(0) 
    io.o_avl_adr := avl_adr
    


    avl_adr := avl_adr 
   
    val is_read = cdc2avl_rdt_req.valid & cdc2avl_rdt_req.payload
    val is_write = cdc2avl_wr_req.valid & cdc2avl_wr_req.payload
    when( (is_read || is_write) & cdc2avl_adr.payload.valid )
    {
      avl_adr := cdc2avl_adr.payload
    }
*/
     //Tell that data is consume
  //   when(cdc2avl_burstbegin.valid)
  //    {
  //      cdc2avl_burstbegin.ready := True
  //    }

  //    when(cdc2avl_be.valid)
  //    {
  //      cdc2avl_be.ready := True
  //    }

  //    when(cdc2avl_adr.valid)
  //    {
  //      cdc2avl_adr.ready := True
  //    }

  //    when(cdc2avl_dat.valid)
  //   {
  //     cdc2avl_dat.ready := True
  //   }

  //   when(cdc2avl_wr_req.valid)
  //   {
  //     cdc2avl_wr_req.ready := True
  //    // cdc2avl_wr_req.payload := False
  //   }

  //   when(cdc2avl_rdt_req.valid)
  //   {
  //     cdc2avl_rdt_req.ready := True
  //   } 

   
  //   when(cdc2avl_size.valid)
  //   {
  //     cdc2avl_size.ready := True
  //   }
   
  //  //End tell data is consume
    
  //   when( io.i_avl_rdt_valid && (avl_rdt_valid.io.pushOccupancy === 0) )
  //   {
      
  //     //avl2cdc_rdt_valid.payload := io.i_avl_rdt_valid
  //     avl2cdc_rdt_valid.valid := True
  //   }

  //   when(io.i_avl_rdt_valid && (avl_rdt.io.pushOccupancy === 0))
  //   {
  //       avl2cdc_rdt.valid := True 
  //   }

   }
  



}

//Generate the MyTopLevel's Verilog
object WbAvlCdcVerilog {
  def main(args: Array[String]) {
     SpinalConfig().withPrivateNamespace.generateVerilog(new WbAvlCdc( WbAvlCdcConfig.default)).printPruned
  //  SpinalVerilog(new WbAvlCdc( WbAvlCdcConfig.default))
  }
}




/*
//Define a custom SpinalHDL configuration with synchronous reset instead of the default asynchronous one. This configuration can be resued everywhere
object MySpinalConfig extends SpinalConfig(defaultConfigForClockDomains = ClockDomainConfig(resetKind = SYNC))

//Generate the MyTopLevel's Verilog using the above custom configuration.
object MyTopLevelVerilogWithCustomConfig {
  def main(args: Array[String]) {
    MySpinalConfig.generateVerilog(new MyTopLevel)
  }
}*/