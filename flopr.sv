`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/15/2017 02:53:45 PM
// Design Name: 
// Module Name: flopr
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


module flopr #(
    parameter WIDTH = 9
)(
    input logic clk, reset,
    input logic [WIDTH-1:0] d,
    output logic [WIDTH-1:0] q  
    );
    
    always @(posedge clk) begin
        if (reset == 1) begin
            q <= 1'b0;
        end
        else begin
            q <= d;
        end
    end
endmodule
