; compiled in Linux x86_64
; considered value of n at rax and p at rbx (n ^p)
; this program works only on static data
; 


section .data
    digitSpace resb 100     ; reserving 100 bytes
    ; this is used for storing the digits

    digitSpacePos rest 8    ; 8 bytes enough for 64 bits

section .text
    global _main


_main:  
    mov rax,2
    mov rcx, rax
    mov rbx,4

    call _calcpower
    call _printRAX

    mov rax, 60
    mov rdi, 0
    syscall


; function to calc power rax ^ rbx
_calcpower:
    mul rcx
    sub rbx, 1
    cmp rbx, 1
    jne _calcpower
    ret


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