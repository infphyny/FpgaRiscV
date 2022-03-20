create_clock -period 41.666 [get_ports i_clk]
#create_clock -period 100 [get_ports jtag_tck]

derive_pll_clocks
