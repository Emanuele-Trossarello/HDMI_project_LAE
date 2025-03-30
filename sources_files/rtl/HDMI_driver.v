// Top module for HDMI implementation
`timescale 1ns / 100ps
module HDMI_driver(
   input wire clk_in,
   output wire [2:0] TMDSp , TMDSn ,
   output wire TMDSp_clock, TMDSn_clock
);

wire clk_base,pixclk_prebuf;	// 25 MHz
wire clk_TMDS,TMDS_prebuf;  //  250MHz

// 480 PLL clock instantiation
PLL_25_250 PLL_inst(
	.clk100in(clk_in),
	.clk25(pixclk_prebuf),
	.clk250(TMDS_prebuf)
);
	
BUFG BUFG_TMDSp(.I(TMDS_prebuf), .O(clk_TMDS));
BUFG BUFG_pixclk(.I(pixclk_prebuf), .O(clk_base));


reg [10:0] SX =0 , SY = 0;
reg hSync,vSync, ScreenArea;

//1920x1080 same as below
/*
always @(posedge clk_base) 
begin
   SX <= (SX==2199) ? 0 : SX+1;
   if(SX==2199) SY <= (SY==1124) ? 0 : SY+1;

   ScreenArea <= (SX<1920) && (SY<1080); 
   hSync <= (SX>=2008) && (SX<2052);
   vSync <= (SY>=1084) && (SY<1089);
end
*/

//1280x720 too fast for buffer -> timing violations
/*

/*
always @(posedge clk_base)
begin
   SX <= (SX==1649) ? 0 : SX+1;
   if(SX==1649) SY <= (SY==749) ? 0 : SY+1;

   ScreenArea <= (SX<1280) && (SY<720);
   hSync <= (SX>=1390) && (SX<1430);
   vSync <= (SY>=725) && (SY<730);
end
*/

//640x480

always @(posedge clk_base) 
begin
	ScreenArea <= (SX<640) && (SY<480);
	SX <= (SX==799) ? 0 : SX+1;
	if(SX==799) SY <= (SY==524) ? 0 : SY+1;
	
	hSync <= (SX>=656) && (SX<752);
	vSync <= (SY>=490) && (SY<492);
end


// Color configurations for tests

// RGB Flag

/*
reg [7:0] red = (SX>=0) && (SX<210)? 8'b00000000:8'b11111111;
reg [7:0] green = (SX>=210) && (SX<430)? 8'b00000000:8'b11111111;
reg [7:0] blue = (SX>=430) && (SX<640)? 8'b00000000:8'b11111111;
*/

// Black

reg [7:0] red = 8'b00000000;
reg [7:0] green = 8'b00000000;
reg [7:0] blue = 8'b00000000;


//FPGA4fun color scheme
/*
wire [7:0] W = {8{SX[7:0]==SY[7:0]}};
wire [7:0] A = {8{SX[7:5]==3'h2 && SY[7:5]==3'h2}};
reg [7:0] red, green, blue;
always @(posedge clk_base) 
begin 
	red <= ({SX[5:0] & {6{SY[4:3]==~SX[4:3]}}, 2'b00} | W) & ~A;
	green <= (SX[7:0] & {8{SY[6]}} | W) & ~A;
	blue <= SY[7:0] | W | A;
end
*/

// TMDS encoding, 8b10b
wire [9:0] TMDS_red, TMDS_green, TMDS_blue;
TMDS_encoder encoder_R(.clk(clk_base), .VD(red  ), .TMDS(TMDS_red)  , .CD(2'b00)        , .VDE(ScreenArea));
TMDS_encoder encoder_G(.clk(clk_base), .VD(green), .TMDS(TMDS_green), .CD(2'b00)        , .VDE(ScreenArea));
TMDS_encoder encoder_B(.clk(clk_base), .VD(blue ), .TMDS(TMDS_blue) , .CD({vSync,hSync}), .VDE(ScreenArea));

// TMDS_colors to serial output via shift registers
reg [3:0] TMDS_mod10=0;  // modulus 10 counter
reg [9:0] TMDS_shift_red=0, TMDS_shift_green=0, TMDS_shift_blue=0;
reg TMDS_shift_load=0;

always @(posedge clk_TMDS)
begin
   TMDS_shift_load <= (TMDS_mod10==4'd9);
   TMDS_shift_red   <= TMDS_shift_load ? TMDS_red   : TMDS_shift_red  [9:1];
   TMDS_shift_green <= TMDS_shift_load ? TMDS_green : TMDS_shift_green[9:1];
   TMDS_shift_blue  <= TMDS_shift_load ? TMDS_blue  : TMDS_shift_blue [9:1];	
   TMDS_mod10 <= (TMDS_mod10==4'd9) ? 4'd0 : TMDS_mod10+4'd1;
end


OBUFDS OBUFDS_red  (.I(TMDS_shift_red  [0]), .O(TMDSp[2]), .OB(TMDSn[2]));
OBUFDS OBUFDS_green(.I(TMDS_shift_green[0]), .O(TMDSp[1]), .OB(TMDSn[1]));
OBUFDS OBUFDS_blue (.I(TMDS_shift_blue [0]), .O(TMDSp[0]), .OB(TMDSn[0]));
OBUFDS OBUFDS_clock(.I(clk_base), .O(TMDSp_clock), .OB(TMDSn_clock));

endmodule