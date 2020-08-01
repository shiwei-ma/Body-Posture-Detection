`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/07/31 19:56:53
// Design Name: 
// Module Name: Video_Generator
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

module Video_Generator(
    input clk,
    input rst_n,
    input RGB_VDE,
    input [11:0]Set_X,
    input [11:0]Set_Y,
    input signed [9:0] move_X,
    input signed [9:0] move_Y,
    output reg[23:0]RGB_Data=24'hffff00    //RBG
    );
    
    reg  [11:0]    X_L=910   ;
    reg  [11:0]    X_R=1010  ;
    reg  [11:0]    Y_L=490   ;
    reg  [11:0]    Y_R=590   ;

    always@(*)
        begin
            if(Set_X>=X_L && Set_X<X_R)
                begin
                    if(Set_Y>=Y_L && Set_Y<Y_R)
                        begin
                            if(Set_Y<=Y_R-20)
                                RGB_Data <= 0;
                            else 
                                RGB_Data <= 24'hff0000;
                        end
                    else
                        RGB_Data<=24'hffffff;
                end
            else
               RGB_Data<=24'hffffff; 
        end


        always  @(posedge clk or negedge rst_n)begin
            if(rst_n==1'b0)begin
                X_L <= 910;
                X_R <= 1010;
            end
            else begin
                X_L <= X_L + move_X;
                X_R <= X_R + move_X;
            end
        end

        always  @(posedge clk or negedge rst_n)begin
            if(rst_n==1'b0)begin
                Y_L <= 910;
                Y_R <= 1010;
            end
            else begin
                Y_L <= Y_L + move_Y;
                Y_R <= Y_R + move_Y;
            end
        end

endmodule