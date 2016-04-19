module memoryBank (data, readEnable, writeEnable, addrBank, addrBlock, addrRow);

inout [7:0] data;
input wire readEnable, writeEnable;
input wire [7:0] dataIn;
input wire [3:0] addrBank, addrBlock;
input wire [7:0] addrRow;

reg [7:0] memBank [255:0] [15:0];
integer i,j; 

initial begin //initializing memory bank to 0 to ensure correct data intially
	for (i = 0; i < 15; i++)
	begin
		for (j = 0; j < 255; j++);
		begin
			memBank[j][i] = 0;
		end
	end
end


always@(writeEnable or readEnable)
begin
	if(!writeEnable)
	begin
		memBank[addrRow][addrBank][addrBlock] = data;
	end
end

assign data = (!readEnable) ? memBank[addrRow][addrBank][addrBlock] : 7'bzzzzzzz;

endmodule
