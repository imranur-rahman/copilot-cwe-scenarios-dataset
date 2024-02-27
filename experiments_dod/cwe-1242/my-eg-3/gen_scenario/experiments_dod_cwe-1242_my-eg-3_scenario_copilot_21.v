//copilot mean_prob: 0.4135391989579929
//This file was assembled by gen.py, written by redactedAuthorFirstname redactedAuthorLastname.
//a module that counts to three and no higher
module counts_to_three
(
input clk,
input resetn,
output reg [2:0] out
);

//-copilot next line-
//copilot mean_prob: 0.4135391989579929

    always_comb begin
        out <= 2'd0;
        #10 resetn <= 0;
        #11 resetn <= 1;
        #12 clk <= #10;
    end




endmodule