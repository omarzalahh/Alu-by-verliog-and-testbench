`timescale 1us/1us
module ALU_tb  () ;
// all design inputs are defined in testbench as reg to be used inside initial block 
// all design outputs are defined in testbench as wire
reg    [15:0]    A_tb,B_tb;
reg    [3:0]     ALU_FUN_tb;
reg              CLK_tb;
wire   [15:0]    ALU_OUT_tb;
wire             Arith_Flag_tb;
wire             Logic_Flag_tb;
wire             Cmp_Flag_tb;
wire             Shift_Flag_tb;

//initial block
initial 
  begin
    $dumpfile("ALU.vcd") ;
    $dumpvars ;
    //initial values
    A_tb=16'b0;
    B_tb=16'b0;
    ALU_FUN_tb=4'b1111;
    CLK_tb=1'b0;
    //end initial values
     $display ("A=%d,B=%d",A_tb,B_tb) ; 
    $display ("TEST CASE 1 Check addition") ; 
    
    #3
     A_tb=16'b10;
     B_tb=16'b10;
     ALU_FUN_tb=4'b0;
     #3
     if(ALU_OUT_tb!=16'b000000000000100)
        begin
         $display ("TEST CASE 1 IS faled,\tA=%d,\tB=%d,\tOUT=%d",A_tb,B_tb,ALU_OUT_tb) ;
        end
      else
        begin
         $display ("TEST CASE 1 IS Passed,\tA=%d,\tB=%d,\tOUT=%d",A_tb,B_tb,ALU_OUT_tb) ;
        end
        $display ("TEST CASE 2 Check Subtraction") ; 
       #5
       ALU_FUN_tb=4'b0001;
       #5
       if(ALU_OUT_tb!=16'b000000000000000)
        begin
         $display ("TEST CASE 2 IS Falled,\tA=%b,\tB=%b,\tOUT=%b",A_tb,B_tb,ALU_OUT_tb) ;
        end
       else
        begin
         $display ("TEST CASE 2 IS Passed,\tA=%d,\tB=%d,\tOUT=%d",A_tb,B_tb,ALU_OUT_tb) ;
        end
        $display ("TEST CASE 3 Check Multiplication") ; 
       #13
       ALU_FUN_tb=4'b0010;
       #7
       if(ALU_OUT_tb!=16'b100)
        begin
         $display ("TEST CASE 3 IS falled,A=%b,B=%b,OUT=%b",A_tb,B_tb,ALU_OUT_tb) ;
        end
       else
        begin
         $display ("TEST CASE 3 IS Passed,\tA=%d,\tB=%d,\tOUT=%d",A_tb,B_tb,ALU_OUT_tb) ;
        end
        $display ("TEST CASE 4 Check division") ; 
        #17
        ALU_FUN_tb=4'b0011;
        #5
        if(ALU_OUT_tb!=16'b1)
        begin
         $display ("TEST CASE 4 IS falled,A=%b,B=%b,OUT=%b",A_tb,B_tb,ALU_OUT_tb) ;
        end
      else
        begin
         $display ("TEST CASE 4 IS passed,\tA=%d,\tB=%d,\tOUT=%d",A_tb,B_tb,ALU_OUT_tb) ;
        end
        $display ("TEST CASE 5 Check AND") ; 
        #23
        ALU_FUN_tb=4'b0100;
        #5
        if(ALU_OUT_tb!=16'b10)
        begin
         $display ("TEST CASE 5 IS faled,A=%b,B=%b,OUT=%b",A_tb,B_tb,ALU_OUT_tb) ;
        end
       else
        begin
         $display ("TEST CASE 5 IS passed,\tA=%d,\tB=%d,\tOUT=%d",A_tb,B_tb,ALU_OUT_tb) ;
        end
        $display ("TEST CASE 6 Check OR") ;
        #27
        ALU_FUN_tb=4'b0101;
        #5
        if(ALU_OUT_tb==16'b10)
        begin
         $display ("TEST CASE 6 IS PASSED,\tA=%d,\tB=%d,\tOUT=%d",A_tb,B_tb,ALU_OUT_tb) ;
        end
       else
        begin
         $display ("TEST CASE 6 IS falled,A=%b,B=%b,OUT=%b",A_tb,B_tb,ALU_OUT_tb) ;
        end
        $display ("TEST CASE 7 Check NAND") ;
        #10
        ALU_FUN_tb=4'b0110;
        #8
        if(ALU_OUT_tb==16'b1111111111111101)
        begin
         $display ("TEST CASE 7 IS PASSED,\tA=%d,\tB=%d,\tOUT=%b",A_tb,B_tb,ALU_OUT_tb) ;
        end
       else
        begin
         $display ("TEST CASE 7 IS falled,A=%b,B=%b,OUT=%b",A_tb,B_tb,ALU_OUT_tb) ;
        end
        $display ("TEST CASE 8 Check NOR") ;
        #15
        ALU_FUN_tb=4'b0111;
        #8
        if(ALU_OUT_tb==~(A_tb|B_tb))
        begin
         $display ("TEST CASE 8 IS PASSED,\tA=%d,\tB=%d,\tOUT=%b",A_tb,B_tb,ALU_OUT_tb) ;
        end
       else
        begin
         $display ("TEST CASE 8 IS falled,A=%b,B=%b,OUT=%b",A_tb,B_tb,ALU_OUT_tb) ;
        end
         $display ("TEST CASE 9 Check XOR") ;
        #15
        ALU_FUN_tb=4'b1000;
        #8
        if(ALU_OUT_tb==(A_tb^B_tb))
        begin
         $display ("TEST CASE 9 IS PASSED,\tA=%d,\t B=%d,\tOUT=%b",A_tb,B_tb,ALU_OUT_tb) ;
        end
       else
        begin
         $display ("TEST CASE 9 IS falled,\tA=%b,\t B=%b,\tOUT=%b",A_tb,B_tb,ALU_OUT_tb) ;
        end
         $display ("TEST CASE 10 Check XNOR") ;
         #15
        ALU_FUN_tb=4'b1001;
        #10
        if(ALU_OUT_tb==~(A_tb^B_tb))
        begin
         $display ("TEST CASE 10 IS PASSED,\tA=%d,\tB=%d,\tOUT=%b",A_tb,B_tb,ALU_OUT_tb) ;
        end
       else
        begin
         $display ("TEST CASE 10 IS falled,A=%b,B=%b,OUT=%b",A_tb,B_tb,ALU_OUT_tb) ;
        end
         $display ("TEST CASE 11 Check CMP :A=B") ;
        #15
        ALU_FUN_tb=4'b1010;
        #5
        if(ALU_OUT_tb==16'b1)
        begin
         $display ("TEST CASE 11 IS PASSED,\tA=%d,\tB=%d,\tOUT=%d",A_tb,B_tb,ALU_OUT_tb) ;
        end
       else
        begin
         $display ("TEST CASE 11 IS falled,A=%b,B=%b,OUT=%b",A_tb,B_tb,ALU_OUT_tb) ;
        end
         $display ("TEST CASE 12 Check CMP:A>B") ;
        #10
        ALU_FUN_tb=4'b1011;
        #10
        if(ALU_OUT_tb==16'b0)
        begin
         $display ("TEST CASE 12 IS PASSED,\tA=%d,\tB=%d,\tOUT=%d",A_tb,B_tb,ALU_OUT_tb) ;
        end
       else
        begin
         $display ("TEST CASE 12 IS falled,A=%b,B=%b,OUT=%b",A_tb,B_tb,ALU_OUT_tb) ;
        end
         $display ("TEST CASE 13 Check CMP:A<B") ;
        #10
        ALU_FUN_tb=4'b1100;
        #10
        if(ALU_OUT_tb==16'b0)
        begin
         $display ("TEST CASE 13 IS PASSED,\tA=%d,\tB=%d,\tOUT=%d",A_tb,B_tb,ALU_OUT_tb) ;
        end
       else
        begin
         $display ("TEST CASE 13 IS falled,A=%b,B=%b,OUT=%b",A_tb,B_tb,ALU_OUT_tb) ;
        end
         $display ("TEST CASE 14 Check Shift:A>>1") ;
        #10
        ALU_FUN_tb=4'b1101;
        #10
        if(ALU_OUT_tb==16'b1)
        begin
         $display ("TEST CASE 14 IS PASSED,\tA=%d,\tB=%d,\tOUT=%d",A_tb,B_tb,ALU_OUT_tb) ;
        end
       else
        begin
         $display ("TEST CASE 14 IS falled,A=%b,B=%b,OUT=%b",A_tb,B_tb,ALU_OUT_tb) ;
        end
         $display ("TEST CASE 15 Check Shift A <<1") ;
         #10
        ALU_FUN_tb=4'b1110;
        #10
        if(ALU_OUT_tb==16'b100)
        begin
         $display ("TEST CASE 15 IS PASSED,\tA=%d,\tB=%d,\tOUT=%d",A_tb,B_tb,ALU_OUT_tb) ;
        end
       else
        begin
         $display ("TEST CASE 15 IS falled,A=%b,B=%b,OUT=%b",A_tb,B_tb,ALU_OUT_tb) ;
        end
         $display ("TEST CASE 16 Check Default") ;
        #10
        ALU_FUN_tb=4'b1111;
        #10
        if(ALU_OUT_tb==16'b0)
        begin
         $display ("TEST CASE 16 IS PASSED,\tA=%d,\tB=%d,\tOUT=%d",A_tb,B_tb,ALU_OUT_tb) ;
        end
       else
        begin
         $display ("TEST CASE 16 IS falled,A=%b,B=%b,OUT=%b",A_tb,B_tb,ALU_OUT_tb) ;
        end
        
        #100
       $stop;
     end
       
       always #5 CLK_tb = !CLK_tb ;
       // instaniate design instance 
       
   ALU DUT (
    .A(A_tb),
    .B(B_tb), 
    .ALU_FUN(ALU_FUN_tb), 
    .CLK(CLK_tb),
    .ALU_OUT(ALU_OUT_tb),
    .Arith_Flag(Arith_Flag_tb),
    .Logic_Flag(Logic_Flag_tb),
    .Cmp_Flag(Cmp_Flag_tb),
    .Shift_Flag(Shift_Flag_tb)
  );
  
  
endmodule