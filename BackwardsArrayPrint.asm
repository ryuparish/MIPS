# Program Name:	PrintArrayBackwardsFix.asm
# Author:	Ryu Parish
# Program:	To Fix the PrintIntArray to print the array backwards instead (temporary)
.text
main:
	# Loading the address of the array base and the word sized integer for the .data
	### To do this, we need to multiply the array size by the number of bytes, then
	### subract based on the loop rather than count up - Ryu
	la $a0, array_base
	lw $a1, array_size
	jal PrintIntArray
	jal Exit
	
.data
array_size:	.word 8
array_base:	
	.word 2
	.word 4
	.word 1
	.word 5
	.word 3
	.word 6
	.word 7
	.word 8
.include "CharlesUtils.asm"
	