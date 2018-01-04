module NeuralNetworkSV(input wire [4:0] X,  output wire [4:0] Y);



wire [4:0] L1syn;
reg [31:0] L1thresh[7];
reg [31:0] L1weights[5];
wire[6:0] L1ax;

reg [31:0] L2thresh[7];
reg [31:0] L2weights[7][2];
wire [6:0] L2ax;

reg [31:0] L3weights[5][7];
reg [31:0] L3thresh[5];
wire [7:0] L3syn;

assign L1syn = X;

//Level 1
NeuronSV #(5) L1_0(L1ax[0], L1syn, L1weights, L1thresh[0]);
NeuronSV #(5) L1_50(L1ax[1], L1syn, L1weights, L1thresh[1]);
NeuronSV #(5) L1_80(L1ax[2], L1syn, L1weights, L1thresh[2]);
NeuronSV #(5) L1_120(L1ax[3], L1syn, L1weights, L1thresh[3]);
NeuronSV #(5) L1_150(L1ax[4], L1syn, L1weights, L1thresh[4]);
NeuronSV #(5) L1_200(L1ax[5], L1syn, L1weights, L1thresh[5]);
NeuronSV #(5) L1_240(L1ax[6], L1syn, L1weights, L1thresh[6]);

//Level 2
NeuronSV #(2) L2_0(L2ax[0], L1ax[1:0], L2weights[0], L2thresh[0]);
NeuronSV #(2) L2_50(L2ax[1], L1ax[2:1], L2weights[1], L2thresh[1]);
NeuronSV #(2) L2_80(L2ax[2], L1ax[3:2], L2weights[2], L2thresh[2]);
NeuronSV #(2) L2_120(L2ax[3], L1ax[4:3], L2weights[3], L2thresh[3]);
NeuronSV #(2) L2_150(L2ax[4], L1ax[5:4], L2weights[4], L2thresh[4]);
NeuronSV #(2) L2_200(L2ax[5], L1ax[6:5], L2weights[5], L2thresh[5]);
NeuronSV #(2) L2_240(L2ax[6], L1ax[6:5], L2weights[6], L2thresh[6]);

//Level 3
NeuronSV #(7) L3b0(Y[0], L2ax, L3weights[0], L3thresh[0]);
NeuronSV #(7) L3b1(Y[1], L2ax, L3weights[1], L3thresh[1]);
NeuronSV #(7) L3b2(Y[2], L2ax, L3weights[2], L3thresh[2]);
NeuronSV #(7) L3b3(Y[3], L2ax, L3weights[3], L3thresh[3]);
NeuronSV #(7) L3b4(Y[4], L2ax, L3weights[4], L3thresh[4]);

initial begin
//Level 1 weights
L1weights[0] <= 31'd1;
L1weights[1] <= 31'd2;
L1weights[2] <= 31'd4;
L1weights[3] <= 31'd8;
L1weights[4] <= 31'd16;

//Level 1 thresholds
L1thresh[0] <= 32'd0;
L1thresh[1] <= 32'd5;
L1thresh[2] <= 32'd8;
L1thresh[3] <= 32'd12;
L1thresh[4] <= 32'd15;
L1thresh[5] <= 32'd20;
L1thresh[6] <= 32'd24;

//Level 2 weights
L2weights[0][0] <= 2;
L2weights[0][1] <= -2;
L2weights[1][0] <= 2;
L2weights[1][1] <= -2;
L2weights[2][0] <= 2;
L2weights[2][1] <= -2;
L2weights[3][0] <= 2;
L2weights[3][1] <= -2;
L2weights[4][0] <= 2;
L2weights[4][1] <= -2;
L2weights[5][0] <= 2;
L2weights[5][1] <= -2;
L2weights[6][0] <= 0;
L2weights[6][1] <= 2;


//Level 2 thresholds
L2thresh = {1, 1, 1, 1, 1, 1, 1};

//Level 3 weights

//Y[0]
L3weights[0][0]<= 0;
L3weights[0][1]<= 0;
L3weights[0][2]<= 0;
L3weights[0][3]<= 0;
L3weights[0][4]<= 1;
L3weights[0][5]<= 0;
L3weights[0][6]<= 1;

//Y[1]
L3weights[1][0]<= 1;
L3weights[1][1]<= 0;
L3weights[1][2]<= 0;
L3weights[1][3]<= 0;
L3weights[1][4]<= 0;
L3weights[1][5]<= 1;
L3weights[1][6]<= 1;

//Y[2]
L3weights[2][0]<= 0;
L3weights[2][1]<= 1;
L3weights[2][2]<= 0;
L3weights[2][3]<= 1;
L3weights[2][4]<= 0;
L3weights[2][5]<= 0;
L3weights[2][6]<= 1;

//Y[3]
L3weights[3][0]<= 1;
L3weights[3][1]<= 0;
L3weights[3][2]<= 1;
L3weights[3][3]<= 0;
L3weights[3][4]<= 0;
L3weights[3][5]<= 0;
L3weights[3][6]<= 1;

//Y[4]
L3weights[4][0]<= 0;
L3weights[4][1]<= 1;
L3weights[4][2]<= 1;
L3weights[4][3]<= 1;
L3weights[4][4]<= 1;
L3weights[4][5]<= 1;
L3weights[4][6]<= 0;




//Level 3 thresholds
L3thresh <= {1,1,1,1,1};

end
endmodule
