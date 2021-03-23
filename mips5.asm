# Program Name: addiu vs. ori
# Author: Ryu Parish
# Program: To compare addiu and ori

.text
main:
	addiu $t0, $zero, 60000
	ori $t0, $zero, 60000
	
	addi $v0, $zero, 10
	syscall