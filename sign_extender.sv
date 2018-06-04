module sign_extender (input logic [9:0] in_10,
                      output logic [15:0] out_16);
always_comb begin
  out_16 = {{6{in_10[9]}}, {in_10[9:0]}};
end
endmodule
