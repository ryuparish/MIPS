# Program Name: divide_by_8.asm
# Author: Ryu Parish
# Program: To divide by 8 only using bit-shift

.text
main:
	# Prompt user for input
	addi $v0, $zero, 4
	la $a0, prompt
	syscall
	
	# Read in integer
	addi $v0, $zero, 5
	syscall
	move $s0, $v0
	
	# Implement division
	srl $s0, $s0, 3
	
	# Print out the presentation
	addi $v0, $zero, 4
	la $a0, division
	syscall
	
	# Print out the integer
	addi $v0, $zero, 35
	addi $a0, $s0, 0x00000000
	syscall
	
	addi $v0, $zero, 10
	syscall

.data
prompt:		.asciiz "Please enter your integer here: "
division:	.asciiz "\nHere is the integer divided by 8 in binary: "
