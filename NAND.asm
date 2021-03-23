# Program Name: NAND
# Author: Ryu Parish
# Program: Implement NAND

.text
main:
	# Prompting User for first input
	addi $v0, $zero, 4
	la $a0, prompt1		#TODO
	syscall
	
	# Reading in integer
	addi $v0, $zero, 5
	syscall
	move $s0, $v0
	
	# Prompting User for second input
	addi $v0, $zero, 4
	la $a0, prompt2		#TODO
	syscall
	
	# Reading second integer
	addi $v0, $zero, 5
	syscall
	move $s1, $v0
	
	# Implementing the AND operator, then the NOT operator to make NAND
	and $s0, $s0, $s1
	xori $s0, $s0, 0xffffffff
	
	# Printing out the presentation
	addi $v0, $zero, 4
	la $a0, present		#TODO
	syscall
	
	# Printing out the NAND value in binary
	addi $v0, $zero, 35
	la $a0, ($s0)
	syscall
	
	addi $v0, $zero, 10
	syscall
	
.data
prompt1:	.asciiz "Please enter the first number here: "
prompt2:	.asciiz "Please enter the second number here: "
present:	.asciiz "Here is the NAND result: "
	