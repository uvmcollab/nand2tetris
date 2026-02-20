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
    send_data_alu();;


    // test for incrementer
   // send_data_port_in();

   // test for mux and adder
  //  send_data_port_a_random();
  //  send_data_port_b_random();
  //  send_data_port_carry_random();
   // send_data_port_sel_random();*/
  //  send_data_dff();
    end

//    begin
//    // Load send_data_dff
//      send_data_load();
//    end
//
//    begin
//    // adress send_data_address
//      send_data_address();
//    end

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
    vif.rst_i = 'd1;
    // for alu
    vif.x_i = 'd0;
    vif.y_i = 'd0;
    vif.zx_i = 1'b0;
    vif.nx_i = 1'b0;
    vif.zy_i = 1'b0;
    vif.ny_i = 1'b0;
    vif.f_i = 1'b0;
    vif.no_i = 1'b0;
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
//  task automatic send_data_load();
//    @(vif.cb); vif.cb.load_i <= 'd1; // Ciclo 1: On Moso escritura
//    @(vif.cb); vif.cb.load_i <= 'd1; // Ciclo 2: On
//    @(vif.cb); vif.cb.load_i <= 'd0; // Ciclo 3: Off
//    @(vif.cb); vif.cb.load_i <= 'd0; // Ciclo 4: Off (Modo lectura )
//  endtask : send_data_load
//
//  task automatic send_data_address();
//    @(vif.cb); vif.cb.address_i <= 'd3; // Ciclo 1: Escribe en Dir 3
//    @(vif.cb); vif.cb.address_i <= 'd3; // Ciclo 2: Escribe en Dir 3
//    @(vif.cb); vif.cb.address_i <= 'd1; // Ciclo 3: 
//    @(vif.cb); vif.cb.address_i <= 'd2; // Ciclo 4: 
//  endtask : send_data_address
//

// 1 Escribe
// 0 Lee

// task for incrementer

// task automatic send_data_port_in();
// @(vif.cb);
// vif.cb.in_i <= 'd0;   // Ciclo 1: Escribimos 7

// endtask: send_data_port_in


task automatic send_data_alu();
    @(vif.cb);
    vif.cb.x_i <= 'd1;
    vif.cb.y_i <= 'd5;
    // BAnderas de control para ALU
    vif.cb.zx_i <= 1'b0; // No zero x elige la entrada x
    vif.cb.nx_i <= 1'b1; // No negate x no niega la entrada x
    vif.cb.zy_i <= 1'b0; // No zero y elige la entrada y
    vif.cb.ny_i <= 1'b0; //  No negate y
    vif.cb.f_i <= 1'b1;  // Function: Add =1
    vif.cb.no_i <= 1'b1; // No negate output
 @(vif.cb);
endtask: send_data_alu

task automatic monitor_output();
forever begin 
  @(vif.cb);
  $display("[INFO:Gate ALU]: %8t: Reset = %1b, X = %b, Y = %b, Zx = %1b, Zy = %1b, Nx = %1b, Ny = %1b, F = %1b, No = %1b, Out = %b , Zr = %1b, Ng = %1b", 
            $realtime, vif.rst_i , vif.x_i, vif.y_i, vif.zx_i, vif.zy_i, vif.nx_i, vif.ny_i, vif.f_i, vif.no_i, vif.out_o, vif.zr_o, vif.ng_o);


end

// 1 Escribe
// 0 Lee

endtask: monitor_output



endmodule : test