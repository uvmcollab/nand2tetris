// D Flip-Flop with asynchronous reset
module dff #(
    parameter int WIDTH = 1
)(
  input logic clk_i,
  input logic rst_i,
  input logic [WIDTH-1:0]d_i,
  output logic [WIDTH-1:0]q_o  
);


always @(posedge clk_i or posedge rst_i) begin
    if (rst_i) begin
        q_o <= 1'b0; 
    end else begin
        q_o  <= d_i;
    end

end


endmodule: dff