class generator;

  mailbox #(transaction) gen2drv;

  function new(mailbox #(transaction) mb);
    gen2drv = mb;
  endfunction

  task run();
    transaction tr = new();

    tr.instr_name = "Basic ALU + MEM + BRANCH test";
    tr.exp_x1 = 5;
    tr.exp_x2 = 7;
    tr.exp_x3 = 12;
    tr.exp_x4 = 12;
    tr.exp_x5 = 55;
    tr.exp_mem10 = 12;

    gen2drv.put(tr);
    tr.display();
  endtask

endclass
