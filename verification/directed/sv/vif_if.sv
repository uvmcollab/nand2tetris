`ifndef VIF_IF_SV
`define VIF_IF_SV

interface vif_if(
    input logic clk_i
); 

  timeunit      1ns;
  timeprecision 100ps;
  parameter WIDTH = 16;
//  import config_pkg::*;


// FOr incrementer
  logic rst_i;
  logic [WIDTH-1:0]in_i;
  logic [WIDTH-1:0]out_o;


// For adder

/*logic rst_i;
logic [WIDTH-1:0] a_i;
logic [WIDTH-1:0] b_i;
logic carry_i;
logic [WIDTH-1:0] sum_o;
logic carry_o;
*/

// For D Flip-flop
/*
logic rst_i;
logic [WIDTH-1:0]in_i;
logic load_i;
logic [2:0]address_i;
logic [WIDTH-1:0]out_o;*/

//For mux2_1 
/*
logic rst_i;
logic sel_i;
logic [WIDTH-1:0] a_i;
logic [WIDTH-1:0] b_i;
logic [WIDTH-1:0] y_o;*/



// For gate NOT
 /* logic rst_i;
  logic [WIDTH-1:0] a_i;
  logic [WIDTH-1:0] y_o;*/


  clocking cb @(posedge clk_i);
    default input #1ns output #1ns;

    output rst_i;
    output in_i;
    input out_o;
  /*  output rst_i;
    output sel_i;
    output a_i;
    output b_i;
    input y_o;
    output rst_i;
    output a_i;
    output b_i;
    output carry_i;
    input sum_o;
    input carry_o;*/
  endclocking


endinterface : vif_if

`endif // VIF_IF_SV