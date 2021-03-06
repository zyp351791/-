 module Mips_tb();
    
   reg clk, rst;
    
   Mips U_mips(.Clk(clk),.Reset(rst)); 
    
   initial begin
      $readmemh( "code1.txt" , U_mips.U_IM.IMem ) ;  
      $monitor("PC = 0x%8X, IR = 0x%8X", U_mips.U_pcUnit.PC, U_mips.opCode ); 
      
      clk = 1 ;
      rst = 0 ;
      #5 rst = 1 ;
      #50 rst = 0 ;
   end
   
   always
	   #(50) clk = ~clk;
   
endmodule
