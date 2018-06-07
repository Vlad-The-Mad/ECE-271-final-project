module state_machine(
  input logic clk,
  input logic state_reset,
  output logic [2:0] state);
  logic [2:0] next_state;
  always @ (posedge clk or negedge state_reset) begin
    if (~state_reset)
      next_state <= 2'b00;
    if (clk == 1) begin
    case (next_state)
      2'b000: next_state <= 2'b001;
      2'b001: next_state <= 2'b010;
      2'b010: next_state <= 2'b011;
      2'b011: next_state <= 2'b011;
      2'b100: next_state <= 2'b101;
      2'b101: next_state <= 2'b000;
    endcase
    end
    if (clk == 1)
    state <= next_state;
  end
endmodule
