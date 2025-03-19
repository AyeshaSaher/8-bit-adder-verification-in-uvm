`include "uvm_macros.svh"
import uvm_pkg::*;

class adder_seq_item extends uvm_sequence_item;
  rand bit [7:0] operand_a;
  rand bit [7:0] operand_b;
  bit [8:0] sum;

  function new(string name = "adder_seq_item");
    super.new(name);
  endfunction

  `uvm_object_utils(adder_seq_item)
endclass
