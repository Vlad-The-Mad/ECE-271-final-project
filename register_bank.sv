module register_bank (
  input logic clk,
  input logic reset,
  input logic read_1EN,
  input logic read_2EN,
  input logic writeEN,
  input logic [4:0] read_1,
  input logic [4:0] read_2,
  input logic [4:0] write_reg_address,
  input logic [15:0] write_val,
  output logic [15:0] line_a,
  output logic [15:0] line_b);

reg [15:0] registerfile [0:15];

always @ (posedge clk or negedge reset) begin
  if (read_1EN)
    line_a <= registerfile[read_1];
  if (read_2EN)
    line_b <= registerfile[read_2];
  if (writeEN)
    registerfile[write_reg_address] <= write_val;
  if (!reset)
    begin
    registerfile[0] <= 16'b0;
    registerfile[1] <= 16'b0;
    /*reg [1] stores the mem offset*/
    registerfile[2] <= 16'b0;
    registerfile[3] <= 16'b0;
    registerfile[4] <= 16'b0;
    registerfile[5] <= 16'b0;
    registerfile[6] <= 16'b0;
    registerfile[7] <= 16'b0;
    registerfile[8] <= 16'b0;
    registerfile[9] <= 16'b0;
    registerfile[10] <= 16'b0;
    registerfile[11] <= 16'b0;
    registerfile[12] <= 16'b0;
    registerfile[13] <= 16'b0;
    registerfile[14] <= 16'b0;
    registerfile[15] <= 16'b0;
    end
end
endmodule
