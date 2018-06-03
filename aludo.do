add wave ctrl_signal
add wave alu_result
add wave input_a
add wave input_b

force  ctrl_signal 00
force  alu_result 0
force  input_a 0
force  input_b 0
run 50

force  ctrl_signal 00
force  alu_result 0
force  input_a 0
force  input_b 0
run 50
