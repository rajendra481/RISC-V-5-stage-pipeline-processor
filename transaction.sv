
class transaction;

  // Instruction info
  rand bit [31:0] instr;
  string instr_name;

  // Expected architectural state
  int exp_x1, exp_x2, exp_x3, exp_x4, exp_x5;
  int exp_mem10;

  function void display();
    $display("TRANS: %s instr=0x%08h", instr_name, instr);
  endfunction

endclass
