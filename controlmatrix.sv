module control_matrix (input logic [3:0] opcode,
                      input logic state,
                      input logic LT_flag,
                      output logic LT_state,
                      output logic [1:0] alu_control,
                      output logic write_reg_from_memory
                      /*register enables and resets*/
                      output logic PC_EN,
                      output logic PC_reset
                      output logic reset_reg_file,
                      output logic read_1EN,
                      output logic read_2EN,
                      output logic reg_file_wrEN,
                      output logic EN_mem_add,
                      output logic mem_add_reset,
                      /*mux selects*/
                      output logic branch_len,
                      output logic incr_branch,
                      output logic PC_or_read_mem,
                      output logic PC_in_op,
                      output logic lineb_ex,
                      output logic alu_linea,
                      );

always_comb begin
  case(opcode)
  0000: /*no operation / display */
  0001: /* GOT absolute jump*/
  0010: write_register = 1, write_reg_from_memory = 1;/* GOT load bitstring from memory to register*/
  0011: read_register = 1;/*store register val in memory*/
  0100: alu_control = 00;/* copy register to register )*/
  0101: alu_control = 01;/* GOT branch if less than*/
  1000: alu_control = 00;/* GOT add registers together*/
  1001: alu_control = 01;/* GOT subtract registers from each other*/
  endcase
end
endmodule
