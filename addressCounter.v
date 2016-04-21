module addressCounter(addrOut, addrIn, loadAddrLSB, loadAddrMSB, incrAddr, SCL);

output reg [15:0] addrOut;
input wire [15:0] addrIn;
input wire loadAddrMSB, loadAddrLSB, incrAddr, SCL;

always@(negedge SCL)
begin
	if(incrAddr)
	begin
		addrIn = addrIn + 1;
	end
	else if(loadAddrLSB)
	begin
		
	end
end
