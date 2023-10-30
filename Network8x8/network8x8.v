module network8x8 #(parameter packet_size=16,xno=4,yno=4)(
input clk,
input i_reset,
input [packet_size-1:0] i_data,
input i_data_valid,
input i_rd_en,
output [packet_size-1:0] o_DATA
);

wire [packet_size-1:0] wire04_1;// 0 sending 	4 receiving
wire [packet_size-1:0] wire04_2;// 0 receiving 	4 sending
wire [packet_size-1:0] wire01_1;// 0 sending 	1 receiving
wire [packet_size-1:0] wire01_2;// 0 receiving 	1 sending
wire [packet_size-1:0] wire15_1;// 1 sending 	5 receiving
wire [packet_size-1:0] wire15_2;// 1 receiving 	5 sending
wire [packet_size-1:0] wire45_1;// 4 sending	5 receiving
wire [packet_size-1:0] wire45_2;// 4 receiving 	5 sending

wire [packet_size-1:0] wire8C_1;// 8 sending 	C receiving
wire [packet_size-1:0] wire8C_2;// 8 receiving 	C sending
wire [packet_size-1:0] wire89_1;// 8 sending 	9 receiving
wire [packet_size-1:0] wire89_2;// 8 receiving 	9 sending
wire [packet_size-1:0] wire9D_1;// 9 sending 	D receiving
wire [packet_size-1:0] wire9D_2;// 9 receiving 	D sending
wire [packet_size-1:0] wireCD_1;// C sending	D receiving
wire [packet_size-1:0] wireCD_2;// C receiving 	D sending

wire [packet_size-1:0] wire26_1;
wire [packet_size-1:0] wire26_2;
wire [packet_size-1:0] wire23_1;
wire [packet_size-1:0] wire23_2;
wire [packet_size-1:0] wire37_1;
wire [packet_size-1:0] wire37_2;
wire [packet_size-1:0] wire67_1;
wire [packet_size-1:0] wire67_2;

wire [packet_size-1:0] wireAE_1;
wire [packet_size-1:0] wireAE_2;
wire [packet_size-1:0] wireAB_1;
wire [packet_size-1:0] wireAB_2;
wire [packet_size-1:0] wireBF_1;
wire [packet_size-1:0] wireBF_2;
wire [packet_size-1:0] wireEF_1;
wire [packet_size-1:0] wireEF_2;

wire [packet_size-1:0] wire12_1;
wire [packet_size-1:0] wire12_2;
wire [packet_size-1:0] wire56_1;
wire [packet_size-1:0] wire56_2;
wire [packet_size-1:0] wire9A_1;
wire [packet_size-1:0] wire9A_2;
wire [packet_size-1:0] wireDE_1;
wire [packet_size-1:0] wireDE_2;

wire [packet_size-1:0] wire48_1;
wire [packet_size-1:0] wire48_2;
wire [packet_size-1:0] wire59_1;
wire [packet_size-1:0] wire59_2;
wire [packet_size-1:0] wire6A_1;
wire [packet_size-1:0] wire6A_2;
wire [packet_size-1:0] wire7B_1;
wire [packet_size-1:0] wire7B_2;

wire [packet_size-1:0] wire04_1_1;// 0 sending 	4 receiving
wire [packet_size-1:0] wire04_2_1;// 0 receiving 	4 sending
wire [packet_size-1:0] wire01_1_1;// 0 sending 	1 receiving
wire [packet_size-1:0] wire01_2_1;// 0 receiving 	1 sending
wire [packet_size-1:0] wire15_1_1;// 1 sending 	5 receiving
wire [packet_size-1:0] wire15_2_1;// 1 receiving 	5 sending
wire [packet_size-1:0] wire45_1_1;// 4 sending	5 receiving
wire [packet_size-1:0] wire45_2_1;// 4 receiving 	5 sending

wire [packet_size-1:0] wire8C_1_1;// 8 sending 	C receiving
wire [packet_size-1:0] wire8C_2_1;// 8 receiving 	C sending
wire [packet_size-1:0] wire89_1_1;// 8 sending 	9 receiving
wire [packet_size-1:0] wire89_2_1;// 8 receiving 	9 sending
wire [packet_size-1:0] wire9D_1_1;// 9 sending 	D receiving
wire [packet_size-1:0] wire9D_2_1;// 9 receiving 	D sending
wire [packet_size-1:0] wireCD_1_1;// C sending	D receiving
wire [packet_size-1:0] wireCD_2_1;// C receiving 	D sending

wire [packet_size-1:0] wire26_1_1;
wire [packet_size-1:0] wire26_2_1;
wire [packet_size-1:0] wire23_1_1;
wire [packet_size-1:0] wire23_2_1;
wire [packet_size-1:0] wire37_1_1;
wire [packet_size-1:0] wire37_2_1;
wire [packet_size-1:0] wire67_1_1;
wire [packet_size-1:0] wire67_2_1;

wire [packet_size-1:0] wireAE_1_1;
wire [packet_size-1:0] wireAE_2_1;
wire [packet_size-1:0] wireAB_1_1;
wire [packet_size-1:0] wireAB_2_1;
wire [packet_size-1:0] wireBF_1_1;
wire [packet_size-1:0] wireBF_2_1;
wire [packet_size-1:0] wireEF_1_1;
wire [packet_size-1:0] wireEF_2_1;

wire [packet_size-1:0] wire12_1_1;
wire [packet_size-1:0] wire12_2_1;
wire [packet_size-1:0] wire56_1_1;
wire [packet_size-1:0] wire56_2_1;
wire [packet_size-1:0] wire9A_1_1;
wire [packet_size-1:0] wire9A_2_1;
wire [packet_size-1:0] wireDE_1_1;
wire [packet_size-1:0] wireDE_2_1;

wire [packet_size-1:0] wire48_1_1;
wire [packet_size-1:0] wire48_2_1;
wire [packet_size-1:0] wire59_1_1;
wire [packet_size-1:0] wire59_2_1;
wire [packet_size-1:0] wire6A_1_1;
wire [packet_size-1:0] wire6A_2_1;
wire [packet_size-1:0] wire7B_1_1;
wire [packet_size-1:0] wire7B_2_1;

wire [packet_size-1:0] wire04_1_2;// 0 sending 	4 receiving
wire [packet_size-1:0] wire04_2_2;// 0 receiving 	4 sending
wire [packet_size-1:0] wire01_1_2;// 0 sending 	1 receiving
wire [packet_size-1:0] wire01_2_2;// 0 receiving 	1 sending
wire [packet_size-1:0] wire15_1_2;// 1 sending 	5 receiving
wire [packet_size-1:0] wire15_2_2;// 1 receiving 	5 sending
wire [packet_size-1:0] wire45_1_2;// 4 sending	5 receiving
wire [packet_size-1:0] wire45_2_2;// 4 receiving 	5 sending

wire [packet_size-1:0] wire8C_1_2;// 8 sending 	C receiving
wire [packet_size-1:0] wire8C_2_2;// 8 receiving 	C sending
wire [packet_size-1:0] wire89_1_2;// 8 sending 	9 receiving
wire [packet_size-1:0] wire89_2_2;// 8 receiving 	9 sending
wire [packet_size-1:0] wire9D_1_2;// 9 sending 	D receiving
wire [packet_size-1:0] wire9D_2_2;// 9 receiving 	D sending
wire [packet_size-1:0] wireCD_1_2;// C sending	D receiving
wire [packet_size-1:0] wireCD_2_2;// C receiving 	D sending

wire [packet_size-1:0] wire26_1_2;
wire [packet_size-1:0] wire26_2_2;
wire [packet_size-1:0] wire23_1_2;
wire [packet_size-1:0] wire23_2_2;
wire [packet_size-1:0] wire37_1_2;
wire [packet_size-1:0] wire37_2_2;
wire [packet_size-1:0] wire67_1_2;
wire [packet_size-1:0] wire67_2_2;

wire [packet_size-1:0] wireAE_1_2;
wire [packet_size-1:0] wireAE_2_2;
wire [packet_size-1:0] wireAB_1_2;
wire [packet_size-1:0] wireAB_2_2;
wire [packet_size-1:0] wireBF_1_2;
wire [packet_size-1:0] wireBF_2_2;
wire [packet_size-1:0] wireEF_1_2;
wire [packet_size-1:0] wireEF_2_2;

wire [packet_size-1:0] wire12_1_2;
wire [packet_size-1:0] wire12_2_2;
wire [packet_size-1:0] wire56_1_2;
wire [packet_size-1:0] wire56_2_2;
wire [packet_size-1:0] wire9A_1_2;
wire [packet_size-1:0] wire9A_2_2;
wire [packet_size-1:0] wireDE_1_2;
wire [packet_size-1:0] wireDE_2_2;

wire [packet_size-1:0] wire48_1_2;
wire [packet_size-1:0] wire48_2_2;
wire [packet_size-1:0] wire59_1_2;
wire [packet_size-1:0] wire59_2_2;
wire [packet_size-1:0] wire6A_1_2;
wire [packet_size-1:0] wire6A_2_2;
wire [packet_size-1:0] wire7B_1_2;
wire [packet_size-1:0] wire7B_2_2;

wire [packet_size-1:0] wire04_1_4;// 0 sending 	4 receiving
wire [packet_size-1:0] wire04_2_4;// 0 receiving 	4 sending
wire [packet_size-1:0] wire01_1_4;// 0 sending 	1 receiving
wire [packet_size-1:0] wire01_2_4;// 0 receiving 	1 sending
wire [packet_size-1:0] wire15_1_4;// 1 sending 	5 receiving
wire [packet_size-1:0] wire15_2_4;// 1 receiving 	5 sending
wire [packet_size-1:0] wire45_1_4;// 4 sending	5 receiving
wire [packet_size-1:0] wire45_2_4;// 4 receiving 	5 sending

wire [packet_size-1:0] wire8C_1_4;// 8 sending 	C receiving
wire [packet_size-1:0] wire8C_2_4;// 8 receiving 	C sending
wire [packet_size-1:0] wire89_1_4;// 8 sending 	9 receiving
wire [packet_size-1:0] wire89_2_4;// 8 receiving 	9 sending
wire [packet_size-1:0] wire9D_1_4;// 9 sending 	D receiving
wire [packet_size-1:0] wire9D_2_4;// 9 receiving 	D sending
wire [packet_size-1:0] wireCD_1_4;// C sending	D receiving
wire [packet_size-1:0] wireCD_2_4;// C receiving 	D sending

wire [packet_size-1:0] wire26_1_4;
wire [packet_size-1:0] wire26_2_4;
wire [packet_size-1:0] wire23_1_4;
wire [packet_size-1:0] wire23_2_4;
wire [packet_size-1:0] wire37_1_4;
wire [packet_size-1:0] wire37_2_4;
wire [packet_size-1:0] wire67_1_4;
wire [packet_size-1:0] wire67_2_4;

wire [packet_size-1:0] wireAE_1_4;
wire [packet_size-1:0] wireAE_2_4;
wire [packet_size-1:0] wireAB_1_4;
wire [packet_size-1:0] wireAB_2_4;
wire [packet_size-1:0] wireBF_1_4;
wire [packet_size-1:0] wireBF_2_4;
wire [packet_size-1:0] wireEF_1_4;
wire [packet_size-1:0] wireEF_2_4;

wire [packet_size-1:0] wire12_1_4;
wire [packet_size-1:0] wire12_2_4;
wire [packet_size-1:0] wire56_1_4;
wire [packet_size-1:0] wire56_2_4;
wire [packet_size-1:0] wire9A_1_4;
wire [packet_size-1:0] wire9A_2_4;
wire [packet_size-1:0] wireDE_1_4;
wire [packet_size-1:0] wireDE_2_4;

wire [packet_size-1:0] wire48_1_4;
wire [packet_size-1:0] wire48_2_4;
wire [packet_size-1:0] wire59_1_4;
wire [packet_size-1:0] wire59_2_4;
wire [packet_size-1:0] wire6A_1_4;
wire [packet_size-1:0] wire6A_2_4;
wire [packet_size-1:0] wire7B_1_4;
wire [packet_size-1:0] wire7B_2_4;

wire [packet_size-1:0] wireh0_1;
wire [packet_size-1:0] wireh0_2;
wire [packet_size-1:0] wireh1_1;
wire [packet_size-1:0] wireh1_2;
wire [packet_size-1:0] wireh2_1;
wire [packet_size-1:0] wireh2_2;
wire [packet_size-1:0] wireh3_1;
wire [packet_size-1:0] wireh3_2;//
wire [packet_size-1:0] wireh4_1;//
wire [packet_size-1:0] wireh4_2;// 
wire [packet_size-1:0] wireh5_1;// 
wire [packet_size-1:0] wireh5_2;//
wire [packet_size-1:0] wireh6_1;//
wire [packet_size-1:0] wireh6_2;//
wire [packet_size-1:0] wireh7_1;//
wire [packet_size-1:0] wireh7_2;//

wire [packet_size-1:0] wirev0_1;//
wire [packet_size-1:0] wirev0_2;//
wire [packet_size-1:0] wirev1_1;//
wire [packet_size-1:0] wirev1_2;//
wire [packet_size-1:0] wirev2_1;//
wire [packet_size-1:0] wirev2_2;//
wire [packet_size-1:0] wirev3_1;//
wire [packet_size-1:0] wirev3_2;//
wire [packet_size-1:0] wirev4_1;//
wire [packet_size-1:0] wirev4_2;//
wire [packet_size-1:0] wirev5_1;//
wire [packet_size-1:0] wirev5_2;//
wire [packet_size-1:0] wirev6_1;//
wire [packet_size-1:0] wirev6_2;//
wire [packet_size-1:0] wirev7_1;//
wire [packet_size-1:0] wirev7_2;//

