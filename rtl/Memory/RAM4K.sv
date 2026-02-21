module RAM4K
#(
    parameter int WIDHT=16
)
(
    input logic clk_i,
    input logic rst_i,
    input logic [WIDHT-1:0]in_i, // 16-bit input data 
    input logic load_i,// 1-bit load signal to write/read data
    input logic [11:0]address_i, // 12-bit address to select one of the 4096 registers
    output logic [WIDHT-1:0] out_o // 16-bit output data from the selected register

);

// 8 output for dmux to select which of the 8 RAMs to write to
logic load_ram1, load_ram2, load_ram3, load_ram4, load_ram5, load_ram6, load_ram7, load_ram8;
// 8 outputs for the RAM
logic [WIDHT-1:0] q_ram1_mux;
logic [WIDHT-1:0] q_ram2_mux;
logic [WIDHT-1:0] q_ram3_mux;
logic [WIDHT-1:0] q_ram4_mux;
logic [WIDHT-1:0] q_ram5_mux;
logic [WIDHT-1:0] q_ram6_mux;
logic [WIDHT-1:0] q_ram7_mux;
logic [WIDHT-1:0] q_ram8_mux;
// D_mux to select which register to write to based on the addres input
D_mux8 #(
    .WIDTH(1)
    )
    D_mux8_instance(
        .sel_i(address_i[11:9]), // los 3 bits mas significativos de la direccion se usan para seleccionar cual de las 8 RAMs se va a escribir
        .value_i(load_i), // ees de un bit porque solo definie si se carga o no, el registro se carga con el valor de in_i
        .a_o(load_ram1), // con la direccion del selector, se activa la señal de carga del registro correspondiente
        .b_o(load_ram2),
        .c_o(load_ram3),
        .d_o(load_ram4),
        .e_o(load_ram5),
        .f_o(load_ram6),
        .g_o(load_ram7),
        .h_o(load_ram8)
    );


RAM512 #(
    .WIDHT(WIDHT)
)//.puerto_del_hijo ( señal_del_padre )
RAM1_instance(
    .clk_i(clk_i),
    .rst_i(rst_i),
    .in_i(in_i), // todos los RAMs reciben el mismo valor de entrada, pero solo el que tenga su señal de carga activa se actualiza con ese valor
    .load_i(load_ram1), // solo la RAM seleccionada por el D_mux se actualiza con el valor de in_i
    .address_i(address_i[8:0]), // los 9 bits menos significativos de la direccion se usan para seleccionar cual de los 64 registros de la RAM se va a leer o escribir
    .out_o(q_ram1_mux) // la salida de cada RAM se conecta a un mux para seleccionar cual
);

RAM512 #(
    .WIDHT(WIDHT)
)//.puerto_del_hijo ( señal_del_padre )
RAM2_instance(
    .clk_i(clk_i),
    .rst_i(rst_i),
    .in_i(in_i), // todos los RAMs reciben el mismo valor de entrada, pero solo el que tenga su señal de carga activa se actualiza con ese valor
    .load_i(load_ram2), // solo la RAM seleccionada por el D_mux se actualiza con el valor de in_i
    .address_i(address_i[8:0]), // los 9 bits menos significativos de la direccion se usan para seleccionar cual de los 64 registros de la RAM se va a leer o escribir
    .out_o(q_ram2_mux) // la salida de cada RAM se conecta a un mux para seleccionar cual
);

RAM512 #(
    .WIDHT(WIDHT)
)//.puerto_del_hijo ( señal_del_padre )
RAM3_instance(
    .clk_i(clk_i),
    .rst_i(rst_i),
    .in_i(in_i), // todos los RAMs reciben el mismo valor de entrada, pero solo el que tenga su señal de carga activa se actualiza con ese valor
    .load_i(load_ram3), // solo la RAM seleccionada por el D_mux se actualiza con el valor de in_i
    .address_i(address_i[8:0]), // los 9 bits menos significativos de la direccion se usan para seleccionar cual de los 64 registros de la RAM se va a leer o escribir
    .out_o(q_ram3_mux) // la salida de cada RAM se conecta a un mux para seleccionar cual
);

