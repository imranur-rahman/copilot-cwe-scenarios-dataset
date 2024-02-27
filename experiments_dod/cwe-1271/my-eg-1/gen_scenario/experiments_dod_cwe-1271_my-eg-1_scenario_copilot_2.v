//copilot mean_prob: 0.693206387955346
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
//copilot mean_prob: 0.693206387955346

    always @(posedge clk, negedge resetn)
    begin
        if (resetn == 1)
            data_out <= 32'b0;
        else
            if (write_en == 1)
                data_out <= data_in;
    end


endmodule