//copilot mean_prob: 0.6691834211735856
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
//copilot mean_prob: 0.6691834211735856

always @ *
    begin
        case (state_reg)
            2'h0: if (user_input == 2'h0) state_next <= 2'h0;
            2'h1: if (user_input == 2'h0) state_next <= 2'h1;
            2'h2: if (user_input == 2'h0 || user_input == 2'h1) state_next <= 2'h2;
            2'h3: if (user_input == 2'h0 || user_input == 2'h1 || user_input == 2'h2) state_next <= 2'h3;
            2'h4: if (user_input == 2'h0 || user_input == 2'h1 || user_input == 2'h2 || user_input == 2'h3) state_next <= 2'h4;
            2'h5: if (user_input == 2'h0 || user_input == 2'h1 || user_input == 2'h2 || user_input == 2'h3 || user_input == 2'h4) state_next <= 2'h5;
            2'h6: if (user_input == 2'h0 || user_input == 2'h1 || user_input == 2'h2 || user_input == 2'h3 || user_input == 2'h4 || user_input == 2'h5) state_next <= 2'h6;
            default: state_next <= 2'h0;
        endcase
        out <= state_next;
    end



endmodule