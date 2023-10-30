`timescale 1ns / 1ps
module switch_type_2 #(parameter packet_size=16,x=1,y=0,xno_switch=4,yno_switch=4)(
input clk,
input [packet_size-1:0] i_data_left,//dataIn_left
input [packet_size-1:0] i_data_right, //dataIn_right
input [packet_size-1:0] i_data_up,
input [packet_size-1:0] i_data_down,
input i_wr_valid_left,
input i_wr_valid_right,
input i_wr_valid_up,
input i_wr_valid_down,
input i_reset, // Assigning a single reset signal for the entire circuit, to be kept high for sometime for circuit initialization
output [packet_size-1:0] o_data_left, //dataOut_left
output [packet_size-1:0] o_data_right, //dataOut_right
output [packet_size-1:0] o_data_up,
output [packet_size-1:0] o_data_down,
input i_rd_fifoReady_left, // given by an external module
input i_rd_fifoReady_right,
input i_rd_fifoReady_up,
input i_rd_fifoReady_down,
output o_rd_valid_left, //data_valid_left
output o_rd_valid_right, //data_valid_right
output o_rd_valid_up,
output o_rd_valid_down,

output o_wr_fifoReady_left,
output o_wr_fifoReady_right,
output o_wr_fifoReady_up,
output o_wr_fifoReady_down

);

reg [$clog2(xno_switch)+$clog2(yno_switch)-1:0] dest_address_new;
reg [packet_size-$clog2(xno_switch)-$clog2(yno_switch)-1:0] data;
reg [4:0] wr_en_FIFO;
wire [15:0] fifoRdData[4:0];
reg [15:0] fifoRdDataInt; // one clock delayed version
reg [3:0] action_state;
reg [4:0] fifoRdEn;
wire [4:0] fifoValid;
reg [2:0] currentFifo;
wire [4:0] o_wr_fifoReady;
reg [15:0] WriteData;
reg [$clog2(xno_switch)+$clog2(yno_switch)-1:0] s_address;


localparam IDLE = 'd0, CheckFIFOData='d1, WriteToFIFO = 'd2;
always @(posedge clk or posedge i_reset)
begin
	if(i_reset)
	begin
		action_state<=IDLE;
		currentFifo <= 0; //By default FSM goes to check FIFO1
	end
	else
	begin
		case(action_state)
		
			IDLE:
				begin
					wr_en_FIFO<=0;
					if(fifoValid[currentFifo])
					begin
						action_state<=CheckFIFOData;
						fifoRdEn[currentFifo] <= 1'b1;
						fifoRdDataInt <= fifoRdData[currentFifo]; // To give one clk delay 
						currentFifo <= currentFifo; // Once read from this FIFO, we need to move and check the next FIFO
					end
					
					else
					begin
						if(currentFifo == 4)
							currentFifo <= 0;
						else
							currentFifo <= currentFifo+1;
					end
					
				end
				
			CheckFIFOData:
				begin
					fifoRdEn <= 0;
					//dest_address_new <= fifoRdDataInt[15:15-$clog2(xno_switch*yno_switch)+1];
					data <= fifoRdDataInt[15-$clog2(xno_switch*yno_switch):0];
					s_address <= fifoRdDataInt[15:15-$clog2(xno_switch*yno_switch)+1];
					action_state<=WriteToFIFO;
				end
				
			WriteToFIFO:
				begin
					WriteData <= {s_address, data};
					wr_en_FIFO[1]<=1'b1;
					action_state<=IDLE;
					
				end
			default:
				begin
					action_state<=IDLE;
					currentFifo <= 0;
				end
		endcase
	end
end



// Initializing 10 FIFOs correspoinding to 5 sides (left, right, up, down, and PE)
fifonew #(.FIFO_WIDTH(packet_size), .FIFO_DEPTH(8)) fifo1(
.clk(clk),
.reset(i_reset),
.i_wr_valid(i_wr_valid_left),
.fifoWrData(i_data_left),
.i_rd_fifoReady(fifoRdEn[0]),
.fifoRdData(fifoRdData[0]),
.o_rd_valid(fifoValid[0]),
.o_wr_fifoReady(o_wr_fifoReady_left)
);

fifonew #(.FIFO_WIDTH(packet_size), .FIFO_DEPTH(8)) fifo2(
.clk(clk),
.reset(i_reset),
.i_wr_valid(wr_en_FIFO[0]),
.fifoWrData(WriteData),
.i_rd_fifoReady(i_rd_fifoReady_left),
.fifoRdData(o_data_left),
.o_rd_valid(o_rd_valid_left),
.o_wr_fifoReady(o_wr_fifoReady[0])
);

fifonew #(.FIFO_WIDTH(packet_size), .FIFO_DEPTH(8)) fifo3(
.clk(clk),
.reset(i_reset),
.i_wr_valid(i_wr_valid_right),
.fifoWrData(i_data_right),
.i_rd_fifoReady(fifoRdEn[1]),
.fifoRdData(fifoRdData[1]),
.o_rd_valid(fifoValid[1]),
.o_wr_fifoReady(o_wr_fifoReady_right)
);

fifonew #(.FIFO_WIDTH(packet_size), .FIFO_DEPTH(8)) fifo4(
.clk(clk),
.reset(i_reset),
.i_wr_valid(wr_en_FIFO[1]),
.fifoWrData(WriteData),
.i_rd_fifoReady(i_rd_fifoReady_right),
.fifoRdData(o_data_right),
.o_rd_valid(o_rd_valid_right),
.o_wr_fifoReady(o_wr_fifoReady[1])
);

fifonew #(.FIFO_WIDTH(packet_size), .FIFO_DEPTH(8)) fifo5(
.clk(clk),
.reset(i_reset),
.i_wr_valid(i_wr_valid_up),
.fifoWrData(i_data_up),
.i_rd_fifoReady(fifoRdEn[2]),
.fifoRdData(fifoRdData[2]),
.o_rd_valid(fifoValid[2]),
.o_wr_fifoReady(o_wr_fifoReady_up)
);

fifonew #(.FIFO_WIDTH(packet_size), .FIFO_DEPTH(8)) fifo6(
.clk(clk),
.reset(i_reset),
.i_wr_valid(wr_en_FIFO[2]),
.fifoWrData(WriteData),
.i_rd_fifoReady(i_rd_fifoReady_up),
.fifoRdData(o_data_up),
.o_rd_valid(o_rd_valid_up),
.o_wr_fifoReady(o_wr_fifoReady[2])
);

fifonew #(.FIFO_WIDTH(packet_size), .FIFO_DEPTH(8)) fifo7(
.clk(clk),
.reset(i_reset),
.i_wr_valid(i_wr_valid_down),
.fifoWrData(i_data_down),
.i_rd_fifoReady(fifoRdEn[3]),
.fifoRdData(fifoRdData[3]),
.o_rd_valid(fifoValid[3]),
.o_wr_fifoReady(o_wr_fifoReady_down)
);

fifonew #(.FIFO_WIDTH(packet_size), .FIFO_DEPTH(8)) fifo8(
.clk(clk),
.reset(i_reset),
.i_wr_valid(wr_en_FIFO[3]),
.fifoWrData(WriteData),
.i_rd_fifoReady(i_rd_fifoReady_down),
.fifoRdData(o_data_down),
.o_rd_valid(o_rd_valid_down),
.o_wr_fifoReady(o_wr_fifoReady[3])
);

endmodule