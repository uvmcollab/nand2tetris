module D_mux4 #(
    parameter int WIDTH = 1
)(

    input logic [1:0] sel_i,
    input logic [WIDTH-1:0]  value_i,
    output logic [WIDTH-1:0] a_o,
    output logic [WIDTH-1:0] b_o,
    output logic [WIDTH-1:0] c_o,
    output logic [WIDTH-1:0] d_o
);  

always_comb begin   
    a_o = '0;
    b_o = '0;
    c_o = '0;
    d_o = '0;
        case (sel_i)
            2'b00: a_o = value_i;
            2'b01: b_o = value_i;
            2'b10: c_o = value_i;
            2'b11: d_o = value_i;
            default: ;

        endcase

end
endmodule: D_mux4