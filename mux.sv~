module multiplexer2 #parameter(bus_size = 1)
                      (input logic select,
                      input logic [bus_size - 1:0] line_1,
                      input logic [bus_size - 1:0] line_2,
                      output logic [bus_size - 1:0] out);
always_comb begin
  case (select)
  0: out = line_1;
  1: out = line_2;
end
endmodule
