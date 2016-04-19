module dataBuffer (dataControl, dataIO, dataMemory, readEnable, writeEnable); 

output reg [7:0] dataControl; 

inout [7:0] dataIO; 
inout [7:0] dataMemory; 

input wire readEnable;
input wire writeEnable; 

//if writing, data is fed from IO device 
//if reading, dataIO should equal data from memory
//READS WHEN readEnable IS LOW, WRITES WHEN readEnable IS HIGH
assign dataIO = (!readEnable) ? dataMemory : 7'bzzzzzzz;

//if writing, dataMemory should equal data from IO
//if reading, leave as z for read ---> will be assigned by memory 
//READS WHEN readEnable IS LOW, WRITES WHEN readEnable IS HIGH
assign dataMemory = (readEnable) ? dataIO : 7'bzzzzzzz; 



//send IO data to control to determine what kind of command
always @ (posedge writeEnable)
begin
	if(writeEnable)
	begin
		dataControl <= dataIO; 
	end
end
endmodule