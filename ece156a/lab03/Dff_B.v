module Dff_B(q, q_bar, d, reset, clk);

output q, q_bar;
reg q;

input reset, d, clk;

assign q_bar = ~q;

always@(posedge clk)
begin
if(reset)begin
	q = 0;
end
else begin
	q = d;
end
end
endmodule
