module state_machine(
  input logic clk,
  input logic state_reset,
  output logic [1:0] state);
  logic [1:0] next_state;
  always @ (posedge clk or negedge state_reset) begin
    if (~state_reset)
      next_state <= 2'b00;
    if (clk == 1) begin
    case (next_state)
      2'b00: next_state <= 2'b01;
      2'b01: next_state <= 2'b10;
      2'b10: next_state <= 2'b11;
      2'b11: next_state <= 2'b00;
    endcase
    end
    if (clk == 1)
    state <= next_state;
  end
endmodule
