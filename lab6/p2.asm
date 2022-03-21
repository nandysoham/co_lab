#fibonacci

.data   
    str1: .asciiz "enter n "
    result: .asciiz "series "
    space: .asciiz  " "
    n: .word 0
    val: .word 0

.text    
    .globl main
main:
    
    # prompting for n from the user
    li $v0,4
    la $a0, str1
    syscall

    #taking n from the user
    li $v0,5
    syscall
    sw $v0,n


    #printing for the result
    li $v0, 4
    la $a0,result
    syscall

    # t2 = n+1
    lw $t2, n
    addi $t2, $t2 , 1


    # t1 = 1
    li $t1, 1

    loop:
        beq $t1, $t2, exit          # while( t1 < t2)

        la $a0, 0($t1)
        li $v0,5


        jal fibonacci       #calling fibonacci


        sw $v0, val         #storing the answer in ram


        #printing it
        li $v0,1
        lw $a0,val
        syscall

        #printing a space
        li $v0,4
        la $a0, space
        syscall

        # t1 = t1 + 1 
        addi $t1, $t1, 1

        j loop

        exit:
            li $v0, 10
            syscall

    .globl fibonacci
    fibonacci:

        bgt $a0, 1 , recurse        # if a0 > 1 recurse
        move $v0, $a0
        jr $ra


        recurse:
            sub $sp, $sp, 12
            sw $ra, 0($sp)      #store return address at the 0th offset
            sw $a0, 4($sp)      # store s0 at the 4th offset

            # fibonacci n-1
            addi $a0, $a0, -1
            jal fibonacci
            sw $v0, 8($sp)


            #fibonacci n-2
            lw $a0, 4($sp)      # restoring the value of a0
            addi $a0, $a0, -2    #a0 -=2
            jal fibonacci


            #back to function 
            lw $t0, 8($sp)
            add $v0, $v0, $t0
            lw $ra,0($sp)

            addi $sp,$sp,12     #increasing stack pointer


            # return call
            jr $ra


    