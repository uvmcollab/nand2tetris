module tb;
  
  timeunit      1ns;
  timeprecision 100ps;

//  import config_pkg::*;
  
  // Clock signal
  logic clk_i = 0;
  int unsigned MainClkPeriod = 10;  // 100 MHz -> 10 ns period
  always #(MainClkPeriod / 2) clk_i = ~clk_i; 
  
    // Interface
  vif_if vif (clk_i);
//  vif_if vif();
  
    // Test
  test top_test (vif);
  
  // Instantiation
  
  dff_load #(
    .WIDTH(8)
    )
  dut (
      .clk_i(clk_i), 
      .rst_i(vif.rst_i), 
      .load_i(vif.load_i),
      .d_i(vif.d_i),
      .q_o(vif.q_o)
    );


  
  initial
    begin
      $dumpfile("dump.vcd");
      $dumpvars;
    end
  
   initial begin
    $timeformat(-9, 1, "ns", 10);
  end
endmodule
      