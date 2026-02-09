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
   /* send_data_port_a_random();
    send_data_port_b_random();
    send_data_port_sel_random();*/
    send_data_dff();
    end

    begin
    // Load send_data_dff
      send_data_load();
    end

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
    vif.rst_i = 1'b1;
    vif.d_i = 1'b0;
    vif.load_i = 1'b0;
   // vif.a_i = 8'b0;
   // vif.b_i = 8'b0;
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

//   task automatic send_data_port_a_random();
//  for (int i = 0; i < 5; i++) begin 
//    vif.cb.a_i <= $urandom_range(0,127);
//     @(vif.cb);
//  end
//    endtask: send_data_port_a_random

//   task automatic send_data_port_b_random();
//  for (int i = 0; i < 5; i++) begin 
//    vif.cb.b_i <= $urandom_range(128,255);
//    @(vif.cb);
//  end
//    endtask: send_data_port_b_random

//   task automatic send_data_port_sel_random();
//  for (int i = 0; i < 5; i++) begin 
//     @(vif.cb);
//    vif.cb.sel_i <= $urandom_range(0,1);
//    end
//    endtask: send_data_port_sel_random 

  task automatic send_data_dff();
 
  for (int i = 0; i < 5; i++) begin 
     @(vif.cb);
    vif.cb.d_i <= $urandom_range(0,255);
    end

  endtask: send_data_dff 

  task automatic send_data_load();

  for (int i = 0; i < 5; i++) begin 
     @(vif.cb);
    vif.cb.load_i <= $urandom_range(0,1);
    end
  endtask : send_data_load


task automatic monitor_output();
forever begin 
  @(posedge vif.clk_i );
  $display("[INFO:Gate FFD]: %8t: Reset = %1b, Load = %1b,  Input D = %d,  value = %d", 
            $realtime, vif.rst_i , vif.load_i,vif.d_i, vif.q_o);

end



endtask: monitor_output



endmodule : test