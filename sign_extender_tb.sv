timeunit 10ps/1ps;
module test ();
    logic [9:0] in_10;
    logic [15:0] out_16;
    logic reset;
  sign_extender u1(.*);
  initial begin
        $dumpfile("sign_extender.vcd");
        $dumpvars;
    reset = 1;
  end

initial begin
#10
    reset = 0;
#10
    reset = 1;
#20
    in_10 = 10'b0111111111;
#20
    in_10 = 10'b1111111111;
#20
    in_10 = 10'd20;
#10
#10
  $finish();
end
endmodule
