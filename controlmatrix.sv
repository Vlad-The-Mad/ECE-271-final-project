module control_matrix (input logic [3:0] opcode,
                      input logic state,
                      input logic LT_flag,
                      output logic [1:0] alu_control,
                      output logic write_reg_from_memory,
                      output logic extender_reset,
                      output logic state_machine_reset,
                      /*register enables and resets*/
                      output logic PC_EN,
                      output logic PC_reset
                      output logic reset_reg_file,
                      output logic read_1EN,
                      output logic read_2EN,
                      output logic reg_file_wrEN,
                      output logic EN_mem_add,
                      output logic mem_add_reset,
                      output logic EN_output,
                      output logic output_reset,
                      /*mux selects*/
                      output logic 10or-10_branch,
                      output logic LT_state, //LT selects whether or not to branch
                      output logic PC_or_read_mem,
                      output logic PC_in_op,
                      output logic lineb_ex,
                      output logic alu_linea,
                      );
reg less_than_flag;
always @ (*) begin
  case(opcode)
  0000: /*no operation / display */
  0001: /* GOT absolute jump*/
  0010: /* GOT load bitstring from memory to register*/
  0011: /*store register val in memory*/
  0100: /* copy register to register)*/
  0101: /* GOT branch if less than*/
  1000: alu_control = 00;/* GOT add registers together*/
  1001: alu_control = 01;/* GOT subtract registers from each other*/
  endcase
end
endmodule
