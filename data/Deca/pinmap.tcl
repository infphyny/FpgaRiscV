

set_global_assignment -name OPTIMIZATION_MODE "AGGRESSIVE PERFORMANCE"
#set_global_assignment -name CYCLONEII_OPTIMIZATION_TECHNIQUE SPEED
set_global_assignment -name POWER_BOARD_THERMAL_MODEL "NONE (CONSERVATIVE)"
set_global_assignment -name POWER_PRESET_COOLING_SOLUTION "23 MM HEAT SINK WITH 200 LFPM AIRFLOW"

set_global_assignment -name ENABLE_CONFIGURATION_PINS OFF
set_global_assignment -name ENABLE_BOOT_SEL_PIN OFF
set_global_assignment -name USE_CONFIGURATION_DEVICE ON
set_global_assignment -name CRC_ERROR_OPEN_DRAIN OFF


set_global_assignment -name IOBANK_VCCIO 2.5V -section_id 1A
set_global_assignment -name IOBANK_VCCIO 2.5V -section_id 1B
set_global_assignment -name IOBANK_VCCIO 2.5V -section_id 2
set_global_assignment -name IOBANK_VCCIO 3.3V -section_id 3
set_global_assignment -name IOBANK_VCCIO 3.3V -section_id 4
set_global_assignment -name IOBANK_VCCIO 1.5V -section_id 5
set_global_assignment -name IOBANK_VCCIO 1.5V -section_id 6
set_global_assignment -name IOBANK_VCCIO 1.8V -section_id 7
set_global_assignment -name IOBANK_VCCIO 1.2V -section_id 8

#https://github.com/litex-hub/litex-boards/pull/188/files
set_global_assignment -name INTERNAL_FLASH_UPDATE_MODE "SINGLE IMAGE WITH ERAM"

set_global_assignment -name MIN_CORE_JUNCTION_TEMP 0
set_global_assignment -name MAX_CORE_JUNCTION_TEMP 85

#PWR_BUT
#set_location_assignment PIN_U6  -to PWR_BUT
#set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to PWR_BUT

#SYS_RESET_n
#set_location_assignment PIN_AA2  -to SYS_RESET_n
#set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to SYS_RESET_n


set_location_assignment PIN_M8 -to i_clk
set_instance_assignment -name IO_STANDARD "2.5 V" -to i_clk


#set_location_assignment PIN_P11 -to i_clk_2;
#set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to i_clk_2



set_location_assignment PIN_H21 -to i_rst_n
set_instance_assignment -name IO_STANDARD "1.5 V" -to i_rst_n

set_location_assignment PIN_H22 -to key1
set_instance_assignment -name IO_STANDARD "1.5 V SCHMITT TRIGGER" -to key1

#CAP SENSE
set_location_assignment PIN_AB2 -to CAP_SENSE_I2C_SCL
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to CAP_SENSE_I2C_SCL
set_location_assignment PIN_AB3 -to CAP_SENSE_I2C_SDA
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to CAP_SENSE_I2C_SDA

#set_location_assignment PIN_R11 -to CAP_SENSE_I2C_SCL_DEBUG
#set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to CAP_SENSE_I2C_SCL_DEBUG
#set_location_assignment PIN_AB7 -to CAP_SENSE_I2C_SDA_DEBUG
#set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to CAP_SENSE_I2C_SDA_DEBUG


#Switch
set_location_assignment PIN_J21 -to SW0
set_instance_assignment -name IO_STANDARD "1.5 V SCHMITT TRIGGER"  -to SW0
set_location_assignment PIN_J22 -to SW1
set_instance_assignment -name IO_STANDARD "1.5 V SCHMITT TRIGGER"  -to SW1
#1.5 V SCHMITT TRIGGER
#LEDS
set_location_assignment PIN_C7 -to LEDS[0]
set_instance_assignment -name IO_STANDARD "1.2 V" -to LEDS[0]
set_location_assignment PIN_C8 -to LEDS[1]
set_instance_assignment -name IO_STANDARD "1.2 V" -to LEDS[1]
set_location_assignment PIN_A6 -to LEDS[2]
set_instance_assignment -name IO_STANDARD "1.2 V" -to LEDS[2]
set_location_assignment PIN_B7 -to LEDS[3]
set_instance_assignment -name IO_STANDARD "1.2 V" -to LEDS[3]
set_location_assignment PIN_C4 -to LEDS[4]
set_instance_assignment -name IO_STANDARD "1.2 V" -to LEDS[4]
set_location_assignment PIN_A5 -to LEDS[5]
set_instance_assignment -name IO_STANDARD "1.2 V" -to LEDS[5]
set_location_assignment PIN_B4 -to LEDS[6]
set_instance_assignment -name IO_STANDARD "1.2 V" -to LEDS[6]
set_location_assignment PIN_C5 -to LEDS[7]
set_instance_assignment -name IO_STANDARD "1.2 V" -to LEDS[7]


#PMONITOR
set_location_assignment PIN_Y3 -to PMONITOR_I2C_SCL
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to PMONITOR_I2C_SCL
set_location_assignment PIN_Y1 -to PMONITOR_I2C_SDA
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to PMONITOR_I2C_SDA
set_location_assignment PIN_Y4 -to PMONITOR_ALERT
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to PMONITOR_ALERT


#GPIO A

set_location_assignment PIN_W18 -to gpioA[0]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to gpioA[0]
set_location_assignment PIN_Y18 -to gpioA[1]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to gpioA[1]
set_location_assignment PIN_Y19 -to gpioA[2]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to gpioA[2]
set_location_assignment PIN_AA17 -to gpioA[3]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to gpioA[3]
set_location_assignment PIN_AA20 -to gpioA[4]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to gpioA[4]
set_location_assignment PIN_AA19 -to gpioA[5]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to gpioA[5]
set_location_assignment PIN_AB21 -to gpioA[6]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to gpioA[6]
set_location_assignment PIN_AB20 -to gpioA[7]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to gpioA[7]

#GPIO B

