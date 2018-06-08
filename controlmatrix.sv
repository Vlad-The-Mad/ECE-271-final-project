module control_matrix (
                      input logic clock,
                      input logic [3:0] opcode,
                      input logic branch_flag,
                      input logic [2:0]state,
                      //input logic reset_signals,
                      input logic LT_flag,
                      output logic [1:0] alu_control,
                      output logic [0:0] write_reg_from_memory,
                      output logic [0:0] extender_reset,
                      output logic [0:0] state_machine_reset,
                      /*register enables and resets*/
                      output logic [0:0] PC_EN,
                      output logic [0:0] PC_reset,
                      output logic [0:0] reset_reg_file,
                      output logic [0:0] read_1EN,
                      output logic [0:0] read_2EN,
                      output logic [0:0] reg_file_wrEN,
                      output logic [0:0] EN_mem_add,
                      output logic [0:0] mem_add_reset,
                      output logic [0:0] RAM_wrEN,
                      output logic [0:0] EN_output,
                      output logic [0:0] output_reset,
                      output logic [0:0] ten_branch,
                      output logic [0:0] LT_state,
                      output logic [0:0] PC_or_read_mem,
                      output logic [0:0] PC_in_op,
                      output logic [0:0] lineb_ex,
                      output logic [0:0] alu_linea
                      );
            reg less_than_flag; //LT_flag_set gets this.
            reg [3:0] opcode_store;
            logic control_reset;
always @ (*) begin
  ten_branch <= branch_flag;
  LT_state = less_than_flag;
  if (state == 1)
    PC_EN <= 1;
  if (state == 2) begin
    opcode_store = opcode;
    PC_EN <<= 0;
    end
  case (opcode_store)
  0001: PC_in_op <= 1; /*JMP absolute jump*/
  0010: begin /*LDW load bitstring from memory to register*/
        end
  0011: begin /*STW store register val in memory*/
        end
  0100: begin /*RTR copy register to register)*/

        end
  0101: begin /*BLT branch if less than*/
          if (state == 2) begin
          alu_control <= 2'b01;
          read_1EN <= 1;
          read_2EN <= 1;
          end
          else if (state == 3) begin
          less_than_flag <= LT_flag;
          read_1EN <= 0;
          read_2EN <<= 0;
          end
        end
  0110: begin alu_control <= 00;/*ADD add registers together*/
        end
  0111: begin alu_control <= 01;/*SUB subtract registers from each other*/

        end
  1111: begin
                //input logic reset_signals,
                 alu_control <= 2'b00;
                 write_reg_from_memory <= 0;
                 extender_reset <= 0;
                 state_machine_reset <= 0;
                /*register enables and resets*/
                 PC_EN <= 0;
                 PC_reset <= 0;
                 reset_reg_file <= 0;
                 read_1EN <= 0;
                 read_2EN <= 0;
                 reg_file_wrEN <= 0;
                 EN_mem_add <= 0;
                 mem_add_reset <= 0;
                 RAM_wrEN <= 0;
                 EN_output <= 0;
                 output_reset <= 0;
                /*mux selects*/
                 ten_branch <= 0;
                 LT_state <= 0; //LT selects whether or not to branc = 0;
                 PC_or_read_mem <= 0;
                 PC_in_op <= 0;
                 lineb_ex <= 0;
                 alu_linea <= 0;
                 less_than_flag <= 0;
                 end

    default: alu_control <= 00;
    endcase
end
endmodule