wire [227:0] data_valid;
wire [227:0] ready;


switch #(.packet_size(16),.x(3'd0),.y(3'd0), .xno_switch(xno),.yno_switch(yno),.RTfile("RTinitialize.h"), .numWeight(10)) switch0(
.clk(clk),
.i_data_left(i_data),//dataIn_left
.i_data_right(wire04_2), //dataIn_right
.i_data_up(wire01_2),
.i_data_down(),
.i_wr_valid_left(i_data_valid),
.i_wr_valid_right(data_valid[7]),
.i_wr_valid_up(data_valid[1]),
.i_wr_valid_down(1'b0),
.i_reset(i_reset), // Assigning a single reset signal for the entire circuit, to be kept high for sometime for circuit initialization
.o_data_left(), //dataOut_left
.o_data_right(wire04_1),
.o_data_up(wire01_1),
.o_data_down(),
.i_rd_fifoReady_left(1'b0), // given by an external module
.i_rd_fifoReady_right(ready[7]),
.i_rd_fifoReady_up(ready[1]),
.i_rd_fifoReady_down(1'b0),
.o_rd_valid_left(), //data_valid_left
.o_rd_valid_right(data_valid[6]), //data_valid_right
.o_rd_valid_up(data_valid[0]),
.o_rd_valid_down(),

.o_wr_fifoReady_left(),
.o_wr_fifoReady_right(ready[6]),
.o_wr_fifoReady_up(ready[0]),
.o_wr_fifoReady_down()
);

switch #(.packet_size(16),.x(3'd0),.y(3'd1), .xno_switch(xno),.yno_switch(yno), .RTfile("rt1.h"), .numWeight(10)) switch1(
.clk(clk),
.i_data_left(),//
.i_data_right(wire15_2),
.i_data_up(wire12_2),//
.i_data_down(wire01_1),

.i_wr_valid_left(1'b0),
.i_wr_valid_right(data_valid[9]),
.i_wr_valid_up(data_valid[3]),
.i_wr_valid_down(data_valid[0]),

.i_reset(i_reset), // Assigning a single reset signal for the entire circuit, to be kept high for sometime for circuit initialization
.o_data_left(), //
.o_data_right(wire15_1),
.o_data_up(wire12_1), // 
.o_data_down(wire01_2),

.i_rd_fifoReady_left(1'b0), // given by an external module
.i_rd_fifoReady_right(ready[9]),
.i_rd_fifoReady_up(ready[3]),
.i_rd_fifoReady_down(ready[0]),

.o_rd_valid_left(),//
.o_rd_valid_right(data_valid[8]),
.o_rd_valid_up(data_valid[2]),
.o_rd_valid_down(data_valid[1]),


.o_wr_fifoReady_left(), //
.o_wr_fifoReady_right(ready[8]), 
.o_wr_fifoReady_up(ready[2]),
.o_wr_fifoReady_down(ready[1])


);

switch #(.packet_size(16),.x(3'd1),.y(3'd0), .xno_switch(xno),.yno_switch(yno), .RTfile("rt8.h"), .numWeight(3)) switch8(
.clk(clk),
.i_data_left(wire04_1),//dataIn_left
.i_data_right(wire48_2), //dataIn_right 
.i_data_up(wire45_2),
.i_data_down(),//

.i_wr_valid_left(data_valid[6]),
.i_wr_valid_right(data_valid[21]),
.i_wr_valid_up(data_valid[15]),
.i_wr_valid_down(1'b0),

.i_reset(i_reset), // Assigning a single reset signal for the entire circuit, to be kept high for sometime for circuit initialization
.o_data_left(wire04_2), //dataOut_left
.o_data_right(wire48_1),
.o_data_up(wire45_1),
.o_data_down(), // 

.i_rd_fifoReady_left(ready[6]), // given by an external module
.i_rd_fifoReady_right(ready[21]),
.i_rd_fifoReady_up(ready[15]),
.i_rd_fifoReady_down(1'b0),

.o_rd_valid_left(data_valid[7]), //data_valid_left
.o_rd_valid_right(data_valid[20]), //data_valid_right
.o_rd_valid_up(data_valid[14]),
.o_rd_valid_down(), // 


.o_wr_fifoReady_left(ready[7]),
.o_wr_fifoReady_right(ready[20]),
.o_wr_fifoReady_up(ready[14]),
.o_wr_fifoReady_down()


);

switch #(.packet_size(16),.x(3'd1),.y(3'd1), .xno_switch(xno),.yno_switch(yno), .RTfile("rt9.h"), .numWeight(3)) switch9(
.clk(clk),
.i_data_left(wire15_1),//dataIn_left
.i_data_right(wire59_2), //dataIn_right
.i_data_up(wire56_2),
.i_data_down(wire45_1),//

.i_wr_valid_left(data_valid[8]),
.i_wr_valid_right(data_valid[23]),
.i_wr_valid_up(data_valid[17]),
.i_wr_valid_down(data_valid[14]),

.i_reset(i_reset), // Assigning a single reset signal for the entire circuit, to be kept high for sometime for circuit initialization
.o_data_left(wire15_2), //dataOut_left
.o_data_right(wire59_1),
.o_data_up(wire56_1),
.o_data_down(wire45_2), // 

.i_rd_fifoReady_left(ready[8]), // given by an external module
.i_rd_fifoReady_right(ready[23]),
.i_rd_fifoReady_up(ready[17]),
.i_rd_fifoReady_down(ready[14]),

.o_rd_valid_left(data_valid[9]), //data_valid_left
.o_rd_valid_right(data_valid[22]), //data_valid_right
.o_rd_valid_up(data_valid[16]),
.o_rd_valid_down(data_valid[15]), // 


.o_wr_fifoReady_left(ready[9]),
.o_wr_fifoReady_right(ready[22]),
.o_wr_fifoReady_up(ready[16]),
.o_wr_fifoReady_down(ready[15])


);

switch #(.packet_size(16),.x(3'd2),.y(3'd0), .xno_switch(xno),.yno_switch(yno), .RTfile("rt16.h"), .numWeight(3)) switch16(
.clk(clk),
.i_data_left(wire48_1),
.i_data_right(wire8C_2), //
.i_data_up(wire89_2),
.i_data_down(),//

.i_wr_valid_left(data_valid[20]),
.i_wr_valid_right(data_valid[35]),
.i_wr_valid_up(data_valid[29]),
.i_wr_valid_down(1'b0),

.i_reset(i_reset), // Assigning a single reset signal for the entire circuit, to be kept high for sometime for circuit initialization
.o_data_left(wire48_2),
.o_data_right(wire8C_1), // 
.o_data_up(wire89_1),
.o_data_down(), // 

.i_rd_fifoReady_left(ready[20]), // given by an external module
.i_rd_fifoReady_right(ready[35]),
.i_rd_fifoReady_up(ready[29]),
.i_rd_fifoReady_down(1'b0),

.o_rd_valid_left(data_valid[21]), //data_valid_left
.o_rd_valid_right(data_valid[34]), //
.o_rd_valid_up(data_valid[28]),
.o_rd_valid_down(), //


.o_wr_fifoReady_left(ready[21]),
.o_wr_fifoReady_right(ready[34]),//
.o_wr_fifoReady_up(ready[28]),
.o_wr_fifoReady_down()


);

switch #(.packet_size(16),.x(3'd2),.y(3'd1), .xno_switch(xno),.yno_switch(yno), .RTfile("rt17.h"), .numWeight(3)) switch17(

.clk(clk),
.i_data_left(wire59_1),
.i_data_right(wire9D_2),//
.i_data_up(wire9A_2),//
.i_data_down(wire89_1),

.i_wr_valid_left(data_valid[22]),
.i_wr_valid_right(data_valid[37]),
.i_wr_valid_up(data_valid[31]),
.i_wr_valid_down(data_valid[28]),

.i_reset(i_reset), // Assigning a single reset signal for the entire circuit, to be kept high for sometime for circuit initialization
.o_data_left(wire59_2),
.o_data_right(wire9D_1), //
.o_data_up(wire9A_1),//
.o_data_down(wire89_2),

.i_rd_fifoReady_left(ready[22]), // given by an external module
.i_rd_fifoReady_right(ready[37]),
.i_rd_fifoReady_up(ready[31]),
.i_rd_fifoReady_down(ready[28]),

.o_rd_valid_left(data_valid[23]),
.o_rd_valid_right(data_valid[36]), //
.o_rd_valid_up(data_valid[30]),//
.o_rd_valid_down(data_valid[29]),


.o_wr_fifoReady_left(ready[23]),
.o_wr_fifoReady_right(ready[36]),//
.o_wr_fifoReady_up(ready[30]),//
.o_wr_fifoReady_down(ready[29])


);

switch #(.packet_size(16),.x(3'd3),.y(3'd0), .xno_switch(xno),.yno_switch(yno), .RTfile("rt24.h"), .numWeight(10)) switch24(
.clk(clk),
.i_data_left(wire8C_1),//dataIn_left
.i_data_right(wireh0_2), //dataIn_right
.i_data_up(wireCD_2),
.i_data_down(),//

.i_wr_valid_left(data_valid[34]),
.i_wr_valid_right(data_valid[197]),
.i_wr_valid_up(data_valid[43]),
.i_wr_valid_down(1'b0),

.i_reset(i_reset), // Assigning a single reset signal for the entire circuit, to be kept high for sometime for circuit initialization
.o_data_left(wire8C_2), //dataOut_left
.o_data_right(wireh0_1),
.o_data_up(wireCD_1),
.o_data_down(), // 

.i_rd_fifoReady_left(ready[34]), // given by an external module
.i_rd_fifoReady_right(ready[197]),
.i_rd_fifoReady_up(ready[43]),
.i_rd_fifoReady_down(1'b0),

.o_rd_valid_left(data_valid[35]), //data_valid_left
.o_rd_valid_right(data_valid[196]), //data_valid_right
.o_rd_valid_up(data_valid[42]),
.o_rd_valid_down(), // 


.o_wr_fifoReady_left(ready[35]),
.o_wr_fifoReady_right(ready[196]),
.o_wr_fifoReady_up(ready[42]),
.o_wr_fifoReady_down()


);

switch #(.packet_size(16),.x(3'd3),.y(3'd1), .xno_switch(xno),.yno_switch(yno), .RTfile("rt25.h"), .numWeight(10)) switch25(
.clk(clk),
.i_data_left(wire9D_1),//dataIn_left
.i_data_right(wireh1_2), //dataIn_right
.i_data_up(wireDE_2),
.i_data_down(wireCD_1),

.i_wr_valid_left(data_valid[36]),
.i_wr_valid_right(data_valid[199]),
.i_wr_valid_up(data_valid[45]),
.i_wr_valid_down(data_valid[42]),

.i_reset(i_reset), // Assigning a single reset signal for the entire circuit, to be kept high for sometime for circuit initialization
.o_data_left(wire9D_2), //dataOut_left
.o_data_right(wireh1_1),
.o_data_up(wireDE_1),
.o_data_down(wireCD_2),

.i_rd_fifoReady_left(ready[36]), // given by an external module
.i_rd_fifoReady_right(ready[199]),
.i_rd_fifoReady_up(ready[45]),
.i_rd_fifoReady_down(ready[42]),

.o_rd_valid_left(data_valid[37]), //data_valid_left
.o_rd_valid_right(data_valid[198]), //data_valid_right
.o_rd_valid_up(data_valid[44]),
.o_rd_valid_down(data_valid[43]),


.o_wr_fifoReady_left(ready[37]),
.o_wr_fifoReady_right(ready[198]),
.o_wr_fifoReady_up(ready[44]),
.o_wr_fifoReady_down(ready[43])


);

switch #(.packet_size(16),.x(3'd0),.y(3'd2), .xno_switch(xno),.yno_switch(yno), .RTfile("rt2.h"), .numWeight(10)) switch2(
.clk(clk),
.i_data_left(),//dataIn_left
.i_data_right(wire26_2), //dataIn_right
.i_data_up(wire23_2),
.i_data_down(wire12_1),

.i_wr_valid_left(),
.i_wr_valid_right(data_valid[11]),
.i_wr_valid_up(data_valid[48]),
.i_wr_valid_down(data_valid[2]),

.i_reset(i_reset), // Assigning a single reset signal for the entire circuit, to be kept high for sometime for circuit initialization
.o_data_left(), //dataOut_left
.o_data_right(wire26_1),
.o_data_up(wire23_1),
.o_data_down(wire12_2), // 

.i_rd_fifoReady_left(1'b0), // given by an external module
.i_rd_fifoReady_right(ready[11]),
.i_rd_fifoReady_up(ready[48]),
.i_rd_fifoReady_down(ready[2]),

.o_rd_valid_left(), //data_valid_left
.o_rd_valid_right(data_valid[10]), //data_valid_right
.o_rd_valid_up(data_valid[4]),
.o_rd_valid_down(data_valid[3]), // 


.o_wr_fifoReady_left(),
.o_wr_fifoReady_right(ready[10]),
.o_wr_fifoReady_up(ready[4]),
.o_wr_fifoReady_down(ready[3])


);

switch #(.packet_size(16),.x(3'd0),.y(3'd3), .xno_switch(xno),.yno_switch(yno), .RTfile("rt3.h"), .numWeight(10)) switch3(
.clk(clk),
.i_data_left(),//dataIn_left
.i_data_right(wire37_2), //dataIn_right
.i_data_up(wirev0_2),
.i_data_down(wire23_1),

.i_wr_valid_left(),
.i_wr_valid_right(data_valid[13]),
.i_wr_valid_up(data_valid[213]),
.i_wr_valid_down(data_valid[4]),

.i_reset(i_reset), // Assigning a single reset signal for the entire circuit, to be kept high for sometime for circuit initialization
.o_data_left(), //dataOut_left
.o_data_right(wire37_1),
.o_data_up(wirev0_1),
.o_data_down(wire23_2),

.i_rd_fifoReady_left(1'b0), // given by an external module
.i_rd_fifoReady_right(ready[13]),
.i_rd_fifoReady_up(ready[213]),
.i_rd_fifoReady_down(ready[4]),

.o_rd_valid_left(), //data_valid_left
.o_rd_valid_right(data_valid[12]), //data_valid_right
.o_rd_valid_up(data_valid[212]),
.o_rd_valid_down(data_valid[48]),


.o_wr_fifoReady_left(),
.o_wr_fifoReady_right(ready[12]),
.o_wr_fifoReady_up(ready[212]),
.o_wr_fifoReady_down(ready[48])


);

switch #(.packet_size(16),.x(3'd1),.y(3'd2), .xno_switch(xno),.yno_switch(yno), .RTfile("rt10.h"), .numWeight(4)) switch10(
.clk(clk),
.i_data_left(wire26_1),//dataIn_left
.i_data_right(wire6A_2), //dataIn_right
.i_data_up(wire67_2),
.i_data_down(wire56_1),

.i_wr_valid_left(data_valid[10]),
.i_wr_valid_right(data_valid[25]),
.i_wr_valid_up(data_valid[19]),
.i_wr_valid_down(data_valid[16]),

.i_reset(i_reset), // Assigning a single reset signal for the entire circuit, to be kept high for sometime for circuit initialization
.o_data_left(wire26_2), //dataOut_left
.o_data_right(wire6A_1),
.o_data_up(wire67_1),
.o_data_down(wire56_2),

.i_rd_fifoReady_left(ready[10]), // given by an external module
.i_rd_fifoReady_right(ready[25]),
.i_rd_fifoReady_up(ready[19]),
.i_rd_fifoReady_down(ready[16]),

.o_rd_valid_left(data_valid[11]), //data_valid_left
.o_rd_valid_right(data_valid[24]), //data_valid_right
.o_rd_valid_up(data_valid[18]),
.o_rd_valid_down(data_valid[17]),


.o_wr_fifoReady_left(ready[11]),
.o_wr_fifoReady_right(ready[24]),
.o_wr_fifoReady_up(ready[18]),
.o_wr_fifoReady_down(ready[17])


);

switch #(.packet_size(16),.x(3'd1),.y(3'd3), .xno_switch(xno),.yno_switch(yno), .RTfile("rt11.h"), .numWeight(4)) switch11(
.clk(clk),
.i_data_left(wire37_1),//dataIn_left
.i_data_right(wire7B_2), //dataIn_right
.i_data_up(wirev1_2),
.i_data_down(wire67_1),

.i_wr_valid_left(data_valid[12]),
.i_wr_valid_right(data_valid[27]),
.i_wr_valid_up(data_valid[215]),
.i_wr_valid_down(data_valid[18]),

.i_reset(i_reset), // Assigning a single reset signal for the entire circuit, to be kept high for sometime for circuit initialization
.o_data_left(wire37_2), //dataOut_left
.o_data_right(wire7B_1),
.o_data_up(wirev1_1),
.o_data_down(wire67_2), // 

.i_rd_fifoReady_left(ready[12]), // given by an external module
.i_rd_fifoReady_right(ready[27]),
.i_rd_fifoReady_up(ready[215]),
.i_rd_fifoReady_down(ready[18]),

.o_rd_valid_left(data_valid[13]), //data_valid_left
.o_rd_valid_right(data_valid[26]), //data_valid_right
.o_rd_valid_up(data_valid[214]),
.o_rd_valid_down(data_valid[19]),


.o_wr_fifoReady_left(ready[13]),
.o_wr_fifoReady_right(ready[26]),
.o_wr_fifoReady_up(ready[214]),
.o_wr_fifoReady_down(ready[19])


);

switch #(.packet_size(16),.x(3'd2),.y(3'd2), .xno_switch(xno),.yno_switch(yno), .RTfile("rt18.h"), .numWeight(10)) switch18(
.clk(clk),
.i_data_left(wire6A_1),//dataIn_left
.i_data_right(wireAE_2), //dataIn_right
.i_data_up(wireAB_2),
.i_data_down(wire9A_1),

.i_wr_valid_left(data_valid[24]),
.i_wr_valid_right(data_valid[39]),
.i_wr_valid_up(data_valid[33]),
.i_wr_valid_down(data_valid[30]),

.i_reset(i_reset), // Assigning a single reset signal for the entire circuit, to be kept high for sometime for circuit initialization
.o_data_left(wire6A_2), //dataOut_left
.o_data_right(wireAE_1),
.o_data_up(wireAB_1),
.o_data_down(wire9A_2),

.i_rd_fifoReady_left(ready[24]), // given by an external module
.i_rd_fifoReady_right(ready[39]),
.i_rd_fifoReady_up(ready[33]),
.i_rd_fifoReady_down(ready[30]),

.o_rd_valid_left(data_valid[25]), //data_valid_left
.o_rd_valid_right(data_valid[38]), //data_valid_right
.o_rd_valid_up(data_valid[32]),
.o_rd_valid_down(data_valid[31]),


.o_wr_fifoReady_left(ready[25]),
.o_wr_fifoReady_right(ready[38]),
.o_wr_fifoReady_up(ready[32]),
.o_wr_fifoReady_down(ready[31])


);

