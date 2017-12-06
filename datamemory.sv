`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/15/2017 04:26:31 PM
// Design Name: 
// Module Name: datamemory
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


module datamemory #(
    parameter DM_ADDRESS = 9 ,
    parameter DATA_W = 64
 )(
    input logic MemRead , // comes from control unit
    input logic MemWrite , // Comes from control unit
    input logic [ DM_ADDRESS -1:0] a , // Read / Write address - 9 LSB bits of the ALU output
    input logic [ DATA_W -1:0] wd , // Write Data
    output logic [ DATA_W -1:0] rd // Read Data
);
// Your Code . **/
logic [DATA_W - 1:0] Memory [DATA_W - 1:0];

always @(MemRead or MemWrite or a or wd) begin
    if (MemRead == 1) begin
        rd = Memory[a];
    end
    else if (MemWrite == 1) begin
        Memory[a] = wd;
    end
    
//    assign rd = (MemRead == 1) ? Memory[a]:
//                64'd0;
end
endmodule
