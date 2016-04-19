module add_decoder(addrBank, addrBlock, addrRow, addrIn, enable);

output reg [3:0] addrBank, addrBlock;
output reg [7:0] addrRow;
input wire [15:0] addrIn;
input wire enable;

always@(enable or addrIn)
begin
	if(!enable)
	begin
		addrBank = addrIn[15:12];
		addrBlock = addrIn[11:8];
		addrRow = addrIn[7:0];
	end
end

endmodule

