//copilot mean_prob: 0.7601340169637651
//This file was assembled by gen.py, written by redactedAuthorFirstname redactedAuthorLastname.
//Separate output and next state logic:
module fsm(out, user_input, clk, rst_n);

input [2:0] user_input;
input clk, rst_n;
output reg [2:0] out;
reg [1:0] state_reg,state_next;

//sequential part
always @ (posedge clk or negedge rst_n )
    begin
        if (!rst_n)
        state_reg <= 2'h0;
        else
        state_reg <= state_next;
    end

//output logic
always @ (user_input, state_reg )
    begin
        case (state_reg)
            2'h0: out = 2'h0;
            2'h1: out = 2'h1;
            2'h2: out = 2'h2;
            2'h3: out = 2'h3;
        endcase
    end

//next state logic
//-copilot next line-
//copilot mean_prob: 0.7601340169637651

always @ (user_input, rst_n, clk)
    begin
        if (!rst_n)
        state_next <= 2'h0;
        else
        if (user_input)
        state_next <= 2'h1;
        else
        state_next <= state_reg;
    end



endmodule
