## Clock signal
set_property -dict { PACKAGE_PIN E3    IOSTANDARD LVCMOS33 } [get_ports { clk_in }];
create_clock -add -name clk_in -period 10.00 -waveform {0 5} [get_ports { clk_in }];
##set_clock_uncertainty -setup 0.1 [get_clocks clk_in]
##set_clock_uncertainty -hold 0.05 [get_clocks clk_in]
set_max_delay 1.0 [get_ports *]

## Voltage configurations
set_property CFGBVS VCCO        [current_design]
set_property CONFIG_VOLTAGE 3.3 [current_design]

## Additional SPI config constrains
set_property BITSTREAM.CONFIG.SPI_BUSWIDTH 4  [current_design]
set_property CONFIG_MODE SPIx4  [current_design]

## Valid for place and route but not for PMOD
## Pmod Header JC
set_property -dict { PACKAGE_PIN U12   IOSTANDARD TMDS_33 } [get_ports { TMDSp[2] }]; #IO_L20P_T3_A08_D24_14 Sch=jc_p[1]
set_property -dict { PACKAGE_PIN V12   IOSTANDARD TMDS_33 } [get_ports { TMDSn[2] }]; #IO_L20N_T3_A07_D23_14 Sch=jc_n[1]
set_property -dict { PACKAGE_PIN V10   IOSTANDARD TMDS_33 } [get_ports { TMDSp[1] }]; #IO_L21P_T3_DQS_14 Sch=jc_p[2]
set_property -dict { PACKAGE_PIN V11   IOSTANDARD TMDS_33 } [get_ports { TMDSn[1] }]; #IO_L21N_T3_DQS_A06_D22_14 Sch=jc_n[2]
set_property -dict { PACKAGE_PIN U14   IOSTANDARD TMDS_33 } [get_ports { TMDSp[0] }]; #IO_L22P_T3_A05_D21_14 Sch=jc_p[3]
set_property -dict { PACKAGE_PIN V14   IOSTANDARD TMDS_33 } [get_ports { TMDSn[0] }]; #IO_L22N_T3_A04_D20_14 Sch=jc_n[3]
set_property -dict { PACKAGE_PIN T13   IOSTANDARD TMDS_33 } [get_ports { TMDSp_clock }]; #IO_L23P_T3_A03_D19_14 Sch=jc_p[4]
set_property -dict { PACKAGE_PIN U13   IOSTANDARD TMDS_33 } [get_ports { TMDSn_clock }]; #IO_L23N_T3_A02_D18_14 Sch=jc_n[4]



## Correct assignment invalid for place and route
## Pmod Header JC
#set_property -dict { PACKAGE_PIN U12   IOSTANDARD TMDS_33 } [get_ports { TMDSp[2] }]; #IO_L20P_T3_A08_D24_14 Sch=jc_p[1]
#set_property -dict { PACKAGE_PIN V12   IOSTANDARD TMDS_33 } [get_ports { TMDSp[1] }]; #IO_L20N_T3_A07_D23_14 Sch=jc_n[1]
#set_property -dict { PACKAGE_PIN V10   IOSTANDARD TMDS_33 } [get_ports { TMDSp[0] }]; #IO_L21P_T3_DQS_14 Sch=jc_p[2]
#set_property -dict { PACKAGE_PIN V11   IOSTANDARD TMDS_33 } [get_ports { TMDSp_clock }]; #IO_L21N_T3_DQS_A06_D22_14 Sch=jc_n[2]
#set_property -dict { PACKAGE_PIN U14   IOSTANDARD TMDS_33 } [get_ports { TMDSn[2] }]; #IO_L22P_T3_A05_D21_14 Sch=jc_p[3]
#set_property -dict { PACKAGE_PIN V14   IOSTANDARD TMDS_33 } [get_ports { TMDSn[1] }]; #IO_L22N_T3_A04_D20_14 Sch=jc_n[3]
#set_property -dict { PACKAGE_PIN T13   IOSTANDARD TMDS_33 } [get_ports { TMDSn[0] }]; #IO_L23P_T3_A03_D19_14 Sch=jc_p[4]
#set_property -dict { PACKAGE_PIN U13   IOSTANDARD TMDS_33 } [get_ports { TMDSn_clock }]; #IO_L23N_T3_A02_D18_14 Sch=jc_n[4]

