`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/15/2017 03:14:47 PM
// Design Name: 
// Module Name: regfile
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


module regfile #(
    parameter DATA_WIDTH = 64,
    parameter ADDRESS_WIDTH = 5,
    parameter REGISTER_SIZE = 2**ADDRESS_WIDTH
)(
    input logic clk,
    input logic RegWrite,
    input logic [ADDRESS_WIDTH-1:0] ra1, ra2, wa,
    input logic [DATA_WIDTH-1:0] wd,
    output logic [DATA_WIDTH-1:0] rd1, rd2
    );
    
    logic [REGISTER_SIZE-1:0] reg_file [DATA_WIDTH-1:0];
    
    integer i;
    initial begin
        for (i = 0; i< REGISTER_SIZE; i = i + 1) 
            reg_file[i] <= 0;
    end
    
    always @(posedge clk) begin
        if (RegWrite == 1) begin
            reg_file[wa] <= wd;
        end
    end
    
    assign rd1 = reg_file[ra1];
    assign rd2 = reg_file[ra2];
    
endmodule
