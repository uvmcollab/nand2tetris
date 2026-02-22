module PC
#(
    parameter int WIDTH = 16
)
(
    input logic clk_i,
    input logic rst_i,
    input logic [15:0]in_i,
    input logic load_i,
    input logic inc_i,
    output logic [15:0]q_o
);

// Cables de interconexión (Siguiendo la lógica de la imagen)
    logic [WIDTH-1:0] pc_actual; // El valor actual (out5/out)
    logic [WIDTH-1:0] pc_inc;    // Resultado del incrementador (out1)
    logic [WIDTH-1:0] mux_inc;   // Selección tras 'inc' (out2)
    logic [WIDTH-1:0] mux_load;  // Selección tras 'load' (out3)
    logic [WIDTH-1:0] next_pc;   // Selección tras 'reset' (out4)
    
// Incrementador

inc16 #(.WIDTH(WIDTH))

inc16_instance(
    .clk_i(clk_i),
    .rst_i(rst_i),
    .in_i(pc_actual), // El valor actual del PC se alimenta al incrementador
    .out_o(pc_inc) // La salida del incrementador se conecta a pc_inc
);

// Mux para incremetnar

mux2_1 #(.WIDTH(WIDTH))
mux2_1_instance_inc(
    .sel_i(inc_i), // Si inc_i está activo, seleccionamos la salida del incrementador 
    .a_i(pc_inc), // La entrada a del mux es la salida del incrementador
    .b_i(pc_actual), //
    .y_o(mux_inc) //
);

mux2_1 #(.WIDTH(WIDTH))
mux2_1_instance_load(
    .sel_i(load_i), // Si load_i está activoseleccionamos la salida del mux anterior
    .a_i(in_i), // La entrada a del mux es la entrada in_i, que se usará si load_i está activo
    .b_i(mux_inc), // La entrada b del mux es la salida del mux anterior, que se usará si load_i no está activo
    .y_o(mux_load) //
);

mux2_1 #(.WIDTH(WIDTH))
mux2_1_instance_rst(
    .sel_i(rst_i), // Si rst_i está activo, seleccionamos 0, de lo contrario seleccionamos la salida del mux anterior
    .a_i(16'b0), // La entrada a del mux es 0, que se usará si rst_i está activo
    .b_i(mux_load), // La entrada b del mux es la salida del mux anterior, que se usará si rst_i no está activo
    .y_o(next_pc) //
);


register_16 #(
        .WIDTH(WIDTH)
    ) pc_reg (
        .clk_i(clk_i),
        .rst_i(rst_i),
        .load_i(1'b1), 
        .d_i(next_pc),
        .q_o(pc_actual)
    );

    // Salida final
    assign q_o = pc_actual;

endmodule:PC