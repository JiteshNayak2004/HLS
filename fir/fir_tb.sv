`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 21.04.2023 17:31:50
// Design Name: 
// Module Name: FIR_Filter_tb
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


module FIR_Filter_tb();
reg clk, reset;
reg [15:0] data_in;
wire [15:0] data_out; 

FIR_Filter inst0(clk, reset, data_in, data_out);

// input sine wave data
initial
$readmemb("signal.data", RAMM);

// Create the RAM
reg [15:0] RAMM [31:0]; 

//Reset Signal
assign reset = 1'b0;
// create a clock
initial 
clk = 0;
always 
#10 clk = ~ clk;  

// Read RAMM data and give to design
always@(posedge clk)
    data_in <= RAMM[Address]; 
    
// Address counter
reg [4:0] Address; 
initial
Address = 1; 
always@(posedge clk)
begin
    if (Address == 31)
        Address = 0; 
    else
        Address = Address + 1; 
end     

endmodule
