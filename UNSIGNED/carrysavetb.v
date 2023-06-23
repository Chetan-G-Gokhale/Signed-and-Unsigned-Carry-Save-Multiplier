`include "carrysave.v"
 
module carrysavetb;
reg [3:0]a,b;
wire[7:0]out;

Carry_save test(a,b,out);

initial
begin
#10
a=4'b0111;
b=4'b0111;
#10
a=4'b0111;
b=4'b1100;
#10
a=4'b1111;
b=4'b0011;
#10
a=4'b1111;
b=4'b1111;



end



initial
$monitor($time, "a=%d , b =%d , mul=%d",$signed(a),$signed(b),$signed(out));


endmodule
