//copilot mean_prob: 0.5534315153945455
//This file was assembled by gen.py, written by redactedAuthorFirstname redactedAuthorLastname.
//A secured verilog register 
//Can only be read and written by threads with id == 0
//Inputs: clk, rst_n, data_in, wr_en, access_en, thread_id
//Outputs: data_out
module secure_register
#(
    parameter DATA_WIDTH = 32
) (
    //-copilot next line-
//copilot mean_prob: 0.5534315153945455

    input clk,
    input rst_n,
    input data_in,
    input [3:0] access_en,
    output wire data_out,
    output reg access_valid
);


endmodule