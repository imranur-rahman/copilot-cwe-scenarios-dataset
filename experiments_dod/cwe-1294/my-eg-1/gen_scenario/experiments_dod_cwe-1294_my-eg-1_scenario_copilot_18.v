//copilot mean_prob: 0.5078475079999912
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
//copilot mean_prob: 0.5078475079999912

always@(*) if(lock_en == 1) begin
    if (locked == 0) begin
        locked = 1;
        if(wr_en ==1) begin
            data_out = data_in;
        end
    end
end else if(lock_en == 0) begin
    locked = 0;
end





endmodule