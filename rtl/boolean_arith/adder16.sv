module adder16
#(
    parameter int WIDTH = 16
)
(
    input logic clk_i,
    input logic rst_i,
    input logic  [WIDTH-1:0]a_i,
    input logic  [WIDTH-1:0]b_i,
    input logic  carry_i,
    output logic [WIDTH-1:0] sum_o,
    output logic carry_o
);

logic ca1, ca2, ca3, ca4, ca5, ca6, ca7, ca8, ca9, ca10, ca11, ca12, ca13, ca14, ca15;
full_adder 
full_adder_inst_1(
    .clk_i(clk_i),
    .rst_i(rst_i),
    .a_i(a_i[0]),
    .b_i(b_i[0]),
    .carry_i(carry_i),
    .sum_o(sum_o[0]),
    .carry_o(ca1)
);

full_adder   full_adder_inst_2(
    .clk_i(clk_i),
    .rst_i(rst_i),
    .a_i(a_i[1]),
    .b_i(b_i[1]),
    .carry_i(ca1),
    .sum_o(sum_o[1]),
    .carry_o(ca2)
);

full_adder   full_adder_inst_3(
    .clk_i(clk_i),
    .rst_i(rst_i),
    .a_i(a_i[2]),
    .b_i(b_i[2]),
    .carry_i(ca2),
    .sum_o(sum_o[2]),
    .carry_o(ca3)
);

full_adder   full_adder_inst_4(
    .clk_i(clk_i),
    .rst_i(rst_i),
    .a_i(a_i[3]),
    .b_i(b_i[3]),
    .carry_i(ca3),
    .sum_o(sum_o[3]),
    .carry_o(ca4)
);

full_adder   full_adder_inst_5(
    .clk_i(clk_i),
    .rst_i(rst_i),
    .a_i(a_i[4]),
    .b_i(b_i[4]),
    .carry_i(ca4),
    .sum_o(sum_o[4]),
    .carry_o(ca5)
);

full_adder   full_adder_inst_6(
 	.clk_i(clk_i), 
 	.rst_i(rst_i), 
 	.a_i(a_i[5]), 
 	.b_i(b_i[5]), 
 	.carry_i(ca5), 
 	.sum_o(sum_o[5]), 
 	.carry_o(ca6)

);

full_adder   full_adder_inst_7(
 	.clk_i(clk_i), 
 	.rst_i(rst_i), 
 	.a_i(a_i[6]), 
 	.b_i(b_i[6]), 
 	.carry_i(ca6), 
 	.sum_o(sum_o[6]), 
 	.carry_o(ca7)
);

full_adder   full_adder_inst_8(
 	.clk_i(clk_i), 
 	.rst_i(rst_i), 
 	.a_i(a_i[7]), 
 	.b_i(b_i[7]), 
 	.carry_i(ca7), 
 	.sum_o(sum_o[7]), 
 	.carry_o(ca8)

);

full_adder    full_adder_inst_9(
  	.clk_i(clk_i), 
  	.rst_i(rst_i), 
  	.a_i(a_i[8]), 
  	.b_i(b_i[8]), 
  	.carry_i(ca8), 
  	.sum_o(sum_o[8]), 
  	.carry_o(ca9)
);

full_adder    full_adder_inst_10(
  	.clk_i(clk_i), 
  	.rst_i(rst_i), 
  	.a_i(a_i[9]), 
  	.b_i(b_i[9]), 
  	.carry_i(ca9), 
  	.sum_o(sum_o[9]), 
  	.carry_o(ca10)
);

full_adder    full_adder_inst_11(
  	.clk_i(clk_i), 
  	.rst_i(rst_i), 
  	.a_i(a_i[10]), 
  	.b_i(b_i[10]), 
  	.carry_i(ca10), 
  	.sum_o(sum_o[10]), 
  	.carry_o(ca11)
);

full_adder    full_adder_inst_12(
  	.clk_i(clk_i), 
  	.rst_i(rst_i), 
  	.a_i(a_i[11]), 
  	.b_i(b_i[11]), 
  	.carry_i(ca11), 
  	.sum_o(sum_o[11]), 
  	.carry_o(ca12)
);

full_adder    full_adder_inst_13(
  	.clk_i(clk_i), 
  	.rst_i(rst_i), 
  	.a_i(a_i[12]), 
  	.b_i(b_i[12]), 
  	.carry_i(ca12), 
  	.sum_o(sum_o[12]), 
  	.carry_o(ca13)
);

full_adder    full_adder_inst_14(
  	.clk_i(clk_i), 
  	.rst_i(rst_i), 
  	.a_i(a_i[13]), 
  	.b_i(b_i[13]), 
  	.carry_i(ca13), 
  	.sum_o(sum_o[13]), 
  	.carry_o(ca14)
);

full_adder    full_adder_inst_15(
  	.clk_i(clk_i), 
  	.rst_i(rst_i), 
  	.a_i(a_i[14]), 
  	.b_i(b_i[14]), 
  	.carry_i(ca14), 
  	.sum_o(sum_o[14]), 
  	.carry_o(ca15)
);

full_adder    full_adder_inst_16(
  	.clk_i(clk_i), 
  	.rst_i(rst_i), 
  	.a_i(a_i[15]), 
  	.b_i(b_i[15]), 
  	.carry_i(ca15), 
  	.sum_o(sum_o[15]), 
  	.carry_o(carry_o)
);



endmodule: adder16