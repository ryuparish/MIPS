# Program Name: AND_OR_NOT
# Author: Ryu Parish
# Program: To implement AND, OR, NOT, with only nor

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

	# Implement OR and print presentation
	nor $t0, $s0, $s1
	nor $t0, $t0, $zero
	addi $v0, $zero, 4
	la $a0, OR	#TODO
	syscall
	
	# Print out the result of the OR
	addi $v0, $zero, 35
	la $a0, ($t0)
	syscall
	
	# Implement NOT
	nor $t0, $s0, $zero
	nor $t1, $s1, $zero
	
	# Print out the presentation and the result
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
	
	# Implement AND and print presentation
	nor $t0, $t0, $t1
	addi $v0, $zero, 4
	la $a0, AND
	syscall
	
	# Print out the result
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
	