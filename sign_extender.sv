module sign_extender (input logic [9:0] in_10,
                      input logic reset,
                      output logic [15:0] out_16);
                      logic [9:0] temp_store;
  always @ (in_10 or negedge reset) begin
    temp_store = in_10;
      if (~reset) begin
        temp_store = 10'b0;
      end
    out_16 = {{6{temp_store[9]}}, {temp_store[9:0]}};
  end
endmodule
