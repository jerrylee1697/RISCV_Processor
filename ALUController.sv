`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/22/2017 03:22:53 PM
// Design Name: 
// Module Name: ALUController
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


module ALUController(
    // Inputs
    input [1:0] ALUop,  // coming from main control unit
    input [6:0] Funct7, // bits 25 to 31 of the instructions
    input [2:0] Funct3, // bits 12 to 14 of the instructions
    
    // Output
    output [3:0] Operation // operation selection for ALU
    );
    
    assign Operation = (ALUop == 2'b00) ? 4'b0010:
                       ((ALUop[0] == 1'b1) ? 4'b0110:
                       ((ALUop[1] == 1'b1 && Funct7 == 7'b0000000 && Funct3 == 3'b000) ? 4'b0010:
                       ((ALUop[1] == 1'b1 && Funct7 == 7'b0100000 && Funct3 == 3'b000) ? 4'b0110:
                       ((ALUop[1] == 1'b1 && Funct7 == 7'b0000000 && Funct3 == 3'b111) ? 4'b0000:
                       ((ALUop[1] == 1'b1 && Funct7 == 7'b0000000 && Funct3 == 3'b110) ? 4'b0001:
                       4'bzzzz)))));
                       
endmodule
