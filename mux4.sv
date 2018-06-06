module multiplexer4 #(parameter bus_size = 15)
                      (input logic [1:0] select,
                      input logic [bus_size:0] line_1,
                      input logic [bus_size:0] line_2,
                      input logic [bus_size:0] line_3,
                      input logic [bus_size:0] line_4,
                      output logic [bus_size:0] out);
always @ *
begin
  case (select)
  2'b00: out = line_1;
  2'b01: out = line_2;
  2'b10: out = line_3;
  2'b11: out = line_4;
  endcase
end
endmodule
