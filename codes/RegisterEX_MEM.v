module RegisterEX_MEM(    
	clk_i      ,

    RegWrite_i ,
    MemWrite_i ,
    MemRead_i  ,
    MemtoReg_i  ,

    RegWrite_o ,
    MemWrite_o ,
    MemRead_o  ,
    MemtoReg_o  ,

    //Zero_i     ,
    ALU_Result_i ,
    muxBresult_i,
    RDaddr_i   ,
    
    //Zero_o     ,
    ALU_Result_o ,
    muxBresult_o,
    RDaddr_o   ,
);

input clk_i;
input RegWrite_i, MemWrite_i, MemRead_i, MemtoReg_i;
output reg RegWrite_o, MemWrite_o, MemRead_o, MemtoReg_o;

//input                 Zero_i;
input       [31:0]    ALU_Result_i, muxBresult_i;
input       [4:0]     RDaddr_i;

//output reg            Zero_o;
output reg  [31:0]    ALU_Result_o, muxBresult_o;
output reg  [4:0]     RDaddr_o;


always @(posedge clk_i) begin
    RegWrite_o <= RegWrite_i; 
    MemWrite_o <= MemWrite_i; 
    MemRead_o <= MemRead_i; 
    MemtoReg_o <= MemtoReg_i;
    //Zero_o <= Zero_i;
    ALU_Result_o <= ALU_Result_i;
    muxBresult_o <= muxBresult_i;
    RDaddr_o <= RDaddr_i;
end

endmodule
