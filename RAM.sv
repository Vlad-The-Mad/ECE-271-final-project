module RAM (input logic write_EN,
            input logic [15:0] read_address,
            input logic [15:0] write_address,
            input logic [15:0] write_value,
            output logic [15:0] word);
logic [15:0] mem [1023:0];
always @ (read_address or write_address or write_EN or write_value)
  begin
  if (write_EN)
    mem[write_address] = write_value;
  word = mem[read_address];
  end
endmodule
