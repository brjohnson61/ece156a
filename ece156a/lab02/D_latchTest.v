module D_latchTest();
wire q, q_bar;
reg d;
reg gate;

D_latch DUT(q, q_bar, d, gate);

initial begin
gate <= 1'b0;
#1
d <= 1'b1;
#10
d<= 1'b0;
#5
gate <= 1'b1;
#1
d <= 1'b0;
#10
d <= 1'b1;
#10
d <= 1'b0;

end

endmodule
