legend = [
    ("Pin number", "pinid"),
 #   ("GP single-ended", "gpsingle"),
 #   ("GN single-ended", "gnsingle"),
 #   ("FPGA site", "site"),
 #   ("Analog", "analog"),
 #   ("Communication", "comms"),
    ("Ground", "gnd"),
    ("GPIO", "gpio"),
#    ("Touch", "touch"),
    ("Power", "pwr"),
    ("gpioA","gpioA"),
    ("gpioB","gpioB"),
    ("UART_0","uart_0"),
    ("I2C_0","i2c_0"),
    ("SPI_0","spi_0"),
 #   ("PWM", "pwm"),
]

# Pinlabels
gnd = ("GND", "gnd")
pwr = ("5V","pwr")
pwr_5V = ("5V", "pwr")
pwr_3V3 = ("3V3","pwr")
pwr_1V8 = ("1V8","pwr")

custom_pin_css = {"body": {"width": 48, "height": 12}}


##############################
# LHS
# lhs_pairs = (
#     [[pwr]]
#     + [[gnd]]
#     + [[(f"GP{i} | GN{i}", "gpio")] for i in range(0, 7)]
#     + [[pwr]]
#     + [[gnd]]
#     + [[(f"GP{i} | GN{i}", "gpio")] for i in range(7, 14)]
#     + [[gnd]]
#     + [[pwr]]
   
# )

# lhs_pairs_numbered = [
#     [(f"{i * 2 + 2} | {i * 2 + 1}", "pinid", {"body": {"width": 20, "height": 10}})]
#     + data
#     for i, data in enumerate(lhs_pairs)
# ]
# lhs_pairs_numbered = [[(f"({i+j}) " + label[0],  label[1])] for i, row in enumerate(lhs_pairs) for j, label in enumerate(row) ]

lhs_outer = [
    [("GND","gnd")],
      [("Y18","gpio"),("gpioA[1]","gpioA",custom_pin_css)],
      [("AA17","gpio"),("gpioA[3]","gpioA",custom_pin_css)],
      [("AA19","gpio"),("gpioA[5]","gpioA",custom_pin_css)],
      [("AB20","gpio"),("gpioA[7]","gpioA",custom_pin_css)],
      [("Y16","gpio"),("gpioB[1]","gpioB",custom_pin_css)],
      [("AB18","gpio"),("gpioB[3]","gpioB",custom_pin_css)],
      [("W17","gpio"),("gpioB[5]","gpioB",custom_pin_css)],
      [("AA16","gpio"),("gpioB[7]","gpioB",custom_pin_css)],
      [("W16","gpio")],
      [("W15","gpio")],
      [("AA15","gpio")],
      [("AA14","gpio")],
      [("AA13","gpio")],
      [("AA12","gpio")],
      [("AA11","gpio")],
      [("Y13","gpio")],
      [("W13","gpio")],
      [("W11","gpio")],
      [("V11","gpio")],
      [("V14","gpio")],
      [("W14","gpio")],
      [("R13","gpio")]
]



# lhs_outer = (



# )
lhs_outer_numbered = [
    [
        (
            f"{i * 2 + 2 }",
            "pinid",
            {"body": {"width": 20, "height": 12}},
        )
    ]
    + row
    for i, row in enumerate(lhs_outer)
]


lhs_inner = [
    [("GND","gnd")],
     [("W18","gpio"),("gpioA[0]","gpioA",custom_pin_css)], 
     [("Y19","gpio"),("gpioA[2]","gpioA",custom_pin_css)],
     [("AA20","gpio"),("gpioA[4]","gpioA",custom_pin_css)],
     [("AB21","gpio"),("gpioA[6]","gpioA",custom_pin_css)],
     [("AB19","gpio"),("gpioB[0]","gpioB",custom_pin_css)],
     [("V16","gpio"),("gpioB[2]","gpioB",custom_pin_css)],
     [("V15","gpio"),("gpioB[4]","gpioB",custom_pin_css)],
     [("AB17","gpio"),("gpioB[6]","gpioB",custom_pin_css)],
     [("AB16","gpio")],
     [("AB15","gpio")],
     [("Y14","gpio")],
     [("AB14","gpio")],
     [("AB13","gpio")],
     [("AB12","gpio")],
     [("AB11","gpio")],
     [("AB10","gpio")],
     [("Y11","gpio")],
     [("W12","gpio")],
     [("V12","gpio")],
     [("V13","gpio")],
     [("Y17","gpio")],
     [("U15","gpio")]
]

