# count 0s and 1s in binary
.data
    str1: .asciiz "\nenter the number"
    str2: .asciiz "\nthe number of 1s is "
    str3: .asciiz "\n the number of 0s is "
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
    li $t1,0        # counter 
    li $t2,0        # cnt1 
    li $t3,0        # cnt0
    loop:
        beq $t1,32,exit
        srl $t4,$t7,$t1     # t4 = t7>>t1
        addi $t1, $t1,1     # t1 = t1 + 1
        and	$t5, $t4, $t0   # t5 = t4 & t0    

        beq $t5,$zero,inczero
        addi $t2, $t2, 1        #one++


        # #printing
        # li $v0,1
        # move $a0,$t1
        # syscall

        j loop

        inczero:
            addi $t3, $t3, 1    #zero++
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
        
        