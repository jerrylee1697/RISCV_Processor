`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/22/2017 02:21:09 PM
// Design Name: 
// Module Name: controller
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


module controller(
    input [6:0] opcode,
    
    output ALUSrc,
    
    output MemtoReg,
    
    output RegWrite,
    output MemRead,
    output MemWrite,
    output [1:0] ALUOp
   
    );
    
    assign ALUOp[0] = (opcode == 7'b0110011)? 1'b0:
                    ((opcode == 7'b0000011) ? 1'b0:
                    ((opcode == 7'b0010011) ? 1'b0:
                    ((opcode == 7'b1100111) ? 1'b0:
                    ((opcode == 7'b0100011) ? 1'b0:
                    1'bz))));
    assign ALUOp[1] = (opcode == 7'b0110011)? 1'b1:
                    ((opcode == 7'b0000011) ? 1'b0:
                    ((opcode == 7'b0010011) ? 1'b0:
                    ((opcode == 7'b1100111) ? 1'b0:
                    ((opcode == 7'b0100011) ? 1'b0:
                    1'bz))));
    assign MemWrite = (opcode == 7'b0110011)? 1'b0:
                    ((opcode == 7'b0000011) ? 1'b0:
                    ((opcode == 7'b0010011) ? 1'b0:
                    ((opcode == 7'b1100111) ? 1'b0:
                    ((opcode == 7'b0100011) ? 1'b1:
                    1'bz))));
    assign MemRead = (opcode == 7'b0110011)? 1'b0:
                    ((opcode == 7'b0000011) ? 1'b1:
                    ((opcode == 7'b0010011) ? 1'b1: // Wrong & irrevelant
                    ((opcode == 7'b1100111) ? 1'b1:
                    ((opcode == 7'b0100011) ? 1'b0:
                    1'bz))));
    assign RegWrite = (opcode == 7'b0110011)? 1'b1:
                    ((opcode == 7'b0000011) ? 1'b1:
                    ((opcode == 7'b0010011) ? 1'b1:
                    ((opcode == 7'b1100111) ? 1'b1:
                    ((opcode == 7'b0100011) ? 1'b0:
                    1'bz))));
    assign MemtoReg = (opcode == 7'b0110011)? 1'b0:
                    ((opcode == 7'b0000011) ? 1'b1:
                    ((opcode == 7'b0010011) ? 1'b0: // originall 1'b1 but testing
                    ((opcode == 7'b1100111) ? 1'b1:
                    ((opcode == 7'b0100011) ? 1'bx:
                    1'bz))));
    assign ALUSrc = (opcode == 7'b0110011)? 1'b0:
                    ((opcode == 7'b0000011) ? 1'b1:
                    ((opcode == 7'b0010011) ? 1'b1:
                    ((opcode == 7'b1100111) ? 1'b1:
                    ((opcode == 7'b0100011) ? 1'b1:
                    1'bz))));
endmodule
