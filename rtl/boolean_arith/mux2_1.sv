module mux2_1 
#( parameter int WIDTH=16
) (

    input logic sel_i,
    input logic  [WIDTH-1:0]a_i,
    input logic  [WIDTH-1:0]b_i,
    output logic [WIDTH-1:0]y_o
);

assign y_o = (sel_i) ? a_i : b_i;
endmodule: mux2_1