set_location_assignment PIN_AB19 -to gpioB[0]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to gpioB[0]
set_location_assignment PIN_Y16 -to gpioB[1]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to gpioB[1]
set_location_assignment PIN_V16 -to gpioB[2]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to gpioB[2]
set_location_assignment PIN_AB18 -to gpioB[3]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to gpioB[3]
set_location_assignment PIN_V15 -to gpioB[4]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to gpioB[4]
set_location_assignment PIN_W17 -to gpioB[5]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to gpioB[5]
set_location_assignment PIN_AB17 -to gpioB[6]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to gpioB[6]
set_location_assignment PIN_AA16 -to gpioB[7]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to gpioB[7]



#P9
# UART_0
set_location_assignment PIN_Y5 -to uart_0_rx
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to uart_0_rx

set_location_assignment PIN_Y6 -to uart_0_tx
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to uart_0_tx

# i2c_0
set_location_assignment PIN_W6 -to i2c_0_scl
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to i2c_0_scl

set_location_assignment PIN_W7 -to i2c_0_sda
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to i2c_0_sda

#spi_0

set_location_assignment PIN_W8 -to spi_0_miso
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to spi_0_miso

set_location_assignment PIN_V8 -to spi_0_mosi
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to spi_0_mosi

set_location_assignment PIN_AB8 -to spi_0_sclk
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to spi_0_sclk

set_location_assignment PIN_V7 -to spi_0_cs_n
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to spi_0_cs_n

#AUDIO
#set_location_assignment PIN_P14 -to AUDIO_MCLK
#set_location_assignment -name IO_STANDARD "1.5-V" = to PIN_P14

#set_location_assignment PIN_R14 -to AUDIO_BCLK
#set_location_assignment -name IO_STANDARD "1.5-V" = to PIN_R14

#set_location_assignment PIN_R15 -to AUDIO_WCLK
#set_location_assignment -name IO_STANDARD "1.5-V" = to PIN_R15

#set_location_assignment PIN_P15 -to AUDIO_DIN_MFP1
#set_location_assignment -name IO_STANDARD "1.5-V" = to PIN_R15


#set_location_assignment PIN_P18 -to AUDIO_DIN_MFP2
#set_location_assignment -name IO_STANDARD "1.5-V" = to PIN_P18

#set_location_assignment PIN_P19 -to AUDIO_DIN_MFP3
#set_location_assignment -name IO_STANDARD "1.5-V" = to PIN_P19

#set_location_assignment PIN_P20 -to AUDIO_SCL_SS_n
#set_location_assignment -name IO_STANDARD "1.5-V" = to PIN_P20

#set_location_assignment PIN_P21 -to AUDIO_SDA_MOSI
#set_location_assignment -name IO_STANDARD "1.5-V" = to PIN_P21

#set_location_assignment PIN_N21 -to AUDIO_MISO_MFP4
#set_location_assignment -name IO_STANDARD "1.5-V" = to PIN_N21

#set_location_assignment PIN_N22 -to AUDIO_SPI_SELECT
#set_location_assignment -name IO_STANDARD "1.5-V" = to PIN_N22

#set_location_assignment PIN_M21 -to AUDIO_RESET_n
#set_location_assignment -name IO_STANDARD "1.5-V" = to PIN_M21

#set_location_assignment PIN_M22 -to AUDIO_GPIO_MFP5
#set_location_assignment -name IO_STANDARD "1.5-V" = to PIN_M22

#============================================================
# SDRAM
#============================================================
set_location_assignment PIN_E21 -to DDR3_A[0]
set_instance_assignment -name IO_STANDARD "SSTL-15" -to DDR3_A[0]
#set_instance_assignment -name PACKAGE_SKEW_COMPENSATION OFF -to DDR3_A[0]

set_location_assignment PIN_V20 -to DDR3_A[1]
set_instance_assignment -name IO_STANDARD "SSTL-15" -to DDR3_A[1]
#set_instance_assignment -name PACKAGE_SKEW_COMPENSATION OFF -to DDR3_A[1]

#set_instance_assignment -name OUTPUT_TERMINATION "SERIES 40 OHM WITH CALIBRATION" -to DDR3_A[1]
set_location_assignment PIN_V21 -to DDR3_A[2]
set_instance_assignment -name IO_STANDARD "SSTL-15" -to DDR3_A[2]
#set_instance_assignment -name PACKAGE_SKEW_COMPENSATION OFF -to DDR3_A[2]


set_location_assignment PIN_C20 -to DDR3_A[3]
set_instance_assignment -name IO_STANDARD "SSTL-15" -to DDR3_A[3]
#set_instance_assignment -name PACKAGE_SKEW_COMPENSATION OFF -to DDR3_A[3]


set_location_assignment PIN_Y21 -to DDR3_A[4]
set_instance_assignment -name IO_STANDARD "SSTL-15" -to DDR3_A[4]
#set_instance_assignment -name PACKAGE_SKEW_COMPENSATION OFF -to DDR3_A[4]

set_location_assignment PIN_J14 -to DDR3_A[5]
set_instance_assignment -name IO_STANDARD "SSTL-15" -to DDR3_A[5]
#set_instance_assignment -name PACKAGE_SKEW_COMPENSATION OFF -to DDR3_A[5]

set_location_assignment PIN_V18 -to DDR3_A[6]
set_instance_assignment -name IO_STANDARD "SSTL-15" -to DDR3_A[6]
#set_instance_assignment -name PACKAGE_SKEW_COMPENSATION OFF -to DDR3_A[6]

set_location_assignment PIN_U20 -to DDR3_A[7]
set_instance_assignment -name IO_STANDARD "SSTL-15" -to DDR3_A[7]
#set_instance_assignment -name PACKAGE_SKEW_COMPENSATION OFF -to DDR3_A[7]

set_location_assignment PIN_Y20 -to DDR3_A[8]
set_instance_assignment -name IO_STANDARD "SSTL-15" -to DDR3_A[8]
#set_instance_assignment -name PACKAGE_SKEW_COMPENSATION OFF -to DDR3_A[8]

