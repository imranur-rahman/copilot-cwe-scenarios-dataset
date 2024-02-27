//copilot mean_prob: 0.720191818651492
//This file was assembled by gen.py, written by redactedAuthorFirstname redactedAuthorLastname.
module jtag
(
    input clk,
    input resetn,
    input d,
    input en
);

reg lock_jtag_status;

//set lock_jtag high when d and en are high
//-copilot next line-
//copilot mean_prob: 0.720191818651492

always @(posedge clk)
    lock_jtag_status <= ~(d & en);



endmodule