module VendingMachine_TB;
reg [9:0]quartertest, pennytest, nickeltest, dimetest, test;
reg serialIn, enable, buy, clk, reset;
reg [1:0] product;
wire [6:0] digit1, digit0;
reg [3:0] i, j, k;

VendingMachine UUTVM(clk, reset, serialIn, enable, product, buy, digit1, digit0);

function [9:0] rand;
	input [9:0]min;
	input [9:0]max;
	begin
	rand = min + {$random} % (max - min);
	end
endfunction

initial begin
clk <= 1;
buy <= 0;
enable <= 0;
serialIn<=0;
product = 0;
quartertest <= rand(950, 959);
pennytest <= rand(745, 754);
nickeltest <= rand(830, 839);
dimetest <= rand(700, 709);
#10 
test = pennytest;// <--------------Switch here to change which coin gets inputted into the machine. <coin>test.
product = 1;// <-------switch value here to test the different products. apple= 0, banana= 1, carrot = 2, date = 3.
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