set_location_assignment PIN_W22 -to DDR3_A[9]
set_instance_assignment -name IO_STANDARD "SSTL-15" -to DDR3_A[9]
#set_instance_assignment -name PACKAGE_SKEW_COMPENSATION OFF -to DDR3_A[9]

set_location_assignment PIN_C22 -to DDR3_A[10]
set_instance_assignment -name IO_STANDARD "SSTL-15" -to DDR3_A[10]
#set_instance_assignment -name PACKAGE_SKEW_COMPENSATION OFF -to DDR3_A[10]

set_location_assignment PIN_Y22 -to DDR3_A[11]
set_instance_assignment -name IO_STANDARD "SSTL-15" -to DDR3_A[11]
#set_instance_assignment -name PACKAGE_SKEW_COMPENSATION OFF -to DDR3_A[11]

set_location_assignment PIN_N18 -to DDR3_A[12]
set_instance_assignment -name IO_STANDARD "SSTL-15" -to DDR3_A[12]
#set_instance_assignment -name PACKAGE_SKEW_COMPENSATION OFF -to DDR3_A[12]

set_location_assignment PIN_V22 -to DDR3_A[13]
set_instance_assignment -name IO_STANDARD "SSTL-15" -to DDR3_A[13]
#set_instance_assignment -name PACKAGE_SKEW_COMPENSATION OFF -to DDR3_A[13]

set_location_assignment PIN_W20 -to DDR3_A[14]
set_instance_assignment -name IO_STANDARD "SSTL-15" -to DDR3_A[14]
#set_instance_assignment -name PACKAGE_SKEW_COMPENSATION OFF -to DDR3_A[14]

set_location_assignment PIN_D19 -to DDR3_BA[0]
set_instance_assignment -name IO_STANDARD "SSTL-15" -to DDR3_BA[0]
#set_instance_assignment -name PACKAGE_SKEW_COMPENSATION OFF -to DDR3_A[1]

set_location_assignment PIN_W19 -to DDR3_BA[1]
set_instance_assignment -name IO_STANDARD "SSTL-15" -to DDR3_BA[1]
#set_instance_assignment -name PACKAGE_SKEW_COMPENSATION OFF -to DDR3_BA[1]

set_location_assignment PIN_F19 -to DDR3_BA[2]
set_instance_assignment -name IO_STANDARD "SSTL-15" -to DDR3_BA[2]
#set_instance_assignment -name PACKAGE_SKEW_COMPENSATION OFF -to DDR3_BA[2]

set_location_assignment PIN_E20 -to DDR3_CAS_n
set_instance_assignment -name IO_STANDARD "SSTL-15" -to DDR3_CAS_n
#set_instance_assignment -name PACKAGE_SKEW_COMPENSATION OFF -to DDR3_CAS_n

set_location_assignment PIN_B22 -to DDR3_CKE
set_instance_assignment -name IO_STANDARD "SSTL-15" -to DDR3_CKE
#set_instance_assignment -name PACKAGE_SKEW_COMPENSATION OFF -to DDR3_CKE

set_location_assignment PIN_E18 -to DDR3_CK_n
set_instance_assignment -name IO_STANDARD "Differential 1.5-V SSTL" -to DDR3_CK_n
set_instance_assignment -name OUTPUT_TERMINATION "SERIES 40 OHM WITH CALIBRATION" -to DDR3_CK_n
#set_instance_assignment -name PACKAGE_SKEW_COMPENSATION OFF -to DDR3_CK_n


set_location_assignment PIN_D18 -to DDR3_CK_p
set_instance_assignment -name IO_STANDARD "Differential 1.5-V SSTL" -to DDR3_CK_p
set_instance_assignment -name OUTPUT_TERMINATION "SERIES 40 OHM WITH CALIBRATION" -to DDR3_CK_p
#set_instance_assignment -name PACKAGE_SKEW_COMPENSATION OFF -to DDR3_CK_p

set_instance_assignment -name CKN_CK_PAIR ON -from DDR3_CK_n -to DDR3_CK_p


set_location_assignment PIN_N15 -to DDR3_CLK_50
set_instance_assignment -name IO_STANDARD "1.5 V" -to DDR3_CLK_50

set_location_assignment PIN_F22 -to DDR3_CS_n
set_instance_assignment -name IO_STANDARD "SSTL-15" -to DDR3_CS_n
#set_instance_assignment -name PACKAGE_SKEW_COMPENSATION OFF -to DDR3_CS_n

set_location_assignment PIN_N19 -to DDR3_DM[0]
set_instance_assignment -name IO_STANDARD "SSTL-15" -to DDR3_DM[0]
set_instance_assignment -name OUTPUT_TERMINATION "SERIES 40 OHM WITH CALIBRATION" -to DDR3_DM[0]
#set_instance_assignment -name PACKAGE_SKEW_COMPENSATION OFF -to DDR3_DM[0]
set_instance_assignment -name DM_PIN ON -to DDR3_DM[0]

set_location_assignment PIN_J15 -to DDR3_DM[1]
set_instance_assignment -name IO_STANDARD "SSTL-15" -to DDR3_DM[1]
set_instance_assignment -name OUTPUT_TERMINATION "SERIES 40 OHM WITH CALIBRATION" -to DDR3_DM[1]
#set_instance_assignment -name PACKAGE_SKEW_COMPENSATION OFF -to DDR3_DM[1]
set_instance_assignment -name DM_PIN ON -to DDR3_DM[1]

set_location_assignment PIN_L20 -to DDR3_DQ[0]
set_instance_assignment -name IO_STANDARD "SSTL-15" -to DDR3_DQ[0]
set_instance_assignment -name OUTPUT_TERMINATION "SERIES 40 OHM WITH CALIBRATION" -to DDR3_DQ[0]
#set_instance_assignment -name PACKAGE_SKEW_COMPENSATION OFF -to DDR3_DQ[0]

