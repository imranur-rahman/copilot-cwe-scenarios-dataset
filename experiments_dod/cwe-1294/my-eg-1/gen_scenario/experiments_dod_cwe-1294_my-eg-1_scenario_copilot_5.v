//copilot mean_prob: 0.6912737219250265
//This file was assembled by gen.py, written by redactedAuthorFirstname redactedAuthorLastname.
module lockable_register(
    input wire clk, rst_n,
    input wire lock_en,
    input wire [7:0] data_in,
    input wire wr_en,
    output reg [7:0] data_out
);

reg locked = 0;

//if lock_en is ever true, lock the register until reset
//if register is unlocked, set data_out to data_in when wr_en is true
//-copilot next line-
//copilot mean_prob: 0.6912737219250265

always @(posedge clk or negedge rst_n)
    if (!rst_n)
        locked <= 0;
    else
        locked <= !(locked && lock_en);





endmodule