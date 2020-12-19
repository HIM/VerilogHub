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

    reg clk;     
    reg rst_n;
    wire [3:0] led;		
        
    led_run led_run_sim(
        .clk(clk), 
        .rst_n(rst_n), 
        .led(led)
    );
    
    //º§¿¯
    initial
        begin
            clk = 1;    
            rst_n = 0;
            #200
            rst_n = 1;  //200ns∫Û÷√Œª
        end
        
    always #10 clk = ~clk;		

endmodule
