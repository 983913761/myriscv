`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/07/05 16:08:49
// Design Name: 
// Module Name: ex
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


module ex(
    input wire [31:0]   inst_i,
    input wire [31:0]   inst_addr_i,
    input wire [31:0]   op1_i,
    input wire [31:0]   op2_i,
    input wire [4:0]   rd_addr_i,
    input wire [31:0]   rd_wen_i,
    
    output reg[4:0]     rd_addr_o,
    output reg[31:0]    rd_data_o,
    output reg          rd_wen_o
);

    wire [6:0]  opcode;
    wire [4:0]  rd;
    wire [2:0]  func3;
    wire [4:0]  rs1;
    wire [11:0] imm;
    wire [6:0]  func7;
    wire [4:0]  rs2; 

    assign opcode = inst_i[6:0];
    assign rd     = inst_i[11:7];
    assign func3  = inst_i[14:12];
    assign rs1    = inst_i[19:15];
    assign rs2    = inst_i[24:20];
    assign imm    = inst_i[31:20];
    assign func7  = inst_i[31:25];
    
    always @(*)
    begin
        case(opcode)
            `INST_TYPE_I:
            begin
                case(func3)
                    `INST_ADDI:
                        begin
                            rd_data_o = op1_i + op2_i;
                            rd_addr_o = rd_addr_i;
                            rd_wen_o = 1'b1;
                        end
                    
                    default:
                        begin
                            rd_data_o = 32'b0;
                            rd_addr_o = 5'b0;
                            rd_wen_o = 1'b0;
                        end
                endcase
            end
            
         `INST_TYPE_R_M:
            begin
                case(func3)
                    `INST_ADD_SUB:
                        begin
                            if(func7 == 7'b0)
                            begin
                                rd_data_o = op1_i + op2_i;
                                rd_addr_o = rd_addr_i;
                                rd_wen_o = 1'b1;
                            end
                            else
                            begin
                                rd_data_o = op2_i - op1_i;
                                rd_addr_o = rd_addr_i;
                                rd_wen_o = 1'b1;
                            end
                        end
                    
                    default:
                        begin
                            rd_data_o = 32'b0;
                            rd_addr_o = 5'b0;
                            rd_wen_o = 1'b0;
                        end
                endcase
            end          
                  
            default:
                begin
                    rd_data_o = 32'b0;
                    rd_addr_o = 5'b0;
                    rd_wen_o = 1'b0;
                end
        endcase
    end
endmodule
