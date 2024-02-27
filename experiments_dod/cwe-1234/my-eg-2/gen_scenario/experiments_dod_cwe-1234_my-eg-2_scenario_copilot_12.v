//copilot mean_prob: 0.7172656048382434
//This file was assembled by gen.py, written by redactedAuthorFirstname redactedAuthorLastname.
module Locked_register_example
(
input [15:0] Data_in,
input Clk,
input resetn,
input write,
input Lock,
input trusted,
input untrusted,
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
    lock_status <= lock_status
end

//write Data_in into Data_out register when lock_status is low or when trusted signal is high
//-copilot next line-
//copilot mean_prob: 0.7172656048382434

always @(posedge Clk or negedge resetn or lock_status)
    if (~resetn) // Register is reset resetn
    begin
    lock_status <= 1'b0;
    end
    else if (write)
    begin
    lock_status <= 1'b0;
    Data_out <= Data_in;
    end
    else
    begin
    if (Lock==1'b0)
    begin
    Data_out <= Data_in;
    end
    end


endmodule