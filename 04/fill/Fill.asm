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
(LOOP)
    @0 
        D=M 
    @n 
        M=D
    // addr 
    @SCREEN 
        D=A 
    @addr 
        M=D
    //
    @KBD 
        D=M 
    @WHITE 
        D;JEQ
    (BLACK)
        @n 
            D=M
        @addr
            A=M+D
            M=-1 
        @1 
            D=A 
        @n 
            M=M+D
            D=M
        @24575
            D=D-M 
        @BLACK 
            D;JGT
        @LOOP 
            D;JEQ
    (WHITE) 
        @SCREEN 
            M=0 
        @BLACK 
            0;JMP

