# Program Name:	Sieve.asm
# Author:	Ryu Parish
# Program:	To find and print the prime numbers of ever number from 3 to n (n is a user entered number)
# Pseudocode
#	int main() {
#		int n;
#		printf("Please enter your input here: ");
#		scanf("%i", &n);
#		printf('\n');
#		for (int i = 3; i <= n; i++){
#			for (int x = 2; x < i/2; x++){
#				if ((i % x) == 0){
#					break;
#				}
#				elif ((x + 1) == n){
#					printf("%d", n);
#				{
#				else {
#					continue;
#				}
#			}
#		}
#	}
# You must start the outer loop with 3 and increment up to n. 
# You must start the inner loopp with 2 and increment up to n/2.
.text
main:
	# Prompt user for the integer
	la $a0, prompt
	jal PromptInt
	move $s0, $v0
	sge $t0, $s0, 3
	beqz $t0, main
	  # Register Convention: $t0 will be outer i (our incrementing variable/register)
	  # and $t1 will be our inner i (our incrementing variable/register)
	  la $t0, 3
	
	  # Outer Loop
	  BeginOuterLoop:
	  # Inner increment i ($t1)
	  la $t1, 2
	  
	  # Creating the variable ($t2) that will act as the inner limit
	  div $t2, $t0, 2
	  beq $t0, $s0, EndOuterLoop
	    # Inner Loop
	    BeginInnerLoop:
	      rem $t3, $t0, $t1
	      # To check if the remainder ($t3) is equal to one or zero
	      # and branch to the end of the InnerLoop if the remainder is 0
	      	beqz $t3, EndInnerLoop
	      	  # If adding one to the inner increment will equal the inner limit
	      	  # $t4 is the temporary variable used to check if the inner increment
	      	  # is one below the limit (prime)
	      	  addi $t4, $t1, 1
	      	  bge $t4, $t2, prime
	      	    addi $t1, $t1, 1
	      	    b BeginInnerLoop
	      	  prime:
	      	  # Printing out the number with a comma since it's prime
	      	  addi $v0, $zero, 1
	      	  la $a0, ($t0)
	      	  syscall
	      	  la $a0, comma
	      	  jal PrintString
	    EndInnerLoop:
	    # Incrementing the outer loop i
	    addi $t0, $t0, 1
	    b BeginOuterLoop
	  EndOuterLoop:
	jal Exit
	
.data
prompt:		.asciiz "Please enter a number greater than 3: "
comma:		.asciiz ", "
.include "CharlesUtils.asm"