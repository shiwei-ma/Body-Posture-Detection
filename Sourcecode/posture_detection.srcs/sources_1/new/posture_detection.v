`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/07/31 19:56:53
// Design Name: 
// Module Name: posture_detection
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

module posture_detection(
    input clk,
    input rst_n,
    //gyro
    inout Gyro_IIC_SDA,
    output Gyro_IIC_SCL,
    output IIC_OE,
    output VCCEN,
    output VCC,
    output GND,
    //hdmi
    output TMDS_Tx_Clk_N,
    output TMDS_Tx_Clk_P,
    output [2:0]TMDS_Tx_Data_N,
    output [2:0]TMDS_Tx_Data_P
    
    );
    
    //Clock
    wire clk_100MHz_System;  //100MHz
    wire clk_system; //148.5MHz
    //IIC
    wire Gyro_IIC_SDA_I;
    wire Gyro_IIC_SDA_O;
    wire Gyro_IIC_SDA_T;
    assign IIC_OE=1;
    assign VCCEN=1;
    assign VCC=1;
    assign GND=0;     
    
   //Gyro
   wire [15:0]Gyro_Data_X;
   wire [15:0]Gyro_Data_Y;
   wire [15:0]Gyro_Data_Z;   
   wire [15:0]Acc_Data_X;
   wire [15:0]Acc_Data_Y;
   wire [15:0]Acc_Data_Z;
   
   //deal_data
   wire [15:0]angle;
   wire [15:0]move_X;
   wire [15:0]move_Y;
   
   //hdmi
    wire [23:0]RGB_Data;
    wire [23:0]RGB_In;
    wire RGB_HSync;
    wire RGB_VSync;
    wire RGB_VDE;
   
   //graph trans
    wire      [11:0]    x_in  ;
    wire      [11:0]    y_in  ;
    wire      [11:0]    x_out ;
    wire      [11:0]    y_out ;
   
    clk_wiz_0 clk_148_5(.clk_out1(clk_100MHz_System),.clk_out3(clk_system),.clk_in1(clk));
    //Tri-state gate
    IOBUF Camera_IIC_SDA_IOBUF
           (.I(Gyro_IIC_SDA_O),
            .IO(Gyro_IIC_SDA),
            .O(Gyro_IIC_SDA_I),
            .T(~Gyro_IIC_SDA_T));
    
    deal_data deal_data_0(
        .clk    (clk_100MHz_System), 
        .rst_n  (rst_n),
        .Gryo_Z (Gyro_Data_Z),  //输入转动角速度
        .g_X    (Acc_Data_X),  //x方向加速度
        .g_Y    (Acc_Data_Y),  //y方向加速度      
        .angle  (angle) ,  //输出每扫描一帧图像转过的角度
        .move_X  (move_X),  //X方向移动距离
        .move_Y  (move_Y)   //Y方向移动距离
    );
    
    Gyro_Demo Gyro_Demo_0(
        .clk_100MHz(clk_100MHz_System),
        .Gyro_IIC_SDA(Gyro_IIC_SDA),
        .Gyro_IIC_SCL(Gyro_IIC_SCL),
        .Gyro_Data_X(Gyro_Data_X),
        .Gyro_Data_Y(Gyro_Data_Y),
        .Gyro_Data_Z(Gyro_Data_Z),
        .Acc_Data_X(Acc_Data_X),
        .Acc_Data_Y(Acc_Data_Y),
        .Acc_Data_Z(Acc_Data_Z),
        .IIC_SDA_In(Gyro_IIC_SDA_I),
        .sda_dir(Gyro_IIC_SDA_T),
        .SDA_Out(Gyro_IIC_SDA_O)
    );
    
    //RGBToDvi instantiation
    rgb2dvi_0 rgb2dvi_0(
        .TMDS_Clk_p(TMDS_Tx_Clk_P),
        .TMDS_Clk_n(TMDS_Tx_Clk_N),
        .TMDS_Data_p(TMDS_Tx_Data_P),
        .TMDS_Data_n(TMDS_Tx_Data_N),
        .aRst(0),
        .vid_pData(RGB_Data),
        .vid_pVDE(RGB_VDE),
        .vid_pHSync(RGB_HSync),
        .vid_pVSync(RGB_VSync),
        .PixelClk(clk_system)
    );
    //HDMI driver
    VGA_driver VGA_driver_0(
        .clk(clk_system),        //Clock
        .Rst(1),                 //Reset signal, low reset
        .Video_Mode(0),          //Video format, 0 is 1920*1080@60Hz, 1 is 1280*720@60Hz
        .RGB_In(RGB_In),         //Input data
        .RGB_Data(RGB_Data),     //Output Data
        .RGB_HSync(RGB_HSync),   //Line signal
        .RGB_VSync(RGB_VSync),   //Field signal
        .RGB_VDE(RGB_VDE),       //Data valid signal
        .Set_X(x_in),           //Image coordinate X
        .Set_Y(y_in)            //Image coordinate Y
    );    
    
    Video_Generator Video_Generator_0(
        .clk(clk_system),
        .RGB_VDE(RGB_VDE),
        .Set_X(x_out),
        .Set_Y(y_out),
        .move_X(move_X),
        .move_Y(move_Y),
        .RGB_Data(RGB_In)    //RBG
    );
    
    coor_trans coor_trans_0(
        .clk      (clk  )   ,             
        .rst_n    (rst_n)   ,                     
        .angle    (angle)   ,  
        .x_in     (x_in )   ,  
        .y_in     (y_in )   ,                          
        .x_out    (x_out)   ,
        .y_out    (y_out)      
    );
endmodule

