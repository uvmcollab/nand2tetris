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
   // test for mux
    send_data_port_a_random();
    send_data_port_b_random();
    send_data_port_carry_random();
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
    #(50ns);
    $display("End Of Simulation at %0t.", $realtime);
    $finish;
  end


  // ======================= TASKS ======================== //

  task automatic reset();
    vif.rst_i = 'd1;
    //vif.in_i = 'd0;
    //vif.load_i = 'd0;
    //vif.address_i = 'd0;

    vif.a_i = 8'b0;
    vif.b_i = 8'b0;
    vif.carry_i = 1'b0;
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

   task automatic send_data_port_a_random();
  for (int i = 0; i < 5; i++) begin 
    vif.cb.a_i <= 'd52215;
     @(vif.cb);
  end
    endtask: send_data_port_a_random

   task automatic send_data_port_b_random();
  for (int i = 0; i < 5; i++) begin 
    vif.cb.b_i <= 'd39218;
    @(vif.cb);
  end
    endtask: send_data_port_b_random

task automatic send_data_port_carry_random();
    @(vif.cb);
    vif.cb.carry_i <= $urandom_range(0,1);


    endtask: send_data_port_carry_random


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
task automatic monitor_output();
forever begin 
  @(posedge vif.clk_i);
  $display("[INFO:Gate ADDER]: %8t: Reset = %1b, A = %d, B = %d, Carry entrada = %1b, suma = %d, carry salida = %1b", 
            $realtime, vif.rst_i , vif.a_i, vif.b_i, vif.carry_i, vif.sum_o, vif.carry_o);

end

// 1 Escribe
// 0 Lee

endtask: monitor_output



endmodule : test