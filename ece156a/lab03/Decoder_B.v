module Decoder_B(display, a, b, c, d);

input a, b, c, d;

output reg [6:0] display;

always@(a or b or c or d) begin

case({a,b,c,d})//a logic
	4'b0001 : display[0] = 1;
	4'b0100 : display[0] = 1;
	4'b1101 : display[0] = 1;
	4'b1011 : display[0] = 1;
	default : display[0] = 0;
endcase

casez({a,b,c,d})//b logic
	4'b?110, 4'b1?11, 4'b11?0, 4'b0101 : display[1] = 1;
	default : display[1] = 0;
endcase
casez({a,b,c,d})// c logic
	4'b1100, 4'b1110, 4'b1110, 4'b1111, 4'b0010 : display[2] = 1;
	default : display[2] = 0;
endcase
casez({a,b,c,d})// d logic
	4'b?111, 4'b0001, 4'b0100, 4'b1010 : display[3] = 1;
	default : display[3] = 0;
endcase
casez({a,b,c,d}) //e logic
	4'b0??1, 4'b?001, 4'b010? : display[4] =1;
	default : display[4] = 0;
endcase
casez({a,b,c,d}) //f logic
	4'b00?1, 4'b001?, 4'b0?11, 4'b1101 : display[5] = 1;
	default : display[5] = 0;
endcase
casez({a,b,c,d})// g logic
	4'b000?, 4'b0111, 4'b1100 : display[6] = 1;
	default : display[6] = 0;
endcase

end

endmodule
