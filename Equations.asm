# Program Name: Equations.asm
# Author: Ryu Parish
# Program: To implement a series of equations from user entered variables
.text
main:
	# Prompt user for the first variable
	addi $v0, $zero, 4
	la $a0, x	#TODO
	syscall
	
	# Read in the integer
	addi $v0, $zero, 5
	syscall
	move $s0, $v0
	
	# Prompt user for the second variable
	addi $v0, $zero, 4
	la $a0, y	#TODO
	syscall
	
	# Read in the integer
	addi $v0, $zero, 5
	syscall
	move $s1, $v0
	
	# Prompt the user for the third variable
	addi $v0, $zero, 4
	la $a0, z	#TODO
	syscall
	
	# Read in the integer
	addi $v0, $zero, 5
	syscall
	move $s2, $v0
	
	# Implement the first equation (5x + 3y + z)
	addi $t0, $zero, 5
	mul $t0, $t0, $s0
	addi $t1, $zero, 3
	mul $t1, $t1, $s1
	add $t0, $t0, $t1
	add $t0, $t0, $s2
	
	# Print out the presentation for the first equation
	addi $v0, $zero, 4
	la $a0, e1	#TODO
	syscall
	
	# Print out the result of the first equation
	addi $v0, $zero, 1
	la $a0, ($t0)
	syscall
	
	# Implement the second equation ((5x + 3y + z) * 3) / 2
	mul $t0, $t0, 3
	div $t0, $t0, 2
	
	# Print out the presentation of the second equation
	addi $v0, $zero, 4
	la $a0, e2	#TODO
	syscall
	
	# Print out the actual result of the second equation
	addi $v0, $zero, 1
	la $a0, ($t0)
	syscall
	
	# Implement the third equation (x^3 + 2x^2 + 3x + 4)
	addi $t0, $zero, 4
	mul $t1, $s0, 3
	add $t0, $t1, $t0
	mul $t1, $s0, $s0
	mul $t1, $t1, 2
	add $t0, $t0, $t1
	mul $t1, $s0, $s0
	mul $t1, $t1, $s0
	add $t0, $t0, $t1
	
	# Print out the presentation for the third equation
	addi $v0, $zero, 4
	la $a0, e3	#TODO
	syscall
	
	# Print out the result of the third equation
	addi $v0, $zero, 1
	la $a0, ($t0)
	syscall
	
	# Implement the fourth equation ((4x * y) / 3
	mul $t0, $s0, 4
	mul $t1, $t0, $s1
	div $t0, $t1, 3
	
	# Print out the presentation of the fourth equation
	addi $v0, $zero, 4
	la $a0, e4	#TODO
	syscall
	
	# Print out the result of the fourth equation
	addi $v0, $zero, 1
	la $a0, ($t0)
	syscall
	
	addi $v0, $zero, 10
	syscall
	
.data
x:	.asciiz "Please enter x here: "
y:	.asciiz "\nPlease enter y here: "
z:	.asciiz "\nPlease enter z here: "
e1:	.asciiz "\nHere is the result of (5x + 3y + z): "
e2:	.asciiz "\nHere is the result of (((5x + 3y + z) * 3) / 2)): "
e3:	.asciiz "\nHere is the result of (x^3 + 2x^2 + 3x + 4): "
e4:	.asciiz "\nHere is the result of ((4x * y) / 3): "
	
	
	
	