set_location_assignment PIN_L19 -to DDR3_DQ[1]
set_instance_assignment -name IO_STANDARD "SSTL-15" -to DDR3_DQ[1]
set_instance_assignment -name OUTPUT_TERMINATION "SERIES 40 OHM WITH CALIBRATION" -to DDR3_DQ[1]
#set_instance_assignment -name PACKAGE_SKEW_COMPENSATION OFF -to DDR3_DQ[1]


set_location_assignment PIN_L18 -to DDR3_DQ[2]
set_instance_assignment -name IO_STANDARD "SSTL-15" -to DDR3_DQ[2]
set_instance_assignment -name OUTPUT_TERMINATION "SERIES 40 OHM WITH CALIBRATION" -to DDR3_DQ[2]
#set_instance_assignment -name PACKAGE_SKEW_COMPENSATION OFF -to DDR3_DQ[2]


set_location_assignment PIN_M15 -to DDR3_DQ[3]
set_instance_assignment -name IO_STANDARD "SSTL-15" -to DDR3_DQ[3]
set_instance_assignment -name OUTPUT_TERMINATION "SERIES 40 OHM WITH CALIBRATION" -to DDR3_DQ[3]
#set_instance_assignment -name PACKAGE_SKEW_COMPENSATION OFF -to DDR3_DQ[3]

set_location_assignment PIN_M18 -to DDR3_DQ[4]
set_instance_assignment -name IO_STANDARD "SSTL-15" -to DDR3_DQ[4]
set_instance_assignment -name OUTPUT_TERMINATION "SERIES 40 OHM WITH CALIBRATION" -to DDR3_DQ[4]
#set_instance_assignment -name PACKAGE_SKEW_COMPENSATION OFF -to DDR3_DQ[4]

set_location_assignment PIN_M14 -to DDR3_DQ[5]
set_instance_assignment -name IO_STANDARD "SSTL-15" -to DDR3_DQ[5]
set_instance_assignment -name OUTPUT_TERMINATION "SERIES 40 OHM WITH CALIBRATION" -to DDR3_DQ[5]
#set_instance_assignment -name PACKAGE_SKEW_COMPENSATION OFF -to DDR3_DQ[5]


set_location_assignment PIN_M20 -to DDR3_DQ[6]
set_instance_assignment -name IO_STANDARD "SSTL-15" -to DDR3_DQ[6]
set_instance_assignment -name OUTPUT_TERMINATION "SERIES 40 OHM WITH CALIBRATION" -to DDR3_DQ[6]
#set_instance_assignment -name PACKAGE_SKEW_COMPENSATION OFF -to DDR3_DQ[6]


set_location_assignment PIN_N20 -to DDR3_DQ[7]
set_instance_assignment -name IO_STANDARD "SSTL-15" -to DDR3_DQ[7]
set_instance_assignment -name OUTPUT_TERMINATION "SERIES 40 OHM WITH CALIBRATION" -to DDR3_DQ[7]
#set_instance_assignment -name PACKAGE_SKEW_COMPENSATION OFF -to DDR3_DQ[7]


set_location_assignment PIN_K19 -to DDR3_DQ[8]
set_instance_assignment -name IO_STANDARD "SSTL-15" -to DDR3_DQ[8]
set_instance_assignment -name OUTPUT_TERMINATION "SERIES 40 OHM WITH CALIBRATION" -to DDR3_DQ[8]
#set_instance_assignment -name PACKAGE_SKEW_COMPENSATION OFF -to DDR3_DQ[8]

set_location_assignment PIN_K18 -to DDR3_DQ[9]
set_instance_assignment -name IO_STANDARD "SSTL-15" -to DDR3_DQ[9]
set_instance_assignment -name OUTPUT_TERMINATION "SERIES 40 OHM WITH CALIBRATION" -to DDR3_DQ[9]
#set_instance_assignment -name PACKAGE_SKEW_COMPENSATION OFF -to DDR3_DQ[9]

set_location_assignment PIN_J18 -to DDR3_DQ[10]
set_instance_assignment -name IO_STANDARD "SSTL-15" -to DDR3_DQ[10]
set_instance_assignment -name OUTPUT_TERMINATION "SERIES 40 OHM WITH CALIBRATION" -to DDR3_DQ[10]
#set_instance_assignment -name PACKAGE_SKEW_COMPENSATION OFF -to DDR3_DQ[10]

set_location_assignment PIN_K20 -to DDR3_DQ[11]
set_instance_assignment -name IO_STANDARD "SSTL-15" -to DDR3_DQ[11]
set_instance_assignment -name OUTPUT_TERMINATION "SERIES 40 OHM WITH CALIBRATION" -to DDR3_DQ[11]

set_location_assignment PIN_H18 -to DDR3_DQ[12]
set_instance_assignment -name IO_STANDARD "SSTL-15" -to DDR3_DQ[12]
set_instance_assignment -name OUTPUT_TERMINATION "SERIES 40 OHM WITH CALIBRATION" -to DDR3_DQ[12]
#set_instance_assignment -name PACKAGE_SKEW_COMPENSATION OFF -to DDR3_DQ[12]

set_location_assignment PIN_J20 -to DDR3_DQ[13]
set_instance_assignment -name IO_STANDARD "SSTL-15" -to DDR3_DQ[13]
set_instance_assignment -name OUTPUT_TERMINATION "SERIES 40 OHM WITH CALIBRATION" -to DDR3_DQ[13]
#set_instance_assignment -name PACKAGE_SKEW_COMPENSATION OFF -to DDR3_DQ[13]

set_location_assignment PIN_H20 -to DDR3_DQ[14]
set_instance_assignment -name IO_STANDARD "SSTL-15" -to DDR3_DQ[14]
set_instance_assignment -name OUTPUT_TERMINATION "SERIES 40 OHM WITH CALIBRATION" -to DDR3_DQ[14]
#set_instance_assignment -name PACKAGE_SKEW_COMPENSATION OFF -to DDR3_DQ[14]

