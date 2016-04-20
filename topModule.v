module topModule(tpDataIO, tpEnable, tpAddressIn, tpReset);

input wire [7:0] tpDataIO;
input wire tpEnable, tpReset;
input wire [15:0] tpAddressIn;

wire [15:0] tpAddressOut;
wire [3:0] tpAddressBank, tpAddressBlock;
wire [7:0] tpAddressRow, tpdataBuffTri, tpDataMemTri;
wire tpWriteEnable, tpReadEnable;

	controller ctrl(.readEnable(tpReadEnable),
					.writeEnable(tpWriteEnable),
					.EN(tpEnable),
					.reset(tpReset),
					.data(tpDataIO),
					.address(tpAddressIn))

	addressRegister addressReg(.addrOut(tpAddressOut),
							   .addrIn(tpAddressIn),
							   .enable(tpEnable));

	add_decoder addressDec(.addrBank(tpAddressBank),
						   .addrBlock(tpAddressBlock),
						   .addrRow(tpAddressRow),
						   .addrIn(tpAddressOut),
						   .enable(tpEnable));

	dataBuffer dataBuff(.dataIO(tpDataIO),
						.dataMemory(tpdataBuffTri),
						.readEnable(tpReadEnable),
						.writeEnable(tpWriteEnable));

	tristate triStateBuffWrite(.dataOut(tpDataMemTri),
						  	   .dataIn(tpdataBuffTri),
						  	   .enable(tpWriteEnable));

	tristate triStateBuffRead(.dataOut(tpdataBuffTri),
						  	   .dataIn(tpDataMemTri),
						  	   .enable(tpReadEnable));

	memoryBank memBank(.data(tpDataMemTri),
					   .readEnable(tpReadEnable),
					   .writeEnable(tpWriteEnable),
					   .addrBank(tpAddressBank),
					   .addrBlock(tpAddressBlock),
					   .addrRow(tpAddressRow));

endmodule
