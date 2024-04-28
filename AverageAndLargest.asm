# Program Name:	AverageAndLargest
# Author:	Ryu Parish
# Program: To find the largest of four numbers and their average using a subprogram
# that returns (must return) the largest value and does the comparison
# Pseudocode:
# Subprogram largestAndAverage($a1, $a2, $a3, $a4) {
# int var0 = $a0, var1 = $a1, var2 = $a2, var3 = $a3; 
# $s0 = getLarger($a1, $a2);
# $s0 = getLarger($s0, $a3);
# $v0 = getLarger(s0, $a4); // Largest is in $v0
# $v1 = (var0 + var1 + var2 + var3)/ 4; // Average is in $v1
# return; }
#      Subprogram getLarger($a0, $a1) {
#          $v0 = $a0
#          if ($a1 > $a0)
#              $v0 = $a1
# return; }

.text 
main:
	# Pushing the stack
	addi $sp, $sp, -16
	
	# Read in the numbers
	la $a0, prompt
	jal PromptInt
	sw $v0, 16($sp)
	jal PrintNewLine
	
	# Read in the numbers
	la $a0, prompt
	jal PromptInt
	sw $v0, 12($sp)
	jal PrintNewLine
	
	# Read in the numbers
	la $a0, prompt
	jal PromptInt
	sw $v0, 8($sp)
	jal PrintNewLine
	
	# Read in the numbers
	la $a0, prompt
	jal PromptInt
	sw $v0, 4($sp)
	jal PrintNewLine
	
	# Calling the subprogram to calculate the largest number
	lw $a0, 16($sp)
	lw $a1, 12($sp)
	jal LargestNumb
	move $s0, $v0
	la $a0, ($s0)
	lw $a1, 8($sp)
	jal LargestNumb
	move $s0, $v0
	la $a0, ($s0)
	lw $a1, 4($sp)
	jal LargestNumb
	move $s0, $v0
	
	# We now need to load the numbers from the stack, as we cannot use the stack pointers
	# postioning alone)
	lw $t1, 16($sp)
	lw $t2, 12($sp)
	lw $t3, 8($sp)
	lw $t4, 4($sp)
	
	# Then we give back to the stack pointer
	addi $sp, $sp, 16
	
	# We now have the big number saved. Now to calculate the average
	add  $t0, $t1, $t2
	add $t0, $t0, $t3
	add $t0, $t0, $t4
	div $t0, $t0, 4
	move $s1, $t0
	
	# Now to print the average and the largest number and exit
	la $a0, average
	la $a1, ($s1)
	jal PrintInt
	jal PrintNewLine
	la $a0, largest
	la $a1, ($s0)
	jal PrintInt
	jal PrintNewLine
	
	jal Exit
	
# Program Name: 	Largest Numb
# Author:		Ryu Parish
# Program:		To return the largest number of two given numbers
# Input:	$a0 - first number
# 		$a1 - second number
# Output:	$v0 - the larger of the two
# Side Effects:	$v0 will contain the largest of the two numbers
LargestNumb:
	la $v0, ($a0)
	bgt $a0, $a1, return
	  la $v0, ($a1)
	  jr $ra
	return:
	jr $ra
	
.data
prompt:		.asciiz "Please enter number! (4 TIME): "
average:	.asciiz "This THE AVERAGE: "
largest:	.asciiz "Here's the BIG BOY NUMBER: "

.include "CharlesUtils.asm"
