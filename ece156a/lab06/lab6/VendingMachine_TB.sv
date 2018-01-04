module VendingMachine_TBSV;
reg [9:0]quartertest, pennytest, nickeltest, dimetest, test;
reg serialIn, enable, buy, clk, reset;
reg [1:0] product;
wire [6:0] digit1, digit0;
reg [3:0] i, j, k;

VendingMachine myVM(clk, reset, serialIn, enable, product, buy, digit1, digit0);

covergroup VendingCoverGroup @ (clk);
//Check to see if all types of coins were inserted;
	PENNY: coverpoint myVM.penny;
	NICKEL: coverpoint myVM.nickel;
	DIME: coverpoint myVM.dime;
	QUARTER: coverpoint myVM.quarter;
//Credit Values
	BANK: coverpoint myVM.credit {
				bins v1 = {0, 4};
				bins v2 = {5, 9};
				bins v3 = {10, 24};
				bins v4 = {25, 39};
				bins v5	= {40, 59};
				bins v6 = {60, 74};
				bins v7 = {75, 255};
				}
//An error occured on a purchase attempt and also no error occurred on a purchase attempt.
	ERROR: coverpoint myVM.error;
	BUY: coverpoint buy;
	BUYANDERROR: cross BUY, ERROR{
				ignore_bins buy_low = binsof(BUY) intersect {0};
				bins PURCHASEwithERROR = binsof(BUY) intersect {1}&& binsof(ERROR) intersect {1};
				bins PURCHASEwithoutERROR = binsof(BUY) intersect {1} && binsof(ERROR) intersect {0};
				}
//At least one attempt was made to purchase each type of fruit.
	APPLE: coverpoint myVM.apple;
	BANANA: coverpoint myVM.banana;
	CARROT: coverpoint myVM.carrot;
	DATE: coverpoint myVM.date;
	PRODUCT: coverpoint product{
				bins ap = {0};
				bins ba = {1};
				bins ca = {2};
				bins da = {3};
				}
	ONEATTEMPT: cross PRODUCT, BUY{
				ignore_bins buy_low = binsof(BUY) intersect {0};
				bins apple_bin = binsof(PRODUCT.ap) && binsof(BUY) intersect {1};
				bins banana_bin = binsof(PRODUCT.ba) && binsof(BUY) intersect {1};
				bins carrot_bin = binsof(PRODUCT.ca) && binsof(BUY) intersect {1};
				bins date_bin = binsof(PRODUCT.da) && binsof(BUY) intersect {1};
				}
//Cross of the previous two coverpoints.
	CRS_ONEATTEMPT_AND_BUYANDERROR: cross ONEATTEMPT, BUYANDERROR;

endgroup

function [9:0] randnum;
	input [9:0]min;
	input [9:0]max;
	begin
	randnum = min + {$random} % (max - min);
	end
endfunction




initial begin
VendingCoverGroup c;
c = new();
clk <= 1;
buy <= 0;
enable <= 0;
serialIn<=0;
product = 0;
quartertest <= randnum(950, 959);
pennytest <= randnum(745, 754);
nickeltest <= randnum(830, 839);
dimetest <= randnum(700, 709);
#10 
test = quartertest;// <--------------Switch here to change which coin gets inputted into the machine. <coin>test.
product = 0;// <-------switch value here to test the different products. apple= 0, banana= 1, carrot = 2, date = 3.
end

always #5 clk <= ~clk;

always@(product)begin
reset <= 1;
#15
reset <= 0;
#25

//loading vending machine with coins.
//overloading more coins than machine can hold to test overflow.


for(j = 0; j < 10; j = j+1)begin//  <-----------------the parameter specifying the length of the outer for loop is the number of coins inserted in the machine. Change as necessary.
enable <= 1;
for(i = 0; i< 10; i = i+1)begin
serialIn <= test[9-i];
#10;
end

enable =0;
end
//now we buy the product
#10
buy = 1;
#5//buys a lot of the product to test for purchase completion and possibly the error functionality depending on the product.
buy = 0;
#75
buy <= 1;
#5
buy <= 0;
#75
buy <= 1;
#5
buy <= 0;
#75
buy <= 1;
#5
buy <= 0;
#75
buy <= 1;
#5
buy <= 0;
#75
buy <= 1;
#5
buy <= 0;
#75;


end
















endmodule
