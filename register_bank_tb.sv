timeunit 10ps/1ps;
module test_reg_bank ();
  logic clk;
  logic reset;
  logic read_1EN;
  logic read_2EN;
  logic writeEN;
  logic [4:0] read_1;
  logic [4:0] read_2;
  logic [4:0] write_reg_address;
  logic [15:0] write_val;
  logic [15:0] line_a;
  logic [15:0] line_b;
      register_bank u1(.*);
  initial begin
        $dumpfile("register_bank.vcd");
        $dumpvars;
        clk = 0;
        reset = 1;
        read_1EN = 1;
        read_2EN = 1;
        writeEN = 0;
        read_1 = 16'd3;
        read_2 = 16'd4;
        write_reg_address = 5'd15;
        write_val = 16'd10;
        end
  always
  #5 clk = !clk;

  initial begin
  #10;
  reset = 0;
  #10;
  reset = 1;
  read_1 = 5'd15;
  #10;
  writeEN = 1;
  write_val = 16'd20;
  #10;
  write_reg_address = 16'd4;
  write_val = 16'd10;
  #10;
  reset = 0;
  #10;
  reset = 1;
  #10;
  $finish();
  end
endmodule
