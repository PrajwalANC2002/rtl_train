module shutdown # (
			parameter SIZE = 4    
			)
		( 
			input clk,
			input reset,

			input vdd,
			input vss,
			input vdd_low,
			input vdd_sh,
			
			input [SIZE-1:0] i1_shutdown,
			input [SIZE-1:0] a1_shutdown,			
			output reg [SIZE-1:0] y1_shutdown
			
);

reg [SIZE-1:0] i1_reg1;



genvar i;
generate 
	for (i=0; i< SIZE; i=i+1) begin : iloop
	
		wire [SIZE-1:0] reg1_andout;
		
		always @(posedge clk or negedge reset) begin
			if(!reset) begin
				i1_reg1[i] <= 1'b0;				 
			end else begin
				i1_reg1 <= i1_shutdown[i];					
			end
		end
		
		assign reg1_andout[i] = i1_reg1[i] && a1_shutdown[i];
		
		
		always @(posedge clk or negedge reset) begin
			if(!reset) begin
				y1_shutdown[i] <= 1'b0;				
			end else begin
				y1_shutdown[i] <= reg1_andout[i]; 				 	
			end
		end
		
	end
endgenerate



endmodule
