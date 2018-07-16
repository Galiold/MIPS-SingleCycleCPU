module MUX32 (input select, input [31:0] in0, in1, output reg [31:0] out);
always @(*) begin 
	case (select)
		1'b0 : out = in0;
		1'b1 : out = in1;
	endcase
end
endmodule