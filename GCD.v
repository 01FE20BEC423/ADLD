module GCD_datapath(lt,gt,eq,ldA,ldB,sel1,sel2,sel_in,data_in,clk);
input ldA,ldB,sel1,sel2,sel_in,clk;
input [15:0] data_in;
output lt,gt,eq;
wire [15:0] aout,bout,bus,sub_out,X,Y;
PIPO A (aout,bus,ldA,clk);
PIPO B (bout,bus,ldB,clk);
MUX MUX1(X,sel1,aout,bout);
MUX MUX2(Y,sel2,aout,bout);
COMP COMP1(lt,gt,eq,aout,bout);
SUB SUB1(sub_out,X,Y);
MUX MUX_LOAD(bus,data_in,sub_out);
endmodule

module control(ldA,ldB,sel1,sel2,sel_in,done,clk,start,lt,gt,eq);
input clk,start,lt,gt,eq;
output reg ldA,ldB,sel1,sel2,sel_in,done;
reg[2:0] state;
parameter S0=3'b000, S1=3'b001, S2=3'b010, S3=3'b011, S4=3'b100, S5=3'b101;
always @(posedge clk)
begin
case (state)
S0: if (state) state<=S1;
S1: state<=S2;
S2: #2 if (eq) state <= S5;
    else if(lt) state <= S3;
    else if(gt) state <= S4;
S3: #2 if (eq) state <= S5;
    else if (lt) state <= S3;
    else if(gt) state <= S4;
S4: #2 if (eq) state <= S5;
    else if (lt) state <= S3;
    else if(gt) state <= S4;
S5: state <= S5;
default: state <= S0;
endcase
end
always @ (state)
begin
case (state)
S0: begin sel_in = 1; ldA = 1; ldB = 0; done = 0; end
S1: begin sel_in = 1; ldA = 0; ldB = 1; end
S2: if (eq) done = 1;
    else if (lt) begin
    sel1 = 1; sel2 = 0; sel_in = 0;
    #1 ldA = 0; ldB = 1;
    end
    else if (gt) begin
    sel1 = 0; sel2 = 1; sel_in = 0;
    #1 ldA = 1; ldB = 0;
    end
S3: if (eq) done = 1;
    else if (lt) begin
    sel1 = 1; sel2 = 0; sel_in = 0;
    #1 ldA = 0; ldB = 1;
    end
    else if (gt) begin
    sel1 = 0; sel2 = 1; sel_in = 0;
    #1 ldA = 1; ldB = 0;
    end
S4: if (eq) done = 1;
    else if (lt) begin
    sel1 = 1; sel2 = 0; sel_in = 0;
    #1 ldA = 0; ldB = 1;
    end
    else if (gt) begin
    sel1 = 0; sel2 = 1; sel_in = 0;
    #1 ldA = 1; ldB = 0;
    end
S5: begin done = 1; sel1 = 0; sel2 = 0; ldA = 0; ldB = 0; end
default: begin ldA = 0; ldB = 0; end 
endcase
end
endmodule

module GCD_test;
reg [15:0] data_in;
reg clk,start;
wire done;
reg [15:0] A,B;
GCD_datapath DP (gt,lt,eq,ldA,ldB,sel1,sel2,sel_in,data_in,clk);
controller CON (ldA, ldB, sel1, sel2, sel_in,done,clk,lt,gt,eq,start);
initial 
begin 
clk = 1'b0;
#3 start = 1'b1;
#1000 $finish;
end
always #5 clk = ~clk;
initial
begin
#12 data_in = 143;
#10 data_in = 78;
end
initial
begin
$monitor($time, "%d %b",DP.aout, done);
$dumpfile("gcd.vcd");
$dumpvars(0,GCD_test);
end
endmodule

