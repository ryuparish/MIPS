# Program Name: Utils_test.asm
# Author: Ryu Parish
# Program:	Implements the Utils.asm file
.text
main:
	# Calling the nor subprogram
	la $a1, 0x00000002
	la $a2, 0x00000001
	jal NOR
	move $s0, $v0
	addi $v0, $zero, 35
	syscall
	
	# Calling the nand subprogram
	jal NAND
	move $s0, $v0
	addi $v0, $zero, 35
	syscall
	jal 
	