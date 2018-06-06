timeunit 10ps/1ps;
module test ();
      logic select;
    	logic [15:0] line_1;
    	logic [15:0] line_2;
    	logic [15:0] out;
      multiplexer2 u1(.*);
  initial begin
        $dumpfile("mux.vcd");
        $dumpvars;
  select = 0;
  line_1 = 16'd10;
  line_2 = 16'd20;
  end

  initial begin
    #10;
  line_1 = 16'd30;
    #10;
  select = 1;
  line_2 = 16'd10;
    #10;
  line_2 = 16'd20;
    #10;
  $finish();
  end
endmodule
