
timeunit 10ps/1ps;
module test ();
                logic [3:0] opcode;
                logic branch_flag;
                logic [2:0]state;
                //input logic reset_signals,
                logic LT_flag;
                logic [1:0] alu_control;
                logic write_reg_from_memory;
                logic extender_reset;
                logic state_machine_reset;
                /*register enables and resets*/
                logic PC_EN;
                logic PC_reset;
                logic reset_reg_file;
                logic read_1EN;
                logic read_2EN;
                logic reg_file_wrEN;
                logic EN_mem_add;
                logic mem_add_reset;
                logic RAM_wrEN;
                logic EN_output;
                logic output_reset;
                /*mux selects*/
                logic ten_branch;
                logic LT_state; //LT selects whether or not to branch
                logic PC_or_read_mem;
                logic PC_in_op;
                logic lineb_ex;
                logic alu_linea;
                logic clock;
                logic control_reset;
                reg opcode_store;
      control_matrix u1(.*);
  initial begin
        $dumpfile("control_matrix.vcd");
        $dumpvars;
        control_reset = 1'b1;
        clock = 0;
  end
  always
  #5  clock = !clock;

  initial begin
  control_reset = 1'b1;
  #10
  opcode = 4'b0001;
  state = 2;
  control_reset = 1'b0;
  #10
  state = 3;
  #10
  opcode = 4'b0101;
  state = 2;
  #10
  state = 3;
  #10
  opcode = 4'b1111;
  #100
  $finish();
  end
endmodule
