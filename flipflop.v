module flipflop(addrOut, addrIn, SCL);

output reg [15:0] addrOut;
input wire [15:0] addrIn;
input wire SCL; 

always@(negedge SCL)
begin
	addrOut = addrIn; 
end

endmodule