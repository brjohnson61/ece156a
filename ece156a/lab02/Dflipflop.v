module SR_latch(Q,Qnot,S,R);

output Q;
output Qnot;

input R;
input S;

nor #1 A(Qnot, S, Q);
nor #1 B(Q, R, Qnot);

endmodule

module D_latch(Q, Qnot, D, G);

input D;
input G;

output Q;
output Qnot;

wire s;
wire r;
wire Dnot;

not(Dnot, D);
and(s, D, G);
and(r, Dnot, G);

SR_latch myLatch(Q, Qnot, s, r);

endmodule


module dff_S(Q, Qnot, D, Reset, clk);

input D;
input clk;
input Reset;

output Q;
output Qnot;

wire Qmid;
wire Qnotmid;

wire Rnot;
wire DnRnot;
wire clknot;

not(clknot, clk);
not(Rnot, Reset);
and(DnRnot, Rnot, D);

D_latch master(Qmid, Qnotmid, DnRnot, clknot);

D_latch slave(Q, Qnot, Qmid, clk);

endmodule

