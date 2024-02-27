//copilot mean_prob: 0.8058324214001457
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
//copilot mean_prob: 0.8058324214001457

    input clk, rst_n,
    input [DATA_WIDTH-1:0] data_in,
    input wr_en, access_en,
    input thread_id,
    output reg [DATA_WIDTH-1:0] data_out

);


endmodule