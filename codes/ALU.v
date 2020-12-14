module ALU(
    data1_i,
    data2_i,
    ALUCtrl_i,
    data_o
);


input  signed [31:0] data1_i;
input  signed [31:0] data2_i;
input         [ 3:0] ALUCtrl_i;
output signed [31:0] data_o;

wire          [31:0] result;

assign data_o = (ALUCtrl_i == 4'b0000) ? data1_i  &  data2_i : // and
                (ALUCtrl_i == 4'b0001) ? data1_i  ^  data2_i : // xor
                (ALUCtrl_i == 4'b0010) ? data1_i  << data2_i : // sll
                (ALUCtrl_i == 4'b0011) ? $signed(data1_i) + $signed(data2_i) : // add
                (ALUCtrl_i == 4'b0100) ? $signed(data1_i) - $signed(data2_i) : // sub
                (ALUCtrl_i == 4'b0101) ? $signed(data1_i) * $signed(data2_i) : // mul
                (ALUCtrl_i == 4'b0110) ? $signed(data1_i) + $signed(data2_i) : // addi
                (ALUCtrl_i == 4'b0111) ? $signed(data1_i) >>> data2_i[4:0] : // srai
                (ALUCtrl_i == 4'b1000) ? data1_i  +  data2_i : // lw
                (ALUCtrl_i == 4'b1001) ? data1_i  +  data2_i: // sw
                (ALUCtrl_i == 4'b1010) ? data1_i  << data2_i : // beq
                32'b0;

endmodule
