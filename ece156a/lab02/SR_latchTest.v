module SR_latchTest();
wire q, q_bar;
reg r, s;
SR_latch DUT(q, q_bar, r, s);
initial begin
r <= 1'b1;
s <= 1'b0;
#10
r <= 1'b0;
s <= 1'b1;
#10
r <= 1'b0;
s <= 1'b0;
#10
r <= 1'b1;
#10
r <= 1'b0;
s <= 1'b0;
end

endmodule
