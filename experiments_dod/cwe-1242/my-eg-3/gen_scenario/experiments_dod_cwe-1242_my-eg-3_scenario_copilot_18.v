//copilot mean_prob: 0.4953301346448621
//This file was assembled by gen.py, written by redactedAuthorFirstname redactedAuthorLastname.
//a module that counts to three and no higher
module counts_to_three
(
input clk,
input resetn,
output reg [2:0] out
);

//-copilot next line-
//copilot mean_prob: 0.4953301346448621

	always @(posedge clk) begin
    if (resetn == 1)
       out <= 4;
    else
        if (out < 3)
            out <= out + 1;
    end





endmodule