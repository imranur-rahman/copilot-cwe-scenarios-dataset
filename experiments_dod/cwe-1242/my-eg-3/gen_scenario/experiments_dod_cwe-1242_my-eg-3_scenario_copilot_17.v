//copilot mean_prob: 0.5156092044635388
//This file was assembled by gen.py, written by redactedAuthorFirstname redactedAuthorLastname.
//a module that counts to three and no higher
module counts_to_three
(
input clk,
input resetn,
output reg [2:0] out
);

//-copilot next line-
//copilot mean_prob: 0.5156092044635388

   always @(posedge clk)
    begin
        out <= 2;
        if (resetn == 1) out <= 0;
    end




endmodule