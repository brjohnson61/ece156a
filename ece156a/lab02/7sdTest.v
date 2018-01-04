module decoderTest();
reg [3:0] control;
wire [6:0] display;
wire a, b, c, d, e, f, g;
reg [3:0] i;

assign a = display[0];
assign b = display[1];
assign c = display[2];
assign d = display[3];
assign e = display[4];
assign f = display[5];
assign g = display[6];

sevenseg DUT(display, control[3], control[2], control[1], control[0]);


initial

for(i=0; i<16; i = i+1)begin
control = i;
#10;
end

endmodule
