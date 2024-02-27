//copilot mean_prob: 0.6337205452106502
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
//copilot mean_prob: 0.6337205452106502

always @(posedge clk)
    if (resetn)
        lock_jtag_status <= 0;
    else
        lock_jtag_status <= ((lock_jtag_status) | (d & en))?1:0;



endmodule