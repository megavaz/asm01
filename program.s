section .data
    format: db "Discriminant = %d", 10, 0  ; data bytes z = %d\n\0
section .text
    global main  ; Export main for linker
    extern printf  ; Request linking with printf in linker
discr:
    ;Preamble
    push ebp
    mov ebp, esp

    ;Body
    mov eax, dword [ebp + 12]
    mul eax
    mov ecx, eax
    mov eax, dword [ebp + 8]
    sal eax, 2
    mul dword[ebp + 16]
    neg eax
    add eax, ecx

    pop ebp
    ret


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
    push dword 4  ; x
    push dword 3
    call discr
    add esp, 8

    push eax  ; result of sum
    push format
    call printf
    add esp, 12

    pop edi
    pop esi
    pop ebx

    pop ebp
    ret


