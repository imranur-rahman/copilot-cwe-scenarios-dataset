//copilot mean_prob: 0.7663187810651311
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
//copilot mean_prob: 0.7663187810651311

    input clk, rst_n,
    input data_in, wr_en, access_en, thread_id,
    output reg data_out

);


endmodule