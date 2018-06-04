module control_matrix (input logic [3:0] opcode,
                      input logic state,
                      output logic [1:0] alu_control,
                      output logic write_register,
                      output logic read_register,
                      output logic write_reg_from_memory);

always_comb begin
  case(opcode)
  0000: /*no operation / display */
  0001: /* GOT absolute jump*/
  0010: write_register = 1, write_reg_from_memory = 1;/* GOT load bitstring from memory to register*/
  0011: read_register = 1;/*GOT store register val in memory*/
  0100: alu_control = 00;/* GOT copy register to register */
  0101: alu_control = 01;/* GOT branch if less than*/
  1000: alu_control = 00;/* GOT add registers together*/
  1001: alu_control = 01;/* GOT subtract registers from each other*/
  endcase
end
endmodule
