module addressRegister(addrOut, addrIn, enable);

output reg [15:0] addrOut;
input wire [15:0] addrIn;
input wire enable;

always@(enable)
begin
	if(!enable)
	begin
		addrOut = addrIn;
	end
end

endmodule
