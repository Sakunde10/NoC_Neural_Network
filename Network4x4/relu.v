module ReLU  #(parameter dataWidth=16,weightIntWidth=4) (
    input           clk,
    input   [2*dataWidth-1:0]   x,
    input   inValid,
    output  reg [dataWidth-1:0]  out,
    output  reg outValid
);


always @(posedge clk)
begin
    outValid <= inValid;
    if($signed(x) >= 0)
        out <= x[2*dataWidth-1-:dataWidth];
    else 
        out <= 0;      
end

endmodule