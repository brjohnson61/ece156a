module moore_tb();

reg enable, reset, clk;
wire signal;

always #5 clk <= ~clk;

moore uut(clk, signal, enable, reset);

initial begin
clk <= 1'b0;
@(posedge clk)
#5
reset <= 1'b1;
#10
reset <= 1'b0;
enable <= 1'b1;
#10
enable <= 1'b1;
#10
enable <= 1'b0;
#10
enable <= 1'b0;
#10
enable <= 1'b0;
#10
reset <= 1'b0;
#10;
end

endmodule

