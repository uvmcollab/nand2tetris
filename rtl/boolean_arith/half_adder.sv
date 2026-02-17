
module half_adder
#(
    parameter int WIDTH = 1
)
(
    input logic clk_i,
    input logic rst_i,
    input logic  [WIDTH-1:0]a_i,
    input logic  [WIDTH-1:0]b_i,
    output logic [WIDTH-1:0]sum_o,
    output logic [WIDTH-1:0]carry_o
);

always @(posedge clk_i or posedge rst_i) begin
    if(rst_i) begin
        sum_o <= 1'b0;
        carry_o <= 1'b0;
    end else begin
        
        sum_o <= a_i ^ b_i; // XOR operation for sum
        carry_o <= a_i & b_i; // AND operation for carry
    end

end



endmodule: half_adder