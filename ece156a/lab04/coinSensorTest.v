module coinSensor_tb();

reg cl, res, serIn, write;
wire p, n, d, q;
reg[4:0]i;
reg[9:0]number;

function [9:0] rand;
	input [9:0]min;
	input [9:0]max;
	begin
	rand = min + {$random} % (max - min);
	end
endfunction

always #5 cl <= ~cl;

coinSensor uut(cl, res, serIn, write, p, n, d, q);

initial begin
cl <= 0;
res <= 0;
write <=1;
serIn <=0;

//quarter test.
write <= 1;
number <= rand(950, 960);
for(i = 0; i<10; i = i + 1) begin
	@(negedge cl); 
	serIn = number[9-i];
end
#10
write <= 0;
#10

//dime test.
write <= 1;
number <= rand(700, 710);
for(i = 0; i<10; i = i + 1) begin
	@(negedge cl); 
	serIn = number[9-i];
end
#10
write <= 0;
#10

//nickel test.
write <= 1;
number <= rand(830, 840);
for(i = 0; i<10; i = i + 1) begin
	@(negedge cl); 
	serIn = number[9-i];
end
#10
write <= 0;
#10

//penny test.
write <= 1;
number <= rand(745, 755);
for(i = 0; i<10; i = i + 1) begin
	@(negedge cl); 
	serIn = number[9-i];
end
#10
write <= 0;
end

endmodule
