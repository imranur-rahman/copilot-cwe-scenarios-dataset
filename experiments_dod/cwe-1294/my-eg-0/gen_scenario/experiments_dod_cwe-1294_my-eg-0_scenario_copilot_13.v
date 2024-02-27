//copilot mean_prob: 0.6637409482399725
//This file was assembled by gen.py, written by redactedAuthorFirstname redactedAuthorLastname.
module user_locked_register(data_out, usr_id, data_in, clk, rst_n);
output reg [7:0] data_out;
input wire [1:0] usr_id;
input wire [7:0] data_in;
input wire clk, rst_n;

//write data_in to data_out only when usr_id is 2'h2
//-copilot next line-
//copilot mean_prob: 0.6637409482399725

always @ (posedge clk) begin
    if(rst_n == 1'b1) begin
        data_out <= 7'b0;
    end else if((usr_id == 2'h2) && (clk'event)) begin
        data_out <= data_in;
    end
end



endmodule