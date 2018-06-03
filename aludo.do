add wave -radix binary ctrl_signal
add wave -radix binary alu_result
add wave -radix decimal alu_result
add wave -radix binary input_a
add wave -radix binary input_b

run 50

force  ctrl_signal 00
force  input_a 0
force  input_b 0
run 50

force  input_a 1
run 50

force  input_b 22 
run 50

force  input_a 8 
run 50

force  ctrl_signal 01 
run 50

force  input_a 0
force  input_b 0
run 50

force  input_a 1
run 50

force  input_b 22 
run 50

force  input_a 8 
run 50

force  ctrl_signal 10 
run 50


force  input_a 0
force  input_b 0
run 50

force  input_a 1
run 50

force  input_b 22 
run 50

force  input_a 8 
run 50

force  ctrl_signal 11 
run 50
force  input_a 0
force  input_b 0
run 50

force  input_a 1
run 50

force  input_b 22 
run 50

force  input_a 8 
run 50

force  ctrl_signal 10 
run 50

force  input_a 0
force  input_b 0
run 50

force  input_a 1
run 50

force  input_b 22 
run 50

force  input_a 8 
run 50
