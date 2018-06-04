module decoder2 #parameter(bus_size = 5)
                    (input logic [1:0] select,
                    input logic [bus_size - 1:0] val_in,
                    output logic [bus_size - 1:0] line_1,
                    output logic [bus_size - 1:0] line_2);

always_comb begin
    case(select)
    0: line_1 = val_in;
    1: line_2 = val_in;
end
endmodule
