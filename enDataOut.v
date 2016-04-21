module enDataOut(dataOut, dataIn, enDataOut);

output reg [7:0] dataOut;
input wire [7:0] dataIn;
input wire enDataOut; 

always@(enDataOut)
begin
	if(enDataOut)
	begin
		dataOut <= dataIn;
	end
end

endmodule