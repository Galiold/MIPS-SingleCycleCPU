//memory unit
module IMemBank(input memread,input [7:0] address, output reg [31:0] readdata);
 
  reg [31:0] mem_array [255:0];
  
  integer i;
  initial begin
     //mem_array[0] = 32'b10001100000000010000000000000001; //LW $1 1($0))
    
     //// $28 temp       $29 sum      $30 max      $31 min
     
      ////////////////////////////////Load 10 numbers////////////////////////////////////
     mem_array[0] = 32'b10001100000000010000000000000001; //LW $1 1($0)
     mem_array[1] = 32'b10001100000000100000000000000010; //LW $2 2($0)
     mem_array[2] = 32'b10001100000000110000000000000011; //LW $3 3($0)
     mem_array[3] = 32'b10001100000001000000000000000100; //LW $4 4($0)
     mem_array[4] = 32'b10001100000001010000000000000101; //LW $5 5($0)
     mem_array[5] = 32'b10001100000001100000000000000110; //LW $6 6($0)
     mem_array[6] = 32'b10001100000001110000000000000111; //LW $7 7($0)
     mem_array[7] = 32'b10001100000010000000000000001000; //LW $8 8($0)
     mem_array[8] = 32'b10001100000010010000000000001001; //LW $9 9($0)
     mem_array[9] = 32'b10001100000010100000000000001010; //LW $10 10($0)

     //////////////////////////Calculating the sum of 10 numbers/////////////////////////////
     mem_array[10] = 32'b00000000001000101110100000100000;  //ADD $29 $1 $2
     mem_array[11] = 32'b00000000011111011110100000100000;  //ADD $29 $3 $29 
     mem_array[12] = 32'b00000000100111011110100000100000;  //ADD $29 $4 $29 
     mem_array[13] = 32'b00000000101111011110100000100000;  //ADD $29 $5 $29 
     mem_array[14] = 32'b00000000110111011110100000100000;  //ADD $29 $6 $29 
     mem_array[15] = 32'b00000000111111011110100000100000;  //ADD $29 $7 $29 
     mem_array[16] = 32'b00000001000111011110100000100000;  //ADD $29 $8 $29 
     mem_array[17] = 32'b00000001001111011110100000100000;  //ADD $29 $9 $29 
     mem_array[18] = 32'b00000001010111011110100000100000;  //ADD $29 $10 $29
      ////////////////////////////////////////////////////////////////////////////////////////


     mem_array[19] = 32'b00000000000000011111100000100000; //por kardane min ba meghdar avalie
     mem_array[20] = 32'b00000000000000011111000000100000; //por kardane max ba meghdar avalie
     
     mem_array[21] = 32'b00000000001111111110000000101010; // slt / natije dar $28
     mem_array[22] = 32'b00010000000111000000000000000001; // if $1>min dont change min
     mem_array[23] = 32'b00000000000000011111100000100000; // change min with $1
     
     mem_array[24] = 32'b00000000010111111110000000101010; // slt / natije dar $28
     mem_array[25] = 32'b00010000000111000000000000000001; // if $2>min dont change min
     mem_array[26] = 32'b00000000000000101111100000100000; // change min with $2
     
     mem_array[27] = 32'b00000000011111111110000000101010; // slt / natije dar $28
     mem_array[28] = 32'b00010000000111000000000000000001; // if $1>min dont change min
     mem_array[29] = 32'b00000000000000111111100000100000; // change min with $1
     
     mem_array[30] = 32'b00000000100111111110000000101010; // slt / natije dar $28
     mem_array[31] = 32'b00010000000111000000000000000001; // if $1>min dont change min
     mem_array[32] = 32'b00000000000001001111100000100000; // change min with $1
     
     mem_array[33] = 32'b00000000101111111110000000101010; // slt / natije dar $28
     mem_array[34] = 32'b00010000000111000000000000000001; // if $1>min dont change min
     mem_array[35] = 32'b00000000000001011111100000100000; // change min with $1
     
     mem_array[36] = 32'b00000000110111111110000000101010; // slt / natije dar $28
     mem_array[37] = 32'b00010000000111000000000000000001; // if $1>min dont change min
     mem_array[38] = 32'b00000000000001101111100000100000; // change min with $1
     
     mem_array[39] = 32'b00000000111111111110000000101010; // slt / natije dar $28
     mem_array[40] = 32'b00010000000111000000000000000001; // if $1>min dont change min
     mem_array[41] = 32'b00000000000001111111100000100000; // change min with $1
     
     mem_array[42] = 32'b00000001000111111110000000101010; // slt / natije dar $28
     mem_array[43] = 32'b00010000000111000000000000000001; // if $1>min dont change min
     mem_array[44] = 32'b00000000000010001111100000100000; // change min with $1
     
     mem_array[45] = 32'b00000001001111111110000000101010; // slt / natije dar $28
     mem_array[46] = 32'b00010000000111000000000000000001; // if $1>min dont change min
     mem_array[47] = 32'b00000000000010011111100000100000; // change min with $1
     
     mem_array[48] = 32'b00000001010111111110000000101010; // slt / natije dar $28
     mem_array[49] = 32'b00010000000111000000000000000001; // if $1>min dont change min
     mem_array[50] = 32'b00000000000010101111100000100000; // change min with $1
     ////////////////////////////////max////////////////////////////////////////////////////////
     mem_array[51] = 32'b00000011110000011110000000101010; // slt / natije dar $28
     mem_array[52] = 32'b00010000000111000000000000000001; // if $1>max dont change max
     mem_array[53] = 32'b00000000000000011111000000100000; // change max with $1
     
     mem_array[54] = 32'b00000011110000101110000000101010; // slt / natije dar $28
     mem_array[55] = 32'b00010000000111000000000000000001; // if $1>max dont change max
     mem_array[56] = 32'b00000000000000101111000000100000; // change max with $1
     
     mem_array[57] = 32'b00000011110000111110000000101010; // slt / natije dar $28
     mem_array[58] = 32'b00010000000111000000000000000001; // if $1>max dont change max
     mem_array[59] = 32'b00000000000000111111000000100000; // change max with $1
     
     mem_array[60] = 32'b00000011110001001110000000101010; // slt / natije dar $28
     mem_array[61] = 32'b00010000000111000000000000000001; // if $1>max dont change max
     mem_array[62] = 32'b00000000000001001111000000100000; // change max with $1
     
     mem_array[63] = 32'b00000011110001011110000000101010; // slt / natije dar $28
     mem_array[64] = 32'b00010000000111000000000000000001; // if $1>max dont change max
     mem_array[65] = 32'b00000000000001011111000000100000; // change max with $1
     
     mem_array[66] = 32'b00000011110001101110000000101010; // slt / natije dar $28
     mem_array[67] = 32'b00010000000111000000000000000001; // if $1>max dont change max
     mem_array[68] = 32'b00000000000001101111000000100000; // change max with $1
     
     mem_array[69] = 32'b00000011110001111110000000101010; // slt / natije dar $28
     mem_array[70] = 32'b00010000000111000000000000000001; // if $1>max dont change max
     mem_array[71] = 32'b00000000000001111111000000100000; // change max with $1
     
     mem_array[72] = 32'b00000011110010001110000000101010; // slt / natije dar $28
     mem_array[73] = 32'b00010000000111000000000000000001; // if $1>max dont change max
     mem_array[74] = 32'b00000000000010001111000000100000; // change max with $1
     
     mem_array[75] = 32'b00000011110010011110000000101010; // slt / natije dar $28
     mem_array[76] = 32'b00010000000111000000000000000001; // if $1>max dont change max
     mem_array[77] = 32'b00000000000010011111000000100000; // change max with $1
     
     mem_array[78] = 32'b00000011110010101110000000101010; // slt / natije dar $28
     mem_array[79] = 32'b00010000000111000000000000000001; // if $1>max dont change max
     mem_array[80] = 32'b00000000000010101111000000100000; // change max with $1
     
  end
 
  always@(memread, address, mem_array[address])
  begin
    if(memread)begin
      readdata=mem_array[address];
    end
  end

endmodule

// module testbench;
//   reg memread;              /* rw=RegWrite */
//   reg [7:0] adr;  /* adr=address */
//   wire [31:0] rd; /* rd=readdata */
  
//   memBank u0(memread, adr, rd);
  
//   initial begin
//     memread=1'b0;
//     adr=16'd0;
    
//     #5
//     memread=1'b1;
//     adr=16'd0;
//   end
  
//   initial repeat(127)#4 adr=adr+1;
  
// endmodule
