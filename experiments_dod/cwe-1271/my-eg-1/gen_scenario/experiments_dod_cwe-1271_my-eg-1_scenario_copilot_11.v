//copilot mean_prob: 0.5109634349714184
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
//copilot mean_prob: 0.5109634349714184


always @ (posedge clk)
   if (~resetn)
      data_out <= 0;


endmodule