`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/12/18 16:07:00
// Design Name: 
// Module Name: led_run_sim
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


module led_run_sim;

    reg clk;        //输入reg，输出wire			reg：比特数据	wire：线连接
    reg rst_n;
    wire [3:0] led;		//输入wire类型，线连接
        //做好连线准备
    led_run led_run_sim(
        .clk(clk), 
        .rst_n(rst_n), 
        .led(led)
    );
    
    //激励		initial过程语句不带触发条件，其中语句序列只执行一次。常用于仿真模块中对激励向量的描述，是面向模拟仿真的过程语句
    initial		//过程语句initial，中，必须对reg类型变量赋值	initial用于仿真中的初始化，只执行一次
        begin
            clk = 1;    //高
            rst_n = 0;
            #200
            rst_n = 1;  //200ns后置位
        end
        
    //时钟周期20ns，10ns取反，50MHz时钟频率，
    always #10 clk = ~clk;		//always中语句不断重复执行

endmodule
