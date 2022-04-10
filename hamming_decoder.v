`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:43:23 04/06/2022 
// Design Name: 
// Module Name:    hamming_decoder 
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
module hamming_decoder(data_in, corrected_out, enable, temp, decoded_out, r);
input [70:0] data_in;
input wire enable;
output reg [63:0] temp;
output reg [70:0] corrected_out;
output reg [63:0] decoded_out;
reg [6:0] p;
reg [6:0] q;
output reg [6:0] r;
reg [6:0] t;
reg [6:0] k;
integer i,c,count=0;
always @(*)
begin
	if (enable == 1'b1)
		begin
		
			p[0] = data_in[0];
			p[1] = data_in[1];
			p[2] = data_in[3];
			p[3] = data_in[7];
			p[4] = data_in[15];
			p[5] = data_in[31];
			p[6] = data_in[63];
			
			temp[0] = data_in[2];
			temp[1] = data_in[4]; 
			temp[2] = data_in[5];// 6th bit of input data
			temp[3] = data_in[6];
			temp[4] = data_in[8];
			temp[5] = data_in[9];
			temp[6] = data_in[10];
			temp[7] = data_in[11];
			temp[8] = data_in[12];
			temp[9] = data_in[13];
			temp[10] = data_in[14];
			temp[11] = data_in[16];
			temp[12] = data_in[17];
			temp[13] = data_in[18];
			temp[14] = data_in[19];
			temp[15] = data_in[20];
			temp[16] = data_in[21];
			temp[17] = data_in[22];
			temp[18] = data_in[23];
			temp[19] = data_in[24];
			temp[20] = data_in[25];
			temp[21] = data_in[26];
			temp[22] = data_in[27];
			temp[23] = data_in[28];
			temp[24] = data_in[29];
			temp[25] = data_in[30];
			temp[26] = data_in[32];
			temp[27] = data_in[33];
			temp[28] = data_in[34];
			temp[29] = data_in[35];
			temp[30] = data_in[36];
			temp[31] = data_in[37];
			temp[32] = data_in[38];
			temp[33] = data_in[39];
			temp[34] = data_in[40];
         temp[35] = data_in[41];
			temp[36] = data_in[42];
			temp[37] = data_in[43];
			temp[38] = data_in[44];
			temp[39] = data_in[45];
			temp[40] = data_in[46];
			temp[41] = data_in[47];
			temp[42] = data_in[48];
			temp[43] = data_in[49];
			temp[44] = data_in[50];
			temp[45] = data_in[51];
			temp[46] = data_in[52];
			temp[47] = data_in[53];
			temp[48] = data_in[54];
			temp[49] = data_in[55];
			temp[50] = data_in[56];
			temp[51] = data_in[57];
			temp[52] = data_in[58];
			temp[53] = data_in[59];
			temp[54] = data_in[60];
			temp[55] = data_in[61];
			temp[56] = data_in[62];
			temp[57] = data_in[64];
			temp[58] = data_in[65];
			temp[59] = data_in[66];
			temp[60] = data_in[67];
			temp[61] = data_in[68];
			temp[62] = data_in[69];
			temp[63] = data_in[70];
			
			q[0] = temp[0]^temp[1]^temp[3]^temp[4]^temp[6]^temp[8]^temp[10]^temp[11]^temp[13]^temp[15]^temp[17]^temp[19]^temp[21]^temp[23]^temp[25]^temp[26]^temp[28]^temp[30]^temp[32]^temp[34]^temp[36]^temp[38]^temp[40]^temp[42]^temp[44]^temp[46]^temp[48]^temp[50]^temp[52]^temp[54]^temp[56]^temp[57]^temp[59]^temp[61]^temp[63];
         q[1] = temp[0]^temp[2]^temp[3]^temp[5]^temp[6]^temp[9]^temp[10]^temp[12]^temp[13]^temp[16]^temp[17]^temp[20]^temp[21]^temp[24]^temp[25]^temp[27]^temp[28]^temp[31]^temp[32]^temp[35]^temp[36]^temp[39]^temp[40]^temp[43]^temp[45]^temp[47]^temp[48]^temp[51]^temp[52]^temp[55]^temp[56]^temp[58]^temp[59]^temp[62]^temp[63];
			q[2] = temp[1]^temp[2]^temp[3]^temp[7]^temp[8]^temp[9]^temp[10]^temp[14]^temp[15]^temp[16]^temp[17]^temp[22]^temp[23]^temp[24]^temp[25]^temp[29]^temp[30]^temp[31]^temp[32]^temp[37]^temp[38]^temp[39]^temp[40]^temp[45]^temp[46]^temp[47]^temp[48]^temp[53]^temp[54]^temp[55]^temp[56]^temp[60]^temp[61]^temp[62]^temp[63];
			q[3] = temp[4]^temp[5]^temp[6]^temp[7]^temp[8]^temp[9]^temp[10]^temp[18]^temp[19]^temp[20]^temp[21]^temp[22]^temp[23]^temp[24]^temp[25]^temp[33]^temp[34]^temp[35]^temp[36]^temp[37]^temp[38]^temp[39]^temp[40]^temp[49]^temp[50]^temp[51]^temp[52]^temp[53]^temp[54]^temp[55]^temp[56];	
			q[4] = temp[11]^temp[12]^temp[13]^temp[14]^temp[15]^temp[16]^temp[17]^temp[18]^temp[19]^temp[20]^temp[21]^temp[22]^temp[23]^temp[24]^temp[25]^temp[41]^temp[42]^temp[43]^temp[44]^temp[45]^temp[46]^temp[47]^temp[48]^temp[49]^temp[50]^temp[51]^temp[52]^temp[53]^temp[54]^temp[55]^temp[56];
			q[5] = temp[26]^temp[27]^temp[28]^temp[29]^temp[30]^temp[31]^temp[32]^temp[33]^temp[34]^temp[35]^temp[36]^temp[37]^temp[38]^temp[39]^temp[40]^temp[41]^temp[42]^temp[43]^temp[44]^temp[45]^temp[46]^temp[47]^temp[48]^temp[49]^temp[50]^temp[51]^temp[52]^temp[53]^temp[54]^temp[55]^temp[56];	
			q[6] = temp[57]^temp[58]^temp[59]^temp[60]^temp[61]^temp[62]^temp[63];
		
			
		   for(i=6; i>=0; i=i-1)
			begin
				if(p[i] == q[i])
				r[i] = 0;
				else if (p[i] != q[i])
				r[i] = 1;                // error position in input data in binary form.
			end
			
			/*t[0] = 0;
			t[1] = 1;
			t[2] = 3;
			t[3] = 7;
			t[4] = 15;
			t[5] = 31;
			t[6] = 63;
			
		for (i=0; i<7; i=i+1)
      begin
			if (r > t[i])
			count = count + 1;
			else if (r < t[i])
			c = c + 1;
		end */
		// updated value of r that gives error position in the temp data.
		//k = r-1-count;
		
		corrected_out[70:0] = data_in[70:0];
		
		if(corrected_out[r-1] == 1'b0)
		corrected_out[r-1] = 1;
		else if(corrected_out[r-1] == 1'b1)
		corrected_out[r-1] = 0;
		
		   k[0] = corrected_out[0];
			k[1] = corrected_out[1];
			k[2] = corrected_out[3];
			k[3] = corrected_out[7];
			k[4] = corrected_out[15];
			k[5] = corrected_out[31];
			k[6] = corrected_out[63];
			
			decoded_out[0] = corrected_out[2];
			decoded_out[1] = corrected_out[4]; 
			decoded_out[2] = corrected_out[5];
			decoded_out[3] = corrected_out[6];
			decoded_out[4] = corrected_out[8];
			decoded_out[5] = corrected_out[9];
			decoded_out[6] = corrected_out[10];
			decoded_out[7] = corrected_out[11];
			decoded_out[8] = corrected_out[12];
			decoded_out[9] = corrected_out[13];
			decoded_out[10] = corrected_out[14];
			decoded_out[11] = corrected_out[16];
			decoded_out[12] = corrected_out[17];
			decoded_out[13] = corrected_out[18];
			decoded_out[14] = corrected_out[19];
			decoded_out[15] = corrected_out[20];
			decoded_out[16] = corrected_out[21];
			decoded_out[17] = corrected_out[22];
			decoded_out[18] = corrected_out[23];
			decoded_out[19] = corrected_out[24];
			decoded_out[20] = corrected_out[25];
			decoded_out[21] = corrected_out[26];
			decoded_out[22] = corrected_out[27];
			decoded_out[23] = corrected_out[28];
			decoded_out[24] = corrected_out[29];
			decoded_out[25] = corrected_out[30];
			decoded_out[26] = corrected_out[32];
			decoded_out[27] = corrected_out[33];
			decoded_out[28] = corrected_out[34];
			decoded_out[29] = corrected_out[35];
			decoded_out[30] = corrected_out[36];
			decoded_out[31] = corrected_out[37];
			decoded_out[32] = corrected_out[38];
			decoded_out[33] = corrected_out[39];
			decoded_out[34] = corrected_out[40];
         decoded_out[35] = corrected_out[41];
			decoded_out[36] = corrected_out[42];
			decoded_out[37] = corrected_out[43];
			decoded_out[38] = corrected_out[44];
			decoded_out[39] = corrected_out[45];
			decoded_out[40] = corrected_out[46];
			decoded_out[41] = corrected_out[47];
			decoded_out[42] = corrected_out[48];
			decoded_out[43] = corrected_out[49];
			decoded_out[44] = corrected_out[50];
			decoded_out[45] = corrected_out[51];
			decoded_out[46] = corrected_out[52];
			decoded_out[47] = corrected_out[53];
			decoded_out[48] = corrected_out[54];
			decoded_out[49] = corrected_out[55];
			decoded_out[50] = corrected_out[56];
			decoded_out[51] = corrected_out[57];
			decoded_out[52] = corrected_out[58];
			decoded_out[53] = corrected_out[59];
			decoded_out[54] = corrected_out[60];
			decoded_out[55] = corrected_out[61];
			decoded_out[56] = corrected_out[62];
			decoded_out[57] = corrected_out[64];
			decoded_out[58] = corrected_out[65];
			decoded_out[59] = corrected_out[66];
			decoded_out[60] = corrected_out[67];
			decoded_out[61] = corrected_out[68];
			decoded_out[62] = corrected_out[69];
			decoded_out[63] = corrected_out[70];
		 
					
		end
end
endmodule
