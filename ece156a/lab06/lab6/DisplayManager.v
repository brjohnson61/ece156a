module DisplayManager(clk, reset, apple, banana, carrot, date, error, credit, digit1, digit0);
input clk, reset;
input apple, banana, carrot, date, error;
input [7:0] credit;
output reg [6:0] digit1, digit0;
reg [2:0]downcount;
reg [7:0]specialreg;
wire [6:0] out1, out0;

Decoder_B dig1(out1, specialreg[7], specialreg[6], specialreg[5], specialreg[4]);
Decoder_B dig0(out0, specialreg[3], specialreg[2], specialreg[1], specialreg[0]);

initial begin
downcount = 0;
end

always@*begin
	digit1 = out1;
	digit0 = out0;
end

always@(posedge clk)begin
if(downcount > 0)begin
	downcount = downcount - 1;
end
end

always@* begin
	if(reset)begin
		specialreg = credit;
		downcount = 0;
	end
	else if(downcount == 0)begin 
			if(apple)begin
				specialreg = 8'b10101010;
				downcount = 7;
			end else if(banana)begin
				specialreg = 8'b10111011;
				downcount = 7;
			end else if(carrot)begin
				specialreg = 8'b11001100;
				downcount = 7;
			end else if(date)begin
				specialreg = 8'b11011101;
				downcount = 7;
			end else if(error)begin
				specialreg = 8'b11101110;
				downcount = 7;
			end else begin
				specialreg = credit;
			end
	end
end
endmodule

