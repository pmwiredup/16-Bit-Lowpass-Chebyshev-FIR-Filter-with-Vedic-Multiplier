module HA(input a, b,
output sum, cout);
assign sum = a^b;
assign cout = a&b;
endmodule

module FA_lookahead_4bit(input [3:0] a, b, 
input cin,
output [3:0]sum,
output cout);
integer i;
wire [2:0] c_temp;
reg [3:0] G, P;
always @(*) begin
for(i = 0; i<4; i = i+1) begin
G[i] = a[i]&b[i];
P[i] = a[i]^b[i];
end
end
assign c_temp[0] = G[0]|(P[0]&cin);
assign c_temp[1] = G[1]|(P[1]&c_temp[0]);
assign c_temp[2] = G[2]|(P[2]&c_temp[1]);
assign cout = G[3]|(P[3]&c_temp[2]);

assign sum[0] = P[0]^cin;
assign sum[1] = P[1]^c_temp[0];
assign sum[2] = P[2]^c_temp[1];
assign sum[3] = P[3]^c_temp[2];

endmodule

module FA_lookahead_6bit(input [5:0] a, b, 
input cin,
output [5:0]sum,
output cout);
integer i;
wire [4:0] c_temp;
reg [5:0] G, P;
always @(*) begin
for(i = 0; i<6; i = i+1) begin
G[i] = a[i]&b[i];
P[i] = a[i]^b[i];
end
end
assign c_temp[0] = G[0]|(P[0]&cin);
assign c_temp[1] = G[1]|(P[1]&c_temp[0]);
assign c_temp[2] = G[2]|(P[2]&c_temp[1]);
assign c_temp[3] = G[3]|(P[3]&c_temp[2]);
assign c_temp[4] = G[4]|(P[4]&c_temp[3]);
assign cout =      G[5]|(P[5]&c_temp[4]);

assign sum[0] = P[0]^cin;
assign sum[1] = P[1]^c_temp[0];
assign sum[2] = P[2]^c_temp[1];
assign sum[3] = P[3]^c_temp[2];
assign sum[4] = P[4]^c_temp[3];
assign sum[5] = P[5]^c_temp[4];

endmodule

module FA_lookahead_8bit(input [7:0] a, b, 
input cin,
output [7:0]sum,
output cout);
integer i;
wire [6:0] c_temp;
reg [7:0] G, P;
always @(*) begin
for(i = 0; i<8; i = i+1) begin
G[i] = a[i]&b[i];
P[i] = a[i]^b[i];
end
end
assign c_temp[0] = G[0]|(P[0]&cin);
assign c_temp[1] = G[1]|(P[1]&c_temp[0]);
assign c_temp[2] = G[2]|(P[2]&c_temp[1]);
assign c_temp[3] = G[3]|(P[3]&c_temp[2]);
assign c_temp[4] = G[4]|(P[4]&c_temp[3]);
assign c_temp[5] = G[5]|(P[5]&c_temp[4]);
assign c_temp[6] = G[6]|(P[6]&c_temp[5]);
assign cout =      G[7]|(P[7]&c_temp[6]);

assign sum[0] = P[0]^cin;
assign sum[1] = P[1]^c_temp[0];
assign sum[2] = P[2]^c_temp[1];
assign sum[3] = P[3]^c_temp[2];
assign sum[4] = P[4]^c_temp[3];
assign sum[5] = P[5]^c_temp[4];
assign sum[6] = P[6]^c_temp[5];
assign sum[7] = P[7]^c_temp[6];
endmodule

