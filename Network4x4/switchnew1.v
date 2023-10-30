`timescale 1ns / 1ps
module switchnew1 #(parameter packet_size=16,x=2'd0,y=2'd0,xno_switch=4,yno_switch=4, RTfile="")(
input clk,
input [packet_size-1:0] i_data_left,//dataIn_left
input [packet_size-1:0] i_data_right, //dataIn_right
input [packet_size-1:0] i_data_up,
input [packet_size-1:0] i_data_down,
input [packet_size-1:0] i_data_PE,
input i_wr_valid_left,
input i_wr_valid_right,
input i_wr_valid_up,
input i_wr_valid_down,
input i_wr_valid_PE,
input i_reset, // Assigning a single reset signal for the entire circuit, to be kept high for sometime for circuit initialization
output [packet_size-1:0] o_data_left, //dataOut_left
output [packet_size-1:0] o_data_right, //dataOut_right
output [packet_size-1:0] o_data_up,
output [packet_size-1:0] o_data_down,
output [packet_size-1:0] o_data_PE,
input i_rd_fifoReady_left, // given by an external module
input i_rd_fifoReady_right,
input i_rd_fifoReady_up,
input i_rd_fifoReady_down,
input i_rd_fifoReady_PE,
output o_rd_valid_left, //data_valid_left
output o_rd_valid_right, //data_valid_right
output o_rd_valid_up,
output o_rd_valid_down,
output o_rd_valid_PE,

output o_wr_fifoReady_left,
output o_wr_fifoReady_right,
output o_wr_fifoReady_up,
output o_wr_fifoReady_down,
output o_wr_fifoReady_PE

);

reg [$clog2(xno_switch)+$clog2(yno_switch)-1:0] s_address;
reg [packet_size-$clog2(xno_switch)-$clog2(yno_switch)-1:0] data;
reg [4:0] wr_en_FIFO, fifoRdEn;
wire [(xno_switch*yno_switch*($clog2(xno_switch)+$clog2(yno_switch)))-1:0] dest_address;
reg [packet_size-1:0] Write_Data;
wire [15:0] fifoRdData[4:0];
reg [15:0] fifoRdDataInt; // one clock delayed version
reg [3:0] action_state;
wire [4:0] fifoValid, o_wr_fifoReady;
reg [$clog2(xno_switch)-1:0] x_dest;
reg [$clog2(yno_switch)-1:0] y_dest;
integer iterator;
reg [2:0] lastWrite, write_stage, currentFifo;
reg initialize, search, done, ready, read_en_RT;
localparam INITIAL='d0, INTERMEDIATE='d1, GOBACK='d2;

localparam IDLE = 'd0,
			CheckFifoData = 'd1, // Same as reading from FIFO
		   WriteToFIFO = 'd2;

always @(posedge clk)
begin
	if(i_reset)
	begin
		action_state<=IDLE;
		currentFifo <= 0; //By default FSM goes to check FIFO1
		ready<=0;
	end
	else
	begin
		case(action_state)
			IDLE:
				begin
					if(fifoValid[currentFifo])
					begin
						action_state<=CheckFifoData;
						fifoRdEn[currentFifo] <= 1'b1;
						fifoRdDataInt <= fifoRdData[currentFifo]; // To give one clk delay
					end
					
					//else
					//begin
						if(currentFifo == 4)
							currentFifo <= 0;
						else
							currentFifo <= currentFifo+1;// Once read from this FIFO, we need to move and check the next FIFO
					//end
					
				end
			CheckFifoData:
				begin
					fifoRdEn <= 0;
					data <= fifoRdDataInt[15-$clog2(xno_switch*yno_switch):0]; //CHANGED
					s_address <= fifoRdDataInt[15:15-$clog2(xno_switch*yno_switch)+1]; //CHANGED
					read_en_RT <= 1;
					action_state<=WriteToFIFO;
				end
			WriteToFIFO:
				begin
					read_en_RT=0;
					ready<=1;
					if(done==1)
					begin
						ready<=0;
						action_state<=IDLE;
					end
				end
			default:
				begin
					action_state<=IDLE;
					currentFifo <= 0;
				end
		endcase
	end
end

always @(posedge clk)
begin
	if(i_reset)
	begin
		done<=0;
		write_stage<=INITIAL;
	end
	
	
	case(write_stage)
	INITIAL:
	begin
		wr_en_FIFO<=0; // making all the Write Enables Off
		//iterator<=(xno_switch*yno_switch*($clog2(xno_switch)+$clog2(yno_switch)))-1;
		if(ready)
		begin
			write_stage<=INTERMEDIATE;
			iterator<=0;
		end
		initialize<=0;
		done<=0;
		y_dest <= s_address[$clog2(yno_switch)-1-:$clog2(yno_switch)];
		x_dest <= s_address[$clog2(yno_switch*xno_switch)-1-:$clog2(xno_switch)];
		
		if((s_address[$clog2(xno_switch)+$clog2(yno_switch)-1-:$clog2(xno_switch)]==x && s_address[$clog2(yno_switch)-1-:$clog2(yno_switch)]==y) || !(|x || |y))
		search<=1;
		else
		search<=0;
	end
	INTERMEDIATE:
	begin
		if(initialize)
			wr_en_FIFO[lastWrite]<=0;
		initialize<=1;
		if(search)
		begin
			y_dest <= dest_address[iterator+$clog2(yno_switch)-1-:$clog2(yno_switch)];
			x_dest <= dest_address[iterator+$clog2(yno_switch*xno_switch)-1-:$clog2(xno_switch)];
		end
		
		if(s_address[$clog2(yno_switch)+$clog2(xno_switch)-1-:$clog2(xno_switch)]==x && s_address[$clog2(yno_switch)-1-:$clog2(yno_switch)]==y && !initialize && currentFifo!=0)
		begin
			wr_en_FIFO<=5'b10000;
			lastWrite='d4;
			Write_Data <= {s_address, data};
			done<=1;
		end
		
		else
		begin
			if(currentFifo==0 && fifoValid[4])
				Write_Data <= {x_dest,y_dest, fifoRdData[4]};
			else
				Write_Data <= {x_dest,y_dest, data};
		end
		
		if((initialize || !search) && !done)
		begin
			if(&x_dest && &y_dest)
				done<=1;
								
			else if(x!=x_dest)
			begin
				if(x<x_dest)
				begin
					wr_en_FIFO[1]<=1'b1;
					lastWrite='d1;
				end
				
				else
				begin
					wr_en_FIFO[0]<=1'b1;
					lastWrite='d0;
				end
			end
								
			else if(y!=y_dest)
			begin
				if(y<y_dest)
				begin
					wr_en_FIFO[2]<=1'b1;
					lastWrite='d2;
				end
				
				else
				begin
					wr_en_FIFO[3]<=1'b1;
					lastWrite='d3;
				end
			end
		end
		
		if(!done)
		iterator<=iterator+$clog2(xno_switch*yno_switch);
			
		if(done==1 || !search)
		begin
			x_dest<={$clog2(xno_switch){1'b1}};
			y_dest<={$clog2(yno_switch){1'b1}};
			write_stage<=GOBACK;
			done<=1;
		end
	end
	GOBACK:
	begin
		done<=0;
		wr_en_FIFO<=0;
		write_stage<=INITIAL;
	end
	endcase
end
		

rtable2 #(.xno(xno_switch),.yno(yno_switch),.RTfile(RTfile)) RoutingTable( 
.clk(clk),
.src_address(s_address),
.rd_en(read_en_RT),
.dest_address(dest_address)
);



// Initializing 10 FIFOs correspoinding to 5 sides (left, right, up, down, and PE)
fifonew #(.FIFO_WIDTH(packet_size), .FIFO_DEPTH(32)) fifo1(
.clk(clk),
.reset(i_reset),
.i_wr_valid(i_wr_valid_left),
.fifoWrData(i_data_left),
.i_rd_fifoReady(fifoRdEn[0]),
.fifoRdData(fifoRdData[0]),
.o_rd_valid(fifoValid[0]),
.o_wr_fifoReady(o_wr_fifoReady_left)
);

fifonew #(.FIFO_WIDTH(packet_size), .FIFO_DEPTH(32)) fifo2(
.clk(clk),
.reset(i_reset),
.i_wr_valid(wr_en_FIFO[0]),
.fifoWrData(Write_Data),
.i_rd_fifoReady(i_rd_fifoReady_left),
.fifoRdData(o_data_left),
.o_rd_valid(o_rd_valid_left),
.o_wr_fifoReady(o_wr_fifoReady[0])
);

fifonew #(.FIFO_WIDTH(packet_size), .FIFO_DEPTH(32)) fifo3(
.clk(clk),
.reset(i_reset),
.i_wr_valid(i_wr_valid_right),
.fifoWrData(i_data_right),
.i_rd_fifoReady(fifoRdEn[1]),
.fifoRdData(fifoRdData[1]),
.o_rd_valid(fifoValid[1]),
.o_wr_fifoReady(o_wr_fifoReady_right)
);

fifonew #(.FIFO_WIDTH(packet_size), .FIFO_DEPTH(32)) fifo4(
.clk(clk),
.reset(i_reset),
.i_wr_valid(wr_en_FIFO[1]),
.fifoWrData(Write_Data),
.i_rd_fifoReady(i_rd_fifoReady_right),
.fifoRdData(o_data_right),
.o_rd_valid(o_rd_valid_right),
.o_wr_fifoReady(o_wr_fifoReady[1])
);

fifonew #(.FIFO_WIDTH(packet_size), .FIFO_DEPTH(32)) fifo5(
.clk(clk),
.reset(i_reset),
.i_wr_valid(i_wr_valid_up),
.fifoWrData(i_data_up),
.i_rd_fifoReady(fifoRdEn[2]),
.fifoRdData(fifoRdData[2]),
.o_rd_valid(fifoValid[2]),
.o_wr_fifoReady(o_wr_fifoReady_up)
);

fifonew #(.FIFO_WIDTH(packet_size), .FIFO_DEPTH(32)) fifo6(
.clk(clk),
.reset(i_reset),
.i_wr_valid(wr_en_FIFO[2]),
.fifoWrData(Write_Data),
.i_rd_fifoReady(i_rd_fifoReady_up),
.fifoRdData(o_data_up),
.o_rd_valid(o_rd_valid_up),
.o_wr_fifoReady(o_wr_fifoReady[2])
);

fifonew #(.FIFO_WIDTH(packet_size), .FIFO_DEPTH(32)) fifo7(
.clk(clk),
.reset(i_reset),
.i_wr_valid(i_wr_valid_down),
.fifoWrData(i_data_down),
.i_rd_fifoReady(fifoRdEn[3]),
.fifoRdData(fifoRdData[3]),
.o_rd_valid(fifoValid[3]),
.o_wr_fifoReady(o_wr_fifoReady_down)
);

fifonew #(.FIFO_WIDTH(packet_size), .FIFO_DEPTH(32)) fifo8(
.clk(clk),
.reset(i_reset),
.i_wr_valid(wr_en_FIFO[3]),
.fifoWrData(Write_Data),
.i_rd_fifoReady(i_rd_fifoReady_down),
.fifoRdData(o_data_down),
.o_rd_valid(o_rd_valid_down),
.o_wr_fifoReady(o_wr_fifoReady[3])
);

fifonew #(.FIFO_WIDTH(packet_size), .FIFO_DEPTH(32)) fifo9(
.clk(clk),
.reset(i_reset),
.i_wr_valid(i_wr_valid_PE),
.fifoWrData(i_data_PE),
.i_rd_fifoReady(fifoRdEn[4]),
.fifoRdData(fifoRdData[4]),
.o_rd_valid(fifoValid[4]),
.o_wr_fifoReady(o_wr_fifoReady_PE)
);

fifonew #(.FIFO_WIDTH(packet_size), .FIFO_DEPTH(32)) fifo10(
.clk(clk),
.reset(i_reset),
.i_wr_valid(wr_en_FIFO[4]),
.fifoWrData(Write_Data),
.i_rd_fifoReady(i_rd_fifoReady_PE),
.fifoRdData(o_data_PE),
.o_rd_valid(o_rd_valid_PE),
.o_wr_fifoReady(o_wr_fifoReady[4])
);
endmodule