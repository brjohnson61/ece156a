module Upcounter_10_Miter();

wire[3:0] count, synthcount;
reg clk, reset;

always #5 clk <= ~clk;

Upcounter_10 DUTUP10(clk, reset, count);
Upcounter_10orig DUTUP(clk, reset, synthcount);

assign miter = |({count ^ synthcount});

initial begin

clk <= 1'b1;

#33
reset = 1'b1;
#1
reset = 1'b0;

end


endmodule
