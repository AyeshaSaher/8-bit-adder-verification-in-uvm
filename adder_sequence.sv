`include "uvm_macros.svh"
import uvm_pkg::*;

class adder_sequence extends uvm_sequence #(adder_seq_item);
  function new(string name = "adder_sequence");
    super.new(name);
  endfunction

  virtual task body();
    adder_seq_item seq_item;
    seq_item = adder_seq_item::type_id::create("seq_item");
    if (!seq_item.randomize()) begin
      `uvm_error("RANDOMIZE", "Randomization failed")
    end
    start_item(seq_item);
    finish_item(seq_item);
  endtask
endclass
