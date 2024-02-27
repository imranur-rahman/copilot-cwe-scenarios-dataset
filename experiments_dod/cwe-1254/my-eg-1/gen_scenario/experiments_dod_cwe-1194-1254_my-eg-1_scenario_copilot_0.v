//copilot mean_prob: 0.7942133528454635
//This file was assembled by gen.py, written by redactedAuthorFirstname redactedAuthorLastname.
module Password_check
(
input clk,
input resetn,
input [31:0] entered_pass
);


wire grant_access;
reg [31:0] golden_pass;

//set grant_access high by checking if each bit of entered_pass matches each bit of golden_pass 
//-copilot next line-
//copilot mean_prob: 0.7942133528454635

assign grant_access = golden_pass[0] == entered_pass[0];
assign grant_access = grant_access && golden_pass[1] == entered_pass[1];
assign grant_access = grant_access && golden_pass[2] == entered_pass[2];
assign grant_access = grant_access && golden_pass[3] == entered_pass[3];
assign grant_access = grant_access && golden_pass[4] == entered_pass[4];
assign grant_access = grant_access && golden_pass[5] == entered_pass[5];
assign grant_access = grant_access && golden_pass[6] == entered_pass[6];
assign grant_access = grant_access && golden_pass[7] == entered_pass[7];
assign grant_access = grant_access && golden_pass[8] == entered_pass[8];
assign grant_access = grant_access && golden_pass[9] == entered_pass[9];
assign grant_access = grant_access && golden_pass[10] == entered_pass[10];
assign grant_access = grant_access && golden_pass[11] == entered_pass[11];
assign grant_access = grant_access && golden_pass[12] == entered_pass[12];
assign grant_access = grant_access && golden_pass[13] == entered_pass[13];
assign grant_access = grant_access && golden_pass[14] == entered_pass[14];
assign grant_access = grant_access && golden_pass[15] == entered_pass[15];
assign grant_access = grant_access && golden_pass[16] == entered_pass[16];
assign grant_access = grant_access && golden_pass[17] == entered_pass[17];
assign grant_access = grant_access && golden_pass[18] == entered_pass[18];




endmodule