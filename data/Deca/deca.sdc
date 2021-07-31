# Main system clock (50 Mhz) #20.000ns
create_clock -name "i_clk" -period 20.000ns [get_ports {i_clk}]
create_clock -name {USB_CLKIN} -period 16.666 -waveform { 0.000 8.333 } [get_ports {USB_CLKIN}]
# Automatically constrain PLL and other generated clocks
derive_pll_clocks -create_base_clocks

# Automatically calculate clock uncertainty to jitter and other effects.
derive_clock_uncertainty
 
 #set false path
#set_false_path -from [get_ports {USER_BTN}]
set_false_path -from * -to [get_ports {SW0}]
set_false_path -from * -to [get_ports {SW1}]
set_false_path -from * -to [get_ports {LEDS*}]

set_input_delay 3.000 -clock [get_clocks USB_CLKIN] [get_ports {USB_DATA,USB_DIR,USB_NXT}]
#set_input_delay 3.000 -clock USB_CLKIN  