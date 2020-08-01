## Clock signal 100 MHz
set_property -dict { PACKAGE_PIN H4  IOSTANDARD LVCMOS33 } [get_ports clk]; #IO_L13P_T2_MRCC_35 Sch=sysclk
create_clock -add -name sys_clk_pin -period 10.00 -waveform {0 5} [get_ports clk];

#rst_n
set_property IOSTANDARD LVCMOS33 [get_ports rst_n]
set_property PACKAGE_PIN D14 [get_ports rst_n]

#Gyro
set_property PACKAGE_PIN P12 [get_ports Gyro_IIC_SCL]
set_property PACKAGE_PIN P13 [get_ports Gyro_IIC_SDA]

set_property IOSTANDARD LVCMOS33 [get_ports Gyro_IIC_SCL]
set_property IOSTANDARD LVCMOS33 [get_ports Gyro_IIC_SDA]

set_property PULLUP true [get_ports {Gyro_IIC_SCL}]
set_property PULLUP true [get_ports {Gyro_IIC_SDA}]

set_property PACKAGE_PIN H1 [get_ports VCC]
set_property PACKAGE_PIN H2 [get_ports GND]

set_property IOSTANDARD LVCMOS33 [get_ports VCC]
set_property IOSTANDARD LVCMOS33 [get_ports GND]

set_property PACKAGE_PIN N4 [get_ports IIC_OE]
set_property PACKAGE_PIN L13 [get_ports VCCEN]

set_property IOSTANDARD LVCMOS33 [get_ports IIC_OE]
set_property IOSTANDARD LVCMOS33 [get_ports VCCEN]

##HDMI Tx
set_property -dict { PACKAGE_PIN F4   IOSTANDARD TMDS_33  } [get_ports { TMDS_Tx_Clk_N }]; #IO_L11N_T1_SRCC_35 Sch=hdmi_tx_clk_n
set_property -dict { PACKAGE_PIN G4   IOSTANDARD TMDS_33  } [get_ports { TMDS_Tx_Clk_P }]; #IO_L11P_T1_SRCC_35 Sch=hdmi_tx_clk_p
set_property -dict { PACKAGE_PIN F1   IOSTANDARD TMDS_33  } [get_ports { TMDS_Tx_Data_N[0] }]; #IO_L12N_T1_MRCC_35 Sch=hdmi_tx_d_n[0]
set_property -dict { PACKAGE_PIN G1   IOSTANDARD TMDS_33  } [get_ports { TMDS_Tx_Data_P[0] }]; #IO_L12P_T1_MRCC_35 Sch=hdmi_tx_d_p[0]
set_property -dict { PACKAGE_PIN D2   IOSTANDARD TMDS_33  } [get_ports { TMDS_Tx_Data_N[1] }]; #IO_L10N_T1_AD11N_35 Sch=hdmi_tx_d_n[1]
set_property -dict { PACKAGE_PIN E2   IOSTANDARD TMDS_33  } [get_ports { TMDS_Tx_Data_P[1] }]; #IO_L10P_T1_AD11P_35 Sch=hdmi_tx_d_p[1]
set_property -dict { PACKAGE_PIN C1   IOSTANDARD TMDS_33  } [get_ports { TMDS_Tx_Data_N[2] }]; #IO_L14N_T2_AD4N_SRCC_35 Sch=hdmi_tx_d_n[2]
set_property -dict { PACKAGE_PIN D1   IOSTANDARD TMDS_33  } [get_ports { TMDS_Tx_Data_P[2] }]; #IO_L14P_T2_AD4P_SRCC_35 Sch=hdmi_tx_d_p[2]