module multiplexer4 #parameter(bus_size = 1)
                      (input logic [1:0] select,
                      input logic [bus_size - 1:0] line_1,
                      input logic [bus_size - 1:0] line_2,
                      input logic [bus_size - 1:0] line_3,
                      input logic [bus_size - 1:0] line_4,
                      output logic [bus_size - 1:0] out);
always_comb begin
  case (select)
  00: out = line_1;
  01: out = line_2;
  10: out = line_3;
  11: out = line_4;
end
endmodule