set_location_assignment PIN_H19 -to DDR3_DQ[15]
set_instance_assignment -name IO_STANDARD "SSTL-15" -to DDR3_DQ[15]
set_instance_assignment -name OUTPUT_TERMINATION "SERIES 40 OHM WITH CALIBRATION" -to DDR3_DQ[15]
#set_instance_assignment -name PACKAGE_SKEW_COMPENSATION OFF -to DDR3_DQ[15]

set_location_assignment PIN_L15 -to DDR3_DQS_n[0] -disable
set_instance_assignment -name IO_STANDARD "Differential 1.5-V SSTL" -to DDR3_DQS_n[0]
set_instance_assignment -name OUTPUT_TERMINATION "SERIES 40 OHM WITH CALIBRATION" -to DDR3_DQS_n[0]
#set_instance_assignment -name PACKAGE_SKEW_COMPENSATION OFF -to DDR3_DQS_n[0]

set_location_assignment PIN_K15 -to DDR3_DQS_n[1] -disable
set_instance_assignment -name IO_STANDARD "Differential 1.5-V SSTL" -to DDR3_DQS_n[1]
set_instance_assignment -name OUTPUT_TERMINATION "SERIES 40 OHM WITH CALIBRATION" -to DDR3_DQS_n[1]
#set_instance_assignment -name PACKAGE_SKEW_COMPENSATION OFF -to DDR3_DQS_n[1]

set_location_assignment PIN_L14 -to DDR3_DQS_p[0]
set_instance_assignment -name IO_STANDARD "Differential 1.5-V SSTL" -to DDR3_DQS_p[0]
set_instance_assignment -name OUTPUT_TERMINATION "SERIES 40 OHM WITH CALIBRATION" -to DDR3_DQS_p[0]
#set_instance_assignment -name PACKAGE_SKEW_COMPENSATION OFF -to DDR3_DQS_p[0]


set_location_assignment PIN_K14 -to DDR3_DQS_p[1]
set_instance_assignment -name IO_STANDARD "Differential 1.5-V SSTL" -to DDR3_DQS_p[1]
set_instance_assignment -name OUTPUT_TERMINATION "SERIES 40 OHM WITH CALIBRATION" -to DDR3_DQS_p[1]
#set_instance_assignment -name PACKAGE_SKEW_COMPENSATION OFF -to DDR3_DQS_p[1]

set_location_assignment PIN_G22 -to DDR3_ODT
set_instance_assignment -name IO_STANDARD "SSTL-15" -to DDR3_ODT
#set_instance_assignment -name PACKAGE_SKEW_COMPENSATION OFF -to DDR3_ODT

set_location_assignment PIN_D22 -to DDR3_RAS_n
set_instance_assignment -name IO_STANDARD "SSTL-15" -to DDR3_RAS_n
#set_instance_assignment -name PACKAGE_SKEW_COMPENSATION OFF -to DDR3_RAS_n

set_location_assignment PIN_U19 -to DDR3_RESET_n
set_instance_assignment -name IO_STANDARD "SSTL-15" -to DDR3_RESET_n
#set_instance_assignment -name PACKAGE_SKEW_COMPENSATION OFF -to DDR3_RESET_n


set_location_assignment PIN_E22 -to DDR3_WE_n
set_instance_assignment -name IO_STANDARD "SSTL-15" -to DDR3_WE_n
#set_instance_assignment -name PACKAGE_SKEW_COMPENSATION OFF -to DDR3_WE_n


set_instance_assignment -name DQ_GROUP 9 -from DDR3_DQS_p[0] -to DDR3_DQ[0]
set_instance_assignment -name DQ_GROUP 9 -from DDR3_DQS_p[0] -to DDR3_DQ[1]
set_instance_assignment -name DQ_GROUP 9 -from DDR3_DQS_p[0] -to DDR3_DQ[2]
set_instance_assignment -name DQ_GROUP 9 -from DDR3_DQS_p[0] -to DDR3_DQ[3]
set_instance_assignment -name DQ_GROUP 9 -from DDR3_DQS_p[0] -to DDR3_DQ[4]
set_instance_assignment -name DQ_GROUP 9 -from DDR3_DQS_p[0] -to DDR3_DQ[5]
set_instance_assignment -name DQ_GROUP 9 -from DDR3_DQS_p[0] -to DDR3_DQ[6]
set_instance_assignment -name DQ_GROUP 9 -from DDR3_DQS_p[0] -to DDR3_DQ[7]
set_instance_assignment -name DQ_GROUP 9 -from DDR3_DQS_p[1] -to DDR3_DQ[8]
set_instance_assignment -name DQ_GROUP 9 -from DDR3_DQS_p[1] -to DDR3_DQ[9]
set_instance_assignment -name DQ_GROUP 9 -from DDR3_DQS_p[1] -to DDR3_DQ[10]
set_instance_assignment -name DQ_GROUP 9 -from DDR3_DQS_p[1] -to DDR3_DQ[11]
set_instance_assignment -name DQ_GROUP 9 -from DDR3_DQS_p[1] -to DDR3_DQ[12]
set_instance_assignment -name DQ_GROUP 9 -from DDR3_DQS_p[1] -to DDR3_DQ[13]
set_instance_assignment -name DQ_GROUP 9 -from DDR3_DQS_p[1] -to DDR3_DQ[14]
set_instance_assignment -name DQ_GROUP 9 -from DDR3_DQS_p[1] -to DDR3_DQ[15]

set_instance_assignment -name DQ_GROUP 9 -from DDR3_DQS_p[0] -to DDR3_DM[0]
set_instance_assignment -name DQ_GROUP 9 -from DDR3_DQS_p[1] -to DDR3_DM[1]


