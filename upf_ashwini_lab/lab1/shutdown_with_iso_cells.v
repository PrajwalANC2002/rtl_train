module  shutdown_with_iso_cells # (
			parameter SIZE = 4
			)
		(
			input clk,
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
			input [SIZE-1:0] a1_shutdown,
			output [SIZE-1:0] sh_iso_out

);

wire [SIZE-1:0] y1_shutdown;
wire iso1_out, iso2_out, iso3_out, iso4_out;

assign sh_iso_out = {iso4_out, iso3_out, iso2_out, iso1_out};

shutdown i_shutdown (
					.clk(clk),
					.reset(reset),
					.i1_shutdown(i1_shutdown),
					.a1_shutdown(a1_shutdown),	
					.y1_shutdown(y1_shutdown)
					);


ISOLO a1 (.I(y1_shutdown[0]), .ISO(iso1), .Z(iso1_out), .VDDAON(vdd),
      .VSS(vss));

ISOLO a2 (.I(y1_shutdown[1]), .ISO(iso1), .Z(iso2_out), .VDDAON(vdd),
     .VSS(vss));

ISOLO a3 (.I(y1_shutdown[2]), .ISO(iso1), .Z(iso3_out), .VDDAON(vdd),
   .VSS(vss));
	  
ISOLO a4 (.I(y1_shutdown[3]), .ISO(iso1), .Z(iso4_out), .VDDAON(vdd),
    .VSS(vss));	




endmodule
