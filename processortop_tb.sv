timeunit 10ps/1ps;
module processer_test ();
            logic clk;
            logic state_reset;
            logic [15:0] processor_output;
            logic branch_flag;
            logic [1:0] state;
            logic [4:0] alternate_read;
            logic [4:0] alt_write;
            //input logic reset_signals;
            logic LT_flag;
            logic LT_flag_set;
            logic incr_branch;
            logic [15:0] signex_out;
            logic [1:0] alu_control;
            logic [0:0] extender_reset;
            logic [0:0] state_machine_reset;
            /*register enables and resets*/
            logic [0:0] PC_EN;
            logic [0:0] PC_reset;
            logic [0:0] reset_reg_file;
            logic [0:0] read_1EN;
            logic [0:0] read_2EN;
            logic [0:0] reg_file_wrEN;
            logic [0:0] EN_mem_add;
            logic [0:0] mem_add_reset;
            logic [0:0] RAM_wrEN;
            logic [0:0] RAM_rddisEN;
            logic [0:0] EN_output;
            logic [0:0] output_reset;
            logic [0:0] branch_len;
            logic [0:0] PC_or_read_mem;
            logic [0:0] PC_in_op;
            logic [15:0] PC_new;
            logic [15:0] PC_out;
            logic [15:0] line_a;
            logic [15:0] wwrite_mem_add;
            logic [15:0] linea_alu_out;
            logic [15:0] alu_linea_out;
            logic [15:0] read_addr;
            logic [15:0] Mem_out;
            logic [4:0] line1;
            logic [15:0] rfile_wradd;
            logic [15:0] line_b;
            logic [15:0] input_b;
            logic [15:0] alu_out;
            logic [15:0] add_to_PC;
            logic [15:0] PC_nxt_branch;
            logic [15:0] branch;
            logic [0:0] lineb_ex;
            logic [0:0] alu_linea;
            logic [0:0] Altsel;
            logic [0:0] Altwrsel;
      processortop u1(.*);
    initial begin
          $dumpfile("processortop.vcd");
          $dumpvars;
    clk = 0;
    Mem_out = 16'b1111000010001000;
    end
  always
  #10  clk = !clk;

  initial begin
  #10;
  #10;
  $finish();
  end

endmodule
