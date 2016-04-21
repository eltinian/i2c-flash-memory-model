module adder(adderOut, addrCountOut);

output reg [7:0] adderOut;
input wire [7:0] addrCountOut;

assign adderOut = addrCountOut + 1;

endmodule