timeunit 10ps/1ps;
module test ();
      logic [1:0] select;
    	logic [15:0] line_1;
    	logic [15:0] line_2;
    	logic [15:0] line_3;
    	logic [15:0] line_4;
    	logic [15:0] out;
      multiplexer4 u1(.*);
  initial begin
        $dumpfile("mux4.vcd");
        $dumpvars;
  select = 2'b00;
  line_1 = 16'd10;
  line_2 = 16'd20;
  line_3 = 16'd20;
  line_4 = 16'd20;
  end

  initial begin
    #10;
  line_1 = 16'd30;
    #10;
  line_1 = 16'd20;
  line_2 = 16'd10;
  line_3 = 16'd40;
  line_4 = 16'd50;
    #10;
  select = 2'b01;
    #10;
  line_1 = 16'd20;
  line_2 = 16'd10;
  line_3 = 16'd40;
  line_4 = 16'd50;
    #10;
  select = 2'b10;
  line_3 = 16'd50;
    #10;
  line_1 = 16'd00;
  line_2 = 16'd00;
  line_3 = 16'd20;
  line_4 = 16'd00;
    #10;
  select = 2'b11;
    #10;
  line_4 = 16'd50;
    #10;
  line_1 = 16'd20;
  line_2 = 16'd10;
  line_3 = 16'd40;
  line_4 = 16'd50;
  $finish();
  end
endmodule
