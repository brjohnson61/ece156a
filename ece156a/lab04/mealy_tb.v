module mealy_tb();

reg enable, reset, clk;
wire signal;

always #5 clk <= ~clk;

mealy uut(clk, signal, enable, reset);

initial begin
clk <= 0;
reset <=0;
@(posedge clk)
reset <= 1;
#10
reset <= 0;
enable <= 0;
#10
enable <= 0;
#10
enable <= 0;
#30
enable <= 1;
#10
enable <= 1;
#10
enable <= 0;
#10
reset <= 0;
#10;
end

endmodule