switch #(.packet_size(16),.x(3'd2),.y(3'd3), .xno_switch(xno),.yno_switch(yno), .RTfile("rt19.h"), .numWeight(10)) switch19(
.clk(clk),
.i_data_left(wire7B_1),//dataIn_left
.i_data_right(wireBF_2), //dataIn_right
.i_data_up(wirev2_2),
.i_data_down(wireAB_1),

.i_wr_valid_left(data_valid[26]),
.i_wr_valid_right(data_valid[41]),
.i_wr_valid_up(data_valid[217]),
.i_wr_valid_down(data_valid[32]),

.i_reset(i_reset), // Assigning a single reset signal for the entire circuit, to be kept high for sometime for circuit initialization
.o_data_left(wire7B_2), //dataOut_left
.o_data_right(wireBF_1),
.o_data_up(wirev2_1),
.o_data_down(wireAB_2),

.i_rd_fifoReady_left(ready[26]), // given by an external module
.i_rd_fifoReady_right(ready[41]),
.i_rd_fifoReady_up(ready[217]),
.i_rd_fifoReady_down(ready[32]),

.o_rd_valid_left(data_valid[27]), //data_valid_left
.o_rd_valid_right(data_valid[40]), //data_valid_right
.o_rd_valid_up(data_valid[216]),
.o_rd_valid_down(data_valid[33]),


.o_wr_fifoReady_left(ready[27]),
.o_wr_fifoReady_right(ready[40]),
.o_wr_fifoReady_up(ready[216]),
.o_wr_fifoReady_down(ready[33])


);

switch #(.packet_size(16),.x(3'd3),.y(3'd2), .xno_switch(xno),.yno_switch(yno), .RTfile("rt26.h"), .numWeight(10)) switch26(
.clk(clk),
.i_data_left(wireAE_1),//dataIn_left
.i_data_right(wireh2_2), //dataIn_right
.i_data_up(wireEF_2),
.i_data_down(wireDE_1),

.i_wr_valid_left(data_valid[38]),
.i_wr_valid_right(data_valid[201]),
.i_wr_valid_up(data_valid[47]),
.i_wr_valid_down(data_valid[44]),

.i_reset(i_reset), // Assigning a single reset signal for the entire circuit, to be kept high for sometime for circuit initialization
.o_data_left(wireAE_2), //dataOut_left
.o_data_right(wireh2_1),
.o_data_up(wireEF_1),
.o_data_down(wireDE_2),

.i_rd_fifoReady_left(ready[38]), // given by an external module
.i_rd_fifoReady_right(ready[201]),
.i_rd_fifoReady_up(ready[47]),
.i_rd_fifoReady_down(ready[44]),

.o_rd_valid_left(data_valid[39]), //data_valid_left
.o_rd_valid_right(data_valid[200]), //data_valid_right
.o_rd_valid_up(data_valid[46]),
.o_rd_valid_down(data_valid[45]),


.o_wr_fifoReady_left(ready[39]),
.o_wr_fifoReady_right(ready[200]),
.o_wr_fifoReady_up(ready[46]),
.o_wr_fifoReady_down(ready[45])

);

switch #(.packet_size(16),.x(2'd3),.y(2'd3), .xno_switch(xno),.yno_switch(yno), .RTfile("rt27.h"), .numWeight(10)) switch27(
.clk(clk),
.i_data_left(wireBF_1),//dataIn_left
.i_data_right(wireh3_2), //dataIn_right
.i_data_up(wirev3_2),
.i_data_down(wireEF_1),

.i_wr_valid_left(data_valid[40]),
.i_wr_valid_right(data_valid[203]),
.i_wr_valid_up(data_valid[219]),
.i_wr_valid_down(data_valid[46]),

.i_reset(i_reset), // Assigning a single reset signal for the entire circuit, to be kept high for sometime for circuit initialization
.o_data_left(wireBF_2), //dataOut_left
.o_data_right(wireh3_1),
.o_data_up(wirev3_1),
.o_data_down(wireEF_2),

.i_rd_fifoReady_left(ready[40]), // given by an external module
.i_rd_fifoReady_right(ready[203]),
.i_rd_fifoReady_up(ready[219]),
.i_rd_fifoReady_down(ready[46]),

.o_rd_valid_left(data_valid[41]), //data_valid_left
.o_rd_valid_right(data_valid[202]), //data_valid_right
.o_rd_valid_up(data_valid[218]),
.o_rd_valid_down(data_valid[47]),


.o_wr_fifoReady_left(ready[41]),
.o_wr_fifoReady_right(ready[202]),
.o_wr_fifoReady_up(ready[218]),
.o_wr_fifoReady_down(ready[47])


);


// Part - 2

switch #(.packet_size(16),.x(3'd0),.y(3'd4), .xno_switch(xno),.yno_switch(yno), .RTfile("rt4.h"), .numWeight(10)) switch4(
.clk(clk),
.i_data_left(i_data),//dataIn_left
.i_data_right(wire04_2_1), //dataIn_right
.i_data_up(wire01_2_1),
.i_data_down(wirev0_1),
.i_wr_valid_left(),
.i_wr_valid_right(data_valid[56]),
.i_wr_valid_up(data_valid[50]),
.i_wr_valid_down(data_valid[212]),
.i_reset(i_reset), // Assigning a single reset signal for the entire circuit, to be kept high for sometime for circuit initialization
.o_data_left(), //dataOut_left
.o_data_right(wire04_1_1),
.o_data_up(wire01_1_1),
.o_data_down(wirev0_2),
.i_rd_fifoReady_left(1'b0), // given by an external module
.i_rd_fifoReady_right(ready[56]),
.i_rd_fifoReady_up(ready[50]),
.i_rd_fifoReady_down(ready[212]),
.o_rd_valid_left(), //data_valid_left
.o_rd_valid_right(data_valid[55]), //data_valid_right
.o_rd_valid_up(data_valid[49]),
.o_rd_valid_down(data_valid[213]),

.o_wr_fifoReady_left(),
.o_wr_fifoReady_right(ready[55]),
.o_wr_fifoReady_up(ready[49]),
.o_wr_fifoReady_down(ready[213])
);

switch #(.packet_size(16),.x(3'd0),.y(3'd5), .xno_switch(xno),.yno_switch(yno), .RTfile("rt5.h"), .numWeight(4)) switch5(
.clk(clk),
.i_data_left(),//
.i_data_right(wire15_2_1),
.i_data_up(wire12_2_1),//
.i_data_down(wire01_1_1),

.i_wr_valid_left(1'b0),
.i_wr_valid_right(data_valid[58]),
.i_wr_valid_up(data_valid[52]),
.i_wr_valid_down(data_valid[49]),

.i_reset(i_reset), // Assigning a single reset signal for the entire circuit, to be kept high for sometime for circuit initialization
.o_data_left(), //
.o_data_right(wire15_1_1),
.o_data_up(wire12_1_1), // 
.o_data_down(wire01_2_1),

.i_rd_fifoReady_left(1'b0), // given by an external module
.i_rd_fifoReady_right(ready[58]),
.i_rd_fifoReady_up(ready[52]),
.i_rd_fifoReady_down(ready[49]),

.o_rd_valid_left(),//
.o_rd_valid_right(data_valid[57]),
.o_rd_valid_up(data_valid[51]),
.o_rd_valid_down(data_valid[50]),


.o_wr_fifoReady_left(), //
.o_wr_fifoReady_right(ready[57]),
.o_wr_fifoReady_up(ready[51]),
.o_wr_fifoReady_down(ready[50])


);

switch #(.packet_size(16),.x(3'd1),.y(3'd4), .xno_switch(xno),.yno_switch(yno), .RTfile("rt12.h"), .numWeight(10)) switch12(
.clk(clk),
.i_data_left(wire04_1_1),//dataIn_left
.i_data_right(wire48_2_1), //dataIn_right 
.i_data_up(wire45_2_1),
.i_data_down(wirev1_1),//

.i_wr_valid_left(data_valid[55]),
.i_wr_valid_right(data_valid[70]),
.i_wr_valid_up(data_valid[64]),
.i_wr_valid_down(data_valid[214]),

.i_reset(i_reset), // Assigning a single reset signal for the entire circuit, to be kept high for sometime for circuit initialization
.o_data_left(wire04_2_1), //dataOut_left
.o_data_right(wire48_1_1),
.o_data_up(wire45_1_1),
.o_data_down(wirev1_2), // 

.i_rd_fifoReady_left(ready[55]),
.i_rd_fifoReady_right(ready[70]),
.i_rd_fifoReady_up(ready[64]),
.i_rd_fifoReady_down(ready[214]),

.o_rd_valid_left(data_valid[56]), //data_valid_left
.o_rd_valid_right(data_valid[69]), //data_valid_right
.o_rd_valid_up(data_valid[63]),
.o_rd_valid_down(data_valid[215]), // 


.o_wr_fifoReady_left(ready[56]),
.o_wr_fifoReady_right(ready[69]),
.o_wr_fifoReady_up(ready[63]),
.o_wr_fifoReady_down(ready[215])


);

