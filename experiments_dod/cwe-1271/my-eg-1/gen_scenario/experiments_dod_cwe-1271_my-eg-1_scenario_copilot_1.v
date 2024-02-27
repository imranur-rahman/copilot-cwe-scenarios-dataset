//copilot mean_prob: 0.7500600491178384
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
//copilot mean_prob: 0.7500600491178384

  always @(posedge clk) begin
    if(resetn == 1) begin
      data_out <= 32'd0;
    end else begin
      if(write_en == 1) begin
        data_out <= data_out << 16'd0;
      end
    end
  end


endmodule