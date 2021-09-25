#include <cstdio>
#include <cstdlib>

#include <memory>

#include <verilated.h>
//#include <verilated_vcd_c.h>
#include <verilated_fst_c.h>
#include "obj_dir/VColorLightBriey.h"
void tick(size_t tick_count,VColorLightBriey* tb,VerilatedFstC* tfp);

int main(int argc,char **argv)
{
size_t tick_count = 1;

 Verilated::commandArgs(argc,argv);
 Verilated::traceEverOn(true);
 //std::unique_ptr<VerilatedVcdC> tfp = std::make_unique<VerilatedVcdC>();
 std::unique_ptr<VerilatedFstC> tfp = std::make_unique<VerilatedFstC>();
 std::unique_ptr<VColorLightBriey> tb = std::make_unique<VColorLightBriey>();
 
  std::string timescale="ns";
 tfp->set_time_unit(timescale);
 tfp->set_time_resolution("ns");
 
 tb->trace(tfp.get(),99);
 tfp->open("trace.fst");
 
 bool prev_tx_done = false;
 
// uint8_t data = 0;
 tb->i_clk = false;
 tb->asyncReset = true;
 //tb->io_note = 70;
 //tb->io_volume = 0;
 tb->uart_0_rxd = true;
 //tb->io_tx_en = false;
 //tb->io_send_data = data;
 
 //tb->io_tx_en = true
/*
 for(size_t i = 0; i < 1000 ; i++)
 {
 tick(++tick_count,tb.get(),tfp.get());
 }
 tb->io_reset_n = true;
 */
 
 for(size_t i = 0 ; i < 1000000 ; i++)
 {
 
   tick(++tick_count,tb.get(),tfp.get());
    
 }
 

 tb->final();



}

void tick(size_t tick_count,VColorLightBriey* tb,VerilatedFstC* tfp)
{

    tb->eval();
    tfp->dump(tick_count*42-2);
    tb->i_clk = true;
    tb->eval();
    tfp->dump(tick_count*42);
    tb->i_clk = false;
    tb->eval();
    tfp->dump(tick_count*42+21);
    tfp->flush();  

}


   
   
