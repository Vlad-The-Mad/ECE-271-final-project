timeunit 10ps/1ps;
module test ();
     logic [1:0] ctrl;
			logic [15:0] input_a;
			logic [15:0] input_b;
			logic LT;
      logic [15:0] alu_result;
      ALU u1(.*);
  initial begin
        $dumpfile("alu.vcd");
        $dumpvars;
  end
  initial begin
        ctrl = 2'b00;
        input_a = 16'd10;
        input_b = 16'd20;
        #10;
        input_b = 16'd30;

        #10;
        input_a = 16'd50;

        #10;
        ctrl = 2'b01;
        input_a = 16'd10;
        input_b = 16'd20;

        #10;
        input_b = 16'd30;

        #10;
        input_a = 16'd50;

        #10;
        ctrl = 2'b10;
        input_a = 16'd10;
        input_b = 16'd10;

        #10;
        input_b = 16'd30;

        #10;
        input_a = 16'd50;

        #10;
        ctrl = 2'b11;
        input_a = 16'd10;
        input_b = 16'd20;

        #10;
        input_b = 16'd30;

        #10;
        input_a = 16'd50;

        $finish();
        end

endmodule
