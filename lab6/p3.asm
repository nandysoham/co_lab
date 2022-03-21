.data
    str1 : .asciiz "enter a  "
    str2 : .asciiz "enter n  "
    str3 : .asciiz "the answer is"
    a : .word 0
    n : .word 0
    ans : .word 0

.text
    .globl main
main:

    # prompting the user for input
    li $v0,4
    la $a0, str1
    syscall

    li $v0,5
    syscall

    sw $v0, a


    li $v0,4
    la $a0, str2
    syscall

    li $v0,5
    syscall

    sw $v0, n

    # calling the function
    lw $a0, a
    lw $a1, n 
    jal power 
    sw $v0, ans

    #printing ans
    li $v0,1
    lw $a0, ans 
    syscall

    #exit
    li $v0, 10
    syscall


.globl power
power:
    sub $sp, $sp, 8

    sw $ra, 0($sp)
    sw $s0, 4($sp)


    #base condition
    li $v0,1
    beq $a1, 0, exit 


    #recursion
    move $s0, $a0
    sub $a1, $a1, 1
    jal power
    mul $v0,$s0, $v0


    exit:
        lw $ra, ($sp)
        lw $s0, 4($sp)
        add $sp, $sp, 8
        jr $ra

