// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/4/Mult.asm

// Multiplies R0 and R1 and stores the result in R2.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)
// The algorithm is based on repetitive addition.

    @0
    D=M

    @ZERO_CHECK 
    D;JEQ  // Check RAM[0] value to avoid non-zero output from multiplying by 0

    @2
    M=0        
    @1
    D=M

    @ZERO_CHECK
    D;JEQ   // Check RAM[0] value to avoid non-zero output from multiplying by 0
         
    @MULT_LOOP
    D;JGT

(ZERO_CHECK)
    @2
    M=0
    @FIN
    0;JMP
    
(MULT_LOOP)
    @0
    D=M
    @2
    M=D+M
    @1
    M=M-1
    D=M
    @MULT_LOOP
    D;JGT

(FIN)

