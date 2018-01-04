module DffTest_B();
wire q, q_bar;
reg d;
reg clk;
reg reset;

always #10 clk <= ~clk;

Dff_B DUT(q, q_bar, d, reset, clk);

initial begin
reset <= 1'b0;
clk <= 1'b0;
d <= 1'b0;
#10
d <= 1'b1;
#10
reset <= 1'b1;
#20
reset <= 1'b0;
#10
d <= 1'b1;
#10
d<= 1'b0;
#20
d<= 1'b1;

end
endmodule
