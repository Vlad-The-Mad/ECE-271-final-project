module register_bank (
  input logic read_1EN,
  input logic read_2EN,
  input logic writeEN,
  input logic [4:0] read_1,
  input logic [4:0] read_2,
  input logic [4:0] write_reg_address,
  input logic [15:0] write_val,
  output logic [15:0] line_a,
  output logic [15:0] line_b);

reg [15:0] regfile [0]
endmodule
