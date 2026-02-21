module mux3_4 #(
    parameter int WIDTH = 16
)(

    input logic [1:0] sel_i,
    input logic [WIDTH-1:0] a_i,
    input logic [WIDTH-1:0] b_i,
    input logic [WIDTH-1:0] c_i,
    input logic [WIDTH-1:0] d_i,
    output logic [WIDTH-1:0] y_o
);

always_comb begin
        case (sel_i)
            2'b00: y_o = a_i;
            2'b01: y_o = b_i;
            2'b10: y_o = c_i;
            2'b11: y_o = d_i;
            default: y_o = '0;
        endcase
end

endmodule: mux3_4