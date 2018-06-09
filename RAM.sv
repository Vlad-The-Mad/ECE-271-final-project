module RAM (input logic write_EN,
            input logic read_rddisEN,
            input logic [15:0] read_address,
            input logic [15:0] write_address,
            input logic [15:0] write_value,
            output logic [15:0] word);
            logic [9:0] reduced_read_address;
            logic [9:0] reduced_write_address;
logic [15:0] mem [1023:0];
initial begin
  $readmemb("RAM_input.txt", mem);
end
always @ (read_address or write_address or write_value or write_EN or read_rddisEN) begin
  if (read_rddisEN == 0) begin
    reduced_read_address = read_address[9:0];
    reduced_write_address = write_address[9:0];
  end
  if (write_EN)
    mem[reduced_write_address] = write_value;
  word <= mem[reduced_read_address];
end
endmodule
