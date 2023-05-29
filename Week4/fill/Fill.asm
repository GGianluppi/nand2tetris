// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Fill.asm

// Runs an infinite loop that listens to the keyboard input.
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel;
// the screen should remain fully black as long as the key is pressed. 
// When no key is pressed, the program clears the screen, i.e. writes
// "white" in every pixel;
// the screen should remain fully clear as long as no key is pressed.

(LOOP)			// START LOOP	
	@SCREEN		
	D=A		// Store the value of A register in D register
	@ADDRESS	
	M=D		// Store the value of D register in the memory location specified by ADDRESS

	@KBD
	D=M		// Store the value at the memory location specified by KBD into D register
	
	@BLACK
	D;JEQ		// If the value in D register is equal to zero, jump to BLACK (no key, go to Up)
	
	@WHITE
	0;JEQ		// Unconditional jump to WHITE (key, go to Down)
	
(SETSCREEN)
	@ADDRESS
	D=M
	@KBD		// Load the value of the KBD (keyboard)
	D=D-A
	@LOOP
	D;JEQ
	
	@DRAW
	D=M
	@ADDRESS
	A=M
	M=D
	
	@ADDRESS
	M=M+1
	
	@SETSCREEN
	0;JMP		// Unconditional jump to SETSCREEN
	
(BLACK)
	@DRAW
	M=0
	@SETSCREEN
	0;JMP
	
(WHITE)
	@DRAW
	M=-1
	@SETSCREEN
	0;JMP

	
