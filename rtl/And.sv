
module And (
  input in,
  output out);
  
  nand n1(out, in, in);
  
endmodule