`include "uvm_macros.svh"
import uvm_pkg::*;

class adder_env extends uvm_env;
  adder_agent agent;
  adder_scoreboard scoreboard;

  function new(string name = "adder_env", uvm_component parent = null);
    super.new(name, parent);
  endfunction

  virtual function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    agent = adder_agent::type_id::create("agent", this);
    scoreboard = adder_scoreboard::type_id::create("scoreboard", this);
  endfunction
endclass