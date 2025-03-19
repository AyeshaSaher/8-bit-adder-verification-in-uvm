`include "uvm_macros.svh"
import uvm_pkg::*;

class adder_monitor extends uvm_component;
  virtual adder_if vif;

  function new(string name = "adder_monitor", uvm_component parent = null);
    super.new(name, parent);
  endfunction

  virtual function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    if (!uvm_config_db#(virtual adder_if)::get(this, "", "vif", vif))
      `uvm_fatal("MONITOR", "Virtual interface not found");
  endfunction

  virtual task run_phase(uvm_phase phase);
    forever begin
      @(posedge vif.clk);
      `uvm_info("MONITOR", $sformatf("Operands: %0d + %0d = %0d", 
                  vif.operand_a, vif.operand_b, vif.sum), UVM_LOW);
    end
  endtask
endclass
