`timescale 1ns / 100ps
module tb_TMDS_encoder;

wire clk;
reg [7:0] VD = 8'b00000000;  
reg [1:0] CD = 2'b00;  
reg VDE = 1'b1;  
reg [9:0] TMDS;

ClockGen ClockGen_inst(.clk(clk));
TMDS_encoder TMDS_encoder_inst(.clk(clk),.VD(VD),.CD(CD),.VDE(VDE),.TMDS(TMDS));

// Set different configurations for output check
initial begin
#50 VDE = 1'b0;
#50 CD[1:0] = 2'b11;
#50 CD[1:0] = 2'b01;
#50 CD[1:0] = 2'b00;
#50 VDE = 1'b1;
#100 $stop;
end
	
endmodule


// 250 MHz clock as used in HDMI_driver
module ClockGen #(parameter real PERIOD = 4.0)(
   output reg clk
);

   initial begin
      clk = 1'b0;
      forever #(PERIOD/2.0) clk = ~clk;
   end
   
endmodule