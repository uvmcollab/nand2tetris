module test (
    vif_if vif
);
  // =================== DPI FUNCTIONS ==================== //
//  import "DPI-C" function real ref_model(real initial_value);

  // ================== GLOBAL VARIABLES ================== //

//  import config_pkg::*;

  // =================== MAIN SEQUENCE ==================== //

  initial begin
    // Initial values
    $display("Begin Of Simulation.");
 //   get_config_args();
    
    // Apply reset
    reset();

fork
    // Stimulus
    begin
   // send_data_port_a();

    // for ALu
  //  send_data_alu();;

    send_data_in();


    // test for RAM
   // send_data_port_in();

   // test for mux and adder
  //  send_data_port_a_random();
  //  send_data_port_b_random();
  //  send_data_port_carry_random();
   // send_data_port_sel_random();*/
  //  send_data_dff();
    end

    begin
          send_data_load();

    end

    begin
          send_data_inc();
    end

   // begin
// //   // Load send_data_dff for RAM
   //   send_data_load();
   // end
////
   // begin
// //   // adress send_data_address FOR RAM
   //    send_data_address();
   //  send_data_address();
   // end

    begin 
    // Monitor
    monitor_output();
    end

join_any
    // Drain time
    #(100ns);
    $display("End Of Simulation at %0t.", $realtime);
    $finish;
  end


  // ======================= TASKS ======================== //

  task automatic reset();
  // FOR incrementer
  vif.rst_i = 1'b1;
  vif.in_i = 16'b0;
  vif.load_i = 1'b0;
  vif.inc_i = 1'b0;
  // FOR RAM
  /*
    vif.rst_i = 'd1;
    vif.in_i = 'd0;
    vif.load_i = 'd0;
    vif.address_i = 'd0;
    */
    /*// for alu
    vif.x_i = 'd0;
    vif.y_i = 'd0;
    vif.zx_i = 1'b0;
    vif.nx_i = 1'b0;
    vif.zy_i = 1'b0;
    vif.ny_i = 1'b0;
    vif.f_i = 1'b0;
    vif.no_i = 1'b0;
    */
    //for incre
    //vif.in_i = 'd0;
    //for ram 
    //vif.in_i = 'd0;
    //vif.load_i = 'd0;
    //vif.address_i = 'd0;
  //for adder 
    //vif.a_i = 8'b0;
    //vif.b_i = 8'b0;
    //vif.carry_i = 1'b0;
    //for mux2_1
   // vif.sel_i = 1'b0;
    repeat (5) @(vif.cb);
    vif.cb.rst_i <= 1'b0;
  endtask : reset


  // task automatic send_data_port_a();
  // //Initial Values
  //     repeat (1) @(vif.cb);
  //   vif.cb.a_i <= 8'b1;
  //   repeat (1) @(vif.cb);
  //      vif.cb.a_i <= 'd4;

  // endtask : send_data_port_a

//    task automatic send_data_port_a_random();
//   for (int i = 0; i < 5; i++) begin 
//     vif.cb.a_i <= 'd52215;
//      @(vif.cb);
//   end
//     endtask: send_data_port_a_random

//    task automatic send_data_port_b_random();
//   for (int i = 0; i < 5; i++) begin 
//     vif.cb.b_i <= 'd39218;
//     @(vif.cb);
//   end
//     endtask: send_data_port_b_random

// task automatic send_data_port_carry_random();
//     @(vif.cb);
//     vif.cb.carry_i <= $urandom_range(0,1);


//     endtask: send_data_port_carry_random


//   task automatic send_data_port_sel_random();
//  for (int i = 0; i < 5; i++) begin 
//     @(vif.cb);
//    vif.cb.sel_i <= $urandom_range(0,1);
//    end
//    endtask: send_data_port_sel_random 

