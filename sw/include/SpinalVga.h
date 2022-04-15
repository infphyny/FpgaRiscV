/*

[info] Address 0x0 :
[info]   W[11:0] vgaCtrl_io_timings_h_syncStart_driver
[info]   R[11:0] vgaCtrl_io_timings_h_syncStart_driver
[info] Address 0x4 :
[info]   W[11:0] vgaCtrl_io_timings_h_syncEnd_driver
[info]   R[11:0] vgaCtrl_io_timings_h_syncEnd_driver
[info] Address 0x8 :
[info]   W[11:0] vgaCtrl_io_timings_h_colorStart_driver
[info]   R[11:0] vgaCtrl_io_timings_h_colorStart_driver
[info] Address 0xc :
[info]   W[11:0] vgaCtrl_io_timings_h_colorEnd_driver
[info]   R[11:0] vgaCtrl_io_timings_h_colorEnd_driver
[info] Address 0x10 :
[info]   W[11:0] vgaCtrl_io_timings_v_syncStart_driver
[info]   R[11:0] vgaCtrl_io_timings_v_syncStart_driver
[info] Address 0x14 :
[info]   W[11:0] vgaCtrl_io_timings_v_syncEnd_driver
[info]   R[11:0] vgaCtrl_io_timings_v_syncEnd_driver
[info] Address 0x18 :
[info]   W[11:0] vgaCtrl_io_timings_v_colorStart_driver
[info]   R[11:0] vgaCtrl_io_timings_v_colorStart_driver
[info] Address 0x1c :
[info]   W[11:0] vgaCtrl_io_timings_v_colorEnd_driver
[info]   R[11:0] vgaCtrl_io_timings_v_colorEnd_driver
[info] Address 0x20 :
[info]   W[0:0] vgaCtrl_io_timings_h_polarity_driver
[info]   R[0:0] vgaCtrl_io_timings_h_polarity_driver
[info]   W[1:1] vgaCtrl_io_timings_v_polarity_driver
[info]   R[1:1] vgaCtrl_io_timings_v_polarity_driver
[info]   W[2:2] vgaCtrl_io_softReset_soft_reset_driver
[info]   R[2:2] vgaCtrl_io_softReset_soft_reset_driver
[info]	 R[3:3] io_hdmi_tx_int  


How to calculate Timing  From v and h front-back porch,   display  height,width
    val h_syncStart = hSync - 1
    val h_colorStart = hSync + hBack - 1
    val h_colorEnd = hSync + hBack + hPixels - 1
    val h_syncEnd = hSync + hBack + hPixels + hFront - 1
    val v_syncStart = vSync - 1
    val v_colorStart = vSync + vBack - 1
    val v_colorEnd = vSync + vBack + vPixels - 1
    val v_syncEnd = vSync + vBack + vPixels + vFront - 1



*/
#ifndef SPINALVGA_H
#define SPINALVGA_H

#include <stdbool.h>
#include <stdint.h>

static const uint32_t SPINAL_VGA_H_POL_HIGH = 1;
static const uint32_t SPINAL_VGA_H_POL_LOW = 0;
static const uint32_t SPINAL_VGA_V_POL_HIGH = 2;
static const uint32_t SPINAL_VGA_V_POL_LOW = 0;
static const uint32_t SPINAL_VGA_SOFT_RESET = 4;

typedef struct {
	volatile uint32_t hSyncStart ,hSyncEnd;
	volatile uint32_t hColorStart,hColorEnd;
	volatile uint32_t vSyncStart ,vSyncEnd;
	volatile uint32_t vColorStart,vColorEnd;
  volatile uint32_t hv_polarity;
}SpinalVgaSettings;

typedef struct
{
  volatile uint32_t  STATUS;
  volatile uint32_t  FRAME_SIZE;
  volatile uint32_t  FRAME_BASE;
  volatile uint32_t  DUMMY0[13];
  volatile SpinalVgaSettings SETTINGS;
} SpinalVgaReg;


void spinal_compute_vga_timings(uint32_t h_sync,
																uint32_t v_sync,
															  uint32_t h_back_porch,uint32_t h_front_porch,
															  uint32_t v_back_porch,uint32_t v_front_porch,
															  uint32_t h_pixels,uint32_t v_pixels,
																uint32_t h_pol,uint32_t v_pol,
																SpinalVgaSettings* settings
															 );

bool spinal_vga_is_busy(SpinalVgaReg *reg);
void spinal_vga_run(SpinalVgaReg *reg);
void spinal_vga_stop(SpinalVgaReg *reg);


#endif
