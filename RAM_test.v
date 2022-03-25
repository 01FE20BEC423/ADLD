module RAM_test;
reg[9:0]address;
wire[7:0]data_out;
reg [7:0]data_in;
reg write,select;
integer k,myseed;
ram_3 RAM(data_out,data_in,address,write,select);
initial
begin
for (k=1;k<=16;k=k+1)
#100
begin
data_in=(k+1)+1 ; 
write=1;select=1;
#2 address=k; write=0;select=0;

$display("address:%5d,data:%4d",address,data_in);
end
end
initial myseed=20;
endmodule

