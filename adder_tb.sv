timeunit 10ps/1ps;
module adder_tb ();
      logic [15:0] line_a;
      logic [15:0] line_b;
      logic [15:0] result;
      adder u1(.*);
  initial begin
        $dumpfile("adder.vcd");
        $dumpvars;
  end

  initial begin
  #10
  line_a = 16'b1;
  line_b = 16'b1;
  #10
  line_a = 16'd20;
  #10
  line_b = -16'd3;
  #10
  line_b = -16'd21;
  #10

  $finish();
  end
endmodule
