//copilot mean_prob: 0.5536410081290519
//This file was assembled by gen.py, written by redactedAuthorFirstname redactedAuthorLastname.
module power_on_lock
(
input wire clk,
input wire resetn,
input wire unlock,
output reg locked
);

//this lock register is locked (1) upon power on / resetn signal
//it is unlocked (set to 0) upon receiving the unlock signal
//-copilot next line-
//copilot mean_prob: 0.5536410081290519

always @(posedge clk or negedge resetn)
if (resetn)
locked <= 0;
else
locked <= locked || !unlock;





endmodule