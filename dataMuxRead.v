module dataMuxRead(dataOut, sel00, selAA, sel55, SCL);

output reg [7:0] dataOut;
input wire sel00, selAA, sel55, SCL;

initial begin
	sel00 = 0;
	selAA = 0;
	sel55 = 0;
end

always@(sel00 or selAA or sel55)
begin
	if(sel00)
	begin
		dataOut <= 'h00;
	end
	else if(selAA)
	begin
		dataOut <= 'hAA;
	end
	else if(sel55)
	begin
		dataOut <= 'h55;
	end
end

endmodule
