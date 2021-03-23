# Program Name: swap_wo_temp.asm
# Author: Ryu Parish
# Program: Swapping two integers without using a temporary keeping spot for either integers

.text
main:
	# Prompt the first integer from the user
	addi $v0, $zero, 4
	la $a0, prompt1	#TODO
	syscall
	
	# Read in the first integer
	addi $v0, $zero, 5
	syscall
	move $s0, $v0
	
	# Prompt the second integer from the user
	addi $v0, $zero, 4
	la $a0, prompt2	#TODO
	syscall
	
	# Read in the second integer
	addi $v0, $zero, 5
	syscall
	move $s1, $v0
	
	# Print out the before presentation
	addi $v0, $zero, 4
	la $a0, before	#TODO
	syscall
	
	# Print out the before integers in binary
	addi $v0, $zero, 35
	la $a0, ($s0)
	syscall
	addi $v0, $zero, 4
	la $a0, newline
	syscall
	addi $v0, $zero, 35
	la $a0, ($s1)
	syscall
	
	# Implement the switch using only xor
	xor $t0, $s0, $s1
	xor $s0, $s0, $t0
	xor $s1, $s1, $t0
	
	# Print out the after presentation
	addi $v0, $zero, 4
	la $a0, after
	syscall
	
	# Print out the integers in binary swapped
	addi $v0, $zero, 35
	la $a0, ($s0)
	syscall
	addi $v0, $zero, 4
	la $a0, newline
	syscall
	addi $v0, $zero, 35
	la $a0, ($s1)
	syscall
	
	
	addi $v0, $zero, 10
	syscall
	
.data
prompt1:	.asciiz "Please enter the first integer here: "
prompt2:	.asciiz "\nPlease enter the second intger here: "
before:		.asciiz "\nHere are the numbers before the swap: "
after:		.asciiz "\nHere are the numbers after the swap: "
newline:	.asciiz "\n"