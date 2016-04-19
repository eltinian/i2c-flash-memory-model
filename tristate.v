module tristate (dataOut, dataIn, enable);

output reg [7:0] dataOut; 
input wire [7:0] dataIn; 
input wire enable; 

assign dataOut = (!enable) ? dataIn : 7`bzzzzzzz; 
//dataOut = dataIn if readEnable is low (active low) [READING], open circut if high [WRITING]
 
endmodule