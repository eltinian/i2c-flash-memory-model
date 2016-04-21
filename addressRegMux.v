module addrRegMux(initAddr, incrAddr, selStartAddr, addrCountOut, shiftRegOut, adderAddr);

output reg [15:0] initAddr;
input wire [15:0] addrCountOut, adderAddr, shiftRegOut;
input wire selStartAddr, incrAddr;

initial begin
	incrAddr = 0;
	selStartAddr = 0; 
end

always@(incrAddr or selStartAddr)
begin
	if(incrAddr)
	begin
		initAddr <= adderAddr;
	end
	else if(selStartAddr)
	begin
		initAddr <= shiftRegOut;
	end
end

endmodule