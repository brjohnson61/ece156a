module moore(clk, signal, enable, reset);

output reg signal;
input clk, enable, reset;
reg [2:0] state;
reg [2:0] next_state;

always@(posedge clk)
begin
	state = reset ? 3'b000 : next_state;
end

always@(state or enable)
begin
	case(state)
		3'b000: begin 
				next_state = enable ? 3'b001 : 3'b000;
				signal = 1'b0;
			end
		3'b001: begin
				next_state = enable ? 3'b010 : 3'b000;
				signal = 1'b0;
			end
                3'b010: begin
                                next_state = enable ? 3'b010 : 3'b011;
                                signal = 1'b0;
			end
                3'b011: begin
                                next_state = enable ? 3'b001 : 3'b100;
                                signal = 1'b0;
			end
                3'b100: begin
                                next_state = enable ? 3'b001 : 3'b101;
                                signal = 1'b0;
			end
                3'b101: begin
                                next_state = enable ? 3'b001 : 3'b000;
                                signal = 1'b1;
			end
		default: begin
			next_state = 3'b000;
			signal = 1'b0;
			end
	endcase
end

endmodule
