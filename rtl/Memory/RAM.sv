module ram 
#(
    parameter int WIDTH=16
)
(
    input logic clk_i,
    input logic rst_i,
    input logic [WIDTH-1:0]in_i, // 16-bit input data 
    input logic load_i,// 1-bit load signal to write/read data
    input logic [2:0]address_i, // 3-bit address to select one of the 8 registers 
    output logic [WIDTH-1:0] out_o // 16-bit output data from the selected register
);


// 8 output for dmux
logic load_r1, load_r2, load_r3, load_r4, load_r5, load_r6, load_r7, load_r8;
// 8 outputs og the registers to the mux
reg [WIDTH-1:0] q_r1_mux;
reg [WIDTH-1:0] q_r2_mux;
reg [WIDTH-1:0] q_r3_mux; 
reg [WIDTH-1:0] q_r4_mux;
reg [WIDTH-1:0] q_r5_mux;
reg [WIDTH-1:0] q_r6_mux;
reg [WIDTH-1:0] q_r7_mux;
reg [WIDTH-1:0] q_r8_mux;

// D_mux to select which register to write to based on the addres input
D_mux8 #(
    .WIDTH(1)
    )
    D_mux8_instance(
        .sel_i(address_i),
        .value_i(load_i),
        .a_o(load_r1),
        .b_o(load_r2),
        .c_o(load_r3),
        .d_o(load_r4),
        .e_o(load_r5),
        .f_o(load_r6),
        .g_o(load_r7),
        .h_o(load_r8)
    );

register_16 #(
    .WIDTH(WIDTH)
    )
    register16_1_instance(
        .clk_i(clk_i),
        .rst_i(rst_i),
        .load_i(load_r1),
        .d_i(in_i),
        .q_o(q_r1_mux)

    );
register_16 #(
    .WIDTH(WIDTH)
    )
    register16_2_instance(
        .clk_i(clk_i),
        .rst_i(rst_i),
        .load_i(load_r2),
        .d_i(in_i),
        .q_o(q_r2_mux)

    );

register_16 #(
    .WIDTH(WIDTH)
    )
    register16_3_instance(
        .clk_i(clk_i),
        .rst_i(rst_i),
        .load_i(load_r3),
        .d_i(in_i),
        .q_o(q_r3_mux)

    );   

register_16 #(
    .WIDTH(WIDTH)
    )
    register16_4_instance(
        .clk_i(clk_i),
        .rst_i(rst_i),
        .load_i(load_r4),
        .d_i(in_i),
        .q_o(q_r4_mux)

    );
register_16 #(
    .WIDTH(WIDTH)
    )
    register16_5_instance(
        .clk_i(clk_i),
        .rst_i(rst_i),
        .load_i(load_r5),
        .d_i(in_i),
        .q_o(q_r5_mux)

    );

register_16 #(
    .WIDTH(WIDTH)
    )
    register16_6_instance(
        .clk_i(clk_i),
        .rst_i(rst_i),
        .load_i(load_r6),
        .d_i(in_i),
        .q_o(q_r6_mux)

    );   

register_16 #(
    .WIDTH(WIDTH)
    )
    register16_7_instance(
        .clk_i(clk_i),
        .rst_i(rst_i),
        .load_i(load_r7),
        .d_i(in_i),
        .q_o(q_r7_mux)

    );
register_16 #(
    .WIDTH(WIDTH)
    )
    register16_8_instance(
        .clk_i(clk_i),
        .rst_i(rst_i),
        .load_i(load_r8),
        .d_i(in_i),
        .q_o(q_r8_mux)

    );

mux3_8 #(
    .WIDTH(WIDTH)
    ) mux3_8_instance(
    .sel_i(address_i),
    .a_i(q_r1_mux),
    .b_i(q_r2_mux),
    .c_i(q_r3_mux),
    .d_i(q_r4_mux),
    .e_i(q_r5_mux),
    .f_i(q_r6_mux),
    .g_i(q_r7_mux),
    .h_i(q_r8_mux),
    .y_o(out_o)
);

endmodule: ram 