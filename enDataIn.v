module enDataIn(dataOut, dataIn, enDataIn);

output reg [7:0] dataOut;
input wire [7:0] dataIn;
input wire enDataIn; 

always@(enDataIn)
begin
	if(enDataIn)
	begin
		dataOut <= dataIn;
	end
end

endmodule