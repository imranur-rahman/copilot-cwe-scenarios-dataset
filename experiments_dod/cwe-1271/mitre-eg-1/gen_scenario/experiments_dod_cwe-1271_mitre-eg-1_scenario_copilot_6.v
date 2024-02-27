//copilot mean_prob: 0.6215491884987131
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
//copilot mean_prob: 0.6215491884987131

//set lock_jtag low when d or en is low
always @(posedge clk) begin
    lock_jtag_status <= d && en;
end



endmodule