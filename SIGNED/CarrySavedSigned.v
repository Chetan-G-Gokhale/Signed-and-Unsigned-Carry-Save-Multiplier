module Carry_save_signed(a,b,out);
input [3:0]a,b;
output [7:0]out;

wire [3:0] parprod [3:0];

wire [3:0] sumout [3:0];
wire [3:0] carout [3:0];

/*            
                    IMPORTANT  

The Level of any modules in the hierarchy depends upon the array index used
----> For example sum[0][0] refers to output of HA/FA in the 0th row and 0th coulm
     Similarly sum[3][2] refers to 3rd row and 2nd column

in general for all partial products and sum and carry
   array representation is done using name[row][coulumn]

*/
partial_products PP (a, b, parprod);

HA DUT11(parprod[0][1],parprod[1][0],sumout[0][0],carout[0][0]);
HA DUT12(parprod[0][2],parprod[1][1],sumout[0][1],carout[0][1]);
HA DUT13(~parprod[0][3],parprod[1][2],sumout[0][2],carout[0][2]);
HA DUT14(1'b1        ,~parprod[1][3],sumout[0][3],carout[0][3]);

FA DUT21(carout[0][0],parprod[2][0],sumout[0][1],sumout[1][0],carout[1][0]);
FA DUT22(parprod[2][1],carout[0][1],sumout[0][2],sumout[1][1],carout[1][1]);
FA DUT23(parprod[2][2],carout[0][2],sumout[0][3],sumout[1][2],carout[1][2]);
HA DUT24(~parprod[2][3],carout[0][3],sumout[1][3],carout[1][3]);

FA DUT31(carout[1][0],sumout[1][1],~parprod[3][0],sumout[2][0],carout[2][0]);
FA DUT32(carout[1][1],sumout[1][2],~parprod[3][1],sumout[2][1],carout[2][1]);
FA DUT33(carout[1][2],sumout[1][3],~parprod[3][2],sumout[2][2],carout[2][2]);
HA DUT34(carout[1][3],parprod[3][3],sumout[2][3],carout[2][3]);

HA DUT41(carout[2][0],sumout[2][1],sumout[3][0],carout[3][0]);
FA DUT42(carout[2][1],sumout[2][2],carout[3][0],sumout[3][1],carout[3][1]);
FA DUT43(carout[2][2],sumout[2][3],carout[3][1],sumout[3][2],carout[3][2]);
FA DUT44(carout[2][3],carout[3][2],1'b1,sumout[3][3],carout[3][3]);


assign out[7]=sumout[3][3];
assign out[6]=sumout[3][2];
assign out[5]=sumout[3][1];
assign out[4]=sumout[3][0];
assign out[3]=sumout[2][0];
assign out[2]=sumout[1][0];
assign out[1]=sumout[0][0];
assign out[0]=parprod[0][0];


endmodule


module partial_products(a,b, p_prod);
input [3:0]a,b;
output reg [3:0] p_prod [3:0];
	integer i,j;
always @(a or b)
begin
     for(i=0; i<4; i=i+1)
             begin
                 for(j=0; j<4; j=j+1)
			p_prod[i][j]=a[i]&b[j];
	      end
end


endmodule

module FA(a,b,cin,sum,cout);
input a,b,cin;
output sum,cout;

assign sum = a^b^cin;
assign cout = (a&b) | (b&cin) | (cin&a);

endmodule

module HA(a,b,sum,cout);
input a,b;
output sum,cout;

assign {cout,sum}=a+b;

endmodule