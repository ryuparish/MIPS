# Program Name: Bitwise complement
# Author: Ryu Parish
# Program: To print out the bitwise complemnet of an entered integer
.text
main:
	# Print out prompt
	addi $v0, $zero, 4
	la $a0, prompt		#TODO
	syscall
	
	# Read in integer
	addi $v0, $zero, 5
	syscall
	move $s0, $v0
	
	# Implement the bitwise complement
	xori $s0, $s0, 0xffffffff
	
	# Print out presentation
	addi $v0, $zero, 4
	la $a0, present	#TODO
	syscall
	
	# Print out the complement in hex
	addi $v0, $zero, 35
	la $a0, ($s0)
	syscall
	
	addi $v0, $zero, 10
	syscall
	
.data
prompt:		.asciiz "Please enter you integer here: "
present:	.asciiz "\nHere is the bitwise complement: "