switch #(.packet_size(16),.x(3'd1),.y(3'd5), .xno_switch(xno),.yno_switch(yno), .RTfile("rt13.h"), .numWeight(4)) switch13(
.clk(clk),
.i_data_left(wire15_1_1),//dataIn_left
.i_data_right(wire59_2_1), //dataIn_right
.i_data_up(wire56_2_1),
.i_data_down(wire45_1_1),//

.i_wr_valid_left(data_valid[57]),
.i_wr_valid_right(data_valid[72]),
.i_wr_valid_up(data_valid[66]),
.i_wr_valid_down(data_valid[63]),

.i_reset(i_reset), // Assigning a single reset signal for the entire circuit, to be kept high for sometime for circuit initialization
.o_data_left(wire15_2_1), //dataOut_left
.o_data_right(wire59_1_1),
.o_data_up(wire56_1_1),
.o_data_down(wire45_2_1), // 

.i_rd_fifoReady_left(ready[57]),
.i_rd_fifoReady_right(ready[72]),
.i_rd_fifoReady_up(ready[66]),
.i_rd_fifoReady_down(ready[63]),

.o_rd_valid_left(data_valid[58]), //data_valid_left
.o_rd_valid_right(data_valid[71]), //data_valid_right
.o_rd_valid_up(data_valid[65]),
.o_rd_valid_down(data_valid[64]), // 


.o_wr_fifoReady_left(ready[58]),
.o_wr_fifoReady_right(ready[71]),
.o_wr_fifoReady_up(ready[65]),
.o_wr_fifoReady_down(ready[64])


);

switch #(.packet_size(16),.x(3'd2),.y(3'd4), .xno_switch(xno),.yno_switch(yno), .RTfile("rt20.h"), .numWeight(3)) switch20(
.clk(clk),
.i_data_left(wire48_1_1),
.i_data_right(wire8C_2_1), //
.i_data_up(wire89_2_1),
.i_data_down(wirev2_1),//

.i_wr_valid_left(data_valid[69]),
.i_wr_valid_right(data_valid[84]),
.i_wr_valid_up(data_valid[78]),
.i_wr_valid_down(data_valid[216]),

.i_reset(i_reset), // Assigning a single reset signal for the entire circuit, to be kept high for sometime for circuit initialization
.o_data_left(wire48_2_1),
.o_data_right(wire8C_1_1), // 
.o_data_up(wire89_1_1),
.o_data_down(wirev2_2), // 

.i_rd_fifoReady_left(ready[69]),
.i_rd_fifoReady_right(ready[84]),
.i_rd_fifoReady_up(ready[78]),
.i_rd_fifoReady_down(ready[216]),

.o_rd_valid_left(data_valid[70]), //data_valid_left
.o_rd_valid_right(data_valid[83]), //
.o_rd_valid_up(data_valid[77]),
.o_rd_valid_down(data_valid[217]), //


.o_wr_fifoReady_left(ready[70]),
.o_wr_fifoReady_right(ready[83]),
.o_wr_fifoReady_up(ready[77]),
.o_wr_fifoReady_down(ready[217])


);

switch #(.packet_size(16),.x(3'd2),.y(3'd5), .xno_switch(xno),.yno_switch(yno), .RTfile("rt21.h"), .numWeight(3)) switch21(

.clk(clk),
.i_data_left(wire59_1_1),
.i_data_right(wire9D_2_1),//
.i_data_up(wire9A_2_1),//
.i_data_down(wire89_1_1),

.i_wr_valid_left(data_valid[71]),
.i_wr_valid_right(data_valid[86]),
.i_wr_valid_up(data_valid[80]),
.i_wr_valid_down(data_valid[77]),

.i_reset(i_reset), // Assigning a single reset signal for the entire circuit, to be kept high for sometime for circuit initialization
.o_data_left(wire59_2_1),
.o_data_right(wire9D_1_1), //
.o_data_up(wire9A_1_1),//
.o_data_down(wire89_2_1),

.i_rd_fifoReady_left(ready[71]),
.i_rd_fifoReady_right(ready[86]),
.i_rd_fifoReady_up(ready[80]),
.i_rd_fifoReady_down(ready[77]),

.o_rd_valid_left(data_valid[72]),
.o_rd_valid_right(data_valid[85]), //
.o_rd_valid_up(data_valid[79]),//
.o_rd_valid_down(data_valid[78]),


.o_wr_fifoReady_left(ready[72]),
.o_wr_fifoReady_right(ready[85]),
.o_wr_fifoReady_up(ready[79]),
.o_wr_fifoReady_down(ready[78])


);

switch #(.packet_size(16),.x(3'd3),.y(3'd4), .xno_switch(xno),.yno_switch(yno), .RTfile("rt28.h"), .numWeight(10)) switch28(
.clk(clk),
.i_data_left(wire8C_1_1),//dataIn_left
.i_data_right(wireh4_2), //dataIn_right
.i_data_up(wireCD_2_1),
.i_data_down(wirev3_1),//

.i_wr_valid_left(data_valid[83]),
.i_wr_valid_right(data_valid[205]),
.i_wr_valid_up(data_valid[92]),
.i_wr_valid_down(data_valid[218]),

.i_reset(i_reset), // Assigning a single reset signal for the entire circuit, to be kept high for sometime for circuit initialization
.o_data_left(wire8C_2_1), //dataOut_left
.o_data_right(wireh4_1),
.o_data_up(wireCD_1_1),
.o_data_down(wirev3_2), // 

.i_rd_fifoReady_left(ready[83]),
.i_rd_fifoReady_right(ready[205]),
.i_rd_fifoReady_up(ready[92]),
.i_rd_fifoReady_down(ready[218]),

.o_rd_valid_left(data_valid[84]), //data_valid_left
.o_rd_valid_right(data_valid[204]), //data_valid_right
.o_rd_valid_up(data_valid[91]),
.o_rd_valid_down(data_valid[219]), // 


.o_wr_fifoReady_left(ready[84]),
.o_wr_fifoReady_right(ready[204]),
.o_wr_fifoReady_up(ready[91]),
.o_wr_fifoReady_down(ready[219])


);

switch #(.packet_size(16),.x(3'd3),.y(3'd5), .xno_switch(xno),.yno_switch(yno), .RTfile("rt29.h"), .numWeight(10)) switch29(
.clk(clk),
.i_data_left(wire9D_1_1),//dataIn_left
.i_data_right(wireh5_2), //dataIn_right
.i_data_up(wireDE_2_1),
.i_data_down(wireCD_1_1),

.i_wr_valid_left(data_valid[85]),
.i_wr_valid_right(data_valid[207]),
.i_wr_valid_up(data_valid[94]),
.i_wr_valid_down(data_valid[91]),

.i_reset(i_reset), // Assigning a single reset signal for the entire circuit, to be kept high for sometime for circuit initialization
.o_data_left(wire9D_2_1), //dataOut_left
.o_data_right(wireh5_1),
.o_data_up(wireDE_1_1),
.o_data_down(wireCD_2_1),

.i_rd_fifoReady_left(ready[85]),
.i_rd_fifoReady_right(ready[207]),
.i_rd_fifoReady_up(ready[94]),
.i_rd_fifoReady_down(ready[91]),

.o_rd_valid_left(data_valid[86]), //data_valid_left
.o_rd_valid_right(data_valid[206]), //data_valid_right
.o_rd_valid_up(data_valid[93]),
.o_rd_valid_down(data_valid[92]),


.o_wr_fifoReady_left(ready[86]),
.o_wr_fifoReady_right(ready[206]),
.o_wr_fifoReady_up(ready[93]),
.o_wr_fifoReady_down(ready[92])


);

switch #(.packet_size(16),.x(3'd0),.y(3'd6), .xno_switch(xno),.yno_switch(yno), .RTfile("rt6.h"), .numWeight(4)) switch6(
.clk(clk),
.i_data_left(),//dataIn_left
.i_data_right(wire26_2_1), //dataIn_right
.i_data_up(wire23_2_1),
.i_data_down(wire12_1_1),

.i_wr_valid_left(),
.i_wr_valid_right(data_valid[11]),
.i_wr_valid_up(data_valid[97]),
.i_wr_valid_down(data_valid[51]),

.i_reset(i_reset), // Assigning a single reset signal for the entire circuit, to be kept high for sometime for circuit initialization
.o_data_left(), //dataOut_left
.o_data_right(wire26_1_1),
.o_data_up(wire23_1_1),
.o_data_down(wire12_2_1), // 

.i_rd_fifoReady_left(1'b0), // given by an external module
.i_rd_fifoReady_right(ready[60]),
.i_rd_fifoReady_up(ready[97]),
.i_rd_fifoReady_down(ready[51]),

.o_rd_valid_left(), //data_valid_left
.o_rd_valid_right(data_valid[59]), //data_valid_right
.o_rd_valid_up(data_valid[53]),
.o_rd_valid_down(data_valid[52]), // 


.o_wr_fifoReady_left(),
.o_wr_fifoReady_right(ready[59]),
.o_wr_fifoReady_up(ready[53]),
.o_wr_fifoReady_down(ready[52])

);

switch #(.packet_size(16),.x(3'd0),.y(3'd7), .xno_switch(xno),.yno_switch(yno), .RTfile("rt7.h"), .numWeight(4)) switch7(
.clk(clk),
.i_data_left(),//dataIn_left
.i_data_right(wire37_2_1), //dataIn_right
.i_data_up(),
.i_data_down(wire23_1_1),

.i_wr_valid_left(),
.i_wr_valid_right(data_valid[62]),
.i_wr_valid_up(),
.i_wr_valid_down(data_valid[53]),

.i_reset(i_reset), // Assigning a single reset signal for the entire circuit, to be kept high for sometime for circuit initialization
.o_data_left(), //dataOut_left
.o_data_right(wire37_1_1),
.o_data_up(),
.o_data_down(wire23_2_1),

.i_rd_fifoReady_left(1'b0), // given by an external module
.i_rd_fifoReady_right(ready[62]),
.i_rd_fifoReady_up(1'b0),
.i_rd_fifoReady_down(ready[53]),

.o_rd_valid_left(), //data_valid_left
.o_rd_valid_right(data_valid[61]), //data_valid_right
.o_rd_valid_up(),
.o_rd_valid_down(data_valid[97]),


.o_wr_fifoReady_left(),
.o_wr_fifoReady_right(ready[61]),
.o_wr_fifoReady_up(),
.o_wr_fifoReady_down(ready[97])

);

switch #(.packet_size(16),.x(3'd1),.y(3'd6), .xno_switch(xno),.yno_switch(yno), .RTfile("rt14.h"), .numWeight(4)) switch14(
.clk(clk),
.i_data_left(wire26_1_1),//dataIn_left
.i_data_right(wire6A_2_1), //dataIn_right
.i_data_up(wire67_2_1),
.i_data_down(wire56_1_1),

.i_wr_valid_left(data_valid[59]),
.i_wr_valid_right(data_valid[74]),
.i_wr_valid_up(data_valid[68]),
.i_wr_valid_down(data_valid[65]),

.i_reset(i_reset), // Assigning a single reset signal for the entire circuit, to be kept high for sometime for circuit initialization
.o_data_left(wire26_2_1), //dataOut_left
.o_data_right(wire6A_1_1),
.o_data_up(wire67_1_1),
.o_data_down(wire56_2_1),

.i_rd_fifoReady_left(ready[59]),
.i_rd_fifoReady_right(ready[74]),
.i_rd_fifoReady_up(ready[68]),
.i_rd_fifoReady_down(ready[65]),

.o_rd_valid_left(data_valid[11]), //data_valid_left
.o_rd_valid_right(data_valid[73]), //data_valid_right
.o_rd_valid_up(data_valid[67]),
.o_rd_valid_down(data_valid[66]),


.o_wr_fifoReady_left(ready[60]),
.o_wr_fifoReady_right(ready[73]),
.o_wr_fifoReady_up(ready[67]),
.o_wr_fifoReady_down(ready[66])


);

switch #(.packet_size(16),.x(3'd1),.y(3'd7), .xno_switch(xno),.yno_switch(yno), .RTfile("rt15.h"), .numWeight(4)) switch15(
.clk(clk),
.i_data_left(wire37_1_1),//dataIn_left
.i_data_right(wire7B_2_1), //dataIn_right
.i_data_up(),
.i_data_down(wire67_1_1),

