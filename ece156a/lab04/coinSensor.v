module coinSensor(clk, reset, serialIn, write, penny, nickel, dime, quarter);

input clk, reset, serialIn, write;
output reg penny, nickel, dime, quarter;
reg [9:0]diam;

initial begin
diam = 0;
end 

always@(posedge clk)
begin
	quarter <= 0;
	dime <=0;
	nickel <=0;
	penny <=0;
	if(reset)begin
		diam = 0;
	end else if(write)begin
		diam = diam << 1;
		diam[0] = serialIn;
	end
end
always@(negedge write)begin 
	if(diam <= 960 && diam >= 950) begin
			quarter = 1'b1;
	end else if(diam >= 700 && diam <= 710)begin
			dime = 1'b1;
	end else if(diam >= 830 && diam <= 840)begin
			nickel = 1'b1;
	end else if(diam >= 745 && diam <= 755) begin
			penny = 1'b1;
	end
end
endmodule
