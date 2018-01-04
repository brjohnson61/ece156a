module mealy(clk, signal, enable, reset);

output reg signal;
input clk, enable, reset;

reg [2:0] state, next_state;

always@(posedge clk)
begin
	state = reset ? 3'b000 : next_state;
end

always@(negedge clk)
begin
case(state)
	3'b000: begin
		next_state = enable ? 3'b000 : 3'b001;
		signal = 1'b0;
		end
	3'b001: begin
		next_state = enable ? 3'b000 : 3'b010;
		signal = 1'b0;
		end
	3'b010: begin
		next_state = enable ? 3'b011 : 3'b010;
		signal = 1'b0;
		end
	3'b011: begin
		next_state = enable ? 3'b100 : 3'b001;
		signal = 1'b0;
		end
	3'b100: begin
		next_state = enable ? 3'b000 : 3'b001;
		signal = enable ? 1'b0 : 1'b1;
		end
	default: begin
		next_state = 3'b000;
		signal = 1'b0;
		end
endcase
end
endmodule
