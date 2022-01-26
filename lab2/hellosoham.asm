.data
    soham:
        .asciiz "hello soham"

.text
.globl main
main:
    li $v0, 4
    la $a0, soham
    syscall
	jr $ra