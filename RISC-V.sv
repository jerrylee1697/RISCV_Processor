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
    output logic [DATA_W -1:0] ALU_Result // The ALU_Result
    );
   
    wire RegWrite; 
    wire MemtoReg;
    wire ALUSrc; 
    wire MemWrite;
    wire MemRead; 
    wire [3:0]ALU_CC;
    wire [6:0]opcode; 
    wire [6:0]funct7;
    wire [2:0]funct3;
    wire [1:0]ALUOp; 
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
        .instruction(instruction)
        );
    
    assign opcode = instruction [6:0];
    assign funct7 = instruction [31:25];
    assign funct3 = instruction [14:12];
    
    controller ctrl(
        .opcode(opcode),
        .ALUSrc(ALUSrc), 
        .MemtoReg(MemtoReg),
        .RegWrite(RegWrite), 
        .MemRead(MemRead), 
        .MemWrite(MemWrite), 
        .ALUOp(ALUOp)
        );
        
    ALUController ALUctrl(
        .ALUop(ALUOp), 
        .Funct7(funct7), 
        .Funct3(funct3), 
        .Operation(ALU_CC)
        );
        
   
endmodule
