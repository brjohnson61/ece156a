module DisplayManager_TB;
reg [7:0] credit;
reg clk, reset, apple, banana, carrot, date, error;
wire [6:0] dig1, dig0;

DisplayManager uut(clk, reset, apple, banana, carrot, date, error, credit, dig1, dig0);

always #5 clk <= ~clk;

initial begin
apple <= 0;
banana <= 0;
carrot <= 0;
date <= 0;
error <= 0;
clk <= 1;
reset <= 0;
credit <= 0;
#35
credit = 100;

#15
#20
banana = 1;
#30
banana = 0;
reset <= 1;
#50
credit <= 60;
reset <= 1;



end
endmodule
