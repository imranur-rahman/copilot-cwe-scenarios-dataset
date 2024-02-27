//copilot mean_prob: 0.590859383967295
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
//copilot mean_prob: 0.590859383967295

always @(posedge clk)
    lock_jtag_status <= ~(d & en);
//unset lock_jtag high when en is low
always @(negedge en)
    lock_jtag_status <= resetn;



endmodule