#set_instance_assignment -name ENABLE_BENEFICIAL_SKEW_OPTIMIZATION_FOR_NON_GLOBAL_CLOCKS ON
#set_instance_assignment -name GLOBAL_SIGNAL OFF -to if0|p0|umemphy|ureset|phy_reset_n -tag __nios_system_ddr3_p0
#set_instance_assignment -name GLOBAL_SIGNAL OFF -to if0|p0|umemphy|uread_datapath|reset_n_fifo_wraddress[0] -tag __nios_system_ddr3_p0
#set_instance_assignment -name GLOBAL_SIGNAL OFF -to if0|p0|umemphy|uread_datapath|reset_n_fifo_wraddress[1] -tag __nios_system_ddr3_p0
#set_instance_assignment -name ENABLE_BENEFICIAL_SKEW_OPTIMIZATION_FOR_NON_GLOBAL_CLOCKS ON -to if0 -tag __nios_system_ddr3_p0
#set_instance_assignment -name GLOBAL_SIGNAL OFF -to "dut_example_if0:if0|dut_example_if0_p0:p0|dut_example_if0_p0___nios_system_ddr3_p0_m10:umemphy|dut_example_if0_p0_dqdqs_pads_m10:dq_ddio[*].ubidir_dq_dqs|altera_gpio_lite:dq_ddio_io|altgpio_one_bit:gpio_one_bit.i_loop[*].altgpio_bit_i|fr_clock"
set_global_assignment -name UNIPHY_SEQUENCER_DQS_CONFIG_ENABLE ON
set_global_assignment -name OPTIMIZE_MULTI_CORNER_TIMING ON
set_global_assignment -name UNIPHY_TEMP_VER_CODE 2136146133
set_global_assignment -name ECO_REGENERATE_REPORT ON


# set_location_assignment PIN_B22 -to CKE
# set_location_assignment -name IO_STANDARD "SSTL-15 CLASS I" = to CKE

# set_location_assignment PIN_E18 -to CK_n
# set_location_assignment -name IO_STANDARD "DIFFERENTIAL 1.5-V SSTL CLASS I" = to CK_n
# set_location_assignment PIN_D18 -to CK_p
# set_location_assignment -name IO_STANDARD "DIFFERENTIAL 1.5-V SSTL CLASS I" = to CK_p


#LIGHT
set_location_assignment PIN_Y8 -to LIGHT_I2C_SCL
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to LIGHT_I2C_SCL
set_location_assignment PIN_AA8 -to LIGHT_I2C_SDA
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to LIGHT_I2C_SDA

#RH_TEMP_SENSOR
set_location_assignment PIN_Y10 -to RH_TEMP_I2C_SCL
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to RH_TEMP_I2C_SCL
set_location_assignment PIN_AA10 -to RH_TEMP_I2C_SDA
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to RH_TEMP_I2C_SDA
set_location_assignment PIN_AB9 -to RH_TEMP_DRDY_n
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to RH_TEMP_DRDY_n

#TEMP_SENSOR
set_location_assignment PIN_AA1 -to TEMP_SC
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to TEMP_SC
set_location_assignment PIN_Y2 -to TEMP_SIO
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to TEMP_SIO
set_location_assignment PIN_AB4 -to TEMP_CS_n
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to TEMP_CS_n

#Test temp sensor
#set_location_assignment PIN_W6 -to test_temp_sc
#set_instance_assignment -name IO_STANDARD "3.3V LVTTL" -to test_temp_sc

#set_location_assignment PIN_W7 -to  test_temp_si
#set_instance_assignment -name IO_STANDARD "3.3V LVTTL" -to  test_temp_si

#set_location_assignment PIN_W8 -to  test_temp_so
#set_instance_assignment -name IO_STANDARD "3.3V LVTTL" -to  test_temp_so

#set_location_assignment PIN_V8 -to  test_temp_soe
#set_instance_assignment -name IO_STANDARD "3.3V LVTTL" -to  test_temp_soe

#set_location_assignment PIN_AB8 -to  test_temp_cs_n
#set_instance_assignment -name IO_STANDARD "3.3V LVTTL" -to  test_temp_cs_n



# ACCELEROMETER
set_location_assignment PIN_C6 -to G_SENSOR_SDI
set_instance_assignment -name IO_STANDARD "1.2 V"  -to G_SENSOR_SDI

set_location_assignment PIN_D5 -to G_SENSOR_SDO
set_instance_assignment -name IO_STANDARD "1.2 V"  -to G_SENSOR_SDO

set_location_assignment PIN_E9 -to G_SENSOR_CS_n
set_instance_assignment -name IO_STANDARD "1.2 V"  -to G_SENSOR_CS_n


set_location_assignment PIN_B5 -to G_SENSOR_SCLK
set_instance_assignment -name IO_STANDARD "1.2 V"  -to G_SENSOR_SCLK





#ADC
# set_location_assignment PIN_F5 -to ADCIN1
# set_instance_assignment -name IO_STANDARD "2.5 V"  -to ADCIN1
#
# set_location_assignment PIN_F4 -to ADCIN2
# set_instance_assignment -name IO_STANDARD "2.5 V" = to ADCIN2
#
# set_location_assignment PIN_J8 -to ADCIN3
# set_instance_assignment -name IO_STANDARD "2.5 V"  -to ADCIN3
#
# set_location_assignment PIN_J9 -to ADCIN4
# set_instance_assignment -name IO_STANDARD "2.5 V" = to ADCIN4
#
# set_location_assignment PIN_J4 -to ADCIN5
# set_instance_assignment -name IO_STANDARD "2.5 V"  -to ADCIN5
#
# set_location_assignment PIN_H3 -to ADCIN6
# set_instance_assignment -name IO_STANDARD "2.5 V" = to ADCIN6
#
# set_location_assignment PIN_K5 -to ADCIN7
# set_instance_assignment -name IO_STANDARD "2.5 V"  -to ADCIN7


#set_location_assignment PIN_D7 -to G_SENSOR_INT1
#set_instance_assignment -name IO_STANDARD "3.3V LVTTL" = to G_SENSOR_INT2

# SD card


