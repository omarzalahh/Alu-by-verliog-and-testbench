/*
Name:omar salah eldin
date:9/8/2022
Module_name:ALU module
Description:
1) ALU Operands (A, B)
2) ALU Result (ALU_OUT)
3) ALU operands and output Result are of 16-bit width.
4) ALU Result (ALU_OUT) is registered.
5) The ALU function is carried out according to the value of
the ALU_FUN input signal stated in the table in the
following page and any other value for ALU_FUN not
stated in the table, ALU_OUT must equal to 16?b0
6) Arith_flag is activated "High" only when ALU performs
one of the arithmetic operations (Addition, Subtraction,
Multiplication, division), otherwise "LOW"
7) Logic_flag is activated "High" only when ALU performs
one of the Boolean operations (AND, OR, NAND, NOR,
XOR, XNOR), otherwise "LOW"
8) CMP_flag is activated "High" only when ALU performs
one of the Comparison operations (Equal, Greater than,
less than), otherwise "LOW"
9) Shift_flag is activated "High" only when ALU performs
one of the shifting operations (shift right, shift left),
otherwise "LOW
*/
module ALU(
  input   wire  [15:0]  A,B,
  input   wire  [3:0]   ALU_FUN,
  input   wire          CLK, 
  output  reg   [15:0]  ALU_OUT,
  output  reg           Arith_Flag,
  output  reg           Logic_Flag,
  output  reg           Cmp_Flag,
  output  reg           Shift_Flag
  );
  always  @ (posedge CLK)
    begin
      case(ALU_FUN)
          4'b0000://for addition and arith flag
            begin
              ALU_OUT<=A+B;
              Arith_Flag<=1'b1;
              Logic_Flag<=1'b0;
              Cmp_Flag<=1'b0;
              Shift_Flag<=1'b0;
            end
          4'b0001://for subtraction and arith flag
            begin
              ALU_OUT<=A-B;
              Arith_Flag<=1'b1;
              Logic_Flag<=1'b0;
              Cmp_Flag<=1'b0;
              Shift_Flag<=1'b0;
            end
          4'b0010://for multiplication and arith flag
            begin
              ALU_OUT<=A*B;
              Arith_Flag<=1'b1;
              Logic_Flag<=1'b0;
              Cmp_Flag=1'b0;
              Shift_Flag<=1'b0;
            end
          4'b0011://for dividing and arith flag
            begin
              ALU_OUT<=A/B;
              Arith_Flag<=1'b1;
              Logic_Flag<=1'b0;
              Cmp_Flag<=1'b0;
              Shift_Flag<=1'b0;
            end
          4'b0100://for logical and and logical flag
            begin
              ALU_OUT<=A&B;
              Arith_Flag<=1'b0;
              Logic_Flag<=1'b1;
              Cmp_Flag<=1'b0;
              Shift_Flag<=1'b0;
            end
          4'b0101://for logical or and logical flag
            begin
              ALU_OUT<=A|B;
              Arith_Flag<=1'b0;
              Logic_Flag<=1'b1;
              Cmp_Flag<=1'b0;
              Shift_Flag<=1'b0;
            end
          4'b0110://nand
            begin
              ALU_OUT<=~(A&B);
              Arith_Flag<=1'b0;
              Logic_Flag<=1'b1;
              Cmp_Flag<=1'b0;
              Shift_Flag<=1'b0;
            end
          4'b0111://nor
            begin
              ALU_OUT<=~(A|B);
              Arith_Flag<=1'b0;
              Logic_Flag<=1'b1;
              Cmp_Flag<=1'b0;
              Shift_Flag<=1'b0;
            end
          4'b1000://xor
            begin
              ALU_OUT<=A^B;
              Arith_Flag<=1'b0;
              Logic_Flag<=1'b1;
              Cmp_Flag<=1'b0;
              Shift_Flag<=1'b0;
            end
          4'b1001://xnor
            begin
              ALU_OUT<=~(A^B);
              Arith_Flag<=1'b0;
              Logic_Flag<=1'b1;
              Cmp_Flag<=1'b0;
              Shift_Flag<=1'b0;
            end  
          4'b1010://cmp
            begin
              if(A==B)
                begin
                  ALU_OUT<=16'b1;
                end
              else
                begin
                  ALU_OUT<=16'b0;
                end  
              Arith_Flag<=1'b0;
              Logic_Flag<=1'b0;
              Cmp_Flag<=1'b1;
              Shift_Flag<=1'b0;
            end
            4'b1011://cmp
            begin
              if(A>B)
                begin
                  ALU_OUT<=16'b10;
                end
              else
                begin
                  ALU_OUT<=16'b0;
                end  
              Arith_Flag<=1'b0;
              Logic_Flag<=1'b0;
              Cmp_Flag<=1'b1;
              Shift_Flag<=1'b0;
            end
            4'b1100://cmp
            begin
              if(A<B)
                begin
                  ALU_OUT<=16'b11;
                end
              else
                begin
                  ALU_OUT<=16'b0;
                end
              Arith_Flag<=1'b0;
              Logic_Flag<=1'b0;
              Cmp_Flag<=1'b1;
              Shift_Flag<=1'b0;
            end
            4'b1101://shifr right
            begin
              ALU_OUT<=(A>>1);
              Arith_Flag<=1'b0;
              Logic_Flag<=1'b0;
              Cmp_Flag<=1'b0;
              Shift_Flag<=1'b1;
            end  
            4'b1110://shift left
            begin
              ALU_OUT<=(A<<1);
              Arith_Flag<=1'b0;
              Logic_Flag<=1'b0;
              Cmp_Flag<=1'b0;
              Shift_Flag<=1'b1;
            end  
            default://Default all flags are equal to zero and alu out equal to zero
            begin
              ALU_OUT<=16'b0;
              Arith_Flag<=1'b0;
              Logic_Flag<=1'b0;
              Cmp_Flag<=1'b0;
              Shift_Flag<=1'b0;
            end
      endcase
    end
  endmodule