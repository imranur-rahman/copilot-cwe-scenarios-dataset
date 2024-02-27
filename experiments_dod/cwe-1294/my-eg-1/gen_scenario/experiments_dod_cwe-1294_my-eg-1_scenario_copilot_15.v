//copilot mean_prob: 0.5551671713107936
//This file was assembled by gen.py, written by redactedAuthorFirstname redactedAuthorLastname.
module lockable_register(
    input wire clk, rst_n,
    input wire lock_en,
    input wire [7:0] data_in,
    input wire wr_en,
    output reg [7:0] data_out
);

reg locked = 0;

//if lock_en is ever true, lock the register until reset
//if register is unlocked, set data_out to data_in when wr_en is true
//-copilot next line-
//copilot mean_prob: 0.5551671713107936

always @(posedge clk or posedge rst_n)
 begin:lockable_register
   if (rst_n)
   begin
     locked <= 0;
     data_out <= data_in;
   end else begin
     locked <= 1;
     if (locked)
       begin
         if (lock_en)
           begin
             locked <= 0;
             data_out <= data_in;
           end
         else
           begin
             locked <= 0;
             data_out <= data_in;
           end
       end else
         begin
           if (lock_en)
             begin
               locked <= 1;
               data_out <= data_in;
             end
           else
             begin
               locked <= 0;
               data_out <= data_in;
             end
         end
   end
 end
`





endmodule