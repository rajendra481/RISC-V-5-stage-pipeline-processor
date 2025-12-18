`include "transaction.sv"
`include "generator.sv"
`include "driver.sv"
`include "monitor.sv"
`include "scoreboard.sv"

class environment;

  monitor mon;
  virtual riscv_if vif;

  function new(virtual riscv_if vif);
    this.vif = vif;
    mon = new(vif);
  endfunction

  task run();
    mon.run();
  endtask

endclass
