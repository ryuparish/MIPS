# Program name: Input Dialog
# Author: Ryu Parish
# Program: Read in a string from an input dialog and then print out the string
.text
main:
	# Printing out an input buffer for the user to input a string
	li $v0, 54
	la $a0, message		#TODO
	la $a1, buffer		#TODO
	lw $a2, stringSize	#TODO
	syscall
	
	# Printing out the string that was read in a message box
	li $v0, 59
	la $a0, othermessage
	la $a1, buffer
	syscall
	
	#End
	li $v0, 10
	syscall
	
.data
message:	.asciiz "Please input your string here: "
buffer:		.space 81
stringSize:	.word 80
othermessage:	.asciiz "Here is the string you typed: "
