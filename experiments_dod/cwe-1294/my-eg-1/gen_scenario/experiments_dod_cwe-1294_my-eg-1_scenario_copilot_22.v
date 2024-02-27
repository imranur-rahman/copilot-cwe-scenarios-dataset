//copilot mean_prob: 0.4332031421701726
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
//copilot mean_prob: 0.4332031421701726

reg init_zero;
wire[7:0] init_zero_reg = 0;
reg init_one;
wire[7:0] init_one_reg = 1;





endmodule