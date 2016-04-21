module detector(start, stop, SCL, SDA);

output reg start, stop;
input wire SCL, SDA;

initial begin
	start = 0;
	stop = 0;
end

always@(posedge SDA or negedge SDA)
begin
	if(posedge SDA)
	begin
		stop = 1;
	end
	else if(negedge SDA)
	begin
		start = 1;
	end
end

endmodule