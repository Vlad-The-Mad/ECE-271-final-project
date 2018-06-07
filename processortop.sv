module processortop ();

logic clk;
logic state_reset;
logic processor_output;

state_machine state_machine(
  .clock(clk),
  .state_reset(state_machine_reset),
  .state(state));

control_matrix control(
  .opcode(Mem_out[15:12]),
  .branch_flag(Mem_out[11]),
  .state(state),
  .LT_flag(LT_flag_set),
  .LT_state(incr_branch),
  .alu_control(alu_control),
  .write_register(reg_file_wrEN),
  .read_register(reset_reg_file),
  .write_reg_from_memory(),
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
  .EN_output(EN_output),
  .output_reset(output_reset),
  .ten_branch(branch_len),
  .PC_or_read_mem(PC_or_read_mem),
  .PC_in_op(PC_in_op),
  .lineb_ex(lineb_ex),
  .alu_linea(alu_linea),
  );

extender sign_extender(
  .in_10(Mem_out[9:0]), //part of instruction
  .reset(extender_reset),
  .out_16(signex_out));

register PC(
  .enable(PC_EN)
  .clock(clk),
  .reset(PC_reset),
  .write_word(PC_new),
  .readword(PC_out));

register mem_add(
  .enable(EN_mem_add)
  .clock(clk),
  .reset(mem_add_reset),
  .write_word(linea_alu_out),
  .readword(processor_output);

register output_store(
  .enable(EN_output)
  .clock(clk),
  .reset(output_reset),
  .write_word(linea_alu_out),
  .readword(line_a);
  );

RAM memory(
  .write_EN(RAM_wrEN),
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
  .read_1(Mem_out[9:5]),//part of instruction
  .read_2(Mem_out[4:0]),//part of instruction
  .write_reg_address(Mem_out[9:5]),//part of instruction
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
  .line_a(PC_out);
  .line_b(add_to_PC);
  .result(PC_nxt_branch);
  );

multiplexer2 branch_length_mux(
  .select(branch_len),
  .line_1(16'd10),
  .line_2(-16'd10),
  .out(branch));

multiplexer2 incr_branch_mux(
  .select(incr_branch),
  .line_1(16'b1),
  .line_2(branch),
  .out(add_to_PC);

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
