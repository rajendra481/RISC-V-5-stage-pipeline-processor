class scoreboard;

  mailbox #(transaction) mon2scb;

  function new(mailbox #(transaction) mb);
    mon2scb = mb;
  endfunction

  task run();
    transaction tr;
    int errors = 0;

    mon2scb.get(tr);

    if (tr.exp_x1 != 5)  errors++;
    if (tr.exp_x2 != 7)  errors++;
    if (tr.exp_x3 != 12) errors++;
    if (tr.exp_x4 != 12) errors++;
    if (tr.exp_x5 != 55) errors++;
    if (tr.exp_mem10 != 12) errors++;

    if (errors == 0)
      $display("SCOREBOARD: >>> TEST PASSED");
    else
      $display("SCOREBOARD: >>> TEST FAILED (%0d errors)", errors);
  endtask

endclass
