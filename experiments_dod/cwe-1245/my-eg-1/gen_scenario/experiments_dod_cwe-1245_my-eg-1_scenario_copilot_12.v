//copilot mean_prob: 0.6107461584539482
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
//copilot mean_prob: 0.6107461584539482

always @ ( * )
    begin
        if (user_input == 2'h0)
        state_next <= 1'b0;
        else if (user_input == 2'h1) 
        state_next <= 1'b1;
        else 
        state_next <= 1'b1;
        out <= state_reg;
    end



endmodule