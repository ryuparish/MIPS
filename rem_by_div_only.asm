# Program Name: Rem_by_div_only.asm
# Author: Ryu Parish
# Program: To implement rem only using div and mfhi/mflo

.text
main:
	# Implement a div on two integers
	la $t0, 37
	la $t1, 6
	div $t0,$t1
	mfhi $t0
	
	# Print remainder presentation
	addi $v0, $zero, 4
	la $a0, remainder
	syscall
	
	# Print the remainder
	addi $v0, $zero, 1
	la $a0, ($t0)
	syscall
	
	addi $v0, $zero, 10
	syscall
	
.data
remainder:	.asciiz "Here is the remainder of 37 divided by 6: "