# This program reads in a positive integer using the SPIM system calls. If the integer is not positive, the program should terminate with the message "Invalid Entry"; otherwise the program should print out the names of the digits of the integers, delimited by exactly one space. For example, if the user entered "728" the output would be "Seven Two Eight".
# Equivalent C++ pseudocode
# WARNING - The pseudocode has not been tested

# main ()
# {
#     return 0;
# }

        .data
str:    .asciiz "This is a program that will print out the words for an entered positive integer.\n\n"
str1:   .asciiz "Enter a number (To exit enter '0'): "
        .text
        .globl main

main:   li		$v0, 4		        # System call code to print string 
        la		$a0, str	        # Print str
        syscall

loop:   li		$v0, 4		        # System call code to print string 
        la		$a0, str1	        # Print str1
        syscall
        li		$v0, 5		        # System call code to read integer
        syscall
        beq		$v0, $zero, exit	# If $v0 == zero then exit 
        add		$s6, $s3, $s6		# Add i to array and store in array
        move 	$s2, $v0		    # Move integer to $s2
        add		$s6, $s2, $s6		# Add $s2 to array
        j		loop			    # Jump to loop                                          

exit:   li		$v0, 1		        # System call to print integer 
        move 	$a0, $s6    		# Moved sum to $a0 for system call
        syscall
        li		$v0, 10		        # Exits the program
        syscall