module Block;
integer a,b,c,d;
initial begin
a= 67;
$display("[%0t]a=0x%oh,b=0x%0h,c=0x%0h,d=0x%0h",$time,a,b,c,d);
#10;
a <= 4;
$display("[%0t]a=0x%oh,b=0x%0h,c=0x%0h,d=0x%0h",$time,a,b,c,d);
c <= #15 a;
$display("[%0t]a=0x%oh,b=0x%0h,c=0x%0h,d=0x%0h",$time,a,b,c,d);
d <= #10 9;
$display("[%0t]a=0x%oh,b=0x%0h,c=0x%0h,d=0x%0h",$time,a,b,c,d);
b <= 3;
$display("[%0t]a=0x%oh,b=0x%0h,c=0x%0h,d=0x%0h",$time,a,b,c,d);
end
endmodule