module FA_lookahead_12bit(input [11:0] a, b, 
input cin,
output [11:0]sum,
output cout);
integer i;
wire [10:0] c_temp;
reg [11:0] G, P;
always @(*) begin
for(i = 0; i<12; i = i+1) begin
G[i] = a[i]&b[i];
P[i] = a[i]^b[i];
end
end
assign c_temp[0] = G[0]|(P[0]&cin);
assign c_temp[1] = G[1]|(P[1]&c_temp[0]);
assign c_temp[2] = G[2]|(P[2]&c_temp[1]);
assign c_temp[3] = G[3]|(P[3]&c_temp[2]);
assign c_temp[4] = G[4]|(P[4]&c_temp[3]);
assign c_temp[5] = G[5]|(P[5]&c_temp[4]);
assign c_temp[6] = G[6]|(P[6]&c_temp[5]);
assign c_temp[7] = G[7]|(P[7]&c_temp[6]);
assign c_temp[8] = G[8]|(P[8]&c_temp[7]);
assign c_temp[9] = G[9]|(P[9]&c_temp[8]);
assign c_temp[10] = G[10]|(P[10]&c_temp[9]);
assign cout =      G[11]|(P[11]&c_temp[10]);

assign sum[0] = P[0]^cin;
assign sum[1] = P[1]^c_temp[0];
assign sum[2] = P[2]^c_temp[1];
assign sum[3] = P[3]^c_temp[2];
assign sum[4] = P[4]^c_temp[3];
assign sum[5] = P[5]^c_temp[4];
assign sum[6] = P[6]^c_temp[5];
assign sum[7] = P[7]^c_temp[6];
assign sum[8] = P[8]^c_temp[7];
assign sum[9] = P[9]^c_temp[8];
assign sum[10] = P[10]^c_temp[9];
assign sum[11] = P[11]^c_temp[10];
endmodule

module FA_lookahead_16bit(input [15:0] a, b, 
input cin,
output [15:0]sum,
output cout);
integer i;
wire [14:0] c_temp;
reg [15:0] G, P;
always @(*) begin
for(i = 0; i<16; i = i+1) begin
G[i] = a[i]&b[i];
P[i] = a[i]^b[i];
end
end
assign c_temp[0] = G[0]|(P[0]&cin);
assign c_temp[1] = G[1]|(P[1]&c_temp[0]);
assign c_temp[2] = G[2]|(P[2]&c_temp[1]);
assign c_temp[3] = G[3]|(P[3]&c_temp[2]);
assign c_temp[4] = G[4]|(P[4]&c_temp[3]);
assign c_temp[5] = G[5]|(P[5]&c_temp[4]);
assign c_temp[6] = G[6]|(P[6]&c_temp[5]);
assign c_temp[7] = G[7]|(P[7]&c_temp[6]);
assign c_temp[8] = G[8]|(P[8]&c_temp[7]);
assign c_temp[9] = G[9]|(P[9]&c_temp[8]);
assign c_temp[10] = G[10]|(P[10]&c_temp[9]);
assign c_temp[11] = G[11]|(P[11]&c_temp[10]);
assign c_temp[12] = G[12]|(P[12]&c_temp[11]);
assign c_temp[13] = G[13]|(P[13]&c_temp[12]);
assign c_temp[14] = G[14]|(P[14]&c_temp[13]);
assign cout =      G[15]|(P[15]&c_temp[14]);

assign sum[0] = P[0]^cin;
assign sum[1] = P[1]^c_temp[0];
assign sum[2] = P[2]^c_temp[1];
assign sum[3] = P[3]^c_temp[2];
assign sum[4] = P[4]^c_temp[3];
assign sum[5] = P[5]^c_temp[4];
assign sum[6] = P[6]^c_temp[5];
assign sum[7] = P[7]^c_temp[6];
assign sum[8] = P[8]^c_temp[7];
assign sum[9] = P[9]^c_temp[8];
assign sum[10] = P[10]^c_temp[9];
assign sum[11] = P[11]^c_temp[10];
assign sum[12] = P[12]^c_temp[11];
assign sum[13] = P[13]^c_temp[12];
assign sum[14] = P[14]^c_temp[13];
assign sum[15] = P[15]^c_temp[14];
endmodule

