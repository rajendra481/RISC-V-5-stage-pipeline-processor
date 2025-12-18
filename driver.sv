class driver;

  mailbox #(transaction) gen2drv;
  virtual riscv_if vif;

  function new(mailbox #(transaction) mb, virtual riscv_if vif);
    gen2drv = mb;
    this.vif = vif;
  endfunction

  task run();
    transaction tr;
    gen2drv.get(tr);

    // Load program
    vif.rom[0] = 32'h00500093; // ADDI x1, x0, 5
    vif.rom[1] = 32'h00700113; // ADDI x2, x0, 7
    vif.rom[2] = 32'h002081B3; // ADD  x3, x1, x2
    vif.rom[3] = 32'h00302423; // SW   x3, 10(x0)
    vif.rom[4] = 32'h00A02203; // LW   x4, 10(x0)
    vif.rom[5] = 32'h0031A463; // BEQ  x3, x4
    vif.rom[6] = 32'h06300293; // ADDI x5, x0, 99
    vif.rom[7] = 32'h03700293; // ADDI x5, x0, 55

    $display("DRIVER: Program loaded");
  endtask

endclass
