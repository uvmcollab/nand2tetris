module full_adder 

(
    input logic clk_i,
    input logic rst_i,
    input logic  a_i,
    input logic  b_i,
    input logic  carry_i,
    output logic  sum_o,
    output logic carry_o
);


always_comb begin //(posedge clk_i or posedge rst_i) begin
 //   if(rst_i) begin
 //       sum_o <= 1'b0;
        carry_o <= 1'b0;
  //  end   else begin
        sum_o <= (a_i ^ b_i) ^ carry_i;
        carry_o <= (a_i & b_i) | ((a_i | b_i) & carry_i);

//    end

end
endmodule : full_adder