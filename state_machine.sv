module state_machine(
  input logic clk,
  input logic state_reset,
  output logic [1:0] state);
  logic [1:0] c_state;
  always @ (posedge clk or negedge state_reset or c_state) begin
    case
    2'b00: c_state = 2'b01;
    2'b01: c_state = 2'b10;
    2'b10: c_state = 2'b11;
    2'b11: c_state = 2'b00;
    endcase
  state = c_state;
  end
endmodule
