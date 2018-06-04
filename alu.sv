module ALU (input logic [1:0] ctrl_signal,
						input logic [15:0] input_a,
						input logic [15:0] input_b,
						output logic LT,
            output logic [15:0] alu_result);
always_comb
    case (ctrl_signal)
    00: alu_result = input_a + input_b;
    01: alu_result = input_a - input_b;
    10: alu_result = input_a & input_b;
    11: alu_result = input_a | input_b;
  endcase
endmodule
