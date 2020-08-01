`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/07/31 19:56:53
// Design Name: 
// Module Name: coor_trans_reverse
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module	coor_trans_reverse
#(
	parameter	IMAGE_W	=	1024,
	parameter	IMAGE_H	=	768	

)
(	
	input					clk,
	input					rst_n,
	
	input	signed	[31:0]	x_in,
	input	signed	[31:0]	y_in,
	
	output	 signed	[31:0]	x_out,
	output	 signed	[31:0]	y_out

);
    
    assign        x_out	=	x_in		    +	  (IMAGE_W>>1);
    assign        y_out	=	(IMAGE_H>>1)	-	  y_in;



endmodule