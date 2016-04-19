module add_decoder(addrBank, addrBlock, addrRow, adAddrIn, enable);

output reg [3:0] addrBank, addrBlock;
output reg [7:0] addrRow;
input wire [15:0] adAddrIn;
input wire enable;

always@(enable or adAddrIn)
begin
	if(!enable)
	begin
		addrBank = adAddrIn[15:12];
		addrBlock = adAddrIn[11:8];
		addrRow = adAddrIn[7:0];
	end
end

endmodule

