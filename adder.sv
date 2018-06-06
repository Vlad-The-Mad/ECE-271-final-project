module adder #(parameter bus_size = 16)
              (input logic [bus_size - 1:0] line_a,
              input logic [bus_size - 1:0] line_b,
              output logic [bus_size - 1:0] result);
always @ (line_a or line_b) begin
  result = line_a + line_b;
end
endmodule
