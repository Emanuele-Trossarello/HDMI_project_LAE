-- Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2019.2 (win64) Build 2708876 Wed Nov  6 21:40:23 MST 2019
-- Date        : Mon Mar 24 10:50:11 2025
-- Host        : Emanuele-PC running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode synth_stub c:/Users/emanu/LAE_HDMI_project/cores/PLL_25_250/PLL_25_250_stub.vhdl
-- Design      : PLL_25_250
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xc7a35ticsg324-1L
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity PLL_25_250 is
  Port ( 
    clk25 : out STD_LOGIC;
    clk250 : out STD_LOGIC;
    clk100in : in STD_LOGIC
  );

end PLL_25_250;

architecture stub of PLL_25_250 is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "clk25,clk250,clk100in";
begin
end;
