module ALU (input logic [1:0] ctrl,
						input logic [15:0] input_a,
						input logic [15:0] input_b,
						output logic LT,
            output logic [15:0] alu_result);
//always_comb
always @ (ctrl or input_a or input_b)
    case (ctrl)
    00: alu_result = input_a + input_b;
    01: alu_result = input_a - input_b;
    10: alu_result = input_a & input_b;
    11: alu_result = input_a | input_b;
  endcase
	assign LT = (ctrl == 01 & alu_result[15]);
endmodule
