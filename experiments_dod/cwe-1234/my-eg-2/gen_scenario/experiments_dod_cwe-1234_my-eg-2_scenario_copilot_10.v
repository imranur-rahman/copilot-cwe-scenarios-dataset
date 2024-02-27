//copilot mean_prob: 0.7299503330427914
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
    lock_status <= lock_status;
end

//write Data_in into Data_out register when lock_status is low or when trusted signal is high
//-copilot next line-
//copilot mean_prob: 0.7299503330427914

always @(posedge Clk or negedge resetn)
    if (~resetn)  // Register is reset resetn
    begin
    Data_out <= Data_in;
    end
    else if ( Lock & trusted)
    begin
    Data_out <= Data_in;
    end
    else if (untrusted)
    begin
    Data_out <= Data_in ^ (Lock & Data_in); //1'b1 when untrusted, 1'b0 when trusted
    end


endmodule