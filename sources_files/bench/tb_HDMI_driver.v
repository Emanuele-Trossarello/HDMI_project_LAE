`timescale 1ns/ 100ps

module tb_HDMI_driver;

wire [2:0] TMDS_pos ,  TMDS_neg;
wire TDMS_clk_pos, TDMS_clk_neg;
wire clk100;

ClockGen ClockGen_inst(.clk(clk100));
HDMI_driver HDMI_driver_inst(.clk_in(clk100),.TMDSp_clock(TDMS_clk_pos),.TMDSn_clock(TDMS_clk_neg),.TMDSp(TMDS_pos),.TMDSn(TMDS_neg));

endmodule

// crystal oscillator for Arty A7
module ClockGen #(parameter real PERIOD = 10.0)(
   output reg clk
);

   initial begin
      clk = 1'b0;
      forever #(PERIOD/2.0) clk = ~clk;
   end
   
endmodule