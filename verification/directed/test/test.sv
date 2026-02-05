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
//    reset();

    // Stimulus
    tt();
    
  /*  fork
      begin
        normal(debounce_time);
        bounce(debounce_time, iterations);
      end

      begin
        check_db_tick();
      end
    join*/

    // Drain time
    #(100ns);
    $display("End Of Simulation.");
    $finish;
  end


  // ======================= TASKS ======================== //

/*  task automatic reset();
    vif.rst_i = 1'b1;
    vif.sw_i  = 1'b0;
    repeat (2) @(vif.cb);
    vif.cb.rst_i <= 1'b0;
    repeat (20) @(vif.cb);
  endtask : reset*/


  task automatic tt();
    vif.in_i = 0;
      #10ns;
      vif.in_i = 1;
      #10ns;
      vif.in_i = 0;
      #10ns;
      vif.in_i = 0;
      #10ns;
      vif.in_i = 0;
      #10ns;
      vif.in_i = 0;
  endtask : tt





endmodule : test