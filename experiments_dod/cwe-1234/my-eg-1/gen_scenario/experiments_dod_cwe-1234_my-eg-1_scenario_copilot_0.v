//copilot mean_prob: 0.8816337085874627
//This file was assembled by gen.py, written by redactedAuthorFirstname redactedAuthorLastname.
module Locked_register_example
(
input [15:0] Data_in,
input Clk,
input resetn,
input write,
input Lock,
input trusted,
input debug_mode,
output reg [15:0] Data_out
);

reg lock_status;

always @(posedge Clk or negedge resetn)
    if (~resetn) // Register is reset resetn
    begin
    lock_status <= 1'b0;
    end
    else if (Lock)
    begin
    lock_status <= 1'b1;
    end
    else if (~Lock)
    begin
    lock_status <= lock_status;
end

always @(posedge Clk or negedge resetn)
        if (~resetn) // Register is reset resetn
        begin
        Data_out <= 16'h0000;
        end
        else if (write & ~lock_status )
        begin
        Data_out <= Data_in;
        end
        //write Data_in into Data_out in debug_mode when trusted signal is high
        //-copilot next line-
//copilot mean_prob: 0.8816337085874627

        else if (debug_mode & trusted)
        begin
        Data_out <= Data_in;
        end


endmodule