module FA_lookahead_24bit(input [23:0] a, b, 
input cin,
output [23:0]sum,
output cout);
integer i;
wire [22:0] c_temp;
reg [23:0] G, P;
always @(*) begin
for(i = 0; i<24; i = i+1) begin
G[i] = a[i]&b[i];
P[i] = a[i]^b[i];
end
end
assign c_temp[0] = G[0]|(P[0]&cin);
assign c_temp[1] = G[1]|(P[1]&c_temp[0]);
assign c_temp[2] = G[2]|(P[2]&c_temp[1]);
assign c_temp[3] = G[3]|(P[3]&c_temp[2]);
assign c_temp[4] = G[4]|(P[4]&c_temp[3]);
assign c_temp[5] = G[5]|(P[5]&c_temp[4]);
assign c_temp[6] = G[6]|(P[6]&c_temp[5]);
assign c_temp[7] = G[7]|(P[7]&c_temp[6]);
assign c_temp[8] = G[8]|(P[8]&c_temp[7]);
assign c_temp[9] = G[9]|(P[9]&c_temp[8]);
assign c_temp[10] = G[10]|(P[10]&c_temp[9]);
assign c_temp[11] = G[11]|(P[11]&c_temp[10]);
assign c_temp[12] = G[12]|(P[12]&c_temp[11]);
assign c_temp[13] = G[13]|(P[13]&c_temp[12]);
assign c_temp[14] = G[14]|(P[14]&c_temp[13]);
assign c_temp[15] = G[15]|(P[15]&c_temp[14]);
assign c_temp[16] = G[16]|(P[16]&c_temp[15]);
assign c_temp[17] = G[17]|(P[17]&c_temp[16]);
assign c_temp[18] = G[18]|(P[18]&c_temp[17]);
assign c_temp[19] = G[19]|(P[19]&c_temp[18]);
assign c_temp[20] = G[20]|(P[20]&c_temp[19]);
assign c_temp[21] = G[21]|(P[21]&c_temp[20]);
assign c_temp[22] = G[22]|(P[22]&c_temp[21]);
assign cout =      G[23]|(P[23]&c_temp[22]);

assign sum[0] = P[0]^cin;
assign sum[1] = P[1]^c_temp[0];
assign sum[2] = P[2]^c_temp[1];
assign sum[3] = P[3]^c_temp[2];
assign sum[4] = P[4]^c_temp[3];
assign sum[5] = P[5]^c_temp[4];
assign sum[6] = P[6]^c_temp[5];
assign sum[7] = P[7]^c_temp[6];
assign sum[8] = P[8]^c_temp[7];
assign sum[9] = P[9]^c_temp[8];
assign sum[10] = P[10]^c_temp[9];
assign sum[11] = P[11]^c_temp[10];
assign sum[12] = P[12]^c_temp[11];
assign sum[13] = P[13]^c_temp[12];
assign sum[14] = P[14]^c_temp[13];
assign sum[15] = P[15]^c_temp[14];
assign sum[16] = P[16]^c_temp[15];
assign sum[17] = P[17]^c_temp[16];
assign sum[18] = P[18]^c_temp[17];
assign sum[19] = P[19]^c_temp[18];
assign sum[20] = P[20]^c_temp[19];
assign sum[21] = P[21]^c_temp[20];
assign sum[22] = P[22]^c_temp[21];
assign sum[23] = P[23]^c_temp[22];
endmodule

module vedicmult_2bit(input [1:0] a, b,
output [3:0] out);

wire[3:0] temp;

assign out[0] = a[0]&b[0];
assign temp[0] = a[1]&b[0];
assign temp[1] = a[0]&b[1];
assign temp[2] = a[1]&b[1];

HA h1(temp[0], temp[1], out[1], temp[3]);
HA h2(temp[2], temp[3], out[2], out[3]);
endmodule

module vedicmult_4bit(input [3:0] a, b,
output [7:0] out);

wire [3:0]q0;	
wire [3:0]q1;	
wire [3:0]q2;
wire [3:0]q3;	

wire [3:0]temp1;
wire [5:0]temp2;
wire [5:0]temp3;
wire [5:0]temp4;
wire [5:0]temp5;

