section .data
    digitSpace resb 100     ; reserving 100 bytes
    ; this is used for storing the digits

    digitSpacePos rest 8    ; 8 bytes enough for 64 bits


section .text

global _start

; rax --> a
; rbx --> b
; rcx --> c
; rdx --> d
_start:
        mov rax,3
        mov rbx, 6
        mov rcx, 20
        mov rdx, 10
        add rax, rbx
        sub rcx, rdx
        mul rcx
        call _printRAX

        mov rax, 60
        mov rdi, 0
        syscall


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