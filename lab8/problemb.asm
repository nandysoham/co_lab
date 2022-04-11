    global atoi
    
    section .text
    
atoi:
    mov rax, 0              ; intializing to 0
     
convert:
    movzx rsi, byte [rdi]   ; Get the current character
    test rsi, rsi           ; Check for \0
    je done
    
    cmp rsi, 48             ; < 0 is invalid
    jl error
    
    cmp rsi, 57             ; > 9 is invalid
    jg error
     
    sub rsi, 48             ; Convert from ASCII to decimal 
    imul rax, 10            ; Multiply total by 10
    add rax, rsi            ; Add current digit to total
    
    inc rdi                 
    jmp convert

error:
    mov rax, -1             ; Return -1 on error
 
done:
    ret                     ; Return total or error code