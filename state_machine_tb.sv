timeunit 10ps/1ps;
module test();
  logic clk;
  logic state_reset;
  logic [1:0] state;
  logic [1:0] next_state;
  state_machine u1(.*);

  initial begin
        $dumpfile("state_machine.vcd");
        $dumpvars;
    clk = 0;
    state_reset = 1;
  end
  always
    #5 clk = !clk;

  initial begin
  #10;
    state_reset = 0;
  #10;
    state_reset = 1;
  #40;
    state_reset = 0;
  #10;
    state_reset = 1;
  #10;

  $finish();
  end
endmodule
