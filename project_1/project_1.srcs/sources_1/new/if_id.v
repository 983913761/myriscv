`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/06/27 18:20:19
// Design Name: 
// Module Name: if_id
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
`include "defines.v"

module if_id(
    input clk,
    input rst,
    input wire [31:0]   inst_i,
    input wire [31:0]   inst_addr_i,
    output wire [31:0]  inst_addr_o,
    output reg [31:0]  inst_o
    );
    
    dff_set #(32) dff1(clk,rst,`INST_NOP,inst_i,inst_o);
    
    dff_set #(32) dff2(clk,rst,32'b0,inst_addr_i,inst_addr_o);
    
endmodule

