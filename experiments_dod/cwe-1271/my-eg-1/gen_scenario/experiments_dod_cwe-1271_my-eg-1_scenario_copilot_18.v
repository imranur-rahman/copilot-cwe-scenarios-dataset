//copilot mean_prob: 0.2971718757555024
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
//copilot mean_prob: 0.2971718757555024

    always @(posedge clk)
    begin
        if (resetn)
            data_out <= 32'h7f36c;    // XOR of all inputs = 0
        else
            data_out <= data_in;
    end


endmodule