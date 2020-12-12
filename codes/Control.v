module Control
(
    Op_i,
    No_Op_i,
    RegWrite_o,
    MemtoReg_o,
    MemRead_o,
    MemWrite_o,
    ALUOp_o,
    ALUSrc_o,
    Branch_o
);

input [6:0] Op_i;
input No_Op_i;
output RegWrite_o;
output MemtoReg_o;
output MemRead_o;
output MemWrite_o;
output [2:0] ALUOp_o;
output ALUSrc_o;
output Branch_o;

assign RegWrite_o = ~No_Op_i & (Op_i[4] | ~Op_i[5]);
assign MemtoReg_o = ~No_Op_i & (Op_i[6:4] == 3'b000);
assign MemRead_o  = ~No_Op_i & (Op_i[6:4] == 3'b000);
assign MemWrite_o = ~No_Op_i & (Op_i[6:4] == 3'b010);
assign ALUOp_o    = ~No_Op_i & Op_i[6:4];
assign ALUSrc_o   = ~No_Op_i & Op_i[5];
assign Branch_o   = ~No_Op_i & Op_i[6];

endmodule