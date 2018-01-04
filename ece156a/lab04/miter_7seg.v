module miter_7seg();

wire [6:0]display_B;
wire [6:0]display_S;
reg [3:0]miterin;
reg [4:0]i;
wire aS, bS, cS, dS, eS, fS, gS, aB, bB, cB, dB, eB, fB, gB;

assign aS = display_S[0];
assign bS = display_S[1];
assign cS = display_S[2];
assign dS = display_S[3];
assign eS = display_S[4];
assign fS = display_S[5];
assign gS = display_S[6];

assign aB = display_B[0];
assign bB = display_B[1];
assign cB = display_B[2];
assign dB = display_B[3];
assign eB = display_B[4];
assign fB = display_B[5];
assign gB = display_B[6];

Decoder_B uut1(display_B, miterin[3], miterin[2], miterin[1], miterin[0]);
sevenseg uut2(display_S, miterin[3], miterin[2], miterin[1], miterin[0]);

wire miter;

assign miter = |{display_B ^ display_S};

initial begin

for(i=0; i<16; i = i+1)begin
miterin = i;
#10;
end

end

endmodule

