# Program Name: oddeven_only_shifts.asm
# Author: Ryu Parish
# Program: To return 1 if an entered number is odd and 0 if even, only using sll and srl

.text
main:
	# Prompt user for input
	addi $v0, $zero, 4
	la $a0, prompt1
	syscall
	
	# Obtain the integer from the user
	addi $v0, $zero, 5
	syscall
	move $s0, $v0
	
	# Implement erasing of all bits to the right of the number
	sll $t0, $s0, 31
	srl $t0, $t0, 31
	
	# Print presentation
	addi $v0, $zero, 4
	la $a0, odd
	syscall
	
	# Print out the result
	addi $v0, $zero, 1
	la $a0, ($t0)
	syscall
	
	addi $v0, $zero, 10
	syscall
	
.data
prompt1:	.asciiz "Please enter your integer here: "
odd:		.asciiz "If your number is odd there will be 1 and even a 0: "
