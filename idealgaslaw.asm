# Program Name: idealgaslaw.asm
# Author: Ryu Parish
# Program: Calculate the volume of a gas based on the given n, R, T, and P
.text
main:
	# Prompt the user for the n of moles
	addi $v0, $zero, 4
	la $a0, n
	syscall
	
	# Read in the integer number of moles
	addi $v0, $zero, 5
	syscall
	move $s0, $v0
	
	# Prompt the user for the tempurature
	addi $v0, $zero, 4
	la $a0, T
	syscall
	
	# Read in the integer tempurature
	addi $v0, $zero, 5
	syscall
	move $s1, $v0
	
	# Prompt the user for the Pressure
	addi $v0, $zero, 4
	la $a0, P
	syscall
	
	# Read in the integer pressure
	addi $v0, $zero, 5
	syscall
	move $s2, $v0
	
	# Implement the equation nRT/ P
	addi $t0, $zero, 8314
	div $t0, $t0, 1000
	mul $t0, $t0, $s0
	mul $t0, $t0, $s1
	div $t0, $t0, $s2
	
	# Print out the equation presentation
	addi $v0, $zero, 4
	la $a0, igl
	syscall
	
	# Print out the result of the equation
	addi $v0, $zero, 1
	la $a0, ($t0)
	syscall
	
	addi $v0, $zero, 10
	syscall
	
.data
n:	.asciiz "Please enter the number of moles here: "
T:	.asciiz "\nPlease enter the temperature in Celcius here: "
P:	.asciiz "\nPlease enter the pressure of the gas here: "
igl:	.asciiz "\nHere is the result of the equation nRT/P: "
