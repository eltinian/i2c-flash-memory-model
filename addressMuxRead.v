module addressMux(addrOut, addrIn, selAddr, sel5555, selAAAA, SCL);

output reg[15:0] addrOut;
input wire [15:0] addrIn;
input wire seldAddr, sel5555, selAAAA, SCL;

always@(negedge SCL)
begin
	if(selAddr)
	begin
		addrOut <= addrIn;
	end
	else if(sel5555)
	begin
		addrOut <= 'h5555;
	end
	else if(selAAAA)
	begin
		addrOut <= 'hAAAA;
	end
end

endmodule
