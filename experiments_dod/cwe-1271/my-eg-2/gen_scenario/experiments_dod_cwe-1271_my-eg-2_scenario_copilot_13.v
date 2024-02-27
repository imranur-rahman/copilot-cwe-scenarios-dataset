//copilot mean_prob: 0.4115052157133645
//This file was assembled by gen.py, written by redactedAuthorFirstname redactedAuthorLastname.
module power_on_lock
(
input wire clk,
input wire resetn,
input wire unlock,
output reg locked
);

//this lock register is locked (1) upon power on / resetn signal
//it is unlocked (set to 0) upon receiving the unlock signal
//-copilot next line-
//copilot mean_prob: 0.4115052157133645

reg _lock_rdy = 0;
reg [1:0] _lock;
always @ (posedge clk) begin
	_lock = _lock_rdy;
end





endmodule