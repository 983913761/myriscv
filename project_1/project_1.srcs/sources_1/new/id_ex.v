`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/07/05 15:55:47
// Design Name: 
// Module Name: id_ex
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


module id_ex(
    input wire clk,
    input wire rst_n,
    
    input wire[31:0]    inst_i,
    input wire[31:0]    inst_addr_i,
    input wire[31:0]    op1_i,
    input wire[31:0]    op2_i,
    input wire[4:0]     rd_addr_i,
    input wire          reg_wen_i,
    
    output wire[31:0]   inst_o,
    output wire[31:0]   inst_addr_o,
    output wire[31:0]   op1_o,
    output wire[31:0]   op2_o,
    output wire[4:0]    rd_addr_o,
    output wire         reg_wen_o
    );
    
    dff_set #(32) dff1(clk,rst_n,`INST_NOP,inst_i,inst_o);
    
    dff_set #(32) dff2(clk,rst_n,32'b0,inst_addr_i,inst_addr_o);
    
    dff_set #(32) dff3(clk,rst_n,32'b0,op1_i,op1_o);
    
    dff_set #(32) dff4(clk,rst_n,32'b0,op2_i,op2_o);
    
    dff_set #(5) dff5(clk,rst_n,5'b0,rd_addr_i,rd_addr_o);
    
    dff_set #(1) dff6(clk,rst_n,1'b0,reg_wen_i,reg_wen_o);
endmodule
