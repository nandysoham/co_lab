section .data
    digitSpace resb 100     ; reserving 100 bytes
    ; this is used for storing the digits

    digitSpacePos rest 8    ; 8 bytes enough for 64 bits


section .text

global _start


_start:
        mov rax,3
        mov rbx, 6
        mov rcx, 10

_maximum:
        cmp rax, rbx
        jge skip1
        cmp rbx, rcx
        jge skip2
        mov rax, rcx
        jmp _printRAX

skip1:
    cmp rax, rcx
    jge _printRAX
    mov rax, rcx
    jmp _printRAX

skip2:
    mov rax, rbx
    jmp _printRAX



; printing the value of rax
_printRAX:
    mov rcx, digitSpace         ; breaks the digit backword
    mov rbx, 10     ; newline
    mov [rcx], rbx      ; move value of rbx into rcx
    inc rcx
    mov [digitSpacePos], rcx        


; storing each digit of the number is reverse form
_printRAXloop:
    mov rdx, 0
    mov rbx, 10
    div rbx         ; 12310 = 12 --> this will be the new value of rax
    push rax
    add rdx, 48 ; the remainder is added with 48

    mov rcx, [digitSpacePos]
    mov [rcx], dl
    inc rcx
    mov [digitSpacePos], rcx

    pop rax
    cmp rax, 0
    jne _printRAXloop


; reversing each digit of the number
_printRAXLoop2:
    mov rcx , [digitSpacePos]
    
    mov rax, 1
    mov rdi , 1
    mov rsi, rcx
    mov rdx , 1
    syscall

    mov rcx, [digitSpacePos]
    dec rcx
    mov [digitSpacePos], rcx

    cmp rcx, digitSpace
    jge _printRAXLoop2
    ret