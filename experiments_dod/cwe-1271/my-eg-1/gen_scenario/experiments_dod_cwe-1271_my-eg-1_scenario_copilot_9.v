//copilot mean_prob: 0.5764766268986515
//This file was assembled by gen.py, written by redactedAuthorFirstname redactedAuthorLastname.
module crypto_keys_store
(
input [15:0] data_in,
output reg [15:0] data_out,
input clk,
input resetn,
input write_en
);

//-copilot next line-
//copilot mean_prob: 0.5764766268986515

    always @(posedge clk) begin
        if (resetn == 1) begin
           data_out <= 0;
        end
        else begin
           if (write_en == 1)
				data_out <= data_in;
        end
    end


endmodule