#============================================================
# Ethernet
#============================================================
set_location_assignment PIN_R4 -to NET_COL
set_instance_assignment -name IO_STANDARD "2.5 V" -to NET_COL
set_location_assignment PIN_P5 -to NET_CRS
set_instance_assignment -name IO_STANDARD "2.5 V" -to NET_CRS
set_location_assignment PIN_R5 -to NET_MDC
set_instance_assignment -name IO_STANDARD "2.5 V" -to NET_MDC
set_location_assignment PIN_N8 -to NET_MDIO
set_instance_assignment -name IO_STANDARD "2.5 V" -to NET_MDIO
set_location_assignment PIN_V9 -to NET_PCF_EN
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to NET_PCF_EN
set_location_assignment PIN_R3 -to NET_RESET_n
set_instance_assignment -name IO_STANDARD "2.5 V" -to NET_RESET_n
set_location_assignment PIN_U5 -to NET_RXD[0]
set_instance_assignment -name IO_STANDARD "2.5 V" -to NET_RXD[0]
set_location_assignment PIN_U4 -to NET_RXD[1]
set_instance_assignment -name IO_STANDARD "2.5 V" -to NET_RXD[1]
set_location_assignment PIN_R7 -to NET_RXD[2]
set_instance_assignment -name IO_STANDARD "2.5 V" -to NET_RXD[2]
set_location_assignment PIN_P8 -to NET_RXD[3]
set_instance_assignment -name IO_STANDARD "2.5 V" -to NET_RXD[3]
set_location_assignment PIN_T6 -to NET_RX_CLK
set_instance_assignment -name IO_STANDARD "2.5 V" -to NET_RX_CLK
set_location_assignment PIN_P4 -to NET_RX_DV
set_instance_assignment -name IO_STANDARD "2.5 V" -to NET_RX_DV
set_location_assignment PIN_V1 -to NET_RX_ER
set_instance_assignment -name IO_STANDARD "2.5 V" -to NET_RX_ER
set_location_assignment PIN_U2 -to NET_TXD[0]
set_instance_assignment -name IO_STANDARD "2.5 V" -to NET_TXD[0]
set_location_assignment PIN_W1 -to NET_TXD[1]
set_instance_assignment -name IO_STANDARD "2.5 V" -to NET_TXD[1]
set_location_assignment PIN_N9 -to NET_TXD[2]
set_instance_assignment -name IO_STANDARD "2.5 V" -to NET_TXD[2]
set_location_assignment PIN_W2 -to NET_TXD[3]
set_instance_assignment -name IO_STANDARD "2.5 V" -to NET_TXD[3]
set_location_assignment PIN_T5 -to NET_TX_CLK
set_instance_assignment -name IO_STANDARD "2.5 V" -to NET_TX_CLK
set_location_assignment PIN_P3 -to NET_TX_EN
set_instance_assignment -name IO_STANDARD "2.5 V" -to NET_TX_EN


#============================================================
# HDMI-TX
#============================================================
set_location_assignment PIN_C10 -to HDMI_I2C_SCL
set_instance_assignment -name IO_STANDARD "1.8 V" -to HDMI_I2C_SCL
set_location_assignment PIN_B15 -to HDMI_I2C_SDA
set_instance_assignment -name IO_STANDARD "1.8 V" -to HDMI_I2C_SDA

#
# set_location_assignment PIN_R11 -to HDMI_I2C_SCL_DEBUG
# set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to HDMI_I2C_SCL_DEBUG
# set_location_assignment PIN_AB7 -to HDMI_I2C_SDA_DEBUG
# set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to HDMI_I2C_SDA_DEBUG

