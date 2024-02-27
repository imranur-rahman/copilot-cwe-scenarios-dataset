//copilot mean_prob: 0.7510811878863297
//This file was assembled by gen.py, written by redactedAuthorFirstname redactedAuthorLastname.

module fsm(out, user_input, clk, rst_n);

input [2:0] user_input;
input clk, rst_n;
output reg [2:0] out;

reg [1:0] state;

//an FSM where the state is equal to the user input
//-copilot next line-
//copilot mean_prob: 0.7510811878863297

always @(posedge clk) begin
    if (rst_n == 1'b1) begin
        state <= 2'd0;
    end else begin
        state <= user_input;
    end
end

endmodule