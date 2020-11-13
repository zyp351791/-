`include "ctrl_encode_def.v"
`include "instruction_def.v"

module Ctrl(jump,RegDst,Branch,MemR,Mem2R,MemW,RegW,Alusrc,ExtOp,Aluctrl,OpCode,funct,jrjump,jal);
	
	input [5:0]		OpCode;				
	input [5:0]		funct;				
        output reg jal;
        output reg jump;
        output reg jrjump;
	output reg [1:0] RegDst;					
	output reg Branch;						
	output reg MemR;						
	output reg [1:0] Mem2R;					
	output reg MemW;						
	output reg RegW;						
	output reg Alusrc;						
	output reg [1:0] ExtOp;						
	output reg [4:0] Aluctrl;						
	
	
	always@(OpCode or funct)
	begin
	  
		case(OpCode)
		  `INSTR_RTYPE_OP: //R type 000000
		  begin
		    assign jump=0;
		    assign Branch=0;
		    assign Mem2R=0;
		    assign MemW=0;
		    assign MemR=0;
		    assign Alusrc=0;
		    assign ExtOp=`EXT_ZERO;
		    assign RegDst=1;
                    assign jal=0;
		    case(funct)
		      
		      `INSTR_ADDU_FUNCT: //ADDU
		      begin
		          assign RegW=1;
		          assign Aluctrl=`ALUOp_ADDU;
                          assign jrjump=0;
		      end
		      `INSTR_NOR_FUNCT:
                      begin
                          assign RegW=1;
                          assign Aluctrl=`ALUOp_NOR;
                          assign jrjump=0;
                      end
		      `INSTR_SUBU_FUNCT: //SUBU
		      begin
		          assign RegW=1;
		          assign Aluctrl=`ALUOp_SUBU;
                          assign jrjump=0;
		      end
		      
		      `INSTR_ADD_FUNCT: //ADD
		      begin
		          assign RegW=1;
		          assign Aluctrl=`ALUOp_ADD;
                          assign jrjump=0;
		      end
		      
		      `INSTR_SUB_FUNCT: //SUB
		      begin
		          assign RegW=1;
		          assign Aluctrl=`ALUOp_SUB;
                          assign jrjump=0;
		      end
		      		      
		      `INSTR_OR_FUNCT: //OR
		      begin
		          assign RegW=1;
		          assign Aluctrl=`ALUOp_OR;
                          assign jrjump=0;
		      end
		      
		      `INSTR_AND_FUNCT: //AND
		      begin
		          assign RegW=1;
		          assign Aluctrl=`ALUOp_AND;
                          assign jrjump=0;
		      end
		      
		      `INSTR_SLT_FUNCT: //SLT
		      begin
		          assign RegW=1;
		          assign Aluctrl=`ALUOp_SLT;
                          assign jrjump=0;
		      end
		      `INSTR_SLTU_FUNCT:
		      begin
			  assign RegW=1;
			  assign Aluctrl=`ALUOp_SLTU;
                          assign jrjump=0;
		      end
		      `INSTR_SLL_FUNCT: //SLL
		      begin
		          assign RegW=1;
		          assign Aluctrl=`ALUOp_SLL;
                          assign jrjump=0;
		      end
		       `INSTR_SLLV_FUNCT: //SLLV
		      begin
		          assign RegW=1;
		          assign Aluctrl=`ALUOp_SLLV;
                          assign jrjump=0;
		      end
                      `INSTR_SRLV_FUNCT: //SRLV
		      begin
		          assign RegW=1;
		          assign Aluctrl=`ALUOp_SRLV;
                          assign jrjump=0;
		      end
		      `INSTR_SRL_FUNCT: //SRL
		      begin
		          assign RegW=1;
		          assign Aluctrl=`ALUOp_SRL;
                          assign jrjump=0;
		      end
		      `INSTR_JR_FUNCT:
                      begin
                         assign RegW=0;
                         assign Aluctrl=`ALUOp_SUB;
                         assign jrjump=1;
                      end
                      `INSTR_JALR_FUNCT:
                      begin
                         assign RegW=1;
                         assign Aluctrl=`ALUOp_SUB;
                         assign jrjump=1;
                         assign Mem2R=2'b10;
                      end
		      default:;
		    endcase
		  end
		  
		  `INSTR_ORI_OP: //ORI
		  begin
		    assign jump=0;
                    assign jrjump=0;
		    assign Branch=0;
		    assign Mem2R=0;
		    assign MemW=0;
		    assign MemR=0;
		    assign Alusrc=1;
		    assign ExtOp=`EXT_ZERO;
		    assign RegDst=0;
		    assign RegW=1;
		    assign Aluctrl=`ALUOp_OR;
                    assign jal=0;	  
		  end		
		  
		  `INSTR_ADDI_OP: //ADDI
		  begin
		    assign jump=0;
                    assign jrjump=0;
		    assign Branch=0;
		    assign Mem2R=0;
		    assign MemW=0;
		    assign MemR=0;
		    assign Alusrc=1;
		    assign ExtOp=`EXT_ZERO;
		    assign RegDst=0;
		    assign RegW=1;
		    assign Aluctrl=`ALUOp_ADD;	
                    assign jal=0;  
		  end		
		  `INSTR_SLTI_OP: //SLTI
		  begin
		    assign jump=0;
                    assign jrjump=0;
		    assign Branch=0;
		    assign Mem2R=0;
		    assign MemW=0;
		    assign MemR=0;
		    assign Alusrc=1;
		    assign ExtOp=`EXT_ZERO;
		    assign RegDst=0;
		    assign RegW=1;
		    assign Aluctrl=`ALUOp_SLT;	
                    assign jal=0;   
		  end		
		  `INSTR_LUI_OP: //LUI
		  begin
		    assign jump=0;
                    assign jrjump=0;
		    assign Branch=0;
		    assign Mem2R=0;
		    assign MemW=0;
		    assign MemR=0;
		    assign Alusrc=1;
		    assign ExtOp=`EXT_SIGNED;
		    assign RegDst=0;
		    assign RegW=1;
		    assign Aluctrl=`ALUOp_LUI;
                    assign jal=0; 	  
		  end
		  
		  `INSTR_SW_OP: //SW
		  begin
		    assign jump=0;
                    assign jrjump=0;
		    assign Branch=0;
		    assign Mem2R=0;
		    assign MemW=1;
		    assign MemR=0;
		    assign Alusrc=1;
		    assign ExtOp=`EXT_SIGNED;
		    assign RegDst=0;
		    assign RegW=0;
		    assign Aluctrl=`ALUOp_ADD;
                    assign jal=0; 	  
		  end
		  
		  `INSTR_LW_OP: //LW
		  begin
		    assign jump=0;
                    assign jrjump=0;
		    assign Branch=0;
		    assign Mem2R=1;
		    assign MemW=0;
		    assign MemR=1;
		    assign Alusrc=1;
		    assign ExtOp=`EXT_SIGNED;
		    assign RegDst=0;
		    assign RegW=1;
		    assign Aluctrl=`ALUOp_ADD;
                    assign jal=0; 	  
		  end
		  
		  `INSTR_BEQ_OP: //BEQ
		  begin
		    assign jump=0;
                    assign jrjump=0;
		    assign Branch=1;
		    assign Mem2R=0;
		    assign MemW=0;
		    assign MemR=0;
		    assign Alusrc=0;
		    assign ExtOp=`EXT_SIGNED;
		    assign RegDst=0;
		    assign RegW=0;
		    assign Aluctrl=`ALUOp_EQL;	
                    assign jal=0;   
		  end
		  
		  `INSTR_BNE_OP: //BNE
		  begin
		    assign jump=0;
                    assign jrjump=0;
		    assign Branch=1;
		    assign Mem2R=0;
		    assign MemW=0;
		    assign MemR=0;
		    assign Alusrc=0;
		    assign ExtOp=`EXT_SIGNED;
		    assign RegDst=0;
		    assign RegW=0;
		    assign Aluctrl=`ALUOp_BNE;
                    assign jal=0; 	  
		  end
		  
		  `INSTR_J_OP: //J
		  begin
		    assign jump=1;
                    assign jrjump=0;
		    assign Branch=0;
		    assign Mem2R=0;
		    assign MemW=0;
		    assign MemR=0;
		    assign Alusrc=0;
		    assign ExtOp=`EXT_SIGNED;
		    assign RegDst=0;
		    assign RegW=0;
		    assign Aluctrl=`ALUOp_SUB;
                    assign jal=0; 	  
		  end
                  `INSTR_JAL_OP:
                  begin
                    assign jump=1;
                    assign jrjump=0;
                    assign Branch=0;
                    assign Mem2R=2'b10;
                    assign MemW=0;
                    assign MemR=0;
                    assign Alusrc=0;
                    assign ExtOp=`EXT_SIGNED;
                    assign RegDst=1;
                    assign RegW=1;
                    assign Aluctrl=`ALUOp_SUB;
                    assign jal=1;
                  end
                  

	  endcase
	  
	end
endmodule
