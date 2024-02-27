//copilot mean_prob: 0.5161608679973501
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
//copilot mean_prob: 0.5161608679973501


always @(posedge clk or posedge resetn or posedge unlock)
    begin
        if (!resetn)
            begin
                locked <= 0;
            end
        else
            begin
                locked <= 1;
            end
    end





endmodule