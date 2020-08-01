`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/07/31 19:56:53
// Design Name: 
// Module Name: Gyro_Demo
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


module Gyro_Demo(
    input clk_100MHz,
    inout Gyro_IIC_SDA,
    output Gyro_IIC_SCL,
    output [15:0]Gyro_Data_X,
    output [15:0]Gyro_Data_Y,
    output [15:0]Gyro_Data_Z,
    output [15:0]Acc_Data_X,
    output [15:0]Acc_Data_Y,
    output [15:0]Acc_Data_Z,
    
    //add
    input IIC_SDA_In,
    output sda_dir,
    output SDA_Out
    );
    //Clock
    wire clk_100MHz_System;
    wire clk_10MHz;
    //Control Output
    reg Ctrl_Temp_Out=1;
    reg Ctrl_Gyro_Out=1;
    reg Ctrl_Acc_Out=1;
    //Gyro part out
    wire [7:0]Addr;
    wire [15:0]Reg_Addr;
    wire [7:0]Reg_Data;
    wire [15:0]Temp_Data;
    //IIC
    wire Ctrl_IIC;
    wire IIC_Write;
    wire IIC_Read;
    wire [7:0]IIC_Read_Data;
    wire IIC_Busy;
    wire Reg_2Addr;   //Whether the register address is double address bit,0 is single register address, 1 is double.

    //Frequency divider
    clk_wiz_0 clk_10(.clk_out1(clk_100MHz_System),.clk_out2(clk_10MHz),.clk_in1(clk_100MHz));
       
    Driver_Gyro Driver_Gyro0(
        .clk_100MHz(clk_100MHz_System),
        .clk_10MHz(clk_10MHz),
        .IIC_Busy(IIC_Busy),
        .Enable_Gyro(1),
        .IIC_Data(IIC_Read_Data),
        .Ctrl_Temp_Out(Ctrl_Temp_Out),
        .Ctrl_Gyro_Out(Ctrl_Gyro_Out),
        .Ctrl_Acc_Out(Ctrl_Acc_Out),
        .Addr(Addr),
        .Reg_Addr(Reg_Addr),
        .Reg_Data(Reg_Data),
        .Temp_Data(Temp_Data),
        .Gyro_Data_X(Gyro_Data_X),
        .Gyro_Data_Y(Gyro_Data_Y),
        .Gyro_Data_Z(Gyro_Data_Z),
        .Acc_Data_X(Acc_Data_X),
        .Acc_Data_Y(Acc_Data_Y),
        .Acc_Data_Z(Acc_Data_Z),
        .IIC_Write(IIC_Write),
        .IIC_Read(IIC_Read),
        .Reg_2Addr(Reg_2Addr),
        .Ctrl_IIC(Ctrl_IIC)
        );
        
    Driver_IIC Driver_IIC0(
        .clk(clk_100MHz_System),        // input wire clk
        .Rst(Ctrl_IIC),                 // input wire Rst
        .Addr(Addr),                    // input wire [7 : 0] Addr
        .Reg_Addr(Reg_Addr),            // input wire [15 : 0] Reg_Addr
        .Data(Reg_Data),                // input wire [7 : 0] Data
        .IIC_Write(IIC_Write),          // input wire IIC_Write
        .IIC_Read(IIC_Read),            // input wire IIC_Read
        .IIC_Read_Data(IIC_Read_Data),  // output wire [7 : 0] IIC_Read_Data
        .IIC_Busy(IIC_Busy),            // output wire IIC_Busy
        .Reg_2Addr(Reg_2Addr),          // input wire Reg_2Addr
        .IIC_SCL(Gyro_IIC_SCL),         // output wire IIC_SCL
        .IIC_SDA_In(IIC_SDA_In),    // input wire IIC_SDA_In
        .SDA_Dir(sda_dir),              // output wire SDA_Dir
        .SDA_Out(SDA_Out)        // output wire SDA_Out
    );
endmodule