`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 13.11.2018 17:11:05
// Design Name: 
// Module Name: perceptron
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
//`define DEBUG
`include "include.v"

module neuron #(parameter layerNo=0,neuronNo=0,numWeight=10,dataWidth=16,sigmoidSize=10,weightIntWidth=1,actType="sigmoid",biasFile="neuron1Bias.mif",weightFile="neuron1Wgts.mif")(
    input           clk,
    input           rst,
    input [dataWidth-1:0]    myinput,
    input           myinputValid,
    input           weightValid,
    input           biasValid,
    input [31:0]    weightValue,
    input [31:0]    biasValue,
    input [31:0]    config_layer_num,
    input [31:0]    config_neuron_num,
    output[dataWidth-1:0]    out,
    output          outvalid   
    );
    
    parameter addressWidth = $clog2(numWeight);
    
    reg         wen;
    wire        ren;
    reg [addressWidth-1:0] w_addr=0;
    reg [addressWidth:0]   r_addr=0;//read address has to reach until numWeight hence width is 1 bit more
    reg [dataWidth-1:0]  w_in=0;
    wire [dataWidth-1:0] w_out;
    reg [2*dataWidth-1:0]  mul=0; 
    reg [2*dataWidth-1:0]  sum=0;
    reg [2*dataWidth-1:0]  bias=0;
    reg [31:0]    biasReg[0:0];
    reg         weight_valid;
    reg         mult_valid;
    reg         sigValid; 
    wire [2*dataWidth-1:0] comboAdd;
    wire [2*dataWidth-1:0] BiasAdd;
    reg  [dataWidth-1:0] myinputd;
    reg muxValid_d;
    reg muxValid_f;
    reg addr=0;
    reg [1:0] pCounter;
    reg sum_valid;
    reg of;
    reg uf;
    localparam IDLE     = 'd0,
               WAIT_END = 'd1,
               WAIT_OUT = 'd2; 
    reg [1:0] STATE = IDLE;
   //Loading weight values into the momory
    always @(posedge clk)
    begin
        if(rst)
        begin
            w_addr <= {addressWidth{1'b1}};
            wen <=0;
        end
        else if(weightValid & (config_layer_num==layerNo) & (config_neuron_num==neuronNo))
        begin
            w_in <= weightValue;
            w_addr <= w_addr + 1;
            wen <= 1;
        end
        else
            wen <= 0;
    end
	
    assign comboAdd = $signed(mul) + $signed(sum);
    //assign BiasAdd = $signed(mul) + $signed(sum);// + $signed(bias);
    assign ren = myinputValid;
    
    always @(*)
    begin
        if(~mul[2*dataWidth-1] & ~sum[2*dataWidth-1] & comboAdd[2*dataWidth-1]) //both r positive result -ve
        begin
            of = 1'b1; //overflow flag
        end
        else
            of = 1'b0;
    end
    
    always @(*)
    begin
        if(mul[2*dataWidth-1] & sum[2*dataWidth-1] & ~comboAdd[2*dataWidth-1]) //both r negative result +ve
        begin
            uf = 1'b1; //underflow flag
        end
        else
            uf = 1'b0;
    end
    
	`ifdef pretrained
		initial
		begin
			$readmemb(biasFile,biasReg);
		end
		always @(posedge clk)
		begin
            bias <= {biasReg[addr][dataWidth-1:0],{dataWidth{1'b0}}};
        end
	`else
		always @(posedge clk)
		begin
			if(biasValid & (config_layer_num==layerNo) & (config_neuron_num==neuronNo))
			begin
				bias <= {biasValue[dataWidth-1:0],{dataWidth{1'b0}}};
			end
		end
	`endif
    
    
    always @(posedge clk)
    begin
        if(rst)
            r_addr <= 0;
        else if(r_addr == numWeight-1 & myinputValid)
            r_addr <= 0;
        else if(myinputValid)
            r_addr <= r_addr + 1;
    end
    
    always @(posedge clk)
    begin
        if(weight_valid)
            mul  <= $signed(myinputd) * $signed(w_out);
    end
    
    
    always @(posedge clk)
    begin
        if(rst)
        begin
            sum <= 0;
            STATE <= IDLE;
            sum_valid <= 1'b0;
        end
        else
        begin
            case(STATE)
                IDLE:begin
                    sum_valid <= 1'b0;
                    if(mult_valid)
                    begin
                        sum <= mul;
                        STATE <= WAIT_END;        
                    end
                end
                WAIT_END:begin
                    if(mult_valid)
                    begin
                        if(of)
                            sum <= {1'b0,{2*dataWidth-1{1'b1}}};//positive saturation
                        else if(uf)
                            sum <= {1'b1,{2*dataWidth-1{1'b0}}};//negative saturation
                        else
                    sum <= comboAdd;
                    end
                    if(r_addr == numWeight-1 & myinputValid)
                    begin
                        pCounter <= 0;
                        STATE <= WAIT_OUT;
                    end
                end
                WAIT_OUT:begin
                    pCounter <= pCounter+1;
                    if(mult_valid & pCounter == 1)
                    begin
                        //sum <= BiasAdd;
                        sum_valid <= 1'b1;
                        STATE <= IDLE;
                    end
                    if(mult_valid)
                    begin
                        if(of)
                            sum <= {1'b0,{2*dataWidth-1{1'b1}}};//positive saturation
                        else if(uf)
                            sum <= {1'b1,{2*dataWidth-1{1'b0}}};//negative saturation
                        else
                            sum <= comboAdd;
                    end     
                end
            endcase
        end
    end
    
    always @(posedge clk)
    begin
        myinputd <= myinput;
        weight_valid <= myinputValid;
        mult_valid <= weight_valid;
    end
    
    
    //Instantiation of Memory for Weights
    Weight_Memory #(.numWeight(numWeight),.neuronNo(neuronNo),.layerNo(layerNo),.addressWidth(addressWidth),.dataWidth(dataWidth),.weightFile(weightFile)) WM(
        .clk(clk),
        .wen(wen),
        .ren(ren),
        .wadd(w_addr),
        .radd(r_addr),
        .win(w_in),
        .wout(w_out)
    );
    
	generate
		if(actType == "sigmoid")
		begin:siginst
		//Instantiation of ROM for sigmoid
			Sig_ROM #(.inWidth(sigmoidSize),.dataWidth(dataWidth)) s1(
			.clk(clk),
			.x(sum[2*dataWidth-1-:sigmoidSize]),
			.out(out)
		);
		end
		else
		begin:ReLUinst
			ReLU #(.dataWidth(dataWidth),.weightIntWidth(weightIntWidth)) s1 (
			.clk(clk),
			.x(sum),
			.inValid(sum_valid),
			.out(out),
			.outValid(outvalid)
		);
		end
	endgenerate

    `ifdef DEBUG
    always @(posedge clk)
    begin
        if(outvalid)
            $display(neuronNo,,,,"%b",out);
    end
    `endif
endmodule
