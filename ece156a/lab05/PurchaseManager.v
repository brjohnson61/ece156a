module PurchaseManager(clk, reset, buy, product, credit, apple, banana, carrot, date, error);
input clk, reset;
input buy;
input [1:0] product;
input [7:0] credit;
output reg apple, banana, carrot, date, error;

initial begin
apple <= 0;
banana <= 0;
carrot <= 0;
date <= 0;
error <= 0;
end

always@(posedge clk) begin
if(buy)begin
case(product)
	2'b00 : begin
			banana = 0;
			carrot = 0;
			date = 0;
			error = (credit >= 75) ? 0 : 1;
			apple = (credit >= 75) ? 1 : 0;
		end
	2'b01 : begin
			banana <= (credit >= 20) ? 1 : 0;
			error <= (credit >= 20) ? 0 : 1;
			apple <= 0;
			carrot <= 0;
			date <= 0;
		end
	2'b10 : begin
			carrot <= (credit >= 30) ? 1 : 0;
			error <= (credit >=30) ? 0 : 1;
			apple <= 0;
			banana <= 0;
			date <= 0;
		end
	2'b11 : begin
			date = (credit >= 40) ? 1 : 0;
			error = (credit >= 40) ? 0 : 1;
			apple <= 0;
			banana <= 0;
			carrot <= 0;
		end
endcase
end else begin
	apple <= 0;
	banana <= 0;
	carrot <= 0;
	date <= 0;
	error <= 0;
end
end
endmodule
