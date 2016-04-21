module dataMuxWrite(dataOut, dataIn, selData, selAA, sel55, SCL);

output reg [7:0] dataOut;
input wire [7:0] dataIn;
input wire selData, selAA, sel55, selB0, selC0, selD0, selE0, SCL;

always@(negedge SCL)
begin
	if(selData)
	begin
		dataOut <= dataIn;
	end
	else if(selAA)
	begin
		dataOut <= 'hAA;
	end
	else if(sel55)
	begin
		dataOut <= 'h55;
	end
	else if(selB0)
	begin
		dataOut <= 'hB0;
	end
	else if(selC0)
	begin
		dataOut <= 'hC0;
	end
	else if(selD0)
	begin
		dataOut <= 'hD0;
	end
	else if(selE0)
	begin
		dataOut <= 'hE0;
	end
end

endmodule
