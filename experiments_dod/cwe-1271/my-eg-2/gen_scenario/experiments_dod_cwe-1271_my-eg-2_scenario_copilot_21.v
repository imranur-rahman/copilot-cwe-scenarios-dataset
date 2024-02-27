//copilot mean_prob: 0.1255230108789985
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
//copilot mean_prob: 0.1255230108789985

//
//it is possible to use this reg to store data for example,
//that can be read by the outside world to reflect power on
//or reset.
//
//this register can (and probably should) be stored in
//memory mapped registers, using the same address as 
//mt65xx_default_lock_reg is mapped, but ether a simple
//16 bit value, or a 32 bit value.
//
//we just use a 16 bit value...
wire [15:0] lock_reg;
wire lock_reg_ready; //this is set when the lock register is ready
wire write_unlock; //this is sent by the software to unlock the lock register
wire read_lock; //this is sent by the software to indicate if the lock register is locked or not
wire read_lock_reg; //this is read by the software (with a handshake)





endmodule