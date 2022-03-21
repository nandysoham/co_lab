.data 
    str1: .asciiz "Enter the first number: "
    str2: .asciiz "Enter the second number: "
    str3: .asciiz "The larger integer is: "

.text 
.globl main
main:

    li $v0, 4 #prompt for first input
    la $a0, str1
    syscall

    li $v0, 5 #read the first input
    syscall
    move $t0, $v0

    li $v0, 4 #prompt for the next input
    la $a0, str2
    syscall

    li $v0, 5 #read the second input
    syscall
    move $t1, $v0



    slt $s0, $t0, $t1  # s0 --> 1 if t0 is larger
    bne $s0, $zero, else_case  #else_case if $t0 is larger
    move $t1, $t0  #if $t1 is larger

else_case:
    li $v0, 4 #print a string str3
    la $a0, str3 
    syscall

    li $v0, 1 #print the larger number
    move $a0, $t1
    syscall

# termination condition
li $v0,10
syscall