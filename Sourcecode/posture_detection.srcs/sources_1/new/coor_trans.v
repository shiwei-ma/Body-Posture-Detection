`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/07/31 19:56:53
// Design Name: 
// Module Name: coor_trans
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


module	coor_trans
#(
	parameter	IMAGE_W	=	1920,
	parameter	IMAGE_H	=	1080	

)
(
	input					clk,
	input					rst_n,
	
	input	signed	[9:0]	angle,
	input	signed	[31:0]	x_in,
	input	signed	[31:0]	y_in,
	
	
	output	signed	[31:0]	x_out,
	output	signed	[31:0]	y_out

);

wire	signed	[31:0]	x_wire;
wire	signed	[31:0]	y_wire;

wire	signed	[31:0]	x_rotate_temp;
wire	signed	[31:0]	y_rotate_temp;

wire	signed	[31:0]	x_rotate;
wire	signed	[31:0]	y_rotate;

wire	signed	[9:0]	sin_value;
wire	signed	[9:0]	cos_value;

coor_trans_forward coor_trans_forward_inst
(
	.clk	(	clk			),
	.rst_n	(	rst_n		),
	.x_in	(	x_in		) ,	// input [31:0] x_in
	.y_in	(	y_in		) ,	// input [31:0] y_in
	.x_out	(	x_wire		) ,	// output [31:0] x_out
	.y_out	(	y_wire		) 	// output [31:0] y_out
);

defparam coor_trans_forward_inst.IMAGE_W = IMAGE_W;
defparam coor_trans_forward_inst.IMAGE_H = IMAGE_H;

cos_table cos_table_inst
(
	.clk		(	clk			),
	.rst_n		(	rst_n		),
	.angle		(	angle		) ,	// input [9:0] angle
	.cos_value	(	cos_value	) 	// output [9:0] cos_value
);


sin_table sin_table_inst
(
	.clk		(	clk			),
	.rst_n		(	rst_n		),
	
	.angle		(	angle		) ,	// input [9:0] angle
	.sin_value	(	sin_value	) 	// output [9:0] sin_value
);
 
assign	x_rotate_temp	=    ( x_wire <<< 8 ) * cos_value	-	( y_wire <<< 8 ) * sin_value;	
assign	y_rotate_temp	=    ( x_wire <<< 8 ) * sin_value	+	( y_wire <<< 8 ) * cos_value;

assign	x_rotate		=	x_rotate_temp	>>>	16;
assign	y_rotate		=	y_rotate_temp	>>>	16;


coor_trans_reverse coor_trans_reverse_inst
(
	.clk	(	clk			),
	.rst_n	(	rst_n		),	
	
	.x_in	(	x_rotate		) ,	// input [31:0] x_in
	.y_in	(	y_rotate		) ,	// input [31:0] y_in
	.x_out	(	x_out		) ,	// output [31:0] x_out
	.y_out	(	y_out		) 	// output [31:0] y_out
);


defparam coor_trans_reverse_inst.IMAGE_W = IMAGE_W;
defparam coor_trans_reverse_inst.IMAGE_H = IMAGE_H;


endmodule	

