.data
    str1 : .asciiz "enter n "
.text
.globl main
main:
    # prompting for the input of the number
    li $v0, 4
    la $a0, str1
    syscall

    li $v0, 5
    syscall

    move $t0, $v0


    jal factorial

    li $v0, 1
    move $a0, $v1
    syscall

    li $v0, 10
    syscall


    factorial:
        li $v1, 1
        while:
            beq $t0, $zero , exit
            mul $v1, $v1, $t0
            subu $t0, 1

            j while

        exit:
            jr $ra



