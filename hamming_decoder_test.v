`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   19:36:09 04/07/2022
// Design Name:   hamming_decoder
// Module Name:   D:/verilog/course_project/hamming_decoder_test.v
// Project Name:  course_project
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: hamming_decoder
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module hamming_decoder_test;

	// Inputs
	reg [70:0] data_in;
	reg enable;

	// Outputs
	wire [70:0] corrected_out;
	wire [63:0] decoded_out;
	wire [63:0] temp;
	wire [6:0] r;

	// Instantiate the Unit Under Test (UUT)
	hamming_decoder uut (
		.data_in(data_in), 
		.corrected_out(corrected_out),
      .decoded_out(decoded_out),		
		.enable(enable), 
		.temp(temp), 
		.r(r)
	);

	initial begin
		// Initialize Inputs
		
		enable = 1;
		data_in = 71'b01010101101010101010101010101010101010100101010101010101101010100101111;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
      
endmodule

