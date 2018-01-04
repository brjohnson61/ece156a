module UcTest();
reg clk;
reg reset;
reg enable;
wire [3:0] number;

always #10 clk <= ~clk;


counter_S DUT(clk, reset, enable, number);

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
