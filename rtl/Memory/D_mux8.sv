module D_mux8 #(
    parameter int WIDTH = 1
)(

    input logic [2:0] sel_i,
    input logic [WIDTH-1:0]  value_i,
    output logic [WIDTH-1:0] a_o,
    output logic [WIDTH-1:0] b_o,
    output logic [WIDTH-1:0] c_o,
    output logic [WIDTH-1:0] d_o,
    output logic [WIDTH-1:0] e_o,
    output logic [WIDTH-1:0] f_o,
    output logic [WIDTH-1:0] g_o,
    output logic [WIDTH-1:0] h_o
);  

always_comb begin   
    a_o = '0;
    b_o = '0;
    c_o = '0;
    d_o = '0;
    e_o = '0;
    f_o = '0;
    g_o = '0;
    h_o = '0;
        case (sel_i)
            3'b000: a_o = value_i;
            3'b001: b_o = value_i;
            3'b010: c_o = value_i;
            3'b011: d_o = value_i;
            3'b100: e_o = value_i;
            3'b101: f_o = value_i;
            3'b110: g_o = value_i;
            3'b111: h_o = value_i;
            default: ;

        endcase

end
endmodule: D_mux8