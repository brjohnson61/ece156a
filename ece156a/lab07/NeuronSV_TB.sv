module NeuronSV_TB();
wire axon;
reg [3:0] synapses;
reg [31:0] threshold;
reg [31:0] weights[4];


NeuronSV #(4) dut(axon, synapses, weights, threshold);

initial begin

threshold <= 0;
synapses <= 4'b1111;
weights[0] <= 32'd1;
weights[1] <= 32'd1;
weights[2] <= 32'd1;
weights[3] <= 32'd1;


#20

threshold <= 20;



end

endmodule
