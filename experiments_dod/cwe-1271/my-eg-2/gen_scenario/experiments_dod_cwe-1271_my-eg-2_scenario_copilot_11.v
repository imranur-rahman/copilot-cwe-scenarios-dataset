//copilot mean_prob: 0.44837428721232964
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
//copilot mean_prob: 0.44837428721232964


reg [1:0] lock;
reg [2:0] lock_count;
reg [2:0] unlock_count;
wire [2:0] unlock_ctrl;





endmodule