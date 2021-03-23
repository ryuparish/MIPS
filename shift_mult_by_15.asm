# Program Name: Shift_mult_15.asm
# Author: Ryu Parish
# Program: Multiply a number by 15 only using bit-shift

.text
main:
	# Prompt User for input
	addi $v0, $zero, 4
	la $a0, prompt
	syscall
	
	# Read in integer
	addi $v0, $zero, 5
	syscall
	move $s0, $v0
	
	# Shift integer by 3, 2, 1 then add them together along with the integer itself
	sll $t0, $s0, 3
	sll $t1, $s0, 2
	sll $t2, $s0, 1
	add $t0, $t0, $t1
	add $t0, $t0, $t2
	add $t0, $t0, $s0
	
	# Print out the shift presentation in binary
	addi $v0, $zero, 4
	la $a0, shift
	syscall
	
	# Print out the integer in binary
	addi $v0, $zero, 35
	la $a0, ($t0)
	syscall
	
	# Implement the same calculation with only mult and mflo
	addi $t0, $zero, 15
	mult $s0, $t0
	mflo $t0
	
	# Print out the mult presentation
	addi $v0, $zero, 4
	la $a0, check
	syscall
	
	# Print out the mult result
	addi $v0, $zero, 35
	la $a0, ($t0)
	syscall
	
	addi $v0, $zero, 10
	syscall
	
.data
prompt:		.asciiz "Please input your integer here: "
shift:		.asciiz "\nHere is your integer multiplied by 10 in binary: "
check:		.asciiz "\nHere is the mult version by reference: "
