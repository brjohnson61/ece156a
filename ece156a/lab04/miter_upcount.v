module miter_upcount();

reg clk, reset, enable;
wire[3:0]count_B;
wire [3:0]count_S;
wire miter;

counter_S uut1(clk, reset, enable, count_S);
Upcounter_B uut2(clk, reset, enable, count_B);

assign miter = |({count_S ^ count_B});

always #10 clk <= ~clk;

initial begin

clk <= 1'b0;
reset <= 1'b0;
enable <=1'b1;

#25

#1
reset <= 1'b1;

#5
reset <= 1'b0;
#5

enable <= 1'b1;
#1
reset <= 1'b1;
#5
reset <= 1'b0;

#380
reset<=1'b1;


end

endmodule
