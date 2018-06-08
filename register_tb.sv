timeunit 10ps/1ps;
module test_reg ();
                logic enable;
                logic clock;
                logic reset;
                logic [15:0] write_word;
                logic  [15:0] readword;
      register u1(.*);
    initial begin
          $dumpfile("register.vcd");
          $dumpvars;
    clock = 0;
    reset = 2'b0;
    enable = 2'b0;
    write_word = 10'd20;

    end
  always
  #10  clock = !clock;

  initial begin
  #10;
  reset = 2'b1;
  #10;
  write_word = 10'd20;
  #10;
  enable = 2'b1;
  #10;
  reset = 2'b0;
  #10;
  reset = 2'b1;
  #10;
  enable = 0;
  write_word = 10'd10;
  #10;
  enable = 1;
  write_word = 10'd30;
  #10;
  $finish();
  end
endmodule