//task automatic send_data_dff();
//    @(vif.cb); vif.cb.in_i <= 'd7;   // Ciclo 1: Escribimos 7
//    @(vif.cb); vif.cb.in_i <= 'd2;   // Ciclo 2: Escribimos 2
//    @(vif.cb); vif.cb.in_i <= 'd3;   // Ciclo 3: E
//    @(vif.cb); vif.cb.in_i <= 'd99;  // Ciclo 4: 
//  endtask: send_data_dff 
//

////////// FOR RAM

/*
  task automatic send_data_load();
    @(vif.cb); vif.cb.load_i <= 'd1; // Ciclo 1: On Modo escritura
    @(vif.cb); vif.cb.load_i <= 'd1; // Ciclo 2: On
    @(vif.cb); vif.cb.load_i <= 'd0; // Ciclo 3: Off
    @(vif.cb); vif.cb.load_i <= 'd0; // Ciclo 4: Off (Modo lectura )
    @(vif.cb); vif.cb.load_i <= 'd1; // Ciclo 5: on (Modo escritura )
    @(vif.cb); vif.cb.load_i <= 'd0; // Ciclo 6: Off (Modo lectura )
    @(vif.cb); vif.cb.load_i <= 'd1; // Ciclo 7: on (Modo escritura )
    @(vif.cb); vif.cb.load_i <= 'd0; // Ciclo 8: Off (Modo lectura )
    @(vif.cb); vif.cb.load_i <= 'd1; // Ciclo 9: on (Modo escritura ) PRUEBA RAM512
    @(vif.cb); vif.cb.load_i <= 'd0; // Ciclo 10: Off (Modo lectura )
    @(vif.cb); vif.cb.load_i <= 'd1; // Ciclo 9: on (Modo escritura ) PRUEBA RAM4k
    @(vif.cb); vif.cb.load_i <= 'd0; // Ciclo 10: Off (Modo lectura )

    @(vif.cb); vif.cb.load_i <= 'd1; // Ciclo 9: on (Modo escritura ) PRUEBA RAM16k
    @(vif.cb); vif.cb.load_i <= 'd0; // Ciclo 10: Off (Modo lectura )
  endtask : send_data_load

  task automatic send_data_address();
    @(vif.cb); vif.cb.address_i <= 'd3; // Ciclo 1: Escribe en Dir 3
    @(vif.cb); vif.cb.address_i <= 'd3; // Ciclo 2: Escribe en Dir 3
    @(vif.cb); vif.cb.address_i <= 'd3; // Ciclo 3: Leer de Dir 3
    @(vif.cb); vif.cb.address_i <= 'd2; // Ciclo 4: Leer de Dir 2
    @(vif.cb); vif.cb.address_i <= 'd2; // Ciclo 5: Escribir en Dir 2
    @(vif.cb); vif.cb.address_i <= 'd3; // Ciclo 6: Leer de Dir 3
    @(vif.cb); vif.cb.address_i <= 'd63; // Ciclo 7: Escribir en Dir 64
    @(vif.cb); vif.cb.address_i <= 'd63; // Ciclo 8: Leer de Dir 64
    @(vif.cb); vif.cb.address_i <= 'd511; // Ciclo 9: Escribir en Dir 512
    @(vif.cb); vif.cb.address_i <= 'd511; // Ciclo 10: Leer de Dir 512
    @(vif.cb); vif.cb.address_i <= 'd4095; // Ciclo 9: Escribir en Dir 4095 = 4k-1
    @(vif.cb); vif.cb.address_i <= 'd4095; // Ciclo 10: Leer de Dir 4095 = 4k-1

    @(vif.cb); vif.cb.address_i <= 'd16383; // Ciclo 9: Escribir en Dir 16383 = 16k-1
    @(vif.cb); vif.cb.address_i <= 'd16383; // Ciclo 10: Leer de Dir 16383 = 16k-1
  endtask : send_data_address


// 1 Escribe
// 0 Lee


 task automatic send_data_port_in();
 @(vif.cb);vif.cb.in_i <= 16'b1110_1111_1111_1111;   // Ciclo 1: Escribimos 7
 @(vif.cb);vif.cb.in_i <= 16'b1110_1111_1111_1111;   // Ciclo 2: Escribimos 7
 @(vif.cb);vif.cb.in_i <= 16'b1110_1111_1111_1111;   // Ciclo 3: Leemos 7
 @(vif.cb);vif.cb.in_i <= 16'b1110_1111_1111_1111;   // Ciclo 4: Leemos 7
 @(vif.cb);vif.cb.in_i <= 16'b1110_1111_1111_1110;   // Ciclo 5: Escribimos 6
 @(vif.cb);vif.cb.in_i <= 16'b1110_1111_1111_1110;   // Ciclo 6: Leemos 0
 @(vif.cb);vif.cb.in_i <= 16'b1110_1111_1111_1110;   // Ciclo 7: Escribimos 0
 @(vif.cb);vif.cb.in_i <= 16'b1110_1111_1111_1111;   // Ciclo 8: Leemos 7
 @(vif.cb);vif.cb.in_i <= 16'b1110_0000_1111_0000;   // Ciclo 9: Escribimos en dir 512
 @(vif.cb);vif.cb.in_i <= 16'b1110_1111_1111_1111;   // Ciclo 10: Leemos en dir 512

 @(vif.cb);vif.cb.in_i <= 16'b0000_1010_1010_0000;   // Ciclo 10: Escribimos en dir 4095 = 4k-1
 @(vif.cb);vif.cb.in_i <= 16'b0000_1010_1111_1111;   // Ciclo 10: Leemos en dir 4095 = 4k-1

 @(vif.cb);vif.cb.in_i <= 16'b0111_1110_0111_1110;   // Ciclo 10: Escribimos en dir 16383 = 16k-1
 @(vif.cb);vif.cb.in_i <= 16'b0011_1100_0011_1100;   // Ciclo 10: Leemos en dir 16383 = 16k-1

 endtask: send_data_port_in
*/


