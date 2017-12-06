`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/02/2017 01:12:28 PM
// Design Name: 
// Module Name: RISC-V
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


module RISC_V #(
    parameter DATA_W = 64)
    ( input logic clk , reset , // clock and reset signals
    output logic [DATA_W -1:0] ALU_Result, // The ALU_Result
    output logic  [31:0] INS_out,
    output logic [DATA_W-1:0] mux_out,
    output logic [DATA_W-1:0] rd1_out,
    output logic [DATA_W-1:0] rd2_out,
    output logic [8:0] PC_out
    );
   
    wire RegWrite; 
    wire MemtoReg;
    wire ALUSrc; 
    wire MemWrite;
    wire MemRead; 
    wire ALU_CC;
    wire [6:0]opcode; 
    wire funct7;
    wire funct3;
    wire ALUOp; 
    wire [31:0]instruction;
        
    datapath DP(
        .clk(clk), 
        .reset(reset),
        .RegWrite(RegWrite), 
        .MemtoReg(MemtoReg),
        .ALUsrc(ALUSrc), 
        .MemWrite(MemWrite),
        .MemRead(MemRead), 
        .ALU_CC(ALU_CC), 
        .ALUresult(ALU_Result), 
        .instruction(instruction), 
        .Mux_out(mux_out), 
        .rd1_out(rd1_out), 
        .rd2_out(rd2_out),
        .PC_output(PC_out)
        );
    
    assign opcode = instruction [6:0];
    assign funct7 = instruction [31:25];
    assign funct3 = instruction [12-14];
    assign INS_out = instruction;
    
    controller ctrl(opcode,
        ALUSrc, MemtoReg,
        RegWrite, MemRead, 
        MemWrite, ALUOp
        );
        
    ALUController ALUctrl(ALUOp, funct7, funct3, ALU_CC);
    
    
    
endmodule
