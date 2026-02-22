`ifndef VIF_IF_SV
`define VIF_IF_SV

interface vif_if(
    input logic clk_i
); 

  timeunit      1ns;
  timeprecision 100ps;
  parameter WIDTH = 16;
//  import config_pkg::*;

//FOR PC

    logic rst_i;
    logic [WIDTH-1:0] in_i;
    logic load_i;
    logic inc_i;
    logic [WIDTH-1:0] q_o;



// FOR RAM64
/*
    logic rst_i;
    logic [WIDTH-1:0] in_i;
    logic load_i;
    logic [13:0] address_i;
    logic [WIDTH-1:0] out_o;
*/

//FOR alu

    // logic rst_i;
    // logic [WIDTH-1:0] x_i;
    // logic [WIDTH-1:0] y_i;
    // logic zx_i;
    // logic nx_i;
    // logic zy_i;
    // logic ny_i;
    // logic f_i;
    // logic no_i;
    //  logic [WIDTH-1:0] out_o;
    //  logic zr_o;
    //  logic ng_o;



// FOr incrementer
/*
  logic rst_i;
  logic [WIDTH-1:0]in_i;
  logic [WIDTH-1:0]out_o;
*/

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
  // For PC
    output rst_i;
    output in_i;
    output load_i;
    output inc_i;
    input q_o;


    // For RAM64
    /*
    output rst_i;
    output in_i;
    output load_i;
    output address_i;
    input out_o;
*/
/* For alu
    output rst_i;
    output x_i;
    output y_i;
    output zx_i;
    output nx_i;
    output zy_i;
    output ny_i;
    output f_i;
    output no_i;
     input out_o;
     input zr_o;
     input ng_o;
     */
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