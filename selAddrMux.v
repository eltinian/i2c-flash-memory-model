module selAddrMux(addrOut, initAddr, addrCountOut, selStartAddr);

output reg [15:0] addrOut;
input wire [15:0] initAddr, addrCountOut;
input wire selStartAddr;


