module PiggyBank_TB;
reg clk, reset, penny, nickel, dime, quarter, apple, banana, carrot, date;
wire [7:0]credit;

PiggyBank uut(clk, reset, penny, nickel, dime, quarter, apple, banana, carrot, date, credit);

always #5 clk <= ~clk;


initial begin
penny <= 0;
nickel <= 0;
dime <= 0;
quarter <= 0;
apple <= 0;
banana <= 0;
carrot <= 0;
date <= 0;
clk <= 1;
reset <=1;
#10
reset =0;
penny =1;
#5
penny<=0;
#5
dime <=1;
#5
dime <=0;
#5
nickel <=1;
#5
nickel <=0;
#5
quarter <= 1;
#50
quarter <= 0;
#10
apple <= 1;
#5
apple <= 0;
#5
banana <= 1;
#5
banana <= 0;
#5
carrot <= 1;
#5
carrot <= 0;
#5
date <= 1;
#5
date <= 0;





end

endmodule
