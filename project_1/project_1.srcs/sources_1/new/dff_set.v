`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/06/29 12:46:46
// Design Name: 
// Module Name: dff_set
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


module dff_set #(
    parameter DW=32
)
(
    input wire clk,
    input wire rst,
    input wire [DW-1:0] set_data,
    input wire [DW-1:0] data_i,
    output reg [DW-1:0] data_o
);

    always@(posedge clk or negedge rst)
        if(!rst)
            data_o <= set_data;
        else
            data_o <= data_i;
endmodule
