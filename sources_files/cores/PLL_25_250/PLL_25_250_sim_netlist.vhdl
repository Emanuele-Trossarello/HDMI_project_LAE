-- Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2019.2 (win64) Build 2708876 Wed Nov  6 21:40:23 MST 2019
-- Date        : Mon Mar 24 10:50:11 2025
-- Host        : Emanuele-PC running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode funcsim
--               c:/Users/emanu/LAE_HDMI_project/cores/PLL_25_250/PLL_25_250_sim_netlist.vhdl
-- Design      : PLL_25_250
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xc7a35ticsg324-1L
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity PLL_25_250_PLL_25_250_clk_wiz is
  port (
    clk25 : out STD_LOGIC;
    clk250 : out STD_LOGIC;
    clk100in : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of PLL_25_250_PLL_25_250_clk_wiz : entity is "PLL_25_250_clk_wiz";
end PLL_25_250_PLL_25_250_clk_wiz;

architecture STRUCTURE of PLL_25_250_PLL_25_250_clk_wiz is
  signal clk100in_PLL_25_250 : STD_LOGIC;
  signal clk250_PLL_25_250 : STD_LOGIC;
  signal clk25_PLL_25_250 : STD_LOGIC;
  signal clkfbout_PLL_25_250 : STD_LOGIC;
  signal clkfbout_buf_PLL_25_250 : STD_LOGIC;
  signal NLW_plle2_adv_inst_CLKOUT2_UNCONNECTED : STD_LOGIC;
  signal NLW_plle2_adv_inst_CLKOUT3_UNCONNECTED : STD_LOGIC;
  signal NLW_plle2_adv_inst_CLKOUT4_UNCONNECTED : STD_LOGIC;
  signal NLW_plle2_adv_inst_CLKOUT5_UNCONNECTED : STD_LOGIC;
  signal NLW_plle2_adv_inst_DRDY_UNCONNECTED : STD_LOGIC;
  signal NLW_plle2_adv_inst_LOCKED_UNCONNECTED : STD_LOGIC;
  signal NLW_plle2_adv_inst_DO_UNCONNECTED : STD_LOGIC_VECTOR ( 15 downto 0 );
  attribute BOX_TYPE : string;
  attribute BOX_TYPE of clkf_buf : label is "PRIMITIVE";
  attribute BOX_TYPE of clkin1_ibufg : label is "PRIMITIVE";
  attribute CAPACITANCE : string;
  attribute CAPACITANCE of clkin1_ibufg : label is "DONT_CARE";
  attribute IBUF_DELAY_VALUE : string;
  attribute IBUF_DELAY_VALUE of clkin1_ibufg : label is "0";
  attribute IFD_DELAY_VALUE : string;
  attribute IFD_DELAY_VALUE of clkin1_ibufg : label is "AUTO";
  attribute BOX_TYPE of clkout1_buf : label is "PRIMITIVE";
  attribute BOX_TYPE of clkout2_buf : label is "PRIMITIVE";
  attribute BOX_TYPE of plle2_adv_inst : label is "PRIMITIVE";
begin
clkf_buf: unisim.vcomponents.BUFG
     port map (
      I => clkfbout_PLL_25_250,
      O => clkfbout_buf_PLL_25_250
    );
clkin1_ibufg: unisim.vcomponents.IBUF
    generic map(
      IOSTANDARD => "DEFAULT"
    )
        port map (
      I => clk100in,
      O => clk100in_PLL_25_250
    );
clkout1_buf: unisim.vcomponents.BUFG
     port map (
      I => clk25_PLL_25_250,
      O => clk25
    );
clkout2_buf: unisim.vcomponents.BUFG
     port map (
      I => clk250_PLL_25_250,
      O => clk250
    );
plle2_adv_inst: unisim.vcomponents.PLLE2_ADV
    generic map(
      BANDWIDTH => "HIGH",
      CLKFBOUT_MULT => 15,
      CLKFBOUT_PHASE => 0.000000,
      CLKIN1_PERIOD => 10.000000,
      CLKIN2_PERIOD => 0.000000,
      CLKOUT0_DIVIDE => 60,
      CLKOUT0_DUTY_CYCLE => 0.500000,
      CLKOUT0_PHASE => 0.000000,
      CLKOUT1_DIVIDE => 6,
      CLKOUT1_DUTY_CYCLE => 0.500000,
      CLKOUT1_PHASE => 0.000000,
      CLKOUT2_DIVIDE => 1,
      CLKOUT2_DUTY_CYCLE => 0.500000,
      CLKOUT2_PHASE => 0.000000,
      CLKOUT3_DIVIDE => 1,
      CLKOUT3_DUTY_CYCLE => 0.500000,
      CLKOUT3_PHASE => 0.000000,
      CLKOUT4_DIVIDE => 1,
      CLKOUT4_DUTY_CYCLE => 0.500000,
      CLKOUT4_PHASE => 0.000000,
      CLKOUT5_DIVIDE => 1,
      CLKOUT5_DUTY_CYCLE => 0.500000,
      CLKOUT5_PHASE => 0.000000,
      COMPENSATION => "ZHOLD",
      DIVCLK_DIVIDE => 1,
      IS_CLKINSEL_INVERTED => '0',
      IS_PWRDWN_INVERTED => '0',
      IS_RST_INVERTED => '0',
      REF_JITTER1 => 0.010000,
      REF_JITTER2 => 0.010000,
      STARTUP_WAIT => "FALSE"
    )
        port map (
      CLKFBIN => clkfbout_buf_PLL_25_250,
      CLKFBOUT => clkfbout_PLL_25_250,
      CLKIN1 => clk100in_PLL_25_250,
      CLKIN2 => '0',
      CLKINSEL => '1',
      CLKOUT0 => clk25_PLL_25_250,
      CLKOUT1 => clk250_PLL_25_250,
      CLKOUT2 => NLW_plle2_adv_inst_CLKOUT2_UNCONNECTED,
      CLKOUT3 => NLW_plle2_adv_inst_CLKOUT3_UNCONNECTED,
      CLKOUT4 => NLW_plle2_adv_inst_CLKOUT4_UNCONNECTED,
      CLKOUT5 => NLW_plle2_adv_inst_CLKOUT5_UNCONNECTED,
      DADDR(6 downto 0) => B"0000000",
      DCLK => '0',
      DEN => '0',
      DI(15 downto 0) => B"0000000000000000",
      DO(15 downto 0) => NLW_plle2_adv_inst_DO_UNCONNECTED(15 downto 0),
      DRDY => NLW_plle2_adv_inst_DRDY_UNCONNECTED,
      DWE => '0',
      LOCKED => NLW_plle2_adv_inst_LOCKED_UNCONNECTED,
      PWRDWN => '0',
      RST => '0'
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity PLL_25_250 is
  port (
    clk25 : out STD_LOGIC;
    clk250 : out STD_LOGIC;
    clk100in : in STD_LOGIC
  );
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of PLL_25_250 : entity is true;
end PLL_25_250;

architecture STRUCTURE of PLL_25_250 is
begin
inst: entity work.PLL_25_250_PLL_25_250_clk_wiz
     port map (
      clk100in => clk100in,
      clk25 => clk25,
      clk250 => clk250
    );
end STRUCTURE;
