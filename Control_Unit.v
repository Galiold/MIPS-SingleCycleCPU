module ControlUnit (input [5:0] OpCode,func,output reg [3:0] aluOp,output reg memToReg,jump,branch,memRead,memWrite,aluSrc,regWrite,regDest);

always @(OpCode,func) begin
	 case (OpCode)

	  6'b000000:	//R-TYPE
	 	begin	
		regDest = 1;  
		memToReg = 0;  
		jump = 0;  
		branch = 0;  
		memRead = 0;  
		memWrite = 0;  
		aluSrc = 0;  
		regWrite = 1;
		case (func)
		  	6'b100000 : aluOp = 4'b0000; //ADD
		  	6'b100010 : aluOp = 4'b0001; //SUB
		  	6'b100100 : aluOp = 4'b0010; //AND
		  	6'b100101 : aluOp = 4'b0011; //OR
		  	6'b100110 : aluOp = 4'b0100; //XOR
		  	6'b101010 : aluOp = 4'b0101; //SLT
		  	default : aluOp = 4'b0001;
		endcase  
		end

		6'b000010:	//JUMP
		begin
			regDest = 0;  
			memToReg = 0;  
			aluOp = 4'b0110;  
			jump = 1;  
			branch = 0;  
			memRead = 0;  
			memWrite = 0;  
			aluSrc = 0;  
			regWrite = 0;  
		end

		6'b101011:	//SW
		begin
			regDest = 0;  
			memToReg = 0;  
			aluOp = 4'b0000;  
			jump = 0;  
			branch = 0;  
			memRead = 0;  
			memWrite = 1;  
			aluSrc = 1;  
			regWrite = 0; 
		end

		6'b100011:	//LW
		begin 
			regDest = 0;  
			memToReg = 1;  
			aluOp = 4'b0000;  
			jump = 0;  
			branch = 0;  
			memRead = 1;  
			memWrite = 0;  
			aluSrc = 1;  
			regWrite = 1;
		end

		 6'b001000:	//ADDI
		begin 
			regDest = 0;  
			memToReg = 0;  
			aluOp = 4'b0000;  
			jump = 0;  
			branch = 0;  
			memRead = 0;  
			memWrite = 0;  
			aluSrc = 1;  
			regWrite = 1;
		end

		6'b001010:	//SLTI
		begin 
			regDest = 0;  
			memToReg = 0;  
			aluOp = 4'b0101;  
			jump = 0;  
			branch =0;  
			memRead = 0;  
			memWrite = 0;  
			aluSrc = 1;  
			regWrite = 1;
		end

		6'b001100:	//ANDI
		begin
			regDest = 0;  
			memToReg = 0;  
			aluOp = 4'b0010;  
			jump = 0;  
			branch = 0;  
			memRead = 0;  
			memWrite = 0;  
			aluSrc = 1;  
			regWrite = 1;
		end

	  6'b001101:	//ORI
		begin 
			regDest = 1'b0;  
			memToReg = 1'b0;  
			aluOp = 4'b0011;  
			jump = 1'b0;  
			branch = 1'b0;  
			memRead = 1'b0;  
			memWrite = 1'b0;  
			aluSrc = 1'b1;  
			regWrite = 1'b1;
		end

		6'b000100:	//BEQ
		begin 
			regDest = 1'b0;  
			memToReg = 1'b0;  
			aluOp = 4'b0001;  
			jump = 1'b0;  
			branch = 1'b1;  
			memRead = 1'b0;  
			memWrite = 1'b0;  
			aluSrc = 1'b0;  
			regWrite = 1'b0;  
		end

		6'b000101:	//BNE
		begin
			regDest = 1'b0;  
			memToReg = 1'b0;  
			aluOp = 4'b0001;  
			jump = 1'b0;  
			branch = 1'b1;  
			memRead = 1'b0;  
			memWrite = 1'b0;  
			aluSrc = 1'b0;  
			regWrite = 1'b0;   
		end
		default:
		begin
		regDest = 1;  
		memToReg = 1;  
		jump = 1;  
		branch = 1;  
		memRead = 1;  
		memWrite = 1;  
		aluSrc = 1;  
		regWrite = 1;
		aluOp= 4'b0000;
		end
	 endcase
end // always @(OpCode, func)

endmodule