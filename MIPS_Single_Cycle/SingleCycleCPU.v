module SingleCycleCPU ();
reg clk;
reg [7:0] PC;
wire [7:0] PC1, NPC, JumpTarget, BranchTarget;
wire [4:0] WriteReg; //choosing between Instruction[20:16] and Instruction[15:11]
wire [31:0] SEImmediate;	//sign extended immediate
wire [31:0] ALUIn2;	//second input of ALU
wire [31:0] DMOut;	//output of Data Memory
wire [31:0] WriteData; //writeback data
wire [7:0] TempPC;

wire [31:0] Instruction, ReadData1, ReadData2, ALUResult;
wire [3:0] ALUOp;
wire RegDest, Jump, Branch, MemRead, MemtoReg, MemWrite, ALUSrc, RegWrite, Zero, Lt, Gt;
wire BranchTaken;

initial begin
		PC = 1;
		clk = 0;
	end				
	always begin
		#100;
		clk = ~clk;
		
	end	


//initial begin
//	PC = 8'b00000000;
//end

always @(posedge clk) begin 
	PC = NPC;
end

//assign PC1 = PC + 1;

//assign BranchTarget = PC1 + SEImmediate[7:0];




IMemBank IM(1,PC, Instruction);
ControlUnit CU(Instruction[31:26], Instruction[5:0], ALUOp, MemtoReg, Jump, Branch, MemRead, MemWrite, ALUSrc, RegWrite, RegDest);
assign BranchTaken = Branch & Zero;
MUX8 m0(BranchTaken, PC1, BranchTarget, TempPC);
MUX8 m1(Jump, TempPC, JumpTarget, NPC);
MUX5 m2(RegDest, Instruction[20:16], Instruction[15:11], WriteReg);
RegFile RF(clk,Instruction[25:21], Instruction[20:16], WriteReg, WriteData, RegWrite, ReadData1, ReadData2);
Adder u2(PC, 8'b00000001, PC1);   
Adder u3(PC1,SEImmediate[7:0],BranchTarget);
assign JumpTarget = Instruction[7:0];
assign SEImmediate = {{16{Instruction[15]}}, Instruction[15:0]};
MUX32 m3(ALUSrc, ReadData2, SEImmediate, ALUIn2);
ALU alu(ReadData1, ALUIn2, ALUOp, ALUResult, Zero, Lt, Gt);
DMemBank DM(MemRead, MemWrite, ALUResult[6:0], ReadData2, DMOut);
MUX32 m4(MemtoReg, ALUResult, DMOut, WriteData);


endmodule

module tb1; 
	reg clk;
	initial begin
		clk = 0;
	end
	
	always begin
		clk = ~clk;
		#100;
	end	   
	SingleCycleCPU u(clk);
endmodule




module Adder(input [7:0] data1, data2, output reg [7:0] result);

  always@(data1, data2) begin
    result = data1 + data2;
  end
endmodule