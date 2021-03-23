# Program Name:	AND_OR_NOT2.asm
# Author: Ryu Parish
# Program: AND OR and NOT with only NAND

.text
main:
	# Prompt user for first input
	addi $v0, $zero, 4
	la $a0, prompt1		# TODO
	syscall
	
	# Read in the input
	addi $v0, $zero, 5
	syscall
	move $s0, $v0
	
	# Prompt user for second input
	addi $v0, $zero, 4
	la $a0, prompt2		#TODO
	syscall
	
	# Read in the second output
	addi $v0, $zero, 5
	syscall
	move $s1, $v0
	
	# Implement AND and print presentation
	and $t0, $s0, $s1
	not $t0, $t0
	andi $t0, $t0, 0xffffffff
	not $t0, $t0
	addi $v0, $zero, 4
	la $a0, AND	#TODO
	syscall
	
	# Print out the result of the AND
	addi $v0, $zero, 35
	la $a0, ($t0)
	syscall
	
	# Implement NOT using NAND
	andi $t0, $s0, 0xffffffff
	andi $t1, $s1, 0xffffffff
	not $t0, $t0
	not $t1, $t1
	
	# Print out the presentation and the result of NOT
	addi $v0, $zero, 4
	la $a0, NOT1	#TODO
	syscall
	addi $v0, $zero, 35
	la $a0, ($t0)
	syscall
	addi $v0, $zero, 4
	la $a0, NOT2	#TODO
	syscall
	addi $v0, $zero, 35
	la $a0, ($t1)
	syscall
	
	# Implement OR and print out the presentation
	and $t0, $t0, $t1
	not $t0, $t0
	addi $v0, $zero, 4
	la $a0, OR
	syscall
	
	# Print out the result of or
	addi $v0, $zero, 35
	la $a0, ($t0)
	syscall
	
	addi $v0, $zero, 10
	syscall
	
.data
prompt1:	.asciiz "Please input your first number here: "
prompt2:	.asciiz "\nPlease input your second number here: "
OR:		.asciiz "\nHere is the OR result: "
NOT1:		.asciiz "\nHere is the first NOT: "
NOT2:		.asciiz "\nHere is the second NOT: "
AND:		.asciiz "\nHere is the AND result: "
	
	
	