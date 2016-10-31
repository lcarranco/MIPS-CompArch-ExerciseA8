# This program reads in a positive integer using the SPIM system calls. If the integer is not positive, the program should terminate with the message "Invalid Entry"; otherwise the program should print out the names of the digits of the integers, delimited by exactly one space. For example, if the user entered "728" the output would be "Seven Two Eight".
# Equivalent C++ pseudocode
# WARNING - The pseudocode has not been tested

# main ()
# {
#     return 0;
# }

.data
        var:            .word 25
        str:            .asciiz "Enter a positive number: "
        str1:           .asciiz "Invalid Entry"
        stringZero:     .asciiz "Zero"
        stringOne:      .asciiz "One"
        stringTwo:      .asciiz "Two"
        stringThree:    .asciiz "Three"
        stringFour:     .asciiz "Four"
        stringFive:     .asciiz "Five"
        stringSix:      .asciiz "Six"
        stringSeven:    .asciiz "Seven"
        stringEight:    .asciiz "Eight"
        stringNine:     .asciiz "Nine"
        stringSpace:    .asciiz " "
        Lten:           .byte 0x0A
.text
        lb		$t0, Lten  

        main:
                li		$v0, 4		        # System call code to print string 
                la		$a0, str	        # Print str
                syscall
                li		$v0, 5		        # System call code to read integer
                syscall
                move 	        $s0, $v0	        # Move integer to s0
                blez            $s0, exit
        
        remainder:
                blez            $s0, exit1:
                div		$s0, $t0		# s0 / t0
                mflo	        $t1			# t1 = floor(s0 / t0) 
                mfhi	        $t2			# t2 = s0 mod t0 
                move 	        $s0, $t1                # Replace s0 with quotient (t1)
                move 	        $s1, $t2	        # Move remainder (t2) to s1
                b		remainder		# Branch to remainder
                
                





                li		$v0, 9                  # Using sbrk
                
                lw		$a0, var
                syscall
                sw		$v0, var

                exit:           
                li		$v0, 4		        # System call code to print string 
                la		$a0, str1	        # Print str1
                syscall
                li		$v0, 10
                syscall

        exit2:
                li		$v0, 10
                syscall
                
                 
                
                