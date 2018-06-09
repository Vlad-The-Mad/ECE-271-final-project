timeunit 10ps/1ps;
module processer_test ();
            logic clk;
            logic [15:0] processor_output;
      processortop u1(.*);
    initial begin
          $dumpfile("processortop.vcd");
          $dumpvars;
    clk = 0;
    end
  always
  #10  clk = !clk;

  initial begin
  #10;
  #10;
  $finish();
  end

endmodule
