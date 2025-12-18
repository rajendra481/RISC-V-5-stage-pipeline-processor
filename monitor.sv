class monitor;

  virtual riscv_if vif;

  function new(virtual riscv_if vif);
    this.vif = vif;
  endfunction

  task run();
    repeat (10) @(posedge vif.clk);
    $display("MONITOR: Simulation running, no DUT peeking");
  endtask

endclass
