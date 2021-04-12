# Program Name:		RecursiveAverage
# Author:		Ryu Parish
# Program: To recursively call a subprogram to continuously sum a bunch of numbers until -1 is
# entered
.text
main:
	# Call the subprogram first
	# Remember that this recursive technique requires you to add 1 to the sum
	# since -1 gets returned and added into the sum during the recursion.
	jal SumAndLength
	move $s0, $v0
	addi $v0, $v0, 1
	move $s1, $v1
	
	# Calculate the average by dividing the sum by the total number of inputs
	div $v0, $v0, $v1
	mflo $s0
	la $a0, present
	la $a1, ($s0)
	jal PrintInt
	jal PrintNewLine
	jal Exit
	
SumAndLength:
	# Pushing the stack to keep the value entered and the addresses
	addi $sp, $sp, -8
	sw $ra, 0($sp)
	
	# Prompting for the value to store
	la $a0, prompt
	jal PromptInt
	
	# If the value inputted by the user is the stopping value (-1)
	beq $v0, -1, return
	
	# Else store the value inputted and recurse
	sw $v0, 4($sp)
	jal SumAndLength
	
	# Load the stored value and add to the value returned by the call above after base case
	lw $a0, 4($sp)
	add $v0, $v0, $a0
	addi $v1, $v1, 1
	
	# Return 1 to increment the length of the inputs, load return address, and pop stack
	return:
	lw $ra, 0($sp)
	addi $sp, $sp, 8
	jr $ra
	
.data
prompt:		.asciiz "Enter an integer here (enter -1 to stop): "
present:	.asciiz "Here is the average of the inputs: "
	
.include "CharlesUtils.asm"