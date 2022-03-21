.data
    str1 : .asciiz "enter g\n"
    str2 : .asciiz "enter h\n"
    str3 : .asciiz "enter i\n"
    str4 : .asciiz "enter j \n"
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

    jal operation
    
    li $v0,1
    move $a0, $v1
    syscall

    li $v0, 10
    syscall 



# doing the whole operation in one function
operation:
    add $v1, $t1, $t2
    move $t5, $v1
    add $v1, $t3, $t4
    sub $v1, $t5, $v1

    jr $ra