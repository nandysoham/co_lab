
.data
    message : .asciiz "enter a number for factorial"
    message2 : .asciiz "\n the factorial is "
    num : .word 0
    ans : .word 0

.text
    .globl main

    main:
        # read the number
        li $v0, 4
        la $a0, message
        syscall

        # read the number
        li $v0, 5
        syscall

        # move the number to num
        sw $v0, num             


        #call the factorial function    #load the number in a0
        lw $a0, num
        jal findfactorial           # v0 --> will store ans
        sw $v0, ans

        #display the results
        li $v0, 4
        la $a0, message2
        syscall

        li $v0,1
        lw $a0, ans
        syscall

        #end of program
        li $v0, 10
        syscall



.globl findfactorial
findfactorial:
    # subtracting unsigned 8
    subu     $sp, $sp, 8            # decreasing stack by 8 bytes
    sw       $ra,($sp)              # storing this pointer
    sw       $s0, 4($sp)            # storing the value of s0

    # base case
    li $v0 , 1
    beq $a0, 0, factorialdone


    # factorial(n-1)
    move $s0, $a0               # move to $s0 the value of $a0
    sub $a0, $a0, 1
    jal findfactorial

    # note the s0 here if put in the child function where s0 = a0 + 1
    mul $v0, $s0, $v0


    factorialdone:
        lw $ra, ($sp)
        lw $s0, 4($sp)
        addu $sp, $sp, 8
        jr $ra




