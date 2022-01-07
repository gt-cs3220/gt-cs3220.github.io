#create_clock -period 20 -name CLOCK_50 -waveform {0 10} [get_ports CLOCK_50]

## Clock signal 125 MHz

set_property -dict { PACKAGE_PIN H16   IOSTANDARD LVCMOS33 } [get_ports { CLOCK_50 }]; #IO_L13P_T2_MRCC_35 Sch=sysclk
create_clock -add -name sys_clk_pin -period 20 -waveform {0 10} [get_ports { CLOCK_50 }];

## Reset signal (False)
set_property -dict { PACKAGE_PIN M20   IOSTANDARD LVCMOS33 } [get_ports { RESET_N }]; #IO_L7N_T1_AD2N_35 Sch=sw[0]

## Key
set_property -dict { PACKAGE_PIN D19   IOSTANDARD LVCMOS33 } [get_ports { KEY[0] }]; #IO_L4P_T0_35 Sch=btn[0]
set_property -dict { PACKAGE_PIN D20   IOSTANDARD LVCMOS33 } [get_ports { KEY[1] }]; #IO_L4N_T0_35 Sch=btn[1]
set_property -dict { PACKAGE_PIN L20   IOSTANDARD LVCMOS33 } [get_ports { KEY[2] }]; #IO_L9N_T1_DQS_AD3N_35 Sch=btn[2]
set_property -dict { PACKAGE_PIN L19   IOSTANDARD LVCMOS33 } [get_ports { KEY[3] }]; #IO_L9P_T1_DQS_AD3P_35 Sch=btn[3]

## LEDR
set_property -dict { PACKAGE_PIN R14   IOSTANDARD LVCMOS33 } [get_ports { LEDR[0] }]; #IO_L6N_T0_VREF_34 Sch=led[0]
set_property -dict { PACKAGE_PIN P14   IOSTANDARD LVCMOS33 } [get_ports { LEDR[1] }]; #IO_L6P_T0_34 Sch=led[1]
set_property -dict { PACKAGE_PIN N16   IOSTANDARD LVCMOS33 } [get_ports { LEDR[2] }]; #IO_L21N_T3_DQS_AD14N_35 Sch=led[2]
set_property -dict { PACKAGE_PIN M14   IOSTANDARD LVCMOS33 } [get_ports { LEDR[3] }]; #IO_L23P_T3_35 Sch=led[3]
set_property -dict { PACKAGE_PIN L15   IOSTANDARD LVCMOS33 } [get_ports { LEDR[4] }]; #IO_L22N_T3_AD7N_35 Sch=led4_b
set_property -dict { PACKAGE_PIN G17   IOSTANDARD LVCMOS33 } [get_ports { LEDR[5] }]; #IO_L16P_T2_35 Sch=led4_g
set_property -dict { PACKAGE_PIN N15   IOSTANDARD LVCMOS33 } [get_ports { LEDR[6] }]; #IO_L21P_T3_DQS_AD14P_35 Sch=led4_r
set_property -dict { PACKAGE_PIN G14   IOSTANDARD LVCMOS33 } [get_ports { LEDR[7] }]; #IO_0_35 Sch=led5_b
set_property -dict { PACKAGE_PIN L14   IOSTANDARD LVCMOS33 } [get_ports { LEDR[8] }]; #IO_L22P_T3_AD7P_35 Sch=led5_g
set_property -dict { PACKAGE_PIN M15   IOSTANDARD LVCMOS33 } [get_ports { LEDR[9] }]; #IO_L23N_T3_35 Sch=led5_r

##PMOD (False)
set_property -dict { PACKAGE_PIN Y18   IOSTANDARD LVCMOS33 } [get_ports { HEX0[0] }]; #IO_L17P_T2_34 Sch=ja_p[1]
set_property -dict { PACKAGE_PIN Y19   IOSTANDARD LVCMOS33 } [get_ports { HEX0[1] }]; #IO_L17N_T2_34 Sch=ja_n[1]
set_property -dict { PACKAGE_PIN Y16   IOSTANDARD LVCMOS33 } [get_ports { HEX0[2] }]; #IO_L7P_T1_34 Sch=ja_p[2]
set_property -dict { PACKAGE_PIN Y17   IOSTANDARD LVCMOS33 } [get_ports { HEX0[3] }]; #IO_L7N_T1_34 Sch=ja_n[2]
set_property -dict { PACKAGE_PIN U18   IOSTANDARD LVCMOS33 } [get_ports { HEX0[4] }]; #IO_L12P_T1_MRCC_34 Sch=ja_p[3]
set_property -dict { PACKAGE_PIN U19   IOSTANDARD LVCMOS33 } [get_ports { HEX0[5] }]; #IO_L12N_T1_MRCC_34 Sch=ja_n[3]
set_property -dict { PACKAGE_PIN W18   IOSTANDARD LVCMOS33 } [get_ports { HEX0[6] }]; #IO_L22P_T3_34 Sch=ja_p[4]
set_property -dict { PACKAGE_PIN W19   IOSTANDARD LVCMOS33 } [get_ports { HEX1[0] }]; #IO_L22N_T3_34 Sch=ja_n[4]

set_property -dict { PACKAGE_PIN W14   IOSTANDARD LVCMOS33 } [get_ports { HEX1[1] }]; #IO_L8P_T1_34 Sch=jb_p[1]
set_property -dict { PACKAGE_PIN Y14   IOSTANDARD LVCMOS33 } [get_ports { HEX1[2] }]; #IO_L8N_T1_34 Sch=jb_n[1]
set_property -dict { PACKAGE_PIN T11   IOSTANDARD LVCMOS33 } [get_ports { HEX1[3] }]; #IO_L1P_T0_34 Sch=jb_p[2]
set_property -dict { PACKAGE_PIN T10   IOSTANDARD LVCMOS33 } [get_ports { HEX1[4] }]; #IO_L1N_T0_34 Sch=jb_n[2]
set_property -dict { PACKAGE_PIN V16   IOSTANDARD LVCMOS33 } [get_ports { HEX1[5] }]; #IO_L18P_T2_34 Sch=jb_p[3]
set_property -dict { PACKAGE_PIN W16   IOSTANDARD LVCMOS33 } [get_ports { HEX1[6] }]; #IO_L18N_T2_34 Sch=jb_n[3]

