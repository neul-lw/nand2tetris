// this file is part of www.nand2tetris.org and the book "the elements of computing systems" by nisan and schocken, mit press. file name: projects/04/fill.asm
// Runs an infinite loop that listens to the keyboard input.
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel;
// the screen should remain fully black as long as the key is pressed. 
// When no key is pressed, the program clears the screen, i.e. writes
// "white" in every pixel;
// the screen should remain fully clear as long as no key is pressed.

// Should check if the screen is full if is 
//      go back to starting point and make 0 while incrementing pointer

// Instead of making whole screen black 
// it creates line with spaces 

@SCREEN 
D=A
@addr 
M=D
(LOOP)
    @KBD 
        D=M 
    @WHITE 
        D;JEQ
    @BLACK 
        D;JGT

    (BLACK)
        @addr 
            A=M 
            M=1 
        @INCREMENTADDR 
            0;JMP

    (WHITE) 
        @addr
            A=M
            M=0 
        @INCREMENTADDR 
            0;JMP

    (RESETADDRESS)
        @SCREEN 
            D=A 
        @addr 
            M=D
        @LOOP 
            0;JMP

    (INCREMENTADDR)
        @addr 
            D=M
        @24575 
            D=A-D 
        @RESETADDRESS 
            D;JEQ 
        @addr 
            M=M+1
        @LOOP 
            0;JMP
