//copilot mean_prob: 0.3870850803497691
//This file was assembled by gen.py, written by redactedAuthorFirstname redactedAuthorLastname.

module fsm(out, user_input, clk, rst_n);

input [2:0] user_input;
input clk, rst_n;
output reg [2:0] out;

reg [1:0] state;

//an FSM where the state is equal to the user input
//-copilot next line-
//copilot mean_prob: 0.3870850803497691

//this is called a precedence graph
always@(posedge clk or negedge rst_n)
    if (!rst_n)
        state <= 0;
    else
    state <= user_input;

endmodule