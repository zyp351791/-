
module PcUnit(PC,OldPC,stall,PcReSet,PcSel,Clk,Adress,Adj,j,jal,pcjal,jr);

    input   [31:0] OldPC;
    input   stall;
	input   PcReSet;
	input   PcSel;
	input   Clk;
        //input   [31:0] ra;
	input   [31:0] Adress;
	input   [25:0] Adj;
	input   j;
	
    input   jr;
    input   jal;
	output reg[31:0] PC;
    output reg[31:0] pcjal;
	integer i;
	reg [31:0] temp;

    
	always@(posedge Clk or posedge PcReSet)
	begin
	if(PcReSet == 1)
	    PC <= 32'h0000_3000;
	if(stall==0)
	begin
            PC=PC+4;
            if(jr==1)
                PC=OldPC;  
	    if(PcSel == 1)
	    begin
	        for(i=0;i<30;i=i+1)
		    temp[31-i] = Adress[29-i];
		    temp[0] = 0;
		    temp[1] = 0;
					
		    PC = OldPC+temp;
	    end
	    if(j==1)
	    begin
	        PC={OldPC[31:28],Adj[25:0],2'b00};
                if(jal==1)
                begin
                    pcjal=OldPC+4;
                end
	    end
            //if(jr==1)
            //begin
            //    PC<=ra;
            //end
        end
	end
endmodule
	
	