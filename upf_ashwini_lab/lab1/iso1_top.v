 module iso1_top  # (
			parameter SIZE = 4
			)

(
			input clock,
			input reset,
			
			input vdd,
			input vss,
			input vdd_low,
			input vdd_sh,
			
			input iso1,
			input iso2,
			input iso3,
			input iso4,
			
			input [SIZE-1:0] i1_shutdown,
			
			input [SIZE-1:0] a1,			
			output [SIZE-1:0] y1 
 );
 


wire [SIZE-1:0] y1_shutdown;

low1  i_low1(
			 .clk(clock),
			 .reset(reset),
			 .vdd(vdd),
			 .vss(vss),
			 .vdd_low(vdd_low),
			 .i1(y1_shutdown ),
			 .a1(a1),
			 .y1( y1)
			);


shutdown_with_iso_cells  i_shutdown_with_iso_cells (
					 .clk(clk),
                     .reset(reset),
                     .vdd(vdd),
                     .vss(vss),
		     .vdd_low(vdd_low),
                     .vdd_sh(vdd_sh),
                     .iso1(iso1),
                     .iso2(iso2),
                     .iso3(iso3),
                     .iso4(iso4),
                     .i1_shutdown(i1_shutdown),
                     .sh_iso_out(y1)
					 
					);


endmodule					
