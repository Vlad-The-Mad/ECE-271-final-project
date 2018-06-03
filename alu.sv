module ALU (input logic ctrl_signal,
            output logic [15:0] alu_result);
always_comb
    case (ctrl_signal)
    00: alu_result = input_a + input_b;
    01: alu_result = input_a - input_b;
    10: alu_result = input_a & input_b;
    11: alu_result = input_a | input_b;
  endcase
endmodule
