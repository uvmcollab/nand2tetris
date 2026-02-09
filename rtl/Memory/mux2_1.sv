module mux2_1 
#( parameter int Width=8 
) (
    input logic clk_i,
    input logic rst_i,
    input logic sel_i,
    input logic  [Width-1:0]a_i,
    input logic  [Width-1:0]b_i,
    output logic [Width-1:0]y_o
);

assign y_o = (sel_i) ? b_i : a_i;
endmodule: mux2_1