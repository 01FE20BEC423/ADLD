module Block
integer a,b,c,d;
initial begin
a=4; b=3;
$dispaly("[%0t]a=0x%oh,b=0x%0h,c=0x%oh,d=0x%0h",$time,a,b,c,d);
#10 c= 18;
$dispaly("[%0t]a=0x%oh,b=0x%0h,c=0x%oh,d=0x%0h",$time,a,b,c,d);
#5 d= 7;
$dispaly("[%0t]a=0x%oh,b=0x%0h,c=0x%oh,d=0x%0h",$time,a,b,c,d);
end
endmodule

