// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Mult.asm

// Multiplies R0 and R1 and stores the result in R2.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)
//
// This program only needs to handle arguments that satisfy
// R0 >= 0, R1 >= 0, and R0*R1 < 32768.


// Initialize R1
	@R1
	D=M
	@x		
	M=D		// x = R1
     	
// Initialize R2 to 0
	@R2
	M=0

// Initialize R0, if R0 > 0 jump into the loop
	@R0
	D=M
	@LOOP
	D;JGT	
	
// If didn't jump into the loop, go to the end
	@END
	0;JMP
	 
(LOOP)		// Begin loop condition

	// R2
	@R2
	D=M
	
	// Add R1 to R2
	@x
	D=D+M
	
	@R2
	M=D

	// R0 - 1
	@R0
     D=M-1
	M=D
	
	// If R0 > 0, go back to the loop
	@LOOP
	D;JGT
	
(END)
     @END     
     0;JMP
    
