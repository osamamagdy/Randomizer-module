
module Randomizer (en , clk , reset, load_signal , load , in , out);
input en ;
input clk;
input reset;
input in ;
input load_signal;
input load;
output wire out;

reg [14:0] data ;
wire [14:0] data_next ;
wire temp ;


always @ (posedge clk , posedge reset )
	begin 
		if (reset && en) begin
			data <= 15'b101010001110110;
		end
		else if (!reset && en && !load_signal ) begin
			data <= data_next;
		end
		else if (!reset && en && load_signal ) begin
			data <= load;
		end
		
		else 
			begin
			data<=data;
			end
	end
 
xor T (temp,data[14],data[13]);
xor Q (out,in,temp);
assign data_next = {data[13:0] , temp};

   
endmodule

