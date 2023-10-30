// There is 1 clk cycle delay for the FIFO in generating its output signals, while data is already ready
`timescale 1ns / 1ps
module fifonew #(parameter FIFO_WIDTH=8, FIFO_DEPTH=8)(
input	clk,
input	reset,
input	i_wr_valid, // (Write Enable, Write to FIFO)
input	[FIFO_WIDTH-1:0] fifoWrData,
input	i_rd_fifoReady,// (Read Enable, Read from FIFO)
output  [FIFO_WIDTH-1:0] fifoRdData,
output  o_rd_valid, //(NOT empty)
output  o_wr_fifoReady // (NOT full)
);

wire fifoEmpty;
wire fifoFull;
reg [FIFO_WIDTH-1:0] fifoWrDatap;
reg [$clog2(FIFO_DEPTH):0] dataCounter;
reg [$clog2(FIFO_DEPTH)-1:0] wrPointer;
reg [$clog2(FIFO_DEPTH)-1:0] rdPointer;
wire validFifoRd, validFifoWr;

assign validFifoWr = i_wr_valid & !fifoFull;
assign validFifoRd = i_rd_fifoReady & !fifoEmpty;
assign fifoFull = (dataCounter==FIFO_DEPTH)? 1'b1 : 1'b0;
assign fifoEmpty = (dataCounter==0)? 1'b1 : 1'b0;
assign o_rd_valid = !fifoEmpty;
assign o_wr_fifoReady = !fifoFull;
/*
//pipeline for aligning with ram wr en
always @(posedge clk)
    fifoWrDatap <= fifoWrData;
*/
/*
//Fifo write logic
always @(posedge clk)
begin
    if(reset)
       wrEnInt = 1'b0;
    else if(validFifoWr)
       wrEnInt = 1'b1;
    else
       wrEnInt = 1'b0;
end
*/
/*
always @(posedge clk)
begin
    if(reset)
        dataCounter <= 0;
    else if(validFifoWr & !validFifoRd)
        dataCounter <= dataCounter+1'b1;
    else if(validFifoRd & !validFifoWr)
        dataCounter <= dataCounter-1'b1;
end
*/
always @(posedge clk)
begin
    if(reset)
        wrPointer <= 0;
    else if(validFifoWr)
	begin
		wrPointer <= wrPointer+1'b1;
	end
end


always @(posedge clk)
begin
    if(reset)
        rdPointer <= 0;
    else if(validFifoRd)
	begin
		rdPointer <= rdPointer+1'b1;
	end
end
 
always @(posedge clk)
begin
    if(reset)
    dataCounter<=0;
    else if(validFifoRd && validFifoWr)
    dataCounter<=dataCounter;
    else if(validFifoWr)
    dataCounter <= dataCounter+1'b1;
    else if(validFifoRd)
    dataCounter <= dataCounter-1'b1;
end

ram #(.Width(FIFO_WIDTH),.Depth(FIFO_DEPTH))rm(
.clk(clk),
.rdEn(validFifoRd),
.wrEn(validFifoWr), //Should become high when you want to write to the memory
.wrAddr(wrPointer), //address for writing
.wrData(fifoWrData), //Data to be written
.rdAddr(rdPointer),
.rdData(fifoRdData)
);


endmodule