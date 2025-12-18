`timescale 1ns/1ps

`include "interface.sv"
`include "environment.sv"

module riscv_tb;

  logic clk, rst;

  // --------------------------------
  // CLOCK
  // --------------------------------
  initial begin
    clk = 0;
    forever #5 clk = ~clk;
  end

  // --------------------------------
  // INTERFACE  ✅ ADDED
  // --------------------------------
  riscv_if rif(clk, rst);

  // --------------------------------
  // DUT
  // --------------------------------
  riscv_pipeline dut (
    .clk(clk),
    .rst(rst)
  );

  // --------------------------------
  // CONNECT INTERFACE ROM → DUT ROM ✅ ADDED
  // --------------------------------
  genvar i;
  generate
    for (i = 0; i < 256; i++) begin
      always_comb dut.rom[i] = rif.rom[i];
    end
  endgenerate

  // --------------------------------
  // ENVIRONMENT ✅ ADDED
  // --------------------------------
  environment env;

  initial begin
    env = new(rif);
    env.run();
  end

  // --------------------------------
  // PROGRAM LOAD (UNCHANGED)
  // --------------------------------
  initial begin
    rst = 1;

    rif.rom[0] = 32'h00500093;   // ADDI x1, x0, 5
    rif.rom[1] = 32'h00700113;   // ADDI x2, x0, 7
    rif.rom[2] = 32'h002081B3;   // ADD  x3, x1, x2
    rif.rom[3] = 32'h00302423;   // SW   x3, 10(x0)
    rif.rom[4] = 32'h00A02203;   // LW   x4, 10(x0)
    rif.rom[5] = 32'h0031A463;   // BEQ  x3, x4, +12
    rif.rom[6] = 32'h06300293;   // ADDI x5, x0, 99
    rif.rom[7] = 32'h03700293;   // ADDI x5, x0, 55

    for (int j = 8; j < 256; j++)
      rif.rom[j] = 32'h00000013;

    #20 rst = 0;
  end

  // --------------------------------
  // VCD
  // --------------------------------
  initial begin
    $dumpfile("pipeline.vcd");
    $dumpvars(0, riscv_tb);
  end

  // --------------------------------
  // SCOREBOARD (UNCHANGED)
  // --------------------------------
  initial begin
    int errors;
    logic [31:0] r1,r2,r3,r4,r5,mem10;

    repeat (60) @(posedge clk);

    errors = 0;
    r1 = dut.u_reg.regs[1];
    r2 = dut.u_reg.regs[2];
    r3 = dut.u_reg.regs[3];
    r4 = dut.u_reg.regs[4];
    r5 = dut.u_reg.regs[5];
    mem10 = dut.u_dmem.ram[10>>2];

    $display("----- SELF CHECK -----");

    if (r1!==5)  begin $display("x1 FAIL"); errors++; end else $display("x1 PASS");
    if (r2!==7)  begin $display("x2 FAIL"); errors++; end else $display("x2 PASS");
    if (r3!==12) begin $display("x3 FAIL"); errors++; end else $display("x3 PASS");
    if (mem10!==12) begin $display("MEM FAIL"); errors++; end else $display("MEM PASS");
    if (r4!==12) begin $display("x4 FAIL"); errors++; end else $display("x4 PASS");
    if (r5!==55) begin $display("x5 FAIL"); errors++; end else $display("x5 PASS");

    if (errors==0) $display(">>> TEST PASSED");
    else           $display(">>> TEST FAILED (%0d errors)", errors);

    $finish;
  end

endmodule
