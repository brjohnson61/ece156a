module counter_S(clk, reset, enable, count);

input clk, reset, enable;
output [3:0] count;
wire [3:0] in;

wire [3:0] notcount;
wire master_reset;
wire wrap_around;

wire T1;
wire T2;
wire T3;

and(T1, enable, count[0]);
and(T2, enable, count[1], count[0]);
and(T3, enable, count[2], count[1], count[0]);

xor(in[0], enable, count[0]);
xor(in[1], T1, count[1]);
xor(in[2], T2, count[2]);
xor(in[3], T3, count[3]);

//and wrap(wrap_around, count[3], count[2], count[1], count[0]);
//or resetuc(master_reset, reset, wrap_around);

dff_S d0(count[0], notcount[0], in[0], reset, clk);
dff_S d1(count[1], notcount[1], in[1], reset, clk);
dff_S d2(count[2], notcount[2], in[2], reset, clk);
dff_S d3(count[3], notcount[3], in[3], reset, clk);

endmodule

