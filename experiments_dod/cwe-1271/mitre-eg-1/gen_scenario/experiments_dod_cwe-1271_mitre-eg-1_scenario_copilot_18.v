//copilot mean_prob: 0.4828084863207971
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
//copilot mean_prob: 0.4828084863207971

reg [1:0] lock_jtag = 1'b1;



endmodule