interface riscv_if (input logic clk, rst);

  // --------------------------------------------------
  // DUT CONNECTION
  // --------------------------------------------------
  // We keep only what TB needs to access.
  // Instruction memory is accessed by DRIVER.
  // Registers and memory are observed by MONITOR.
  // --------------------------------------------------

  // Instruction memory (ROM)
  logic [31:0] rom [0:255];

  // --------------------------------------------------
  // Modports
  // --------------------------------------------------

  // Driver: writes instructions
  modport DRV (
    input  clk, rst,
    output rom
  );

  // Monitor: observes architectural state
  modport MON (
    input  clk, rst
  );

endinterface
