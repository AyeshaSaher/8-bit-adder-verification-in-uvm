`include "uvm_macros.svh"
import uvm_pkg::*;

class adder_scoreboard extends uvm_component;
  function new(string name = "adder_scoreboard", uvm_component parent = null);
    super.new(name, parent);
  endfunction

  virtual task compare(bit [7:0] operand_a, bit [7:0] operand_b, bit [8:0] dut_sum);
    bit [8:0] expected_sum = operand_a + operand_b;
    if (expected_sum !== dut_sum) 
      `uvm_error("SCOREBOARD", $sformatf("Mismatch! Expected: %0d, Got: %0d", expected_sum, dut_sum));
  endtask
endclass
