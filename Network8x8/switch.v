module switch #(parameter packet_size=16,x=2'd1,y=2'd1,xno_switch=4,yno_switch=4, RTfile="", numWeight="")(
input clk,
input [packet_size-1:0] i_data_left,//dataIn_left
input [packet_size-1:0] i_data_right, //dataIn_right
input [packet_size-1:0] i_data_up,
input [packet_size-1:0] i_data_down,
input i_wr_valid_left, // Write Enables
input i_wr_valid_right,
input i_wr_valid_up,
input i_wr_valid_down,
input i_reset, // Assigning a single reset signal for the entire circuit, to be kept high for sometime for circuit initialization
output [packet_size-1:0] o_data_left, //dataOut_left
output [packet_size-1:0] o_data_right, //dataOut_right
output [packet_size-1:0] o_data_up,
output [packet_size-1:0] o_data_down,
input i_rd_fifoReady_left, // Read Enables
input i_rd_fifoReady_right,
input i_rd_fifoReady_up,
input i_rd_fifoReady_down,
output o_rd_valid_left, //data_valid_left, // NOT Empty, Therefore can be READ
output o_rd_valid_right, //data_valid_right
output o_rd_valid_up,
output o_rd_valid_down,

output o_wr_fifoReady_left, // NOT Full, Therefore can be WRITTEN TO
output o_wr_fifoReady_right,
output o_wr_fifoReady_up,
output o_wr_fifoReady_down
);

wire [packet_size-1-$clog2(xno_switch)-$clog2(yno_switch):0] myinput, out;
wire [packet_size-1:0] neuronInput, o_data_PE;
wire outvalid, o_wr_fifoReady_PE, o_rd_valid_PE;

switchnew1 #(.packet_size(packet_size),.x(x),.y(y),.xno_switch(xno_switch),.yno_switch(yno_switch),.RTfile(RTfile)) Switch(
.clk(clk),
.i_data_left(i_data_left),//dataIn_left
.i_data_right(i_data_right), //dataIn_right
.i_data_up(i_data_up),
.i_data_down(i_data_down),
.i_data_PE(neuronInput),
.i_wr_valid_left(i_wr_valid_left),
.i_wr_valid_right(i_wr_valid_right),
.i_wr_valid_up(i_wr_valid_up),
.i_wr_valid_down(i_wr_valid_down),
.i_wr_valid_PE(outvalid),
.i_reset(i_reset), // Assigning a single reset signal for the entire circuit, to be kept high for sometime for circuit initialization
.o_data_left(o_data_left), //dataOut_left
.o_data_right(o_data_right), //dataOut_right
.o_data_up(o_data_up),
.o_data_down(o_data_down),
.o_data_PE(o_data_PE),
.i_rd_fifoReady_left(i_rd_fifoReady_left), // given by an external module
.i_rd_fifoReady_right(i_rd_fifoReady_right),
.i_rd_fifoReady_up(i_rd_fifoReady_up),
.i_rd_fifoReady_down(i_rd_fifoReady_down),
.i_rd_fifoReady_PE(o_wr_fifoReady_PE),
.o_rd_valid_left(o_rd_valid_left), //data_valid_left
.o_rd_valid_right(o_rd_valid_right), //data_valid_right
.o_rd_valid_up(o_rd_valid_up),
.o_rd_valid_down(o_rd_valid_down),
.o_rd_valid_PE(o_rd_valid_PE),

.o_wr_fifoReady_left(o_wr_fifoReady_left),
.o_wr_fifoReady_right(o_wr_fifoReady_right),
.o_wr_fifoReady_up(o_wr_fifoReady_up),
.o_wr_fifoReady_down(o_wr_fifoReady_down),
.o_wr_fifoReady_PE(o_wr_fifoReady_PE)
);

assign myinput = o_data_PE[packet_size-$clog2(xno_switch)-$clog2(yno_switch)-1:0];
assign neuronInput = {x, y, out};

neuron #(.numWeight(numWeight),.dataWidth(packet_size-$clog2(xno_switch)-$clog2(yno_switch)),.sigmoidSize(10),.weightIntWidth(1),.actType("relu"),.biasFile("neuron1Bias.mif"),.weightFile("neuron1Wgts.mif")) NeuronSwitch(
.clk(clk),
.rst(i_reset),
.myinput(myinput),
.myinputValid(o_rd_valid_PE),
.out(out),
.outvalid (outvalid)  
);

endmodule