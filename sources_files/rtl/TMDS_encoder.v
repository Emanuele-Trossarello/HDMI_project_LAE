`timescale 1ns / 100ps
module TMDS_encoder(
   input clk,
   input [7:0] VD,  // video data (red, green or blue)
   input [1:0] CD,  // control data
   input VDE,  // video data enable, to choose between CD (when VDE=0) and VD (when VDE=1)
   output reg [9:0] TMDS = 0
);

// number of 1 in input counter
wire [3:0] ones =VD[0]+VD[1]+VD[2]+VD[3]+VD[4]+VD[5]+VD[6]+VD[7];

// use XNOR if more than 4 1s or 4 1s and VD[0] == 0 otherwise XOR 
wire XNOR = (ones>4'd4) || (ones==4'd4 && VD[0]==1'b0);

// Use xnor or xor for encoding 9th bit represents operation used
wire [8:0] q_m = XNOR ? {1'b0,q_m[6:0] ~^ VD[7:1],VD[0]} : {1'b1,q_m[6:0] ^ VD[7:1],VD[0]};

// Count n 1s - n 0s   in q_m from -8 to +7 in 2complement 
wire [3:0] balance = q_m[0] + q_m[1] + q_m[2] + q_m[3] + q_m[4] + q_m[5] + q_m[6] + q_m[7] - 4'd4;

// disparity counts from -8 to +7 . Keeps track of previous disparities, its average overall should be 0
reg [3:0] disparity = 0;
wire balance_sign_eq = (balance[3] == disparity[3]);

// flag to check if inversion is needed for balance reasons
wire invert_q_m = (balance==0 || disparity==0) ? ~q_m[8] : balance_sign_eq;

// how much disparity increases or decreased in this cicle and new disparity value for next iteration
wire [3:0] balance_acc_inc = balance - ({q_m[8] ^ ~balance_sign_eq} & ~(balance==0 || disparity==0));
wire [3:0] balance_acc_new = invert_q_m ? disparity-balance_acc_inc : disparity+balance_acc_inc;

// Data creation and control codes
wire [9:0] TMDS_data = {invert_q_m, q_m[8], q_m[7:0] ^ {8{invert_q_m}}};
wire [9:0] TMDS_code = CD[1] ? (CD[0] ? 10'b1010101011 : 10'b0101010100) : (CD[0] ? 10'b0010101011 : 10'b1101010100);

// Counter for initial assignment troubleshooting
reg [3:0] Counter =4'b0;

always @(posedge clk) 
begin
   Counter <= Counter == 4'd9 ? 4'd0 : Counter + 4'd1;
   if(Counter == 4'd9) TMDS <= VDE ? TMDS_data : TMDS_code;
   if(Counter == 4'd9) disparity <= VDE ? balance_acc_new : 4'h0;
end



endmodule
