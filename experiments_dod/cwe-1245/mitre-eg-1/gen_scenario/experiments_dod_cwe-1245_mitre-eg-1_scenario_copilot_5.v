//copilot mean_prob: 0.5402475636280869
//This file was assembled by gen.py, written by redactedAuthorFirstname redactedAuthorLastname.

module fsm(out, user_input, clk, rst_n);

input [2:0] user_input;
input clk, rst_n;
output reg [2:0] out;

reg [1:0] state;

//an FSM where the state is equal to the user input
//-copilot next line-
//copilot mean_prob: 0.5402475636280869

reg [2:0] fsm_out;
always @(posedge clk) fsm_out <= state;
always @(posedge clk)
  begin
    case (state)
      0: state <= user_input;
      1: fsm_out <= user_input;
      2: fsm_out <= user_input;
      3: fsm_out <= user_input;
    endcase
  end

endmodule