module controller (readEnable, writeEnable, EN, reset, data, address) 

//CONTROL SIGNALS SENT WITHIN THE FLASH MEMORY
output reg readEnable; 
output reg writeEnable; 

//INPUTS SUPPLIED FROM TEST MODULE
input wire EN; 
input wire reset; 
input wire data;
input wire address; 

reg [4:0] count;

reg read;

initial 
begin
	count = 0; //start
	read = 0; 
end

always @ ( posedge EN | reset )
begin
	count = count + 1; //increment state

	//if active low reset then reset the count 
	if(!reset) 
	begin
		count = 0; 
	end

	//count = 1 = s0: Address = 0x5555; Data = 0xAA 
	if(count == 1)
	begin
		readEnable <= 1;
		writeEnable <= EN; 
		if(address != 'h0x5555 or data != 'h0xAA)
		begin
			count = 0; 
		end
	end

	//count = 2 = s1: Addr = 0xAAAA; Data = 0x55 
	else if (count == 2)
	begin
		readEnable <= 1;
		writeEnable <= EN;
		if(address != 'h0xAAAA or data != 'h0x55)
		begin
			count = 0; 
		end
	end

	//count = 3 = s2: Addr = 0x5555; Data = 0x20 => set read = 0 for write; Data = 0x00 => set read = 1 for read 
	else if (count == 3)
	begin 
		if(addresss == 'h0x5555) 
		begin
			if(data == 'h0x00) //IF READ
			begin
				readEnable <= 1; 
				writeEnable <= EN;
				read <= 1;  //SET FOR NEXT CYCLE 
			end
			else if(data == 'h0x20) //WRITE
			begin
				readEnable <= 1;
				writeEnable <= EN;
				read <= 0; //SET FOR NEXT CYCLE 
			end
			else begin //ELSE INVALID COMMAND
				readEnable <= 1;
				writeEnable <= EN; 
				count = 0; 
			end
		end
		else begin //ELSE INVALID ADDRESS 
			readEnable <= 1;
			writeEnable <= EN;
			count = 0; 
		end
	end 

	else if (count == 4)
	begin
		if(read) //read = 1 
		begin
			readEnable <= 0;
			writeEnable <= 1; 
		end
		else begin //read = 0
			readEnable <= 1; 
			writeEnable <= 0;  
		end
		count = 0; 
	end
end

endmodule 