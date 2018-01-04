module dff_STest();
wire q, q_bar;
reg d;
reg clk;
reg reset;

always #10 clk <= ~clk;

dff_S DUT(q, q_bar, d, reset, clk);

initial begin
reset <= 1'b0;
clk <= 1'b0;
d <= 1'b0;
#5
d <= 1'b1;
#10
d <= 1'b1;
#10
reset <= 1'b1;
#10
reset <= 1'b0;
#1
d <= 1'b1;

end
endmodule
