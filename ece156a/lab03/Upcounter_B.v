module Upcounter_B(clk, reset, enable, count);

input clk, reset, enable;
output reg [3:0] count;

always@(posedge clk)begin
if(enable)begin
	if(reset)begin
		count <= 4'b0000;//reset
	end
	else begin
		if(count == 4'b1111)begin
			count <= 4'b0000;  //wrap around
		end else begin
		count <= count + 4'b0001; //incrementation
		end
	end
end
end
endmodule
