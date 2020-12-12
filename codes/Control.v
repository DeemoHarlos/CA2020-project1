module Control(
    Op_i,
    ALUOp_o,
    ALUSrc_o,
    RegWrite_o,
    //new
    output reg MemtoReg_o,
    output reg MemRead_o,
    output reg MemWrite_o,
    output reg Branch_o,
    input No_Op_i
);

// Ports
input    [6:0]      Op_i;     //opcode
output reg [1:0]      ALUOp_o;
output reg            ALUSrc_o;
output reg            RegWrite_o;


// set controls
//0100011 sw 00
//0000011 lw 00
//1100011 beq 01
//0010011 addi 11
//0110011 R 10
always @(NoOp_i or Op_i) begin
  if (Op_i == 7'b0010011 && NoOp_i == 0) begin //immd
    ALUOp_o <= 2'b11;
    ALUSrc_o <= 1'b1;
    RegWrite_o <= 1'b1;
    MemWrite_o <= 1'b0;
    MemRead_o <= 1'b0;
    MemtoReg_o <= 1'b0;
    Branch_o <= 1'b0;
  end
  else if (Op_i == 7'b1100011 && NoOp_i == 0) begin //beq
    ALUOp_o <= 2'b01;
    ALUSrc_o <= 1'b0;
    RegWrite_o <= 1'b0;
    MemWrite_o <= 1'b0;
    MemRead_o <= 1'b0;
    MemtoReg_o <= 1'b0;
    Branch_o <= 1'b1;
  end
  else if (Op_i == 7'b0110011 && NoOp_i == 0) begin //R
    ALUOp_o <= 2'b10;
    ALUSrc_o <= 1'b0;
    RegWrite_o <= 1'b1;
    MemWrite_o <= 1'b0;
    MemRead_o <= 1'b0;
    MemtoReg_o <= 1'b0;
    Branch_o <= 1'b0;
  end
  else if (Op_i == 7'b0100011 && NoOp_i == 0) begin //sw
    ALUOp_o <= 2'b00;
    ALUSrc_o <= 1'b1;
    RegWrite_o <= 1'b0;
    MemWrite_o <= 1'b1;
    MemRead_o  <= 1'b0;
    MemtoReg_o <= 1'b0;
    Branch_o <= 1'b0;
  end
  else if (Op_i == 7'b0100011 && NoOp_i == 0) begin //lw
    ALUOp_o <= 2'b00;
    ALUSrc_o <= 1'b1;
    RegWrite_o <= 1'b1;
    MemWrite_o <= 1'b0;
    MemRead_o  <= 1'b1;
    MemtoReg_o <= 1'b1;
    Branch_o <= 1'b0;
  end
  else if (Op_i == 7'b0000000 || NoOp_i == 1) begin //no instruction
    ALUOp_o <= 2'b00;
    ALUSrc_o <= 1'b1;
    RegWrite_o <= 1'b0;
    MemWrite_o <= 1'b0;
    MemRead_o <= 1'b0;
    MemtoReg_o <= 1'b0;
    Branch_o <= 1'b0;
  end
end


endmodule