wire [3:0]q4;
wire [5:0]q5;
wire [5:0]q6;

wire cout1, cout2, cout3;

vedicmult_2bit f1(a[1:0],b[1:0],q0[3:0]);
vedicmult_2bit f2(a[3:2],b[1:0],q1[3:0]);
vedicmult_2bit f3(a[1:0],b[3:2],q2[3:0]);
vedicmult_2bit f4(a[3:2],b[3:2],q3[3:0]);

assign temp1 ={2'b0,q0[3:2]};
FA_lookahead_4bit f5(q1[3:0],temp1, 1'b0, q4, cout1);
assign temp2 ={2'b0,q2[3:0]};
assign temp3 ={q3[3:0],2'b0};
FA_lookahead_6bit f6(temp2,temp3,1'b0, q5, cout2);

assign temp4={1'b0,cout1,q4[3:0]};

FA_lookahead_6bit f7(temp4,q5,1'b0, q6, cout3);
assign out[1:0]=q0[1:0];
assign out[7:2]=q6[5:0];
endmodule

module vedicmult_8bit(input[7:0] a,b,
output [15:0] out);
   
wire [7:0]q0;	
wire [7:0]q1;	
wire [7:0]q2;
wire [7:0]q3;	

wire [7:0]temp1;
wire [11:0]temp2;
wire [11:0]temp3;
wire [11:0]temp4;

wire [7:0]q4;
wire [11:0]q5;
wire [11:0]q6;

wire cout1, cout2, cout3;

vedicmult_4bit f1(a[3:0],b[3:0],q0[7:0]);
vedicmult_4bit f2(a[7:4],b[3:0],q1[7:0]);
vedicmult_4bit f3(a[3:0],b[7:4],q2[7:0]);
vedicmult_4bit f4(a[7:4],b[7:4],q3[7:0]);

assign temp1 ={4'b0,q0[7:4]};
FA_lookahead_8bit f5(q1[7:0],temp1, 1'b0, q4, cout1);
assign temp2 ={4'b0,q2[7:0]};
assign temp3 ={q3[7:0],4'b0};
FA_lookahead_12bit f6(temp2,temp3, 1'b0, q5, cout2);
assign temp4={3'b0, cout1, q4[7:0]};

FA_lookahead_12bit z7(temp4,q5,1'b0, q6, cout3);

assign out[3:0]=q0[3:0];
assign out[15:4]=q6[11:0];
endmodule

module vedicmult_16bit(input[15:0] a,b,
input clk, reset,
output reg [31:0] out);
   
   wire [15:0]q0;	
   wire [15:0]q1;	
   wire [15:0]q2;
   wire [15:0]q3;	

wire [15:0]temp1;
wire [23:0]temp2;
wire [23:0]temp3;
wire [23:0]temp4;

wire [15:0]q4;
wire [23:0]q5;
wire [23:0]q6;

wire cout1, cout2, cout3;

vedicmult_8bit f1(a[7:0],b[7:0],q0[15:0]);
vedicmult_8bit f2(a[15:8],b[7:0],q1[15:0]);
vedicmult_8bit f3(a[7:0],b[15:8],q2[15:0]);
vedicmult_8bit f4(a[15:8],b[15:8],q3[15:0]);

assign temp1 ={8'b0,q0[15:8]};
FA_lookahead_16bit f5(q1[15:0],temp1, 1'b0, q4, cout1);
assign temp2 ={8'b0,q2[15:0]};
assign temp3 ={q3[15:0],8'b0};
FA_lookahead_24bit f6(temp2,temp3, 1'b0, q5, cout2);
assign temp4={7'b0, cout1, q4[15:0]};

FA_lookahead_24bit z7(temp4,q5,1'b0, q6, cout3);

always @(posedge clk) begin
if (reset) begin
out[31:0] <= 32'd0;
end
else begin
out[7:0]<=q0[7:0];
out[31:8]<=q6[23:0]; 
end
end
endmodule
