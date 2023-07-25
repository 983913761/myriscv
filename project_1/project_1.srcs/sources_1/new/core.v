`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/07/07 12:59:24
// Design Name: 
// Module Name: core
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


module core(
    input wire clk,
    input wire rst_n,
    
    output wire [31:0] inst_addr_o,
    input  wire [31:0] inst_i
    );
    
    wire [31:0] pc2if_pc_addr;
    
    wire [31:0] if2if_id_inst_addr;
    wire [31:0] if2if_id_inst;
    
    wire [31:0] if_id2id_inst_addr;
    wire [31:0] if_id2id_inst;
    
    wire [4:0] id2regs_rs1_addr;
    wire [4:0] id2regs_rs2_addr;
    wire [31:0] regs2id_rs1_data;
    wire [31:0] regs2id_rs2_data;
    wire [31:0] id2id_ex_inst;
    wire [31:0] id2id_ex_inst_addr;  
    wire [31:0] id2id_ex_op1;
    wire [31:0] id2id_ex_op2;
    wire [4:0]  id2id_ex_rd_addr;
    wire        id2id_ex_reg_wen;  
    
    wire [31:0] id_ex2ex_inst;
    wire [31:0] id_ex2ex_inst_addr;
    wire [31:0] id_ex2ex_op1;
    wire [31:0] id_ex2ex_op2;
    wire [4:0] id_ex2ex_rd_addr;
    wire       id_ex2ex_reg_wen;
    
    wire [4:0]  ex2regs_rd_addr;
    wire [31:0] ex2regs_rd_data;
    wire        ex2regs_rd_wen;
    
    wire [31:0] ex2jump_ctrl_jump_addr;
    wire ex2jump_ctrl_jump_en; 
    wire [31:0] jump_ctrl_jump_addr_o;
    wire        jump_ctrl_jump_en_o;
    wire        jump_ctrl_hold_flag_o;
    pc_reg pc_reg_0(
        .clk        (clk),
        .rst_n      (rst_n),
        .jump_addr_i(jump_ctrl_jump_addr_o),
        .jump_en    (jump_ctrl_jump_en_o),        
        .pc_addr_o  (pc2if_pc_addr)
    );
    
    ifetch if_0(
        .pc_addr_i          (pc2if_pc_addr),
        .rom_inst_i         (inst_i),
        .if2rom_addr_o      (inst_addr_o),
        .inst_addr_o        (if2if_id_inst_addr),
        .inst_o             (if2if_id_inst)
    );
    
    if_id if_id_o(
        .clk            (clk),
        .rst_n          (rst_n),
        .hold_flag_i    (jump_ctrl_hold_flag_o),
        .inst_i         (if2if_id_inst),
        .inst_addr_i    (if2if_id_inst_addr),
        .inst_addr_o    (if_id2id_inst_addr),
        .inst_o         (if_id2id_inst)                
    );
     
    id id_0(
        .inst_i         (if_id2id_inst),
        .inst_addr_i    (if_id2id_inst_addr),
        .rs1_addr_o     (id2regs_rs1_addr),
        .rs2_addr_o     (id2regs_rs2_addr),
        .rs1_data_i     (regs2id_rs1_data),
        .rs2_data_i     (regs2id_rs2_data),
        .inst_o         (id2id_ex_inst),
        .inst_addr_o    (id2id_ex_inst_addr),
        .op1_o          (id2id_ex_op1),
        .op2_o          (id2id_ex_op2),
        .rd_addr_o      (id2id_ex_rd_addr),
        .reg_wen        (id2id_ex_reg_wen)
    );
    
    regs regs_0(
    .clk                (clk),
    .rst_n              (clk_n),
    .reg1_raddr_i       (id2regs_rs1_addr),
    .reg2_raddr_i       (id2regs_rs2_addr),
    .reg1_rdata_o       (regs2id_rs1_data),
    .reg2_rdata_o       (regs2id_rs2_data),
    .reg_waddr_i        (ex2regs_rd_addr),
    .reg_wdata_i        (ex2regs_rd_data),
    .reg_wen            (ex2regs_rd_wen)
    );
    
    id_ex id_ex_0(
    .clk            (clk),
    .rst_n          (rst_n),
    .hold_flag_i    (jump_ctrl_hold_flag_o),
    .inst_i         (id2id_ex_inst),
    .inst_addr_i    (id2id_ex_inst_addr),
    .op1_i          (id2id_ex_op1),
    .op2_i          (id2id_ex_op2),
    .rd_addr_i      (id2id_ex_rd_addr),
    .reg_wen_i      (id2id_ex_reg_wen),
    .inst_o         (id_ex2ex_inst),
    .inst_addr_o    (id_ex2ex_inst_addr),
    .op1_o          (id_ex2ex_op1),
    .op2_o          (id_ex2ex_op2),
    .rd_addr_o      (id_ex2ex_rd_addr),
    .reg_wen_o      (id_ex2ex_reg_wen)
    );
    

    ex ex_0(
        .inst_i         (id_ex2ex_inst),    
        .inst_addr_i    (id_ex2ex_inst_addr),
        .op1_i          (id_ex2ex_op1),     
        .op2_i          (id_ex2ex_op2),     
        .rd_addr_i      (id_ex2ex_rd_addr),  
        .rd_wen_i       (id_ex2ex_reg_wen),         
        .rd_addr_o      (ex2regs_rd_addr), 
        .rd_data_o      (ex2regs_rd_data), 
        .rd_wen_o       (ex2regs_rd_wen),
        .jump_addr_o    (ex2jump_ctrl_jump_addr),
        .jump_en_o      (ex2jump_ctrl_jump_en),
        .hold_flag_o     (ex2jump_ctrl_hold_flag)
    );

    jump_ctrl jump_ctrl_0(
        .jump_addr_i    (ex2jump_ctrl_jump_addr),
        .jump_en_i      (ex2jump_ctrl_jump_en),
        .hold_flag_i    (ex2jump_ctrl_hold_flag),
        .jump_addr_o    (jump_ctrl_jump_addr_o),
        .jump_en_o      (jump_ctrl_jump_en_o),
        .hold_flag_o    (jump_ctrl_hold_flag_o)
    );
endmodule
