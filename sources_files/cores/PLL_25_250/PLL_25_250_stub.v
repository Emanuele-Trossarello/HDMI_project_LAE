// Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2019.2 (win64) Build 2708876 Wed Nov  6 21:40:23 MST 2019
// Date        : Mon Mar 24 10:50:11 2025
// Host        : Emanuele-PC running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub c:/Users/emanu/LAE_HDMI_project/cores/PLL_25_250/PLL_25_250_stub.v
// Design      : PLL_25_250
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7a35ticsg324-1L
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
module PLL_25_250(clk25, clk250, clk100in)
/* synthesis syn_black_box black_box_pad_pin="clk25,clk250,clk100in" */;
  output clk25;
  output clk250;
  input clk100in;
endmodule
