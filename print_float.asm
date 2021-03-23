# Program name: Print Float
# Author: Ryu Parish
# Program: Print a read float
.text
main:
	# Prints out message to prompt the user
	li $v0, 4
	la $a0, message	#TODO
	syscall
	
	# Reads in the float
	li $v0, 6
	syscall
	mov.s $f12, $f0
	
	# Prints out the read float message
	li $v0, 4
	la $a0, othermessage #TODO
	syscall
	
	# Prints out floating point
	li $v0, 2
	syscall
	
.data
message:	.asciiz "Please enter the float you want to print: "
othermessage:	.asciiz "\nYou entered: "