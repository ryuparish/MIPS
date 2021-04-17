# Program:	utils.asm
# Purpose:	To define utilities which will be used in MIPS programs.
# Author:	Charles Kann

# Subprograms Index:
#	Exit -Call syscall with a server 10 to exit the program
#	NewLine -Print a new line character (\n) to the console
#	PrintInt - Print a string with an integer to the console
#	PrintString -Print a string to the console
#	PromptInt - Prompt the user to enter an integer, and return
#	it to the calling program.

# Subprogram: AllocateArray
# Purpose: To allocate an array of $a0 items, each of size $a1.
# Author: Charles Kann
# Input: $a0 - the number of items in the array
#	 $a1 - the size of each item
# Output:$v0 - Address of the array allocated
AllocateArray:
	  addi $sp, $sp, -4
          sw $ra, 0($sp)
          mul $a0, $a0, 4	# Question 3b ( I do not understand what is mean't in question 3a )
          li $v0, 9
          syscall
          lw $ra, 0($sp)
          addi $sp, $sp, 4
          jr $ra

# Subprogram:	PrintNewLine
# Author:	Charles Kann
# Purpose:	To output a new line to the user console
# Input:	None
# Output:	None
# Side Effects:	A new line character is printed to the user's console
.text 
PrintNewLine:
	li $v0, 4
	la $a0, __PNL_newline
	syscall
	jr $ra
.data
__PNL_newline:	.asciiz "\n"

# subprogram:	PrintInt
# author:	Charles W. Kann
# purpose:	To print a string to the console
# input:	$a0 - The address of the string to print.
#		$a1 - The value of the int to print
# returns:	None
# side effects:	The String is printed followed by the integer value.
.text
PrintInt:
	# Print string. The string address is already in $a0
	li $v0, 4
	syscall
	# Print integer. The integer value is in $a1, and must
	# be first moved to $a0.
	move $a0, $a1
	li $v0, 1
	syscall
	#return
	jr $ra
	
# subprogram:	PromptInt
# author:	Charles W. Kann
# purpose:	To print the user for an integer input, and
#		to return that input value to the caller.
# input:	$a0 - The address of the string to print.
# returns:	$v0 - The value the user entered
# side effects:	The String is printed followed by the integer value.
.text
PromptInt:
	# Print the prompt, which is already in $a0
	addi $v0, $zero, 4
	syscall
	# Read the integer value. Note that at the end of the
	# syscall the value is already in $v0, so there is no
	# need to move it anywhere.
	move $a0, $a1
	addi $v0, $zero, 5
	syscall
	#return
	jr $ra
	
# Subprogram:	Exit
# Author:	Ryu Parish
# Purpose:	To exit the program
# Input:	None
# Output:	None
# Side Effects:	Exits the MIPS program
.text
Exit:
	li $v0, 10
	syscall
	
# Subprogram:	PrintString
# Author:	Ryu Parish
# Purpose:	To print a string to the console
# Input:	$a0 - The address of the string to be printed
# Returns:	None
# Side Effects:	The string is printed to the console
.text
PrintString:
        #addi $sp, $sp, -4
	#sw $ra, 0($sp)
	addi $v0, $zero, 4
	syscall
	# Saving the return register so we can jump the PrintNewLine subprogram
	#addi $sp, $sp, -4
	#sw $ra, 0($sp)
	#jal PrintNewLine
	#lw $ra, 0($sp)
	#addi $sp, $sp, 4
	jr $ra
	
# Subprogram: PrintIntArray
# Purpose: print an array of ints
# inputs: $a0 - the base address of the array
#         $a1 - the size of the array
#
.text
PrintIntArray:
	addi $sp, $sp, -16	# Stack record
	sw $ra, 0($sp)
	sw $s0, 4($sp)
	sw $s1, 8($sp)
	sw $s2, 12($sp)

	# save the base of the array to $s0
	move $s0, $a0

	# initialization for counter loop
	# $s1 is the ending index of the loop
	# $s2 is the loop counter
	move $s1, $a1
	move $s2, $zero

   	la $a0 open_bracket
   	jal PrintString
loop:
    # check ending condition
    sge $t0, $s2, $s1
    bnez $t0, end_loop
        sll $t0, $s2, 2
        add $t0, $t0, $s0
        lw $a1, 0($t0)
        la $a0, comma
        jal PrintInt
        addi $s2, $s2, 1
        b loop
end_loop:
    li $v0, 4
    la $a0, close_bracket
    syscall
    lw $ra, 0($sp)
    lw $s0, 4($sp)
    lw $s1, 8($sp)
    lw $s2, 12($sp)
    addi $sp, $sp, 16
    jr $ra
.data
    open_bracket:	.asciiz "["
    close_bracket:	.asciiz "]"
    comma:	.asciiz ","
    
          
# Purpose: To prompt for a string, allocate the string
# and return the string to the calling subprogram. $a0 - The prompt
# Input: $a1 - The maximum size of the string
#
# Output:$v0 - The address of the user entered string
PromptString:
    addi $sp, $sp, -12  # Push stack
    sw $ra, 0($sp)
    sw $a1, 4($sp)	# Number of word bytes you request
    sw $s0, 8($sp)
    li $v0, 4		# Print the prompt
    syscall
    li $v0, 9		# Allocate memory
    lw $a0, 4($sp)	# The amount requested is allocated
    syscall
    move $s0, $v0	# Read the string
    move $a0, $v0
    li $v0, 8
    lw $a1, 4($sp)	# The amount allocated is the only amount taken in (capped)
    syscall
    move $v0, $a0	# Save string address to return	
    lw $ra, 0($sp)	# Pop stack
    lw $s0, 8($sp)
    addi $sp, $sp, 12
    jr $ra