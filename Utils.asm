# Program Name: Utils.asm
# Author: Ryu Parish
# Program: A few utility subprograms for inclusion in other files

# Subprogram Name: NOR
# Purpose:	To output the NOR of a given input values
# Input:	$a0 - The first input integer
#			$a1 - The second input intger
# Output:	$v0 - The Nor version of the inputs
# Side Effects: None
.text
NOR:
	nor $v0, $a1, $a2
	jr $ra
	
# Subprogram Name: NAND
# Program: To output the NAND of a given input values
# Input:	$a0 - The first input integer
#			$a1 - The second input intger
# Output:	$v0 - The NAND version of the inputs
# Side Effects: None
.text
NAND:
	and $v0, $a1, $a2
	not $v0, $v0
	jr $ra
	
# Subprogram Name: NOT
# Program: To output the NOT of a given input value
# Input:	$a0 - The input integer
# Output:	$v0 - The Not version of the input
# Side Effects: None
.text
NOT:
	not $v0, $a1
	jr $ra
	
# Subprogram Name: Mult4
# Program: To output the integer multiplied by 4
# Input:	$a0 - The input integer
# Output:	$v0 - The integer multiplied by 4
# Side Effects: None
.text
Mult4:
	sll $v0, $a1, 2
	jr $ra
	
# Subprogram Name: Mult10
# Program: To output the integer multiplied by 10
# Input:	$a0 - The input integer
# Output:	$v0 - The integer multiplied by 10
# Side Effects: None
.text
Mult10:
	srl $v0, $a1, 3
	srl $v1, $a1, 1
	add $v0, $v0, $v1
	jr $ra
	
# Subprogram Name: Swap (with xor only)
# Program: To swap the given input positions without using a temporary value to hold the original values
# Input:	$a0 - The first input integer
# 			$a1 - The second input integer
# Output:	None
# Side Effects: $a0 and $a1 will be swapped
.text
Swap:
	xor $t0, $a1, $a2
	xor $a1, $a1, $t0
	xor $a2, $a2, $t0
	jr $ra
	
# Subprogram Name: RightCircularShift
# Program: To rotate the integer value and also show the original integer value in binary
# Input:	$a0 - The input integer
# Output:	$v0 - The rotated right integer value
#			$v1 - The original value
# Side Effects: None
.text
RightCircularShift:
	ror $v0, $a1, 1
	move $v1, $a1
	jr $ra
	
# Subprogram Name: LeftCircularShift
# Program: To rotate the integer value and also show the original integer value in binary
# Input:	$a0 - The input integer
# Output:	$v0 - The rotated left integer value
# 			$v1 - The original integer value
# Side Effects: None
.text
LeftCircularShift:
	rol $v0, $a1, 1
	move $v1, $a1
	jr $ra
	
# Subprogram Name: ToUpper
# Program: To change a lowercase 3-char string into an uppercase one if it is lowercase
# Input:	$a0 - The original string
# Output:	None
# Side Effects: $a0 will contain the uppercase string
.text
ToUpper:
	and $a1, $a1, 0x000000df
	jr $ra
	
# Subprogram Name: ToLower
# Program: To change an uppercase 3 char string into a lowercase one if it is uppercase
# Input:	$a0 - The original string
# Output:	None
# Side Effects: $a0 will contain the lowercase string
.text
ToLower:
	or $a1, $a1, 0x00000020
	jr $ra
