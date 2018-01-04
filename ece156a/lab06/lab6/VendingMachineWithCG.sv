module VendingMachineCG(clk, reset, serialIn, enable, product, buy, digit1, digit0);
input serialIn, enable, clk, reset, buy;
input [1:0]product;
output [6:0] digit1, digit0;
//wire [6:0] out1, out0;
wire [7:0] credit;
wire apple, banana, carrot, date, error, penny, nickel, dime, quarter;

coinSensor uut0(clk, reset, serialIn, enable, penny, nickel, dime, quarter);
PiggyBank uut1(clk, reset, penny, nickel, dime, quarter, apple, banana, carrot, date, credit);
PurchaseManager uut2(clk, reset, buy, product, credit, apple, banana, carrot, date, error);
DisplayManager uut3(clk, reset, apple, banana, carrot, date, error, credit, digit1, digit0);

endmodule
