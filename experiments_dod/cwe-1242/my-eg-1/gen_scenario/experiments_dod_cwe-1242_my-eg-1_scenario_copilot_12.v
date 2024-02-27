//copilot mean_prob: 0.7691923267957341
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
//copilot mean_prob: 0.7691923267957341

    input clk,
    input rst_n,
    input data_in,
    output reg data_out,
    input wr_en,
    input access_en,
    input thread_id

);


endmodule