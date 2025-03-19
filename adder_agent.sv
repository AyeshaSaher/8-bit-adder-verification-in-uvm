
`include "uvm_macros.svh"
`include "uvm_macros.svh"
import uvm_pkg::*;

class adder_agent extends uvm_component;
  adder_driver driver;
  adder_monitor monitor;
  adder_sequencer sequencer;

  function new(string name = "adder_agent", uvm_component parent = null);
    super.new(name, parent);
  endfunction

  virtual function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    driver = adder_driver::type_id::create("driver", this);
    monitor = adder_monitor::type_id::create("monitor", this);
    sequencer = adder_sequencer::type_id::create("sequencer", this);
  endfunction



virtual function void connect_phase(uvm_phase phase);
  super.connect_phase(phase);

 
  driver.vif = vif; 
  monitor.vif = vif; 

 
  driver.seq_item_port.connect(sequencer.seq_item_export);
endfunction
