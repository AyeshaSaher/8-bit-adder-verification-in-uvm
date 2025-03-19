`include "uvm_macros.svh"
import uvm_pkg::*;

class adder_sequencer extends uvm_sequencer #(adder_seq_item);
  function new(string name = "adder_sequencer", uvm_component parent = null);
    super.new(name, parent);
  endfunction
endclass
