section .data
chareee dw 0
section .text
global _start
_start:
    mov rax, 0
    mov rdi, 0
    mov rsi, chareee
    syscall
    
    add [chareee], dword 1
    mov [chareee+2], dword 10
    mov rax, 1
    mov rdi, 1
    mov rsi, chareee
    mov rdx, 2
    syscall
    mov rax, 60
    mov rdi, 0
    syscall
