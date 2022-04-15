#include "SpinalVga.h"


void spinal_compute_vga_timings(uint32_t h_sync,
																uint32_t v_sync,
															  uint32_t h_back_porch,uint32_t h_front_porch,
															  uint32_t v_back_porch,uint32_t v_front_porch,
															  uint32_t h_pixels,uint32_t v_pixels,
																uint32_t h_pol,uint32_t v_pol,
																SpinalVgaSettings* settings )
{

   settings->hSyncStart = h_sync - 1;
   settings->hColorStart = h_sync + h_back_porch - 1;
   settings->hColorEnd = h_sync + h_back_porch + h_pixels - 1;
   settings->hSyncEnd = h_sync + h_back_porch + h_pixels + h_front_porch - 1;
   settings->vSyncStart = v_sync - 1;
   settings->vColorStart = v_sync + v_back_porch - 1;
   settings->vColorEnd = v_sync + v_back_porch + v_pixels - 1;
   settings->vSyncEnd = v_sync + v_back_porch + v_pixels + v_front_porch - 1;

   if(h_pol == 0)
	 {
		 settings->hv_polarity &= ~SPINAL_VGA_H_POL_HIGH;
	 }else
	 {
		 settings->hv_polarity |= SPINAL_VGA_H_POL_HIGH;
	 }

	 if(v_pol == 0)
	 {
		 settings->hv_polarity &= ~SPINAL_VGA_V_POL_HIGH;
	 }else
	 {
		 settings->hv_polarity |= SPINAL_VGA_V_POL_HIGH;
	 }


}


bool spinal_vga_is_busy(SpinalVgaReg *reg)
{
   return (reg->STATUS & 2) != 0;
}
void spinal_vga_run(SpinalVgaReg *reg)
{
    reg->STATUS  = 1;
}
void spinal_vga_stop(SpinalVgaReg *reg)
{
  	reg->STATUS  = 0;
	while(spinal_vga_is_busy(reg));
}
