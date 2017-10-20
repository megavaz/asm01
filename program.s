section .data
    format: db "z = %d", 10, 0  ; data bytes z = %d\n\0
section .text
    global main  ; Export main for linker
    extern printf  ; Request linking with printf in linker
sum:
    ; Preable
    push ebp
    mov ebp, esp

    ; Body
    mov eax, dword [ebp + 8]
    add eax, dword [ebp + 12]

    ; Epilogue
    pop ebp
    ret
main:
    push ebp
    mov ebp, esp

    push ebx
    push esi
    push edi

    push dword 2  ; y
    push dword 1  ; x
    call sum
    add esp, 8

    push eax  ; result of sum
    push format
    call printf
    add esp, 8

    pop edi
    pop esi
    pop ebx

    pop ebp
    ret


