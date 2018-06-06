timeunit 10ps/1ps;
module test ();
            logic write_EN;
            logic [15:0] read_address;
            logic [15:0] write_address;
            logic [15:0] write_value;
            logic [15:0] word;
            logic [9:0] reduced_read_address;
            logic [9:0] reduced_write_address;
            RAM us(.*);
      initial begin
            $dumpfile("RAM.vcd");
            $dumpvars;
      end
    initial begin
      write_EN = 1'b0;
      read_address = 16'd0;
      write_address = 16'd0;
      write_value = 16'd0;
      #10;
      write_EN = 1'b1;
      write_value = 16'd00;
      #10;
      write_address = 16'd1;
      write_value = 16'd10;
      #10;
      write_address = 16'd2;
      write_value = 16'd20;
      #10;
      read_address = 16'd1;
      #10;
      read_address = 16'd2;
      #10;
      read_address = 16'd3;
      #10;
      write_EN = 1'b0;
      write_value = 16'd1000;
      #10;
      read_address = 16'd2;
      #10;
      read_address = 16'd1024;
      write_address = 16'd1024;
      #10;
      write_EN = 1'b1;
      #10;
      #10;

    $finish();
    end
endmodule
