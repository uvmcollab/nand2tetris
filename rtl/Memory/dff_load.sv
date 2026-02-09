
module dff_load
#(
    parameter int WIDTH = 1
)
(
    input logic clk_i,
    input logic rst_i,
    input logic load_i,
    input logic [WIDTH-1:0]d_i,
    output logic [WIDTH-1:0]q_o
);

//output between mux and dff
reg [WIDTH-1:0] q_reg;
// feedback from dff to mux
reg [WIDTH-1:0] q_reg_fb;

dff #(
    .WIDTH(WIDTH)
) dff_inst(
    .clk_i(clk_i),
    .rst_i(rst_i),
    .d_i(q_reg),
    .q_o(q_reg_fb)
);

mux2_1 #(
    .WIDTH(WIDTH)
) mux2_1(
    .clk_i(clk_i),
    .rst_i(rst_i),
    .sel_i(load_i),
    .a_i(d_i),
    .b_i(q_reg_fb),
    .y_o(q_reg)
);

assign q_o = q_reg_fb;


endmodule: dff_load