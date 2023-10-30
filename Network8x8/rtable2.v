`timescale 1ns / 1ps
// Using posedge of clk for synchronization and better circuit timing performance
// xno->no. of switches along x-axis, similar stands for yno
module rtable2 #(parameter xno=4,yno=4, RTfile="")(
input clk,
input [$clog2(xno)+$clog2(yno)-1:0] src_address,
input rd_en,
output [(xno*yno*($clog2(xno)+$clog2(yno)))-1:0] dest_address
);

reg [(xno*yno*($clog2(xno)+$clog2(yno)))-1:0] Memory [xno*yno-1:0];

initial
	$readmemb(RTfile, Memory);

// To find the src_address in the Memory, and assign associated Destination address to the output
//always @(posedge clk)
//begin
assign dest_address=Memory[src_address];
//end

endmodule