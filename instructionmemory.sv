`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/15/2017 02:57:26 PM
// Design Name: 
// Module Name: instructionmemory
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


module instructionmemory #(
    parameter INS_ADDRESS = 9,
    parameter INS_W = 32
    )(
    input logic [ INS_ADDRESS -1:0] ra , // Read address of the instruction memory ,
    // comes from PC
    output logic [ INS_W -1:0] rd // Read Data
    );
logic [INS_W -1 :0] Inst_mem [(2**( INS_ADDRESS -2)) -1:0];

assign rd = Inst_mem [ra[ INS_ADDRESS -1:2]]; // Take 7 upper bits of address .
                                              // each instruction has 32 bits (4 byte )

// write the program in binary code into the Inst_mem
assign Inst_mem [0] = 32'h00007033 ;
// 0000 0000 0000 00001 110 00000 011 0011; and r0 = r0 & r0        h0
assign Inst_mem [1] = 32'h00100093 ;
// 0000 0000 0001 00000 000 00001 001 0011; addi r1 = r0 + h1       h1
assign Inst_mem [2] = 32'h00200113 ;
// 0000 0000 0010 00000 000 00010 001 0011; addi r2 = r0 + h2       h2
assign Inst_mem [3] = 32'h00208433 ;
// 0000000 00010 00001 000 01000 011 0011; add r8 = r1+r2           h3
endmodule
