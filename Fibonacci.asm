# Program Name:	RecursiveFibonacci.asm
# Author:	Ryu Parish
# Program: Implement Fibonacci sequence summation with recursion
.text
main:
	# First read in the value n
	la $a0, prompt
	jal PromptInt
	move $s0, $v0
	
	# First check if the number entered is less than or equal to 2 and send itself
	ble $s0, 1, done
	
	# Start recursive call
	# We subtract 1 from the input number when setting the base case, since we can safely assume that the number
	# is greater than 1. We will start with 0 and 1 ready to add so we will start at 1.
	subi $s0, $s0, 1
	la $a0, ($s0)
	la $a1, 0
	la $a2, 1
	jal Fibonacci
	move $s0, $v0
	b done
	
	# If the number is too small
	done:
	la $a0, present
	la $a1, ($s0)
	jal PrintInt
	jal Exit
	
Fibonacci:
	addi $sp, $sp, -4
	sw $ra, 0($sp)
	beqz $a0, last
	  add $a3, $a1, $a2
	  la $a1, ($a2)
	  la $a2, ($a3)
	  subi $a0, $a0, 1
	  jal Fibonacci
	  b return
	  
	last:
	la $v0, ($a3)
	
	return: 
	lw $ra, 0($sp)
	addi $sp, $sp, 4
	jr $ra
	  
.data
prompt:		.asciiz "Please enter your n for Fibonacci(n): "
present:	.asciiz "Here is the fibonacci number at the nth position: "

.include "CharlesUtils.asm"
	  