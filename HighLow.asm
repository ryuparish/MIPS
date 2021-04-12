# Program Name:	HighLow.asm
# Author:	Ryu Parish
# Program:	To make a random guessing game for a range of two numbers
.text
main:
	# Get input from the user
	la $a0, prompt	#TODO
	jal PromptInt
	move $s0, $v0
	jal PrintNewLine
	
	# Choose a random number from 0 to the max
	addi $v0, $zero, 42
	la $a0, randguess	#TODO
	la $a1, ($s0)
	syscall
	move $s1, $a0
	
	# Set the counter to 0
	la $s2, 0
	
	# The Sentinel Control Loop
	BeginLoop:
	# First add to the incrementer
	addi $s2, $s2, 1
	la $a0, guess	#TODO
	jal PromptInt
	la $t0, ($v0)
	beq $t0, $s1, EndLoop
	  sgt $t1, $t0, $s1
	  beqz $t1, else
	    la $a0, toohigh	#TODO
	    jal PrintString
	    jal PrintNewLine
	    b BeginLoop
	  else:
	  la $a0, toolow	#TODO
	  jal PrintString
	  jal PrintNewLine
	  b BeginLoop
	EndLoop:
	la $a0, congrats 	#TODO
	jal PrintString
	jal PrintNewLine
	la $a0, Tries
	la $a1, ($s2)
	jal PrintInt
	jal Exit
	
.data
prompt:		.asciiz "What is the maximum of the guesses?:"
randguess:	.word 0
guess:		.asciiz "What is your guess?: "
Tries:		.asciiz "You tried this many times: "
toohigh:	.asciiz "Too high. Try again."
toolow:		.asciiz "Too low. Try again."
congrats:	.asciiz "Congratulations, that's the right guess!"
.include "CharlesUtils.asm"
	
