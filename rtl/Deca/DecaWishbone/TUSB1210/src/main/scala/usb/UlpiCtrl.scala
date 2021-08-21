/*

 Description:


 
 Error code
    0x00 no error
    0x01 Reg Read send command timeout
    0x02 Reg Read turnaround 1 timeout
    0x03 Reg Read read ulpi data timeout



*/


package usb
import spinal.core._
import spinal.lib._
import spinal.lib.fsm._



class UlpiCtrl extends Component
{

  val io = new Bundle
  {
    val i_write_payload_we = in Bool
    val i_write_payload = in Bits(8 bits)
    val o_write_payload_ack = out Bool

    val o_read_payload = out Bits(8 bits)
    val o_read_payload_valid = out Bool

    val i_ulpi_dat = in Bits(8 bits) //input from phy
    val o_ulpi_dat = out Bits(8 bits) //output to phy
    
    val i_ulpi_dir = in Bool
    val i_usb_fault_n = in Bool
    val i_ulpi_nxt = in Bool
    val o_ulpi_stp = out Bool

    val o_error = out Bits(8 bits)

  }
  val CMD_CODE_SPECIAL   = B"2'b00"
  val CMD_CODE_TRANSMIT  = B"2'b01"
  val CMD_CODE_REG_WRITE = B"2'b10"
  val CMD_CODE_REG_READ  = B"2'b11"


  val ulpi_error = Reg(Bits(8 bits)) init(0)
  val write_payload_cc_1 = RegNext(io.i_write_payload) init(0) addTag(crossClockDomain)
  val write_payload_cc_2 = Reg(Bits(8 bits)) init(0)

  val write_payload_we_cc_1 = RegNext(io.i_write_payload_we) init(False) addTag(crossClockDomain)
  val write_payload_we_cc_2 = RegNext( write_payload_we_cc_1) init(False) 


  val write_payload_ack = Reg(Bool) init(False) 
  io.o_write_payload_ack := write_payload_ack

  val read_payload = Reg(Bits(8 bits)) init(0)
   io.o_read_payload := read_payload
  val read_payload_valid = Reg(Bool) init(False)
  read_payload_valid := False
  io.o_read_payload_valid := read_payload_valid 

  when(write_payload_ack === True)
  {
    write_payload_ack := False
  } 
 

  val o_ulpi_dat = Reg(Bits(8 bits)) init(0)
    o_ulpi_dat := B"8'h00"
   io.o_ulpi_dat := o_ulpi_dat
    
     
    when(write_payload_we_cc_2 === True)
    {
        write_payload_cc_2 := write_payload_cc_1
        write_payload_ack := True
    }
  

     io.o_error := ulpi_error
     
   
     val ulpi_stp = Reg(Bool) init(False)
       ulpi_stp := False
       io.o_ulpi_stp := ulpi_stp
   

      def RegReadFsm() = new StateMachine
      {
         val state_cycle_counter = Reg(UInt(16 bits)) init(0)
         val SendCmd :  State = new State with EntryPoint
         {
          
          onEntry{
            state_cycle_counter := 0
          }
          whenIsActive{
            state_cycle_counter := state_cycle_counter + 1
           // when(io.usb_dir_i === False)
            //{ 
              io.o_ulpi_dat := write_payload_cc_2
            
            when(state_cycle_counter === 65535 /* cpu_send_cc_2 =/= B"8'b11000000"*/)
            {
              ulpi_error := 0x01
              exit()
            }

              when( (io.i_ulpi_nxt === True) && (io.i_ulpi_dir === False) )
              {
                goto(TurnAround_1)
              }
           // }
           }
         }


         val TurnAround_1:  State = new State{

           onEntry{
               state_cycle_counter := 0
           }  
           whenIsActive{
              state_cycle_counter := state_cycle_counter + 1
                 when(state_cycle_counter === 65535 /* cpu_send_cc_2 =/= B"8'b11000000"*/)
            {
              ulpi_error := 0x02
              exit()
            }
              
            when(io.i_ulpi_nxt === False)
            { 
              goto(ReadData)
            }
           } 
         }
         val ReadData: State =  new State{


          onEntry{
              state_cycle_counter := 0
          }  

        
           whenIsActive{

             state_cycle_counter := state_cycle_counter + 1
                 when(state_cycle_counter === 65535 /* cpu_send_cc_2 =/= B"8'b11000000"*/)
            {
              ulpi_error := 0x03
              exit()
            }
            


           when(io.i_ulpi_dir === True)
           {  
            read_payload := io.i_ulpi_dat
            read_payload_valid := True
             goto(TurnAround_2)
           }  
          
           } 
         }

         val TurnAround_2:  State = new State{

           whenIsActive{
             when(io.i_ulpi_dir === False)
             {

                exit()
             } 
           }
         }
           
      }


     val ulpi_fsm = new StateMachine{

       val Idle:  State = new State with EntryPoint
       {
        
      //  o_ulpi_dat = B"8'h00"
         whenIsActive{
         when( write_payload_cc_2(7 downto 6) === CMD_CODE_REG_READ  && io.i_ulpi_dir === False )
         {
           goto(RegRead)
         }
         /*
          switch(ulpi_cmd)
          {
            is(1)
            {
               goto(RegRead)
            }
            is(2)
            {
              goto(RegWrite)
            }
            is(3)
            {
              goto(UsbRx)
            }
            is(4)
            {
              goto(UsbTx)
            }
            default{
              goto(Idle)
            }
 

          } 
          */ 
         
         }
       }
       val RegRead :  State = new StateFsm(fsm = RegReadFsm())
       {
          whenCompleted(goto(Idle))
       }
       /*
       val RegWrite :  State = new State
       {

       }
       val UsbRx:  State = new State
       {

       }
       val UsbTx:  State = new State
       {

       }
*/
     }

   


}




 //val usb_dir_cc_1 = RegNext(io.usb_dir_i) init(False) addTag(crossClockDomain)
    //val usb_dir_cc_2 = RegNext(usb_dir_cc_1) init(False)
    //usb_dir := usb_dir_cc_2

    //val usb_nxt_cc_1 = RegNext(io.usb_nxt_i) init(False) addTag(crossClockDomain)
    //val usb_nxt_cc_2 = RegNext(usb_nxt_cc_1) init(False)
    //usb_nxt := usb_nxt_cc_2
   
    //val usb_fault_n_cc_1 = RegNext(io.usb_fault_n_i) init(True)  addTag(crossClockDomain)
    //val usb_fault_n_cc_2 = RegNext(usb_fault_n_cc_1) init(True) 
    // usb_fault_n := usb_fault_n_cc_2

   //  val cpu_send_cc_1 = RegNext(cpu_send_wire) init(0) addTag(crossClockDomain)
   //  val cpu_send_cc_2 = RegNext(cpu_send_cc_1) init(0) 
    // val cpu_send_cmd_cc_1 = RegNext(cpu_send_cmd_wire) init(False) addTag(crossClockDomain)
    // val cpu_send_cmd_cc_2 = RegNext(cpu_send_cmd_cc_1) init(False) 
    // val cpu_send_cmd_cc_3 = RegNext(cpu_send_cmd_cc_2) init(False)
    // val ulpi_cmd = UInt(3 bits)
    // ulpi_cmd := 0
  //   val usb_dat_i_cc_1 = Reg(Bits(8 bits)) init(0) addTag(crossClockDomain)
   //  val usb_dat_i_cc_2 = RegNext(usb_dat_i_cc_1) init(0)
     //val usb_rcv = Reg(Bits(8 bits)) addTag(crossClockDomain) init(0)
    // usb_rcv := usb_rcv