.i_wr_valid_left(data_valid[61]),
.i_wr_valid_right(data_valid[76]),
.i_wr_valid_up(),
.i_wr_valid_down(data_valid[67]),

.i_reset(i_reset), // Assigning a single reset signal for the entire circuit, to be kept high for sometime for circuit initialization
.o_data_left(wire37_2_1), //dataOut_left
.o_data_right(wire7B_1_1),
.o_data_up(),
.o_data_down(wire67_2_1), // 

.i_rd_fifoReady_left(ready[61]),
.i_rd_fifoReady_right(ready[76]),
.i_rd_fifoReady_up(),
.i_rd_fifoReady_down(ready[67]),

.o_rd_valid_left(data_valid[62]), //data_valid_left
.o_rd_valid_right(data_valid[75]), //data_valid_right
.o_rd_valid_up(),
.o_rd_valid_down(data_valid[68]),


.o_wr_fifoReady_left(ready[62]),
.o_wr_fifoReady_right(ready[75]),
.o_wr_fifoReady_up(),
.o_wr_fifoReady_down(ready[68])


);

switch #(.packet_size(16),.x(3'd2),.y(3'd6), .xno_switch(xno),.yno_switch(yno), .RTfile("rt22.h"), .numWeight(10)) switch22(
.clk(clk),
.i_data_left(wire6A_1_1),//dataIn_left
.i_data_right(wireAE_2_1), //dataIn_right
.i_data_up(wireAB_2_1),
.i_data_down(wire9A_1_1),

.i_wr_valid_left(data_valid[73]),
.i_wr_valid_right(data_valid[88]),
.i_wr_valid_up(data_valid[82]),
.i_wr_valid_down(data_valid[79]),

.i_reset(i_reset), // Assigning a single reset signal for the entire circuit, to be kept high for sometime for circuit initialization
.o_data_left(wire6A_2_1), //dataOut_left
.o_data_right(wireAE_1_1),
.o_data_up(wireAB_1_1),
.o_data_down(wire9A_2_1),

.i_rd_fifoReady_left(ready[73]),
.i_rd_fifoReady_right(ready[88]),
.i_rd_fifoReady_up(ready[82]),
.i_rd_fifoReady_down(ready[79]),

.o_rd_valid_left(data_valid[74]), //data_valid_left
.o_rd_valid_right(data_valid[87]), //data_valid_right
.o_rd_valid_up(data_valid[81]),
.o_rd_valid_down(data_valid[80]),


.o_wr_fifoReady_left(ready[74]),
.o_wr_fifoReady_right(ready[87]),
.o_wr_fifoReady_up(ready[81]),
.o_wr_fifoReady_down(ready[80])


);

switch #(.packet_size(16),.x(3'd2),.y(3'd7), .xno_switch(xno),.yno_switch(yno), .RTfile("rt23.h"), .numWeight(10)) switch23(
.clk(clk),
.i_data_left(wire7B_1_1),//dataIn_left
.i_data_right(wireBF_2_1), //dataIn_right
.i_data_up(),
.i_data_down(wireAB_1_1),

.i_wr_valid_left(data_valid[75]),
.i_wr_valid_right(data_valid[90]),
.i_wr_valid_up(),
.i_wr_valid_down(data_valid[81]),

.i_reset(i_reset), // Assigning a single reset signal for the entire circuit, to be kept high for sometime for circuit initialization
.o_data_left(wire7B_2_1), //dataOut_left
.o_data_right(wireBF_1_1),
.o_data_up(),
.o_data_down(wireAB_2_1),

.i_rd_fifoReady_left(ready[75]),
.i_rd_fifoReady_right(ready[90]),
.i_rd_fifoReady_up(),
.i_rd_fifoReady_down(ready[81]),

.o_rd_valid_left(data_valid[76]), //data_valid_left
.o_rd_valid_right(data_valid[89]), //data_valid_right
.o_rd_valid_up(),
.o_rd_valid_down(data_valid[82]),


.o_wr_fifoReady_left(ready[76]),
.o_wr_fifoReady_right(ready[89]),
.o_wr_fifoReady_up(),
.o_wr_fifoReady_down(ready[82])


);

switch #(.packet_size(16),.x(3'd3),.y(3'd6), .xno_switch(xno),.yno_switch(yno), .RTfile("rt30.h"), .numWeight(10)) switch30(
.clk(clk),
.i_data_left(wireAE_1_1),//dataIn_left
.i_data_right(wireh6_2), //dataIn_right
.i_data_up(wireEF_2_1),
.i_data_down(wireDE_1_1),

.i_wr_valid_left(data_valid[87]),
.i_wr_valid_right(data_valid[209]),
.i_wr_valid_up(data_valid[96]),
.i_wr_valid_down(data_valid[93]),

.i_reset(i_reset), // Assigning a single reset signal for the entire circuit, to be kept high for sometime for circuit initialization
.o_data_left(wireAE_2_1), //dataOut_left
.o_data_right(wireh6_1),
.o_data_up(wireEF_1_1),
.o_data_down(wireDE_2_1),

.i_rd_fifoReady_left(ready[87]),
.i_rd_fifoReady_right(ready[209]),
.i_rd_fifoReady_up(ready[96]),
.i_rd_fifoReady_down(ready[93]),

.o_rd_valid_left(data_valid[88]), //data_valid_left
.o_rd_valid_right(data_valid[208]), //data_valid_right
.o_rd_valid_up(data_valid[95]),
.o_rd_valid_down(data_valid[94]),


.o_wr_fifoReady_left(ready[88]),
.o_wr_fifoReady_right(data_valid[208]),
.o_wr_fifoReady_up(ready[95]),
.o_wr_fifoReady_down(ready[94])

);

switch #(.packet_size(16),.x(3'd3),.y(3'd7), .xno_switch(xno),.yno_switch(yno), .RTfile("rt31.h"), .numWeight(10)) switch31(
.clk(clk),
.i_data_left(wireBF_1_1),//dataIn_left
.i_data_right(wireh7_2), //dataIn_right
.i_data_up(),
.i_data_down(wireEF_1_1),

.i_wr_valid_left(data_valid[89]),
.i_wr_valid_right(data_valid[211]),
.i_wr_valid_up(),
.i_wr_valid_down(data_valid[95]),

.i_reset(i_reset), // Assigning a single reset signal for the entire circuit, to be kept high for sometime for circuit initialization
.o_data_left(wireBF_2_1), //dataOut_left
.o_data_right(wireh7_1),
.o_data_up(),
.o_data_down(wireEF_2_1),

.i_rd_fifoReady_left(ready[89]),
.i_rd_fifoReady_right(ready[211]),
.i_rd_fifoReady_up(),
.i_rd_fifoReady_down(ready[95]),

.o_rd_valid_left(data_valid[90]), //data_valid_left
.o_rd_valid_right(data_valid[210]), //data_valid_right
.o_rd_valid_up(),
.o_rd_valid_down(data_valid[96]),


.o_wr_fifoReady_left(ready[90]),
.o_wr_fifoReady_right(ready[210]),
.o_wr_fifoReady_up(),
.o_wr_fifoReady_down(ready[96])


);

// Part - 3

switch #(.packet_size(16),.x(3'd4),.y(3'd0), .xno_switch(xno),.yno_switch(yno), .RTfile("rt32.h"), .numWeight(10)) switch32(
.clk(clk),
.i_data_left(wireh0_1),//dataIn_left
.i_data_right(wire04_2_2), //dataIn_right
.i_data_up(wire01_2_2),
.i_data_down(),
.i_wr_valid_left(data_valid[196]),
.i_wr_valid_right(data_valid[105]),
.i_wr_valid_up(data_valid[99]),
.i_wr_valid_down(1'b0),
.i_reset(i_reset), // Assigning a single reset signal for the entire circuit, to be kept high for sometime for circuit initialization
.o_data_left(wireh0_2), //dataOut_left
.o_data_right(wire04_1_2),
.o_data_up(wire01_1_2),
.o_data_down(),
.i_rd_fifoReady_left(ready[196]), // given by an external module
.i_rd_fifoReady_right(ready[105]),
.i_rd_fifoReady_up(ready[99]),
.i_rd_fifoReady_down(1'b0),
.o_rd_valid_left(data_valid[197]), //data_valid_left
.o_rd_valid_right(data_valid[104]),
.o_rd_valid_up(data_valid[98]),
.o_rd_valid_down(),

.o_wr_fifoReady_left(ready[197]),
.o_wr_fifoReady_right(ready[104]),
.o_wr_fifoReady_up(ready[98]),
.o_wr_fifoReady_down()
);

switch #(.packet_size(16),.x(3'd4),.y(3'd1), .xno_switch(xno),.yno_switch(yno), .RTfile("rt33.h"), .numWeight(10)) switch33(
.clk(clk),
.i_data_left(wireh1_1),//
.i_data_right(wire15_2_2),
.i_data_up(wire12_2_2),//
.i_data_down(wire01_1_2),

.i_wr_valid_left(data_valid[198]),
.i_wr_valid_right(data_valid[107]),
.i_wr_valid_up(data_valid[101]),
.i_wr_valid_down(data_valid[98]),

.i_reset(i_reset), // Assigning a single reset signal for the entire circuit, to be kept high for sometime for circuit initialization
.o_data_left(wireh1_2), //
.o_data_right(wire15_1_2),
.o_data_up(wire12_1_2), // 
.o_data_down(wire01_2_2),

.i_rd_fifoReady_left(ready[198]), // given by an external module
.i_rd_fifoReady_right(ready[107]),
.i_rd_fifoReady_up(ready[101]),
.i_rd_fifoReady_down(ready[98]),

.o_rd_valid_left(data_valid[199]),//
.o_rd_valid_right(data_valid[106]),
.o_rd_valid_up(data_valid[100]),
.o_rd_valid_down(data_valid[99]),


.o_wr_fifoReady_left(ready[199]), //
.o_wr_fifoReady_right(ready[106]),
.o_wr_fifoReady_up(ready[100]),
.o_wr_fifoReady_down(ready[99])


);

switch #(.packet_size(16),.x(3'd5),.y(3'd0), .xno_switch(xno),.yno_switch(yno), .RTfile("rt40.h"), .numWeight(10)) switch40(
.clk(clk),
.i_data_left(wire04_1_2),//dataIn_left
.i_data_right(wire48_2_2), //dataIn_right 
.i_data_up(wire45_2_2),
.i_data_down(),//

.i_wr_valid_left(data_valid[104]),
.i_wr_valid_right(data_valid[119]),
.i_wr_valid_up(data_valid[113]),
.i_wr_valid_down(1'b0),

.i_reset(i_reset), // Assigning a single reset signal for the entire circuit, to be kept high for sometime for circuit initialization
.o_data_left(wire04_2_2), //dataOut_left
.o_data_right(wire48_1_2),
.o_data_up(wire45_1_2),
.o_data_down(), // 

.i_rd_fifoReady_left(ready[104]),
.i_rd_fifoReady_right(ready[119]),
.i_rd_fifoReady_up(ready[113]),
.i_rd_fifoReady_down(1'b0),

.o_rd_valid_left(data_valid[105]),
.o_rd_valid_right(data_valid[118]),
.o_rd_valid_up(data_valid[112]),
.o_rd_valid_down(), // 


.o_wr_fifoReady_left(ready[105]),
.o_wr_fifoReady_right(ready[118]),
.o_wr_fifoReady_up(ready[112]),
.o_wr_fifoReady_down()


);

switch #(.packet_size(16),.x(3'd5),.y(3'd1), .xno_switch(xno),.yno_switch(yno), .RTfile("rt41.h"), .numWeight(4)) switch41(
.clk(clk),
.i_data_left(wire15_1_2),//dataIn_left
.i_data_right(wire59_2_2), //dataIn_right
.i_data_up(wire56_2_2),
.i_data_down(wire45_1_2),//

.i_wr_valid_left(data_valid[106]),
.i_wr_valid_right(data_valid[121]),
.i_wr_valid_up(data_valid[115]),
.i_wr_valid_down(data_valid[112]),

.i_reset(i_reset), // Assigning a single reset signal for the entire circuit, to be kept high for sometime for circuit initialization
.o_data_left(wire15_2_2), //dataOut_left
.o_data_right(wire59_1_2),
.o_data_up(wire56_1_2),
.o_data_down(wire45_2_2), // 

.i_rd_fifoReady_left(ready[106]),
.i_rd_fifoReady_right(ready[121]),
.i_rd_fifoReady_up(ready[115]),
.i_rd_fifoReady_down(ready[112]),

.o_rd_valid_left(data_valid[107]),
.o_rd_valid_right(data_valid[120]),
.o_rd_valid_up(data_valid[114]),
.o_rd_valid_down(data_valid[113]),


.o_wr_fifoReady_left(ready[107]),
.o_wr_fifoReady_right(ready[120]),
.o_wr_fifoReady_up(ready[114]),
.o_wr_fifoReady_down(ready[113])


);

switch #(.packet_size(16),.x(3'd6),.y(3'd0), .xno_switch(xno),.yno_switch(yno), .RTfile("rt48.h"), .numWeight(3)) switch48(
.clk(clk),
.i_data_left(wire48_1_2),
.i_data_right(wire8C_2_2), //
.i_data_up(wire89_2_2),
.i_data_down(),//

