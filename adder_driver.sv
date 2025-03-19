`include "uvm_macros.svh"
import uvm_pkg::*;

class adder_driver extends uvm_driver #(adder_seq_item);
  virtual adder_if vif;

  function new(string name = "adder_driver", uvm_component parent = null);
    super.new(name, parent);
  endfunction

  virtual function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    if (!uvm_config_db#(virtual adder_if)::get(this, "", "vif", vif))
      `uvm_fatal("DRIVER", "Virtual interface not found");
  endfunction

  virtual task run_phase(uvm_phase phase);
    forever begin
      adder_seq_item seq_item;
      seq_item_port.get_next_item(seq_item);

      vif.operand_a <= seq_item.operand_a;
      vif.operand_b <= seq_item.operand_b;
      @(posedge vif.clk);
      seq_item.sum = vif.sum;

      seq_item_port.item_done();
    end
  endtask
endclass
