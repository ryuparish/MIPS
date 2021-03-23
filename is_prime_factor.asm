# Program Name: prime_factor.asm
# Author: Ryu Parish
# Program: See if the second entered number is a prime factor of the first

.text
main:
	# Prompt user for first integer
	addi $v0, $zero, 4
	la $a0, prompt1
	syscall
	
	# Read in the integer
	addi $v0, $zero, 5
	syscall
	move $s0, $v0
	
	# Prompt user for second integer
	addi $v0, $zero, 4
	la $a0, prompt2
	syscall
	
	# Read in the second integer
	addi $v0, $zero, 5
	syscall
	move $s1, $v0
	
	# Implement the remainder and return it
	rem $t0, $s0, $s1
	addi $v0, $zero, 1
	la $a0, ($t0)
	syscall
	
	addi $v0, $zero, 10
	syscall
	
.data
prompt1:	.asciiz "Please enter your dividend here: "
prompt2:	.asciiz "\nPlease enter your divisor here (returns 0 if it is a prime factor): "
