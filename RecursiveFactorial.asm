# Program Name:		RecursiveFactorial.asm
# Author:		Ryu Parish
# Program: To calculate the factorial of the number entered
# Important: In MIPS, you must also code your own base case return cycle in order to recurse
# correctly.

.text
main:
	# Read in the number
	la $a0, prompt
	jal PromptInt
	move $s0, $v0
	
	# Calculate the factorial
	la $a0, ($s0)
	jal Factorial
	
	# Print out the factorial number 
	la $a0, present
	la $a1, ($v0)
	jal PrintInt
	jal PrintNewLine
	jal Exit
	
Factorial:
	addi $sp, $sp, -8
	sw $ra, 0($sp)
	sw $a0, 4($sp)
	addi $a0, $a0, -1
	beqz $a0, last
	  jal Factorial
	  b return
	
	# We must set a base case for the last recurse, since we
	# do not want it to multiply $v0 and $a0
	last:
	  lw $v0, 4($sp)
	  lw $ra, 0($sp)
	  addi $sp, $sp, 8
	  jr $ra
	  
	return:
	lw $a0, 4($sp)
	mult $v0, $a0
	mflo $v0
	lw $ra, 0($sp)
	addi $sp, $sp, 8
	jr $ra
	
.data
prompt:		.asciiz "Please enter you number here: "
present:	.asciiz "Here is the factorial of your number: "

.include "CharlesUtils.asm"