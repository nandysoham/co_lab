.data
    str1 : .asciiz "enter k\n"
    str2 : .asciiz "enter l\n"
    str3 : .asciiz "enter m\n"
    str4 : .asciiz "enter n\n"


.text
.globl main
main:
    # printing str1
    li $v0,4
    la $a0, str1
    syscall

    #taking input
    li $v0, 5
    syscall
    move $t1, $v0       #moving to t1

    # printing str2
    li $v0,4
    la $a0, str2
    syscall

    #taking input
    li $v0, 5
    syscall
    move $t2, $v0

    # printing str3
    li $v0,4
    la $a0, str3
    syscall

    #taking input
    li $v0, 5
    syscall
    move $t3, $v0

    # printing str4
    li $v0,4
    la $a0, str4
    syscall

    #taking input
    li $v0, 5
    syscall
    move $t4, $v0


    jal multifun
    div $v1, $v1, $t4
    add $t1 , $t1, $v1

    li $v0, 1
    move $a0, $t1
    syscall

    li $v0, 10
    syscall


    multifun:
        mul $v1, $t2, $t3
        jr $ra