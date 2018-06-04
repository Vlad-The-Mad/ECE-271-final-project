module register (input enable,
                input clock,
                input [15:0] write_word,
                output [15:0] readword);

always_ff @ (posedge clock) begin
if enable
  readword <= write_word;
end

endmodule