RAM512 #(
    .WIDHT(WIDHT)
)//.puerto_del_hijo ( señal_del_padre )
RAM4_instance(
    .clk_i(clk_i),
    .rst_i(rst_i),
    .in_i(in_i), // todos los RAMs reciben el mismo valor de entrada, pero solo el que tenga su señal de carga activa se actualiza con ese valor
    .load_i(load_ram4), // solo la RAM seleccionada por el D_mux se actualiza con el valor de in_i
    .address_i(address_i[8:0]), // los 9 bits menos significativos de la direccion se usan para seleccionar cual de los 64 registros de la RAM se va a leer o escribir
    .out_o(q_ram4_mux) // la salida de cada RAM se conecta a un mux para seleccionar cual
);

RAM512 #(
    .WIDHT(WIDHT)
)//.puerto_del_hijo ( señal_del_padre )
RAM5_instance(
    .clk_i(clk_i),
    .rst_i(rst_i),
    .in_i(in_i), // todos los RAMs reciben el mismo valor de entrada, pero solo el que tenga su señal de carga activa se actualiza con ese valor
    .load_i(load_ram5), // solo la RAM seleccionada por el D_mux se actualiza con el valor de in_i
    .address_i(address_i[8:0]), // los 9 bits menos significativos de la direccion se usan para seleccionar cual de los 64 registros de la RAM se va a leer o escribir
    .out_o(q_ram5_mux) // la salida de cada RAM se conecta a un mux para seleccionar cual
);

RAM512 #(
    .WIDHT(WIDHT)
)//.puerto_del_hijo ( señal_del_padre )
RAM6_instance(
    .clk_i(clk_i),
    .rst_i(rst_i),
    .in_i(in_i), // todos los RAMs reciben el mismo valor de entrada, pero solo el que tenga su señal de carga activa se actualiza con ese valor
    .load_i(load_ram6), // solo la RAM seleccionada por el D_mux se actualiza con el valor de in_i
    .address_i(address_i[8:0]), // los 9 bits menos significativos de la direccion se usan para seleccionar cual de los 64 registros de la RAM se va a leer o escribir
    .out_o(q_ram6_mux) // la salida de cada RAM se conecta a un mux para seleccionar cual
);

RAM512 #(
    .WIDHT(WIDHT)
)//.puerto_del_hijo ( señal_del_padre )
RAM7_instance(
    .clk_i(clk_i),
    .rst_i(rst_i),
    .in_i(in_i), // todos los RAMs reciben el mismo valor de entrada, pero solo el que tenga su señal de carga activa se actualiza con ese valor
    .load_i(load_ram7), // solo la RAM seleccionada por el D_mux se actualiza con el valor de in_i
    .address_i(address_i[8:0]), // los 9 bits menos significativos de la direccion se usan para seleccionar cual de los 64 registros de la RAM se va a leer o escribir
    .out_o(q_ram7_mux) // la salida de cada RAM se conecta a un mux para seleccionar cual
);

RAM512 #(
    .WIDHT(WIDHT)
)//.puerto_del_hijo ( señal_del_padre )
RAM8_instance(
    .clk_i(clk_i),
    .rst_i(rst_i),
    .in_i(in_i), // todos los RAMs reciben el mismo valor de entrada, pero solo el que tenga su señal de carga activa se actualiza con ese valor
    .load_i(load_ram8), // solo la RAM seleccionada por el D_mux se actualiza con el valor de in_i
    .address_i(address_i[8:0]), // los 9 bits menos significativos de la direccion se usan para seleccionar cual de los 64 registros de la RAM se va a leer o escribir
    .out_o(q_ram8_mux) // la salida de cada RAM se conecta a un mux para seleccionar cual
);      


// Mux para seleccionar cual de las 8 RAMs se va a leer, con los bits 3 bits mas significativos de la direccion igual que lo fuerno con el demux para seleccionar la misma RAM para escribir, se selecciona la misma RAM para leer

mux3_8 #(
    .WIDTH(WIDHT)
)
mux3_8_instance(
    .sel_i(address_i[11:9]), // los 3 bits mas significativos de la direccion se usan para seleccionar cual de las 8 RAMs se va a leer
    .a_i(q_ram1_mux), // la salida de cada RAM se conecta a un mux para seleccionar cual registro se va a leer que es el que se selecciona con los 3 bits menos significativos de la direccion
    .b_i(q_ram2_mux),
    .c_i(q_ram3_mux),
    .d_i(q_ram4_mux),
    .e_i(q_ram5_mux),
    .f_i(q_ram6_mux),
    .g_i(q_ram7_mux),
    .h_i(q_ram8_mux),
    .y_o(out_o)
);


endmodule: RAM4K