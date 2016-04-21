module shiftRegister(SDAOut, shiftRegOut, SDAIn, shiftRegIn, shiftIn, shiftOut, loadShift, SCL);

output reg SDAOut; 
output reg [7:0] shiftRegOut;
input wire [7:0] shiftRegIn; 
input wire SDAIn, shiftIn, shiftOut, loadShift;

reg [7:0] register;
reg [2:0] count;

initial begin
	shiftIn = 0;
	shiftOut = 0;
	loadShift = 0;
	count = 0;
end

always@(negedge SCL)
begin
	if(shiftIn)
	begin
		if(SDAIn)
		begin
			register[count] = 1;
		end
		else if(!SDAIn)
		begin
			register[count] = 0;
		count = count + 1;
		end
	end
	else if(loadShift)
	begin
		register = shiftRegIn;
	end
	else if(shiftOut)
	begin
		
	end
	
end

assign shiftRegOut <= register;

endmodule