lhs_inner_numbered = [
    [
        (
            f"{i * 2 + 1 }",
            "pinid",
            {"body": {"width": 20, "height": 12}},
        )
    ]
    + row
    for i, row in enumerate(lhs_inner)
]


rhs_outer = [
    [("GND","gnd")],
    [("3V3","pwr_3V3")],
    [("5V","pwr_5V")],
    [("5V","pwr_5V")],
    [("U6","gpio")],
    [("Y5","gpio"),("RX_0","uart_0",custom_pin_css)],
    [("W6","gpio"),("SCL_0","i2c_0",custom_pin_css )], #,{"body": {"width": 60, "height": 12}}
    [("W8","gpio"),("MISO_0","spi_0",custom_pin_css)],
    [("AB8","gpio"),("SCLK_0","spi_0",custom_pin_css)],
    [("R11","gpio")],
    [("AB6","gpio")],
    [("AA6","gpio")],
    [("V10","gpio")],
    [("W9","gpio")],
    [("R9","gpio")],
    [("P9","gpio")],
    [("K5","gpio")],
    [("J4","gpio")],
    [("J8","gpio")],
    [("F5","gpio")],
    [("V17","gpio")],
    [("GND","gnd")],
    [("GND","gnd")]
]
rhs_outer_numbered = [
    [
        (
           # f"{i * 2 + 2 + len(lhs_pairs_numbered)*2}",
           f"{i * 2 + 1 }",
            "pinid",
            {"body": {"width": 20, "height": 12}},
        )
    ]
    + row
    for i, row in enumerate(rhs_outer)
]

rhs_inner = [
     [("GND","gnd")],
    [("3V3","pwr_3V3")],
    [("5V","pwr_5V")],
    [("5V","pwr_5V")],
    [("AA2","gpio")],
    [("Y6","gpio"),("TX_0","uart_0",custom_pin_css)],
    [("W7","gpio"),("SDA_0","i2c_0",custom_pin_css)],
    [("V8","gpio"),("MOSI_0","spi_0",custom_pin_css)],
    [("V7","gpio"),("CS_n_0","spi_0",custom_pin_css)],
    [("AB7","gpio")],
    [("AA7","gpio")],
    [("Y7","gpio")],
    [("U7","gpio")],
    [("W5","gpio")],
    [("W4","gpio")],
    [("1V8","pwr_1V8")],
    [("GND","gnd")],
    [("H3","gpio")],
    [("J9","gpio")],
    [("F4","gpio")],
    [("W3","gpio")],
    [("GND","gnd")],
    [("GND","gnd")]
]
rhs_inner_numbered = [
    [
        (
          #  f"{i * 2 + 1 + len(lhs_pairs_numbered)*2}",
          f"{i * 2 + 2 }",
            "pinid",
            {"body": {"width": 20, "height": 12}},
        )
    ]
    + row
    for i, row in enumerate(rhs_inner)
]


# Text

title = "<tspan class='h1'>Deca Wishbone soc Pinout</tspan>"

description = """Created with Python tool kit to assist with 
documentation of electronic hardware. 
More info at <a href="https://pinout.readthedocs.io"> <tspan class='italic strong'>  pinout.readthedocs.io </tspan></a> 
 and <a href="https://github.com/DECAfpga/DECA_board/tree/main/Deca_pinout"> <tspan class='italic strong'> DECAfpga/DECAboard/Deca_pinout </tspan></a> github repository.
 """
#<!-- <tspan class='italic strong'>https://github.com/DECAfpga/DECA_board/tree/main/Deca_pinout</tspan> -->