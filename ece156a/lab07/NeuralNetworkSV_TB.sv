module NeuralNetworkSV_TB();

reg [4:0] xval;
wire [4:0] yval;
int i;

NeuralNetworkSV nn(xval, yval);

initial begin
	for(i = 0; i<25; i++)begin
		xval<= i;
		#5;
	end
end
endmodule
