# Program Name:		Median.asm
# Author:		Ryu Parish
# Program: To return and print out the median of 3 inputted numbers through a subprogram call
.text
main:
	# Read in three numbers
	la $a0, prompt
	jal PromptInt
	move $s0, $v0
	jal PrintNewLine
	la $a0, prompt
	jal PromptInt
	move $s1, $v0
	jal PrintNewLine
	la $a0, prompt
	jal PromptInt
	move $s2, $v0
	jal PrintNewLine
	
	# Call the subprogram to return to the median
	jal MedianBoy
	move $s0, $v0
	
	# Print out the median value returned
	la $a0, present
	la $a1, ($s0)
	jal PrintInt
	jal PrintNewLine
	jal Exit
	
MedianBoy:
	la $v0, ($s1)
	jr $ra
	
.data
prompt:		.asciiz "Please enter three numbers to find the median: "
present:	.asciiz "Here is the median: "

.include "CharlesUtils.asm"
