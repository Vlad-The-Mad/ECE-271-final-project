adder_sim: adder.sv adder_tb.sv
	iverilog -g2012 -Wall adder.sv adder_tb.sv -o adder.elf
	./adder.elf
	gconftool-2 --type string --set /com.geda.gtkwave/0/reload 0

RAM_sim: RAM.sv RAM_tb.sv
	iverilog -g2012 -Wall RAM.sv RAM_tb.sv -o RAM.elf
	./RAM.elf
	gconftool-2 --type string --set /com.geda.gtkwave/0/reload 0


sign_extender_tb_sim: sign_extender_tb.sv sign_extender_tb.sv
	iverilog -g2012 -Wall sign_extender.sv sign_extender_tb.sv -o sign_extender_tb.elf
	./sign_extender_tb.elf
	gconftool-2 --type string --set /com.geda.gtkwave/0/reload 0

state_machine_tb_sim: state_machine_tb.sv state_machine_tb.sv
	iverilog -g2012 -Wall state_machine.sv state_machine_tb.sv -o state_machine_tb.elf
	./state_machine_tb.elf
	gconftool-2 --type string --set /com.geda.gtkwave/0/reload 0

register_bank_tb_sim: register_bank_tb.sv register_bank_tb.sv
	iverilog -g2012 -Wall register_bank.sv register_bank_tb.sv -o register_bank_tb.elf
	./register_bank_tb.elf
	gconftool-2 --type string --set /com.geda.gtkwave/0/reload 0

alu_sim: alu.sv alu_tb.sv
	iverilog -g2012 -Wall alu.sv alu_tb.sv -o alu.elf
	./alu.elf
	gconftool-2 --type string --set /com.geda.gtkwave/0/reload 0

mux4_sim: mux4.sv mux4_tb.sv
	iverilog -g2012 -Wall mux4.sv mux4_tb.sv -o mux4.elf
	./mux4.elf
	gconftool-2 --type string --set /com.geda.gtkwave/0/reload 0

mux_sim: mux.sv mux_tb.sv
	iverilog -g2012 -Wall mux.sv mux_tb.sv -o mux.elf
	./mux.elf
	gconftool-2 --type string --set /com.geda.gtkwave/0/reload 0

register_sim: register.sv register_tb.sv
	iverilog -g2012 -Wall register.sv register_tb.sv -o register.elf
	./register.elf
	gconftool-2 --type string --set /com.geda.gtkwave/0/reload 0
