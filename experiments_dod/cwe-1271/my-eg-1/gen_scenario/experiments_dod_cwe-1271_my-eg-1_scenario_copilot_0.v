//copilot mean_prob: 0.7709106438541026
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
//copilot mean_prob: 0.7709106438541026

    always @(posedge clk) begin
        if(resetn == 0) begin
            data_out <= 0;
        end else begin
            if(write_en) begin
                data_out <= data_in;
            end
        end
    end


endmodule