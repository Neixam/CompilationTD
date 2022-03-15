section .text
global carre
carre:
    mov eax, edi
    imul eax, eax
    ret
