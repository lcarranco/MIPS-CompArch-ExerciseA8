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
        Lone:           .byte 0x01
        Ltwo:           .byte 0x02
        Lthree:         .byte 0x03
        Lfour:          .byte 0x04
        Lfive:          .byte 0x05
        Lsix:           .byte 0x06
        Lseven:         .byte 0x07
        Leight:         .byte 0x08
        Lnine:          .byte 0x09
        Lten:           .byte 0x0A
.text
        lb		$t0, Lone
        lb		$t1, Ltwo
        lb		$t2, Lthree
        lb		$t3, Lfour
        lb		$t4, Lfive
        lb		$t5, Lsix
        lb		$t6, Lseven
        lb		$t7, Leight
        lb		$t8, Lnine
        lb		$t9, Lten  

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
                div		$s0, $t9		# s0 / 10
                mflo	        $s0			# t1 = floor(s0 / 10) 
                mfhi	        $s1			# t2 = s0 mod 10 
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
                
                 
                
                