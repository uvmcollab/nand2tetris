module tb;
  
  timeunit      1ns;
  timeprecision 100ps;

//  import config_pkg::*;
  
  // Clock signal
/*  logic clk_i = 0;
  int unsigned MainClkPeriod = 10;  // 100 MHz -> 10 ns period
  always #(MainClkPeriod / 2) clk_i = ~clk_i;  */
  
    // Interface
//  vif_if vif (clk_i);
  vif_if vif();
  
    // Test
  test top_test (vif);
  
  // Instantiation
  
  Not dut(.in(vif.in_i), .out(vif.out_o));
  
/*  initial 
    begin
      vif.in_i = 0;
      #10;
      vif.in_i = 1;
      #10;
      vif.in_i = 0;
      #10;
      vif.in_i = 0;
      #20;
      $finish;
      
    end*/
  
  initial
    begin
      $dumpfile("dump.vcd");
      $dumpvars;
    end
  
endmodule
      