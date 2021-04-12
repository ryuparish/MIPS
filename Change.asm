# Program:	Change.asm
# Author:	Ryu Parish
# Program:	To give a cent amoung in their US coin value
#include <stdio.h>
#  1 
#  2 void printout(int q, int d, int n, int p) {
#  3     printf("Here are your coins: %d quarters, %d dimes, %d nickels, %d pennies\n", q,d,n,p);
#  4 }   
#  5 
#  6 int main() {
#  7     int cents = -1, quarters = 0, dimes = 0, nickels = 0, pennies = 0;
#  8     
#  9     while(cents <= 0 || cents >= 100) {
# 10         printf("Please give a number of cents between 0 and 100: ");
# 11         scanf("%d", &cents);
# 12     }   
# 13     
# 14     while(cents - 25 >= 0) {
# 15         quarters++;
# 16         cents = cents - 25;
# 17         if (cents == 0) {
# 18             printout(quarters, 0, 0, 0);
# 19             return 0;
# 20         }   
# 21     }   
# 22     
# 23     while(cents - 10 >= 0) {
# 24         dimes++;
# 25         cents = cents - 10;
# 26         if (cents == 0) {
# 27             printout(quarters, dimes, 0, 0);
# 28             return 0;
# 29         }   
# 30     }    
# 31     
# 32     while(cents - 5 >= 0) {
# 33         nickels++;
# 34         cents = cents - 5;
## 36             printout(quarters, dimes, nickels, 0);
 #37             return 0;
 #38         }   
 #39     }    
 #40     
 #41     while(cents - 1 >= 0) {
# 42         pennies++;
# 43         cents = cents - 1;
# 44         if (cents == 0) {
# 45             printout(quarters, dimes, nickels, pennies);
# 46             return 0;
# 47         }   
# 48     }    
# 49     return 0;
# 50     
# 51 }
.text
main:
	# Read in cents from the user
	la $a0, prompt
	jal PromptInt
	move $s0, $v0
	jal PrintNewLine
	
	# Initialize coins as zero in case there is an early ending
	la $t0, 0
	la $t1, 0
	la $t2, 0
	la $t3, 0
	
	# Placeholder for the remainder
	la $t4, 0
	
	# Check for the condition (n > 0 and n < 100)
	ble $s0, 0, main
	bge $s0, 100, main
	
	# Check for quarters
	Quarters:
	sub $t4, $s0, 25
	bltz $t4, Dimes
	  addi $t0, $t0, 1
	  sub $s0, $s0, 25
	  b Quarters
	
	# Check for dimes
	Dimes:
	sub $t4, $s0, 10
	bltz $t4, Nickels
	  addi $t1, $t1, 1
	  sub $s0, $s0, 10
	  b Dimes
	
	# Check for Nickels
	Nickels:
	sub $t4, $s0, 5
	bltz $t4, Pennies
	  addi $t2, $t2, 1
	  sub $s0, $s0, 5
	  b Nickels
	  
	# Check for Pennies
	Pennies:
	sub $t4, $s0, 1
	bltz $t4, Done
	  addi $t3, $t3, 1
	  sub $s0, $s0, 1
	  b Pennies
	  
	Done:
	la $a0, quarters
	la $a1, ($t0)
	jal PrintInt
	la $a0, dimes
	la $a1, ($t1)
	jal PrintInt
	la $a0, nickels
	la $a1, ($t2)
	jal PrintInt
	la $a0, pennies
	la $a1, ($t3)
	jal PrintInt
	jal Exit
	
.data
prompt:		.asciiz "Please enter a number greater than 0 and less than 100 in cents: "
quarters:	.asciiz "Quarters: "
dimes:		.asciiz ", Dimes: "
nickels:	.asciiz ", Nickels: "
pennies:	.asciiz ", Pennies: "
	
	
.include "CharlesUtils.asm"