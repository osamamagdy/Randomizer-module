module Randomizer_tb ();

reg en,clk,reset,in;
wire out ;
reg [0:95] in_data = 96'hACBCD2114DAE1577C6DBF4C9;
reg [0:95] out_data = 96'h000000000000000000000000;
reg load_signal;
reg load;
localparam PERIOD = 10 ;

//Unit Under Test
Randomizer UUT (.en(en),.clk(clk),.reset(reset),.load_signal(load_signal),.load(load),.in(in),.out(out));
integer i ;

initial begin
$monitor ("At time =%g ,counter = %d , reset=%b , in_data=%h,in = %b ,out_data=%h, out=%b",$time ,i ,reset , in_data, in , out_data,out);

clk = 0 ;
en=1;
load_signal = 0 ;
reset = 1 ;
#(PERIOD) reset = 0 ;
in=in_data[0];
#PERIOD;
out_data[0] = out;
for (i=1 ; i<96 ; i=i+1)
begin
clk = 1;
in=in_data[i];
#PERIOD ;
out_data[i] = out ;
clk=0;
#PERIOD;
end
$finish;

end



endmodule



//////////////////////////

//////////////////////////////






//////////////////////First try////////////////////////


/*////////////////Please ignore this/////////////////
#0 test_case = 4'sHA; reset = 1; 
#50 test_case = 4'sHC; reset = 0 ;
#150  test_case = 4'sHB; reset = 0 ;
#200  test_case = 4'sHC;reset = 0 ;
#250  test_case = 4'sHD;reset = 0 ;
#300  test_case = 4'sH2;reset = 0 ;
#350  test_case = 4'sH1;reset = 0 ;
#400  test_case = 4'sH1;reset = 0 ;
#450  test_case = 4'sH4;reset = 0 ;
#500  test_case = 4'sHD;reset = 0 ;
#550  test_case = 4'sHA;reset = 0 ;
#600  test_case = 4'sHE;reset = 0 ;
#650  test_case = 4'sH1;reset = 0 ;
#700  test_case = 4'sH5;reset = 0 ;
#750  test_case = 4'sH7;reset = 0 ;
#800  test_case = 4'sH7;reset = 0 ;
#850  test_case = 4'sHC;reset = 0 ;
#900  test_case = 4'sH6;reset = 0 ;
#950  test_case = 4'sHD;reset = 0 ;
#1000 test_case = 4'sHB;reset = 0 ;
#1050 test_case = 4'sHF;reset = 0 ;
#1100 test_case = 4'sH4;reset = 0 ;
#1150 test_case = 4'sHC;reset = 0 ;
#1200 test_case = 4'sH9;reset = 0 ;*/


////////////////////////Second try//////////////////////////////

//reg [0:3] test_mem [0:23];//={4'sHA, 4'sHC, 4'sHB,4'sHC,4'sHD,4'sH2,4'sH1,4'sH1,4'sH4,4'sHD,4'sHA,4'sHE,4'sH1,4'sH5,4'sH7,4'sH7,4'sHC,4'sH6,4'sHD,4'sHB,4'sHF,4'sH4,4'sHC , 4'sH9};
/// Assigning data must be in an initial block or always block


/////////////////////////Third try////////////////////////
/*test_mem [0] = 4'sHA;
test_mem [1] = 4'sHC;
test_mem [2] = 4'sHB;
test_mem [3] = 4'sHC; 
test_mem [4] = 4'sHD;
test_mem [5] = 4'sH2;
test_mem [6] = 4'sH1; 
test_mem [7] = 4'sH1;
test_mem [8] = 4'sH4;
test_mem [9] = 4'sHD;
test_mem [10] = 4'sHA;
test_mem [11] = 4'sHE;
test_mem [12] = 4'sH1;
test_mem [13] = 4'sH5;
test_mem [14] = 4'sH7;
test_mem [15] = 4'sH7; 
test_mem [16] = 4'sHC;
test_mem [17] = 4'sH6;
test_mem [18] = 4'sHD;
test_mem [19] = 4'sHB;
test_mem [20] = 4'sHF;
test_mem [21] = 4'sH4;
test_mem [22] = 4'sHC;
test_mem [23] = 4'sH9;
*/

///////////////////////Fourth try/////////////////////

//reg [95:0] test_mem = 96'hACBCD2114DAE1577C6DBF4C9;


//////////////////////////////////////////////////////

///////Please ignore this ///////////////////////
/*
module fun (en,clk,reset,load,out);

input en;
input clk;
input reset;
input [0:3] load;
output [0:3] out ;

generate 
genvar j;
	for (j=0;j<4;j=j+1)begin 
		Randomizer x1 (en,clk,reset,load[j],out[j]);
	end
endgenerate


endmodule 
*/





////////////////Heroic try for test Bench //////////////////

/*module Randomizer_tb ();
reg [0:3] Temp = 4'b0000 ;
reg [0:3] test_case = 4'b0000 ;
reg reset ;
reg clk ;
reg [0:3] test_mem [0:23];


reg q;
wire d;

Randomizer x1 (1,clk,reset,q,d);

integer i ;
integer j ;
/// They are like declaring the reg and wire that can't be done in initial or always

initial begin 

test_mem [0] = 4'sHA;
test_mem [1] = 4'sHC;
test_mem [2] = 4'sHB;
test_mem [3] = 4'sHC; 
test_mem [4] = 4'sHD;
test_mem [5] = 4'sH2;
test_mem [6] = 4'sH1; 
test_mem [7] = 4'sH1;
test_mem [8] = 4'sH4;
test_mem [9] = 4'sHD;
test_mem [10] = 4'sHA;
test_mem [11] = 4'sHE;
test_mem [12] = 4'sH1;
test_mem [13] = 4'sH5;
test_mem [14] = 4'sH7;
test_mem [15] = 4'sH7; 
test_mem [16] = 4'sHC;
test_mem [17] = 4'sH6;
test_mem [18] = 4'sHD;
test_mem [19] = 4'sHB;
test_mem [20] = 4'sHF;
test_mem [21] = 4'sH4;
test_mem [22] = 4'sHC;
test_mem [23] = 4'sH9;

$monitor  ("At test case =%H represented by :%b , the output is=%H represented by :%b",test_case,test_case,Temp ,Temp);
	for (i=0;i<24;i=i+1)
	begin 
		#5 clk = 0 ;
		test_case = test_mem[i]; 
		for (j=0 ; j<4;j=j+1)
		begin
			#5 clk = 1;
			q=test_case[j];
			Temp[j] = d ;
			#5 clk = 0;
		end
	end
$finish;
end

endmodule
*/