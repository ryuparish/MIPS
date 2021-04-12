# Program Name:		RecursiveSummation
# Author:		Ryu Parish
# Program: To recursively call a subprogram to accumulate a summation to an inputted value
# n.
.text
main:
	# Read in the input from the user
	la $a0, prompt
	jal PromptInt
	
	# Send in the input to the recursive function
	# We must zero the $v0 value because it still contains the input after the move
	# (it will mess up the summation with an extra 3 since we sum on the $v0)
	move $a0, $v0
	la $v0, ($zero)
	jal RecurseSummation
	move $s0, $v0
	
	# Print out the returned value
	la $a0, present
	la $a1, ($s0)
	jal PrintInt
	jal PrintNewLine
	jal Exit
	
RecurseSummation:

	# Push the stack to store the address
	addi $sp, $sp, -8
	sw $ra, 0($sp)
	
	# Add 1 to the incrementer and possibly store it
	addi $a1, $a1, 1

	# If the value inputted by the user is the current increment
	beq $a0, $a1, return
	  # Else if the n has not yet been reached, store the value and recurse
	  sw $a1, 4($sp)
	  jal RecurseSummation
	  
	  # Load the word for summation
	  lw $a1, 4($sp)
	  
	# Return the input plus the return value 
	return:
	add $v0, $v0, $a1
	lw $ra, 0($sp)
	addi $sp, $sp, 8
	jr $ra
	
.data
prompt:		.asciiz "Enter an integer to square: "
present:	.asciiz "Here is the square: "
	
.include "CharlesUtils.asm"