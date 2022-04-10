`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:03:41 04/06/2022 
// Design Name: 
// Module Name:    hamming_encoder 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module hamming_encoder(data_in, encoded_data, enable);
input [63:0] data_in;
input wire enable;
output reg[70:0] encoded_data;
reg [6:0] p;
always @(*)
begin
	if (enable == 1'b1)
		begin
			p[0] = data_in[0]^data_in[1]^data_in[3]^data_in[4]^data_in[6]^data_in[8]^data_in[10]^data_in[11]^data_in[13]^data_in[15]^data_in[17]^data_in[19]^data_in[21]^data_in[23]^data_in[25]^data_in[26]^data_in[28]^data_in[30]^data_in[32]^data_in[34]^data_in[36]^data_in[38]^data_in[40]^data_in[42]^data_in[44]^data_in[46]^data_in[48]^data_in[50]^data_in[52]^data_in[54]^data_in[56]^data_in[57]^data_in[59]^data_in[61]^data_in[63]; 
			p[1] = data_in[0]^data_in[2]^data_in[3]^data_in[5]^data_in[6]^data_in[9]^data_in[10]^data_in[12]^data_in[13]^data_in[16]^data_in[17]^data_in[20]^data_in[21]^data_in[24]^data_in[25]^data_in[27]^data_in[28]^data_in[31]^data_in[32]^data_in[35]^data_in[36]^data_in[39]^data_in[40]^data_in[43]^data_in[45]^data_in[47]^data_in[48]^data_in[51]^data_in[52]^data_in[55]^data_in[56]^data_in[58]^data_in[59]^data_in[62]^data_in[63];
			p[2] = data_in[1]^data_in[2]^data_in[3]^data_in[7]^data_in[8]^data_in[9]^data_in[10]^data_in[14]^data_in[15]^data_in[16]^data_in[17]^data_in[22]^data_in[23]^data_in[24]^data_in[25]^data_in[29]^data_in[30]^data_in[31]^data_in[32]^data_in[37]^data_in[38]^data_in[39]^data_in[40]^data_in[45]^data_in[46]^data_in[47]^data_in[48]^data_in[53]^data_in[54]^data_in[55]^data_in[56]^data_in[60]^data_in[61]^data_in[62]^data_in[63];
			p[3] = data_in[4]^data_in[5]^data_in[6]^data_in[7]^data_in[8]^data_in[9]^data_in[10]^data_in[18]^data_in[19]^data_in[20]^data_in[21]^data_in[22]^data_in[23]^data_in[24]^data_in[25]^data_in[33]^data_in[34]^data_in[35]^data_in[36]^data_in[37]^data_in[38]^data_in[39]^data_in[40]^data_in[49]^data_in[50]^data_in[51]^data_in[52]^data_in[53]^data_in[54]^data_in[55]^data_in[56];
			p[4] = data_in[11]^data_in[12]^data_in[13]^data_in[14]^data_in[15]^data_in[16]^data_in[17]^data_in[18]^data_in[19]^data_in[20]^data_in[21]^data_in[22]^data_in[23]^data_in[24]^data_in[25]^data_in[41]^data_in[42]^data_in[43]^data_in[44]^data_in[45]^data_in[46]^data_in[47]^data_in[48]^data_in[49]^data_in[50]^data_in[51]^data_in[52]^data_in[53]^data_in[54]^data_in[55]^data_in[56];
			p[5] = data_in[26]^data_in[27]^data_in[28]^data_in[29]^data_in[30]^data_in[31]^data_in[32]^data_in[33]^data_in[34]^data_in[35]^data_in[36]^data_in[37]^data_in[38]^data_in[39]^data_in[40]^data_in[41]^data_in[42]^data_in[43]^data_in[44]^data_in[45]^data_in[46]^data_in[47]^data_in[48]^data_in[49]^data_in[50]^data_in[51]^data_in[52]^data_in[53]^data_in[54]^data_in[55]^data_in[56];
			p[6] = data_in[57]^data_in[58]^data_in[59]^data_in[60]^data_in[61]^data_in[62]^data_in[63];
		
		encoded_data[0] = p[0];
		encoded_data[1] = p[1];
		encoded_data[2] = data_in[0];
		encoded_data[3] = p[2];
		encoded_data[4] = data_in[1];
		encoded_data[5] = data_in[2];
		encoded_data[6] = data_in[3];
		encoded_data[7] = p[3];
		encoded_data[8] = data_in[4];
		encoded_data[9] = data_in[5];
		encoded_data[10] = data_in[6];
		encoded_data[11] = data_in[7];
		encoded_data[12] = data_in[8];
		encoded_data[13] = data_in[9];
		encoded_data[14] = data_in[10];
		encoded_data[15] = p[4];
		encoded_data[16] = data_in[11];
		encoded_data[17] = data_in[12];
		encoded_data[18] = data_in[13];
		encoded_data[19] = data_in[14];
		encoded_data[20] = data_in[15];
		encoded_data[21] = data_in[16];
		encoded_data[22] = data_in[17];
		encoded_data[23] = data_in[18];
		encoded_data[24] = data_in[19];
		encoded_data[25] = data_in[20];
		encoded_data[26] = data_in[21];
		encoded_data[27] = data_in[22];
		encoded_data[28] = data_in[23];
		encoded_data[29] = data_in[24];
		encoded_data[30] = data_in[25];
		encoded_data[31] = p[5];
		encoded_data[32] = data_in[26];
		encoded_data[33] = data_in[27];
		encoded_data[34] = data_in[28];
		encoded_data[35] = data_in[29];
		encoded_data[36] = data_in[30];
		encoded_data[37] = data_in[31];
		encoded_data[38] = data_in[32];
		encoded_data[39] = data_in[33];
		encoded_data[40] = data_in[34];
		encoded_data[41] = data_in[35];
		encoded_data[42] = data_in[36];
		encoded_data[43] = data_in[37];
		encoded_data[44] = data_in[38];
		encoded_data[45] = data_in[39];
		encoded_data[46] = data_in[40];
		encoded_data[47] = data_in[41];
		encoded_data[48] = data_in[42];
		encoded_data[49] = data_in[43];
		encoded_data[50] = data_in[44];
		encoded_data[51] = data_in[45];
		encoded_data[52] = data_in[46];
		encoded_data[53] = data_in[47];
		encoded_data[54] = data_in[48];
		encoded_data[55] = data_in[49];
		encoded_data[56] = data_in[50];
		encoded_data[57] = data_in[51];
		encoded_data[58] = data_in[52];
		encoded_data[59] = data_in[53];
		encoded_data[60] = data_in[54];
		encoded_data[61] = data_in[55];
		encoded_data[62] = data_in[56];
		encoded_data[63] = p[6];
		encoded_data[64] = data_in[57];
		encoded_data[65] = data_in[58];
		encoded_data[66] = data_in[59];
		encoded_data[67] = data_in[60];
		encoded_data[68] = data_in[61];
		encoded_data[69] = data_in[62];
		encoded_data[70] = data_in[63];
		
		end
end
endmodule
