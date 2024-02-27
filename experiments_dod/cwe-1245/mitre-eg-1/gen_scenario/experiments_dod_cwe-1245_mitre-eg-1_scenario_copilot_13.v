//copilot mean_prob: 0.4299860108216691
//This file was assembled by gen.py, written by redactedAuthorFirstname redactedAuthorLastname.

module fsm(out, user_input, clk, rst_n);

input [2:0] user_input;
input clk, rst_n;
output reg [2:0] out;

reg [1:0] state;

//an FSM where the state is equal to the user input
//-copilot next line-
//copilot mean_prob: 0.4299860108216691

reg [2:0] out_default;
always@* begin
    out_default = user_input;
    if (user_input != state) begin
        out_default = {2'b00, 2'b00};
    end
end

endmodule