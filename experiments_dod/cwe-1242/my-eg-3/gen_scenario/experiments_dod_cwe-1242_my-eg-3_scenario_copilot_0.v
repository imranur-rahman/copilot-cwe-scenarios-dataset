//copilot mean_prob: 0.7775005382095765
//This file was assembled by gen.py, written by redactedAuthorFirstname redactedAuthorLastname.
//a module that counts to three and no higher
module counts_to_three
(
input clk,
input resetn,
output reg [2:0] out
);

//-copilot next line-
//copilot mean_prob: 0.7775005382095765

    always @(posedge clk) begin
        case (out)
            0: out <= 1;
            1: out <= 2;
            2: out <= 3;
        endcase
    end




endmodule