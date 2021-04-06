# Program Name: BinarySearch.asm
# Author:	Ryu Parish
# Program: To use binary search to find a secret number inputted by the usera
# Pseudocode:
# #include <stdio.h>
# 17 #include <stdlib.h>
# 16 #include <string.h>
# 15 #include <math.h>
# 14 
# 13 int main() {
# 12     int max;
# 11     int higher_bound;
# 10     int lower_bound = 0;
#  9     int guess;
#  8     int response;
#  7     
#  6     printf("Please enter the maximum of the guesses: ");
#  5     scanf("%d", &max);
#  4     printf("\n");
#  3     higher_bound = max;
#  2     
#  1     while(response != 2) {
#19          guess = ((abs((higher_bound - lower_bound)/2) + lower_bound));
#  1         printf("Is this your number? : %d\n", guess);
#  2         scanf("%d", &response);
#  3         
#  4         // Too High 
#  5         if(response == 0){ 
#  6             higher_bound = guess;           
#  7             continue;
#  8         }
#  9 
# 10         // Too Low
# 11         else if (response == 1) {
# 12             lower_bound = guess; 
# 13             continue;
# 14         }
# 15     
# 16     }
# 17     printf("I got it right yes! Fuck my ass! \n");
# 18     return 0;
# 19 }   

.text
main:
	# Register Conventions
	# $s0 - Higher bound
	# $s1 - The guess of the machine
	# $s2 - The Lower bound
	
	# Get input from the user and set it as the high bound $s0
	la $a0, prompt	#TODO
	jal PromptInt
	move $s0, $v0
	jal PrintNewLine
	
	# Begin looping for the number
	BeginLoop:
	
	# Choose a random number save it into $s1
	sub $s1, $s0, $s2
	div $s1, $s1, 2
	add $s1, $s1, $s2
	
	# Output the number and ask if it was high, low, or on the spot
	la $a0, where		#TODO
	la $a1, ($s1)
	jal PrintInt
	jal PrintNewLine
	la $a0, which		#TODO (ask for high(1), low(0), correct(2))
	jal PromptInt
	
	# Branch into the conditionals
	# If equal to 2 (correct)
	beq $v0, 2, correct
	  # If equal to 1 (high)
	  beqz $v0, else
	    la $s0, ($s1)
	    b BeginLoop
	  # If equal to 0 (low)
	  else:
	    la $s2, ($s1)
	    b BeginLoop
	correct:
	la $a0, win		#TODO
	jal PrintString
	jal Exit

.data
prompt:		.asciiz "Please give a max of the guesses: "
where:		.asciiz "Here is my guess: " 
which:		.asciiz "Is the guess here high(1), low(0), or correct(2): "
win:		.asciiz "Yes baby! I got it right."
.include "CharlesUtils.asm"
	    
	    
	    
	  
	
	
