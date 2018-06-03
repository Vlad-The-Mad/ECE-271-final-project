module control_matrix (input logic [3:0] opcode,
                      input logic state,
                      output logic [1:0] alu_control,
                      output logic write_register,
                      output logic read_register,
                      output logic write_reg_from_memory);

always_comb begin
  case(opcode)
  0000: /*no operation*/
  0001: /*absolute jump*/
  0010: write_register = 1, write_reg_from_memory = 1;/*load bitstring from memory to register*/
  0011: read_register = 1;/*store bitstring in memory*/
  0100: alu_control = 01;/*less than (comparator)*/
  0101: alu_control = 01;/*equal to*/
  1000: alu_control = 00;/*add registers together*/
  1001: alu_control = 01;/*subtract registers from each other*/
  endcase
end
endmodule
