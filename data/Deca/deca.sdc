# Main system clock (50 Mhz) #20.000ns
create_clock -name "i_clk" -period 20.000ns [get_ports {i_clk}]

# Automatically constrain PLL and other generated clocks
derive_pll_clocks -create_base_clocks

# Automatically calculate clock uncertainty to jitter and other effects.
derive_clock_uncertainty
 
 #set false path
#set_false_path -from [get_ports {USER_BTN}]
set_false_path -from * -to [get_ports {SW0}]
set_false_path -from * -to [get_ports {SW1}]
set_false_path -from * -to [get_ports {LEDS*}]
