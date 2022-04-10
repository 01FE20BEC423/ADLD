`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   16:07:11 04/06/2022
// Design Name:   hamming_encoder
// Module Name:   D:/verilog/course_project/hamming_encoder_test.v
// Project Name:  course_project
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: hamming_encoder
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module hamming_encoder_test;

	// Inputs
	reg [63:0] data_in;
	reg enable;

	// Outputs
	wire [70:0] encoded_data;

	// Instantiate the Unit Under Test (UUT)
	hamming_encoder uut (
		.data_in(data_in), 
		.encoded_data(encoded_data), 
		.enable(enable)
	);

	initial begin
		// Initialize Inputs
		
		enable = 1;
      data_in = 64'b0101010101010101010101010101010101010101010101010101010101010101;
		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
      
endmodule

