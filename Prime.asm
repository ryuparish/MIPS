# Program Name:	Prime.asm
# Author:	Ryu Parish
# Program:	To find and print the prime numbers of ever number from 3 to n (n is a user entered number)
# Pseudocode
#	int main() {
#		int n;
#		printf("Please enter your input here: ");
#		scanf("%i", &n);
#		printf('\n');
#		for (int i = 2; i <= n/2; i++){
#			if ((i % x) == 0){
#				printf("Your number, %d is not prime, n);
#				break;
#			}
#			elif ((i + 1) == n){
#				printf("Your number, %d is prime", n);
#				break;
#			{
#			else {
#				continue;
#			}
#		}
#	}. 
# You must start the loop with 2 and increment up to n/2.
.text
main:
	# Prompt user for the integer
	la $a0, prompt
	jal PromptInt
	move $s0, $v0
	sge $t0, $s0, 3
	xor $t0, $t0, 0x00000001
	beqz $t0, largeenough
	  la $a0, error
	  jal PrintString
	  jal PrintNewLine
	  b main
	largeenough:
	  jal PrintNewLine
	  # Register Convention: $t0 will be our i (our incrementing variable/register)
	  # and $t1 will be our limit (n/2)
	  la $t0, 2
	  div $t1, $s0, 2
	
	  # Outer Loop
	  BeginLoop:
	    rem $t2, $s0, $t0
	    sgt $t2, $t2, 0
	    xor $t2, $t2, 0x00000001
	    # To check if the remainder ($t1) is equal to one or zero
	    # and branch to continue if there is a remainder
	    beqz $t2, Continue
	      # If there no remainder
	      la $a0, notprime
	      jal PrintString
	      jal PrintNewLine
	      b EndLoop
	    # Continue to the beginning of loop if not limit and to prime if max
	    Continue:
	    bge $t0,$t1, Prime
	      addi $t0, $t0, 1
	      b BeginLoop
	    # Print out that the number is prime
	    Prime:
	    la $a0, primeprint
	    jal PrintString
	  EndLoop:
	  jal Exit
	
.data
prompt:		.asciiz "Please enter a number greater than 3: "
error:		.asciiz "You must enter a number greater than 3"
notprime:	.asciiz "This number is not prime."
primeprint:	.asciiz "This number is prime."
.include "CharlesUtils.asm"