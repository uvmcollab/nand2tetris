module inc16
#(
    parameter int WIDTH = 16
)
(
    input logic clk_i,
    input logic rst_i,
    input logic [WIDTH-1:0]in_i, // 16-bit input data 
    output logic [WIDTH-1:0]out_o // 16-bit output data 
);

logic carry_not;
adder16 adder16_inst(
    .clk_i(clk_i),
    .rst_i(rst_i),
    .a_i(in_i),
    .b_i(16'h0001), // 16-bit constant value 1
    .carry_i(1'b0), // No initial carry
    .sum_o(out_o),
    .carry_o(carry_not)
);

endmodule: inc16