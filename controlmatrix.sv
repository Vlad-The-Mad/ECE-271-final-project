module control_matrix (
                      input logic clock,
                      input logic [3:0] opcode,
                      input logic branch_flag,
                      input logic [2:0]state,
                      output logic [4:0] alternate_read,
                      output logic [4:0] alt_write,
                      //input logic reset_signals,
                      input logic LT_flag,
                      output logic [1:0] alu_control,
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
                      output logic [0:0] RAM_rddisEN,
                      output logic [0:0] EN_output,
                      output logic [0:0] output_reset,
                      output logic [0:0] ten_branch,
                      output logic [0:0] LT_state,
                      output logic [0:0] PC_or_read_mem,
                      output logic [0:0] PC_in_op,
                      output logic [0:0] lineb_ex,
                      output logic [0:0] alu_linea,
                      output logic [0:0] Altsel,
                      output logic [0:0] Altwrsel
                      );
            reg less_than_flag; //LT_flag_set gets this.
            reg [3:0] opcode_store;
            logic control_reset;
always @ (*) begin
  ten_branch <= branch_flag;
  LT_state <= less_than_flag;
  if (state == 0) begin
    PC_EN <= 1;
    opcode_store = opcode;
    end
  if (state == 1)
    PC_EN <= 0;
  if (state == 6)
    opcode_store = 4'b1111;
  case (opcode_store)
  4'b0001: begin PC_in_op <= 1; /*JMP absolute jump*/
        end
  4'b0010: begin /*LDW load bitstring from memory to register*/
            if (state == 1) begin
              Altsel <= 1;            //control going to A mux alt_orA
              alternate_read <= 4'd2;//line going to A alternate_read 16'd2 has memory offset
              read_1EN <= 1;
              PC_or_read_mem <= 1;
              lineb_ex <= 1;
            end
            else if (state == 2) begin
              PC_or_read_mem <= 1;
              alt_write <= 4'd1;//line going to write address <= 16'd1;
              Altwrsel <= 1;//flag for alternate write address
              RAM_rddisEN <= 1; //keep ram from reading weird alu results from adding new words
            end
            else if (state == 3) begin
              reg_file_wrEN <= 1;
            end
        end
  4'b0011: begin /*STW store register val in memory*/
            if (state == 1) begin
              Altsel <= 1;
              alternate_read <= 4'd2;
              read_1EN <= 1;
              lineb_ex <= 1;
            end
            else if (state == 2) begin
            EN_mem_add <= 1;
            end
            else if (state == 3) begin
            EN_mem_add <= 0;
              alternate_read <= 4'd3; //d3 is where registers are copied to for storeage
              alu_linea <= 1;
              RAM_wrEN <= 1;
            end

        end
  4'b0100: begin /*RTR copy register to register)*/
          if (state == 1) begin
            read_2EN <= 1;
          end

        end
  4'b0101: begin /*BLT branch if less than*/
          if (state == 1) begin
            alu_control <= 2'b01;
            read_1EN <= 1;
            read_2EN <= 1;
          end
          else if (state == 2) begin
            less_than_flag <= LT_flag;
            read_1EN <= 0;
            read_2EN <= 0;
          end

          //need more to finish this off
        end
  4'b0110: begin alu_control <= 00;/*ADD add registers together*/
            if (state == 1) begin
              read_1EN <= 1;
              read_2EN <= 1;
            end
            else if (state == 2) begin
              Altwrsel <= 1;
              alt_write <= 4'd4;
              reg_file_wrEN <= 1;
            end
            else if (state == 3) begin
              reg_file_wrEN <= 0;
            end
        end
  4'b0111: begin alu_control <= 01;/*SUB subtract registers from each other*/
            if (state == 1) begin
              read_1EN <= 1;
              read_2EN <= 1;
            end
            else if (state == 2) begin
              Altwrsel <= 1;
              alt_write <= 4'd4;
              reg_file_wrEN <= 1;
            end
            else if (state == 3) begin
              reg_file_wrEN <= 0;
            end
        end
  4'b1111: begin
                //input logic reset_signals,
                 alu_control <= 2'b00;
                 extender_reset <= 0;
                 //state_machine_reset <= 0;
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
                 RAM_rddisEN <= 0;
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
                 Altsel <= 0;
                 Altwrsel <= 0;
                 alt_write <= 0;
                 alternate_read <= 0;
                 end

    default: alu_control <= 2'b11;
    endcase
end
endmodule