.i_wr_valid_left(data_valid[118]),
.i_wr_valid_right(data_valid[133]),
.i_wr_valid_up(data_valid[127]),
.i_wr_valid_down(1'b0),

.i_reset(i_reset), // Assigning a single reset signal for the entire circuit, to be kept high for sometime for circuit initialization
.o_data_left(wire48_2_2),
.o_data_right(wire8C_1_2), // 
.o_data_up(wire89_1_2),
.o_data_down(), // 

.i_rd_fifoReady_left(ready[118]),
.i_rd_fifoReady_right(ready[133]),
.i_rd_fifoReady_up(ready[127]),
.i_rd_fifoReady_down(1'b0),

.o_rd_valid_left(data_valid[119]),
.o_rd_valid_right(data_valid[132]),
.o_rd_valid_up(data_valid[126]),
.o_rd_valid_down(), //


.o_wr_fifoReady_left(ready[119]),
.o_wr_fifoReady_right(ready[132]),
.o_wr_fifoReady_up(ready[126]),
.o_wr_fifoReady_down()


);

switch #(.packet_size(16),.x(3'd6),.y(3'd1), .xno_switch(xno),.yno_switch(yno), .RTfile("rt49.h"), .numWeight(3)) switch49(

.clk(clk),
.i_data_left(wire59_1_2),
.i_data_right(wire9D_2_2),//
.i_data_up(wire9A_2_2),//
.i_data_down(wire89_1_2),

.i_wr_valid_left(data_valid[120]),
.i_wr_valid_right(data_valid[135]),
.i_wr_valid_up(data_valid[129]),
.i_wr_valid_down(data_valid[126]),

.i_reset(i_reset), // Assigning a single reset signal for the entire circuit, to be kept high for sometime for circuit initialization
.o_data_left(wire59_2_2),
.o_data_right(wire9D_1_2), //
.o_data_up(wire9A_1_2),//
.o_data_down(wire89_2_2),

.i_rd_fifoReady_left(ready[120]),
.i_rd_fifoReady_right(ready[135]),
.i_rd_fifoReady_up(ready[129]),
.i_rd_fifoReady_down(ready[126]),

.o_rd_valid_left(data_valid[121]),
.o_rd_valid_right(data_valid[134]),
.o_rd_valid_up(data_valid[128]),
.o_rd_valid_down(data_valid[127]),


.o_wr_fifoReady_left(ready[121]),
.o_wr_fifoReady_right(ready[134]),
.o_wr_fifoReady_up(ready[128]),
.o_wr_fifoReady_down(ready[127])


);

switch #(.packet_size(16),.x(3'd7),.y(3'd0), .xno_switch(xno),.yno_switch(yno), .RTfile("rt56.h"), .numWeight(10)) switch56(
.clk(clk),
.i_data_left(wire8C_1_2),//dataIn_left
.i_data_right(), //dataIn_right
.i_data_up(wireCD_2_2),
.i_data_down(),//

.i_wr_valid_left(data_valid[132]),
.i_wr_valid_right(1'b0),
.i_wr_valid_up(data_valid[141]),
.i_wr_valid_down(1'b0),

.i_reset(i_reset), // Assigning a single reset signal for the entire circuit, to be kept high for sometime for circuit initialization
.o_data_left(wire8C_2_2), //dataOut_left
.o_data_right(),
.o_data_up(wireCD_1_2),
.o_data_down(), // 

.i_rd_fifoReady_left(ready[132]),
.i_rd_fifoReady_right(1'b0),
.i_rd_fifoReady_up(ready[141]),
.i_rd_fifoReady_down(1'b0),

.o_rd_valid_left(data_valid[133]),
.o_rd_valid_right(), //data_valid_right
.o_rd_valid_up(data_valid[140]),
.o_rd_valid_down(), // 


.o_wr_fifoReady_left(ready[133]),
.o_wr_fifoReady_right(),
.o_wr_fifoReady_up(ready[140]),
.o_wr_fifoReady_down()


);

switch #(.packet_size(16),.x(3'd7),.y(3'd1), .xno_switch(xno),.yno_switch(yno), .RTfile("rt57.h"), .numWeight(10)) switch57(
.clk(clk),
.i_data_left(wire9D_1_2),//dataIn_left
.i_data_right(), //dataIn_right
.i_data_up(wireDE_2_2),
.i_data_down(wireCD_1_2),

.i_wr_valid_left(data_valid[134]),
.i_wr_valid_right(1'b0),
.i_wr_valid_up(data_valid[143]),
.i_wr_valid_down(data_valid[140]),

.i_reset(i_reset), // Assigning a single reset signal for the entire circuit, to be kept high for sometime for circuit initialization
.o_data_left(wire9D_2_2), //dataOut_left
.o_data_right(),
.o_data_up(wireDE_1_2),
.o_data_down(wireCD_2_2),

.i_rd_fifoReady_left(ready[134]),
.i_rd_fifoReady_right(1'b0),
.i_rd_fifoReady_up(ready[143]),
.i_rd_fifoReady_down(ready[140]),

.o_rd_valid_left(data_valid[135]),
.o_rd_valid_right(), //data_valid_right
.o_rd_valid_up(data_valid[142]),
.o_rd_valid_down(data_valid[141]),


.o_wr_fifoReady_left(ready[135]),
.o_wr_fifoReady_right(),
.o_wr_fifoReady_up(ready[142]),
.o_wr_fifoReady_down(ready[141])


);

switch #(.packet_size(16),.x(3'd4),.y(3'd2), .xno_switch(xno),.yno_switch(yno), .RTfile("rt34.h"), .numWeight(10)) switch34(
.clk(clk),
.i_data_left(wireh2_1),//dataIn_left
.i_data_right(wire26_2_2), //dataIn_right
.i_data_up(wire23_2_2),
.i_data_down(wire12_1_2),

.i_wr_valid_left(data_valid[200]),
.i_wr_valid_right(data_valid[60]),
.i_wr_valid_up(data_valid[146]),
.i_wr_valid_down(data_valid[100]),

.i_reset(i_reset), // Assigning a single reset signal for the entire circuit, to be kept high for sometime for circuit initialization
.o_data_left(wireh2_2), //dataOut_left
.o_data_right(wire26_1_2),
.o_data_up(wire23_1_2),
.o_data_down(wire12_2_2), // 

.i_rd_fifoReady_left(ready[200]), // given by an external module
.i_rd_fifoReady_right(ready[109]),
.i_rd_fifoReady_up(ready[146]),
.i_rd_fifoReady_down(ready[100]),

.o_rd_valid_left(data_valid[201]), //data_valid_left
.o_rd_valid_right(data_valid[108]),
.o_rd_valid_up(data_valid[102]),
.o_rd_valid_down(data_valid[101]),


.o_wr_fifoReady_left(ready[201]),
.o_wr_fifoReady_right(ready[108]),
.o_wr_fifoReady_up(ready[102]),
.o_wr_fifoReady_down(ready[101])


);

switch #(.packet_size(16),.x(3'd4),.y(3'd3), .xno_switch(xno),.yno_switch(yno), .RTfile("rt35.h"), .numWeight(10)) switch35(
.clk(clk),
.i_data_left(wireh3_1),//dataIn_left
.i_data_right(wire37_2_2), //dataIn_right
.i_data_up(wirev4_2),
.i_data_down(wire23_1_2),

.i_wr_valid_left(data_valid[202]),
.i_wr_valid_right(data_valid[111]),
.i_wr_valid_up(data_valid[221]),
.i_wr_valid_down(data_valid[102]),

.i_reset(i_reset), // Assigning a single reset signal for the entire circuit, to be kept high for sometime for circuit initialization
.o_data_left(wireh3_2), //dataOut_left
.o_data_right(wire37_1_2),
.o_data_up(wirev4_1),
.o_data_down(wire23_2_2),

.i_rd_fifoReady_left(ready[202]), // given by an external module
.i_rd_fifoReady_right(ready[111]),
.i_rd_fifoReady_up(ready[221]),
.i_rd_fifoReady_down(ready[102]),

.o_rd_valid_left(data_valid[203]), //data_valid_left
.o_rd_valid_right(data_valid[110]),
.o_rd_valid_up(data_valid[220]),
.o_rd_valid_down(data_valid[146]),


.o_wr_fifoReady_left(ready[203]),
.o_wr_fifoReady_right(ready[110]),
.o_wr_fifoReady_up(ready[220]),
.o_wr_fifoReady_down(ready[146])


);

switch #(.packet_size(16),.x(3'd5),.y(3'd2), .xno_switch(xno),.yno_switch(yno), .RTfile("rt42.h"), .numWeight(4)) switch42(
.clk(clk),
.i_data_left(wire26_1_2),//dataIn_left
.i_data_right(wire6A_2_2), //dataIn_right
.i_data_up(wire67_2_2),
.i_data_down(wire56_1_2),

.i_wr_valid_left(data_valid[108]),
.i_wr_valid_right(data_valid[123]),
.i_wr_valid_up(data_valid[117]),
.i_wr_valid_down(data_valid[114]),

.i_reset(i_reset), // Assigning a single reset signal for the entire circuit, to be kept high for sometime for circuit initialization
.o_data_left(wire26_2_2), //dataOut_left
.o_data_right(wire6A_1_2),
.o_data_up(wire67_1_2),
.o_data_down(wire56_2_2),

.i_rd_fifoReady_left(ready[108]),
.i_rd_fifoReady_right(ready[123]),
.i_rd_fifoReady_up(ready[117]),
.i_rd_fifoReady_down(ready[114]),

.o_rd_valid_left(data_valid[60]),
.o_rd_valid_right(data_valid[122]),
.o_rd_valid_up(data_valid[116]),
.o_rd_valid_down(data_valid[115]),


.o_wr_fifoReady_left(ready[109]),
.o_wr_fifoReady_right(ready[122]),
.o_wr_fifoReady_up(ready[116]),
.o_wr_fifoReady_down(ready[115])


);

switch #(.packet_size(16),.x(3'd5),.y(3'd3), .xno_switch(xno),.yno_switch(yno), .RTfile("rt43.h"), .numWeight(4)) switch43(
.clk(clk),
.i_data_left(wire37_1_2),//dataIn_left
.i_data_right(wire7B_2_2), //dataIn_right
.i_data_up(wirev5_2),
.i_data_down(wire67_1_2),

.i_wr_valid_left(data_valid[110]),
.i_wr_valid_right(data_valid[125]),
.i_wr_valid_up(data_valid[223]),
.i_wr_valid_down(data_valid[116]),

.i_reset(i_reset), // Assigning a single reset signal for the entire circuit, to be kept high for sometime for circuit initialization
.o_data_left(wire37_2_2), //dataOut_left
.o_data_right(wire7B_1_2),
.o_data_up(wirev5_1),
.o_data_down(wire67_2_2), // 

.i_rd_fifoReady_left(ready[110]),
.i_rd_fifoReady_right(ready[125]),
.i_rd_fifoReady_up(ready[223]),
.i_rd_fifoReady_down(ready[116]),

.o_rd_valid_left(data_valid[111]),
.o_rd_valid_right(data_valid[124]),
.o_rd_valid_up(data_valid[222]),
.o_rd_valid_down(data_valid[117]),


.o_wr_fifoReady_left(ready[111]),
.o_wr_fifoReady_right(ready[124]),
.o_wr_fifoReady_up(ready[222]),
.o_wr_fifoReady_down(ready[117])


);

switch #(.packet_size(16),.x(3'd6),.y(3'd2), .xno_switch(xno),.yno_switch(yno), .RTfile("rt50.h"), .numWeight(10)) switch50(
.clk(clk),
.i_data_left(wire6A_1_2),//dataIn_left
.i_data_right(wireAE_2_2), //dataIn_right
.i_data_up(wireAB_2_2),
.i_data_down(wire9A_1_2),

.i_wr_valid_left(data_valid[122]),
.i_wr_valid_right(data_valid[137]),
.i_wr_valid_up(data_valid[131]),
.i_wr_valid_down(data_valid[128]),

.i_reset(i_reset), // Assigning a single reset signal for the entire circuit, to be kept high for sometime for circuit initialization
.o_data_left(wire6A_2_2), //dataOut_left
.o_data_right(wireAE_1_2),
.o_data_up(wireAB_1_2),
.o_data_down(wire9A_2_2),

.i_rd_fifoReady_left(ready[122]),
.i_rd_fifoReady_right(ready[137]),
.i_rd_fifoReady_up(ready[131]),
.i_rd_fifoReady_down(ready[128]),

.o_rd_valid_left(data_valid[123]),
.o_rd_valid_right(data_valid[136]),
.o_rd_valid_up(data_valid[130]),
.o_rd_valid_down(data_valid[129]),


.o_wr_fifoReady_left(ready[123]),
.o_wr_fifoReady_right(ready[136]),
.o_wr_fifoReady_up(ready[130]),
.o_wr_fifoReady_down(ready[129])


);

switch #(.packet_size(16),.x(3'd6),.y(3'd3), .xno_switch(xno),.yno_switch(yno), .RTfile("rt51.h"), .numWeight(10)) switch51(
.clk(clk),
.i_data_left(wire7B_1_2),//dataIn_left
.i_data_right(wireBF_2_2), //dataIn_right
.i_data_up(wirev6_2),
.i_data_down(wireAB_1_2),

.i_wr_valid_left(data_valid[124]),
.i_wr_valid_right(data_valid[139]),
.i_wr_valid_up(data_valid[225]),
.i_wr_valid_down(data_valid[130]),

.i_reset(i_reset), // Assigning a single reset signal for the entire circuit, to be kept high for sometime for circuit initialization
.o_data_left(wire7B_2_2), //dataOut_left
.o_data_right(wireBF_1_2),
.o_data_up(wirev6_1),
.o_data_down(wireAB_2_2),

