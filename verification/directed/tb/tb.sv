module tb;
  
  timeunit      1ns;
  timeprecision 100ps;

//  import config_pkg::*;
  
  // Clock signal
  logic clk_i = 0;
  int unsigned MainClkPeriod = 10;  // 100 MHz -> 10 ns period
  always #(MainClkPeriod / 2) clk_i = ~clk_i; 
  parameter int WIDTH = 16;
    // Interface
  vif_if vif (clk_i);
//  vif_if vif();
  
    // Test
  test top_test (vif);
  
  // Instantiation
  
  alu #(
    .WIDTH(WIDTH)
    )
  dut (
      .clk_i(clk_i), 
      .rst_i(vif.rst_i), 
      .x_i(vif.x_i), 
      .y_i(vif.y_i),
      .zx_i(vif.zx_i),
      .nx_i(vif.nx_i),  
      .zy_i(vif.zy_i),
      .ny_i(vif.ny_i),
      .f_i(vif.f_i),
      .no_i(vif.no_i),
      .out_o(vif.out_o),
      .zr_o(vif.zr_o),
      .ng_o(vif.ng_o)
      /*.a_i(vif.a_i),
      .b_i(vif.b_i),
      .carry_i(vif.carry_i),
      .sum_o(vif.sum_o),
      .carry_o(vif.carry_o)*/
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
      