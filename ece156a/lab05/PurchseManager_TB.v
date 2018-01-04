module PurchaseManager_TB;
reg clk, buy, reset; 
reg [1:0]product;
reg [7:0]credit;
wire apple, banana, carrot, date, error;

always#5 clk <= ~clk;

PurchaseManager uut(clk, reset, buy, product, credit, apple, banana, carrot, date, error);

initial begin
clk <= 1;
buy <= 0;
reset <= 0;
product <= 2'b00;
credit <= 0;
#20
buy <= 1;
#20
credit <= 100;
#20
buy <= 0;
#20
product <= 2'b01;
credit <= 0;
#20
buy <= 1;
#20
credit <= 100;
#20
buy <= 0;
#20
product <= 2'b10;
credit <= 0;
#20
buy <= 1;
#20
credit <= 100;
#20
buy <= 0;
#20
product <= 2'b11;
credit <= 0;
#20
buy <= 1;
#20
credit <= 100;
#20
buy <= 0;
#20;

end
endmodule
