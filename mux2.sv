`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/15/2017 04:14:59 PM
// Design Name: 
// Module Name: mux2
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


module mux2 #(
    parameter WIDTH = 64
)(
    input logic[WIDTH-1:0] d0,d1,
    input logic s,
    output logic[WIDTH-1:0]y
    );
    
    assign y = (s == 0) ? d0:
                (s == 1) ? d0:
                1'bz;
//    always begin
//        if (s == 0) begin
//            y <= d0;
//        end
//        else if (s == 1) begin
//            y <= d1;
//        end
//    end
endmodule
