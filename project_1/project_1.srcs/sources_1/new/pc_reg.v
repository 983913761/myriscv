`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/06/23 12:23:12
// Design Name: 
// Module Name: pc_reg
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


module pc_reg(
    input wire          clk,
    input wire          rst,
    output reg [31:0]   pc_o
    );
    
    always@(posedge clk or negedge rst)
    begin
        if(!rst)
            begin
                pc_o <= 32'd0;
            end
        else
            begin
                pc_o <= pc_o + 'd4;
            end
    end
endmodule
