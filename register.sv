module register (input logic enable,
                input logic clock,
                input logic reset,
                input logic [15:0] write_word,
                output logic [15:0] readword);

always @ (posedge clock or negedge reset) begin
  if (enable)
    readword <= write_word;
  if (reset == 0)
    readword <= 16'b0;
end
endmodule
