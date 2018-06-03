module register (input write_to_register
                input write_1_address,
                input clock,
                input [15:0] write_word,
                output [15:0] readword);

always_ff @ (posedge clock) begin
if write_to_register 
readword <= ;
end

endmodule
