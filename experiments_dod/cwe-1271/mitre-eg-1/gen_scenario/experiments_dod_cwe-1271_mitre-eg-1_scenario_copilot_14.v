//copilot mean_prob: 0.517201249925492
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
//copilot mean_prob: 0.517201249925492

reg [2:0] lock_jtag_status_val;
always @(posedge clk)
begin
    if(d==1 && en==1)
        lock_jtag_status_val <= lock_jtag_status_val + 1;
    else
        lock_jtag_status_val <= 0;
end



endmodule