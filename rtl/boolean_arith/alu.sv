module alu 
#(
    parameter int WIDTH= 16
)
(
    input logic clk_i,
    input logic rst_i,
    input logic [WIDTH-1:0] x_i, // Entrada a
    input logic [WIDTH-1:0] y_i, // Entrada b
    input logic zx_i, // Si zx_i es 1, entonces la entrada x se reemplaza por 0
    input logic nx_i, // Si nx_i es 1, entonces la entrada x se niega (NOT)
    input logic zy_i, // Si zy_i es 1, entonces la entrada y se reemplaza por 0 sino se mantiene 
    input logic ny_i, // Si ny_i es 1, entonces la entrada y se niega (NOT) sino se mantiene
    input logic f_i, // Si f_i es 1, entonces se realiza la suma (ADD) de las entradas procesadas, si es 0 se realiza la operación AND entre las entradas procesadas
    input logic no_i, // Si no_i es 1, entonces la salida de la ALU se niega (NOT), si es 0 se mantiene sin cambios
    output logic [WIDTH-1:0] out_o, // Salida de la ALU después de aplicar las operaciones seleccionadas por los bits de control
    output logic zr_o, // Si zr_o es 1, entonces la salida de la ALU es cero (0), si es 0 la salida no es cero
    output logic ng_o // Si ng_o es 1, entonces la salida de la ALU es negativa (el bit más significativo es 1), si es 0 la salida no es negativa
);

// Procesamiento de X
logic [WIDTH-1:0] x_zx;
logic [WIDTH-1:0] x_nx;
logic [WIDTH-1:0] x_out;

// Procesamiento de Y
logic [WIDTH-1:0] y_zy;
logic [WIDTH-1:0] y_ny;
logic [WIDTH-1:0] y_out;

logic carry_ext;

// Salida de la ALU y AND

logic [WIDTH-1:0] out_add;
logic [WIDTH-1:0] out_and;

// SAlida ,multiplexada entre suma y and
logic [WIDTH-1:0] out_mux;

// Salida final de la alu (sunma y and) después de pasar por un not si no_i es 1
logic [WIDTH-1:0] out_final;

// Salida Final
logic [WIDTH-1:0] final_out;

mux2_1 #(.WIDTH(WIDTH)
    )
    mux2_1_insta( 
    .a_i(16'h0000), // 16-bit constant value 0
    .b_i(x_i), // 16-bit constant value 0
    .sel_i(zx_i), // si el selector es 1 se evalua la entrada a
    .y_o(x_zx)    
);

c_not #(.Width(WIDTH)
    )
    c_not_insta(
    .a_i(x_zx),
    .y_o(x_nx)    
);

mux2_1 #(.WIDTH(WIDTH)
    )
    mux2_1_insta2( 
    .a_i(x_nx), // 16-bit constant value 0
    .b_i(x_zx), // 16-bit constant value 0
    .sel_i(nx_i),
    .y_o(x_out)    
);

mux2_1 #(.WIDTH(WIDTH)
    )
    mux2_1_insta3( 
    .a_i(16'h0000), // 16-bit constant value 0
    .b_i(y_i), // 16-bit constant value 0
    .sel_i(zy_i),
    .y_o(y_zy)    
);

c_not #(.Width(WIDTH)
    )
    c_not_insta2(
    .a_i(y_zy),
    .y_o(y_ny)    
);

mux2_1 #(.WIDTH(WIDTH)
)
    mux2_1_insta4(
        .a_i(y_ny), // 16-bit constant value 0
        .b_i(y_zy),
        .sel_i(ny_i),
        .y_o(y_out)
    );

// calcular suma o and

adder16 #(.WIDTH(WIDTH))
    adder16_insta(

    .clk_i(clk_i),
    .rst_i(rst_i),
    .a_i(x_out),
    .b_i(y_out),
    .carry_i(1'b0),
    .sum_o(out_add),
    .carry_o(carry_ext)
    );

c_and #(.WIDTH(WIDTH))
    c_and_insta(
        .a_i(x_out),
        .b_i(y_out),
        .y_o(out_and)
    );

mux2_1 #(.WIDTH(WIDTH))
    mux2_1_insta5(
        .a_i(out_add),
        .b_i(out_and),
        .sel_i(f_i),
        .y_o(out_mux)

    );

c_not #(.Width(WIDTH))
    c_not_insta3(
        .a_i(out_mux),
        .y_o(out_final)
    );

mux2_1 #(.WIDTH(WIDTH))
    mux2_1_insta6(
        .a_i(out_final),
        .b_i(out_mux),
        .sel_i(no_i),
        .y_o(final_out)
    );

    assign out_o = final_out;
    assign ng_o =final_out[15]; // El bit más significativo indica si el número es negativo
    assign zr_o = (final_out =='d0); // Si el resultado es cero, zr_o se activa


endmodule:alu