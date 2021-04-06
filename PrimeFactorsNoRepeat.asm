# Program Name: PrimeFactorsNoRepeat.asm
# Author:	Ryu Parish
# Program:	Find all prime factors of a given number with no duplicates
# PseudoCode
#include <iostream>
#include <cstdlib>
#include <vector>
#include <algorithm>
# int main() {
# 14     int factee;
# 12     std::cout << "Give me a number and I shall give you its prime factors: ";
# 11     std::cin >> factee;
# 10     int orig = factee;
#  9     
#  8     /* Checking for any factors of two if it is an even number */
#  7     while (factee % 2 == 0) {
#  6         factee /= 2; 
#  5         std::cout << 2 << " is a factor of " << orig << "\n";
#  4     }
#  3 
#  2     /* Checking for any odd factors greater than 3. There would be no duplicates since a duplicate such as the number 3 (3 ,3) would be a multiple of 2. */
#  1     for (int i = 3; i <= factee/2; i = i + 2) {
#21          if(factee % i == 0){
#  1             std::cout << i << " is a factor of " << orig << "\n";
#  2             factee /= i;
#  3         }
#  4     }
#  5     
#  6     if (factee > 2) {
#  7         std::cout << factee << " is a factor of " << orig << "\n";
#  8     }
#  9 }

.text
main:
	# Prompt user for integer
	addi $v0, $zero, 4
	la $a0, prompt
	jal PromptInt
	move $s0, $v0
	jal PrintNewLine
	
	# First, check if the number is divisible by two and keep dividing by two until it is odd
	# $t0 - To keep the remainder, $t1 - To only print out two one time
	Uneven:
	rem $t0, $s0, 2
	bgtz $t0, NotEven
	  bgtz $t1, Twospent
	    la $a0, 2
	    addi $v0, $zero, 1
	    syscall
	    la $a0, comma
	    jal PrintString
	    addi $t1, $zero, 1
	  Twospent:
	  div $s0, $s0, 2
	  b Uneven
	
	NotEven:
	# Making a variable that is the stopping point of the loop ($s0 / 2)
	la $t0, 3
	
	# Dividing the uneven given integer by 2 to set the limit, then checking if the loop should begin
	div $t1, $s0, 2
	
	OddLoop:
	# If the number does not meet the continuation conditional of the sentinel control loop
	# $t0 - to keep the odd number incrementer, $t1 - to keep the limit, $t2 - remainder of the division of the main number
	# and the increment.
	bge $t0, $t1, Prime
	  rem $t2, $s0, $t0
	  # If the number does not equally divide into the given number
	  bnez $t2, EndOddLoop
	    la $a0, ($t0)
	    addi $v0, $zero, 1
	    syscall
	    la $a0, comma
	    jal PrintString
	    div $s0, $s0, $t0
	    TripleLoop:
	    rem $t2, $s0, $t0
	    bnez $t2, EndOddLoop
	      div $s0, $s0, $t0
	      b TripleLoop
	  EndOddLoop:
	  addi $t0, $t0, 2
	  b OddLoop
	Prime:
	blt $s0, 2, Done
	  la $a0, ($s0)
	  addi $v0, $zero, 1
	  syscall
	  la $a0, comma
	  jal PrintString
	  jal PrintNewLine
	Done:
	jal Exit
	
.data
prompt:		.asciiz "Please enter a number here to find its prime factors: "		
comma:		.asciiz ", "

.include "CharlesUtils.asm"

	  