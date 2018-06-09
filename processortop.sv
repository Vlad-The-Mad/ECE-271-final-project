module processortop (
      output logic [15:0] processor_output,
      input logic clk,
      input logic start);

logic state_reset;
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
logic [0:0] read_rddisEN;
logic [0:0] RAM_rddisEN;
logic [0:0] EN_output;
logic [0:0] output_reset;
logic [0:0] branch_len;
logic [0:0] PC_or_read_mem;
logic [0:0] PC_in_op;
logic [15:0] PC_new;
logic [15:0] PC_out;
logic [15:0] line_a;
logic [15:0] write_mem_add;
logic [15:0] linea_alu_out;
logic [15:0] alu_linea_out;
logic [15:0] read_addr;
logic [15:0] Mem_out;
logic [4:0] line1;
logic [4:0] rfile_wradd;
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


state_machine state_machine(
  .clk(clk),
  .state_reset(state_machine_reset),
  .state(state));

control_matrix control(
  .start(start),
  .clock(clk),
  .opcode(Mem_out[15:12]),
  .branch_flag(Mem_out[11]),
  .state(state),
  .alternate_read(alternate_read),
  .alt_write(alt_write),
  .LT_flag(LT_flag_set),
  .LT_state(incr_branch),
  .alu_control(alu_control),
  .extender_reset(extender_reset),
  .state_machine_reset(state_machine_reset),
  .PC_EN(PC_EN),
  .PC_reset(PC_reset),
  .reset_reg_file(reset_reg_file),
  .read_1EN(read_1EN),
  .read_2EN(read_2EN),
  .reg_file_wrEN(reg_file_wrEN),
  .EN_mem_add(EN_mem_add),
  .mem_add_reset(mem_add_reset),
  .RAM_wrEN(RAM_wrEN),
  .read_rddisEN(RAM_rddisEN),
  .EN_output(EN_output),
  .output_reset(output_reset),
  .ten_branch(branch_len),
  .PC_or_read_mem(PC_or_read_mem),
  .PC_in_op(PC_in_op),
  .lineb_ex(lineb_ex),
  .alu_linea(alu_linea),
  .Altsel(Altsel),
  .Altwrsel(Altwrsel)
  );

sign_extender extender(
  .in_10(Mem_out[9:0]), //part of instruction
  .reset(extender_reset),
  .out_16(signex_out));

register PC(
  .enable(PC_EN),
  .clock(clk),
  .reset(PC_reset),
  .write_word(PC_new),
  .readword(PC_out));

register mem_add(
  .enable(EN_mem_add),
  .clock(clk),
  .reset(mem_add_reset),
  .write_word(line_a),
  .readword(write_mem_add));

register output_store(
  .enable(EN_output),
  .clock(clk),
  .reset(output_reset),
  .write_word(linea_alu_out),
  .readword(processor_output));

RAM memory(
  .write_EN(RAM_wrEN),
  .read_rddisEN(RAM_rddisEN),
  .read_address(read_addr),
  .write_address(write_mem_add),
  .write_value(alu_linea_out),
  .word(Mem_out));

register_bank reg_file(
  .clk(clk),
  .reset(reset_reg_file),
  .read_1EN(read_1EN),
  .read_2EN(read_2EN),
  .writeEN(reg_file_wrEN),
  .read_1(line1),
  .read_2(Mem_out[4:0]),
  .write_reg_address(rfile_wradd),
  .write_val(linea_alu_out),
  .line_a(line_a),
  .line_b(line_b));

ALU alu_unit(
  .ctrl(alu_control),
  .input_a(line_a),
  .input_b(input_b),
  .LT(LT_flag_set),
  .alu_result(alu_out));

adder pc_adder(
  .line_a(PC_out),
  .line_b(add_to_PC),
  .result(PC_nxt_branch));

multiplexer2 branch_length_mux(
  .select(branch_len),
  .line_1(16'd10),
  .line_2(-16'd10),
  .out(branch));

multiplexer2 #(5) Aoralt_mux(
  .select(Altsel),
  .line_1(Mem_out[9:5]),
  .line_2(alternate_read),
  .out(line1));

multiplexer2 #(5) Aoralt_write_mux(
  .select(Altwrsel),
  .line_1(Mem_out[9:5]),
  .line_2(alt_write),
  .out(rfile_wradd));

multiplexer2 incr_branch_mux(
  .select(incr_branch),
  .line_1(16'b1),
  .line_2(branch),
  .out(add_to_PC));

multiplexer2 PC_or_read_mux(
  .select(PC_or_read_mem),
  .line_1(PC_out),
  .line_2(linea_alu_out),
  .out(read_addr));

multiplexer2 PC_next_mux(
  .select(PC_in_op),
  .line_1(PC_nxt_branch),
  .line_2(signex_out),
  .out(PC_new));

multiplexer2 lineb_signex_mux(
  .select(lineb_ex),
  .line_1(line_b),
  .line_2(signex_out),
  .out(input_b));

multiplexer2 linea_alu_mux(
  .select(alu_linea),
  .line_1(alu_out),
  .line_2(line_a),
  .out(linea_alu_out));

endmodule
