timeunit 10ps/1ps;
module test ();
                logic [3:0] opcode;
                logic branch_flag;
                logic [1:0]state;
                logic [4:0] alternate_read;
                logic [4:0] alt_write;
                logic LT_flag;
                logic [1:0] alu_control;
                logic extender_reset;
                logic state_machine_reset;
                logic PC_EN;
                logic PC_reset;
                logic reset_reg_file;
                logic read_1EN;
                logic read_2EN;
                logic reg_file_wrEN;
                logic EN_mem_add;
                logic mem_add_reset;
                logic RAM_wrEN;
                logic RAM_rddisEN;
                logic EN_output;
                logic output_reset;
                logic ten_branch;
                logic LT_state; //LT selects whether or not to branch
                logic PC_or_read_mem;
                logic PC_in_op;
                logic lineb_ex;
                logic alu_linea;
                logic clock;
                logic control_reset;
                logic [0:0] Altsel;
                logic [0:0] Altwrsel;
                reg opcode_store;
      control_matrix u1(.*);
  initial begin
        $dumpfile("control_matrix.vcd");
        $dumpvars;
        control_reset = 1'b1;
        clock = 1;
        state = 0;
  end
  always begin
  #5  clock = !clock;
  end


  initial begin
  #10
  opcode = 4'b1111;
  state = 0;
  #10
  opcode = 4'b0001;
  state = 0;
  #10
  state = 1;
  #10
  state = 2;
  #10
  state = 3;
  #10
  opcode = 4'b0001;
  state = 0;
  #10
  state = 1;
  #10
  state = 2;
  #10
  state = 3;
  #10
  opcode = 4'b0010;
  state = 0;
  #10
  state = 1;
  #10
  state = 2;
  #10
  state = 3;
  #10
  opcode = 4'b0011;
  state = 0;
  #10
  state = 1;
  #10
  state = 2;
  #10
  state = 3;
  #10
  opcode = 4'b0100;
  state = 0;
  #10
  state = 1;
  #10
  state = 2;
  #10
  state = 3;
  #10
  opcode = 4'b0101;
  state = 0;
  #10
  state = 1;
  #10
  state = 2;
  #10
  state = 3;
  #10
  opcode = 4'b0110;
  state = 0;
  #10
  state = 1;
  #10
  state = 2;
  #10
  state = 3;
  #10
  opcode = 4'b0111;
  state = 0;
  #10
  state = 1;
  #10
  state = 2;
  #10
  state = 3;
  #10
  #10
  $finish();
  end
endmodule
