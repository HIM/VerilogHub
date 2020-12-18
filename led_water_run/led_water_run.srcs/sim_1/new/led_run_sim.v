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

    reg clk;        //����reg�����wire			reg����������	wire��������
    reg rst_n;
    wire [3:0] led;		//����wire���ͣ�������
        //��������׼��
    led_run led_run_sim(
        .clk(clk), 
        .rst_n(rst_n), 
        .led(led)
    );
    
    //����		initial������䲻�����������������������ִֻ��һ�Ρ������ڷ���ģ���жԼ���������������������ģ�����Ĺ������
    initial		//�������initial���У������reg���ͱ�����ֵ	initial���ڷ����еĳ�ʼ����ִֻ��һ��
        begin
            clk = 1;    //��
            rst_n = 0;
            #200
            rst_n = 1;  //200ns����λ
        end
        
    //ʱ������20ns��10nsȡ����50MHzʱ��Ƶ�ʣ�
    always #10 clk = ~clk;		//always����䲻���ظ�ִ��

endmodule
