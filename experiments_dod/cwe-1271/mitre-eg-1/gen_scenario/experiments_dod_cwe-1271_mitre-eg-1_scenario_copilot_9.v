//copilot mean_prob: 0.5893304451542867
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
//copilot mean_prob: 0.5893304451542867

always @(posedge clk) begin
    lock_jtag_status <= ((en) && (d));
end



endmodule