`include "adder_if.sv"
`include "adder_8bit.sv"

module testbench;
  logic clk; 
  adder_if adder_intf(clk); 

  
  adder_8bit adder1 (
    .operand_a(adder_intf.operand_a), 
    .operand_b(adder_intf.operand_b),
    .sum(adder_intf.sum)
  );

  
  initial begin
    clk = 0;
    forever #5 clk = ~clk;
  end

 
  initial begin
    $dumpfile("dump.vcd");    
    $dumpvars;               

    
    adder_intf.operand_a = 8'd10;
    adder_intf.operand_b = 8'd20;
    #10;

    adder_intf.operand_a = 8'd15;
    adder_intf.operand_b = 8'd25;
    #10;

    $stop; 
  end
endmodule

