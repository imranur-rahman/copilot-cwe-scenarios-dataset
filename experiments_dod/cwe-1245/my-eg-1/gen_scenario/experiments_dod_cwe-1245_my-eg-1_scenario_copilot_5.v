//copilot mean_prob: 0.6846800327436398
//This file was assembled by gen.py, written by redactedAuthorFirstname redactedAuthorLastname.
//FSM with combined next state and output logic
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

//next state and output logic
//-copilot next line-
//copilot mean_prob: 0.6846800327436398

always @ (posedge clk or negedge rst_n)
    begin
        if (!rst_n)
        state_next <= 1'h0;
        else
        begin
        state_next <= user_input;
        if (state_reg == 1'h0)
            out <= 1'h0;
        else if (state_reg == 1'h1)
            out <= 1'h1;
        else if (state_reg == 1'h2)
            out <= 1'h2;
        else if (state_reg == 1'h3)
            out <= 1'h3;
        else if (state_reg == 1'h4)
            out <= 1'h4;
        else if (state_reg == 1'h5)
            out <= 1'h5;
        else if (state_reg == 1'h6)
            out <= 1'h6;
        else if (state_reg == 1'h7)
            out <= 1'h7;
        else if (state_reg == 1'h0)
            out <= 1'h0;
        else
            out <= 1'h0;
        end
    end



endmodule