# Program File: Program2-3.asm
# Author: Charles Kann
# Program to read a string from a user, and
# print that string back to the console.
.text
main:
# Prompt for the string to enter
	li $v0, 4
	la $a0, prompt
	syscall
	
	# Read the string.
	li $v0, 8
	la $a0, input          # Loading (passing) to the $a0 register the address of the 81 bytes
	lw $a1, inputSize      # Putting 80 of the read characters into the "input" variable (this register just holds the instruction, the actual reading is put into the $a0 register's referenced value, which is the "input" variable)
	syscall
	
	# Output the text
	li $v0, 4
	la $a0, output
	syscall
	
	# Output the string
	li $v0, 4
	la $a0, input
	syscall
	
	# Exit the program
	li $v0, 10
	syscall

.data
input: .space 81
inputSize: .word 80
prompt: .asciiz "Please enter a string: "
output: .asciiz "\nYou typed the string:  "