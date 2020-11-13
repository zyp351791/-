module JrCTRL(
    input jrjump,
    input EXMEM_RegWrite,
    input MEMWB_RegWrite,
    input [4:0] IFID_rs,
    input [4:0] EXMEM_rd,
    input [4:0] MEMWB_rd,
    output reg [1:0] jr_forward
);
    always @(*) begin
        if (jrjump == 1'b0) begin
            jr_forward = 2'b00;
        end
        else begin
            //if (EXMEM_RegWrite && (EXMEM_rd != 5'b00000) && (EXMEM_rd == IFID_rs)) 
            if(EXMEM_RegWrite&&(EXMEM_rd==MEMWB_rd))
            begin
                jr_forward = 2'b10;
            end
            else if (MEMWB_RegWrite && (MEMWB_rd != 5'b00000) && (EXMEM_rd == IFID_rs)) 
            begin
                jr_forward = 2'b01;
            end
            else begin
                jr_forward = 2'b11;
            end
        end
    end

endmodule