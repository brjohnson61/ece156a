module NeuronSV #(parameter N)(output reg axon, input wire [N-1:0]synapses, input wire [31:0]weights[N], input wire [31:0] threshold);
int i, sum;

always@(*)begin
sum = 0;
for(i = 0; i<N; i = i+1)begin
	sum = sum + weights[i]*synapses[i];
end
axon = (sum >= threshold) ? 1 : 0;

end
endmodule
