module adder_8bit(
  input logic [7:0] operand_a,
  input logic [7:0] operand_b,
  output logic [7:0] sum
);
  assign sum = operand_a + operand_b;
endmodule

