section .data
table dw 1, 2, 6
section .text
global _start
extern print_registers
_start:
    mov rsi, table
    mov ax, [rsi]
    mov bx, [rsi+2]
    mov [rsi], bx
    mov [rsi+2], ax
    mov ax, [rsi]
    mov bx, [rsi+2]
    call print_registers
    
    mov rax, 60
    mov rdi, 0
    syscall
