# count zero group and one group
.data
    str1: .asciiz "\nenter the number"
    str2: .asciiz "\nthe number of 1 group is "
    str3: .asciiz "\n the number of 0 group is "
    ones: .word 0
    zeros: .word 0

.text
.globl main
main:  
    # prompting for input
    li $v0,4
    la $a0,str1
    syscall

    # moving the number ot s0
    li $v0, 5
    syscall

    move $t7, $v0


    # li $v0,1
    # move $a0, $s0
    # syscall

    li $t0, 1       # a standard for calulating 
    li $t1,1        # counter 
    li $t2,0        # cnt1 
    li $t3,0        # cnt0
    li $t6,0        # storing the prev bit

    addi $t3, $t3,1         # by default increase the count of 0
    and $t6, $t7,$t0    #checks the first bit 

    # if in case the last bit is not 0 --> 
    # decrement 0count by 1 and increment 1count by 1
    beq $t6, $zero, loop
    addi $t3, $t3,-1
    addi $t2, $t2,1 


    loop:
        beq $t1,32,exit
        srl $t4,$t7,$t1     # t4 = t7>>t1
        addi $t1, $t1,1     # t1 = t1 + 1
        and	$t5, $t4, $t0   # t5 = t4 & t0    

        bne $t5,$t6,increase    #if there is a change in the element

        j loop

        increase:
            beq $t5 $zero zeroplus
            addi $t2, $t2, 1        #one++;
            li $t6, 1
            j loop
        
            zeroplus:
                addi $t3,$t3,1
                li $t6,0
                j loop



    exit:
        sw $t2, ones
        sw $t3, zeros 

        li $v0, 4
        la $a0, str2
        syscall

        li $v0,1
        lw $a0, ones
        syscall

        li $v0, 4
        la $a0, str3
        syscall

        li $v0,1
        lw $a0, zeros
        syscall

        li $v0, 10
        syscall
        
        