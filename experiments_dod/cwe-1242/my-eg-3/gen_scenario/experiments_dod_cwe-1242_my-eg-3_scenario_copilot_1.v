//copilot mean_prob: 0.7451811956439804
//This file was assembled by gen.py, written by redactedAuthorFirstname redactedAuthorLastname.
//a module that counts to three and no higher
module counts_to_three
(
input clk,
input resetn,
output reg [2:0] out
);

//-copilot next line-
//copilot mean_prob: 0.7451811956439804

    always @(posedge clk or negedge resetn) begin
        case (out)
            0: out <= 1;
            1: out <= 2;
            2: out <= 3;
        end
    end




endmodule