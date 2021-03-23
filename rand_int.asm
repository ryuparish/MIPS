# Program name: Print_random_num
# Author: Ryu Parish
# Program: Prints a random integer (no seed)
.text
main:
	li $v0, 32	# Loads register to sleep with an argument of 4 seconds
	la $a0, 4000
	syscall
	
	li $v0, 10	# Loads register to exit program
	syscall