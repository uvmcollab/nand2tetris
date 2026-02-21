module RAM16k #(
    parameter int WIDHT=16
)
(
    input logic clk_i,
    input logic rst_i,
    input logic [WIDHT-1:0]in_i, // 16-bit input data 
    input logic load_i,// 1-bit load signal to write/read data
    input logic [13:0]address_i, // 13-bit address to select one of the 16384 registers
    output logic [WIDHT-1:0] out_o // 16-bit output data from the selected register

);
// 8 output for dmux to select which of the 8 RAMs to write to
logic load_ram1, load_ram2, load_ram3, load_ram4;
// 8 outputs for the RAM
logic [WIDHT-1:0] q_ram1_mux;
logic [WIDHT-1:0] q_ram2_mux;
logic [WIDHT-1:0] q_ram3_mux;
logic [WIDHT-1:0] q_ram4_mux;

// D_mux to select which register to write to based on the addres input
D_mux4 #(
    .WIDTH(1)
    )
    D_mux4_instance(
        .sel_i(address_i[13:12]), // los 2 bits mas significativos para seleccionar cual de las 4 RAMs se va a escribir, porque recordemos que duplicamos 4 veces el RAM4k para hacer el RAM16k
        .value_i(load_i), // ees de un bit porque solo definie si se carga o no, el registro se carga con el valor de in_i
        .a_o(load_ram1), // con la direccion del selector, se activa la señal de carga del registro correspondiente
        .b_o(load_ram2),
        .c_o(load_ram3),
        .d_o(load_ram4)
    );

RAM4k #(
    .WIDHT(WIDHT)
)//.puerto_del_hijo ( señal_del_padre )
RAM1_instance(
    .clk_i(clk_i),
    .rst_i(rst_i),
    .in_i(in_i), // todos los RAMs reciben el mismo valor de entrada, pero solo el que tenga su señal de carga activa se actualiza con ese valor
    .load_i(load_ram1), // solo la RAM seleccionada por el D_mux se actualiza con el valor de in_i
    .address_i(address_i[11:0]), // los 12 bits menos significativos de la direccion se usan para seleccionar cual de los 64 registros de la RAM se va a leer o escribir
    .out_o(q_ram1_mux) // la salida de cada RAM se conecta a un mux para seleccionar cual
);

RAM4k #(
    .WIDHT(WIDHT)
)//.puerto_del_hijo ( señal_del_padre )
RAM2_instance(
    .clk_i(clk_i),
    .rst_i(rst_i),
    .in_i(in_i), // todos los RAMs reciben el mismo valor de entrada, pero solo el que tenga su señal de carga activa se actualiza con ese valor
    .load_i(load_ram2), // solo la RAM seleccionada por el D_mux se actualiza con el valor de in_i
    .address_i(address_i[11:0]), // los 12 bits menos significativos de la direccion se usan para seleccionar cual de los 64 registros de la RAM se va a leer o escribir
    .out_o(q_ram2_mux) // la salida de cada RAM se conecta a un mux para seleccionar cual
);

RAM4k #(
    .WIDHT(WIDHT)
)//.puerto_del_hijo ( señal_del_padre )
RAM3_instance(
    .clk_i(clk_i),
    .rst_i(rst_i),
    .in_i(in_i), // todos los RAMs reciben el mismo valor de entrada, pero solo el que tenga su señal de carga activa se actualiza con ese valor
    .load_i(load_ram3), // solo la RAM seleccionada por el D_mux se actualiza con el valor de in_i
    .address_i(address_i[11:0]), // los 12 bits menos significativos de la direccion se usan para seleccionar cual de los 64 registros de la RAM se va a leer o escribir
    .out_o(q_ram3_mux) // la salida de cada RAM se conecta a un mux para seleccionar cual
);

RAM4k #(
    .WIDHT(WIDHT)
)//.puerto_del_hijo ( señal_del_padre )
RAM4_instance(
    .clk_i(clk_i),
    .rst_i(rst_i),
    .in_i(in_i), // todos los RAMs reciben el mismo valor de entrada, pero solo el que tenga su señal de carga activa se actualiza con ese valor
    .load_i(load_ram4), // solo la RAM seleccionada por el D_mux se actualiza con el valor de in_i
    .address_i(address_i[11:0]), // los 12 bits menos significativos de la direccion se usan para seleccionar cual de los 64 registros de la RAM se va a leer o escribir
    .out_o(q_ram4_mux) // la salida de cada RAM se conecta a un mux para seleccionar cual
);


// Mux para seleccionar la salida de la RAM que se va a leer
mux3_4 #(
    .WIDTH(WIDHT)
)
mux3_4_instance(
    .sel_i(address_i[13:12]), // los 2 bits mas significativos para seleccionar cual de las 4 RAMs se va a escribir, porque recordemos que duplicamos 4 veces el RAM4k para hacer el RAM16k
    .a_i(q_ram1_mux), // la salida de cada RAM se conecta a un mux para seleccionar cual registro se va a leer que es el que se selecciona con los 3 bits menos significativos de la direccion
    .b_i(q_ram2_mux),
    .c_i(q_ram3_mux),
    .d_i(q_ram4_mux),
    .y_o(out_o)
);


endmodule: RAM16k