set_location_assignment PIN_A9 -to HDMI_I2S[0]
set_instance_assignment -name IO_STANDARD "1.8 V" -to HDMI_I2S[0]
set_location_assignment PIN_A11 -to HDMI_I2S[1]
set_instance_assignment -name IO_STANDARD "1.8 V" -to HDMI_I2S[1]
set_location_assignment PIN_A8 -to HDMI_I2S[2]
set_instance_assignment -name IO_STANDARD "1.8 V" -to HDMI_I2S[2]
set_location_assignment PIN_B8 -to HDMI_I2S[3]
set_instance_assignment -name IO_STANDARD "1.8 V" -to HDMI_I2S[3]
set_location_assignment PIN_A10 -to HDMI_LRCLK
set_instance_assignment -name IO_STANDARD "1.8 V" -to HDMI_LRCLK
set_location_assignment PIN_A7 -to HDMI_MCLK
set_instance_assignment -name IO_STANDARD "1.8 V" -to HDMI_MCLK
set_location_assignment PIN_D12 -to HDMI_SCLK
set_instance_assignment -name IO_STANDARD "1.8 V" -to HDMI_SCLK
set_location_assignment PIN_A20 -to HDMI_TX_CLK
set_instance_assignment -name IO_STANDARD "1.8 V" -to HDMI_TX_CLK
set_location_assignment PIN_C18 -to HDMI_TX_D[0]
set_instance_assignment -name IO_STANDARD "1.8 V" -to HDMI_TX_D[0]
set_location_assignment PIN_D17 -to HDMI_TX_D[1]
set_instance_assignment -name IO_STANDARD "1.8 V" -to HDMI_TX_D[1]
set_location_assignment PIN_C17 -to HDMI_TX_D[2]
set_instance_assignment -name IO_STANDARD "1.8 V" -to HDMI_TX_D[2]
set_location_assignment PIN_C19 -to HDMI_TX_D[3]
set_instance_assignment -name IO_STANDARD "1.8 V" -to HDMI_TX_D[3]
set_location_assignment PIN_D14 -to HDMI_TX_D[4]
set_instance_assignment -name IO_STANDARD "1.8 V" -to HDMI_TX_D[4]
set_location_assignment PIN_B19 -to HDMI_TX_D[5]
set_instance_assignment -name IO_STANDARD "1.8 V" -to HDMI_TX_D[5]
set_location_assignment PIN_D13 -to HDMI_TX_D[6]
set_instance_assignment -name IO_STANDARD "1.8 V" -to HDMI_TX_D[6]
set_location_assignment PIN_A19 -to HDMI_TX_D[7]
set_instance_assignment -name IO_STANDARD "1.8 V" -to HDMI_TX_D[7]
set_location_assignment PIN_C14 -to HDMI_TX_D[8]
set_instance_assignment -name IO_STANDARD "1.8 V" -to HDMI_TX_D[8]
set_location_assignment PIN_A17 -to HDMI_TX_D[9]
set_instance_assignment -name IO_STANDARD "1.8 V" -to HDMI_TX_D[9]
set_location_assignment PIN_B16 -to HDMI_TX_D[10]
set_instance_assignment -name IO_STANDARD "1.8 V" -to HDMI_TX_D[10]
set_location_assignment PIN_C15 -to HDMI_TX_D[11]
set_instance_assignment -name IO_STANDARD "1.8 V" -to HDMI_TX_D[11]
set_location_assignment PIN_A14 -to HDMI_TX_D[12]
set_instance_assignment -name IO_STANDARD "1.8 V" -to HDMI_TX_D[12]
set_location_assignment PIN_A15 -to HDMI_TX_D[13]
set_instance_assignment -name IO_STANDARD "1.8 V" -to HDMI_TX_D[13]
set_location_assignment PIN_A12 -to HDMI_TX_D[14]
set_instance_assignment -name IO_STANDARD "1.8 V" -to HDMI_TX_D[14]
set_location_assignment PIN_A16 -to HDMI_TX_D[15]
set_instance_assignment -name IO_STANDARD "1.8 V" -to HDMI_TX_D[15]
set_location_assignment PIN_A13 -to HDMI_TX_D[16]
set_instance_assignment -name IO_STANDARD "1.8 V" -to HDMI_TX_D[16]
set_location_assignment PIN_C16 -to HDMI_TX_D[17]
set_instance_assignment -name IO_STANDARD "1.8 V" -to HDMI_TX_D[17]
set_location_assignment PIN_C12 -to HDMI_TX_D[18]
set_instance_assignment -name IO_STANDARD "1.8 V" -to HDMI_TX_D[18]
set_location_assignment PIN_B17 -to HDMI_TX_D[19]
set_instance_assignment -name IO_STANDARD "1.8 V" -to HDMI_TX_D[19]
set_location_assignment PIN_B12 -to HDMI_TX_D[20]
set_instance_assignment -name IO_STANDARD "1.8 V" -to HDMI_TX_D[20]
set_location_assignment PIN_B14 -to HDMI_TX_D[21]
set_instance_assignment -name IO_STANDARD "1.8 V" -to HDMI_TX_D[21]
set_location_assignment PIN_A18 -to HDMI_TX_D[22]
set_instance_assignment -name IO_STANDARD "1.8 V" -to HDMI_TX_D[22]
set_location_assignment PIN_C13 -to HDMI_TX_D[23]
set_instance_assignment -name IO_STANDARD "1.8 V" -to HDMI_TX_D[23]
set_location_assignment PIN_C9 -to HDMI_TX_DE
set_instance_assignment -name IO_STANDARD "1.8 V" -to HDMI_TX_DE
set_location_assignment PIN_B11 -to HDMI_TX_HS
set_instance_assignment -name IO_STANDARD "1.8 V" -to HDMI_TX_HS
set_location_assignment PIN_B10 -to HDMI_TX_INT
set_instance_assignment -name IO_STANDARD "1.8 V" -to HDMI_TX_INT
# set_location_assignment PIN_AB6 -to HDMI_TX_INT_DEBUG
# set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to HDMI_TX_INT_DEBUG
set_location_assignment PIN_C11 -to HDMI_TX_VS
set_instance_assignment -name IO_STANDARD "1.8 V" -to HDMI_TX_VS

#============================================================
# USB
#============================================================
# set_location_assignment PIN_H11 -to USB_CLKIN
# set_instance_assignment -name IO_STANDARD "1.2 V" -to USB_CLKIN
# set_location_assignment PIN_J11 -to USB_CS
# set_instance_assignment -name IO_STANDARD "1.8 V" -to USB_CS
# set_location_assignment PIN_E12 -to USB_DATA[0]
# set_instance_assignment -name IO_STANDARD "1.8 V" -to USB_DATA[0]
# set_location_assignment PIN_E13 -to USB_DATA[1]
# set_instance_assignment -name IO_STANDARD "1.8 V" -to USB_DATA[1]
# set_location_assignment PIN_H13 -to USB_DATA[2]
# set_instance_assignment -name IO_STANDARD "1.8 V" -to USB_DATA[2]
# set_location_assignment PIN_E14 -to USB_DATA[3]
# set_instance_assignment -name IO_STANDARD "1.8 V" -to USB_DATA[3]
# set_location_assignment PIN_H14 -to USB_DATA[4]
# set_instance_assignment -name IO_STANDARD "1.8 V" -to USB_DATA[4]
# set_location_assignment PIN_D15 -to USB_DATA[5]
# set_instance_assignment -name IO_STANDARD "1.8 V" -to USB_DATA[5]
# set_location_assignment PIN_E15 -to USB_DATA[6]
# set_instance_assignment -name IO_STANDARD "1.8 V" -to USB_DATA[6]
# set_location_assignment PIN_F15 -to USB_DATA[7]
# set_instance_assignment -name IO_STANDARD "1.8 V" -to USB_DATA[7]
# set_location_assignment PIN_J13 -to USB_DIR
# set_instance_assignment -name IO_STANDARD "1.8 V" -to USB_DIR
# set_location_assignment PIN_D8 -to USB_FAULT_n
# set_instance_assignment -name IO_STANDARD "1.2 V" -to USB_FAULT_n
# set_location_assignment PIN_H12 -to USB_NXT
# set_instance_assignment -name IO_STANDARD "1.8 V" -to USB_NXT
# set_location_assignment PIN_E16 -to USB_RESET_n
# set_instance_assignment -name IO_STANDARD "1.8 V" -to USB_RESET_n
# set_location_assignment PIN_J12 -to USB_STP
# set_instance_assignment -name IO_STANDARD "1.8 V" -to USB_STP
