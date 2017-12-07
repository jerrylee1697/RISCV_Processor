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
    input logic [INS_ADDRESS-1:0] ra,
    output logic [INS_W-1:0] rd
    );
    
    reg [INS_W-1:0] Inst_mem [(2**(INS_ADDRESS-2))-1:0];
    
    assign rd = Inst_mem[ra[INS_ADDRESS-1:2]];
    
    assign Inst_mem[0] = 32'h00007033;
    assign Inst_mem[1] = 32'h00100093;
    assign Inst_mem[2] = 32'h00200113;
    assign Inst_mem[3] = 32'h00208433;
    
endmodule
