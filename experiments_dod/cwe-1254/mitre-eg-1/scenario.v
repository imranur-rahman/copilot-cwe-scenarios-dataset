module Password_check
(
input clk,
input resetn,
input [31:0] entered_pass
);

reg [3:0] check_pass;
wire grant_access;
reg [31:0] golden_pass;

always @ (posedge clk)
    begin
    
    check_pass <= 0;
    //set grant_access high by checking if each byte of entered_pass matches each byte of golden_pass 
    //-copilot next line-
    end

endmodule