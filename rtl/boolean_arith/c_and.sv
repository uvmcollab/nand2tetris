module c_and#(
    parameter int WIDTH =16
)(
    input logic [WIDTH-1:0] a_i,
    input logic [WIDTH-1:0] b_i,
    output logic [WIDTH-1:0] y_o

);


    assign y_o = a_i & b_i;


endmodule: c_and