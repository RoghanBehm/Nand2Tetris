// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/4/Fill.asm

// Runs an infinite loop that listens to the keyboard input. 
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel. When no key is pressed, 
// the screen should be cleared.

(LOOP)
    @KBD
    D=M     
    @BLACK_SCREEN
    D;JGT    

    @CLEAR_SCREEN
    0;JMP   

(BLACK_SCREEN)
    @SCREEN
    D=A
    @i
    M=D
    


    @FILL_LOOP
    0;JMP    

(FILL_LOOP)
    @i
    D=M
    @24576
    D=D-A
    @LOOP
    D;JEQ
    @i
    A=M        
    M=-1    

    @i
    M=M+1     
    @FILL_LOOP
    0;JMP  

(CLEAR_SCREEN)
    @SCREEN
    D=A
    @i
    M=D

    @CLEAR_LOOP
    0;JMP   
(CLEAR_LOOP)
    @i
    D=M
    @24576
    D=D-A
    @LOOP
    D;JEQ
    @i
    A=M
    M=0

    @i
    M=M+1
    @CLEAR_LOOP
    0;JMP