`include "uvm_macros.svh"
`include "adder_if.sv" // Include your interface

class adder_driver extends uvm_driver #(adder_seq_item); // Assuming adder_seq_item is your sequence item
  `uvm_component_utils(adder_driver)

  virtual adder_if vif; // Declare the virtual interface

  function new(string name = "adder_driver", uvm_component parent = null);
    super.new(name, parent);
  endfunction

  // This function drives the DUT
  task run_phase(uvm_phase phase);
    adder_seq_item seq_item; // Create a sequence item

    forever begin
      // Get the next item from the sequence
      seq_item = adder_seq_item::type_id::create("seq_item");
      // Assuming you have a sequencer that gives you sequence items
      seq_item.randomize(); // Randomize the sequence item for this example
      vif.operand_a <= seq_item.operand_a;
      vif.operand_b <= seq_item.operand_b;
      // Wait for a clock edge, if necessary
      @(posedge vif.clk);
    end
  endtask
endclass