
module c_not #(
  parameter int Width = 16
)(   

    input logic [Width-1:0] a_i,
    output logic [Width-1:0] y_o
);


 assign y_o = ~a_i;

endmodule: c_not