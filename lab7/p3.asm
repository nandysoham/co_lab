section .data
    text1 db "equal" , 10
    text2 db "not equal" , 10

section .text
    global _main

_main:
    mov rax, 10
    mov rbx, 20
    cmp rax, rbx
    je equal

    ;  if not equal
    mov rax,1
    mov rdi, 1
    mov rsi, text2       ; label text if used for memory address
    mov rdx, 9
    syscall

    mov rax, 60
    mov rdi, 0
    syscall



    
    
    ; if equal
equal
    mov rax,1
    mov rdi, 1
    mov rsi, text1       ; label text if used for memory address
    mov rdx, 5
    syscall

    mov rax, 60
    mov rdi, 0
    syscall


