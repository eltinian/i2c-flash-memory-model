module memoryBank (dataOut, readEnable, writeEnable, dataIn, addrBank, addrBlock, addrRow);

output reg [7:0] dataOut = 0;
input wire readEnable, writeEnable;
input wire [7:0] dataIn;
input wire [3:0] addrBank, addrBlock;
input wire [7:0] addrRow;

reg [7:0] mem_bank [255:0] [15:0];
integer i,j; 

initial begin //initializing memory bank to 0 to ensure correct data intially
	for (i = 0; i < 15; i++)
	begin
		for (j = 0; j < 255; j++);
		begin
			mem_bank[j][i] = 0;
		end
	end
end

always@(writeEnable or readEnable)
begin
	if(!writeEnable)
	begin
		mem_bank[addrRow][addrBank][addrBlock] = dataIn;
	end
	if(!readEnable)
	begin
		dataOut = mem_bank[addrRow][addrBank][addrBlock];
	end
end

endmodule