.i_rd_fifoReady_left(ready[124]),
.i_rd_fifoReady_right(ready[139]),
.i_rd_fifoReady_up(ready[225]),
.i_rd_fifoReady_down(ready[130]),

.o_rd_valid_left(data_valid[125]),
.o_rd_valid_right(data_valid[138]),
.o_rd_valid_up(data_valid[224]),
.o_rd_valid_down(data_valid[131]),


.o_wr_fifoReady_left(ready[125]),
.o_wr_fifoReady_right(ready[138]),
.o_wr_fifoReady_up(ready[224]),
.o_wr_fifoReady_down(ready[131])


);

switch #(.packet_size(16),.x(3'd7),.y(3'd2), .xno_switch(xno),.yno_switch(yno), .RTfile("rt58.h"), .numWeight(10)) switch58(
.clk(clk),
.i_data_left(wireAE_1_2),//dataIn_left
.i_data_right(), //dataIn_right
.i_data_up(wireEF_2_2),
.i_data_down(wireDE_1_2),

.i_wr_valid_left(data_valid[136]),
.i_wr_valid_right(),
.i_wr_valid_up(data_valid[145]),
.i_wr_valid_down(data_valid[142]),

.i_reset(i_reset), // Assigning a single reset signal for the entire circuit, to be kept high for sometime for circuit initialization
.o_data_left(wireAE_2_2), //dataOut_left
.o_data_right(),
.o_data_up(wireEF_1_2),
.o_data_down(wireDE_2_2),

.i_rd_fifoReady_left(ready[136]),
.i_rd_fifoReady_right(i_rd_en),
.i_rd_fifoReady_up(ready[145]),
.i_rd_fifoReady_down(ready[142]),

.o_rd_valid_left(data_valid[137]),
.o_rd_valid_right(), //data_valid_right
.o_rd_valid_up(data_valid[144]),
.o_rd_valid_down(data_valid[143]),


.o_wr_fifoReady_left(ready[137]),
.o_wr_fifoReady_right(),
.o_wr_fifoReady_up(ready[144]),
.o_wr_fifoReady_down(ready[143])

);

switch #(.packet_size(16),.x(3'd7),.y(3'd3), .xno_switch(xno),.yno_switch(yno), .RTfile("rt59.h"), .numWeight(10)) switch59(
.clk(clk),
.i_data_left(wireBF_1_2),//dataIn_left
.i_data_right(), //dataIn_right
.i_data_up(wirev7_2),
.i_data_down(wireEF_1_2),

.i_wr_valid_left(data_valid[138]),
.i_wr_valid_right(),
.i_wr_valid_up(data_valid[227]),
.i_wr_valid_down(data_valid[144]),

.i_reset(i_reset), // Assigning a single reset signal for the entire circuit, to be kept high for sometime for circuit initialization
.o_data_left(wireBF_2_2), //dataOut_left
.o_data_right(),
.o_data_up(wirev7_1),
.o_data_down(wireEF_2_2),

.i_rd_fifoReady_left(ready[138]),
.i_rd_fifoReady_right(),
.i_rd_fifoReady_up(ready[227]),
.i_rd_fifoReady_down(ready[144]),

.o_rd_valid_left(data_valid[139]),
.o_rd_valid_right(), //data_valid_right
.o_rd_valid_up(data_valid[226]),
.o_rd_valid_down(data_valid[145]),


.o_wr_fifoReady_left(ready[139]),
.o_wr_fifoReady_right(),
.o_wr_fifoReady_up(ready[226]),
.o_wr_fifoReady_down(ready[145])


);

// Part - 4

switch #(.packet_size(16),.x(3'd4),.y(3'd4), .xno_switch(xno),.yno_switch(yno), .RTfile("rt36.h"), .numWeight(10)) switch36(
.clk(clk),
.i_data_left(wireh4_1),//dataIn_left
.i_data_right(wire04_2_4), //dataIn_right
.i_data_up(wire01_2_4),
.i_data_down(wirev4_1),
.i_wr_valid_left(data_valid[204]),
.i_wr_valid_right(data_valid[154]),
.i_wr_valid_up(data_valid[148]),
.i_wr_valid_down(data_valid[220]),
.i_reset(i_reset), // Assigning a single reset signal for the entire circuit, to be kept high for sometime for circuit initialization
.o_data_left(wireh4_2), //dataOut_left
.o_data_right(wire04_1_4),
.o_data_up(wire01_1_4),
.o_data_down(wirev4_2),
.i_rd_fifoReady_left(ready[204]), // given by an external module
.i_rd_fifoReady_right(ready[154]),
.i_rd_fifoReady_up(ready[148]),
.i_rd_fifoReady_down(ready[220]),
.o_rd_valid_left(data_valid[205]), //data_valid_left
.o_rd_valid_right(data_valid[153]),
.o_rd_valid_up(data_valid[147]),
.o_rd_valid_down(data_valid[221]),

.o_wr_fifoReady_left(ready[205]),
.o_wr_fifoReady_right(ready[153]),
.o_wr_fifoReady_up(ready[147]),
.o_wr_fifoReady_down(ready[221])
);

switch #(.packet_size(16),.x(3'd4),.y(3'd5), .xno_switch(xno),.yno_switch(yno), .RTfile("rt37.h"), .numWeight(10)) switch37(
.clk(clk),
.i_data_left(wireh5_1),//
.i_data_right(wire15_2_4),
.i_data_up(wire12_2_4),//
.i_data_down(wire01_1_4),

.i_wr_valid_left(data_valid[206]),
.i_wr_valid_right(data_valid[156]),
.i_wr_valid_up(data_valid[150]),
.i_wr_valid_down(data_valid[147]),

.i_reset(i_reset), // Assigning a single reset signal for the entire circuit, to be kept high for sometime for circuit initialization
.o_data_left(wireh5_2), //
.o_data_right(wire15_1_4),
.o_data_up(wire12_1_4), // 
.o_data_down(wire01_2_4),

.i_rd_fifoReady_left(ready[206]), // given by an external module
.i_rd_fifoReady_right(ready[156]),
.i_rd_fifoReady_up(ready[150]),
.i_rd_fifoReady_down(ready[147]),

.o_rd_valid_left(data_valid[207]),//
.o_rd_valid_right(data_valid[155]),
.o_rd_valid_up(data_valid[149]),
.o_rd_valid_down(data_valid[148]),


.o_wr_fifoReady_left(ready[207]), //
.o_wr_fifoReady_right(ready[155]),
.o_wr_fifoReady_up(ready[149]),
.o_wr_fifoReady_down(ready[148])


);

switch #(.packet_size(16),.x(3'd5),.y(3'd4), .xno_switch(xno),.yno_switch(yno), .RTfile("rt44.h"), .numWeight(10)) switch44(
.clk(clk),
.i_data_left(wire04_1_4),//dataIn_left
.i_data_right(wire48_2_4), //dataIn_right 
.i_data_up(wire45_2_4),
.i_data_down(wirev5_1),//

.i_wr_valid_left(data_valid[153]),
.i_wr_valid_right(data_valid[168]),
.i_wr_valid_up(data_valid[162]),
.i_wr_valid_down(data_valid[222]),

.i_reset(i_reset), // Assigning a single reset signal for the entire circuit, to be kept high for sometime for circuit initialization
.o_data_left(wire04_2_4), //dataOut_left
.o_data_right(wire48_1_4),
.o_data_up(wire45_1_4),
.o_data_down(wirev5_2), // 

.i_rd_fifoReady_left(ready[153]),
.i_rd_fifoReady_right(ready[168]),
.i_rd_fifoReady_up(ready[162]),
.i_rd_fifoReady_down(ready[222]),

.o_rd_valid_left(data_valid[154]),
.o_rd_valid_right(data_valid[167]),
.o_rd_valid_up(data_valid[161]),
.o_rd_valid_down(data_valid[223]), // 


.o_wr_fifoReady_left(ready[154]),
.o_wr_fifoReady_right(ready[167]),
.o_wr_fifoReady_up(ready[161]),
.o_wr_fifoReady_down(ready[223])


);

switch #(.packet_size(16),.x(3'd5),.y(3'd5), .xno_switch(xno),.yno_switch(yno), .RTfile("rt45.h"), .numWeight(4)) switch45(
.clk(clk),
.i_data_left(wire15_1_4),//dataIn_left
.i_data_right(wire59_2_4), //dataIn_right
.i_data_up(wire56_2_4),
.i_data_down(wire45_1_4),//

.i_wr_valid_left(data_valid[155]),
.i_wr_valid_right(data_valid[170]),
.i_wr_valid_up(data_valid[164]),
.i_wr_valid_down(data_valid[161]),

.i_reset(i_reset), // Assigning a single reset signal for the entire circuit, to be kept high for sometime for circuit initialization
.o_data_left(wire15_2_4), //dataOut_left
.o_data_right(wire59_1_4),
.o_data_up(wire56_1_4),
.o_data_down(wire45_2_4), // 

.i_rd_fifoReady_left(ready[155]),
.i_rd_fifoReady_right(ready[170]),
.i_rd_fifoReady_up(ready[164]),
.i_rd_fifoReady_down(ready[161]),

.o_rd_valid_left(data_valid[156]),
.o_rd_valid_right(data_valid[169]),
.o_rd_valid_up(data_valid[163]),
.o_rd_valid_down(data_valid[162]),


.o_wr_fifoReady_left(ready[156]),
.o_wr_fifoReady_right(ready[169]),
.o_wr_fifoReady_up(ready[163]),
.o_wr_fifoReady_down(ready[162])


);

switch #(.packet_size(16),.x(3'd6),.y(3'd4), .xno_switch(xno),.yno_switch(yno), .RTfile("rt52.h"), .numWeight(3)) switch52(
.clk(clk),
.i_data_left(wire48_1_4),
.i_data_right(wire8C_2_4), //
.i_data_up(wire89_2_4),
.i_data_down(wirev6_1),//

.i_wr_valid_left(data_valid[167]),
.i_wr_valid_right(data_valid[182]),
.i_wr_valid_up(data_valid[176]),
.i_wr_valid_down(data_valid[224]),

.i_reset(i_reset), // Assigning a single reset signal for the entire circuit, to be kept high for sometime for circuit initialization
.o_data_left(wire48_2_4),
.o_data_right(wire8C_1_4), // 
.o_data_up(wire89_1_4),
.o_data_down(wirev6_2), // 

.i_rd_fifoReady_left(ready[167]),
.i_rd_fifoReady_right(ready[182]),
.i_rd_fifoReady_up(ready[176]),
.i_rd_fifoReady_down(ready[224]),

.o_rd_valid_left(data_valid[168]),
.o_rd_valid_right(data_valid[181]),
.o_rd_valid_up(data_valid[175]),
.o_rd_valid_down(data_valid[225]), //


.o_wr_fifoReady_left(ready[168]),
.o_wr_fifoReady_right(ready[181]),
.o_wr_fifoReady_up(ready[175]),
.o_wr_fifoReady_down(ready[225])


);

switch #(.packet_size(16),.x(3'd6),.y(3'd5), .xno_switch(xno),.yno_switch(yno), .RTfile("rt53.h"), .numWeight(3)) switch53(

.clk(clk),
.i_data_left(wire59_1_4),
.i_data_right(wire9D_2_4),//
.i_data_up(wire9A_2_4),//
.i_data_down(wire89_1_4),

.i_wr_valid_left(data_valid[169]),
.i_wr_valid_right(data_valid[184]),
.i_wr_valid_up(data_valid[178]),
.i_wr_valid_down(data_valid[175]),

.i_reset(i_reset), // Assigning a single reset signal for the entire circuit, to be kept high for sometime for circuit initialization
.o_data_left(wire59_2_4),
.o_data_right(wire9D_1_4), //
.o_data_up(wire9A_1_4),//
.o_data_down(wire89_2_4),

.i_rd_fifoReady_left(ready[169]),
.i_rd_fifoReady_right(ready[184]),
.i_rd_fifoReady_up(ready[178]),
.i_rd_fifoReady_down(ready[175]),

.o_rd_valid_left(data_valid[170]),
.o_rd_valid_right(data_valid[183]),
.o_rd_valid_up(data_valid[177]),
.o_rd_valid_down(data_valid[176]),


.o_wr_fifoReady_left(ready[170]),
.o_wr_fifoReady_right(ready[183]),
.o_wr_fifoReady_up(ready[177]),
.o_wr_fifoReady_down(ready[176])


);

switch #(.packet_size(16),.x(3'd7),.y(3'd4), .xno_switch(xno),.yno_switch(yno), .RTfile("rt60.h"), .numWeight(10)) switch60(
.clk(clk),
.i_data_left(wire8C_1_4),//dataIn_left
.i_data_right(), //dataIn_right
.i_data_up(wireCD_2_4),
.i_data_down(wirev7_1),//

