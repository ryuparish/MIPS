# Program name: Worst_Music_Ever.asm
# Author name: Ryu Parish
# Program: To play a wonderful series of tones
.text
main:
	li $v0, 33	# Loading the output/return value with the synchronous value for MIDI output
	la $a0, 72	# Passing the pitch address-value to the first argument
	la $a1, 1000	# Setting the time of the reed to play for one second (1000 ms)
	la $a2, 65	# Passing the address-value of the Reed to the third argument
	la $a3, 110	# Setting the volume of the tone to play
	syscall
	
	li $v0, 31	# Loading the output/return value with the immediate value for MIDI output
	la $a0, 66	# Passing the pitch address-value to the first argument
	la $a1, 1000	# Setting the time of the reed to play for one second (1000 ms)
	la $a2, 108	# Passing the address-value of the Ethnic to the third argument
	la $a3, 110	# Setting the volume of the tone to play
	syscall
	
	li $v0, 31	# Loading the output/return value with the immediate value for MIDI output
	la $a0, 67	# Passing the pitch address-value to the first argument
	la $a1, 1000	# Setting the time of the reed to play for one second (1000 ms)
	la $a2, 108	# Passing the address-value of the Ethnic to the third argument
	la $a3, 110	# Setting the volume of the tone to play
	syscall
	
	li $v0, 33	# Loading the output/return value with the value for MIDI output
	la $a0, 68	# Passing the pitch address-value to the first argument
	la $a1, 1000	# Setting the time of the reed to play for one second (1000 ms)
	la $a2, 108	# Passing the address-value of the Ethnic to the third argument
	la $a3, 110	# Setting the volume of the tone to play
	syscall
	
	li $v0, 31	# Loading the output/return value with the immediate value for MIDI output
	la $a0, 72	# Passing the pitch address-value to the first argument
	la $a1, 1000	# Setting the time of the reed to play for one second (1000 ms)
	la $a2, 65	# Passing the address-value of the Reed to the third argument
	la $a3, 110	# Setting the volume of the tone to play
	syscall
	
	li $v0, 10	# Loading the return value with the immediate value for interrupt
	syscall
