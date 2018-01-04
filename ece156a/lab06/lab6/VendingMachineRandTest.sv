class rand_input;
	rand int diam;
	constraint c1{
		diam dist{ 0 := 2, 750 := 2, 835 := 2, 705 := 2, 955 := 2 };
	}

	rand int reset;
	constraint c2{
		reset dist{ 0 := 99, 1 := 1 };
	}
	
	rand int product;
	constraint c3{
		product dist{ 0 := 25, 1 := 25, 2 := 25, 3 := 25 };
	}

	rand int buy;
	constraint c4{
		buy dist{ 0 := 70, 1 := 30 };
	}
endclass


module VendingMachineRandTest();
reg serialIn, enable, buy, clk, reset;
reg [1:0] product;
wire [6:0] digit1, digit0;
reg [9:0] diam;
reg [3:0] i;

VendingMachineCG myVM(clk, reset, serialIn, enable, product, buy, digit1, digit0);

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
	APPERR: cross APPLE, ERROR{
		ignore_bins ig = binsof(APPLE) intersect {1} && binsof(ERROR)intersect {1};
	}
	BANERR: cross BANANA, ERROR{
		ignore_bins ig = binsof(BANANA) intersect {1} && binsof(ERROR)intersect {1};
	}
	CARERR: cross CARROT, ERROR{
		ignore_bins ig = binsof(CARROT) intersect {1} && binsof(ERROR)intersect {1};
	}
	DATERR: cross DATE, ERROR{
		ignore_bins ig = binsof(DATE) intersect {1} && binsof(ERROR)intersect {1};
	}

endgroup

always #5 clk <= ~clk;

initial begin
	rand_input ri;
	VendingCoverGroup cg;
	ri = new();
	cg = new();
	serialIn <= 0;
	enable <= 0;
	buy <= 0;
	clk <= 0;
	enable <= 1;
	product <= 0;
	reset <= 1;
	#20
	reset <= 0;
	#20
	forever begin
		assert(ri.randomize());
		reset <= ri.reset;
		product <= ri.product;
		diam <= ri.diam;
		buy <= 0;
		#10
		enable <= 1;
		for(i = 0; i< 10; i=i+1)begin
			serialIn = diam[(9 - i)];
			#10;
			
		end
		enable <= 0;
		#10
		buy <= ri.buy;
		#10;
	end

end

endmodule
