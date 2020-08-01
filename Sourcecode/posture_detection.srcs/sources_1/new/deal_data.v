`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/07/27 08:21:02
// Design Name: 
// Module Name: Deal_data
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

module deal_data(
    clk    , 
    rst_n  ,
    Gryo_Z ,  //输入转动角速度
    g_X    ,  //输入x位移加速度
    g_Y    ,  //输入y位移加速度
    
    angle  ,  //输出每秒转过的角度
    move_X ,  //输出x方向移动距离
    move_Y    //输出y方向移动距离
    );

    //参数定义
    parameter      DATA_W =         9;

    //输入信号定义
    input               clk    ;
    input               rst_n  ;
    input signed [16-1:0]      Gryo_Z ;
    input signed [16-1:0]      g_X    ;
    input signed [16-1:0]      g_Y    ;
    //输出信号定义
    output  signed [10-1:0]     angle  ;
    output reg signed [10-1:0]     move_X  ;
    output reg signed [10-1:0]     move_Y  ;
   
    //输出信号reg定义
    reg signed  [10-1:0]       angle  ;

    //中间信号定义
    reg   [27-1:0]      cnt    ;
    wire                add_cnt;
    wire                end_cnt;
    wire signed [30:0]        value  ;
    wire signed [15:0]        G_data ;
    wire signed [15:0]        G_data_1 ;

    reg  signed [16-1:0]      Gryo   ;
    reg  signed [15:0]        gx     ;
    reg  signed [15:0]        gy     ;
    reg  signed [15:0]        v_X    ;
    reg  signed [15:0]        v_Y    ;

    //计数器，计数1s
    always @(posedge clk or negedge rst_n)begin
        if(!rst_n)begin
            cnt <= 0;
        end
        else if(add_cnt)begin
            if(end_cnt)
                cnt <= 0;
            else
                cnt <= cnt + 1;
        end
    end

    assign add_cnt = 1;       
    assign end_cnt = add_cnt && cnt==100_000_000-1 ; 

    //每秒对角速度取样
    always  @(posedge clk or negedge rst_n)begin
        if(rst_n==1'b0)begin
            Gryo <= 0;
        end
        else if(add_cnt && cnt==0)begin
            Gryo <= Gryo_Z;
        end
    end

    //每秒对x加速度取样
    always  @(posedge clk or negedge rst_n)begin
        if(rst_n==1'b0)begin
            gx <= 0;
        end
        else if(add_cnt && cnt==0)begin
            gx <= g_X;
        end
    end

    always  @(posedge clk or negedge rst_n)begin
        if(rst_n==1'b0)begin
            v_X <= 0;
        end
        else if(add_cnt && cnt==100_000_000-3)begin
            v_X <= v_X + gx;
        end
    end


    //每秒对y加速度取样
    always  @(posedge clk or negedge rst_n)begin
        if(rst_n==1'b0)begin
            gy <= 0;
        end
        else if(add_cnt && cnt==0)begin
            gy <= g_Y;
        end
    end

    always  @(posedge clk or negedge rst_n)begin
        if(rst_n==1'b0)begin
            v_Y <= 0;
        end
        else if(add_cnt && cnt==100_000_000-3)begin
            v_Y <= v_Y + gy;
        end
    end

    assign value = Gryo*8750;
    assign G_data = value*314/(1000*1000*18000); 
    assign G_data_1 = (8*G_data_1 + 2*G_data)/10;//滤波

    //求得角度angle
    always  @(posedge clk or negedge rst_n)begin
        if(rst_n==1'b0)begin
            angle <= 0;
        end
        else if(end_cnt)begin
            if(angle>=360)begin 
                angle <= angle - 360;
            end
            else begin 
                angle <= angle + G_data_1;
            end
        end
    end  

    always  @(posedge clk or negedge rst_n)begin
        if(rst_n==1'b0)begin
            move_X <= 0;
        end
        else if(end_cnt)begin
            move_X <= v_X + gx/2;
        end
        else begin 
            move_X <= 0;
        end
    end  

    always  @(posedge clk or negedge rst_n)begin
        if(rst_n==1'b0)begin
            move_Y <= 0;
        end
        else if(end_cnt)begin
            move_Y <= v_Y + gy/2;
        end
        else begin 
            move_Y <= 0;
        end
    end  

endmodule