// task automatic send_data_alu();
//     @(vif.cb);
//     vif.cb.x_i <= 'd1;
//     vif.cb.y_i <= 'd5;
//     // BAnderas de control para ALU
//     vif.cb.zx_i <= 1'b0; // No zero x elige la entrada x
//     vif.cb.nx_i <= 1'b1; // No negate x no niega la entrada x
//     vif.cb.zy_i <= 1'b0; // No zero y elige la entrada y
//     vif.cb.ny_i <= 1'b0; //  No negate y
//     vif.cb.f_i <= 1'b1;  // Function: Add =1
//     vif.cb.no_i <= 1'b1; // No negate output
//  @(vif.cb);
// endtask: send_data_alu

task automatic send_data_in();
    @(vif.cb);
    vif.cb.in_i <= 16'b0000_0000_0001_0000;   // Ciclo 1: Escribimos
        @(vif.cb);
endtask: send_data_in  

task automatic send_data_load();
    @(vif.cb);
    vif.cb.load_i <= 1'b0; // Cargamos el valor de in_i en el PC
     repeat(3) @(vif.cb);
        vif.cb.load_i <= 1'b1; // Cargamos el valor de in_i en el PC
          @(vif.cb);
        vif.cb.load_i <= 1'b0; // Cargamos el valor de in_i en el PC

endtask: send_data_load

task automatic send_data_inc();
    @(vif.cb);
    vif.cb.inc_i <= 1'b1; // Incrementamos el valor del PC
      @(vif.cb);
endtask: send_data_inc

task automatic monitor_output();
forever begin 
  @(vif.cb);
  $display("[INFO:Gate PC]: %8t: Reset = %1b, In = %b, Load = %b, Inc = %1b, Out = %b", 
            $realtime, vif.rst_i , vif.in_i, vif.load_i, vif.inc_i, vif.q_o);


end

// 1 Escribe
// 0 Lee

endtask: monitor_output



endmodule : test