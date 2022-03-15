section .text
global swap
swap:
    mov eax, edi
    mov edi, esi
    mov esi, eax
    ret