.i_wr_valid_left(data_valid[181]),
.i_wr_valid_right(1'b0),
.i_wr_valid_up(data_valid[190]),
.i_wr_valid_down(data_valid[226]),

.i_reset(i_reset), // Assigning a single reset signal for the entire circuit, to be kept high for sometime for circuit initialization
.o_data_left(wire8C_2_4), //dataOut_left
.o_data_right(),
.o_data_up(wireCD_1_4),
.o_data_down(wirev7_2), // 

.i_rd_fifoReady_left(ready[181]),
.i_rd_fifoReady_right(1'b0),
.i_rd_fifoReady_up(ready[190]),
.i_rd_fifoReady_down(ready[226]),

.o_rd_valid_left(data_valid[182]),
.o_rd_valid_right(), //data_valid_right
.o_rd_valid_up(data_valid[189]),
.o_rd_valid_down(data_valid[227]), // 


.o_wr_fifoReady_left(ready[182]),
.o_wr_fifoReady_right(),
.o_wr_fifoReady_up(ready[189]),
.o_wr_fifoReady_down(ready[227])


);

switch #(.packet_size(16),.x(3'd7),.y(3'd5), .xno_switch(xno),.yno_switch(yno), .RTfile("rt61.h"), .numWeight(10)) switch61(
.clk(clk),
.i_data_left(wire9D_1_4),//dataIn_left
.i_data_right(), //dataIn_right
.i_data_up(wireDE_2_4),
.i_data_down(wireCD_1_4),

.i_wr_valid_left(data_valid[183]),
.i_wr_valid_right(1'b0),
.i_wr_valid_up(data_valid[192]),
.i_wr_valid_down(data_valid[189]),

.i_reset(i_reset), // Assigning a single reset signal for the entire circuit, to be kept high for sometime for circuit initialization
.o_data_left(wire9D_2_4), //dataOut_left
.o_data_right(),
.o_data_up(wireDE_1_4),
.o_data_down(wireCD_2_4),

.i_rd_fifoReady_left(ready[183]),
.i_rd_fifoReady_right(1'b0),
.i_rd_fifoReady_up(ready[192]),
.i_rd_fifoReady_down(ready[189]),

.o_rd_valid_left(data_valid[184]),
.o_rd_valid_right(), //data_valid_right
.o_rd_valid_up(data_valid[191]),
.o_rd_valid_down(data_valid[190]),


.o_wr_fifoReady_left(ready[184]),
.o_wr_fifoReady_right(),
.o_wr_fifoReady_up(ready[191]),
.o_wr_fifoReady_down(ready[190])


);

switch #(.packet_size(16),.x(3'd4),.y(3'd6), .xno_switch(xno),.yno_switch(yno), .RTfile("rt38.h"), .numWeight(10)) switch38(
.clk(clk),
.i_data_left(wireh6_1),//dataIn_left
.i_data_right(wire26_2_4), //dataIn_right
.i_data_up(wire23_2_4),
.i_data_down(wire12_1_4),

.i_wr_valid_left(data_valid[208]),
.i_wr_valid_right(data_valid[109]),
.i_wr_valid_up(data_valid[195]),
.i_wr_valid_down(data_valid[149]),

.i_reset(i_reset), // Assigning a single reset signal for the entire circuit, to be kept high for sometime for circuit initialization
.o_data_left(wireh6_2), //dataOut_left
.o_data_right(wire26_1_4),
.o_data_up(wire23_1_4),
.o_data_down(wire12_2_4), // 

.i_rd_fifoReady_left(ready[208]), // given by an external module
.i_rd_fifoReady_right(ready[158]),
.i_rd_fifoReady_up(ready[195]),
.i_rd_fifoReady_down(ready[149]),

.o_rd_valid_left(data_valid[209]), //data_valid_left
.o_rd_valid_right(data_valid[157]),
.o_rd_valid_up(data_valid[151]),
.o_rd_valid_down(data_valid[150]),


.o_wr_fifoReady_left(ready[209]),
.o_wr_fifoReady_right(ready[157]),
.o_wr_fifoReady_up(ready[151]),
.o_wr_fifoReady_down(ready[150])


);

switch #(.packet_size(16),.x(3'd4),.y(3'd7), .xno_switch(xno),.yno_switch(yno), .RTfile("rt39.h"), .numWeight(10)) switch39(
.clk(clk),
.i_data_left(wireh7_1),//dataIn_left
.i_data_right(wire37_2_4), //dataIn_right
.i_data_up(),
.i_data_down(wire23_1_4),

.i_wr_valid_left(data_valid[210]),
.i_wr_valid_right(data_valid[160]),
.i_wr_valid_up(),
.i_wr_valid_down(data_valid[151]),

.i_reset(i_reset), // Assigning a single reset signal for the entire circuit, to be kept high for sometime for circuit initialization
.o_data_left(wireh7_2), //dataOut_left
.o_data_right(wire37_1_4),
.o_data_up(),
.o_data_down(wire23_2_4),

.i_rd_fifoReady_left(ready[210]), // given by an external module
.i_rd_fifoReady_right(ready[160]),
.i_rd_fifoReady_up(1'b0),
.i_rd_fifoReady_down(ready[151]),

.o_rd_valid_left(data_valid[211]), //data_valid_left
.o_rd_valid_right(data_valid[159]),
.o_rd_valid_up(),
.o_rd_valid_down(data_valid[195]),


.o_wr_fifoReady_left(ready[211]),
.o_wr_fifoReady_right(ready[159]),
.o_wr_fifoReady_up(),
.o_wr_fifoReady_down(ready[195])


);

switch #(.packet_size(16),.x(3'd5),.y(3'd6), .xno_switch(xno),.yno_switch(yno), .RTfile("rt46.h"), .numWeight(4)) switch46(
.clk(clk),
.i_data_left(wire26_1_4),//dataIn_left
.i_data_right(wire6A_2_4), //dataIn_right
.i_data_up(wire67_2_4),
.i_data_down(wire56_1_4),

.i_wr_valid_left(data_valid[157]),
.i_wr_valid_right(data_valid[172]),
.i_wr_valid_up(data_valid[166]),
.i_wr_valid_down(data_valid[163]),

.i_reset(i_reset), // Assigning a single reset signal for the entire circuit, to be kept high for sometime for circuit initialization
.o_data_left(wire26_2_4), //dataOut_left
.o_data_right(wire6A_1_4),
.o_data_up(wire67_1_4),
.o_data_down(wire56_2_4),

.i_rd_fifoReady_left(ready[157]),
.i_rd_fifoReady_right(ready[172]),
.i_rd_fifoReady_up(ready[166]),
.i_rd_fifoReady_down(ready[163]),

.o_rd_valid_left(data_valid[109]),
.o_rd_valid_right(data_valid[171]),
.o_rd_valid_up(data_valid[165]),
.o_rd_valid_down(data_valid[164]),


.o_wr_fifoReady_left(ready[158]),
.o_wr_fifoReady_right(ready[171]),
.o_wr_fifoReady_up(ready[165]),
.o_wr_fifoReady_down(ready[164])


);

switch #(.packet_size(16),.x(3'd5),.y(3'd7), .xno_switch(xno),.yno_switch(yno), .RTfile("rt47.h"), .numWeight(4)) switch47(
.clk(clk),
.i_data_left(wire37_1_4),//dataIn_left
.i_data_right(wire7B_2_4), //dataIn_right
.i_data_up(),
.i_data_down(wire67_1_4),

.i_wr_valid_left(data_valid[159]),
.i_wr_valid_right(data_valid[174]),
.i_wr_valid_up(),
.i_wr_valid_down(data_valid[165]),

.i_reset(i_reset), // Assigning a single reset signal for the entire circuit, to be kept high for sometime for circuit initialization
.o_data_left(wire37_2_4), //dataOut_left
.o_data_right(wire7B_1_4),
.o_data_up(),
.o_data_down(wire67_2_4), // 

.i_rd_fifoReady_left(ready[159]),
.i_rd_fifoReady_right(ready[174]),
.i_rd_fifoReady_up(),
.i_rd_fifoReady_down(ready[165]),

.o_rd_valid_left(data_valid[160]),
.o_rd_valid_right(data_valid[173]),
.o_rd_valid_up(),
.o_rd_valid_down(data_valid[166]),


.o_wr_fifoReady_left(ready[160]),
.o_wr_fifoReady_right(ready[173]),
.o_wr_fifoReady_up(),
.o_wr_fifoReady_down(ready[166])


);

switch #(.packet_size(16),.x(3'd6),.y(3'd6), .xno_switch(xno),.yno_switch(yno), .RTfile("rt54.h"), .numWeight(10)) switch54(
.clk(clk),
.i_data_left(wire6A_1_4),//dataIn_left
.i_data_right(wireAE_2_4), //dataIn_right
.i_data_up(wireAB_2_4),
.i_data_down(wire9A_1_4),

.i_wr_valid_left(data_valid[171]),
.i_wr_valid_right(data_valid[186]),
.i_wr_valid_up(data_valid[180]),
.i_wr_valid_down(data_valid[177]),

.i_reset(i_reset), // Assigning a single reset signal for the entire circuit, to be kept high for sometime for circuit initialization
.o_data_left(wire6A_2_4), //dataOut_left
.o_data_right(wireAE_1_4),
.o_data_up(wireAB_1_4),
.o_data_down(wire9A_2_4),

.i_rd_fifoReady_left(ready[171]),
.i_rd_fifoReady_right(ready[186]),
.i_rd_fifoReady_up(ready[180]),
.i_rd_fifoReady_down(ready[177]),

.o_rd_valid_left(data_valid[172]),
.o_rd_valid_right(data_valid[185]),
.o_rd_valid_up(data_valid[179]),
.o_rd_valid_down(data_valid[178]),


.o_wr_fifoReady_left(ready[172]),
.o_wr_fifoReady_right(ready[185]),
.o_wr_fifoReady_up(ready[179]),
.o_wr_fifoReady_down(ready[178])


);

switch #(.packet_size(16),.x(3'd6),.y(3'd7), .xno_switch(xno),.yno_switch(yno), .RTfile("rt55.h"), .numWeight(10)) switch55(
.clk(clk),
.i_data_left(wire7B_1_4),//dataIn_left
.i_data_right(wireBF_2_4), //dataIn_right
.i_data_up(),
.i_data_down(wireAB_1_4),

.i_wr_valid_left(data_valid[173]),
.i_wr_valid_right(data_valid[188]),
.i_wr_valid_up(),
.i_wr_valid_down(data_valid[179]),

.i_reset(i_reset), // Assigning a single reset signal for the entire circuit, to be kept high for sometime for circuit initialization
.o_data_left(wire7B_2_4), //dataOut_left
.o_data_right(wireBF_1_4),
.o_data_up(),
.o_data_down(wireAB_2_4),

.i_rd_fifoReady_left(ready[173]),
.i_rd_fifoReady_right(ready[188]),
.i_rd_fifoReady_up(),
.i_rd_fifoReady_down(ready[179]),

.o_rd_valid_left(data_valid[174]),
.o_rd_valid_right(data_valid[187]),
.o_rd_valid_up(),
.o_rd_valid_down(data_valid[180]),


.o_wr_fifoReady_left(ready[174]),
.o_wr_fifoReady_right(ready[187]),
.o_wr_fifoReady_up(),
.o_wr_fifoReady_down(ready[180])


);

switch_type_2 #(.packet_size(16),.x(3'd7),.y(3'd6), .xno_switch(xno),.yno_switch(yno)) switch62(
.clk(clk),
.i_data_left(wireAE_1_4),//dataIn_left
.i_data_right(), //dataIn_right
.i_data_up(wireEF_2_4),
.i_data_down(wireDE_1_4),

.i_wr_valid_left(data_valid[185]),
.i_wr_valid_right(),
.i_wr_valid_up(data_valid[194]),
.i_wr_valid_down(data_valid[191]),

.i_reset(i_reset), // Assigning a single reset signal for the entire circuit, to be kept high for sometime for circuit initialization
.o_data_left(wireAE_2_4), //dataOut_left
.o_data_right(o_DATA),
.o_data_up(wireEF_1_4),
.o_data_down(wireDE_2_4),

.i_rd_fifoReady_left(ready[185]),
.i_rd_fifoReady_right(i_rd_en),
.i_rd_fifoReady_up(ready[194]),
.i_rd_fifoReady_down(ready[191]),

.o_rd_valid_left(data_valid[186]),
.o_rd_valid_right(), //data_valid_right
.o_rd_valid_up(data_valid[193]),
.o_rd_valid_down(data_valid[192]),


.o_wr_fifoReady_left(ready[186]),
.o_wr_fifoReady_right(),
.o_wr_fifoReady_up(ready[193]),
.o_wr_fifoReady_down(ready[192])

);

switch #(.packet_size(16),.x(3'd7),.y(3'd7), .xno_switch(xno),.yno_switch(yno), .RTfile("rt63.h"), .numWeight(10)) switch63(
.clk(clk),
.i_data_left(wireBF_1_4),//dataIn_left
.i_data_right(), //dataIn_right
.i_data_up(),
.i_data_down(wireEF_1_4),

.i_wr_valid_left(data_valid[187]),
.i_wr_valid_right(),
.i_wr_valid_up(),
.i_wr_valid_down(data_valid[193]),

.i_reset(i_reset), // Assigning a single reset signal for the entire circuit, to be kept high for sometime for circuit initialization
.o_data_left(wireBF_2_4), //dataOut_left
.o_data_right(),
.o_data_up(),
.o_data_down(wireEF_2_4),

.i_rd_fifoReady_left(ready[187]),
.i_rd_fifoReady_right(),
.i_rd_fifoReady_up(),
.i_rd_fifoReady_down(ready[193]),

.o_rd_valid_left(data_valid[188]),
.o_rd_valid_right(), //data_valid_right
.o_rd_valid_up(),
.o_rd_valid_down(data_valid[194]),


.o_wr_fifoReady_left(ready[188]),
.o_wr_fifoReady_right(),
.o_wr_fifoReady_up(),
.o_wr_fifoReady_down(ready[194])


);

endmodule