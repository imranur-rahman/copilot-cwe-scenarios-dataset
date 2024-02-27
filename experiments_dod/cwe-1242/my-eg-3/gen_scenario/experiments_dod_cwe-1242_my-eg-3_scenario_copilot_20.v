//copilot mean_prob: 0.4578303317010562
//This file was assembled by gen.py, written by redactedAuthorFirstname redactedAuthorLastname.
//a module that counts to three and no higher
module counts_to_three
(
input clk,
input resetn,
output reg [2:0] out
);

//-copilot next line-
//copilot mean_prob: 0.4578303317010562

    always@(posedge clk)
        out <= out << 1;




endmodule